Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A338101B
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 20:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127490.239642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcx8-00036O-IX; Fri, 14 May 2021 18:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127490.239642; Fri, 14 May 2021 18:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcx8-000328-CH; Fri, 14 May 2021 18:54:26 +0000
Received: by outflank-mailman (input) for mailman id 127490;
 Fri, 14 May 2021 18:54:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhcx6-0001R5-IQ
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 18:54:24 +0000
Received: from mail-il1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cdc3d92-352d-4bb1-a4c9-206b3234064f;
 Fri, 14 May 2021 18:54:09 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id p15so617921iln.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 11:54:09 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d81sm2815190iof.26.2021.05.14.11.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:54:08 -0700 (PDT)
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
X-Inumbo-ID: 1cdc3d92-352d-4bb1-a4c9-206b3234064f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zIAC1xDVnT0fSpVJ2YCItiTMjfHRx3z5TUS+XXT8py4=;
        b=SHx4dDseUJs48OcZHLFxbEPAs0NXzTtBpoMGJJh8LN9ACY41pUxnOiSaL2RlP9GLHf
         x9VJXeoYaq8ZgC//KRQqIRKWtm/gyH7kqTuMf/MT0YSo8FlTKgJJfUKuGPftvTdFyKP9
         qPy91+zeECVbVSQiqSX60ahLxwR21Y5sF53fPxIo3QWjONQ9xWvmWfBEuxarh2iwvL5z
         aodttAL7pj0rwHejpLmZaBBYU2O6+OvV5eHDpbvS22UTFHAFb4JwQduPkE5W+GUIKtPs
         g2e+GiGVWsmG0tFNVwG+7+ZN/X/W1fMmABiFM4B45RQOU8mAT11ert1NrEVNJdMSTzbs
         slGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zIAC1xDVnT0fSpVJ2YCItiTMjfHRx3z5TUS+XXT8py4=;
        b=QGOx4peHazxNy/deSuSmWf3GlHF4B2xFQ4z+xr79c9isFLVeOufgTqxSIx+KQnkasJ
         to0fY0C7ou2ZkWIucx+nDM5T1WVWJfIhn5mEirdeD6Ypj369H1bbYa6Lg3lnC2SDwXJQ
         Mlr2OQsVd/cBTfoqZVqYu8l4V874WNiS8YGD9EnAzEqjXIktgbYP2iGOGWDTkvcKoZwV
         yPC6nJyXiC3+dhoCVF1TOk3IgNan/xuK2Oxk4zOQ2+mSQusSQYa13i+PrATLXH+umHSw
         4exa+inglhmdpAg81dsmd/gME50CY9lirGZ6WK9bHYnncOWbQyHri1hEWjGMtlyIJOtA
         47vQ==
X-Gm-Message-State: AOAM53252RUeh8v/yuvJQZZSzNtit+cJ1Y9PduwxSCa050TnGODBV7at
	UCR+fy/9F8Qc2eRn1xjk4Xs5y2NOuukoPA==
X-Google-Smtp-Source: ABdhPJyE0Ge3YTrYbl06lpF4QsFq/fv7XLOHq2YIzGyA33haC3A+jAD9yRkfi1RApvOFQeKqy1FNSw==
X-Received: by 2002:a92:4a0a:: with SMTP id m10mr6156291ilf.118.1621018448468;
        Fri, 14 May 2021 11:54:08 -0700 (PDT)
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
Subject: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
Date: Fri, 14 May 2021 12:53:24 -0600
Message-Id: <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621017334.git.connojdavis@gmail.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add arch-specific makefiles and configs needed to build for
riscv64. Also add a minimal head.S that is a simple infinite loop.
head.o can be built with

$ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=head.o

No other TARGET is supported at the moment.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 config/riscv64.mk                        |   5 ++
 xen/Makefile                             |   8 +-
 xen/arch/riscv/Kconfig                   |  52 +++++++++++
 xen/arch/riscv/Kconfig.debug             |   0
 xen/arch/riscv/Makefile                  |   0
 xen/arch/riscv/Rules.mk                  |   0
 xen/arch/riscv/arch.mk                   |  16 ++++
 xen/arch/riscv/asm-offsets.c             |   0
 xen/arch/riscv/configs/riscv64_defconfig |  12 +++
 xen/arch/riscv/head.S                    |   6 ++
 xen/include/asm-riscv/config.h           | 110 +++++++++++++++++++++++
 11 files changed, 207 insertions(+), 2 deletions(-)
 create mode 100644 config/riscv64.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/asm-offsets.c
 create mode 100644 xen/arch/riscv/configs/riscv64_defconfig
 create mode 100644 xen/arch/riscv/head.S
 create mode 100644 xen/include/asm-riscv/config.h

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
index 9f3be7766d..60de4cc6cd 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -26,7 +26,9 @@ MAKEFLAGS += -rR
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
 ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
+SRCARCH=$(shell echo $(ARCH) | \
+	  sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+	      -e s'/riscv.*/riscv/g')
 
 # Don't break if the build process wasn't called from the top level
 # we need XEN_TARGET_ARCH to generate the proper config
@@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
 # Set ARCH/SUBARCH appropriately.
 export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
-                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
+                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+			        -e s'/riscv.*/riscv/g')
 
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
index 0000000000..d4bbd4294e
--- /dev/null
+++ b/xen/arch/riscv/Kconfig
@@ -0,0 +1,52 @@
+config 64BIT
+	bool
+
+config RISCV_64
+	bool
+	depends on 64BIT
+
+config RISCV
+	def_bool y
+
+config ARCH_DEFCONFIG
+	string
+	default "arch/riscv/configs/riscv64_defconfig" if RISCV_64
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
+        default RISCV_ISA_RV64IMA
+        help
+          This selects the base ISA extensions that Xen will target.
+
+config RISCV_ISA_RV64IMA
+	bool "RV64IMA"
+        select 64BIT
+        select RISCV_64
+        help
+           Use the RV64I base ISA, plus the "M" and "A" extensions
+           for integer multiply/divide and atomic instructions, respectively.
+
+endchoice
+
+config RISCV_ISA_C
+	bool "Compressed extension"
+        help
+           Add "C" to the ISA subsets that the toolchain is allowed
+           to emit when building Xen, which results in compressed
+           instructions in the Xen binary.
+
+           If unsure, say N.
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
index 0000000000..10229c5440
--- /dev/null
+++ b/xen/arch/riscv/arch.mk
@@ -0,0 +1,16 @@
+########################################
+# RISCV-specific definitions
+
+ifeq ($(CONFIG_RISCV_64),y)
+    CFLAGS += -mabi=lp64
+endif
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
diff --git a/xen/arch/riscv/configs/riscv64_defconfig b/xen/arch/riscv/configs/riscv64_defconfig
new file mode 100644
index 0000000000..664a5d2378
--- /dev/null
+++ b/xen/arch/riscv/configs/riscv64_defconfig
@@ -0,0 +1,12 @@
+# CONFIG_SCHED_CREDIT is not set
+# CONFIG_SCHED_RTDS is not set
+# CONFIG_SCHED_NULL is not set
+# CONFIG_SCHED_ARINC653 is not set
+# CONFIG_TRACEBUFFER is not set
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_HYPFS is not set
+# CONFIG_GRANT_TABLE is not set
+# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+
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
index 0000000000..84cb436dc1
--- /dev/null
+++ b/xen/include/asm-riscv/config.h
@@ -0,0 +1,110 @@
+/******************************************************************************
+ * config.h
+ *
+ * A Linux-style configuration list.
+ */
+
+#ifndef __RISCV_CONFIG_H__
+#define __RISCV_CONFIG_H__
+
+#if defined(CONFIG_RISCV_64)
+# define LONG_BYTEORDER 3
+# define ELFSIZE 64
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
+#define CONFIG_RISCV 1
+#define CONFIG_RISCV_L1_CACHE_SHIFT 6
+
+#define CONFIG_PAGEALLOC_MAX_ORDER 18
+#define CONFIG_DOMU_MAX_ORDER      9
+#define CONFIG_HWDOM_MAX_ORDER     10
+
+#define OPT_CONSOLE_STR "dtuart"
+
+#ifdef CONFIG_RISCV_64
+#define MAX_VIRT_CPUS 128u
+#else
+#error "Unsupported RISCV variant"
+#endif
+
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
+#include <xen/const.h>
+
+#ifdef CONFIG_RISCV_64
+
+/*
+ * RISC-V Layout:
+ *   0x0000000000000000 - 0x0000003fffffffff (256GB, L2 slots [0-255])
+ *     Unmapped
+ *   0x0000004000000000 - 0xffffffbfffffffff
+ *     Inaccessible: sv39 only supports 39-bit sign-extended VAs.
+ *   0xffffffc000000000 - 0xffffffc0001fffff (2MB, L2 slot [256])
+ *     Unmapped
+ *   0xffffffc000200000 - 0xffffffc0003fffff (2MB, L2 slot [256])
+ *     Xen text, data, bss
+ *   0xffffffc000400000 - 0xffffffc0005fffff (2MB, L2 slot [256])
+ *     Fixmap: special-purpose 4K mapping slots
+ *   0xffffffc000600000 - 0xffffffc0009fffff (4MB, L2 slot [256])
+ *     Early boot mapping of FDT
+ *   0xffffffc000a00000 - 0xffffffc000bfffff (2MB, L2 slot [256])
+ *     Early relocation address, used when relocating Xen and later
+ *     for livepatch vmap (if compiled in)
+ *   0xffffffc040000000 - 0xffffffc07fffffff (1GB, L2 slot [257])
+ *     VMAP: ioremap and early_ioremap
+ *   0xffffffc080000000 - 0xffffffc13fffffff (3GB, L2 slots [258..260])
+ *     Unmapped
+ *   0xffffffc140000000 - 0xffffffc1bfffffff (2GB, L2 slots [261..262])
+ *     Frametable: 48 bytes per page for 133GB of RAM
+ *   0xffffffc1c0000000 - 0xffffffe1bfffffff (128GB, L2 slots [263..390])
+ *     1:1 direct mapping of RAM
+ *   0xffffffe1c0000000 - 0xffffffffffffffff (121GB, L2 slots [391..511])
+ *     Unmapped
+ */
+
+#define L2_ENTRY_BITS  30
+#define L2_ENTRY_BYTES (_AC(1,UL) << L2_ENTRY_BITS)
+#define L2_ADDR(_slot)                                      \
+    (((_AC(_slot, UL) >> 8) * _AC(0xffffff8000000000,UL)) | \
+     (_AC(_slot, UL) << L2_ENTRY_BITS))
+
+#define XEN_VIRT_START         _AT(vaddr_t, L2_ADDR(256) + MB(2))
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#define FRAMETABLE_VIRT_START  _AT(vaddr_t, L2_ADDR(261))
+
+#endif /* CONFIG_RISCV_64 */
+
+#define STACK_ORDER            3
+#define STACK_SIZE             (PAGE_SIZE << STACK_ORDER)
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


