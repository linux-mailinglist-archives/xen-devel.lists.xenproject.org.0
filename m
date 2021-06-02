Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C783C398DF6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136078.252504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSUa-0002Wg-L2; Wed, 02 Jun 2021 15:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136078.252504; Wed, 02 Jun 2021 15:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSUa-0002Sl-HU; Wed, 02 Jun 2021 15:09:12 +0000
Received: by outflank-mailman (input) for mailman id 136078;
 Wed, 02 Jun 2021 15:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loSUY-0001oH-Mt
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:09:10 +0000
Received: from mail-ot1-x32c.google.com (unknown [2607:f8b0:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebce3ce2-2b4a-473e-9997-11237b2b5212;
 Wed, 02 Jun 2021 15:09:04 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 h19-20020a9d6f930000b02903c0c4560e99so2729671otq.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 08:09:04 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id e29sm25287oiy.53.2021.06.02.08.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:09:03 -0700 (PDT)
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
X-Inumbo-ID: ebce3ce2-2b4a-473e-9997-11237b2b5212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7wXnoCWLDx7IQREahGv6BGDyqktjGf6yjBgrAWmplI=;
        b=dFj4sTASo4fYEOIPGgyNyZzFb60dHRKTCym915IFPJc7+6zqJF8n3CWo3rb4FVdZYd
         x7vut7ldrlhsi/e/BBlPObmdUfoI17UvEcAil+i/VqulcmPuP2LNRSZ4JFAv4Asbqp1k
         pmfCenfqHaQduIS2MmVPytOJhTha9EmBDtFxv49gvGKQjCqRhdIlxqK6u6hw2eh5lfdd
         zzmPd0//+oPcb6TnolQn3PZw+kBH91RojWoo2omF1XGtCEfuJ3PeZ3Fzc98ev8j9ec1T
         I65oyujx7vmPQNSYqkyvROXL84kTdgnS0oHejFeutIJEldZyX4gDpwH71xs1UB7oEe7n
         urGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7wXnoCWLDx7IQREahGv6BGDyqktjGf6yjBgrAWmplI=;
        b=T4WuUgSnXrRdgHB3SEw2ps3xIgmtPDB9KFttrbT8aGFMXIU4N0PwStO3p50ZXXDvyZ
         m/e1bycJbbf2b5e3ufoNUQwyubMb33O/LYzVL+PnMYvrUqRG2RkKML9QutfCeSq8rA9U
         Xe8JHuFBV5S2iEPiEtXAiTP2GsHM0LwilQVQ0+xMyIPSSDeQVfV0ZHcp9TolXdyDMp4E
         /1RlsUAsC9rkZkY0isamzcDQJjbC3kEwjyfUTz28DdLzCDfQFmd0/GAFYbljpJai2vuD
         xDt/O5TLPtGT8E/cTDZfOGbfEkZUYbGIKIYXWqAB1nZCcuRfqEZgdeS2NIgGQqDBo7ST
         gHsg==
X-Gm-Message-State: AOAM533JQzgokL9nuSQoPc8C00lC89KCyqBIVpsOHSpQiy11i+ya8t6x
	RkNa15ketgKsuYjOVPHQNq8cLAWX8Kovow==
X-Google-Smtp-Source: ABdhPJyzas22Hcmg5hLVbfL0rGAEcBh7pHsLWfn/TD//YITzbDc5sZbEfOvQW1B1p12JeK4xaRHG2w==
X-Received: by 2002:a9d:6756:: with SMTP id w22mr14209050otm.369.1622646544071;
        Wed, 02 Jun 2021 08:09:04 -0700 (PDT)
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
Subject: [PATCH v5 2/2] xen: Add files needed for minimal riscv build
Date: Wed,  2 Jun 2021 09:08:28 -0600
Message-Id: <97ae93649f0a4366d6957f3b56d43a522ac21685.1622645816.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622645816.git.connojdavis@gmail.com>
References: <cover.1622645816.git.connojdavis@gmail.com>
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


