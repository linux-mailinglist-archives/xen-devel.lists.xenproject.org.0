Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4451813C
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 11:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319342.539572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozT-0005oy-Kr; Tue, 03 May 2022 09:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319342.539572; Tue, 03 May 2022 09:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozT-0005mo-Hg; Tue, 03 May 2022 09:38:43 +0000
Received: by outflank-mailman (input) for mailman id 319342;
 Tue, 03 May 2022 09:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1P+g=VL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nlozS-0005X9-5c
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 09:38:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d0d66aa9-cac4-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 11:38:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6145012FC;
 Tue,  3 May 2022 02:38:40 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F0123F73D;
 Tue,  3 May 2022 02:38:39 -0700 (PDT)
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
X-Inumbo-ID: d0d66aa9-cac4-11ec-8fc4-03012f2f19d4
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Date: Tue,  3 May 2022 10:38:29 +0100
Message-Id: <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651570561.git.bertrand.marquis@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sync arm64 sysreg bit shift definitions with status of Linux kernel as
of 5.18-rc3 version (linux commit b2d229d4ddb1).
Sync ID registers sanitization with the status of Linux 5.18-rc3 and add
sanitization of ISAR2 registers.
Complete AA64ISAR2 and AA64MMFR1 with more fields.
While there add a comment for MMFR bitfields as for other registers in
the cpuinfo structure definition.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/arm64/cpufeature.c          | 18 +++++-
 xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
 xen/arch/arm/include/asm/cpufeature.h    | 14 ++++-
 3 files changed, 91 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index 6e5d30dc7b..d9039d37b2 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -143,6 +143,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
 	ARM64_FTR_END,
 };
 
+static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64ISAR2_CLEARBHB_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_APA3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_GPA3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_RPRES_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
 static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV3_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV2_SHIFT, 4, 0),
@@ -158,8 +168,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_FP_SHIFT, 4, ID_AA64PFR0_FP_NI),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL3_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL2_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_ELx_64BIT_ONLY),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL0_SHIFT, 4, ID_AA64PFR0_ELx_64BIT_ONLY),
 	ARM64_FTR_END,
 };
 
@@ -197,7 +207,7 @@ static const struct arm64_ftr_bits ftr_id_aa64zfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64mmfr0[] = {
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_ECV_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_ECV_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_FGT_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_EXS_SHIFT, 4, 0),
 	/*
@@ -243,6 +253,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64mmfr1[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_AFP_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_ETS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_TWED_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_XNX_SHIFT, 4, 0),
@@ -588,6 +599,7 @@ void update_system_features(const struct cpuinfo_arm *new)
 
 	SANITIZE_ID_REG(isa64, 0, aa64isar0);
 	SANITIZE_ID_REG(isa64, 1, aa64isar1);
+	SANITIZE_ID_REG(isa64, 2, aa64isar2);
 
 	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
 
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index eac08ed33f..54670084c3 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -144,6 +144,30 @@
 
 /* id_aa64isar2 */
 #define ID_AA64ISAR2_CLEARBHB_SHIFT 28
+#define ID_AA64ISAR2_APA3_SHIFT     12
+#define ID_AA64ISAR2_GPA3_SHIFT     8
+#define ID_AA64ISAR2_RPRES_SHIFT    4
+#define ID_AA64ISAR2_WFXT_SHIFT     0
+
+#define ID_AA64ISAR2_RPRES_8BIT     0x0
+#define ID_AA64ISAR2_RPRES_12BIT    0x1
+/*
+ * Value 0x1 has been removed from the architecture, and is
+ * reserved, but has not yet been removed from the ARM ARM
+ * as of ARM DDI 0487G.b.
+ */
+#define ID_AA64ISAR2_WFXT_NI        0x0
+#define ID_AA64ISAR2_WFXT_SUPPORTED 0x2
+
+#define ID_AA64ISAR2_APA3_NI                  0x0
+#define ID_AA64ISAR2_APA3_ARCHITECTED         0x1
+#define ID_AA64ISAR2_APA3_ARCH_EPAC           0x2
+#define ID_AA64ISAR2_APA3_ARCH_EPAC2          0x3
+#define ID_AA64ISAR2_APA3_ARCH_EPAC2_FPAC     0x4
+#define ID_AA64ISAR2_APA3_ARCH_EPAC2_FPAC_CMB 0x5
+
+#define ID_AA64ISAR2_GPA3_NI             0x0
+#define ID_AA64ISAR2_GPA3_ARCHITECTED    0x1
 
 /* id_aa64pfr0 */
 #define ID_AA64PFR0_CSV3_SHIFT       60
@@ -165,14 +189,13 @@
 #define ID_AA64PFR0_AMU              0x1
 #define ID_AA64PFR0_SVE              0x1
 #define ID_AA64PFR0_RAS_V1           0x1
+#define ID_AA64PFR0_RAS_V1P1         0x2
 #define ID_AA64PFR0_FP_NI            0xf
 #define ID_AA64PFR0_FP_SUPPORTED     0x0
 #define ID_AA64PFR0_ASIMD_NI         0xf
 #define ID_AA64PFR0_ASIMD_SUPPORTED  0x0
-#define ID_AA64PFR0_EL1_64BIT_ONLY   0x1
-#define ID_AA64PFR0_EL1_32BIT_64BIT  0x2
-#define ID_AA64PFR0_EL0_64BIT_ONLY   0x1
-#define ID_AA64PFR0_EL0_32BIT_64BIT  0x2
+#define ID_AA64PFR0_ELx_64BIT_ONLY   0x1
+#define ID_AA64PFR0_ELx_32BIT_64BIT  0x2
 
 /* id_aa64pfr1 */
 #define ID_AA64PFR1_MPAMFRAC_SHIFT   16
@@ -189,6 +212,7 @@
 #define ID_AA64PFR1_MTE_NI           0x0
 #define ID_AA64PFR1_MTE_EL0          0x1
 #define ID_AA64PFR1_MTE              0x2
+#define ID_AA64PFR1_MTE_ASYMM        0x3
 
 /* id_aa64zfr0 */
 #define ID_AA64ZFR0_F64MM_SHIFT      56
@@ -228,17 +252,37 @@
 #define ID_AA64MMFR0_ASID_SHIFT      4
 #define ID_AA64MMFR0_PARANGE_SHIFT   0
 
-#define ID_AA64MMFR0_TGRAN4_NI         0xf
-#define ID_AA64MMFR0_TGRAN4_SUPPORTED  0x0
-#define ID_AA64MMFR0_TGRAN64_NI        0xf
-#define ID_AA64MMFR0_TGRAN64_SUPPORTED 0x0
-#define ID_AA64MMFR0_TGRAN16_NI        0x0
-#define ID_AA64MMFR0_TGRAN16_SUPPORTED 0x1
+#define ID_AA64MMFR0_ASID_8          0x0
+#define ID_AA64MMFR0_ASID_16         0x2
+
+#define ID_AA64MMFR0_TGRAN4_NI             0xf
+#define ID_AA64MMFR0_TGRAN4_SUPPORTED_MIN  0x0
+#define ID_AA64MMFR0_TGRAN4_SUPPORTED_MAX  0x7
+#define ID_AA64MMFR0_TGRAN64_NI            0xf
+#define ID_AA64MMFR0_TGRAN64_SUPPORTED_MIN 0x0
+#define ID_AA64MMFR0_TGRAN64_SUPPORTED_MAX 0x7
+#define ID_AA64MMFR0_TGRAN16_NI            0x0
+#define ID_AA64MMFR0_TGRAN16_SUPPORTED_MIN 0x1
+#define ID_AA64MMFR0_TGRAN16_SUPPORTED_MAX 0xf
+
+#define ID_AA64MMFR0_PARANGE_32        0x0
+#define ID_AA64MMFR0_PARANGE_36        0x1
+#define ID_AA64MMFR0_PARANGE_40        0x2
+#define ID_AA64MMFR0_PARANGE_42        0x3
+#define ID_AA64MMFR0_PARANGE_44        0x4
 #define ID_AA64MMFR0_PARANGE_48        0x5
 #define ID_AA64MMFR0_PARANGE_52        0x6
 
+#define ARM64_MIN_PARANGE_BITS     32
+
+#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_DEFAULT 0x0
+#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_NONE    0x1
+#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_MIN     0x2
+#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_MAX     0x7
+
 /* id_aa64mmfr1 */
 #define ID_AA64MMFR1_ECBHB_SHIFT     60
+#define ID_AA64MMFR1_AFP_SHIFT       44
 #define ID_AA64MMFR1_ETS_SHIFT       36
 #define ID_AA64MMFR1_TWED_SHIFT      32
 #define ID_AA64MMFR1_XNX_SHIFT       28
@@ -271,6 +315,9 @@
 #define ID_AA64MMFR2_CNP_SHIFT       0
 
 /* id_aa64dfr0 */
+#define ID_AA64DFR0_MTPMU_SHIFT      48
+#define ID_AA64DFR0_TRBE_SHIFT       44
+#define ID_AA64DFR0_TRACE_FILT_SHIFT 40
 #define ID_AA64DFR0_DOUBLELOCK_SHIFT 36
 #define ID_AA64DFR0_PMSVER_SHIFT     32
 #define ID_AA64DFR0_CTX_CMPS_SHIFT   28
@@ -284,11 +331,18 @@
 #define ID_AA64DFR0_PMUVER_8_1       0x4
 #define ID_AA64DFR0_PMUVER_8_4       0x5
 #define ID_AA64DFR0_PMUVER_8_5       0x6
+#define ID_AA64DFR0_PMUVER_8_7       0x7
 #define ID_AA64DFR0_PMUVER_IMP_DEF   0xf
 
+#define ID_AA64DFR0_PMSVER_8_2      0x1
+#define ID_AA64DFR0_PMSVER_8_3      0x2
+
 #define ID_DFR0_PERFMON_SHIFT        24
 
-#define ID_DFR0_PERFMON_8_1          0x4
+#define ID_DFR0_PERFMON_8_0         0x3
+#define ID_DFR0_PERFMON_8_1         0x4
+#define ID_DFR0_PERFMON_8_4         0x5
+#define ID_DFR0_PERFMON_8_5         0x6
 
 #define ID_ISAR4_SWP_FRAC_SHIFT        28
 #define ID_ISAR4_PSR_M_SHIFT           24
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index f7368766c0..4719de47f3 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -230,6 +230,7 @@ struct cpuinfo_arm {
     union {
         register_t bits[3];
         struct {
+            /* MMFR0 */
             unsigned long pa_range:4;
             unsigned long asid_bits:4;
             unsigned long bigend:4;
@@ -240,16 +241,21 @@ struct cpuinfo_arm {
             unsigned long tgranule_4K:4;
             unsigned long __res0:32;
 
+            /* MMFR1 */
             unsigned long hafdbs:4;
             unsigned long vmid_bits:4;
             unsigned long vh:4;
             unsigned long hpds:4;
             unsigned long lo:4;
             unsigned long pan:4;
-            unsigned long __res1:8;
-            unsigned long __res2:28;
+            unsigned long specsei:4;
+            unsigned long xnx:4;
+            unsigned long twed:4;
+            unsigned long ets:4;
+            unsigned long __res1:20;
             unsigned long ecbhb:4;
 
+            /* MMFR2 */
             unsigned long __res3:64;
         };
     } mm64;
@@ -293,7 +299,9 @@ struct cpuinfo_arm {
             unsigned long __res2:8;
 
             /* ISAR2 */
-            unsigned long __res3:28;
+            unsigned long wfxt:4;
+            unsigned long rpres:4;
+            unsigned long __res3:20;
             unsigned long clearbhb:4;
 
             unsigned long __res4:32;
-- 
2.25.1


