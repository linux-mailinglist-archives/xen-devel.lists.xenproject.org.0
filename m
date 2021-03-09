Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1A332E20
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 19:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95664.180621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgyr-0000LK-0K; Tue, 09 Mar 2021 18:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95664.180621; Tue, 09 Mar 2021 18:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgyq-0000Ki-Sh; Tue, 09 Mar 2021 18:21:16 +0000
Received: by outflank-mailman (input) for mailman id 95664;
 Tue, 09 Mar 2021 18:21:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w89V=IH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lJgyo-0000Kb-OU
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 18:21:14 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 35db3013-48de-43b5-bb78-1dcfefbaff42;
 Tue, 09 Mar 2021 18:21:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DACA331B;
 Tue,  9 Mar 2021 10:21:13 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D84C03F73C;
 Tue,  9 Mar 2021 10:21:12 -0800 (PST)
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
X-Inumbo-ID: 35db3013-48de-43b5-bb78-1dcfefbaff42
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/5] xen/arm: smmuv1: Consolidate stream map entry state
Date: Tue,  9 Mar 2021 18:19:26 +0000
Message-Id: <be547b9f850217a96660ec122ca2aa96bd7eb273.1615312254.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>

Backport commit 1f3d5ca43019bff1105838712d55be087d93c0da
"iommu/arm-smmu: Consolidate stream map entry state" from the Linux
kernel.

This patch is the preparatory work to fix the stream match conflict
when two devices have the same stream-id.

Original commit message:

In order to consider SMR masking, we really want to be able to validate
ID/mask pairs against existing SMR contents to prevent stream match
conflicts, which at best would cause transactions to fault unexpectedly,
and at worst lead to silent unpredictable behaviour. With our SMMU
instance data holding only an allocator bitmap, and the SMR values
themselves scattered across master configs hanging off devices which we
may have no way of finding, there's essentially no way short of digging
everything back out of the hardware. Similarly, the thought of power
management ops to support suspend/resume faces the exact same problem.

By massaging the software state into a closer shape to the underlying
hardware, everything comes together quite nicely; the allocator and the
high-level view of the data become a single centralised state which we
can easily keep track of, and to which any updates can be validated in
full before being synchronised to the hardware itself.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 138 +++++++++++++++++------------
 1 file changed, 79 insertions(+), 59 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index adfab8ee84..c41e94f836 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -308,9 +308,6 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 /* Maximum number of context banks per SMMU */
 #define ARM_SMMU_MAX_CBS		128
 
-/* Maximum number of mapping groups per SMMU */
-#define ARM_SMMU_MAX_SMRS		128
-
 /* SMMU global address space */
 #define ARM_SMMU_GR0(smmu)		((smmu)->base)
 #define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
@@ -589,16 +586,17 @@ enum arm_smmu_arch_version {
 };
 
 struct arm_smmu_smr {
-	u8				idx;
 	u16				mask;
 	u16				id;
+	bool				valid;
 };
 
 struct arm_smmu_master_cfg {
 	int				num_streamids;
 	u16				streamids[MAX_MASTER_STREAMIDS];
-	struct arm_smmu_smr		*smrs;
+	s16				smendx[MAX_MASTER_STREAMIDS];
 };
+#define INVALID_SMENDX			-1
 
 struct arm_smmu_master {
 	struct device_node		*of_node;
@@ -632,7 +630,7 @@ struct arm_smmu_device {
 	u32				num_mapping_groups;
 	u16				streamid_mask;
 	u16				smr_mask_mask;
-	DECLARE_BITMAP(smr_map, ARM_SMMU_MAX_SMRS);
+	struct arm_smmu_smr		*smrs;
 
 	unsigned long			s1_input_size;
 	unsigned long			s1_output_size;
@@ -818,6 +816,7 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 			return -ERANGE;
 		}
 		master->cfg.streamids[i] = streamid;
+		master->cfg.smendx[i] = INVALID_SMENDX;
 	}
 	return insert_smmu_master(smmu, master);
 }
@@ -1384,79 +1383,91 @@ static void arm_smmu_domain_destroy(struct iommu_domain *domain)
 	kfree(smmu_domain);
 }
 
-static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
-					  struct arm_smmu_master_cfg *cfg)
+static int arm_smmu_alloc_smr(struct arm_smmu_device *smmu)
 {
 	int i;
-	struct arm_smmu_smr *smrs;
-	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
 
-	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH))
-		return 0;
+	for (i = 0; i < smmu->num_mapping_groups; i++)
+		if (!cmpxchg(&smmu->smrs[i].valid, false, true))
+			return i;
 
-	if (cfg->smrs)
-		return -EEXIST;
+	return INVALID_SMENDX;
+}
 
-	smrs = kmalloc_array(cfg->num_streamids, sizeof(*smrs), GFP_KERNEL);
-	if (!smrs) {
-		dev_err(smmu->dev, "failed to allocate %d SMRs\n",
-			cfg->num_streamids);
-		return -ENOMEM;
-	}
+static void arm_smmu_free_smr(struct arm_smmu_device *smmu, int idx)
+{
+	writel_relaxed(~SMR_VALID, ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx));
+	write_atomic(&smmu->smrs[idx].valid, false);
+}
+
+static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_smr *smr = smmu->smrs + idx;
+	u32 reg = (smr->id & smmu->streamid_mask) << SMR_ID_SHIFT |
+		  (smr->mask & smmu->smr_mask_mask) << SMR_MASK_SHIFT;
+
+	if (smr->valid)
+		reg |= SMR_VALID;
+	writel_relaxed(reg, ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx));
+}
+
+static int arm_smmu_master_alloc_smes(struct arm_smmu_device *smmu,
+				      struct arm_smmu_master_cfg *cfg)
+{
+	struct arm_smmu_smr *smrs = smmu->smrs;
+	int i, idx;
 
 	/* Allocate the SMRs on the SMMU */
 	for (i = 0; i < cfg->num_streamids; ++i) {
-		int idx = __arm_smmu_alloc_bitmap(smmu->smr_map, 0,
-						  smmu->num_mapping_groups);
+		if (cfg->smendx[i] != INVALID_SMENDX)
+			return -EEXIST;
+
+		/* ...except on stream indexing hardware, of course */
+		if (!smrs) {
+			cfg->smendx[i] = cfg->streamids[i];
+			continue;
+		}
+
+		idx = arm_smmu_alloc_smr(smmu);
 		if (IS_ERR_VALUE(idx)) {
 			dev_err(smmu->dev, "failed to allocate free SMR\n");
 			goto err_free_smrs;
 		}
+		cfg->smendx[i] = idx;
 
-		smrs[i] = (struct arm_smmu_smr) {
-			.idx	= idx,
-			.mask	= 0, /* We don't currently share SMRs */
-			.id	= cfg->streamids[i],
-		};
+		smrs[idx].id = cfg->streamids[i];
+		smrs[idx].mask = 0; /* We don't currently share SMRs */
 	}
 
+	if (!smrs)
+		return 0;
+
 	/* It worked! Now, poke the actual hardware */
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		u32 reg = SMR_VALID | smrs[i].id << SMR_ID_SHIFT |
-			  smrs[i].mask << SMR_MASK_SHIFT;
-		writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_SMR(smrs[i].idx));
-	}
+	for (i = 0; i < cfg->num_streamids; ++i)
+		arm_smmu_write_smr(smmu, cfg->smendx[i]);
 
-	cfg->smrs = smrs;
 	return 0;
 
 err_free_smrs:
-	while (--i >= 0)
-		__arm_smmu_free_bitmap(smmu->smr_map, smrs[i].idx);
-	kfree(smrs);
+	while (i--) {
+		arm_smmu_free_smr(smmu, cfg->smendx[i]);
+		cfg->smendx[i] = INVALID_SMENDX;
+	}
 	return -ENOSPC;
 }
 
-static void arm_smmu_master_free_smrs(struct arm_smmu_device *smmu,
+static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
 				      struct arm_smmu_master_cfg *cfg)
 {
 	int i;
-	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
-	struct arm_smmu_smr *smrs = cfg->smrs;
-
-	if (!smrs)
-		return;
 
 	/* Invalidate the SMRs before freeing back to the allocator */
 	for (i = 0; i < cfg->num_streamids; ++i) {
-		u8 idx = smrs[i].idx;
+		if (smmu->smrs)
+			arm_smmu_free_smr(smmu, cfg->smendx[i]);
 
-		writel_relaxed(~SMR_VALID, gr0_base + ARM_SMMU_GR0_SMR(idx));
-		__arm_smmu_free_bitmap(smmu->smr_map, idx);
+		cfg->smendx[i] = INVALID_SMENDX;
 	}
-
-	cfg->smrs = NULL;
-	kfree(smrs);
 }
 
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
@@ -1467,14 +1478,14 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
 
 	/* Devices in an IOMMU group may already be configured */
-	ret = arm_smmu_master_configure_smrs(smmu, cfg);
+	ret = arm_smmu_master_alloc_smes(smmu, cfg);
 	if (ret)
 		return ret == -EEXIST ? 0 : ret;
 
 	for (i = 0; i < cfg->num_streamids; ++i) {
 		u32 idx, s2cr;
 
-		idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
+		idx = cfg->smendx[i];
 		s2cr = S2CR_TYPE_TRANS |
 		       (smmu_domain->cfg.cbndx << S2CR_CBNDX_SHIFT);
 		writel_relaxed(s2cr, gr0_base + ARM_SMMU_GR0_S2CR(idx));
@@ -1490,23 +1501,23 @@ static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
 
-	/* An IOMMU group is torn down by the first device to be removed */
-	if ((smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) && !cfg->smrs)
-		return;
-
 	/*
 	 * We *must* clear the S2CR first, because freeing the SMR means
 	 * that it can be re-allocated immediately.
 	 * Xen: Unlike Linux, any access to non-configured stream will fault.
 	 */
 	for (i = 0; i < cfg->num_streamids; ++i) {
-		u32 idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
+		int idx = cfg->smendx[i];
+
+		/* An IOMMU group is torn down by the first device to be removed */
+		if (idx == INVALID_SMENDX)
+			return;
 
 		writel_relaxed(S2CR_TYPE_FAULT,
 			       gr0_base + ARM_SMMU_GR0_S2CR(idx));
 	}
 
-	arm_smmu_master_free_smrs(smmu, cfg);
+	arm_smmu_master_free_smes(smmu, cfg);
 }
 
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
@@ -2017,16 +2028,20 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
 	void __iomem *cb_base;
-	int i = 0;
+	int i;
 	u32 reg;
 
 	/* clear global FSR */
 	reg = readl_relaxed(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
 	writel(reg, ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
 
-	/* Mark all SMRn as invalid and all S2CRn as bypass */
+	/*
+	 * Reset stream mapping groups: Initial values mark all SMRn as
+	 * invalid and all S2CRn as bypass unless overridden.
+	 */
 	for (i = 0; i < smmu->num_mapping_groups; ++i) {
-		writel_relaxed(0, gr0_base + ARM_SMMU_GR0_SMR(i));
+		if (smmu->smrs)
+			arm_smmu_write_smr(smmu, i);
 		/*
 		 * Xen: Unlike Linux, any access to a non-configure stream
 		 * will fault by default.
@@ -2169,6 +2184,11 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
 		smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
 
+		/* Zero-initialised to mark as invalid */
+		smmu->smrs = devm_kzalloc(smmu->dev, sizeof(*smmu->smrs), GFP_KERNEL);
+		if (!smmu->smrs)
+			return -ENOMEM;
+
 		dev_notice(smmu->dev,
 			   "\tstream matching with %lu register groups, mask 0x%x",
 			   size, smmu->smr_mask_mask);
-- 
2.17.1


