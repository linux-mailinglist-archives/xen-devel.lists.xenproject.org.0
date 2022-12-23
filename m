Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC7654F92
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 12:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468887.728094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2Y-0002Ee-DH; Fri, 23 Dec 2022 11:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468887.728094; Fri, 23 Dec 2022 11:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2Y-0002BL-A1; Fri, 23 Dec 2022 11:16:38 +0000
Received: by outflank-mailman (input) for mailman id 468887;
 Fri, 23 Dec 2022 11:16:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2p1Y=4V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1p8g2W-0001vi-HA
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 11:16:36 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43000505-82b3-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 12:16:35 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso3337155wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Dec 2022 03:16:35 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm4015400wmb.28.2022.12.23.03.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 03:16:34 -0800 (PST)
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
X-Inumbo-ID: 43000505-82b3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bojZ+BqHhvZXTf8zMnMZHqyICjgS2oNaXrHozMSW7ig=;
        b=f2n4vVRroXeruv0VuASOOKa2qpZxgN5ilRx0aaJoeT25SEHd4WmSYNyfJsunZgg56j
         tVshykRLVO7o0UcD1xL7augBxAWpZB4ToHutWC29Jsly7u/U/VLRQu2KMJwLJGge5EQn
         PHl6mz0OV7US5Js4FMg4ZgfZbnNIwbgMSsQOB8k3gTepAwBzIIeiw89QALf4Aojo1jMv
         3inu7aHNyU01VXE3IZlEenmylgWRBP7c4KOV30pAzKkPlWxYrPLv5nXn/G5chXKpTk7E
         QVVvDnu4n7Nfr+TxMq3rYP9tFvrAAyxWkqcqqhhMV17X0js4w5OjiC5hXZvUeLyiyW8d
         oU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bojZ+BqHhvZXTf8zMnMZHqyICjgS2oNaXrHozMSW7ig=;
        b=2sUvYDZV6MrX1lFRnf04wECNEy0V/vMFor/tkYfA1FAGs/ThJrbP5PD/KDc84Ra0Pp
         4GELb9ifMzfuMjLbkVCqxu4QYUaeJpnZQkqelsgPz8SKyQ1QKqzfUSLQZJvOSTST6vQV
         drOeJuYNXuqcFof2RDhu/3tTPQt88AqtGopGYlmeLItzDBNrnsm2/jFkXcyCT+db0dbK
         XUBvx7G1LChBmn1VSropZAJm+6fIWNAnSbLJaBEXOvURW6gy+IxMILpYwoVlx2lHmYsp
         9ws6bagtt5n5RdapZeS2zMgjdi+hhjeTj3t/9s6zRGxII99nEHd14BsN29MQy/2kqAna
         j0vA==
X-Gm-Message-State: AFqh2kprP5o4RAPrQJi+micO7wO7kWnFZezFE7dCAeutFS5TSV8t0CaL
	usrLeOqwIc4NMe+HfZr0lkVsTIvHhGoY3Rnp
X-Google-Smtp-Source: AMrXdXuxrsI9MU6JO2oUl7oA4afGts0iNNIcb2VO9yFEPV394cXXLAv973aMjjqgo8tAZqQXONU1Yw==
X-Received: by 2002:a05:600c:4e11:b0:3d3:4012:8da8 with SMTP id b17-20020a05600c4e1100b003d340128da8mr6727895wmq.40.1671794194743;
        Fri, 23 Dec 2022 03:16:34 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to build/run minimal Xen
Date: Fri, 23 Dec 2022 13:16:20 +0200
Message-Id: <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671789736.git.oleksii.kurochko@gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch provides a minimal amount of changes to start
build and run minimal Xen binary at GitLab CI&CD that will
allow continuous checking of the build status of RISC-V Xen.

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
 xen/arch/riscv/Makefile             | 30 +++++++++++++
 xen/arch/riscv/arch.mk              | 10 +++++
 xen/arch/riscv/include/asm/config.h | 26 ++++++++++-
 xen/arch/riscv/include/asm/types.h  | 11 +++++
 xen/arch/riscv/riscv64/Makefile     |  2 +-
 xen/arch/riscv/riscv64/head.S       |  2 +-
 xen/arch/riscv/xen.lds.S            | 69 +++++++++++++++++++++++++++++
 7 files changed, 147 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/xen.lds.S

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 942e4ffbc1..893dd19ea6 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,2 +1,32 @@
+obj-$(CONFIG_RISCV_64) += riscv64/
+
+$(TARGET): $(TARGET)-syms
+	$(OBJCOPY) -O binary -S $< $@
+
+$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+		$(SYMBOLS_DUMMY_OBJ) -o $(@D)/.$(@F).0
+	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+		$(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
+	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+		$(@D)/.$(@F).1.o -o $@
+	$(NM) -pa --format=sysv $(@D)/$(@F) \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		>$(@D)/$(@F).map
+	rm -f $(@D)/.$(@F).[0-9]*
+
+$(obj)/xen.lds: $(src)/xen.lds.S FORCE
+	        $(call if_changed_dep,cpp_lds_S)
+
+.PHONY: clean
+clean::
+	rm -f $(objtree)/.xen-syms.[0-9]*
+
 .PHONY: include
 include:
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index ae8fe9dec7..9292b72718 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,3 +11,13 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+
+# TODO: Drop override and SYMBOLS_DUMMY_OBJ when more
+# of the build is working
+override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
+override ALL_LIBS-y =
+ifneq ($(wildcard $(objtree)/common/symbols-dummy.o),)
+SYMBOLS_DUMMY_OBJ=$(objtree)/common/symbols-dummy.o
+else
+SYMBOLS_DUMMY_OBJ=
+endif
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index e2ae21de61..756607a4a2 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -28,7 +28,7 @@
 
 /* Linkage for RISCV */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 2
+#define ALIGN .align 4
 
 #define ENTRY(name)                                \
   .globl name;                                     \
@@ -36,6 +36,30 @@
   name:
 #endif
 
+/*
+ * Definition of XEN_VIRT_START should look like:
+ *   define XEN_VIRT_START _AT(vaddr_t,0x00200000)
+ * It requires including of additional headers which
+ * will increase an amount of files unnecessary for
+ * minimal RISC-V Xen build so set value of
+ * XEN_VIRT_START explicitly.
+ *
+ * TODO: change it to _AT(vaddr_t,0x00200000) when
+ *       necessary header will be pushed.
+ */
+#define XEN_VIRT_START  0x80200000
+/*
+ * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
+ * remove unnecessary headers for minimal
+ * build headers it will be better to set PAGE_SIZE
+ * explicitly.
+ *
+ * TODO: remove it when <asm/page-*.h> will be needed
+ *       defintion of PAGE_SIZE should be remove from
+ *       this header.
+ */
+#define PAGE_SIZE       4096
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..afbca6b15c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,11 @@
+#ifndef __TYPES_H__
+#define __TYPES_H__
+
+/*
+ *
+ * asm/types.h is required for xen-syms.S file which
+ * is produced by tools/symbols.
+ *
+ */
+
+#endif
diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
index 15a4a65f66..3340058c08 100644
--- a/xen/arch/riscv/riscv64/Makefile
+++ b/xen/arch/riscv/riscv64/Makefile
@@ -1 +1 @@
-extra-y += head.o
+obj-y += head.o
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 0dbc27ba75..0330b29c01 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,6 +1,6 @@
 #include <asm/config.h>
 
-        .text
+        .section .text.header, "ax", %progbits
 
 ENTRY(start)
         j  start
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
new file mode 100644
index 0000000000..60628b3856
--- /dev/null
+++ b/xen/arch/riscv/xen.lds.S
@@ -0,0 +1,69 @@
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
+  text PT_LOAD ;
+#if defined(BUILD_ID)
+  note PT_NOTE ;
+#endif
+}
+
+SECTIONS
+{
+  . = XEN_VIRT_START;
+  _start = .;
+  .text : {
+        _stext = .;
+       *(.text.header)
+       *(.text)
+       *(.gnu.warning)
+       . = ALIGN(POINTER_ALIGN);
+       _etext = .;
+  } :text
+
+    . = ALIGN(PAGE_SIZE);
+  .rodata : {
+        _srodata = .;
+       *(.rodata)
+       *(.rodata.*)
+       *(.data.rel.ro)
+       *(.data.rel.ro.*)
+  } :text
+
+#if defined(BUILD_ID)
+  . = ALIGN(4);
+  .note.gnu.build-id : {
+       __note_gnu_build_id_start = .;
+       *(.note.gnu.build-id)
+       __note_gnu_build_id_end = .;
+  } :note :text
+#endif
+
+  . = ALIGN(PAGE_SIZE);
+  .data : { /* Data */
+       *(.data .data.*)
+  } :text
+
+  . = ALIGN(PAGE_SIZE);
+  .bss : {
+       __bss_start = .;
+       *(.bss .bss.*)
+       . = ALIGN(POINTER_ALIGN);
+       __bss_end = .;
+  } :text
+  _end = . ;
+
+  DWARF2_DEBUG_SECTIONS
+
+  DISCARD_SECTIONS
+
+  STABS_DEBUG_SECTIONS
+
+  ELF_DETAILS_SECTIONS
+}
-- 
2.38.1


