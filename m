Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C963F4B9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450918.708443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m3R-0001XJ-JB; Thu, 01 Dec 2022 16:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450918.708443; Thu, 01 Dec 2022 16:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m3R-0001Uf-FS; Thu, 01 Dec 2022 16:04:53 +0000
Received: by outflank-mailman (input) for mailman id 450918;
 Thu, 01 Dec 2022 16:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m3Q-0001UO-2L
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:04:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e29d28b4-7191-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:04:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFF53ED1;
 Thu,  1 Dec 2022 08:04:56 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D6D43F67D;
 Thu,  1 Dec 2022 08:04:49 -0800 (PST)
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
X-Inumbo-ID: e29d28b4-7191-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 02/21] xen/arm: smmuv3: Add support for stage-1 and nested stage translation
Date: Thu,  1 Dec 2022 16:02:26 +0000
Message-Id: <ff0daa2f92a23c183b3eb48c6d98bd79cce822be.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen SMMUv3 driver only supports stage-2 translation. Add support for
Stage-1 translation that is required to support nested stage
translation.

In true nested mode, both s1_cfg and s2_cfg will coexist.
Let's remove the union. When nested stage translation is setup, both
s1_cfg and s2_cfg are valid.

We introduce a new smmu_domain abort field that will be set
upon guest stage-1 configuration passing. If no guest stage-1
config has been attached, it is ignored when writing the STE.

arm_smmu_write_strtab_ent() is modified to write both stage
fields in the STE and deal with the abort field.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 94 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
 2 files changed, 92 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index cbef3f8b36..866fe8de4d 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -686,8 +686,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 	 * 3. Update Config, sync
 	 */
 	u64 val = le64_to_cpu(dst[0]);
-	bool ste_live = false;
+	bool s1_live = false, s2_live = false, ste_live = false;
+	bool abort, translate = false;
 	struct arm_smmu_device *smmu = NULL;
+	struct arm_smmu_s1_cfg *s1_cfg = NULL;
 	struct arm_smmu_s2_cfg *s2_cfg = NULL;
 	struct arm_smmu_domain *smmu_domain = NULL;
 	struct arm_smmu_cmdq_ent prefetch_cmd = {
@@ -702,30 +704,54 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		smmu = master->smmu;
 	}
 
-	if (smmu_domain)
-		s2_cfg = &smmu_domain->s2_cfg;
+	if (smmu_domain) {
+		switch (smmu_domain->stage) {
+		case ARM_SMMU_DOMAIN_NESTED:
+			s1_cfg = &smmu_domain->s1_cfg;
+			fallthrough;
+		case ARM_SMMU_DOMAIN_S2:
+			s2_cfg = &smmu_domain->s2_cfg;
+			break;
+		default:
+			break;
+		}
+		translate = !!s1_cfg || !!s2_cfg;
+	}
 
 	if (val & STRTAB_STE_0_V) {
 		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
 		case STRTAB_STE_0_CFG_BYPASS:
 			break;
+		case STRTAB_STE_0_CFG_S1_TRANS:
+			s1_live = true;
+			break;
 		case STRTAB_STE_0_CFG_S2_TRANS:
-			ste_live = true;
+			s2_live = true;
+			break;
+		case STRTAB_STE_0_CFG_NESTED:
+			s1_live = true;
+			s2_live = true;
 			break;
 		case STRTAB_STE_0_CFG_ABORT:
-			BUG_ON(!disable_bypass);
 			break;
 		default:
 			BUG(); /* STE corruption */
 		}
 	}
 
+	ste_live = s1_live || s2_live;
+
 	/* Nuke the existing STE_0 value, as we're going to rewrite it */
 	val = STRTAB_STE_0_V;
 
 	/* Bypass/fault */
-	if (!smmu_domain || !(s2_cfg)) {
-		if (!smmu_domain && disable_bypass)
+	if (!smmu_domain)
+		abort = disable_bypass;
+	else
+		abort = smmu_domain->abort;
+
+	if (abort || !translate) {
+		if (abort)
 			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
 		else
 			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
@@ -743,8 +769,39 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		return;
 	}
 
+	if (ste_live) {
+		/* First invalidate the live STE */
+		dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
+		arm_smmu_sync_ste_for_sid(smmu, sid);
+	}
+
+	if (s1_cfg) {
+		BUG_ON(s1_live);
+		dst[1] = cpu_to_le64(
+			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
+			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
+
+		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
+		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
+			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
+
+		val |= (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
+			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
+			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
+	}
+
 	if (s2_cfg) {
-		BUG_ON(ste_live);
+		u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
+
+		if (s2_live) {
+			u64 s2ttb = le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
+			BUG_ON(s2ttb != vttbr);
+		}
+
 		dst[2] = cpu_to_le64(
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
@@ -754,9 +811,12 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
 			 STRTAB_STE_2_S2R);
 
-		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
+		dst[3] = cpu_to_le64(vttbr);
 
 		val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	} else {
+		dst[2] = 0;
+		dst[3] = 0;
 	}
 
 	if (master->ats_enabled)
@@ -1259,6 +1319,15 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 {
 	int ret;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+
+	if (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED &&
+		(!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+		 !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
+			dev_info(smmu_domain->smmu->dev,
+					"does not implement two stages\n");
+			return -EINVAL;
+	}
 
 	/* Restrict the stage to what we can actually support */
 	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
@@ -2307,11 +2376,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->features |= ARM_SMMU_FEAT_STALLS;
 	}
 
+	if (reg & IDR0_S1P)
+		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
+
 	if (reg & IDR0_S2P)
 		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
 
-	if (!(reg & IDR0_S2P)) {
-		dev_err(smmu->dev, "no stage-2 translation support!\n");
+	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
 
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index b3bc7d64c7..e270fe05e0 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -197,6 +197,7 @@
 #define STRTAB_STE_0_CFG_BYPASS		4
 #define STRTAB_STE_0_CFG_S1_TRANS	5
 #define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_CFG_NESTED		7
 
 #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
 #define STRTAB_STE_0_S1FMT_LINEAR	0
@@ -547,6 +548,12 @@ struct arm_smmu_strtab_l1_desc {
 	dma_addr_t			l2ptr_dma;
 };
 
+struct arm_smmu_s1_cfg {
+	u64				s1ctxptr;
+	u8				s1fmt;
+	u8				s1cdmax;
+};
+
 struct arm_smmu_s2_cfg {
 	u16				vmid;
 	u64				vttbr;
@@ -667,7 +674,9 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
 
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_s1_cfg	s1_cfg;
 	struct arm_smmu_s2_cfg	s2_cfg;
+	bool			abort;
 
 	/* Xen domain associated with this SMMU domain */
 	struct domain		*d;
-- 
2.25.1


