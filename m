Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A451813A
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 11:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319344.539595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozW-0006LH-6Y; Tue, 03 May 2022 09:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319344.539595; Tue, 03 May 2022 09:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozW-0006Ib-2Y; Tue, 03 May 2022 09:38:46 +0000
Received: by outflank-mailman (input) for mailman id 319344;
 Tue, 03 May 2022 09:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1P+g=VL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nlozU-0005vC-8H
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 09:38:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d2048c21-cac4-11ec-a406-831a346695d4;
 Tue, 03 May 2022 11:38:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29029143D;
 Tue,  3 May 2022 02:38:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71AB23F73D;
 Tue,  3 May 2022 02:38:41 -0700 (PDT)
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
X-Inumbo-ID: d2048c21-cac4-11ec-a406-831a346695d4
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: Add sb instruction support
Date: Tue,  3 May 2022 10:38:31 +0100
Message-Id: <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651570561.git.bertrand.marquis@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is adding sb instruction support when it is supported by a
CPU on arm64.
To achieve this, the "sb" macro is moved to sub-arch macros.h so that we
can use sb instruction when available through alternative on arm64 and
keep the current behaviour on arm32.
A new cpuerrata capability is introduced to enable the alternative
code for sb when the support is detected using isa64 coprocessor
register.
The sb instruction is encoded using its hexadecimal value.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpuerrata.c                | 14 ++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  8 ++++++++
 xen/arch/arm/include/asm/arm64/macros.h | 18 ++++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h   |  3 ++-
 xen/arch/arm/include/asm/macros.h       |  9 ---------
 5 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index ae649d16ef..e744abe800 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -458,6 +458,13 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
 }
 #endif
 
+#ifdef CONFIG_ARM_64
+static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.isa64.sb;
+}
+#endif
+
 #define MIDR_RANGE(model, min, max)     \
     .matches = is_affected_midr_range,  \
     .midr_model = model,                \
@@ -674,6 +681,13 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .capability = ARM64_WORKAROUND_AT_SPECULATE,
         MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
     },
+#ifdef CONFIG_ARM_64
+    {
+        .desc = "Speculation barrier (SB)",
+        .capability = ARM64_HAS_SB,
+        .matches = has_sb_instruction,
+    },
+#endif
     {},
 };
 
diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
index a4e20aa520..cf0ddad52b 100644
--- a/xen/arch/arm/include/asm/arm32/macros.h
+++ b/xen/arch/arm/include/asm/arm32/macros.h
@@ -5,4 +5,12 @@
         mov     pc, lr
     .endm
 
+    /*
+     * Speculative barrier
+     */
+    .macro sb
+    dsb nsh
+    isb
+    .endm
+
 #endif /* __ASM_ARM_ARM32_MACROS_H */
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 140e223b4c..e639cec400 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -1,6 +1,24 @@
 #ifndef __ASM_ARM_ARM64_MACROS_H
 #define __ASM_ARM_ARM64_MACROS_H
 
+#include <asm/alternative.h>
+
+    /*
+     * Speculative barrier
+     */
+    .macro sb
+alternative_if_not ARM64_HAS_SB
+    dsb nsh
+    isb
+alternative_else
+/*
+ * SB encoding as given in chapter C6.2.264 of ARM ARM (DDI 0487H.a).
+ */
+    .inst 0xd50330ff
+    nop
+alternative_endif
+    .endm
+
     /*
      * @dst: Result of get_cpu_info()
      */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 4719de47f3..9370805900 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -67,8 +67,9 @@
 #define ARM_WORKAROUND_BHB_LOOP_24 13
 #define ARM_WORKAROUND_BHB_LOOP_32 14
 #define ARM_WORKAROUND_BHB_SMCC_3 15
+#define ARM64_HAS_SB 16
 
-#define ARM_NCAPS           16
+#define ARM_NCAPS           17
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/asm/macros.h
index 1aa373760f..91ea3505e4 100644
--- a/xen/arch/arm/include/asm/macros.h
+++ b/xen/arch/arm/include/asm/macros.h
@@ -5,15 +5,6 @@
 # error "This file should only be included in assembly file"
 #endif
 
-    /*
-     * Speculative barrier
-     * XXX: Add support for the 'sb' instruction
-     */
-    .macro sb
-    dsb nsh
-    isb
-    .endm
-
 #if defined (CONFIG_ARM_32)
 # include <asm/arm32/macros.h>
 #elif defined(CONFIG_ARM_64)
-- 
2.25.1


