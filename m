Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30D40D332
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188026.337088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkrB-00034l-UE; Thu, 16 Sep 2021 06:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188026.337088; Thu, 16 Sep 2021 06:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkrB-00031k-Px; Thu, 16 Sep 2021 06:26:49 +0000
Received: by outflank-mailman (input) for mailman id 188026;
 Thu, 16 Sep 2021 06:26:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8py=OG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mQkrA-0002iA-4a
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:26:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c23a2476-3a36-4743-adbc-8bd0c054fb5e;
 Thu, 16 Sep 2021 06:26:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 245B031B;
 Wed, 15 Sep 2021 23:26:46 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 588D73F59C;
 Wed, 15 Sep 2021 23:26:45 -0700 (PDT)
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
X-Inumbo-ID: c23a2476-3a36-4743-adbc-8bd0c054fb5e
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/7] xen/arm: Import ID features sanitize from linux
Date: Thu, 16 Sep 2021 07:25:35 +0100
Message-Id: <c949658a9066a522a4a815e2051943d0a29fdc73.1631772970.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1631772970.git.bertrand.marquis@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1631772970.git.bertrand.marquis@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>

Import structures declared in Linux file arch/arm64/kernel/cpufeature.c
and the required types from arch/arm64/include/asm/cpufeature.h.

Current code has been imported from Linux 5.13-rc5 (Commit ID
cd1245d75ce93b8fd206f4b34eb58bcfe156d5e9) and copied into cpufeature.c
in arm64 code and cpufeature.h in arm64 specific headers.

Those structure will be used to sanitize the cpu features available to
the ones availble on all cores of a system even if we are on an
heterogeneous platform (from example a big/LITTLE).

For each feature field of all ID registers, those structures define what
is the safest value and if we can allow to have different values in
different cores.

This patch is introducing Linux code without any changes to it.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v4: import arm64_ftr_set_value from Linux
Changes in v3: none
Changes in v2:
- Move add to Makefile to following patch to allow bisection
- Remove GPL text as SPDL is there
- Re-add introduction comment from Linux Kernel file
- Rename cpusanitize.c to cpufeature.c to keep Linux file name
- Move structures imported from linux headers into a new cpufeature.h
header in asm-arm/arm64.
- Move comment about imported code origin to the file header
- Remove not needed linux function declarations instead of removing them
in the following patch
- Add original arm64_ftr_safe_value from Linux
- include kernel.h to use max()
- remove unused ftr_single32 as we will not use it
- remove ctr associated structures that we cannot use (keep the one
defining sanitization bits)
---
 xen/arch/arm/arm64/cpufeature.c        | 514 +++++++++++++++++++++++++
 xen/include/asm-arm/arm64/cpufeature.h | 104 +++++
 2 files changed, 618 insertions(+)
 create mode 100644 xen/arch/arm/arm64/cpufeature.c
 create mode 100644 xen/include/asm-arm/arm64/cpufeature.h

diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
new file mode 100644
index 0000000000..152086dc9d
--- /dev/null
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -0,0 +1,514 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Contains CPU feature definitions
+ *
+ * The following structures have been imported directly from Linux kernel and
+ * should be kept in sync.
+ * The current version has been imported from arch/arm64/kernel/cpufeature.c
+ *  from kernel version 5.13-rc5 together with the required structures and
+ *  macros from arch/arm64/include/asm/cpufeature.h which are stored in
+ *  include/asm-arm/arm64/cpufeature.h
+ *
+ * Copyright (C) 2021 Arm Ltd.
+ * based on code from the Linux kernel, which is:
+ *  Copyright (C) 2015 ARM Ltd.
+ *
+ * A note for the weary kernel hacker: the code here is confusing and hard to
+ * follow! That's partly because it's solving a nasty problem, but also because
+ * there's a little bit of over-abstraction that tends to obscure what's going
+ * on behind a maze of helper functions and macros.
+ *
+ * The basic problem is that hardware folks have started gluing together CPUs
+ * with distinct architectural features; in some cases even creating SoCs where
+ * user-visible instructions are available only on a subset of the available
+ * cores. We try to address this by snapshotting the feature registers of the
+ * boot CPU and comparing these with the feature registers of each secondary
+ * CPU when bringing them up. If there is a mismatch, then we update the
+ * snapshot state to indicate the lowest-common denominator of the feature,
+ * known as the "safe" value. This snapshot state can be queried to view the
+ * "sanitised" value of a feature register.
+ *
+ * The sanitised register values are used to decide which capabilities we
+ * have in the system. These may be in the form of traditional "hwcaps"
+ * advertised to userspace or internal "cpucaps" which are used to configure
+ * things like alternative patching and static keys. While a feature mismatch
+ * may result in a TAINT_CPU_OUT_OF_SPEC kernel taint, a capability mismatch
+ * may prevent a CPU from being onlined at all.
+ *
+ * Some implementation details worth remembering:
+ *
+ * - Mismatched features are *always* sanitised to a "safe" value, which
+ *   usually indicates that the feature is not supported.
+ *
+ * - A mismatched feature marked with FTR_STRICT will cause a "SANITY CHECK"
+ *   warning when onlining an offending CPU and the kernel will be tainted
+ *   with TAINT_CPU_OUT_OF_SPEC.
+ *
+ * - Features marked as FTR_VISIBLE have their sanitised value visible to
+ *   userspace. FTR_VISIBLE features in registers that are only visible
+ *   to EL0 by trapping *must* have a corresponding HWCAP so that late
+ *   onlining of CPUs cannot lead to features disappearing at runtime.
+ *
+ * - A "feature" is typically a 4-bit register field. A "capability" is the
+ *   high-level description derived from the sanitised field value.
+ *
+ * - Read the Arm ARM (DDI 0487F.a) section D13.1.3 ("Principles of the ID
+ *   scheme for fields in ID registers") to understand when feature fields
+ *   may be signed or unsigned (FTR_SIGNED and FTR_UNSIGNED accordingly).
+ *
+ * - KVM exposes its own view of the feature registers to guest operating
+ *   systems regardless of FTR_VISIBLE. This is typically driven from the
+ *   sanitised register values to allow virtual CPUs to be migrated between
+ *   arbitrary physical CPUs, but some features not present on the host are
+ *   also advertised and emulated. Look at sys_reg_descs[] for the gory
+ *   details.
+ *
+ * - If the arm64_ftr_bits[] for a register has a missing field, then this
+ *   field is treated as STRICT RES0, including for read_sanitised_ftr_reg().
+ *   This is stronger than FTR_HIDDEN and can be used to hide features from
+ *   KVM guests.
+ */
+
+#include <xen/types.h>
+#include <xen/kernel.h>
+#include <asm/sysregs.h>
+#include <asm/cpufeature.h>
+#include <asm/arm64/cpufeature.h>
+
+#define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
+	{						\
+		.sign = SIGNED,				\
+		.visible = VISIBLE,			\
+		.strict = STRICT,			\
+		.type = TYPE,				\
+		.shift = SHIFT,				\
+		.width = WIDTH,				\
+		.safe_val = SAFE_VAL,			\
+	}
+
+/* Define a feature with unsigned values */
+#define ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
+	__ARM64_FTR_BITS(FTR_UNSIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
+
+/* Define a feature with a signed value */
+#define S_ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
+	__ARM64_FTR_BITS(FTR_SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
+
+#define ARM64_FTR_END					\
+	{						\
+		.width = 0,				\
+	}
+
+/*
+ * NOTE: Any changes to the visibility of features should be kept in
+ * sync with the documentation of the CPU feature register ABI.
+ */
+static const struct arm64_ftr_bits ftr_id_aa64isar0[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_RNDR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_TLB_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_TS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_FHM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_DP_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_SM4_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_SM3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_SHA3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_RDM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_ATOMICS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_CRC32_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_SHA2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_SHA1_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_AES_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_I8MM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_DGH_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_BF16_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_SPECRES_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_SB_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_FRINTTS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_GPI_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_GPA_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_LRCPC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_FCMA_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_JSCVT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_API_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_APA_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_DPB_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_DIT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_AMU_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_MPAM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_SEL2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+				   FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_SVE_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_RAS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_GIC_SHIFT, 4, 0),
+	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_ASIMD_SHIFT, 4, ID_AA64PFR0_ASIMD_NI),
+	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_FP_SHIFT, 4, ID_AA64PFR0_FP_NI),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_MPAMFRAC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_RASFRAC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_MTE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_MTE_SHIFT, 4, ID_AA64PFR1_MTE_NI),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR1_SSBS_SHIFT, 4, ID_AA64PFR1_SSBS_PSTATE_NI),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_BTI),
+				    FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_BT_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64zfr0[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_F64MM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_F32MM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_I8MM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_SM4_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_SHA3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_BF16_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_BITPERM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_AES_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_SVEVER_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64mmfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_ECV_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_FGT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_EXS_SHIFT, 4, 0),
+	/*
+	 * Page size not being supported at Stage-2 is not fatal. You
+	 * just give up KVM if PAGE_SIZE isn't supported there. Go fix
+	 * your favourite nesting hypervisor.
+	 *
+	 * There is a small corner case where the hypervisor explicitly
+	 * advertises a given granule size at Stage-2 (value 2) on some
+	 * vCPUs, and uses the fallback to Stage-1 (value 0) for other
+	 * vCPUs. Although this is not forbidden by the architecture, it
+	 * indicates that the hypervisor is being silly (or buggy).
+	 *
+	 * We make no effort to cope with this and pretend that if these
+	 * fields are inconsistent across vCPUs, then it isn't worth
+	 * trying to bring KVM up.
+	 */
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64MMFR0_TGRAN4_2_SHIFT, 4, 1),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64MMFR0_TGRAN64_2_SHIFT, 4, 1),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64MMFR0_TGRAN16_2_SHIFT, 4, 1),
+	/*
+	 * We already refuse to boot CPUs that don't support our configured
+	 * page size, so we can only detect mismatches for a page size other
+	 * than the one we're currently using. Unfortunately, SoCs like this
+	 * exist in the wild so, even though we don't like it, we'll have to go
+	 * along with it and treat them as non-strict.
+	 */
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_TGRAN4_SHIFT, 4, ID_AA64MMFR0_TGRAN4_NI),
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_TGRAN64_SHIFT, 4, ID_AA64MMFR0_TGRAN64_NI),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_TGRAN16_SHIFT, 4, ID_AA64MMFR0_TGRAN16_NI),
+
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_BIGENDEL0_SHIFT, 4, 0),
+	/* Linux shouldn't care about secure memory */
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_SNSMEM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_BIGENDEL_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_ASID_SHIFT, 4, 0),
+	/*
+	 * Differing PARange is fine as long as all peripherals and memory are mapped
+	 * within the minimum PARange of all CPUs
+	 */
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_PARANGE_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64mmfr1[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_ETS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_TWED_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_XNX_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64MMFR1_SPECSEI_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_PAN_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_LOR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_HPD_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_VHE_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_VMIDBITS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_HADBS_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_E0PD_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_EVT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_BBM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_TTL_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_FWB_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_IDS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_AT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_ST_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_NV_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_CCIDX_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_LVA_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_IESB_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_LSM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_UAO_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_CNP_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_ctr[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IDC_SHIFT, 1, 1),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_CWG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_ERG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DMINLINE_SHIFT, 4, 1),
+	/*
+	 * Linux can handle differing I-cache policies. Userspace JITs will
+	 * make use of *minLine.
+	 * If we have differing I-cache policies, report it as the weakest - VIPT.
+	 */
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_EXACT, CTR_L1IP_SHIFT, 2, ICACHE_POLICY_VIPT),	/* L1Ip */
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNERSHR_SHIFT, 4, 0xf),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_FCSE_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_MMFR0_AUXREG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_TCM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_SHARELVL_SHIFT, 4, 0),
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_OUTERSHR_SHIFT, 4, 0xf),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_PMSA_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_VMSA_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_DOUBLELOCK_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_PMSVER_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_CTX_CMPS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_WRPS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_BRPS_SHIFT, 4, 0),
+	/*
+	 * We can instantiate multiple PMU instances with different levels
+	 * of support.
+	 */
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_PMUVER_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_DEBUGVER_SHIFT, 4, 0x6),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_mvfr2[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MVFR2_FPMISC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MVFR2_SIMDMISC_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_dczid[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_isar0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DEBUG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_COPROC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_CMPBRANCH_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_BITFIELD_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_BITCOUNT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_SWAP_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_isar5[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_RDM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_CRC32_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_SHA2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_SHA1_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_AES_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_SEVL_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_mmfr4[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_EVT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_CCIDX_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_LSM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_HPDS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_CNP_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_XNX_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_AC2_SHIFT, 4, 0),
+
+	/*
+	 * SpecSEI = 1 indicates that the PE might generate an SError on an
+	 * external abort on speculative read. It is safe to assume that an
+	 * SError might be generated than it will not be. Hence it has been
+	 * classified as FTR_HIGHER_SAFE.
+	 */
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_MMFR4_SPECSEI_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_isar4[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_SWP_FRAC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_PSR_M_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_SYNCH_PRIM_FRAC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_BARRIER_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_SMC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_WRITEBACK_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_WITHSHIFTS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_UNPRIV_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_mmfr5[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR5_ETS_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_isar6[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_I8MM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_BF16_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_SPECRES_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_SB_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_FHM_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_DP_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_JSCVT_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_pfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_DIT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_PFR0_CSV2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE3_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE1_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE0_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_pfr1[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_GIC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_VIRT_FRAC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_SEC_FRAC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_GENTIMER_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_VIRTUALIZATION_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_MPROGMOD_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_SECURITY_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_PROGMOD_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_pfr2[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_PFR2_SSBS_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_PFR2_CSV3_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_dfr0[] = {
+	/* [31:28] TraceFilt */
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_PERFMON_SHIFT, 4, 0xf),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_MPROFDBG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_MMAPTRC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_COPTRC_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_MMAPDBG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_COPSDBG_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_COPDBG_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_id_dfr1[] = {
+	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR1_MTPMU_SHIFT, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_zcr[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
+		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
+	ARM64_FTR_END,
+};
+
+/*
+ * Common ftr bits for a 32bit register with all hidden, strict
+ * attributes, with 4bit feature fields and a default safe value of
+ * 0. Covers the following 32bit registers:
+ * id_isar[1-4], id_mmfr[1-3], id_pfr1, mvfr[0-1]
+ */
+static const struct arm64_ftr_bits ftr_generic_32bits[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 28, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 24, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 20, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 16, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 12, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 8, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 4, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 0, 4, 0),
+	ARM64_FTR_END,
+};
+
+static const struct arm64_ftr_bits ftr_raz[] = {
+	ARM64_FTR_END,
+};
+
+static u64 arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp, s64 reg,
+			       s64 ftr_val)
+{
+	u64 mask = arm64_ftr_mask(ftrp);
+
+	reg &= ~mask;
+	reg |= (ftr_val << ftrp->shift) & mask;
+	return reg;
+}
+
+static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
+				s64 cur)
+{
+	s64 ret = 0;
+
+	switch (ftrp->type) {
+	case FTR_EXACT:
+		ret = ftrp->safe_val;
+		break;
+	case FTR_LOWER_SAFE:
+		ret = min(new, cur);
+		break;
+	case FTR_HIGHER_OR_ZERO_SAFE:
+		if (!cur || !new)
+			break;
+		fallthrough;
+	case FTR_HIGHER_SAFE:
+		ret = max(new, cur);
+		break;
+	default:
+		BUG();
+	}
+
+	return ret;
+}
+
+/*
+ * End of imported linux structures and code
+ */
+
diff --git a/xen/include/asm-arm/arm64/cpufeature.h b/xen/include/asm-arm/arm64/cpufeature.h
new file mode 100644
index 0000000000..d9b9fa77cb
--- /dev/null
+++ b/xen/include/asm-arm/arm64/cpufeature.h
@@ -0,0 +1,104 @@
+#ifndef __ASM_ARM_ARM64_CPUFEATURES_H
+#define __ASM_ARM_ARM64_CPUFEATURES_H
+
+/*
+ * CPU feature register tracking
+ *
+ * The safe value of a CPUID feature field is dependent on the implications
+ * of the values assigned to it by the architecture. Based on the relationship
+ * between the values, the features are classified into 3 types - LOWER_SAFE,
+ * HIGHER_SAFE and EXACT.
+ *
+ * The lowest value of all the CPUs is chosen for LOWER_SAFE and highest
+ * for HIGHER_SAFE. It is expected that all CPUs have the same value for
+ * a field when EXACT is specified, failing which, the safe value specified
+ * in the table is chosen.
+ */
+
+enum ftr_type {
+	FTR_EXACT,			/* Use a predefined safe value */
+	FTR_LOWER_SAFE,			/* Smaller value is safe */
+	FTR_HIGHER_SAFE,		/* Bigger value is safe */
+	FTR_HIGHER_OR_ZERO_SAFE,	/* Bigger value is safe, but 0 is biggest */
+};
+
+#define FTR_STRICT	true	/* SANITY check strict matching required */
+#define FTR_NONSTRICT	false	/* SANITY check ignored */
+
+#define FTR_SIGNED	true	/* Value should be treated as signed */
+#define FTR_UNSIGNED	false	/* Value should be treated as unsigned */
+
+#define FTR_VISIBLE	true	/* Feature visible to the user space */
+#define FTR_HIDDEN	false	/* Feature is hidden from the user */
+
+#define FTR_VISIBLE_IF_IS_ENABLED(config)		\
+	(IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
+
+struct arm64_ftr_bits {
+	bool		sign;	/* Value is signed ? */
+	bool		visible;
+	bool		strict;	/* CPU Sanity check: strict matching required ? */
+	enum ftr_type	type;
+	u8		shift;
+	u8		width;
+	s64		safe_val; /* safe value for FTR_EXACT features */
+};
+
+static inline int __attribute_const__
+cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
+{
+	return (s64)(features << (64 - width - field)) >> (64 - width);
+}
+
+static inline int __attribute_const__
+cpuid_feature_extract_signed_field(u64 features, int field)
+{
+	return cpuid_feature_extract_signed_field_width(features, field, 4);
+}
+
+static inline unsigned int __attribute_const__
+cpuid_feature_extract_unsigned_field_width(u64 features, int field, int width)
+{
+	return (u64)(features << (64 - width - field)) >> (64 - width);
+}
+
+static inline unsigned int __attribute_const__
+cpuid_feature_extract_unsigned_field(u64 features, int field)
+{
+	return cpuid_feature_extract_unsigned_field_width(features, field, 4);
+}
+
+static inline u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
+{
+	return (u64)GENMASK(ftrp->shift + ftrp->width - 1, ftrp->shift);
+}
+
+static inline int __attribute_const__
+cpuid_feature_extract_field_width(u64 features, int field, int width, bool sign)
+{
+	return (sign) ?
+		cpuid_feature_extract_signed_field_width(features, field, width) :
+		cpuid_feature_extract_unsigned_field_width(features, field, width);
+}
+
+static inline int __attribute_const__
+cpuid_feature_extract_field(u64 features, int field, bool sign)
+{
+	return cpuid_feature_extract_field_width(features, field, 4, sign);
+}
+
+static inline s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64 val)
+{
+	return (s64)cpuid_feature_extract_field_width(val, ftrp->shift, ftrp->width, ftrp->sign);
+}
+
+#endif /* _ASM_ARM_ARM64_CPUFEATURES_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


