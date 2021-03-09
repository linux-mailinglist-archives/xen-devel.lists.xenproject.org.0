Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192ED332E22
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 19:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95669.180633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgzb-0000Uw-B5; Tue, 09 Mar 2021 18:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95669.180633; Tue, 09 Mar 2021 18:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgzb-0000UW-5r; Tue, 09 Mar 2021 18:22:03 +0000
Received: by outflank-mailman (input) for mailman id 95669;
 Tue, 09 Mar 2021 18:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w89V=IH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lJgzZ-0000UK-65
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 18:22:01 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cc954cf3-1bab-4721-a5c4-6f51a19f6ae5;
 Tue, 09 Mar 2021 18:21:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CAD531B;
 Tue,  9 Mar 2021 10:21:59 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334BC3F73C;
 Tue,  9 Mar 2021 10:21:58 -0800 (PST)
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
X-Inumbo-ID: cc954cf3-1bab-4721-a5c4-6f51a19f6ae5
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/5] xen/arm: smmuv1: Keep track of S2CR state
Date: Tue,  9 Mar 2021 18:19:27 +0000
Message-Id: <d70aaefe307eba94dda0d15468ad81fd7069c4ef.1615312254.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>

Backport commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
"iommu/arm-smmu: Keep track of S2CR state" from the Linux kernel.

This patch is the preparatory work to fix the stream match conflict
when two devices have the same stream-id.

Original commit message:

Making S2CRs first-class citizens within the driver with a high-level
representation of their state offers a neat solution to a few problems:

Firstly, the information about which context a device's stream IDs are
associated with is already present by necessity in the S2CR. With that
state easily accessible we can refer directly to it and obviate the need
to track an IOMMU domain in each device's archdata (its earlier purpose
of enforcing correct attachment of multi-device groups now being handled
by the IOMMU core itself).

Secondly, the core API now deprecates explicit domain detach and expects
domain attach to move devices smoothly from one domain to another; for
SMMUv2, this notion maps directly to simply rewriting the S2CRs assigned
to the device. By giving the driver a suitable abstraction of those
S2CRs to work with, we can massively reduce the overhead of the current
heavy-handed "detach, free resources, reallocate resources, attach"
approach.

Thirdly, making the software state hardware-shaped and attached to the
SMMU instance once again makes suspend/resume of this register group
that much simpler to implement in future.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 150 +++++++++++++++++------------
 1 file changed, 89 insertions(+), 61 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c41e94f836..e1b937bd4b 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -444,9 +444,20 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define S2CR_CBNDX_MASK			0xff
 #define S2CR_TYPE_SHIFT			16
 #define S2CR_TYPE_MASK			0x3
-#define S2CR_TYPE_TRANS			(0 << S2CR_TYPE_SHIFT)
-#define S2CR_TYPE_BYPASS		(1 << S2CR_TYPE_SHIFT)
-#define S2CR_TYPE_FAULT			(2 << S2CR_TYPE_SHIFT)
+enum arm_smmu_s2cr_type {
+	S2CR_TYPE_TRANS,
+	S2CR_TYPE_BYPASS,
+	S2CR_TYPE_FAULT,
+};
+
+#define S2CR_PRIVCFG_SHIFT		24
+#define S2CR_PRIVCFG_MASK		0x3
+enum arm_smmu_s2cr_privcfg {
+	S2CR_PRIVCFG_DEFAULT,
+	S2CR_PRIVCFG_DIPAN,
+	S2CR_PRIVCFG_UNPRIV,
+	S2CR_PRIVCFG_PRIV,
+};
 
 /* Context bank attribute registers */
 #define ARM_SMMU_GR1_CBAR(n)		(0x0 + ((n) << 2))
@@ -585,6 +596,16 @@ enum arm_smmu_arch_version {
 	ARM_SMMU_V2,
 };
 
+struct arm_smmu_s2cr {
+	enum arm_smmu_s2cr_type		type;
+	enum arm_smmu_s2cr_privcfg	privcfg;
+	u8				cbndx;
+};
+
+#define s2cr_init_val (struct arm_smmu_s2cr){				\
+	.type = S2CR_TYPE_FAULT                                 \
+}
+
 struct arm_smmu_smr {
 	u16				mask;
 	u16				id;
@@ -631,6 +652,7 @@ struct arm_smmu_device {
 	u16				streamid_mask;
 	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
+	struct arm_smmu_s2cr		*s2crs;
 
 	unsigned long			s1_input_size;
 	unsigned long			s1_output_size;
@@ -1411,6 +1433,23 @@ static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 	writel_relaxed(reg, ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx));
 }
 
+static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
+	u32 reg = (s2cr->type & S2CR_TYPE_MASK) << S2CR_TYPE_SHIFT |
+		  (s2cr->cbndx & S2CR_CBNDX_MASK) << S2CR_CBNDX_SHIFT |
+		  (s2cr->privcfg & S2CR_PRIVCFG_MASK) << S2CR_PRIVCFG_SHIFT;
+
+	writel_relaxed(reg, ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx));
+}
+
+static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
+{
+	arm_smmu_write_s2cr(smmu, idx);
+	if (smmu->smrs)
+		arm_smmu_write_smr(smmu, idx);
+}
+
 static int arm_smmu_master_alloc_smes(struct arm_smmu_device *smmu,
 				      struct arm_smmu_master_cfg *cfg)
 {
@@ -1461,6 +1500,23 @@ static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
 {
 	int i;
 
+	/*
+	 * We *must* clear the S2CR first, because freeing the SMR means
+	 * that it can be re-allocated immediately.
+	 */
+	for (i = 0; i < cfg->num_streamids; ++i) {
+		int idx = cfg->smendx[i];
+
+		/* An IOMMU group is torn down by the first device to be removed */
+		if (idx == INVALID_SMENDX)
+			return;
+
+		smmu->s2crs[idx] = s2cr_init_val;
+		arm_smmu_write_s2cr(smmu, idx);
+	}
+	/* Sync S2CR updates before touching anything else */
+	__iowmb();
+
 	/* Invalidate the SMRs before freeing back to the allocator */
 	for (i = 0; i < cfg->num_streamids; ++i) {
 		if (smmu->smrs)
@@ -1473,51 +1529,30 @@ static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_master_cfg *cfg)
 {
-	int i, ret;
+	int i, ret = 0;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
+	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
+	u8 cbndx = smmu_domain->cfg.cbndx;
 
-	/* Devices in an IOMMU group may already be configured */
-	ret = arm_smmu_master_alloc_smes(smmu, cfg);
+	if (cfg->smendx[0] == INVALID_SMENDX)
+		ret = arm_smmu_master_alloc_smes(smmu, cfg);
 	if (ret)
-		return ret == -EEXIST ? 0 : ret;
-
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		u32 idx, s2cr;
-
-		idx = cfg->smendx[i];
-		s2cr = S2CR_TYPE_TRANS |
-		       (smmu_domain->cfg.cbndx << S2CR_CBNDX_SHIFT);
-		writel_relaxed(s2cr, gr0_base + ARM_SMMU_GR0_S2CR(idx));
-	}
-
-	return 0;
-}
-
-static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
-					  struct arm_smmu_master_cfg *cfg)
-{
-	int i;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
+		return ret;
 
-	/*
-	 * We *must* clear the S2CR first, because freeing the SMR means
-	 * that it can be re-allocated immediately.
-	 * Xen: Unlike Linux, any access to non-configured stream will fault.
-	 */
 	for (i = 0; i < cfg->num_streamids; ++i) {
 		int idx = cfg->smendx[i];
 
-		/* An IOMMU group is torn down by the first device to be removed */
-		if (idx == INVALID_SMENDX)
-			return;
+		/* Devices in an IOMMU group may already be configured */
+		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
+			break;
 
-		writel_relaxed(S2CR_TYPE_FAULT,
-			       gr0_base + ARM_SMMU_GR0_S2CR(idx));
+		s2cr[idx].type = type ;
+		s2cr[idx].privcfg = S2CR_PRIVCFG_UNPRIV;
+		s2cr[idx].cbndx = cbndx;
+		arm_smmu_write_s2cr(smmu, idx);
 	}
-
-	arm_smmu_master_free_smes(smmu, cfg);
+	return 0;
 }
 
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
@@ -1564,24 +1599,17 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	if (!cfg)
 		return -ENODEV;
 
-	ret = arm_smmu_domain_add_master(smmu_domain, cfg);
-
-	if (!ret)
-		dev_iommu_domain(dev) = domain;
-	return ret;
+	return arm_smmu_domain_add_master(smmu_domain, cfg);
 }
 
 static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	struct arm_smmu_domain *smmu_domain = domain->priv;
-	struct arm_smmu_master_cfg *cfg;
+	struct arm_smmu_device *smmu = find_smmu_for_device(dev);
+	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
 
-	cfg = find_smmu_master_cfg(dev);
-	if (!cfg)
-		return;
+	if (smmu && cfg)
+		arm_smmu_master_free_smes(smmu, cfg);
 
-	dev_iommu_domain(dev) = NULL;
-	arm_smmu_domain_remove_master(smmu_domain, cfg);
 }
 
 #if 0 /*
@@ -2039,16 +2067,8 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	 * Reset stream mapping groups: Initial values mark all SMRn as
 	 * invalid and all S2CRn as bypass unless overridden.
 	 */
-	for (i = 0; i < smmu->num_mapping_groups; ++i) {
-		if (smmu->smrs)
-			arm_smmu_write_smr(smmu, i);
-		/*
-		 * Xen: Unlike Linux, any access to a non-configure stream
-		 * will fault by default.
-		 */
-		writel_relaxed(S2CR_TYPE_FAULT,
-			gr0_base + ARM_SMMU_GR0_S2CR(i));
-	}
+	for (i = 0; i < smmu->num_mapping_groups; ++i)
+		arm_smmu_write_sme(smmu, i);
 
 	/* Make sure all context banks are disabled and clear CB_FSR  */
 	for (i = 0; i < smmu->num_context_banks; ++i) {
@@ -2110,6 +2130,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	unsigned long size;
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
 	u32 id;
+	int i;
 
 	dev_notice(smmu->dev, "probing hardware configuration...\n");
 	dev_notice(smmu->dev, "SMMUv%d with:\n", smmu->version);
@@ -2193,6 +2214,13 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 			   "\tstream matching with %lu register groups, mask 0x%x",
 			   size, smmu->smr_mask_mask);
 	}
+	/* s2cr->type == 0 means translation, so initialise explicitly */
+	smmu->s2crs = kmalloc_array(size, sizeof(*smmu->s2crs), GFP_KERNEL);
+	if (!smmu->s2crs)
+		return -ENOMEM;
+	for (i = 0; i < size; i++)
+		smmu->s2crs[i] = s2cr_init_val;
+
 	smmu->num_mapping_groups = size;
 
 	/* ID1 */
-- 
2.17.1


