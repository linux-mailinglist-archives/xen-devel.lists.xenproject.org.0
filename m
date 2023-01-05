Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B665E6F6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 09:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471707.731667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLo6-0003vU-VY; Thu, 05 Jan 2023 08:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471707.731667; Thu, 05 Jan 2023 08:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLo6-0003tO-QA; Thu, 05 Jan 2023 08:41:02 +0000
Received: by outflank-mailman (input) for mailman id 471707;
 Thu, 05 Jan 2023 08:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDLo5-0003sb-AE
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 08:41:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad524a14-8cd4-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 09:40:58 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id ay40so27507622wmb.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 00:40:58 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003cffd3c3d6csm1752711wmq.12.2023.01.05.00.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 00:40:57 -0800 (PST)
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
X-Inumbo-ID: ad524a14-8cd4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DmOMupuCoWDrIsiMMu25qOlzUBJXmbm34omuNR0qaQ=;
        b=jEnnMoJsw/QR9BZmza/gxrU1z8UTyZnyWNrDOF6UyqsyG1XBIuhmRGY0Oyv7LfIosV
         uLuoX0OopVqyrU3SqigHHfbG7lL/aJe2HGn7E4it4/Nx/c0Xodn2HvV1Hw07vb4Kh68L
         PBBB8lk7Z+vxoTzytBuQHm949+/UQ7p01PNSbmrHqxFtvGAlHA5+jVivdYbIOznrkjQf
         yfoQbdoCQumqKFqtrDDwQZFR4VieSopb/K2KYgQPQ3SF1M7uYlYNFNgZ4TwijlltygHX
         7uI3pcUrexy0fUgRmSTfECGQLC5+29lxdMDXy9oLxU8mVnmeFz1yIwP8rBjRU/h6b5sR
         PhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DmOMupuCoWDrIsiMMu25qOlzUBJXmbm34omuNR0qaQ=;
        b=4203oaBj+M14aNP9WZOPI+5v9QNB3B5EdXKvfTK9kFoyLYlI7TNR5g26cHHx0OobGo
         26fwkhiSaaMT9+pbJkBNJASy2J3NZ1QT54ZwzfriVK44SqKnnMddYkhDZo15ggckEx/8
         qxI65rToY4T5i4AxS5wQ78oCJN6f2GcBq8iX2/pStnvT2o0afoQMgVclnIavIUaBOOy1
         U2ueVz7IO2qzrIrwjkg0ikGy2/nCPR2tSmoU6tBXc0XkVh5BCOLkb2po1fRJEh8biZIz
         iExhEoShNDvecIao+98SqIvGjbiUdE62k6ElptX9TUqbQJtYbyTMCuQBIoBkImwneTg9
         Ki5Q==
X-Gm-Message-State: AFqh2kp9fk1Eu37dWoJDqIT2fUnfiUQ9o9rh+Zcr1X07raP4zJcNGAek
	BD/a848o24hlc1qvC9chfAPnJjdnXPNNhhmN
X-Google-Smtp-Source: AMrXdXukQDeR5j0Ysjd9JHSWYImdEWJ6Dv4Vsx4eHct59HG9CM/lZXIMrVSQpGMpsYJZS4J1VlJ9zw==
X-Received: by 2002:a05:600c:4b0f:b0:3d2:2651:64bd with SMTP id i15-20020a05600c4b0f00b003d2265164bdmr35671137wmp.10.1672908058181;
        Thu, 05 Jan 2023 00:40:58 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v3 1/2] arch/riscv: initial RISC-V support to build/run minimal Xen
Date: Thu,  5 Jan 2023 10:40:50 +0200
Message-Id: <9f575b36965088936b5f7beed1b0d4bd96063d16.1672906559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1672906559.git.oleksii.kurochko@gmail.com>
References: <cover.1672906559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch provides a minimal amount of changes to start
build and run minimal Xen binary at GitLab CI&CD that will
allow continuous checking of the build status of RISC-V Xen.

Except introduction of new files the following changes were done:
* Redefinition of ALIGN define from '.algin 2' to '.align 4' as
  RISC-V implementations (except for with C extension) enforce 32-bit
  instruction address alignment.  With C extension, 16-bit and 32-bit
  are both allowed.
* ALL_OBJ-y and ALL_LIBS-y were temporary overwritted to produce
  a minimal hypervisor image otherwise it will be required to push
  huge amount of headers and stubs for common, drivers, libs etc which
  aren't necessary for now.
* Section changed from .text to .text.header for start function
  to make it the first one executed.
* Rework riscv64/Makefile logic to rebase over changes since the first
  RISC-V commit.

RISC-V Xen can be built by the following instructions:
  $ CONTAINER=riscv64 ./automation/scripts/containerize \
       make XEN_TARGET_ARCH=riscv64 tiny64_defconfig
  $ CONTAINER=riscv64 ./automation/scripts/containerize \
       make XEN_TARGET_ARCH=riscv64 -C xen build

RISC-V Xen can be run as:
  $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
       -kernel xen/xen

To run in debug mode should be done the following instructions:
 $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
        -kernel xen/xen -s -S
 # In separate terminal:
 $ riscv64-buildroot-linux-gnu-gdb
 $ target remote :1234
 $ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
 $ hb *0x80200000
 $ c # it should stop at instruction j 0x80200000 <start>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
- Remove include of <asm/config.h> from head.S
---
Changes in V2:
- Update commit message:
  - Add explanation why ALIGN define was changed.
  - Add explanation why section of 'start' function was changed.
- Rework xen.lds.S linker script. It is mostly based on ARM except
  ARM-specific sections which have been removed.
- Rework in riscv64/Makefile rule $(TARGET)-syms
- Remove asm/types.h header as after reworking of riscv64/Makefile
  it is not needed now.
- Remove unneeded define SYMBOLS_DUMMY_OBJ.
---
 xen/arch/riscv/Makefile             |  16 +++
 xen/arch/riscv/arch.mk              |   4 +
 xen/arch/riscv/include/asm/config.h |   9 +-
 xen/arch/riscv/riscv64/Makefile     |   2 +-
 xen/arch/riscv/riscv64/head.S       |   4 +-
 xen/arch/riscv/xen.lds.S            | 158 ++++++++++++++++++++++++++++
 6 files changed, 188 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/xen.lds.S

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 942e4ffbc1..74386beb85 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,2 +1,18 @@
+obj-$(CONFIG_RISCV_64) += riscv64/
+
+$(TARGET): $(TARGET)-syms
+	$(OBJCOPY) -O binary -S $< $@
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
+clean-files := $(objtree)/.xen-syms.[0-9]*
+
 .PHONY: include
 include:
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index ae8fe9dec7..012dc677c3 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,3 +11,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+
+# TODO: Drop override when more of the build is working
+override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
+override ALL_LIBS-y =
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index e2ae21de61..e10e13ba53 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,6 +1,9 @@
 #ifndef __RISCV_CONFIG_H__
 #define __RISCV_CONFIG_H__
 
+#include <xen/const.h>
+#include <xen/page-size.h>
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
@@ -28,7 +31,7 @@
 
 /* Linkage for RISCV */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 2
+#define ALIGN .align 4
 
 #define ENTRY(name)                                \
   .globl name;                                     \
@@ -36,6 +39,10 @@
   name:
 #endif
 
+#define XEN_VIRT_START  _AT(UL,0x00200000)
+
+#define SMP_CACHE_BYTES (1 << 6)
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
index 15a4a65f66..3340058c08 100644
--- a/xen/arch/riscv/riscv64/Makefile
+++ b/xen/arch/riscv/riscv64/Makefile
@@ -1 +1 @@
-extra-y += head.o
+obj-y += head.o
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 0dbc27ba75..990edb70a0 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,6 +1,4 @@
-#include <asm/config.h>
-
-        .text
+        .section .text.header, "ax", %progbits
 
 ENTRY(start)
         j  start
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
new file mode 100644
index 0000000000..ca57cce75c
--- /dev/null
+++ b/xen/arch/riscv/xen.lds.S
@@ -0,0 +1,158 @@
+#include <xen/xen.lds.h>
+
+#undef ENTRY
+#undef ALIGN
+
+OUTPUT_ARCH(riscv)
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
+SECTIONS
+{
+    . = XEN_VIRT_START;
+    _start = .;
+    .text : {
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
+    .rodata : {
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
+    .note.gnu.build-id : {
+        __note_gnu_build_id_start = .;
+        *(.note.gnu.build-id)
+        __note_gnu_build_id_end = .;
+    } :note :text
+    #endif
+    _erodata = .;                /* End of read-only data */
+
+    . = ALIGN(PAGE_SIZE);
+    .data.ro_after_init : {
+        __ro_after_init_start = .;
+        *(.data.ro_after_init)
+        . = ALIGN(PAGE_SIZE);
+        __ro_after_init_end = .;
+    } : text
+
+    .data.read_mostly : {
+        *(.data.read_mostly)
+    } :text
+
+    . = ALIGN(PAGE_SIZE);
+    .data : {                    /* Data */
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
+    .init.text : {
+        _sinittext = .;
+        *(.init.text)
+        _einittext = .;
+        . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
+    } :text
+    . = ALIGN(PAGE_SIZE);
+    .init.data : {
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
+    .bss : {                     /* BSS */
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
+    .dtb : { *(.dtb) } :text
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
2.38.1


