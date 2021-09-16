Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD4F40D334
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188025.337076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkr8-0002km-Jy; Thu, 16 Sep 2021 06:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188025.337076; Thu, 16 Sep 2021 06:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkr8-0002iY-Ga; Thu, 16 Sep 2021 06:26:46 +0000
Received: by outflank-mailman (input) for mailman id 188025;
 Thu, 16 Sep 2021 06:26:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8py=OG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mQkr7-0002iQ-Qr
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:26:45 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 107f39f8-16b7-11ec-b5a6-12813bfff9fa;
 Thu, 16 Sep 2021 06:26:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 248CD31B;
 Wed, 15 Sep 2021 23:26:45 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585953F59C;
 Wed, 15 Sep 2021 23:26:44 -0700 (PDT)
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
X-Inumbo-ID: 107f39f8-16b7-11ec-b5a6-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/7] xen/arm: Import ID registers definitions from Linux
Date: Thu, 16 Sep 2021 07:25:34 +0100
Message-Id: <36798ba046b8d1862c144a0dca1db5d14a955abf.1631772970.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1631772970.git.bertrand.marquis@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1631772970.git.bertrand.marquis@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>

Import some ID registers definitions from Linux sysreg header to have
required shift definitions for all ID registers fields.

Those are required to reuse the cpufeature sanitization system from
Linux kernel.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v4: Add acked-by Julien
Changes in v3: none
Changes in v2: Rebase
---
 xen/include/asm-arm/arm64/sysregs.h | 312 ++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
index 795901e1ba..d7e4772f21 100644
--- a/xen/include/asm-arm/arm64/sysregs.h
+++ b/xen/include/asm-arm/arm64/sysregs.h
@@ -85,6 +85,318 @@
 #define ID_DFR1_EL1                 S3_0_C0_C3_5
 #endif
 
+/* ID registers (imported from arm64/include/asm/sysreg.h in Linux) */
+
+/* id_aa64isar0 */
+#define ID_AA64ISAR0_RNDR_SHIFT      60
+#define ID_AA64ISAR0_TLB_SHIFT       56
+#define ID_AA64ISAR0_TS_SHIFT        52
+#define ID_AA64ISAR0_FHM_SHIFT       48
+#define ID_AA64ISAR0_DP_SHIFT        44
+#define ID_AA64ISAR0_SM4_SHIFT       40
+#define ID_AA64ISAR0_SM3_SHIFT       36
+#define ID_AA64ISAR0_SHA3_SHIFT      32
+#define ID_AA64ISAR0_RDM_SHIFT       28
+#define ID_AA64ISAR0_ATOMICS_SHIFT   20
+#define ID_AA64ISAR0_CRC32_SHIFT     16
+#define ID_AA64ISAR0_SHA2_SHIFT      12
+#define ID_AA64ISAR0_SHA1_SHIFT      8
+#define ID_AA64ISAR0_AES_SHIFT       4
+
+#define ID_AA64ISAR0_TLB_RANGE_NI    0x0
+#define ID_AA64ISAR0_TLB_RANGE       0x2
+
+/* id_aa64isar1 */
+#define ID_AA64ISAR1_I8MM_SHIFT      52
+#define ID_AA64ISAR1_DGH_SHIFT       48
+#define ID_AA64ISAR1_BF16_SHIFT      44
+#define ID_AA64ISAR1_SPECRES_SHIFT   40
+#define ID_AA64ISAR1_SB_SHIFT        36
+#define ID_AA64ISAR1_FRINTTS_SHIFT   32
+#define ID_AA64ISAR1_GPI_SHIFT       28
+#define ID_AA64ISAR1_GPA_SHIFT       24
+#define ID_AA64ISAR1_LRCPC_SHIFT     20
+#define ID_AA64ISAR1_FCMA_SHIFT      16
+#define ID_AA64ISAR1_JSCVT_SHIFT     12
+#define ID_AA64ISAR1_API_SHIFT       8
+#define ID_AA64ISAR1_APA_SHIFT       4
+#define ID_AA64ISAR1_DPB_SHIFT       0
+
+#define ID_AA64ISAR1_APA_NI                     0x0
+#define ID_AA64ISAR1_APA_ARCHITECTED            0x1
+#define ID_AA64ISAR1_APA_ARCH_EPAC              0x2
+#define ID_AA64ISAR1_APA_ARCH_EPAC2             0x3
+#define ID_AA64ISAR1_APA_ARCH_EPAC2_FPAC        0x4
+#define ID_AA64ISAR1_APA_ARCH_EPAC2_FPAC_CMB    0x5
+#define ID_AA64ISAR1_API_NI                     0x0
+#define ID_AA64ISAR1_API_IMP_DEF                0x1
+#define ID_AA64ISAR1_API_IMP_DEF_EPAC           0x2
+#define ID_AA64ISAR1_API_IMP_DEF_EPAC2          0x3
+#define ID_AA64ISAR1_API_IMP_DEF_EPAC2_FPAC     0x4
+#define ID_AA64ISAR1_API_IMP_DEF_EPAC2_FPAC_CMB 0x5
+#define ID_AA64ISAR1_GPA_NI                     0x0
+#define ID_AA64ISAR1_GPA_ARCHITECTED            0x1
+#define ID_AA64ISAR1_GPI_NI                     0x0
+#define ID_AA64ISAR1_GPI_IMP_DEF                0x1
+
+/* id_aa64pfr0 */
+#define ID_AA64PFR0_CSV3_SHIFT       60
+#define ID_AA64PFR0_CSV2_SHIFT       56
+#define ID_AA64PFR0_DIT_SHIFT        48
+#define ID_AA64PFR0_AMU_SHIFT        44
+#define ID_AA64PFR0_MPAM_SHIFT       40
+#define ID_AA64PFR0_SEL2_SHIFT       36
+#define ID_AA64PFR0_SVE_SHIFT        32
+#define ID_AA64PFR0_RAS_SHIFT        28
+#define ID_AA64PFR0_GIC_SHIFT        24
+#define ID_AA64PFR0_ASIMD_SHIFT      20
+#define ID_AA64PFR0_FP_SHIFT         16
+#define ID_AA64PFR0_EL3_SHIFT        12
+#define ID_AA64PFR0_EL2_SHIFT        8
+#define ID_AA64PFR0_EL1_SHIFT        4
+#define ID_AA64PFR0_EL0_SHIFT        0
+
+#define ID_AA64PFR0_AMU              0x1
+#define ID_AA64PFR0_SVE              0x1
+#define ID_AA64PFR0_RAS_V1           0x1
+#define ID_AA64PFR0_FP_NI            0xf
+#define ID_AA64PFR0_FP_SUPPORTED     0x0
+#define ID_AA64PFR0_ASIMD_NI         0xf
+#define ID_AA64PFR0_ASIMD_SUPPORTED  0x0
+#define ID_AA64PFR0_EL1_64BIT_ONLY   0x1
+#define ID_AA64PFR0_EL1_32BIT_64BIT  0x2
+#define ID_AA64PFR0_EL0_64BIT_ONLY   0x1
+#define ID_AA64PFR0_EL0_32BIT_64BIT  0x2
+
+/* id_aa64pfr1 */
+#define ID_AA64PFR1_MPAMFRAC_SHIFT   16
+#define ID_AA64PFR1_RASFRAC_SHIFT    12
+#define ID_AA64PFR1_MTE_SHIFT        8
+#define ID_AA64PFR1_SSBS_SHIFT       4
+#define ID_AA64PFR1_BT_SHIFT         0
+
+#define ID_AA64PFR1_SSBS_PSTATE_NI    0
+#define ID_AA64PFR1_SSBS_PSTATE_ONLY  1
+#define ID_AA64PFR1_SSBS_PSTATE_INSNS 2
+#define ID_AA64PFR1_BT_BTI            0x1
+
+#define ID_AA64PFR1_MTE_NI           0x0
+#define ID_AA64PFR1_MTE_EL0          0x1
+#define ID_AA64PFR1_MTE              0x2
+
+/* id_aa64zfr0 */
+#define ID_AA64ZFR0_F64MM_SHIFT      56
+#define ID_AA64ZFR0_F32MM_SHIFT      52
+#define ID_AA64ZFR0_I8MM_SHIFT       44
+#define ID_AA64ZFR0_SM4_SHIFT        40
+#define ID_AA64ZFR0_SHA3_SHIFT       32
+#define ID_AA64ZFR0_BF16_SHIFT       20
+#define ID_AA64ZFR0_BITPERM_SHIFT    16
+#define ID_AA64ZFR0_AES_SHIFT        4
+#define ID_AA64ZFR0_SVEVER_SHIFT     0
+
+#define ID_AA64ZFR0_F64MM            0x1
+#define ID_AA64ZFR0_F32MM            0x1
+#define ID_AA64ZFR0_I8MM             0x1
+#define ID_AA64ZFR0_BF16             0x1
+#define ID_AA64ZFR0_SM4              0x1
+#define ID_AA64ZFR0_SHA3             0x1
+#define ID_AA64ZFR0_BITPERM          0x1
+#define ID_AA64ZFR0_AES              0x1
+#define ID_AA64ZFR0_AES_PMULL        0x2
+#define ID_AA64ZFR0_SVEVER_SVE2      0x1
+
+/* id_aa64mmfr0 */
+#define ID_AA64MMFR0_ECV_SHIFT       60
+#define ID_AA64MMFR0_FGT_SHIFT       56
+#define ID_AA64MMFR0_EXS_SHIFT       44
+#define ID_AA64MMFR0_TGRAN4_2_SHIFT  40
+#define ID_AA64MMFR0_TGRAN64_2_SHIFT 36
+#define ID_AA64MMFR0_TGRAN16_2_SHIFT 32
+#define ID_AA64MMFR0_TGRAN4_SHIFT    28
+#define ID_AA64MMFR0_TGRAN64_SHIFT   24
+#define ID_AA64MMFR0_TGRAN16_SHIFT   20
+#define ID_AA64MMFR0_BIGENDEL0_SHIFT 16
+#define ID_AA64MMFR0_SNSMEM_SHIFT    12
+#define ID_AA64MMFR0_BIGENDEL_SHIFT  8
+#define ID_AA64MMFR0_ASID_SHIFT      4
+#define ID_AA64MMFR0_PARANGE_SHIFT   0
+
+#define ID_AA64MMFR0_TGRAN4_NI         0xf
+#define ID_AA64MMFR0_TGRAN4_SUPPORTED  0x0
+#define ID_AA64MMFR0_TGRAN64_NI        0xf
+#define ID_AA64MMFR0_TGRAN64_SUPPORTED 0x0
+#define ID_AA64MMFR0_TGRAN16_NI        0x0
+#define ID_AA64MMFR0_TGRAN16_SUPPORTED 0x1
+#define ID_AA64MMFR0_PARANGE_48        0x5
+#define ID_AA64MMFR0_PARANGE_52        0x6
+
+/* id_aa64mmfr1 */
+#define ID_AA64MMFR1_ETS_SHIFT       36
+#define ID_AA64MMFR1_TWED_SHIFT      32
+#define ID_AA64MMFR1_XNX_SHIFT       28
+#define ID_AA64MMFR1_SPECSEI_SHIFT   24
+#define ID_AA64MMFR1_PAN_SHIFT       20
+#define ID_AA64MMFR1_LOR_SHIFT       16
+#define ID_AA64MMFR1_HPD_SHIFT       12
+#define ID_AA64MMFR1_VHE_SHIFT       8
+#define ID_AA64MMFR1_VMIDBITS_SHIFT  4
+#define ID_AA64MMFR1_HADBS_SHIFT     0
+
+#define ID_AA64MMFR1_VMIDBITS_8      0
+#define ID_AA64MMFR1_VMIDBITS_16     2
+
+/* id_aa64mmfr2 */
+#define ID_AA64MMFR2_E0PD_SHIFT      60
+#define ID_AA64MMFR2_EVT_SHIFT       56
+#define ID_AA64MMFR2_BBM_SHIFT       52
+#define ID_AA64MMFR2_TTL_SHIFT       48
+#define ID_AA64MMFR2_FWB_SHIFT       40
+#define ID_AA64MMFR2_IDS_SHIFT       36
+#define ID_AA64MMFR2_AT_SHIFT        32
+#define ID_AA64MMFR2_ST_SHIFT        28
+#define ID_AA64MMFR2_NV_SHIFT        24
+#define ID_AA64MMFR2_CCIDX_SHIFT     20
+#define ID_AA64MMFR2_LVA_SHIFT       16
+#define ID_AA64MMFR2_IESB_SHIFT      12
+#define ID_AA64MMFR2_LSM_SHIFT       8
+#define ID_AA64MMFR2_UAO_SHIFT       4
+#define ID_AA64MMFR2_CNP_SHIFT       0
+
+/* id_aa64dfr0 */
+#define ID_AA64DFR0_DOUBLELOCK_SHIFT 36
+#define ID_AA64DFR0_PMSVER_SHIFT     32
+#define ID_AA64DFR0_CTX_CMPS_SHIFT   28
+#define ID_AA64DFR0_WRPS_SHIFT       20
+#define ID_AA64DFR0_BRPS_SHIFT       12
+#define ID_AA64DFR0_PMUVER_SHIFT     8
+#define ID_AA64DFR0_TRACEVER_SHIFT   4
+#define ID_AA64DFR0_DEBUGVER_SHIFT   0
+
+#define ID_AA64DFR0_PMUVER_8_0       0x1
+#define ID_AA64DFR0_PMUVER_8_1       0x4
+#define ID_AA64DFR0_PMUVER_8_4       0x5
+#define ID_AA64DFR0_PMUVER_8_5       0x6
+#define ID_AA64DFR0_PMUVER_IMP_DEF   0xf
+
+#define ID_DFR0_PERFMON_SHIFT        24
+
+#define ID_DFR0_PERFMON_8_1          0x4
+
+#define ID_ISAR4_SWP_FRAC_SHIFT        28
+#define ID_ISAR4_PSR_M_SHIFT           24
+#define ID_ISAR4_SYNCH_PRIM_FRAC_SHIFT 20
+#define ID_ISAR4_BARRIER_SHIFT         16
+#define ID_ISAR4_SMC_SHIFT             12
+#define ID_ISAR4_WRITEBACK_SHIFT       8
+#define ID_ISAR4_WITHSHIFTS_SHIFT      4
+#define ID_ISAR4_UNPRIV_SHIFT          0
+
+#define ID_DFR1_MTPMU_SHIFT          0
+
+#define ID_ISAR0_DIVIDE_SHIFT        24
+#define ID_ISAR0_DEBUG_SHIFT         20
+#define ID_ISAR0_COPROC_SHIFT        16
+#define ID_ISAR0_CMPBRANCH_SHIFT     12
+#define ID_ISAR0_BITFIELD_SHIFT      8
+#define ID_ISAR0_BITCOUNT_SHIFT      4
+#define ID_ISAR0_SWAP_SHIFT          0
+
+#define ID_ISAR5_RDM_SHIFT           24
+#define ID_ISAR5_CRC32_SHIFT         16
+#define ID_ISAR5_SHA2_SHIFT          12
+#define ID_ISAR5_SHA1_SHIFT          8
+#define ID_ISAR5_AES_SHIFT           4
+#define ID_ISAR5_SEVL_SHIFT          0
+
+#define ID_ISAR6_I8MM_SHIFT          24
+#define ID_ISAR6_BF16_SHIFT          20
+#define ID_ISAR6_SPECRES_SHIFT       16
+#define ID_ISAR6_SB_SHIFT            12
+#define ID_ISAR6_FHM_SHIFT           8
+#define ID_ISAR6_DP_SHIFT            4
+#define ID_ISAR6_JSCVT_SHIFT         0
+
+#define ID_MMFR0_INNERSHR_SHIFT      28
+#define ID_MMFR0_FCSE_SHIFT          24
+#define ID_MMFR0_AUXREG_SHIFT        20
+#define ID_MMFR0_TCM_SHIFT           16
+#define ID_MMFR0_SHARELVL_SHIFT      12
+#define ID_MMFR0_OUTERSHR_SHIFT      8
+#define ID_MMFR0_PMSA_SHIFT          4
+#define ID_MMFR0_VMSA_SHIFT          0
+
+#define ID_MMFR4_EVT_SHIFT           28
+#define ID_MMFR4_CCIDX_SHIFT         24
+#define ID_MMFR4_LSM_SHIFT           20
+#define ID_MMFR4_HPDS_SHIFT          16
+#define ID_MMFR4_CNP_SHIFT           12
+#define ID_MMFR4_XNX_SHIFT           8
+#define ID_MMFR4_AC2_SHIFT           4
+#define ID_MMFR4_SPECSEI_SHIFT       0
+
+#define ID_MMFR5_ETS_SHIFT           0
+
+#define ID_PFR0_DIT_SHIFT            24
+#define ID_PFR0_CSV2_SHIFT           16
+#define ID_PFR0_STATE3_SHIFT         12
+#define ID_PFR0_STATE2_SHIFT         8
+#define ID_PFR0_STATE1_SHIFT         4
+#define ID_PFR0_STATE0_SHIFT         0
+
+#define ID_DFR0_PERFMON_SHIFT        24
+#define ID_DFR0_MPROFDBG_SHIFT       20
+#define ID_DFR0_MMAPTRC_SHIFT        16
+#define ID_DFR0_COPTRC_SHIFT         12
+#define ID_DFR0_MMAPDBG_SHIFT        8
+#define ID_DFR0_COPSDBG_SHIFT        4
+#define ID_DFR0_COPDBG_SHIFT         0
+
+#define ID_PFR2_SSBS_SHIFT           4
+#define ID_PFR2_CSV3_SHIFT           0
+
+#define MVFR0_FPROUND_SHIFT          28
+#define MVFR0_FPSHVEC_SHIFT          24
+#define MVFR0_FPSQRT_SHIFT           20
+#define MVFR0_FPDIVIDE_SHIFT         16
+#define MVFR0_FPTRAP_SHIFT           12
+#define MVFR0_FPDP_SHIFT             8
+#define MVFR0_FPSP_SHIFT             4
+#define MVFR0_SIMD_SHIFT             0
+
+#define MVFR1_SIMDFMAC_SHIFT         28
+#define MVFR1_FPHP_SHIFT             24
+#define MVFR1_SIMDHP_SHIFT           20
+#define MVFR1_SIMDSP_SHIFT           16
+#define MVFR1_SIMDINT_SHIFT          12
+#define MVFR1_SIMDLS_SHIFT           8
+#define MVFR1_FPDNAN_SHIFT           4
+#define MVFR1_FPFTZ_SHIFT            0
+
+#define ID_PFR1_GIC_SHIFT            28
+#define ID_PFR1_VIRT_FRAC_SHIFT      24
+#define ID_PFR1_SEC_FRAC_SHIFT       20
+#define ID_PFR1_GENTIMER_SHIFT       16
+#define ID_PFR1_VIRTUALIZATION_SHIFT 12
+#define ID_PFR1_MPROGMOD_SHIFT       8
+#define ID_PFR1_SECURITY_SHIFT       4
+#define ID_PFR1_PROGMOD_SHIFT        0
+
+#define MVFR2_FPMISC_SHIFT           4
+#define MVFR2_SIMDMISC_SHIFT         0
+
+#define DCZID_DZP_SHIFT              4
+#define DCZID_BS_SHIFT               0
+
+/*
+ * The ZCR_ELx_LEN_* definitions intentionally include bits [8:4] which
+ * are reserved by the SVE architecture for future expansion of the LEN
+ * field, with compatible semantics.
+ */
+#define ZCR_ELx_LEN_SHIFT            0
+#define ZCR_ELx_LEN_SIZE             9
+#define ZCR_ELx_LEN_MASK             0x1ff
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
-- 
2.17.1


