 #
 # Copyright (c) 2016, Sequitur Labs Inc. All rights reserved.
 #
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
 # Redistributions of source code must retain the above copyright notice, this
 # list of conditions and the following disclaimer.
 #
 # Redistributions in binary form must reproduce the above copyright notice,
 # this list of conditions and the following disclaimer in the documentation
 # and/or other materials provided with the distribution.
 #
 # Neither the name of ARM nor the names of its contributors may be used
 # to endorse or promote products derived from this software without specific
 # prior written permission.
 #
 # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 # AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 # ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 # LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 # CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 # SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 # INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 # CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 # ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 # POSSIBILITY OF SUCH DAMAGE.
 #


# On rpi3, TEE lands in high-RAM, above Linux
#
PLAT_TSP_LOCATION	:=	tdram

PLAT_TSP_LOCATION_ID := PLAT_TRUSTED_DRAM_ID

# Process flags
$(eval $(call add_define,PLAT_TSP_LOCATION_ID))


PLAT_INCLUDES		:=	-Iplat/rpi3/include/

PLAT_BL_COMMON_SOURCES	:=	lib/aarch64/xlat_tables.c		\
				plat/common/aarch64/plat_common.c	\
				plat/rpi3/console.c			\
				plat/rpi3/aarch64/rpi3_common.c	\
				plat/rpi3/aarch64/plat_helpers.S

BL31_SOURCES		+=	lib/cpus/aarch64/cortex_a53.S		\
				plat/common/aarch64/platform_mp_stack.S	\
				plat/rpi3/bl31_plat_setup.c		\
				plat/rpi3/plat_pm.c			\
				plat/rpi3/plat_topology.c
