Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02632344ACF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100341.191139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONCC-0002Vi-JG; Mon, 22 Mar 2021 16:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100341.191139; Mon, 22 Mar 2021 16:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONCC-0002V1-Cd; Mon, 22 Mar 2021 16:14:24 +0000
Received: by outflank-mailman (input) for mailman id 100341;
 Mon, 22 Mar 2021 16:14:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JfP=IU=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lONCA-0002US-Sw
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:14:22 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0c1d9c19-5ffc-4d73-8821-6a0a5fb3455a;
 Mon, 22 Mar 2021 16:14:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43071042;
 Mon, 22 Mar 2021 09:14:21 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E493F719;
 Mon, 22 Mar 2021 09:14:20 -0700 (PDT)
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
X-Inumbo-ID: 0c1d9c19-5ffc-4d73-8821-6a0a5fb3455a
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 5/5] xen/arm: smmuv1: Intelligent SMR allocation
Date: Mon, 22 Mar 2021 16:11:39 +0000
Message-Id: <48ce5f4e4558cbbc3b09431e2a0dcf6f3c594fca.1616428314.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1616428314.git.rahul.singh@arm.com>
References: <cover.1616428314.git.rahul.singh@arm.com>
In-Reply-To: <cover.1616428314.git.rahul.singh@arm.com>
References: <cover.1616428314.git.rahul.singh@arm.com>

Backport 588888a7399db352d2b1a41c9d5b3bf0fd482390
"iommu/arm-smmu: Intelligent SMR allocation" from the Linux kernel

This patch fix the stream match conflict issue when two devices have the
same stream-id.

Only difference while applying this patch with regard to Linux patch are
as follows:
1. Spinlock is used in place of mutex when attaching a device to the
   SMMU via arm_smmu_master_alloc_smes(..) function call.Replacing the
   mutex with spinlock is fine here as we are configuring the hardware
   via registers and it is very fast.

2. move iommu_group_alloc(..) function call in arm_smmu_add_device(..)
   function from the start of the function to the end.

Original commit message:
    iommu/arm-smmu: Intelligent SMR allocation

    Stream Match Registers are one of the more awkward parts of the SMMUv2
    architecture; there are typically never enough to assign one to each
    stream ID in the system, and configuring them such that a single ID
    matches multiple entries is catastrophically bad - at best, every
    transaction raises a global fault; at worst, they go *somewhere*.

    To address the former issue, we can mask ID bits such that a single
    register may be used to match multiple IDs belonging to the same device
    or group, but doing so also heightens the risk of the latter problem
    (which can be nasty to debug).

    Tackle both problems at once by replacing the simple bitmap allocator
    with something much cleverer. Now that we have convenient in-memory
    representations of the stream mapping table, it becomes straightforward
    to properly validate new SMR entries against the current state, opening
    the door to arbitrary masking and SMR sharing.

    Another feature which falls out of this is that with IDs shared by
    separate devices being automatically accounted for, simply associating a
    group pointer with the S2CR offers appropriate group allocation almost
    for free, so hook that up in the process.

    Signed-off-by: Robin Murphy <robin.murphy@arm.com>
    Signed-off-by: Will Deacon <will.deacon@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 230 ++++++++++++++++++-----------
 1 file changed, 142 insertions(+), 88 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 2c1ea8e6ff..20ac672e91 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -597,6 +597,8 @@ enum arm_smmu_arch_version {
 };
 
 struct arm_smmu_s2cr {
+	struct iommu_group		*group;
+	int				count;
 	enum arm_smmu_s2cr_type		type;
 	enum arm_smmu_s2cr_privcfg	privcfg;
 	u8				cbndx;
@@ -613,6 +615,7 @@ struct arm_smmu_smr {
 };
 
 struct arm_smmu_master_cfg {
+	struct arm_smmu_device		*smmu;
 	int				num_streamids;
 	u16				streamids[MAX_MASTER_STREAMIDS];
 	s16				smendx[MAX_MASTER_STREAMIDS];
@@ -655,6 +658,7 @@ struct arm_smmu_device {
 	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_s2cr		*s2crs;
+	spinlock_t			stream_map_lock;
 
 	unsigned long			s1_input_size;
 	unsigned long			s1_output_size;
@@ -1407,23 +1411,6 @@ static void arm_smmu_domain_destroy(struct iommu_domain *domain)
 	kfree(smmu_domain);
 }
 
-static int arm_smmu_alloc_smr(struct arm_smmu_device *smmu)
-{
-	int i;
-
-	for (i = 0; i < smmu->num_mapping_groups; i++)
-		if (!cmpxchg(&smmu->smrs[i].valid, false, true))
-			return i;
-
-	return INVALID_SMENDX;
-}
-
-static void arm_smmu_free_smr(struct arm_smmu_device *smmu, int idx)
-{
-	writel_relaxed(~SMR_VALID, ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx));
-	write_atomic(&smmu->smrs[idx].valid, false);
-}
-
 static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_smr *smr = smmu->smrs + idx;
@@ -1452,98 +1439,143 @@ static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
 		arm_smmu_write_smr(smmu, idx);
 }
 
-static int arm_smmu_master_alloc_smes(struct arm_smmu_device *smmu,
-				      struct arm_smmu_master_cfg *cfg)
+static int arm_smmu_find_sme(struct arm_smmu_device *smmu, u16 id, u16 mask)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	int i, idx;
+	int i, free_idx = -ENOSPC;
 
-	/* Allocate the SMRs on the SMMU */
-	for_each_cfg_sme(cfg, i, idx) {
-		if (idx != INVALID_SMENDX)
-			return -EEXIST;
+	/* Stream indexing is blissfully easy */
+	if (!smrs)
+		return id;
 
-		/* ...except on stream indexing hardware, of course */
-		if (!smrs) {
-			cfg->smendx[i] = cfg->streamids[i];
+	/* Validating SMRs is... less so */
+	for (i = 0; i < smmu->num_mapping_groups; ++i) {
+		if (!smrs[i].valid) {
+			/*
+			 * Note the first free entry we come across, which
+			 * we'll claim in the end if nothing else matches.
+			 */
+			if (free_idx < 0)
+				free_idx = i;
 			continue;
 		}
+		/*
+		 * If the new entry is _entirely_ matched by an existing entry,
+		 * then reuse that, with the guarantee that there also cannot
+		 * be any subsequent conflicting entries. In normal use we'd
+		 * expect simply identical entries for this case, but there's
+		 * no harm in accommodating the generalisation.
+		 */
+		if ((mask & smrs[i].mask) == mask &&
+		    !((id ^ smrs[i].id) & ~smrs[i].mask))
+			return i;
+		/*
+		 * If the new entry has any other overlap with an existing one,
+		 * though, then there always exists at least one stream ID
+		 * which would cause a conflict, and we can't allow that risk.
+		 */
+		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
+			return -EINVAL;
+	}
 
-		idx = arm_smmu_alloc_smr(smmu);
-		if (IS_ERR_VALUE(idx)) {
-			dev_err(smmu->dev, "failed to allocate free SMR\n");
-			goto err_free_smrs;
+	return free_idx;
+}
+
+static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
+{
+	if (--smmu->s2crs[idx].count)
+		return false;
+
+	smmu->s2crs[idx] = s2cr_init_val;
+	if (smmu->smrs)
+		smmu->smrs[idx].valid = false;
+
+	return true;
+}
+
+static int arm_smmu_master_alloc_smes(struct device *dev)
+{
+	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
+	struct arm_smmu_device *smmu = cfg->smmu;
+	struct arm_smmu_smr *smrs = smmu->smrs;
+	struct iommu_group *group;
+	int i, idx, ret;
+
+	spin_lock(&smmu->stream_map_lock);
+	/* Figure out a viable stream map entry allocation */
+	for_each_cfg_sme(cfg, i, idx) {
+		if (idx != INVALID_SMENDX) {
+			ret = -EEXIST;
+			goto out_err;
 		}
-		cfg->smendx[i] = idx;
 
-		smrs[idx].id = cfg->streamids[i];
-		smrs[idx].mask = 0; /* We don't currently share SMRs */
+		ret = arm_smmu_find_sme(smmu, cfg->streamids[i], 0);
+		if (ret < 0)
+			goto out_err;
+
+		idx = ret;
+		if (smrs && smmu->s2crs[idx].count == 0) {
+			smrs[idx].id = cfg->streamids[i];
+			smrs[idx].mask = 0; /* We don't currently share SMRs */
+			smrs[idx].valid = true;
+		}
+		smmu->s2crs[idx].count++;
+		cfg->smendx[i] = (s16)idx;
 	}
 
-	if (!smrs)
-		return 0;
+	group = iommu_group_get(dev);
+	if (!group)
+		group = ERR_PTR(-ENOMEM);
+	if (IS_ERR(group)) {
+		ret = PTR_ERR(group);
+		goto out_err;
+	}
+	iommu_group_put(group);
 
 	/* It worked! Now, poke the actual hardware */
-	for_each_cfg_sme(cfg, i, idx)
-		arm_smmu_write_smr(smmu, idx);
+	for_each_cfg_sme(cfg, i, idx) {
+		arm_smmu_write_sme(smmu, idx);
+		smmu->s2crs[idx].group = group;
+	}
 
+	spin_unlock(&smmu->stream_map_lock);
 	return 0;
 
-err_free_smrs:
+out_err:
 	while (i--) {
-		arm_smmu_free_smr(smmu, cfg->smendx[i]);
+		arm_smmu_free_sme(smmu, cfg->smendx[i]);
 		cfg->smendx[i] = INVALID_SMENDX;
 	}
-	return -ENOSPC;
+	spin_unlock(&smmu->stream_map_lock);
+	return ret;
 }
 
-static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
-				      struct arm_smmu_master_cfg *cfg)
+static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg)
 {
+    struct arm_smmu_device *smmu = cfg->smmu;
 	int i, idx;
 
-	/*
-	 * We *must* clear the S2CR first, because freeing the SMR means
-	 * that it can be re-allocated immediately.
-	 */
+	spin_lock(&smmu->stream_map_lock);
 	for_each_cfg_sme(cfg, i, idx) {
-		/* An IOMMU group is torn down by the first device to be removed */
-		if (idx == INVALID_SMENDX)
-			return;
-
-		smmu->s2crs[idx] = s2cr_init_val;
-		arm_smmu_write_s2cr(smmu, idx);
-	}
-	/* Sync S2CR updates before touching anything else */
-	__iowmb();
-
-	/* Invalidate the SMRs before freeing back to the allocator */
-	for_each_cfg_sme(cfg, i, idx) {
-		if (smmu->smrs)
-			arm_smmu_free_smr(smmu, idx);
-
+		if (arm_smmu_free_sme(smmu, idx))
+			arm_smmu_write_sme(smmu, idx);
 		cfg->smendx[i] = INVALID_SMENDX;
 	}
+	spin_unlock(&smmu->stream_map_lock);
 }
 
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_master_cfg *cfg)
 {
-	int i, idx, ret = 0;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
 	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
 	u8 cbndx = smmu_domain->cfg.cbndx;
-
-	if (cfg->smendx[0] == INVALID_SMENDX)
-		ret = arm_smmu_master_alloc_smes(smmu, cfg);
-	if (ret)
-		return ret;
+	int i, idx;
 
 	for_each_cfg_sme(cfg, i, idx) {
-		/* Devices in an IOMMU group may already be configured */
 		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
-			break;
+			continue;
 
 		s2cr[idx].type = type ;
 		s2cr[idx].privcfg = S2CR_PRIVCFG_UNPRIV;
@@ -1602,11 +1634,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	struct arm_smmu_device *smmu = find_smmu_for_device(dev);
 	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
 
-	if (smmu && cfg)
-		arm_smmu_master_free_smes(smmu, cfg);
+	if (cfg)
+		arm_smmu_master_free_smes(cfg);
 
 }
 
@@ -1935,31 +1966,44 @@ static void __arm_smmu_release_pci_iommudata(void *data)
 	kfree(data);
 }
 
+static struct iommu_group *arm_smmu_device_group(struct
+						arm_smmu_master_cfg *cfg)
+{
+	struct arm_smmu_device *smmu = cfg->smmu;
+	struct iommu_group *group = NULL;
+	int i, idx;
+
+	for_each_cfg_sme(cfg, i, idx) {
+		if (group && smmu->s2crs[idx].group &&
+		    group != smmu->s2crs[idx].group)
+			return ERR_PTR(-EINVAL);
+
+		group = smmu->s2crs[idx].group;
+	}
+
+	if (group)
+		return group;
+
+	return NULL;
+}
+
 static int arm_smmu_add_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
 	void (*releasefn)(void *) = NULL;
-	int ret;
 
 	smmu = find_smmu_for_device(dev);
 	if (!smmu)
 		return -ENODEV;
 
-	group = iommu_group_alloc();
-	if (IS_ERR(group)) {
-		dev_err(dev, "Failed to allocate IOMMU group\n");
-		return PTR_ERR(group);
-	}
-
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 
 		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
 		if (!cfg) {
-			ret = -ENOMEM;
-			goto out_put_group;
+			return -ENOMEM;
 		}
 
 		cfg->num_streamids = 1;
@@ -1970,24 +2014,33 @@ static int arm_smmu_add_device(struct device *dev)
 		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
 				       &cfg->streamids[0]);
 		releasefn = __arm_smmu_release_pci_iommudata;
+		cfg->smmu = smmu;
 	} else {
 		struct arm_smmu_master *master;
 
 		master = find_smmu_master(smmu, dev->of_node);
 		if (!master) {
-			ret = -ENODEV;
-			goto out_put_group;
+			return -ENODEV;
 		}
 
 		cfg = &master->cfg;
+		cfg->smmu = smmu;
 	}
 
-	iommu_group_set_iommudata(group, cfg, releasefn);
-	ret = iommu_group_add_device(group, dev);
+	group = arm_smmu_device_group(cfg);
+	if (!group) {
+		group = iommu_group_alloc();
+		if (IS_ERR(group)) {
+			dev_err(dev, "Failed to allocate IOMMU group\n");
+			return PTR_ERR(group);
+		}
+	}
 
-out_put_group:
+	iommu_group_set_iommudata(group, cfg, releasefn);
+	iommu_group_add_device(group, dev);
 	iommu_group_put(group);
-	return ret;
+
+	return arm_smmu_master_alloc_smes(dev);
 }
 
 #if 0 /* Xen: We don't support remove device for now. Will be useful for PCI */
@@ -2220,6 +2273,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		smmu->s2crs[i] = s2cr_init_val;
 
 	smmu->num_mapping_groups = size;
+	spin_lock_init(&smmu->stream_map_lock);
 
 	/* ID1 */
 	id = readl_relaxed(gr0_base + ARM_SMMU_GR0_ID1);
-- 
2.17.1


