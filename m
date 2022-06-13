Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573D54854B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 14:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348244.574537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jZP-0001TA-DB; Mon, 13 Jun 2022 12:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348244.574537; Mon, 13 Jun 2022 12:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jZP-0001M8-8s; Mon, 13 Jun 2022 12:53:27 +0000
Received: by outflank-mailman (input) for mailman id 348244;
 Mon, 13 Jun 2022 12:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1o0jZO-0001JY-13
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 12:53:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d008da88-eb17-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 14:53:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 903221480;
 Mon, 13 Jun 2022 05:53:24 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9FB73F792;
 Mon, 13 Jun 2022 05:53:23 -0700 (PDT)
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
X-Inumbo-ID: d008da88-eb17-11ec-8901-93a377f238d6
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/4] xen/arm: Add sb instruction support
Date: Mon, 13 Jun 2022 13:53:12 +0100
Message-Id: <7fa3bf8fc27bac120e28092c8c4081d1e58f0b79.1655124548.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655124548.git.bertrand.marquis@arm.com>
References: <cover.1655124548.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is adding sb instruction support when it is supported by a
CPU on arm64.
A new cpu feature capability system is introduced to enable alternative
code using sb instruction when it is supported by the processor. This is
decided based on the isa64 system register value and use a new hardware
capability ARM_HAS_SB.

The sb instruction is encoded using its hexadecimal value to avoid
recursive macro and support old compilers not having support for sb
instruction.

Arm32 instruction support is added but it is not enabled at the moment
due to the lack of hardware supporting it.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
- rename ARM64_HAS_SB to ARM_HAS_SB
- define sb before including per arch macros
Changes in v2:
- fix commit message
- add comment to explain the extra nop
- add support for arm32 and move macro back to arm generic header
- fix macro comment indentation
- introduce cpu feature system instead of using errata
---
 xen/arch/arm/cpufeature.c             | 28 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h |  6 +++++-
 xen/arch/arm/include/asm/macros.h     | 19 +++++++++++++++++-
 xen/arch/arm/setup.c                  |  3 +++
 xen/arch/arm/smpboot.c                |  1 +
 5 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index a58965f7b9..62d5e1770a 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -26,6 +26,24 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
 struct cpuinfo_arm __read_mostly guest_cpuinfo;
 
+#ifdef CONFIG_ARM_64
+static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.isa64.sb;
+}
+#endif
+
+static const struct arm_cpu_capabilities arm_features[] = {
+#ifdef CONFIG_ARM_64
+    {
+        .desc = "Speculation barrier instruction (SB)",
+        .capability = ARM_HAS_SB,
+        .matches = has_sb_instruction,
+    },
+#endif
+    {},
+};
+
 void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
                              const char *info)
 {
@@ -70,6 +88,16 @@ void __init enable_cpu_capabilities(const struct arm_cpu_capabilities *caps)
     }
 }
 
+void check_local_cpu_features(void)
+{
+    update_cpu_capabilities(arm_features, "enabled support for");
+}
+
+void __init enable_cpu_features(void)
+{
+    enable_cpu_capabilities(arm_features);
+}
+
 /*
  * Run through the enabled capabilities and enable() them on the calling CPU.
  * If enabling of any capability fails the error is returned. After enabling a
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index f7368766c0..24c01d2b9d 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -67,8 +67,9 @@
 #define ARM_WORKAROUND_BHB_LOOP_24 13
 #define ARM_WORKAROUND_BHB_LOOP_32 14
 #define ARM_WORKAROUND_BHB_SMCC_3 15
+#define ARM_HAS_SB 16
 
-#define ARM_NCAPS           16
+#define ARM_NCAPS           17
 
 #ifndef __ASSEMBLY__
 
@@ -78,6 +79,9 @@
 
 extern DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
+void check_local_cpu_features(void);
+void enable_cpu_features(void);
+
 static inline bool cpus_have_cap(unsigned int num)
 {
     if ( num >= ARM_NCAPS )
diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/asm/macros.h
index 1aa373760f..dc791245df 100644
--- a/xen/arch/arm/include/asm/macros.h
+++ b/xen/arch/arm/include/asm/macros.h
@@ -5,13 +5,30 @@
 # error "This file should only be included in assembly file"
 #endif
 
+#include <asm/alternative.h>
+
     /*
      * Speculative barrier
-     * XXX: Add support for the 'sb' instruction
      */
     .macro sb
+alternative_if_not ARM_HAS_SB
     dsb nsh
     isb
+alternative_else
+    /*
+     * SB encoding in hexadecimal to prevent recursive macro.
+     * extra nop is required to keep same number of instructions on both sides
+     * of the alternative.
+     */
+#if defined(CONFIG_ARM_32)
+    .inst 0xf57ff070
+#elif defined(CONFIG_ARM_64)
+    .inst 0xd50330ff
+#else
+#   error "missing sb encoding for ARM variant"
+#endif
+    nop
+alternative_endif
     .endm
 
 #if defined (CONFIG_ARM_32)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6016471d37..577c54e6fb 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -964,6 +964,8 @@ void __init start_xen(unsigned long boot_phys_offset,
      */
     check_local_cpu_errata();
 
+    check_local_cpu_features();
+
     init_xen_time();
 
     gic_init();
@@ -1033,6 +1035,7 @@ void __init start_xen(unsigned long boot_phys_offset,
      */
     apply_alternatives_all();
     enable_errata_workarounds();
+    enable_cpu_features();
 
     /* Create initial domain 0. */
     if ( !is_dom0less_mode() )
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 22fede6600..3f62f3a44f 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -395,6 +395,7 @@ void start_secondary(void)
     local_abort_enable();
 
     check_local_cpu_errata();
+    check_local_cpu_features();
 
     printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
 
-- 
2.25.1


