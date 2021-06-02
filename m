Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150B399647
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136251.252722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaAZ-0002q4-Ua; Wed, 02 Jun 2021 23:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136251.252722; Wed, 02 Jun 2021 23:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaAZ-0002mG-Pt; Wed, 02 Jun 2021 23:21:03 +0000
Received: by outflank-mailman (input) for mailman id 136251;
 Wed, 02 Jun 2021 23:21:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loaAY-00029h-2H
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:21:02 +0000
Received: from mail-oi1-x22d.google.com (unknown [2607:f8b0:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25796a31-9b0a-47e9-a6cc-203c639555f1;
 Wed, 02 Jun 2021 23:20:57 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d21so4371888oic.11
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:20:57 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id h7sm306175oib.49.2021.06.02.16.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 16:20:54 -0700 (PDT)
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
X-Inumbo-ID: 25796a31-9b0a-47e9-a6cc-203c639555f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7wXnoCWLDx7IQREahGv6BGDyqktjGf6yjBgrAWmplI=;
        b=qL6T+IYDMnlwaO6MHJMHo1K3ijLdkUlVWUNRLQ1Hx3tzI+2KdOKpsCnzfwEBsmPsXa
         zZk2BCSF9Ln6qIj/1q2nwHbgjGkXUG2GRXesrIas/ZSyY7atVraGlmtmQFGBBwrHXziN
         mk7aHJwQfcik+zsvd9EyKwZIwxYoHpH0TnFMD1rWdB4cHB7BSw3W2F2g7lBirT0QF0Wf
         5zmo1p1uQJhecYR4r1vrva4OG86jHlegM0IXRtGDD/e6gqKsIF9isQRKwd3GsiPcDUB8
         9YObQTfuYz7D4W1gP6f9GYSvDMRbe0afKEg7kTN4glgIMe44vGeFWep3nV+TlpUvtmMi
         Du8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7wXnoCWLDx7IQREahGv6BGDyqktjGf6yjBgrAWmplI=;
        b=Q2zlAF4K7oKIEIPj9Xh2z5vGHcqs83lAt6EQFl6m0zVp/osPNaY41VHwawrPV7bqN7
         j6A40wtqxEKLuBkV02FIXRLPRQBqrYdxVZ6xJTC9iLfO+fdMhPkJnEg6tfHmPLPe+g0B
         yiu3lSyJtQ3dCBoY8+54joaOyUIsqdke/LwR6opmT1u0I9XQnhROpLA6XSoIwQb3YZ6W
         EoTMMoyHnE1/qULxUj7TyrEeb39YK9E1TfiTn8jM2DAYDiDXHPOuJOe0FLlvqArSMJOQ
         eXRmdEo420rvXzpU1DpRl0vy4HOFiuu6sAO8KTFvbiyd96G3QsUPaueYkpD4FzPfiaii
         LfYQ==
X-Gm-Message-State: AOAM531tiILK77KuefvUUJL5EsPsx77ctU9tHfc0IUtM6w2cYEJAUSl+
	SilBqTbf7+18IcSXmh8fPSwgn5iPS0kXQg==
X-Google-Smtp-Source: ABdhPJy7jQErJRgEkVXaKlWUxYobW+5eP2rkRPBWtrMLLLKUzN59zPAkpOiVmuQR+WnVUVjYAIJlMA==
X-Received: by 2002:aca:f455:: with SMTP id s82mr11834239oih.85.1622676055185;
        Wed, 02 Jun 2021 16:20:55 -0700 (PDT)
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
Subject: [PATCH v6 2/2] xen: Add files needed for minimal riscv build
Date: Wed,  2 Jun 2021 17:20:45 -0600
Message-Id: <d4670a35758df878565cf757bbc20e2815618eb5.1622675569.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622675569.git.connojdavis@gmail.com>
References: <cover.1622675569.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add arch-specific makefiles and configs needed to build for
riscv. Also add a minimal head.S that is a simple infinite loop.
head.o can be built with

$ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen tiny64_defconfig
$ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=riscv64/head.o

No other TARGET is supported at the moment.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
Bob: I moved back to XEN_TARGET_ARCH=riscv64 because supplying
just XEN_TARGET_ARCH=riscv causes TARGET_ARCH == TARGET_SUBARCH, and
that broke the build after the recent commit b6ecd5c8bc
"build: centralize / unify asm-offsets generation". It also deviates
from how x86 and arm work now, so I think this change is for the best
for now. That commit is also why the PHONY include target is added
in the riscv/Makefile.
---
 MAINTAINERS                             |  8 +++++
 config/riscv64.mk                       |  5 +++
 xen/Makefile                            |  8 +++--
 xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
 xen/arch/riscv/Kconfig.debug            |  0
 xen/arch/riscv/Makefile                 |  2 ++
 xen/arch/riscv/Rules.mk                 |  0
 xen/arch/riscv/arch.mk                  | 14 ++++++++
 xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
 xen/arch/riscv/riscv64/asm-offsets.c    |  0
 xen/arch/riscv/riscv64/head.S           |  6 ++++
 xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
 12 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 config/riscv64.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
 create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
 create mode 100644 xen/arch/riscv/riscv64/head.S
 create mode 100644 xen/include/asm-riscv/config.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d46b08a0d2..956e71220d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -456,6 +456,14 @@ F:	tools/libs/light/libxl_nonetbuffer.c
 F:	tools/hotplug/Linux/remus-netbuf-setup
 F:	tools/hotplug/Linux/block-drbd-probe
 
+RISCV
+M:	Bob Eshleman <bobbyeshleman@gmail.com>
+R:	Connor Davis <connojdavis@gmail.com>
+S:	Supported
+F:	config/riscv64.mk
+F:	xen/arch/riscv/
+F:	xen/include/asm-riscv/
+
 RTDS SCHEDULER
 M:	Dario Faggioli <dfaggioli@suse.com>
 M:	Meng Xu <mengxu@cis.upenn.edu>
diff --git a/config/riscv64.mk b/config/riscv64.mk
new file mode 100644
index 0000000000..a5a21e5fa2
--- /dev/null
+++ b/config/riscv64.mk
@@ -0,0 +1,5 @@
+CONFIG_RISCV := y
+CONFIG_RISCV_64 := y
+CONFIG_RISCV_$(XEN_OS) := y
+
+CONFIG_XEN_INSTALL_SUFFIX :=
diff --git a/xen/Makefile b/xen/Makefile
index 7ce7692354..89879fad4c 100644
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
index 0000000000..942e4ffbc1
--- /dev/null
+++ b/xen/arch/riscv/Makefile
@@ -0,0 +1,2 @@
+.PHONY: include
+include:
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
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
new file mode 100644
index 0000000000..0dbc27ba75
--- /dev/null
+++ b/xen/arch/riscv/riscv64/head.S
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


