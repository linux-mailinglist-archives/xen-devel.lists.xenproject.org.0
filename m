Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6AC9F511E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859439.1271607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVM-0002Or-L2; Tue, 17 Dec 2024 16:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859439.1271607; Tue, 17 Dec 2024 16:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVM-0002K9-F2; Tue, 17 Dec 2024 16:33:04 +0000
Received: by outflank-mailman (input) for mailman id 859439;
 Tue, 17 Dec 2024 16:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVK-0001JJ-Ry
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:33:02 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955e1109-bc94-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 17:33:02 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54025432becso5484100e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:33:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:32:59 -0800 (PST)
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
X-Inumbo-ID: 955e1109-bc94-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453181; x=1735057981; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDLe4QiaYJ6sYZAezMpOMgRYt5MBs/UEumukv4Av87A=;
        b=Ma/d7+UC8b5gzgfCxlP1Cf+kOEJ38lA8liQQ8ZOtzlH4I36o3M0P5WniV63dM5yx5i
         iRomXI3znVfE+fV1hFgk4N+X8X7swbdstXqZuc4aVNAE5fKQn0YA8BcvKHW0FmPRmmi9
         X8dX9nnGZqSXNM4f6S/6F3wrlaZ12rZv5qgHGDZGHgxj1PSvDLDK5ctCvxJl0n4cEW5V
         mFkX8Hv8M9qUdj0F6gaiyFTT6f00hSSMvO1x4ypNMMOPBp58rY+ch0rVgPTgKeFg/xzQ
         02Q4+aVfiYz+9LDl2QopLsD7vXJJXQFV98860L4rhsnaouFOpionb0nRMcljHS7MfFt8
         RVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453181; x=1735057981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDLe4QiaYJ6sYZAezMpOMgRYt5MBs/UEumukv4Av87A=;
        b=QuRcUbGBaUKUPxAxI59dhyBQiv7cNhuv/K8+3+H/Xx11Lux5qdxEwUnfjUatSWgVH1
         ojMFIW4UwH3wlUcqNxs4vMHrWJ3chDoFMOBZHkyle61f2ncBqPGeMFeDVuDv3rh5L9bN
         cWTwYm5c951Y6tSIF/3E6u5xbMBhh2P52sk6UcY5mJ7Wyv07cUruoWaH0+afr0NuYEAT
         bB7SuhYktHUXWZgVe/TAbXfMVZco1KKjQ9TjDFJjXYM0J8rvWdb4oltv/iRnZbXV8Yrz
         vdv8Zx+X/hni+WWRRZ+0sDzX6NGUZolZsras9fO/PGG5ni7UWOdjgdSYgxOXu478/bZY
         RSsw==
X-Gm-Message-State: AOJu0Yxr1kTsRRQS3KLT+ZX03wANc7kKgpXOkQEXEAHmwU3jWlgRQPHZ
	YMF4X7QLBEhjkuMunz+YrXbCg0NTiucMBvZ/Jorvl+NQKw3dk34Y+/W5GgHZ
X-Gm-Gg: ASbGncs8w8YwU0MdMkNavGZKYeqg+1JqpVbOtzE+0S2QDVtuoXBgmA9280RRC1Jrcxw
	qYR+hJaL+rfsdf9aqppc/0dYy7JzWLyzXVtUd/RKm4SjeQ6tChKucANsCJqzJW/OY+zkY1pfeI7
	BZSpwC4g/CdssGQDzq19jjsMbpiA7EfDHKAy9LGnIkQY7hc8L9valuqOjD76cDZRsaQVDHY0inE
	0X1ySrjAeN0hHve3eFQgO1kM7ARUCO470+XUi5QWNNMnWNkQKVwz5ipbw==
X-Google-Smtp-Source: AGHT+IEPdci0ZNKck0TR0jo+A9MEoe5I81wJpKKE3dfSNwXYi/lMMdJyaI+LG2wOlwpsvEuylqdVjA==
X-Received: by 2002:a05:6512:3b26:b0:53e:350a:72a0 with SMTP id 2adb3069b0e04-54099b69aabmr6290771e87.51.1734453180798;
        Tue, 17 Dec 2024 08:33:00 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/7] xen/riscv: implement data and instruction cache operations
Date: Tue, 17 Dec 2024 17:32:49 +0100
Message-ID: <33cf536f15356db894be5bde557060585cc2e410.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement following cache operations:
- clean_and_invalidate_dcache_va_range()
- clean_dcache_va_range()
- invalidate_icache()

The first two functions may require support for the CMO (Cache Management
Operations) extension and/or hardware-specific instructions.
Currently, only QEMU is supported, which does not model cache behavior.
Therefore, clean_and_invalidate_dcache_va_range() and clean_dcache_va_range()
are implemented to simply return 0. For other cases, generate compilation error
so a user won't miss to update this function if necessery.
If hardware supports CMO or hardware-specific instructions, these functions
should be updated accordingly. To support current implementation of these
function CONFIG_QEMU_PLATFORM is introduced.

invalidate_icache() is implemented using fence.i instruction as
mentioned in the unpriv spec:
  The FENCE.I instruction was designed to support a wide variety of
  implementations. A simple implementation can flush the local instruction
  cache and the instruction pipeline when the FENCE.I is executed.
  A more complex implementation might snoop the instruction (data) cache
  on every data (instruction) cache miss, or use an inclusive unified
  private L2 cache to invalidate lines from the primary instruction cache
  when they are being written by a local store instruction.
  If instruction and data caches are kept coherent in this way, or if the
  memory system consists of only uncached RAMs, then just the fetch pipeline
  needs to be flushed at a FENCE.I.
The FENCE.I instruction requires the presence of the Zifencei extension,
which might not always be available. However, Xen uses the RV64G ISA, which
guarantees the presence of the Zifencei extension. According to the
unprivileged ISA specification (version 20240411):
  One goal of the RISC-V project is that it be used as a stable software
  development target. For this purpose, we define a combination of a base ISA
  (RV32I or RV64I) plus selected standard extensions (IMAFD, Zicsr, Zifencei)
  as a "general-purpose" ISA, and we use the abbreviation G for the
  IMAFDZicsr_Zifencei combination of instruction-set extensions.

Set CONFIG_QEMU_PLATFORM=y in tiny64_defconfig to have proper implemtation of
clean_and_invalidate_dcache_va_range() and clean_dcache_va_range() for CI.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Updates for config QEMU:
   - Rename CONFIG_QEMU to CONFIG_QEMU_PLATFORM.
   - Drop "depends on RISCV_64" property for Config QEMU_PLATFORM.
   - Split help string.
 - Update implementation of the functions: clean_and_invalidate_dcache_va_range()
   and clean_dcache_va_range().
 - Minimal code style fixes: move second argument of clean_and_invalidate_dcache_va_range()
   to next line.
 - Update the commit message.
---
Changes in V2:
 - Update the commit message and subject:
   - drop information about HAS_CMO;
   - add information about Zifencei extension;
 - Introdce platforms directory and CONFIG_QEMU; update implementation of
   data/instruction cache operations as returning 0 for CONFIG_QEMU and for
   others - return -ENOTSUPP.
 - Drop HAS_CMO config.
---
 xen/arch/riscv/Kconfig                  |  2 ++
 xen/arch/riscv/configs/tiny64_defconfig |  1 +
 xen/arch/riscv/include/asm/page.h       | 22 +++++++++++++++++++++-
 xen/arch/riscv/platforms/Kconfig        |  5 +++++
 4 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/platforms/Kconfig

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 1858004676..00f329054c 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -52,6 +52,8 @@ config RISCV_ISA_C
 
 endmenu
 
+source "arch/riscv/platforms/Kconfig"
+
 source "common/Kconfig"
 
 source "drivers/Kconfig"
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index fc7a04872f..6af563bd73 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -10,3 +10,4 @@ CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_EXPERT=y
+CONFIG_QEMU_PLATFORM=y
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index bf3f75e85d..c82432dc67 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
+#include <xen/errno.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
@@ -148,9 +149,28 @@ static inline bool pte_is_mapping(pte_t p)
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
 
+static inline int clean_and_invalidate_dcache_va_range(const void *p,
+                                                       unsigned long size)
+{
+#ifndef CONFIG_QEMU_PLATFORM
+    #error "should clean_and_invalidate_dcache_va_range() be updated?"
+#endif
+
+    return 0;
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+#ifndef CONFIG_QEMU_PLATFORM
+    #error "should clean_dcache_va_range() be updated?"
+#endif
+
+    return 0;
+}
+
 static inline void invalidate_icache(void)
 {
-    BUG_ON("unimplemented");
+    asm volatile ( "fence.i" ::: "memory" );
 }
 
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
diff --git a/xen/arch/riscv/platforms/Kconfig b/xen/arch/riscv/platforms/Kconfig
new file mode 100644
index 0000000000..710423a59a
--- /dev/null
+++ b/xen/arch/riscv/platforms/Kconfig
@@ -0,0 +1,5 @@
+config QEMU_PLATFORM
+	bool "QEMU based platform support"
+	help
+	  Enable all the required drivers for QEMU riscv64
+	  virt emulated machine.
-- 
2.47.1


