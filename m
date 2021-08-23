Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0303F48BE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170315.311153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7HE-0005Qo-1C; Mon, 23 Aug 2021 10:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170315.311153; Mon, 23 Aug 2021 10:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7HD-0005K7-M5; Mon, 23 Aug 2021 10:33:59 +0000
Received: by outflank-mailman (input) for mailman id 170315;
 Mon, 23 Aug 2021 10:33:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mI7HC-0003X5-4G
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 10:33:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 984bbd07-03fd-11ec-a86f-12813bfff9fa;
 Mon, 23 Aug 2021 10:33:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F45012FC;
 Mon, 23 Aug 2021 03:33:45 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A9703F66F;
 Mon, 23 Aug 2021 03:33:44 -0700 (PDT)
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
X-Inumbo-ID: 984bbd07-03fd-11ec-a86f-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/7] xen/arm: Sanitize cpuinfo ID registers fields
Date: Mon, 23 Aug 2021 11:32:13 +0100
Message-Id: <58562c6fe41d1f6b4ccb2747520974113bdc117d.1629713932.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>

Define a sanitize_cpu function to be called on secondary cores to
sanitize the system cpuinfo structure.

The safest value is taken when possible and the system is marked tainted
if we encounter values which are incompatible with each other.

Call the update_system_features function on all secondary cores and
remove the code disabling secondary cores if they are not the same
as the boot core as we are now able to handle this use case.

This is only supported on arm64 so update_system_features is an empty
static inline on arm32.

The patch is also adding a new TAINT_CPU_OUT_OF_SPEC to warn the user if
Xen is running on a system with features differences between cores which
are not supported.

The patch is disabling CTR_EL0, DCZID_EL0 and ZCRusing #if 0 with a TODO
as this patch is not handling sanitization of those registers.
CTR_EL0/DCZID will be handled in a future patch to properly handle
different cache attributes when possible.
ZCR should be sanitize once we add support for SVE in Xen.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- add compilation of cpufeature.c in this patch instead of previous one
- remove functions reused from linux code and moved to header
- rename sanitize_cpu to update_system_features
- change to Linux coding style
- remove dev comments
- surround currently not used Linux structures with #if 0 and adapt the
commit message
- add missing aa64dfr1 register
- add TODO for CTR, DCZID and ZCR
- add CPU_OUT_OF_SPEC support to print_taint
- use system_cpuinfo instead of boot_cpu_data
---
 xen/arch/arm/arm64/Makefile      |   1 +
 xen/arch/arm/arm64/cpufeature.c  | 121 +++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c           |   5 +-
 xen/common/kernel.c              |   6 +-
 xen/include/asm-arm/cpufeature.h |   9 +++
 xen/include/xen/lib.h            |   1 +
 6 files changed, 140 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 40642ff574..701d66883d 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -1,6 +1,7 @@
 obj-y += lib/
 
 obj-y += cache.o
+obj-y += cpufeature.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index 5777e33e5c..61f629ebaa 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -275,6 +275,9 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
 	ARM64_FTR_END,
 };
 
+#if 0
+/* TODO: use this to sanitize the cache line size among cores */
+
 static const struct arm64_ftr_bits ftr_ctr[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
@@ -291,6 +294,7 @@ static const struct arm64_ftr_bits ftr_ctr[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
+#endif
 
 static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
@@ -325,11 +329,14 @@ static const struct arm64_ftr_bits ftr_mvfr2[] = {
 	ARM64_FTR_END,
 };
 
+#if 0
+/* TODO: handle this when sanitizing cache related registers */
 static const struct arm64_ftr_bits ftr_dczid[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
+#endif
 
 static const struct arm64_ftr_bits ftr_id_isar0[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
@@ -444,11 +451,15 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] = {
 	ARM64_FTR_END,
 };
 
+#if 0
+/* TODO: use this to sanitize SVE once we support it */
+
 static const struct arm64_ftr_bits ftr_zcr[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
 		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
 	ARM64_FTR_END,
 };
+#endif
 
 /*
  * Common ftr bits for a 32bit register with all hidden, strict
@@ -502,3 +513,113 @@ static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
  * End of imported linux structures and code
  */
 
+static void sanitize_reg(u64 *cur_reg, u64 new_reg, const char *reg_name,
+						const struct arm64_ftr_bits *ftrp)
+{
+	int taint = 0;
+	u64 old_reg = *cur_reg;
+
+	for (;ftrp->width != 0;ftrp++)
+	{
+		u64 mask;
+		s64 cur_field = arm64_ftr_value(ftrp, *cur_reg);
+		s64 new_field = arm64_ftr_value(ftrp, new_reg);
+
+		if (cur_field == new_field)
+			continue;
+
+		if (ftrp->strict)
+			taint = 1;
+
+		mask = arm64_ftr_mask(ftrp);
+
+		*cur_reg &= ~mask;
+		*cur_reg |= (arm64_ftr_safe_value(ftrp, new_field, cur_field)
+					<< ftrp->shift) & mask;
+	}
+
+	if (old_reg != new_reg)
+		printk(XENLOG_DEBUG "SANITY DIF: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
+				reg_name, old_reg, new_reg);
+	if (old_reg != *cur_reg)
+		printk(XENLOG_DEBUG "SANITY FIX: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
+				reg_name, old_reg, *cur_reg);
+
+	if (taint)
+	{
+		printk(XENLOG_WARNING "SANITY CHECK: Unexpected variation in %s.\n",
+				reg_name);
+		add_taint(TAINT_CPU_OUT_OF_SPEC);
+	}
+}
+
+
+/*
+ * This function should be called on secondary cores to sanitize the boot cpu
+ * cpuinfo.
+ */
+void update_system_features(const struct cpuinfo_arm *new)
+{
+
+#define SANITIZE_REG(field, num, reg)  \
+	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
+				 #reg, ftr_##reg)
+
+#define SANITIZE_ID_REG(field, num, reg)  \
+	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
+				#reg, ftr_id_##reg)
+
+#define SANITIZE_RAZ_REG(field, num, reg)  \
+	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
+				#reg, ftr_raz)
+
+#define SANITIZE_GENERIC_REG(field, num, reg)  \
+	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
+				#reg, ftr_generic_32bits)
+
+	SANITIZE_ID_REG(pfr64, 0, aa64pfr0);
+	SANITIZE_ID_REG(pfr64, 1, aa64pfr1);
+
+	SANITIZE_ID_REG(dbg64, 0, aa64dfr0);
+	SANITIZE_RAZ_REG(dbg64, 1, aa64dfr1);
+
+	SANITIZE_ID_REG(mm64, 0, aa64mmfr0);
+	SANITIZE_ID_REG(mm64, 1, aa64mmfr1);
+	SANITIZE_ID_REG(mm64, 2, aa64mmfr2);
+
+	SANITIZE_ID_REG(isa64, 0, aa64isar0);
+	SANITIZE_ID_REG(isa64, 1, aa64isar1);
+
+	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
+
+	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
+	{
+		SANITIZE_ID_REG(pfr32, 0, pfr0);
+		SANITIZE_ID_REG(pfr32, 1, pfr1);
+		SANITIZE_ID_REG(pfr32, 2, pfr2);
+
+		SANITIZE_ID_REG(dbg32, 0, dfr0);
+		SANITIZE_ID_REG(dbg32, 1, dfr1);
+
+		SANITIZE_ID_REG(mm32, 0, mmfr0);
+		SANITIZE_GENERIC_REG(mm32, 1, mmfr1);
+		SANITIZE_GENERIC_REG(mm32, 2, mmfr2);
+		SANITIZE_GENERIC_REG(mm32, 3, mmfr3);
+		SANITIZE_ID_REG(mm32, 4, mmfr4);
+		SANITIZE_ID_REG(mm32, 5, mmfr5);
+
+		SANITIZE_ID_REG(isa32, 0, isar0);
+		SANITIZE_GENERIC_REG(isa32, 1, isar1);
+		SANITIZE_GENERIC_REG(isa32, 2, isar2);
+		SANITIZE_GENERIC_REG(isa32, 3, isar3);
+		SANITIZE_ID_REG(isa32, 4, isar4);
+		SANITIZE_ID_REG(isa32, 5, isar5);
+		SANITIZE_ID_REG(isa32, 6, isar6);
+
+		SANITIZE_GENERIC_REG(mvfr, 0, mvfr0);
+		SANITIZE_GENERIC_REG(mvfr, 1, mvfr1);
+#ifndef MVFR2_MAYBE_UNDEFINED
+		SANITIZE_REG(mvfr, 2, mvfr2);
+#endif
+	}
+}
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index c9f2827d56..f631482a62 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -307,12 +307,14 @@ void start_secondary(void)
     set_processor_id(cpuid);
 
     identify_cpu(&current_cpu_data);
+    update_system_features(&current_cpu_data);
     processor_setup();
 
     init_traps();
 
+#ifndef CONFIG_ARM_64
     /*
-     * Currently Xen assumes the platform has only one kind of CPUs.
+     * Currently Xen assumes the platform has only one kind of CPUs on ARM32.
      * This assumption does not hold on big.LITTLE platform and may
      * result to instability and insecure platform (unless cpu affinity
      * is manually specified for all domains). Better to park them for
@@ -328,6 +330,7 @@ void start_secondary(void)
                system_cpuinfo.midr.bits);
         stop_cpu();
     }
+#endif
 
     if ( dcache_line_bytes != read_dcache_line_bytes() )
     {
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d77756a81e..e119e5401f 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -327,6 +327,7 @@ unsigned int tainted;
  *  'H' - HVM forced emulation prefix is permitted.
  *  'M' - Machine had a machine check experience.
  *  'U' - Platform is unsecure (usually due to an errata on the platform).
+ *  'S' - Out of spec CPU (One core has a feature incompatible with others).
  *
  *      The string is overwritten by the next call to print_taint().
  */
@@ -334,12 +335,13 @@ char *print_tainted(char *str)
 {
     if ( tainted )
     {
-        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c",
+        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
                  tainted & TAINT_MACHINE_UNSECURE ? 'U' : ' ',
                  tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
                  tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
                  tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
-                 tainted & TAINT_HVM_FEP ? 'H' : ' ');
+                 tainted & TAINT_HVM_FEP ? 'H' : ' ',
+                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
     }
     else
     {
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 8f2b8e7830..52cb3133e0 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -330,6 +330,15 @@ extern struct cpuinfo_arm system_cpuinfo;
 
 extern void identify_cpu(struct cpuinfo_arm *);
 
+#ifdef CONFIG_ARM_64
+extern void update_system_features(const struct cpuinfo_arm *);
+#else
+static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)
+{
+    /* Not supported on arm32 */
+}
+#endif
+
 extern struct cpuinfo_arm cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 1198c7c0b2..c6987973bf 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -192,6 +192,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 #define TAINT_ERROR_INJECT              (1u << 2)
 #define TAINT_HVM_FEP                   (1u << 3)
 #define TAINT_MACHINE_UNSECURE          (1u << 4)
+#define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
 extern unsigned int tainted;
 #define TAINT_STRING_MAX_LEN            20
 extern char *print_tainted(char *str);
-- 
2.17.1


