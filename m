Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16A65EA51
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471847.731868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOwW-0007KZ-Uz; Thu, 05 Jan 2023 12:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471847.731868; Thu, 05 Jan 2023 12:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOwW-0007Ha-Rp; Thu, 05 Jan 2023 12:01:56 +0000
Received: by outflank-mailman (input) for mailman id 471847;
 Thu, 05 Jan 2023 12:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDOwU-0006u7-I6
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:01:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be606e7b-8cf0-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 13:01:53 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id ay40so27872133wmb.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 04:01:53 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 x5-20020a05600c21c500b003d9b89a39b2sm2159826wmj.10.2023.01.05.04.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:01:52 -0800 (PST)
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
X-Inumbo-ID: be606e7b-8cf0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOuybka6m9Zk5Om7Z7pMNEOSvOvsqAFonp5yEXrOY74=;
        b=RHgAudbgayymqxO19Hdfk4rKzq5iyVG5oIOYA3urYRNss2gMQl40VGFGFfSJqpa7HV
         XwOcGcl4fW+B7VlnUKLsQF7Vg8ydupY/GwDhgsJYrxysloDOxwQnAEQkt8p1Q2ONv3/A
         TRVUeHHk54dna433b0q2o47TZDcSpsB2D+7poTLJbv34nL8IAcgnpg3rJh/KJgMvZnTP
         e1ADeReuU2xwDDRqBOcplSll1FGDcFan+2gbM5UOaazjr4DzLj9xD/hY8GW0C4ICmJMh
         bUBbxrfU4VK8I68HHFJuImfeLDjwVOOwC/CqbQzQfBiEcY7xOTmI2LCzTboghuDznAue
         IwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOuybka6m9Zk5Om7Z7pMNEOSvOvsqAFonp5yEXrOY74=;
        b=ftYERKJONKAtpwzXSinemlbCW5c6y0QDZyxRXKzhbI+U+ysSIwsxbtyXlbYgQ+WbNO
         SuVq3gwjgYcE8gUbZah4G+Uk0mJeQJwUGJ9zIq51wWIG6Scxw+ju5n0ycOoYv6njok/d
         7iA7Wcz/MetjwqY50MAWtz5PwizByY6gg+eLWR1DJxq20ec2o7pZh1kUplAcz7bNXQmW
         ToPOKQm2285YP8ylC7+XDOvTKar8odmdKIu8KYqbTnx+NlzI/SZyj+Nf4Ritv5E3wisz
         N31n8P8g57Mws54W+s6dJBHq0harEssA7WIacVJBk9qgtdSW0YTJoNsLo1NlyceX73Yq
         lH6Q==
X-Gm-Message-State: AFqh2koNfgmh3hGoeZnsJYcffl17khSnr/Wc6RZmpwEydDN2JoiokfDt
	7mRhhgkhW6qj49XVonJuzZ2uypGSldGoHNMN
X-Google-Smtp-Source: AMrXdXsj8/JreMZze0R9CwSolXzrA+C8W9QYfrFquPaqB8brVIc7qbccQ7ISl+IDm15WZcdwGEq9eA==
X-Received: by 2002:a05:600c:1c27:b0:3cf:a83c:184a with SMTP id j39-20020a05600c1c2700b003cfa83c184amr37045215wms.24.1672920112580;
        Thu, 05 Jan 2023 04:01:52 -0800 (PST)
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
Subject: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run minimal Xen
Date: Thu,  5 Jan 2023 14:01:45 +0200
Message-Id: <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1672912316.git.oleksii.kurochko@gmail.com>
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch provides a minimal amount of changes to start
build and run minimal Xen binary at GitLab CI&CD that will
allow continuous checking of the build status of RISC-V Xen.

Except introduction of new files the following changes were done:
* Redefinition of ALIGN define from '.align 2' to '.align 4'.
  '.align 2' was incorrect choice done previously
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
       make XEN_TARGET_ARCH=riscv64 -C xen tiny64_defconfig
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
Changes in V4:
- Remove clean-files target from Makefile as ${TARGET-syms} was
  simplifed and there is no any sense for clean-files target
  for now.
- Update the commit message.
- Code style fixes.
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
 xen/arch/riscv/Makefile             |  14 +++
 xen/arch/riscv/arch.mk              |   4 +
 xen/arch/riscv/include/asm/config.h |   9 +-
 xen/arch/riscv/riscv64/Makefile     |   2 +-
 xen/arch/riscv/riscv64/head.S       |   4 +-
 xen/arch/riscv/xen.lds.S            | 158 ++++++++++++++++++++++++++++
 6 files changed, 186 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/xen.lds.S

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 942e4ffbc1..248f2cbb3e 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,2 +1,16 @@
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
index e2ae21de61..c6f9e230d7 100644
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
 
+#define XEN_VIRT_START  _AT(UL, 0x00200000)
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


