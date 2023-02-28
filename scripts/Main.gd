extends Node

# GUI
onready var gui := {
	"the_button": $"%TheButton" as Button,
	"v_income": $"%V_Income" as Label,
	"frame_timer": $"%FrameTimer" as Timer,
}

# Data Structures
var the_income = {
	"base": 1.0,
	"expo": 1,
}

var the_modifiers = {
	"base": [1],
	"expo": [1]
}

var the_maxes = {
	"int": 9223372036854775807,
	"float": 1.79769e308,
}

# Overrides
func _ready() -> void:
	update_labels()

# Helpers
func update_labels() -> void:
	gui.v_income.text = "%.1fE%d" % [the_income.base, the_income.expo]

func reduce_base(value: float) -> float:
	var new_value = value
	if value > 1.0:
		var value_to_string = str(value).replace(".", "")
		new_value = float("0.%s" % value_to_string)
	return new_value

# Events
func _on_TheButton_press() -> void:
	the_income.base += gui.the_button.the_value
	update_labels()

func _on_FrameTimer_timeout() -> void:
	the_income.base += 0.1
	update_labels()
