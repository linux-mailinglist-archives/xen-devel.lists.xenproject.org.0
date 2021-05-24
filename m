Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1C38E8CE
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 16:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131793.246168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBex-0006zm-AH; Mon, 24 May 2021 14:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131793.246168; Mon, 24 May 2021 14:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBex-0006x0-5d; Mon, 24 May 2021 14:34:23 +0000
Received: by outflank-mailman (input) for mailman id 131793;
 Mon, 24 May 2021 14:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOm5=KT=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1llBev-0005zC-5n
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 14:34:21 +0000
Received: from mail-oi1-x234.google.com (unknown [2607:f8b0:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b94264e8-3989-4a34-abd9-b21143b6886e;
 Mon, 24 May 2021 14:34:11 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id d21so27198680oic.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 07:34:11 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id p22sm2840564oop.7.2021.05.24.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 07:34:10 -0700 (PDT)
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
X-Inumbo-ID: b94264e8-3989-4a34-abd9-b21143b6886e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z03iMc+ZiqkEReP0ZHr/r/QRsiH4nGo1RN/qJx+zcmg=;
        b=PlzWCYrOTrOYfnUWI9YFPX7BO+qCPijYAuG8H5Wr40Y4V+Yd/aFM7Q8AOyrY8NHVhN
         mqIN7v8gkf+pdWQVJFlMviYtmWz40zZKBpc9s2vldsfhdVbyTGkbpDUHuyED78qO/iJd
         MFmLi2HL8AgUh1Be/Jqy6HWZQngz55KAuUV9yrXdH8z97I8OTISe79BqTilwy7Zt2++o
         vNBQ2nWW+whMEz710wigf3FVaehPdB9wX+nSyV3cmY+kjNIZnDxMT6A5+BQylfmql0og
         163um5lk8iCAqyjoA1mAgrbriFrTPdxsujgtkrlD9CBemaZRJEAjwhlSmCPUpPnDcwwo
         5jVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z03iMc+ZiqkEReP0ZHr/r/QRsiH4nGo1RN/qJx+zcmg=;
        b=FHo9mh79HRDBy49DF4WMJU8iqOjdYUCpqiQrTYI+Hs0z2PcMaw8O+8RDkVkGWtwHUp
         7Em8Gs0eXsEk5+nI7njglUHM+otKTzpCEWKfHW/U2aA81N8TPGKcX+xpPaaeLIxBJjd3
         3kzITAqbBx3KYn85Cdgj5utWqUu6VLWeCO+xi/OmI7xeXUC3/6FhDyb+iaNIFrH+ZQ1u
         s+luSnuydIstpFIgpNmQ+nnQBujyhw8lCUebAC1WOw1Lk3CrBZ4aOVA+BOOIS64ZFADz
         Zj4nh3XaDHDAxu/wT3hq+lS0ZvIV7aBZ0Xg69atrudkBNng3SzkIj0E2VdW3S8rkmF1W
         Nkgw==
X-Gm-Message-State: AOAM533B1XC62bXlBHHiqbZfBpZ3BAH1iWPaeanhxiyE/u/IH6L3hGjY
	Up+kLzaxVywFwSq0QiUT9ntPefWihFwvvg==
X-Google-Smtp-Source: ABdhPJzEjFTW4jW83mjIZnAMaQ84d3qND0LGuVdB83a6CH2v/PsZ0iPrvuly6aa0XB0twH39/VrqyA==
X-Received: by 2002:aca:4cc4:: with SMTP id z187mr10880438oia.157.1621866850389;
        Mon, 24 May 2021 07:34:10 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
Date: Mon, 24 May 2021 08:34:27 -0600
Message-Id: <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621712830.git.connojdavis@gmail.com>
References: <cover.1621712830.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add arch-specific makefiles and configs needed to build for
riscv. Also add a minimal head.S that is a simple infinite loop.
head.o can be built with

$ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
$ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o

No other TARGET is supported at the moment.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 config/riscv.mk                         |  4 +++
 xen/Makefile                            |  8 +++--
 xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
 xen/arch/riscv/Kconfig.debug            |  0
 xen/arch/riscv/Makefile                 |  0
 xen/arch/riscv/Rules.mk                 |  0
 xen/arch/riscv/arch.mk                  | 14 ++++++++
 xen/arch/riscv/asm-offsets.c            |  0
 xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
 xen/arch/riscv/head.S                   |  6 ++++
 xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
 11 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 config/riscv.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/asm-offsets.c
 create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
 create mode 100644 xen/arch/riscv/head.S
 create mode 100644 xen/include/asm-riscv/config.h

diff --git a/config/riscv.mk b/config/riscv.mk
new file mode 100644
index 0000000000..2b2cc2e63a
--- /dev/null
+++ b/config/riscv.mk
@@ -0,0 +1,4 @@
+CONFIG_RISCV := y
+CONFIG_RISCV_$(XEN_OS) := y
+
+CONFIG_XEN_INSTALL_SUFFIX :=
diff --git a/xen/Makefile b/xen/Makefile
index 9f3be7766d..3a1ff0045b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -26,7 +26,9 @@ MAKEFLAGS += -rR
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
 ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
+SRCARCH=$(shell echo $(ARCH) | \
+          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+              -e s'/riscv.*/riscv/g')
 
 # Don't break if the build process wasn't called from the top level
 # we need XEN_TARGET_ARCH to generate the proper config
@@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
 # Set ARCH/SUBARCH appropriately.
 export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
-                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
+                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+                                -e s'/riscv.*/riscv/g')
 
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
@@ -335,6 +338,7 @@ _clean: delete-unfresh-files
 	$(MAKE) $(clean) xsm
 	$(MAKE) $(clean) crypto
 	$(MAKE) $(clean) arch/arm
+	$(MAKE) $(clean) arch/riscv
 	$(MAKE) $(clean) arch/x86
 	$(MAKE) $(clean) test
 	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
new file mode 100644
index 0000000000..bd8381c5e0
--- /dev/null
+++ b/xen/arch/riscv/Kconfig
@@ -0,0 +1,47 @@
+config RISCV
+	def_bool y
+
+config RISCV_64
+	def_bool y
+	select 64BIT
+
+config ARCH_DEFCONFIG
+	string
+	default "arch/riscv/configs/tiny64_defconfig"
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
+	default RISCV_ISA_RV64IMA if RISCV_64
+	help
+	  This selects the base ISA extensions that Xen will target.
+
+config RISCV_ISA_RV64IMA
+	bool "RV64IMA"
+	help
+	  Use the RV64I base ISA, plus the "M" and "A" extensions
+	  for integer multiply/divide and atomic instructions, respectively.
+
+endchoice
+
+config RISCV_ISA_C
+	bool "Compressed extension"
+	help
+	  Add "C" to the ISA subsets that the toolchain is allowed to
+	  emit when building Xen, which results in compressed instructions
+	  in the Xen binary.
+
+	  If unsure, say N.
+
+endmenu
+
+source "common/Kconfig"
+
+source "drivers/Kconfig"
diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/Rules.mk b/xen/arch/riscv/Rules.mk
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
new file mode 100644
index 0000000000..53dadb8975
--- /dev/null
+++ b/xen/arch/riscv/arch.mk
@@ -0,0 +1,14 @@
+########################################
+# RISCV-specific definitions
+
+CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
+
+riscv-march-$(CONFIG_RISCV_ISA_RV64IMA) := rv64ima
+riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+
+# Note that -mcmodel=medany is used so that Xen can be mapped
+# into the upper half _or_ the lower half of the address space.
+# -mcmodel=medlow would force Xen into the lower half.
+
+CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+CFLAGS += -I$(BASEDIR)/include
diff --git a/xen/arch/riscv/asm-offsets.c b/xen/arch/riscv/asm-offsets.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
new file mode 100644
index 0000000000..3c9a2ff941
--- /dev/null
+++ b/xen/arch/riscv/configs/tiny64_defconfig
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
+CONFIG_RISCV_64=y
+CONFIG_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_EXPERT=y
diff --git a/xen/arch/riscv/head.S b/xen/arch/riscv/head.S
new file mode 100644
index 0000000000..0dbc27ba75
--- /dev/null
+++ b/xen/arch/riscv/head.S
@@ -0,0 +1,6 @@
+#include <asm/config.h>
+
+        .text
+
+ENTRY(start)
+        j  start
diff --git a/xen/include/asm-riscv/config.h b/xen/include/asm-riscv/config.h
new file mode 100644
index 0000000000..e2ae21de61
--- /dev/null
+++ b/xen/include/asm-riscv/config.h
@@ -0,0 +1,47 @@
+#ifndef __RISCV_CONFIG_H__
+#define __RISCV_CONFIG_H__
+
+#if defined(CONFIG_RISCV_64)
+# define LONG_BYTEORDER 3
+# define ELFSIZE 64
+# define MAX_VIRT_CPUS 128u
+#else
+# error "Unsupported RISCV variant"
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
+#define CONFIG_RISCV_L1_CACHE_SHIFT 6
+#define CONFIG_PAGEALLOC_MAX_ORDER  18
+#define CONFIG_DOMU_MAX_ORDER       9
+#define CONFIG_HWDOM_MAX_ORDER      10
+
+#define OPT_CONSOLE_STR "dtuart"
+#define INVALID_VCPU_ID MAX_VIRT_CPUS
+
+/* Linkage for RISCV */
+#ifdef __ASSEMBLY__
+#define ALIGN .align 2
+
+#define ENTRY(name)                                \
+  .globl name;                                     \
+  ALIGN;                                           \
+  name:
+#endif
+
+#endif /* __RISCV_CONFIG_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.31.1


