# Copyright (c) 2011-2023 Columbia University, System Level Design Group
# SPDX-License-Identifier: Apache-2.0
# --- Input clock and reset are generated by the ZYNQ MP SoC processing system (no constraints here)


# Recover ESP main clock name
set refclk_elab [get_clocks -of_objects [get_nets -hierarchical chip_refclk]]

# --- False paths
set_false_path -to [get_ports {led[*]}]

# --- UART
set_property PACKAGE_PIN AL17     [get_ports "uart_txd"]
set_property PACKAGE_PIN AH17     [get_ports "uart_rxd"]
set_property PACKAGE_PIN AP17     [get_ports "uart_rtsn"]
set_property PACKAGE_PIN AM15     [get_ports "uart_ctsn"]

set_property IOSTANDARD  LVCMOS12 [get_ports uart_*]

# Inputs
set_input_delay -clock [get_clocks ${refclk_elab}] -max 1.500 [get_ports uart_rxd]
set_input_delay -clock [get_clocks ${refclk_elab}] -min -add_delay 0.500 [get_ports uart_rxd]
set_input_delay -clock [get_clocks ${refclk_elab}] -max 1.500 [get_ports uart_ctsn]
set_input_delay -clock [get_clocks ${refclk_elab}] -min -add_delay 0.500 [get_ports uart_ctsn]

# Outputs
set_output_delay -clock [get_clocks ${refclk_elab}] -max 0.500 [get_ports uart_txd]
set_output_delay -clock [get_clocks ${refclk_elab}] -min -add_delay -0.500 [get_ports uart_txd]
set_output_delay -clock [get_clocks ${refclk_elab}] -max 0.500 [get_ports uart_rtsn]
set_output_delay -clock [get_clocks ${refclk_elab}] -min -add_delay -0.500 [get_ports uart_rtsn]


# --- LEDs
set_property PACKAGE_PIN AL11  [get_ports "led[0]"]
set_property PACKAGE_PIN AL13  [get_ports "led[1]"]
set_property PACKAGE_PIN AK13  [get_ports "led[2]"]
set_property PACKAGE_PIN AE15  [get_ports "led[3]"]
set_property PACKAGE_PIN AM8  [get_ports "led[4]"]
set_property PACKAGE_PIN AM9  [get_ports "led[5]"]
set_property PACKAGE_PIN AM10  [get_ports "led[6]"]
#set_property PACKAGE_PIN AM11  [get_ports "led[7]"]

set_property IOSTANDARD  LVCMOS12 [get_ports "led*"]


# --- Switches
set_property PACKAGE_PIN A17     [get_ports "switch[0]"]
set_property PACKAGE_PIN A16     [get_ports "switch[1]"]
set_property PACKAGE_PIN B16     [get_ports "switch[2]"]
set_property PACKAGE_PIN B15     [get_ports "switch[3]"]
set_property PACKAGE_PIN A15     [get_ports "switch[4]"]
set_property PACKAGE_PIN A14     [get_ports "switch[5]"]
set_property PACKAGE_PIN B14     [get_ports "switch[6]"]
set_property PACKAGE_PIN B13     [get_ports "switch[7]"]

set_property IOSTANDARD  LVCMOS18 [get_ports "switch*"]
