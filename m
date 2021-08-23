Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3F3F48BB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170313.311129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7H8-0004gQ-Ug; Mon, 23 Aug 2021 10:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170313.311129; Mon, 23 Aug 2021 10:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7H8-0004YR-Pa; Mon, 23 Aug 2021 10:33:54 +0000
Received: by outflank-mailman (input) for mailman id 170313;
 Mon, 23 Aug 2021 10:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mI7H7-0003X5-4B
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 10:33:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 976a3f02-03fd-11ec-a86f-12813bfff9fa;
 Mon, 23 Aug 2021 10:33:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3655813A1;
 Mon, 23 Aug 2021 03:33:44 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86A453F66F;
 Mon, 23 Aug 2021 03:33:43 -0700 (PDT)
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
X-Inumbo-ID: 976a3f02-03fd-11ec-a86f-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/7] xen/arm: Rename cpu_boot_data to system_cpuinfo
Date: Mon, 23 Aug 2021 11:32:12 +0100
Message-Id: <d7c334259b5154ecc36c65c2150b894fca10732e.1629713932.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>

As we will sanitize the content of boot_cpu_data it will not really
contain the boot cpu information but the system sanitize information.
Rename the structure to system_cpuinfo so the user is informed that this
is the system wide available feature and not anymore the features of the
boot cpu.
The original boot cpu data is still available in cpu_data.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v2:
  - patch introduced in v2
---
 xen/arch/arm/cpufeature.c        |  8 ++------
 xen/arch/arm/setup.c             | 34 ++++++++++++++++++--------------
 xen/arch/arm/smpboot.c           |  6 +++---
 xen/include/asm-arm/cpufeature.h |  6 +++---
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1d88783809..f600a611bd 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -169,12 +169,8 @@ void identify_cpu(struct cpuinfo_arm *c)
  */
 static int __init create_guest_cpuinfo(void)
 {
-    /*
-     * TODO: The code is currently using only the features detected on the boot
-     * core. In the long term we should try to compute values containing only
-     * features supported by all cores.
-     */
-    guest_cpuinfo = boot_cpu_data;
+    /* Use the sanitized cpuinfo as initial guest cpuinfo */
+    guest_cpuinfo = system_cpuinfo;
 
 #ifdef CONFIG_ARM_64
     /* Hide MPAM support as xen does not support it */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 63a908e325..3798c5ade0 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -56,7 +56,11 @@
 
 struct bootinfo __initdata bootinfo;
 
-struct cpuinfo_arm __read_mostly boot_cpu_data;
+/*
+ * Sanitized version of cpuinfo containing only features available on all
+ * cores (only on arm64 as there is no sanitization support on arm32).
+ */
+struct cpuinfo_arm __read_mostly system_cpuinfo;
 
 #ifdef CONFIG_ACPI
 bool __read_mostly acpi_disabled;
@@ -100,7 +104,7 @@ static const char * __initdata processor_implementers[] = {
 static void __init processor_id(void)
 {
     const char *implementer = "Unknown";
-    struct cpuinfo_arm *c = &boot_cpu_data;
+    struct cpuinfo_arm *c = &system_cpuinfo;
 
     identify_cpu(c);
     current_cpu_data = *c;
@@ -120,7 +124,7 @@ static void __init processor_id(void)
 #if defined(CONFIG_ARM_64)
     printk("64-bit Execution:\n");
     printk("  Processor Features: %016"PRIx64" %016"PRIx64"\n",
-           boot_cpu_data.pfr64.bits[0], boot_cpu_data.pfr64.bits[1]);
+           system_cpuinfo.pfr64.bits[0], system_cpuinfo.pfr64.bits[1]);
     printk("    Exception Levels: EL3:%s EL2:%s EL1:%s EL0:%s\n",
            cpu_has_el3_32 ? "64+32" : cpu_has_el3_64 ? "64" : "No",
            cpu_has_el2_32 ? "64+32" : cpu_has_el2_64 ? "64" : "No",
@@ -144,13 +148,13 @@ static void __init processor_id(void)
                boot_cpu_feature64(simd));
 
     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
-           boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
+           system_cpuinfo.dbg64.bits[0], system_cpuinfo.dbg64.bits[1]);
     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
-           boot_cpu_data.aux64.bits[0], boot_cpu_data.aux64.bits[1]);
+           system_cpuinfo.aux64.bits[0], system_cpuinfo.aux64.bits[1]);
     printk("  Memory Model Features: %016"PRIx64" %016"PRIx64"\n",
-           boot_cpu_data.mm64.bits[0], boot_cpu_data.mm64.bits[1]);
+           system_cpuinfo.mm64.bits[0], system_cpuinfo.mm64.bits[1]);
     printk("  ISA Features:  %016"PRIx64" %016"PRIx64"\n",
-           boot_cpu_data.isa64.bits[0], boot_cpu_data.isa64.bits[1]);
+           system_cpuinfo.isa64.bits[0], system_cpuinfo.isa64.bits[1]);
 #endif
 
     /*
@@ -161,7 +165,7 @@ static void __init processor_id(void)
     {
         printk("32-bit Execution:\n");
         printk("  Processor Features: %"PRIregister":%"PRIregister"\n",
-               boot_cpu_data.pfr32.bits[0], boot_cpu_data.pfr32.bits[1]);
+               system_cpuinfo.pfr32.bits[0], system_cpuinfo.pfr32.bits[1]);
         printk("    Instruction Sets:%s%s%s%s%s%s\n",
                cpu_has_aarch32 ? " AArch32" : "",
                cpu_has_arm ? " A32" : "",
@@ -174,18 +178,18 @@ static void __init processor_id(void)
                cpu_has_security ? " Security" : "");
 
         printk("  Debug Features: %"PRIregister"\n",
-               boot_cpu_data.dbg32.bits[0]);
+               system_cpuinfo.dbg32.bits[0]);
         printk("  Auxiliary Features: %"PRIregister"\n",
-               boot_cpu_data.aux32.bits[0]);
+               system_cpuinfo.aux32.bits[0]);
         printk("  Memory Model Features: %"PRIregister" %"PRIregister"\n"
                "                         %"PRIregister" %"PRIregister"\n",
-               boot_cpu_data.mm32.bits[0], boot_cpu_data.mm32.bits[1],
-               boot_cpu_data.mm32.bits[2], boot_cpu_data.mm32.bits[3]);
+               system_cpuinfo.mm32.bits[0], system_cpuinfo.mm32.bits[1],
+               system_cpuinfo.mm32.bits[2], system_cpuinfo.mm32.bits[3]);
         printk("  ISA Features: %"PRIregister" %"PRIregister" %"PRIregister"\n"
                "                %"PRIregister" %"PRIregister" %"PRIregister"\n",
-               boot_cpu_data.isa32.bits[0], boot_cpu_data.isa32.bits[1],
-               boot_cpu_data.isa32.bits[2], boot_cpu_data.isa32.bits[3],
-               boot_cpu_data.isa32.bits[4], boot_cpu_data.isa32.bits[5]);
+               system_cpuinfo.isa32.bits[0], system_cpuinfo.isa32.bits[1],
+               system_cpuinfo.isa32.bits[2], system_cpuinfo.isa32.bits[3],
+               system_cpuinfo.isa32.bits[4], system_cpuinfo.isa32.bits[5]);
     }
     else
     {
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a1ee3146ef..c9f2827d56 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -124,7 +124,7 @@ static void __init dt_smp_init_cpus(void)
     bool bootcpu_valid = false;
     int rc;
 
-    mpidr = boot_cpu_data.mpidr.bits & MPIDR_HWID_MASK;
+    mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
 
     if ( !cpus )
     {
@@ -319,13 +319,13 @@ void start_secondary(void)
      * now.
      */
     if ( !opt_hmp_unsafe &&
-         current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
+         current_cpu_data.midr.bits != system_cpuinfo.midr.bits )
     {
         printk(XENLOG_ERR
                "CPU%u MIDR (0x%"PRIregister") does not match boot CPU MIDR (0x%"PRIregister"),\n"
                XENLOG_ERR "disable cpu (see big.LITTLE.txt under docs/).\n",
                smp_processor_id(), current_cpu_data.midr.bits,
-               boot_cpu_data.midr.bits);
+               system_cpuinfo.midr.bits);
         stop_cpu();
     }
 
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index ba48db3eac..8f2b8e7830 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -3,7 +3,7 @@
 
 #ifdef CONFIG_ARM_64
 #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
-#define boot_cpu_feature64(feat)       (boot_cpu_data.pfr64.feat)
+#define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
 
 #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
 
@@ -21,7 +21,7 @@
 #endif
 
 #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
-#define boot_cpu_feature32(feat)       (boot_cpu_data.pfr32.feat)
+#define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
 
 #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
 #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
@@ -326,7 +326,7 @@ struct cpuinfo_arm {
     } mvfr;
 };
 
-extern struct cpuinfo_arm boot_cpu_data;
+extern struct cpuinfo_arm system_cpuinfo;
 
 extern void identify_cpu(struct cpuinfo_arm *);
 
-- 
2.17.1


