Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578172E646
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548195.856035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95MH-0003fC-7q; Tue, 13 Jun 2023 14:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548195.856035; Tue, 13 Jun 2023 14:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95MH-0003cH-3n; Tue, 13 Jun 2023 14:50:57 +0000
Received: by outflank-mailman (input) for mailman id 548195;
 Tue, 13 Jun 2023 14:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q95MG-0003AR-A8
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:50:56 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1d15f96-09f9-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 16:50:54 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id A134243CEB;
 Tue, 13 Jun 2023 07:50:20 -0700 (PDT)
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
X-Inumbo-ID: b1d15f96-09f9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686667821; bh=+YId0qIzGL2wP+hRUog7lPwPFLFjkvuez2Pylo5yEJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kyeB2mqCmzovy0/spOOevso5IH2pi6Qkx/TDrABe44VaoFtL5uzQavbjWDkyq1KoI
	 QHjZypy9l+fHf7Z5soxozTLa8I3LgT3lsNdJWZ1P6T0O/SNYNnesyy1M9fL2rW4chp
	 PUd6vr5Sw8FtLjLsAjLzcyyXdfT9crI9YvSgRPhMFE28ZrRWlxPSHxtPczQZbpo43Q
	 oya4rqRnwUwMDFSRYybmUy3Lv8Lf7E+8bN7qTeFUoUv7FHLhx8dLQu1TF3esnrl+Lj
	 6881cHQHtz9zyn5QUm3Wtq2xd6jSclx5WrO8HNEwq3JJvTmcvEGq11pttGfdSB5caV
	 FDRoGyXlZMxyA==
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
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 2/4] xen: Add files needed for minimal ppc64le build
Date: Tue, 13 Jun 2023 09:50:00 -0500
Message-Id: <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
In-Reply-To: <cover.1686667191.git.shawn@anastas.io>
References: <cover.1686667191.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the build system changes required to build for ppc64le (POWER8+).
As of now the resulting image simply boots to an infinite loop.

$ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
$ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build

This port targets POWER8+ CPUs running in Little Endian mode specifically,
and does not boot on older machines. Additionally, this initial skeleton
only implements the PaPR/pseries boot protocol which allows it to be
booted in a standard QEMU virtual machine:

$ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel xen/xen

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 config/ppc64.mk                          |   5 +
 xen/Makefile                             |   5 +-
 xen/arch/ppc/Kconfig                     |  42 ++++++
 xen/arch/ppc/Kconfig.debug               |   0
 xen/arch/ppc/Makefile                    |  16 +++
 xen/arch/ppc/Rules.mk                    |   0
 xen/arch/ppc/arch.mk                     |  11 ++
 xen/arch/ppc/configs/openpower_defconfig |  13 ++
 xen/arch/ppc/include/asm/config.h        |  63 +++++++++
 xen/arch/ppc/include/asm/page-bits.h     |   7 +
 xen/arch/ppc/ppc64/Makefile              |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c         |   0
 xen/arch/ppc/ppc64/head.S                |  27 ++++
 xen/arch/ppc/xen.lds.S                   | 173 +++++++++++++++++++++++
 14 files changed, 361 insertions(+), 2 deletions(-)
 create mode 100644 config/ppc64.mk
 create mode 100644 xen/arch/ppc/Kconfig
 create mode 100644 xen/arch/ppc/Kconfig.debug
 create mode 100644 xen/arch/ppc/Makefile
 create mode 100644 xen/arch/ppc/Rules.mk
 create mode 100644 xen/arch/ppc/arch.mk
 create mode 100644 xen/arch/ppc/configs/openpower_defconfig
 create mode 100644 xen/arch/ppc/include/asm/config.h
 create mode 100644 xen/arch/ppc/include/asm/page-bits.h
 create mode 100644 xen/arch/ppc/ppc64/Makefile
 create mode 100644 xen/arch/ppc/ppc64/asm-offsets.c
 create mode 100644 xen/arch/ppc/ppc64/head.S
 create mode 100644 xen/arch/ppc/xen.lds.S

diff --git a/config/ppc64.mk b/config/ppc64.mk
new file mode 100644
index 0000000000..597f0668c3
--- /dev/null
+++ b/config/ppc64.mk
@@ -0,0 +1,5 @@
+CONFIG_PPC := y
+CONFIG_PPC64 := y
+CONFIG_PPC_$(XEN_OS) := y
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
index 0000000000..a0a70adef4
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
+	bool "Power ISA 2.07B"
+	help
+	  Target version 2.07B of the Power ISA (POWER8)
+
+config POWER_ISA_3_00
+	bool "Power ISA 3.00"
+	help
+	  Target version 3.00 of the Power ISA (POWER9)
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
index 0000000000..10b101cf9c
--- /dev/null
+++ b/xen/arch/ppc/Makefile
@@ -0,0 +1,16 @@
+obj-$(CONFIG_PPC64) += ppc64/
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
diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
new file mode 100644
index 0000000000..3340058c08
--- /dev/null
+++ b/xen/arch/ppc/ppc64/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
new file mode 100644
index 0000000000..e24331f95c
--- /dev/null
+++ b/xen/arch/ppc/ppc64/head.S
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+.section .text.header, "ax", %progbits
+
+ENTRY(start)
+    /*
+     * Depending on how we were booted, the CPU could be running in either
+     * Little Endian or Big Endian mode. The following trampoline from Linux
+     * cleverly uses an instruction that encodes to a NOP if the CPU's
+     * endianness matches the assumption of the assembler (LE, in our case)
+     * or a branch to code that performs the endian switch in the other case.
+     */
+    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
+    b $ + 44          /* Skip trampoline if endian is good  */
+    .long 0xa600607d  /* mfmsr r11                          */
+    .long 0x01006b69  /* xori r11,r11,1                     */
+    .long 0x00004039  /* li r10,0                           */
+    .long 0x6401417d  /* mtmsrd r10,1                       */
+    .long 0x05009f42  /* bcl 20,31,$+4                      */
+    .long 0xa602487d  /* mflr r10                           */
+    .long 0x14004a39  /* addi r10,r10,20                    */
+    .long 0xa6035a7d  /* mtsrr0 r10                         */
+    .long 0xa6037b7d  /* mtsrr1 r11                         */
+    .long 0x2400004c  /* rfid                               */
+
+    /* Now that the endianness is confirmed, continue */
+1:  b 1b
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


