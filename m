Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2633B019
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 11:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97935.185711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLkcY-0003yL-Ap; Mon, 15 Mar 2021 10:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97935.185711; Mon, 15 Mar 2021 10:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLkcY-0003xw-7K; Mon, 15 Mar 2021 10:38:46 +0000
Received: by outflank-mailman (input) for mailman id 97935;
 Mon, 15 Mar 2021 10:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/z0=IN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lLkcW-0003xr-8m
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 10:38:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 38702ad3-3c74-4245-beb8-ef545faee937;
 Mon, 15 Mar 2021 10:38:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12C31FB;
 Mon, 15 Mar 2021 03:38:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 387793F70D;
 Mon, 15 Mar 2021 03:38:42 -0700 (PDT)
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
X-Inumbo-ID: 38702ad3-3c74-4245-beb8-ef545faee937
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Use register_t type of cpuinfo entries
Date: Mon, 15 Mar 2021 10:38:30 +0000
Message-Id: <7a6a8c5c33d13fb43f3777f046036b91233534d3.1615804612.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

All cpu identification registers that we store in the cpuinfo structure
are 64bit on arm64 and 32bit on arm32 so storing the values in 32bit on
arm64 is removing the higher bits which might contain information in the
future.

This patch is changing the types in cpuinfo to register_t (which is
32bit on arm32 and 64bit on arm64) and adding the necessary paddings
inside the unions.
For consistency uint64_t entries are also changed to register_t on 64bit
systems.

It is also fixing all prints using directly the bits values from cpuinfo
to use PRIregister and adapt the printed value to print all bits
available on the architecture.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
  - add sentence on changing 64bit types in commit message
  - fix smpboot printk split
---
 xen/arch/arm/setup.c             | 17 ++++++++--------
 xen/arch/arm/smpboot.c           |  5 +++--
 xen/include/asm-arm/cpufeature.h | 34 +++++++++++++++++++++-----------
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2532ec9739..9ba2f267f6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -116,8 +116,8 @@ static void __init processor_id(void)
         printk("Huh, cpu architecture %x, expected 0xf (defined by cpuid)\n",
                c->midr.architecture);
 
-    printk("Processor: %08"PRIx32": \"%s\", variant: 0x%x, part 0x%03x, rev 0x%x\n",
-           c->midr.bits, implementer,
+    printk("Processor: %"PRIregister": \"%s\", variant: 0x%x, part 0x%03x,"
+           "rev 0x%x\n", c->midr.bits, implementer,
            c->midr.variant, c->midr.part_number, c->midr.revision);
 
 #if defined(CONFIG_ARM_64)
@@ -163,7 +163,7 @@ static void __init processor_id(void)
     if ( cpu_has_aarch32 )
     {
         printk("32-bit Execution:\n");
-        printk("  Processor Features: %08"PRIx32":%08"PRIx32"\n",
+        printk("  Processor Features: %"PRIregister":%"PRIregister"\n",
                boot_cpu_data.pfr32.bits[0], boot_cpu_data.pfr32.bits[1]);
         printk("    Instruction Sets:%s%s%s%s%s%s\n",
                cpu_has_aarch32 ? " AArch32" : "",
@@ -176,15 +176,16 @@ static void __init processor_id(void)
                cpu_has_gentimer ? " GenericTimer" : "",
                cpu_has_security ? " Security" : "");
 
-        printk("  Debug Features: %08"PRIx32"\n",
+        printk("  Debug Features: %"PRIregister"\n",
                boot_cpu_data.dbg32.bits[0]);
-        printk("  Auxiliary Features: %08"PRIx32"\n",
+        printk("  Auxiliary Features: %"PRIregister"\n",
                boot_cpu_data.aux32.bits[0]);
-        printk("  Memory Model Features: "
-               "%08"PRIx32" %08"PRIx32" %08"PRIx32" %08"PRIx32"\n",
+        printk("  Memory Model Features: %"PRIregister" %"PRIregister"\n"
+               "                         %"PRIregister" %"PRIregister"\n",
                boot_cpu_data.mm32.bits[0], boot_cpu_data.mm32.bits[1],
                boot_cpu_data.mm32.bits[2], boot_cpu_data.mm32.bits[3]);
-        printk(" ISA Features: %08x %08x %08x %08x %08x %08x\n",
+        printk("  ISA Features: %"PRIregister" %"PRIregister" %"PRIregister"\n"
+               "                %"PRIregister" %"PRIregister" %"PRIregister"\n",
                boot_cpu_data.isa32.bits[0], boot_cpu_data.isa32.bits[1],
                boot_cpu_data.isa32.bits[2], boot_cpu_data.isa32.bits[3],
                boot_cpu_data.isa32.bits[4], boot_cpu_data.isa32.bits[5]);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index cae2179126..a1ee3146ef 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -321,8 +321,9 @@ void start_secondary(void)
     if ( !opt_hmp_unsafe &&
          current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
     {
-        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU MIDR (0x%x),\n"
-               "disable cpu (see big.LITTLE.txt under docs/).\n",
+        printk(XENLOG_ERR
+               "CPU%u MIDR (0x%"PRIregister") does not match boot CPU MIDR (0x%"PRIregister"),\n"
+               XENLOG_ERR "disable cpu (see big.LITTLE.txt under docs/).\n",
                smp_processor_id(), current_cpu_data.midr.bits,
                boot_cpu_data.midr.bits);
         stop_cpu();
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 9ea3970c70..ba48db3eac 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -118,13 +118,16 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps);
  */
 struct cpuinfo_arm {
     union {
-        uint32_t bits;
+        register_t bits;
         struct {
             unsigned long revision:4;
             unsigned long part_number:12;
             unsigned long architecture:4;
             unsigned long variant:4;
             unsigned long implementer:8;
+#ifdef CONFIG_ARM_64
+            unsigned long _res0:32;
+#endif
         };
     } midr;
     union {
@@ -148,7 +151,7 @@ struct cpuinfo_arm {
 #ifdef CONFIG_ARM_64
     /* 64-bit CPUID registers. */
     union {
-        uint64_t bits[2];
+        register_t bits[2];
         struct {
             /* PFR0 */
             unsigned long el0:4;
@@ -179,15 +182,15 @@ struct cpuinfo_arm {
     } pfr64;
 
     struct {
-        uint64_t bits[2];
+        register_t bits[2];
     } dbg64;
 
     struct {
-        uint64_t bits[2];
+        register_t bits[2];
     } aux64;
 
     union {
-        uint64_t bits[3];
+        register_t bits[3];
         struct {
             unsigned long pa_range:4;
             unsigned long asid_bits:4;
@@ -213,7 +216,7 @@ struct cpuinfo_arm {
     } mm64;
 
     union {
-        uint64_t bits[2];
+        register_t bits[2];
         struct {
             /* ISAR0 */
             unsigned long __res0:4;
@@ -263,7 +266,7 @@ struct cpuinfo_arm {
      * when running in 32-bit mode.
      */
     union {
-        uint32_t bits[3];
+        register_t bits[3];
         struct {
             /* PFR0 */
             unsigned long arm:4;
@@ -274,6 +277,9 @@ struct cpuinfo_arm {
             unsigned long amu:4;
             unsigned long dit:4;
             unsigned long ras:4;
+#ifdef CONFIG_ARM_64
+            unsigned long __res0:32;
+#endif
 
             /* PFR1 */
             unsigned long progmodel:4;
@@ -284,29 +290,35 @@ struct cpuinfo_arm {
             unsigned long sec_frac:4;
             unsigned long virt_frac:4;
             unsigned long gic:4;
+#ifdef CONFIG_ARM_64
+            unsigned long __res1:32;
+#endif
 
             /* PFR2 */
             unsigned long csv3:4;
             unsigned long ssbs:4;
             unsigned long ras_frac:4;
             unsigned long __res2:20;
+#ifdef CONFIG_ARM_64
+            unsigned long __res3:32;
+#endif
         };
     } pfr32;
 
     struct {
-        uint32_t bits[2];
+        register_t bits[2];
     } dbg32;
 
     struct {
-        uint32_t bits[1];
+        register_t bits[1];
     } aux32;
 
     struct {
-        uint32_t bits[6];
+        register_t bits[6];
     } mm32;
 
     struct {
-        uint32_t bits[7];
+        register_t bits[7];
     } isa32;
 
     struct {
-- 
2.17.1


