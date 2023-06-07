Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE5F7263EB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544852.850922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut2-00054B-3U; Wed, 07 Jun 2023 15:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544852.850922; Wed, 07 Jun 2023 15:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut1-0004zi-Ub; Wed, 07 Jun 2023 15:15:47 +0000
Received: by outflank-mailman (input) for mailman id 544852;
 Wed, 07 Jun 2023 15:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/iFR=B3=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q6ukN-0003xK-6A
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:06:51 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebdca35c-0544-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 17:06:47 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 24D543F080;
 Wed,  7 Jun 2023 08:06:45 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ebdca35c-0544-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686150406; bh=MqSTVgN8W4JFO8/qevC0vl0BG1dZ8uNRDCoKmByWs9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=btyrT/pk+Te4i55ISjLi8KGE7q7G3/DuAkl6W4i8R1fYCiQuPkTd104AHSpwvTKUd
	 5EZKxXr2IDKvwcEAz54Zhp4yizEGYgGe41bLCuHKyhPtjjqKxIYlbRTaKWguTNo2nL
	 4W79k3RuJxn9yHAeqwSNAvn377iDFlCxIXOS223cBWcVoa7ap3ZMgfek0fmcDg8dKn
	 YMGx7dsrRDWMj863F3gVtYdrHNpmuQa6WLlbeua7FIJ7hBPn8N7RIMEc3bOF95oEXT
	 4aBBOylKhflADtS4FLVDNuUQ1k0VFPtSwiRReuG4W9Krc29gSQ+u4Qu7LC+/Q6hWj4
	 idFRuM1g1DvTA==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <shawnanastasio@raptorengineering.com>
Subject: [PATCH 1/3] xen: Add files needed for minimal Power build
Date: Wed,  7 Jun 2023 10:06:32 -0500
Message-Id: <e2e1435f5d0fadaa00dfff6c04af29165439db5d.1686148363.git.shawn@anastas.io>
In-Reply-To: <cover.1686148363.git.shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the build system changes required to build for ppc64le (POWER8+).
Following in the footsteps of the initial riscv port, only building
the head.o target, which boots to an infinite loop, is supported:

$ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
$ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen TARGET=ppc64/head.o

This port targets POWER8+ CPUs running in Little Endian mode specifically,
and does not boot on older machines. Additionally, this initial skeleton
only implements the PaPR/pseries boot protocol which allows it to be
booted in a standard QEMU virtual machine:

$ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel ppc64/head.o

Where possible, this patch uses header definitions and support routines
from the original Xen PowerPC port present in Xen 3.2.3. Though we are
targeting a much newer ISA than that original port did, some of the
definitions have remained similar enough for reuse.

Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>
---
 config/ppc64.mk                          |   5 +
 xen/Makefile                             |   5 +-
 xen/arch/ppc/Kconfig                     |  42 +++++
 xen/arch/ppc/Kconfig.debug               |   0
 xen/arch/ppc/Makefile                    |  17 ++
 xen/arch/ppc/Rules.mk                    |   0
 xen/arch/ppc/arch.mk                     |  11 ++
 xen/arch/ppc/configs/openpower_defconfig |  13 ++
 xen/arch/ppc/include/asm/config.h        |  63 +++++++
 xen/arch/ppc/include/asm/msr.h           |  67 +++++++
 xen/arch/ppc/include/asm/page-bits.h     |   7 +
 xen/arch/ppc/include/asm/processor.h     | 173 ++++++++++++++++++
 xen/arch/ppc/include/asm/reg_defs.h      | 218 +++++++++++++++++++++++
 xen/arch/ppc/ppc64/Makefile              |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c         |   0
 xen/arch/ppc/ppc64/head.S                |  67 +++++++
 xen/arch/ppc/setup.c                     |  14 ++
 xen/arch/ppc/xen.lds.S                   | 173 ++++++++++++++++++
 18 files changed, 874 insertions(+), 2 deletions(-)
 create mode 100644 config/ppc64.mk
 create mode 100644 xen/arch/ppc/Kconfig
 create mode 100644 xen/arch/ppc/Kconfig.debug
 create mode 100644 xen/arch/ppc/Makefile
 create mode 100644 xen/arch/ppc/Rules.mk
 create mode 100644 xen/arch/ppc/arch.mk
 create mode 100644 xen/arch/ppc/configs/openpower_defconfig
 create mode 100644 xen/arch/ppc/include/asm/config.h
 create mode 100644 xen/arch/ppc/include/asm/msr.h
 create mode 100644 xen/arch/ppc/include/asm/page-bits.h
 create mode 100644 xen/arch/ppc/include/asm/processor.h
 create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
 create mode 100644 xen/arch/ppc/ppc64/Makefile
 create mode 100644 xen/arch/ppc/ppc64/asm-offsets.c
 create mode 100644 xen/arch/ppc/ppc64/head.S
 create mode 100644 xen/arch/ppc/setup.c
 create mode 100644 xen/arch/ppc/xen.lds.S

diff --git a/config/ppc64.mk b/config/ppc64.mk
new file mode 100644
index 0000000000..a46de35cf1
--- /dev/null
+++ b/config/ppc64.mk
@@ -0,0 +1,5 @@
+CONFIG_PPC64 := y
+CONFIG_PPC64_64 := y
+CONFIG_PPC64_$(XEN_OS) := y
+
+CONFIG_XEN_INSTALL_SUFFIX :=
diff --git a/xen/Makefile b/xen/Makefile
index e89fc461fc..db5454fb58 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -38,7 +38,7 @@ EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 ARCH=$(XEN_TARGET_ARCH)
 SRCARCH=$(shell echo $(ARCH) | \
           sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-              -e s'/riscv.*/riscv/g')
+              -e s'/riscv.*/riscv/g' -e s'/ppc.*/ppc/g')
 export ARCH SRCARCH
 
 # Allow someone to change their config file
@@ -244,7 +244,7 @@ include $(XEN_ROOT)/Config.mk
 export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
                             sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-                                -e s'/riscv.*/riscv/g')
+                                -e s'/riscv.*/riscv/g' -e s'/ppc.*/ppc/g')
 
 export CONFIG_SHELL := $(SHELL)
 export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
@@ -563,6 +563,7 @@ _clean:
 	$(Q)$(MAKE) $(clean)=xsm
 	$(Q)$(MAKE) $(clean)=crypto
 	$(Q)$(MAKE) $(clean)=arch/arm
+	$(Q)$(MAKE) $(clean)=arch/ppc
 	$(Q)$(MAKE) $(clean)=arch/riscv
 	$(Q)$(MAKE) $(clean)=arch/x86
 	$(Q)$(MAKE) $(clean)=test
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
new file mode 100644
index 0000000000..e80a5fb036
--- /dev/null
+++ b/xen/arch/ppc/Kconfig
@@ -0,0 +1,42 @@
+config PPC
+	def_bool y
+
+config PPC64
+	def_bool y
+	select 64BIT
+
+config ARCH_DEFCONFIG
+	string
+	default "arch/ppc/configs/openpower_defconfig"
+
+menu "Architecture Features"
+
+source "arch/Kconfig"
+
+endmenu
+
+menu "ISA Selection"
+
+choice
+	prompt "Base ISA"
+	default POWER_ISA_2_07B if PPC64
+	help
+	  This selects the base ISA version that Xen will target.
+
+config POWER_ISA_2_07B
+	bool "POWER ISA 2.07B+"
+	help
+	  Target version 2.07B+ of the POWER ISA (POWER8+)
+
+config POWER_ISA_3_00
+	bool "POWER ISA 3.00+"
+	help
+	  Target version 3.00+ of the POWER ISA (POWER9+)
+
+endchoice
+
+endmenu
+
+source "common/Kconfig"
+
+source "drivers/Kconfig"
diff --git a/xen/arch/ppc/Kconfig.debug b/xen/arch/ppc/Kconfig.debug
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
new file mode 100644
index 0000000000..b3ad837d4b
--- /dev/null
+++ b/xen/arch/ppc/Makefile
@@ -0,0 +1,17 @@
+obj-$(CONFIG_PPC64) += ppc64/
+obj-y += setup.o
+
+$(TARGET): $(TARGET)-syms
+	cp -f $< $@
+
+$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
+	$(NM) -pa --format=sysv $(@D)/$(@F) \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		>$(@D)/$(@F).map
+
+$(obj)/xen.lds: $(src)/xen.lds.S FORCE
+	$(call if_changed_dep,cpp_lds_S)
+
+.PHONY: include
+include:
diff --git a/xen/arch/ppc/Rules.mk b/xen/arch/ppc/Rules.mk
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
new file mode 100644
index 0000000000..c185a5028a
--- /dev/null
+++ b/xen/arch/ppc/arch.mk
@@ -0,0 +1,11 @@
+########################################
+# Power-specific definitions
+
+ppc-march-$(CONFIG_POWER_ISA_2_07B) := power8
+ppc-march-$(CONFIG_POWER_ISA_3_00) := power9
+
+CFLAGS += -mcpu=$(ppc-march-y) -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx
+
+# TODO: Drop override when more of the build is working
+override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
+override ALL_LIBS-y =
diff --git a/xen/arch/ppc/configs/openpower_defconfig b/xen/arch/ppc/configs/openpower_defconfig
new file mode 100644
index 0000000000..8783eb3488
--- /dev/null
+++ b/xen/arch/ppc/configs/openpower_defconfig
@@ -0,0 +1,13 @@
+# CONFIG_SCHED_CREDIT is not set
+# CONFIG_SCHED_RTDS is not set
+# CONFIG_SCHED_NULL is not set
+# CONFIG_SCHED_ARINC653 is not set
+# CONFIG_TRACEBUFFER is not set
+# CONFIG_HYPFS is not set
+# CONFIG_GRANT_TABLE is not set
+# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+
+CONFIG_PPC64=y
+CONFIG_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_EXPERT=y
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
new file mode 100644
index 0000000000..7a2862ef7a
--- /dev/null
+++ b/xen/arch/ppc/include/asm/config.h
@@ -0,0 +1,63 @@
+#ifndef __PPC_CONFIG_H__
+#define __PPC_CONFIG_H__
+
+#include <xen/const.h>
+#include <xen/page-size.h>
+
+#if defined(CONFIG_PPC64)
+#define LONG_BYTEORDER 3
+#define ELFSIZE        64
+#define MAX_VIRT_CPUS  1024u
+#else
+#error "Unsupported PowerPC variant"
+#endif
+
+#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
+#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
+#define POINTER_ALIGN  BYTES_PER_LONG
+
+#define BITS_PER_LLONG 64
+
+/* xen_ulong_t is always 64 bits */
+#define BITS_PER_XEN_ULONG 64
+
+#define CONFIG_PPC_L1_CACHE_SHIFT  7
+#define CONFIG_PAGEALLOC_MAX_ORDER 18
+#define CONFIG_DOMU_MAX_ORDER      9
+#define CONFIG_HWDOM_MAX_ORDER     10
+
+#define OPT_CONSOLE_STR "dtuart"
+#define INVALID_VCPU_ID MAX_VIRT_CPUS
+
+/* Linkage for PPC */
+#ifdef __ASSEMBLY__
+#define ALIGN .align 2
+
+#define ENTRY(name)                                                            \
+    .globl name;                                                               \
+    ALIGN;                                                                     \
+    name:
+#endif
+
+#define XEN_VIRT_START _AT(UL, 0x400000)
+
+#define SMP_CACHE_BYTES (1 << 6)
+
+#define STACK_ORDER 2
+#define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
+
+/* 288 bytes below the stack pointer must be preserved by interrupt handlers */
+#define STACK_VOLATILE_AREA 288
+
+/* size of minimum stack frame; C code can write into the caller's stack */
+#define STACK_FRAME_OVERHEAD 32
+
+#endif /* __PPC_CONFIG_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/ppc/include/asm/msr.h b/xen/arch/ppc/include/asm/msr.h
new file mode 100644
index 0000000000..7ef0b5e3ad
--- /dev/null
+++ b/xen/arch/ppc/include/asm/msr.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ *
+ * Copyright (C) IBM Corp. 2005
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ */
+
+#ifndef _POWERPC_MSR_H
+#define _POWERPC_MSR_H
+
+#ifdef __ASSEMBLY__
+#define ULL(x) x
+#else
+#define ULL(x) x ## ULL
+#endif
+
+/* Flags in MSR: */
+#define MSR_SF      ULL(0x8000000000000000)
+#define MSR_TA      ULL(0x4000000000000000)
+#define MSR_ISF     ULL(0x2000000000000000)
+#define MSR_HV      ULL(0x1000000000000000)
+#define MSR_VMX     ULL(0x0000000002000000)
+#define MSR_MER     ULL(0x0000000000200000)
+#define MSR_POW     ULL(0x0000000000040000)
+#define MSR_ILE     ULL(0x0000000000010000)
+#define MSR_EE      ULL(0x0000000000008000)
+#define MSR_PR      ULL(0x0000000000004000)
+#define MSR_FP      ULL(0x0000000000002000)
+#define MSR_ME      ULL(0x0000000000001000)
+#define MSR_FE0     ULL(0x0000000000000800)
+#define MSR_SE      ULL(0x0000000000000400)
+#define MSR_BE      ULL(0x0000000000000200)
+#define MSR_FE1     ULL(0x0000000000000100)
+#define MSR_IP      ULL(0x0000000000000040)
+#define MSR_IR      ULL(0x0000000000000020)
+#define MSR_DR      ULL(0x0000000000000010)
+#define MSR_PMM     ULL(0x0000000000000004)
+#define MSR_RI      ULL(0x0000000000000002)
+#define MSR_LE      ULL(0x0000000000000001)
+
+/* MSR bits set on the systemsim simulator */
+#define MSR_SIM       ULL(0x0000000020000000)
+#define MSR_SYSTEMSIM ULL(0x0000000010000000)
+
+/* On a trap, srr1's copy of msr defines some bits as follows: */
+#define MSR_TRAP_FE     ULL(0x0000000000100000) /* Floating Point Exception */
+#define MSR_TRAP_IOP    ULL(0x0000000000080000) /* Illegal Instruction */
+#define MSR_TRAP_PRIV   ULL(0x0000000000040000) /* Privileged Instruction */
+#define MSR_TRAP        ULL(0x0000000000020000) /* Trap Instruction */
+#define MSR_TRAP_NEXT   ULL(0x0000000000010000) /* PC is next instruction */
+#define MSR_TRAP_BITS  (MSR_TRAP_FE|MSR_TRAP_IOP|MSR_TRAP_PRIV|MSR_TRAP)
+
+#endif /* _POWERPC_MSR_H */
diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
new file mode 100644
index 0000000000..4c01bf9716
--- /dev/null
+++ b/xen/arch/ppc/include/asm/page-bits.h
@@ -0,0 +1,7 @@
+#ifndef __PPC_PAGE_BITS_H__
+#define __PPC_PAGE_BITS_H__
+
+#define PAGE_SHIFT              16 /* 64 KiB Pages */
+#define PADDR_BITS              48
+
+#endif /* __PPC_PAGE_BITS_H__ */
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
new file mode 100644
index 0000000000..0ab7bfc9df
--- /dev/null
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ *
+ * Copyright IBM Corp. 2005, 2006, 2007
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Hollis Blanchard <hollisb@us.ibm.com>
+ *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ *          Timothy Pearson <tpearson@raptorengineering.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#ifndef _ASM_PROCESSOR_H_
+#define _ASM_PROCESSOR_H_
+
+#include <xen/config.h>
+#include <asm/reg_defs.h>
+#include <asm/msr.h>
+
+#define IOBMP_BYTES          8192
+#define IOBMP_INVALID_OFFSET 0x8000
+
+/* most assembler do not know this instruction */
+#define HRFID .long 0x4c000224
+
+/* Processor Version Register (PVR) field extraction */
+
+#define PVR_VER(pvr) (((pvr) >> 16) & 0xFFFF) /* Version field */
+#define PVR_REV(pvr) (((pvr) >> 0) & 0xFFFF)  /* Revison field */
+
+#define __is_processor(pv) (PVR_VER(mfspr(SPRN_PVR)) == (pv))
+
+/*
+ * IBM has further subdivided the standard PowerPC 16-bit version and
+ * revision subfields of the PVR for the PowerPC 403s into the following:
+ */
+
+#define PVR_FAM(pvr)  (((pvr) >> 20) & 0xFFF) /* Family field */
+#define PVR_MEM(pvr)  (((pvr) >> 16) & 0xF)   /* Member field */
+#define PVR_CORE(pvr) (((pvr) >> 12) & 0xF)   /* Core field */
+#define PVR_CFG(pvr)  (((pvr) >> 8) & 0xF)    /* Configuration field */
+#define PVR_MAJ(pvr)  (((pvr) >> 4) & 0xF)    /* Major revision field */
+#define PVR_MIN(pvr)  (((pvr) >> 0) & 0xF)    /* Minor revision field */
+
+/* Processor Version Numbers */
+
+#define PVR_403GA    0x00200000
+#define PVR_403GB    0x00200100
+#define PVR_403GC    0x00200200
+#define PVR_403GCX   0x00201400
+#define PVR_405GP    0x40110000
+#define PVR_STB03XXX 0x40310000
+#define PVR_NP405H   0x41410000
+#define PVR_NP405L   0x41610000
+#define PVR_601      0x00010000
+#define PVR_602      0x00050000
+#define PVR_603      0x00030000
+#define PVR_603e     0x00060000
+#define PVR_603ev    0x00070000
+#define PVR_603r     0x00071000
+#define PVR_604      0x00040000
+#define PVR_604e     0x00090000
+#define PVR_604r     0x000A0000
+#define PVR_620      0x00140000
+#define PVR_740      0x00080000
+#define PVR_750      PVR_740
+#define PVR_740P     0x10080000
+#define PVR_750P     PVR_740P
+#define PVR_7400     0x000C0000
+#define PVR_7410     0x800C0000
+#define PVR_7450     0x80000000
+#define PVR_8540     0x80200000
+#define PVR_8560     0x80200000
+/*
+ * For the 8xx processors, all of them report the same PVR family for
+ * the PowerPC core. The various versions of these processors must be
+ * differentiated by the version number in the Communication Processor
+ * Module (CPM).
+ */
+#define PVR_821  0x00500000
+#define PVR_823  PVR_821
+#define PVR_850  PVR_821
+#define PVR_860  PVR_821
+#define PVR_8240 0x00810100
+#define PVR_8245 0x80811014
+#define PVR_8260 PVR_8240
+
+/* 64-bit processors */
+#define PVR_NORTHSTAR 0x0033
+#define PVR_PULSAR    0x0034
+#define PVR_POWER4    0x0035
+#define PVR_ICESTAR   0x0036
+#define PVR_SSTAR     0x0037
+#define PVR_POWER4p   0x0038
+#define PVR_970       0x0039
+#define PVR_POWER5    0x003A
+#define PVR_POWER5p   0x003B
+#define PVR_970FX     0x003C
+#define PVR_630       0x0040
+#define PVR_630p      0x0041
+#define PVR_970MP     0x0044
+#define PVR_BE        0x0070
+
+#ifdef __ASSEMBLY__
+
+#define LOADADDR(rn, name)                                                     \
+    lis rn, name##@highest;                                                    \
+    ori rn, rn, name##@higher;                                                 \
+    rldicr rn, rn, 32, 31;                                                     \
+    oris rn, rn, name##@h;                                                     \
+    ori rn, rn, name##@l
+
+#define SET_REG_TO_CONST(reg, value)                                           \
+    lis reg, (((value) >> 48) & 0xFFFF);                                       \
+    ori reg, reg, (((value) >> 32) & 0xFFFF);                                  \
+    rldicr reg, reg, 32, 31;                                                   \
+    oris reg, reg, (((value) >> 16) & 0xFFFF);                                 \
+    ori reg, reg, ((value) &0xFFFF);
+
+#define SET_REG_TO_LABEL(reg, label)                                           \
+    lis reg, (label) @highest;                                                 \
+    ori reg, reg, (label) @higher;                                             \
+    rldicr reg, reg, 32, 31;                                                   \
+    oris reg, reg, (label) @h;                                                 \
+    ori reg, reg, (label) @l;
+
+/* Taken from Linux kernel source (arch/powerpc/boot/ppc_asm.h) */
+#define FIXUP_ENDIAN                                                           \
+    tdi 0, 0, 0x48;   /* Reverse endian of b . + 8          */                 \
+    b $ + 44;         /* Skip trampoline if endian is good  */                 \
+    .long 0xa600607d; /* mfmsr r11                          */                 \
+    .long 0x01006b69; /* xori r11,r11,1                     */                 \
+    .long 0x00004039; /* li r10,0                           */                 \
+    .long 0x6401417d; /* mtmsrd r10,1                       */                 \
+    .long 0x05009f42; /* bcl 20,31,$+4                      */                 \
+    .long 0xa602487d; /* mflr r10                           */                 \
+    .long 0x14004a39; /* addi r10,r10,20                    */                 \
+    .long 0xa6035a7d; /* mtsrr0 r10                         */                 \
+    .long 0xa6037b7d; /* mtsrr1 r11                         */                 \
+    .long 0x2400004c  /* rfid                               */
+
+#define _GLOBAL(name)                                                          \
+    .section ".text";                                                          \
+    .align 2;                                                                  \
+    .globl name;                                                               \
+    .type name, @function;                                                     \
+    name:
+
+#define _STATIC(name)                                                          \
+    .section ".text";                                                          \
+    .align 2;                                                                  \
+    .type name, @function;                                                     \
+    name:
+
+#define _ENTRY(name) name
+
+#else  /* __ASSEMBLY__ */
+#endif /* __ASSEMBLY__ */
+
+#endif
diff --git a/xen/arch/ppc/include/asm/reg_defs.h b/xen/arch/ppc/include/asm/reg_defs.h
new file mode 100644
index 0000000000..ac435517cc
--- /dev/null
+++ b/xen/arch/ppc/include/asm/reg_defs.h
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ *
+ * Copyright IBM Corp. 2005, 2007
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ */
+
+#ifndef _ASM_REG_DEFS_H_
+#define _ASM_REG_DEFS_H_
+
+#ifdef __ASSEMBLY__
+
+#define UL(x) x
+
+/* Condition Register Bit Fields */
+
+#define cr0 0
+#define cr1 1
+#define cr2 2
+#define cr3 3
+#define cr4 4
+#define cr5 5
+#define cr6 6
+#define cr7 7
+
+
+/* General Purpose Registers (GPRs) */
+
+#define r0  0
+#define r1  1
+#define r2  2
+#define r3  3
+#define r4  4
+#define r5  5
+#define r6  6
+#define r7  7
+#define r8  8
+#define r9  9
+#define r10 10
+#define r11 11
+#define r12 12
+#define r13 13
+#define r14 14
+#define r15 15
+#define r16 16
+#define r17 17
+#define r18 18
+#define r19 19
+#define r20 20
+#define r21 21
+#define r22 22
+#define r23 23
+#define r24 24
+#define r25 25
+#define r26 26
+#define r27 27
+#define r28 28
+#define r29 29
+#define r30 30
+#define r31 31
+
+/* Floating Point Registers (FPRs) */
+#define fr0     0
+#define fr1     1
+#define fr2     2
+#define fr3     3
+#define fr4     4
+#define fr5     5
+#define fr6     6
+#define fr7     7
+#define fr8     8
+#define fr9     9
+#define fr10    10
+#define fr11    11
+#define fr12    12
+#define fr13    13
+#define fr14    14
+#define fr15    15
+#define fr16    16
+#define fr17    17
+#define fr18    18
+#define fr19    19
+#define fr20    20
+#define fr21    21
+#define fr22    22
+#define fr23    23
+#define fr24    24
+#define fr25    25
+#define fr26    26
+#define fr27    27
+#define fr28    28
+#define fr29    29
+#define fr30    30
+#define fr31    31
+
+/* Vector Registers (FPRs) */
+#define vr0     0
+#define vr1     1
+#define vr2     2
+#define vr3     3
+#define vr4     4
+#define vr5     5
+#define vr6     6
+#define vr7     7
+#define vr8     8
+#define vr9     9
+#define vr10    10
+#define vr11    11
+#define vr12    12
+#define vr13    13
+#define vr14    14
+#define vr15    15
+#define vr16    16
+#define vr17    17
+#define vr18    18
+#define vr19    19
+#define vr20    20
+#define vr21    21
+#define vr22    22
+#define vr23    23
+#define vr24    24
+#define vr25    25
+#define vr26    26
+#define vr27    27
+#define vr28    28
+#define vr29    29
+#define vr30    30
+#define vr31    31
+
+#else /* defined(__ASSEMBLY__) */
+
+#define UL(x) x ## UL
+
+#endif
+
+/* Special Purpose Registers */
+#define SPRN_VRSAVE 256
+#define SPRN_DSISR  18
+#define SPRN_DAR    19
+#define SPRN_DEC    22
+#define SPRN_SRR0   26
+#define SPRN_SRR1   27
+#define SPRN_TBRL   268
+#define SPRN_TBRU   269
+#define SPRN_SPRG0  272
+#define SPRN_SPRG1  273
+#define SPRN_SPRG2  274
+#define SPRN_SPRG3  275
+#define SPRN_TBWL   284
+#define SPRN_TBWU   285
+
+#define SPRN_HSPRG0 304
+#define SPRN_HSPRG1 305
+#define SPRN_HDEC   310
+#define SPRN_HIOR   311
+#define SPRN_RMOR   312
+#define SPRN_HRMOR  313
+#define SPRN_HSRR0  314
+#define SPRN_HSRR1  315
+#define SPRN_LPCR   318
+#define SPRN_LPIDR  319
+
+/* Performance monitor spr encodings */
+#define SPRN_MMCRA  786
+#define   MMCRA_SAMPHV    UL(0x10000000) /* state of MSR HV when SIAR set */
+#define   MMCRA_SAMPPR    UL(0x08000000) /* state of MSR PR when SIAR set */
+#define   MMCRA_SAMPLE_ENABLE UL(0x00000001) /* enable sampling */
+#define NUM_PMCS 8
+#define SPRN_PMC1   787
+#define SPRN_PMC2   788
+#define SPRN_PMC3   789
+#define SPRN_PMC4   790
+#define SPRN_PMC5   791
+#define SPRN_PMC6   792
+#define SPRN_PMC7   793
+#define SPRN_PMC8   794
+#define SPRN_MMCR0  795
+#define   MMCR0_FC      UL(0x80000000) /* freeze counters */
+#define   MMCR0_FCS     UL(0x40000000) /* freeze in supervisor state */
+#define   MMCR0_FCP     UL(0x20000000) /* freeze in problem state */
+#define   MMCR0_FCM1    UL(0x10000000) /* freeze counters while MSR mark = 1 */
+#define   MMCR0_FCM0    UL(0x08000000) /* freeze counters while MSR mark = 0 */
+#define   MMCR0_PMAE    UL(0x04000000) /* performance monitor alert enabled */
+#define   MMCR0_PMAO    UL(0x00000080) /* performance monitor alert occurred */
+#define   MMCR0_FCH     UL(0x00000001) /* freeze conditions in hypervisor */
+#define SPRN_SIAR   796
+#define SPRN_SDAR   797
+#define SPRN_MMCR1  798
+
+/* As defined for PU G4 */
+#define SPRN_HID0   1008
+#define SPRN_HID1   1009
+#define SPRN_HID4   1012
+
+#define SPRN_DABR   1013
+#define SPRN_HID5   1014
+#define SPRN_DABRX  1015
+#define SPRN_HID6   1017
+#define SPRN_HID7   1018
+#define SPRN_HID8   1019
+#define SPRN_PIR    1023
+
+#endif /* _ASM_REG_DEFS_H_ */
diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
new file mode 100644
index 0000000000..24aaeb84df
--- /dev/null
+++ b/xen/arch/ppc/ppc64/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
\ No newline at end of file
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
new file mode 100644
index 0000000000..d91b0972ae
--- /dev/null
+++ b/xen/arch/ppc/ppc64/head.S
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
+ *
+ * Copyright (C) 2005, 2006 IBM Corp.
+ * Copyright (C) 2023 Raptor Engineering, LLC
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Hollis Blanchard <hollisb@us.ibm.com>
+ *          Timothy Pearson <tpearson@raptorengineering.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#include <asm/config.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
+#include <asm/asm-offsets.h>
+
+.section .text.header, "ax", %progbits
+
+ENTRY(start)
+    /* NOTE: (OF only) r3-r7 contain data passed to kernel from fw */
+    FIXUP_ENDIAN
+
+    /* Set MSR_HV bit */
+    mfmsr r8
+    li r9, MSR_HV >> 48
+    sldi r9, r9, 48
+    or r8, r8, r9
+    mtmsrd r8
+
+    /* set up the initial stack */
+    SET_REG_TO_LABEL(r1, cpu0_boot_stack)
+    li r8, 0
+    std r8, 0(r1)
+
+    /* call the init function */
+    LOADADDR(r12,start_xen)
+    mtctr r12
+    bctrl
+
+    /* should never return */
+    trap
+
+    /* Note! GDB 6.3 makes the very stupid assumption that PC > SP means we are
+     * in a Linux signal trampoline, and it begins groping for a struct
+     * rt_sigframe on the stack. Naturally, this fails miserably for our
+     * backtrace. To work around this behavior, we must make certain that our
+     * stack is always above our text, e.g. in the data section. */
+    .data /* DO NOT REMOVE; see GDB note above */
+    .align 4
+cpu0_boot_stack_bottom:
+    .space STACK_SIZE
+cpu0_boot_stack:
+    .space STACK_FRAME_OVERHEAD
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
new file mode 100644
index 0000000000..c9509fb6a6
--- /dev/null
+++ b/xen/arch/ppc/setup.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/compile.h>
+#include <xen/init.h>
+
+void __init noreturn start_xen(void)
+{
+    for ( ;; )
+    {
+        // Set current hardware thread to very low priority
+        asm volatile("or 31,31,31");
+    }
+
+    unreachable();
+}
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
new file mode 100644
index 0000000000..89fcdc9c00
--- /dev/null
+++ b/xen/arch/ppc/xen.lds.S
@@ -0,0 +1,173 @@
+#include <xen/xen.lds.h>
+
+#undef ENTRY
+#undef ALIGN
+
+OUTPUT_ARCH(powerpc:common64)
+ENTRY(start)
+
+PHDRS
+{
+    text PT_LOAD ;
+#if defined(BUILD_ID)
+    note PT_NOTE ;
+#endif
+}
+
+/**
+ * OF's base load address is 0x400000 (XEN_VIRT_START).
+ * By defining sections this way, we can keep our virtual address base at 0x400000
+ * while keeping the physical base at 0x0.
+ *
+ * Without this, OF incorrectly loads .text at 0x400000 + 0x400000 = 0x800000.
+ * Taken from x86/xen.lds.S
+ */
+#ifdef CONFIG_LD_IS_GNU
+# define DECL_SECTION(x) x : AT(ADDR(#x) - XEN_VIRT_START)
+#else
+# define DECL_SECTION(x) x : AT(ADDR(x) - XEN_VIRT_START)
+#endif
+
+SECTIONS
+{
+    . = XEN_VIRT_START;
+
+    DECL_SECTION(.text) {
+        _stext = .;            /* Text section */
+        *(.text.header)
+
+        *(.text.cold)
+        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
+        *(.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        *(.text.*)
+#endif
+
+        *(.fixup)
+        *(.gnu.warning)
+        . = ALIGN(POINTER_ALIGN);
+        _etext = .;             /* End of text section */
+    } :text
+
+    . = ALIGN(PAGE_SIZE);
+    DECL_SECTION(.rodata) {
+        _srodata = .;          /* Read-only data */
+        *(.rodata)
+        *(.rodata.*)
+        *(.data.rel.ro)
+        *(.data.rel.ro.*)
+
+        VPCI_ARRAY
+
+        . = ALIGN(POINTER_ALIGN);
+        _erodata = .;        /* End of read-only data */
+    } :text
+
+    #if defined(BUILD_ID)
+    . = ALIGN(4);
+    DECL_SECTION(.note.gnu.build-id) {
+        __note_gnu_build_id_start = .;
+        *(.note.gnu.build-id)
+        __note_gnu_build_id_end = .;
+    } :note :text
+    #endif
+    _erodata = .;                /* End of read-only data */
+
+    . = ALIGN(PAGE_SIZE);
+    DECL_SECTION(.data.ro_after_init) {
+        __ro_after_init_start = .;
+        *(.data.ro_after_init)
+        . = ALIGN(PAGE_SIZE);
+        __ro_after_init_end = .;
+    } : text
+
+    DECL_SECTION(.data.read_mostly) {
+        *(.data.read_mostly)
+    } :text
+
+    . = ALIGN(PAGE_SIZE);
+    DECL_SECTION(.data) {                    /* Data */
+        *(.data.page_aligned)
+        . = ALIGN(8);
+        __start_schedulers_array = .;
+        *(.data.schedulers)
+        __end_schedulers_array = .;
+
+        HYPFS_PARAM
+
+        *(.data .data.*)
+        CONSTRUCTORS
+    } :text
+
+    . = ALIGN(PAGE_SIZE);             /* Init code and data */
+    __init_begin = .;
+    DECL_SECTION(.init.text) {
+        _sinittext = .;
+        *(.init.text)
+        _einittext = .;
+        . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
+    } :text
+
+    . = ALIGN(PAGE_SIZE);
+    DECL_SECTION(.init.data) {
+        *(.init.rodata)
+        *(.init.rodata.*)
+
+        . = ALIGN(POINTER_ALIGN);
+        __setup_start = .;
+        *(.init.setup)
+        __setup_end = .;
+
+        __initcall_start = .;
+        *(.initcallpresmp.init)
+        __presmp_initcall_end = .;
+        *(.initcall1.init)
+        __initcall_end = .;
+
+        LOCK_PROFILE_DATA
+
+        *(.init.data)
+        *(.init.data.rel)
+        *(.init.data.rel.*)
+
+        . = ALIGN(8);
+        __ctors_start = .;
+        *(.ctors)
+        *(.init_array)
+        *(SORT(.init_array.*))
+        __ctors_end = .;
+    } :text
+    . = ALIGN(POINTER_ALIGN);
+    __init_end = .;
+
+    DECL_SECTION(.bss) {                     /* BSS */
+        __bss_start = .;
+        *(.bss.stack_aligned)
+        . = ALIGN(PAGE_SIZE);
+        *(.bss.page_aligned)
+        . = ALIGN(PAGE_SIZE);
+        __per_cpu_start = .;
+        *(.bss.percpu.page_aligned)
+        *(.bss.percpu)
+        . = ALIGN(SMP_CACHE_BYTES);
+        *(.bss.percpu.read_mostly)
+        . = ALIGN(SMP_CACHE_BYTES);
+        __per_cpu_data_end = .;
+        *(.bss .bss.*)
+        . = ALIGN(POINTER_ALIGN);
+        __bss_end = .;
+    } :text
+    _end = . ;
+
+    /* Section for the device tree blob (if any). */
+    DECL_SECTION(.dtb) { *(.dtb) } :text
+
+    DWARF2_DEBUG_SECTIONS
+
+    DISCARD_SECTIONS
+
+    STABS_DEBUG_SECTIONS
+
+    ELF_DETAILS_SECTIONS
+}
-- 
2.30.2


