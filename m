Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBB3B76EF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 19:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148061.273492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyHFK-00049M-6h; Tue, 29 Jun 2021 17:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148061.273492; Tue, 29 Jun 2021 17:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyHFK-00047L-2J; Tue, 29 Jun 2021 17:10:02 +0000
Received: by outflank-mailman (input) for mailman id 148061;
 Tue, 29 Jun 2021 17:09:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrVS=LX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lyHFH-0003pT-RD
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 17:09:59 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a139ef0a-c618-4222-9b02-19e5a1e0e7f6;
 Tue, 29 Jun 2021 17:09:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07D6C1FB;
 Tue, 29 Jun 2021 10:09:59 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0F5D3F694;
 Tue, 29 Jun 2021 10:09:57 -0700 (PDT)
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
X-Inumbo-ID: a139ef0a-c618-4222-9b02-19e5a1e0e7f6
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
Subject: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Date: Tue, 29 Jun 2021 18:08:55 +0100
Message-Id: <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624974370.git.bertrand.marquis@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1624974370.git.bertrand.marquis@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>

Define a sanitize_cpu function to be called on secondary cores to
sanitize the cpuinfo structure from the boot CPU.

The safest value is taken when possible and the system is marked tainted
if we encounter values which are incompatible with each other.

Call the sanitize_cpu function on all secondary cores and remove the
code disabling secondary cores if they are not the same as the boot core
as we are now able to handle this use case.

This is only supported on arm64 so cpu_sanitize is an empty static
inline on arm32.

This patch also removes the code imported from Linux that will not be
used by Xen.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/arm64/cpusanitize.c | 236 ++++++++++++++++++++++++-------
 xen/arch/arm/smpboot.c           |   5 +-
 xen/include/asm-arm/cpufeature.h |   9 ++
 xen/include/xen/lib.h            |   1 +
 4 files changed, 199 insertions(+), 52 deletions(-)

diff --git a/xen/arch/arm/arm64/cpusanitize.c b/xen/arch/arm/arm64/cpusanitize.c
index 4cc8378c14..744006ca7c 100644
--- a/xen/arch/arm/arm64/cpusanitize.c
+++ b/xen/arch/arm/arm64/cpusanitize.c
@@ -97,10 +97,6 @@ struct arm64_ftr_bits {
 		.width = 0,				\
 	}
 
-static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
-
-static bool __system_matches_cap(unsigned int n);
-
 /*
  * NOTE: Any changes to the visibility of features should be kept in
  * sync with the documentation of the CPU feature register ABI.
@@ -277,31 +273,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
 	ARM64_FTR_END,
 };
 
-static const struct arm64_ftr_bits ftr_ctr[] = {
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IDC_SHIFT, 1, 1),
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_CWG_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_ERG_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DMINLINE_SHIFT, 4, 1),
-	/*
-	 * Linux can handle differing I-cache policies. Userspace JITs will
-	 * make use of *minLine.
-	 * If we have differing I-cache policies, report it as the weakest - VIPT.
-	 */
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_EXACT, CTR_L1IP_SHIFT, 2, ICACHE_POLICY_VIPT),	/* L1Ip */
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
-	ARM64_FTR_END,
-};
-
-static struct arm64_ftr_override __ro_after_init no_override = { };
-
-struct arm64_ftr_reg arm64_ftr_reg_ctrel0 = {
-	.name		= "SYS_CTR_EL0",
-	.ftr_bits	= ftr_ctr,
-	.override	= &no_override,
-};
-
 static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_FCSE_SHIFT, 4, 0),
@@ -335,12 +306,6 @@ static const struct arm64_ftr_bits ftr_mvfr2[] = {
 	ARM64_FTR_END,
 };
 
-static const struct arm64_ftr_bits ftr_dczid[] = {
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
-	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
-	ARM64_FTR_END,
-};
-
 static const struct arm64_ftr_bits ftr_id_isar0[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DEBUG_SHIFT, 4, 0),
@@ -454,12 +419,6 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] = {
 	ARM64_FTR_END,
 };
 
-static const struct arm64_ftr_bits ftr_zcr[] = {
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
-		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
-	ARM64_FTR_END,
-};
-
 /*
  * Common ftr bits for a 32bit register with all hidden, strict
  * attributes, with 4bit feature fields and a default safe value of
@@ -478,17 +437,192 @@ static const struct arm64_ftr_bits ftr_generic_32bits[] = {
 	ARM64_FTR_END,
 };
 
-/* Table for a single 32bit feature value */
-static const struct arm64_ftr_bits ftr_single32[] = {
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, 0, 32, 0),
-	ARM64_FTR_END,
-};
-
-static const struct arm64_ftr_bits ftr_raz[] = {
-	ARM64_FTR_END,
-};
-
 /*
  * End of imported linux structures
  */
 
+static inline int __attribute_const__
+cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
+{
+    return (s64)(features << (64 - width - field)) >> (64 - width);
+}
+
+static inline int __attribute_const__
+cpuid_feature_extract_signed_field(u64 features, int field)
+{
+    return cpuid_feature_extract_signed_field_width(features, field, 4);
+}
+
+static inline unsigned int __attribute_const__
+cpuid_feature_extract_unsigned_field_width(u64 features, int field, int width)
+{
+    return (u64)(features << (64 - width - field)) >> (64 - width);
+}
+
+static inline unsigned int __attribute_const__
+cpuid_feature_extract_unsigned_field(u64 features, int field)
+{
+    return cpuid_feature_extract_unsigned_field_width(features, field, 4);
+}
+
+static inline u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
+{
+    return (u64)GENMASK(ftrp->shift + ftrp->width - 1, ftrp->shift);
+}
+
+static inline int __attribute_const__
+cpuid_feature_extract_field_width(u64 features, int field, int width,
+                                  bool sign)
+{
+    return (sign) ?
+        cpuid_feature_extract_signed_field_width(features, field, width) :
+        cpuid_feature_extract_unsigned_field_width(features, field, width);
+}
+
+static inline int __attribute_const__
+cpuid_feature_extract_field(u64 features, int field, bool sign)
+{
+    return cpuid_feature_extract_field_width(features, field, 4, sign);
+}
+
+static inline s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64 val)
+{
+    return (s64)cpuid_feature_extract_field_width(val, ftrp->shift,
+                                                  ftrp->width, ftrp->sign);
+}
+
+static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
+                                s64 cur)
+{
+    s64 ret = 0;
+
+    switch ( ftrp->type ) {
+    case FTR_EXACT:
+        ret = ftrp->safe_val;
+        break;
+    case FTR_LOWER_SAFE:
+        ret = new < cur ? new : cur;
+        break;
+    case FTR_HIGHER_OR_ZERO_SAFE:
+        if (!cur || !new)
+            break;
+        fallthrough;
+    case FTR_HIGHER_SAFE:
+        ret = new > cur ? new : cur;
+        break;
+    default:
+        BUG();
+    }
+
+    return ret;
+}
+
+static void sanitize_reg(u64 *cur_reg, u64 new_reg, const char *reg_name,
+                        const struct arm64_ftr_bits *ftrp)
+{
+    int taint = 0;
+    u64 old_reg = *cur_reg;
+
+    for ( ; ftrp->width !=0 ; ftrp++ )
+    {
+        u64 mask;
+        s64 cur_field = arm64_ftr_value(ftrp, *cur_reg);
+        s64 new_field = arm64_ftr_value(ftrp, new_reg);
+
+        if ( cur_field == new_field )
+            continue;
+
+        if ( ftrp->strict )
+            taint = 1;
+
+        mask = arm64_ftr_mask(ftrp);
+
+        *cur_reg &= ~mask;
+        *cur_reg |= (arm64_ftr_safe_value(ftrp, new_field, cur_field)
+                    << ftrp->shift) & mask;
+    }
+
+    if ( old_reg != new_reg )
+        printk(XENLOG_DEBUG "SANITY DIF: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
+               reg_name, old_reg, new_reg);
+    if ( old_reg != *cur_reg )
+        printk(XENLOG_DEBUG "SANITY FIX: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
+               reg_name, old_reg, *cur_reg);
+
+    if ( taint )
+    {
+        printk(XENLOG_WARNING "SANITY CHECK: Unexpected variation in %s.\n",
+                reg_name);
+        add_taint(TAINT_CPU_OUT_OF_SPEC);
+    }
+}
+
+
+/*
+ * This function should be called on secondary cores to sanitize the boot cpu
+ * cpuinfo.
+ */
+void sanitize_cpu(const struct cpuinfo_arm *new)
+{
+
+#define SANITIZE_REG(field, num, reg)  \
+    sanitize_reg(&boot_cpu_data.field.bits[num], new->field.bits[num], \
+                 #reg, ftr_##reg)
+
+#define SANITIZE_ID_REG(field, num, reg)  \
+    sanitize_reg(&boot_cpu_data.field.bits[num], new->field.bits[num], \
+                 #reg, ftr_id_##reg)
+
+#define SANITIZE_GENERIC_REG(field, num, reg)  \
+    sanitize_reg(&boot_cpu_data.field.bits[num], new->field.bits[num], \
+                 #reg, ftr_generic_32bits)
+
+    SANITIZE_ID_REG(pfr64, 0, aa64pfr0);
+    SANITIZE_ID_REG(pfr64, 1, aa64pfr1);
+
+    SANITIZE_ID_REG(dbg64, 0, aa64dfr0);
+
+    /* aux64 x2 */
+
+    SANITIZE_ID_REG(mm64, 0, aa64mmfr0);
+    SANITIZE_ID_REG(mm64, 1, aa64mmfr1);
+    SANITIZE_ID_REG(mm64, 2, aa64mmfr2);
+
+    SANITIZE_ID_REG(isa64, 0, aa64isar0);
+    SANITIZE_ID_REG(isa64, 1, aa64isar1);
+
+    SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
+
+    if ( cpu_feature64_has_el0_32(&boot_cpu_data) )
+    {
+        SANITIZE_ID_REG(pfr32, 0, pfr0);
+        SANITIZE_ID_REG(pfr32, 1, pfr1);
+        SANITIZE_ID_REG(pfr32, 2, pfr2);
+
+        SANITIZE_ID_REG(dbg32, 0, dfr0);
+        SANITIZE_ID_REG(dbg32, 1, dfr1);
+
+        /* aux32 x1 */
+
+        SANITIZE_ID_REG(mm32, 0, mmfr0);
+        SANITIZE_GENERIC_REG(mm32, 1, mmfr1);
+        SANITIZE_GENERIC_REG(mm32, 2, mmfr2);
+        SANITIZE_GENERIC_REG(mm32, 3, mmfr3);
+        SANITIZE_ID_REG(mm32, 4, mmfr4);
+        SANITIZE_ID_REG(mm32, 5, mmfr5);
+
+        SANITIZE_ID_REG(isa32, 0, isar0);
+        SANITIZE_GENERIC_REG(isa32, 1, isar1);
+        SANITIZE_GENERIC_REG(isa32, 2, isar2);
+        SANITIZE_GENERIC_REG(isa32, 3, isar3);
+        SANITIZE_ID_REG(isa32, 4, isar4);
+        SANITIZE_ID_REG(isa32, 5, isar5);
+        SANITIZE_ID_REG(isa32, 6, isar6);
+
+        SANITIZE_GENERIC_REG(mvfr, 0, mvfr0);
+        SANITIZE_GENERIC_REG(mvfr, 1, mvfr1);
+#ifndef MVFR2_MAYBE_UNDEFINED
+        SANITIZE_REG(mvfr, 2, mvfr2);
+#endif
+    }
+}
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a1ee3146ef..8fdf5e70d3 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -307,12 +307,14 @@ void start_secondary(void)
     set_processor_id(cpuid);
 
     identify_cpu(&current_cpu_data);
+    sanitize_cpu(&current_cpu_data);
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
                boot_cpu_data.midr.bits);
         stop_cpu();
     }
+#endif
 
     if ( dcache_line_bytes != read_dcache_line_bytes() )
     {
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index ba48db3eac..ad34e55cc8 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -330,6 +330,15 @@ extern struct cpuinfo_arm boot_cpu_data;
 
 extern void identify_cpu(struct cpuinfo_arm *);
 
+#ifdef CONFIG_ARM_64
+extern void sanitize_cpu(const struct cpuinfo_arm *);
+#else
+static inline void sanitize_cpu(const struct cpuinfo_arm *cpuinfo)
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


