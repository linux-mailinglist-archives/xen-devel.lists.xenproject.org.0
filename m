Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA123F75C2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172237.314164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsoo-0001xC-Tq; Wed, 25 Aug 2021 13:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172237.314164; Wed, 25 Aug 2021 13:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsoo-0001v6-OQ; Wed, 25 Aug 2021 13:19:50 +0000
Received: by outflank-mailman (input) for mailman id 172237;
 Wed, 25 Aug 2021 13:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b/lT=NQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mIson-0001JY-4q
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:19:49 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 63410c7e-dff8-4578-823a-67a08cafd02a;
 Wed, 25 Aug 2021 13:19:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EA3B106F;
 Wed, 25 Aug 2021 06:19:44 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3BEE3F5A1;
 Wed, 25 Aug 2021 06:19:43 -0700 (PDT)
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
X-Inumbo-ID: 63410c7e-dff8-4578-823a-67a08cafd02a
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/7] xen/arm: Rename cpu_boot_data to system_cpuinfo
Date: Wed, 25 Aug 2021 14:18:27 +0100
Message-Id: <588f4cdd02ce3f907c4b97b1513d90f153d127c0.1629897306.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629897306.git.bertrand.marquis@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1629897306.git.bertrand.marquis@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>

As we will sanitize the content of boot_cpu_data it will not really
contain the boot cpu information but the system sanitize information.
Rename the structure to system_cpuinfo so the user is informed that this
is the system wide available feature and not anymore the features of the
boot cpu.
The original boot cpu data is still available in cpu_data.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3: none
Changes in v2:
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


