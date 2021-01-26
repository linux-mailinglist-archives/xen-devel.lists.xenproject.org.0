Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD1A304CDE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75651.136262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XIH-0003jD-36; Tue, 26 Jan 2021 22:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75651.136262; Tue, 26 Jan 2021 22:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XIH-0003in-04; Tue, 26 Jan 2021 22:58:41 +0000
Received: by outflank-mailman (input) for mailman id 75651;
 Tue, 26 Jan 2021 22:58:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4XIG-0003iY-9C
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:58:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d930bfd-3ef4-4617-ada3-9a6cd5293c4b;
 Tue, 26 Jan 2021 22:58:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F9622065C;
 Tue, 26 Jan 2021 22:58:38 +0000 (UTC)
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
X-Inumbo-ID: 6d930bfd-3ef4-4617-ada3-9a6cd5293c4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611701919;
	bh=X5JwX3pfbATTkWyuOF19GDXGj+hGTzEcnnjqPf/w56M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HBc15wq/Cc7HuYSUCxmZCh+vSR49F19odo6mrhOS0Dh2KMUNivcuYMWKk99rNBYOW
	 OAzC6n9O7EZJox3L8/ik7NjoEsUDGx5+i9EfWkD6PEsmdYCv/s1nZPMR1aRZdkE6Jj
	 mRQ6/8LsvxjgSDL7SnpgLYadGZ0vdASvSSD/TbiRFs9a9xWKlth/GpAL/UKeJHsPSe
	 ZtMNjbIM6S/4TM8pV8FwzNG6t/POK4QPtd+bwCUsuUwkigqjzHEck3T3BfQ9EqVWCK
	 psQnhFjr5cbO7FfYmqsK9h69hNUK2RXP1YV7bnzO+QoUiF1qOfDKMiD7Npa/k1q9vY
	 CvGAfkriTR/wQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 1/3] arm,smmu: switch to using iommu_fwspec functions
Date: Tue, 26 Jan 2021 14:58:34 -0800
Message-Id: <20210126225836.6017-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Modify the smmu driver so that it uses the iommu_fwspec helper
functions.  This means both ARM IOMMU drivers will both use the
iommu_fwspec helper functions, making enabling generic device tree
bindings in the SMMU driver much cleaner.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v3:
- add a comment in iommu_add_dt_device
- don't allocate fwspec twice in arm_smmu_add_device
- reuse existing fwspec pointer, don't add a second one
- add comment about supporting fwspec at the top of the file
---
 xen/drivers/passthrough/arm/smmu.c    | 98 ++++++++++++++++-----------
 xen/drivers/passthrough/device_tree.c |  7 ++
 2 files changed, 66 insertions(+), 39 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 3e8aa37866..3898d1d737 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -32,6 +32,9 @@
  *	- 4k and 64k pages, with contiguous pte hints.
  *	- Up to 48-bit addressing (dependent on VA_BITS)
  *	- Context fault reporting
+ *
+ * Changes compared to Linux driver:
+ *	- support for fwspec
  */
 
 
@@ -49,6 +52,7 @@
 #include <asm/atomic.h>
 #include <asm/device.h>
 #include <asm/io.h>
+#include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
 
 /* Xen: The below defines are redefined within the file. Undef it */
@@ -302,9 +306,6 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 
 /***** Start of Linux SMMU code *****/
 
-/* Maximum number of stream IDs assigned to a single device */
-#define MAX_MASTER_STREAMIDS		MAX_PHANDLE_ARGS
-
 /* Maximum number of context banks per SMMU */
 #define ARM_SMMU_MAX_CBS		128
 
@@ -597,8 +598,6 @@ struct arm_smmu_smr {
 };
 
 struct arm_smmu_master_cfg {
-	int				num_streamids;
-	u16				streamids[MAX_MASTER_STREAMIDS];
 	struct arm_smmu_smr		*smrs;
 };
 
@@ -686,6 +685,14 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ 0, NULL},
 };
 
+static inline struct iommu_fwspec *
+arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
+{
+	struct arm_smmu_master *master = container_of(cfg,
+			                                      struct arm_smmu_master, cfg);
+	return dev_iommu_fwspec_get(&master->of_node->dev);
+}
+
 static void parse_driver_options(struct arm_smmu_device *smmu)
 {
 	int i = 0;
@@ -779,8 +786,9 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
 {
-	int i;
+	int i, ret = 0;
 	struct arm_smmu_master *master;
+	struct iommu_fwspec *fwspec;
 
 	master = find_smmu_master(smmu, masterspec->np);
 	if (master) {
@@ -790,34 +798,37 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 		return -EBUSY;
 	}
 
-	if (masterspec->args_count > MAX_MASTER_STREAMIDS) {
-		dev_err(dev,
-			"reached maximum number (%d) of stream IDs for master device %s\n",
-			MAX_MASTER_STREAMIDS, masterspec->np->name);
-		return -ENOSPC;
-	}
-
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
+	master->of_node = masterspec->np;
 
-	master->of_node			= masterspec->np;
-	master->cfg.num_streamids	= masterspec->args_count;
+	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
+	if (ret) {
+		kfree(master);
+		return ret;
+	}
+	fwspec = dev_iommu_fwspec_get(dev);
+
+	/* adding the ids here */
+	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
+				   masterspec->args,
+				   masterspec->args_count);
+	if (ret)
+		return ret;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
 	dt_device_set_protected(masterspec->np);
 
-	for (i = 0; i < master->cfg.num_streamids; ++i) {
-		u16 streamid = masterspec->args[i];
-
-		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
-		     (streamid >= smmu->num_mapping_groups)) {
-			dev_err(dev,
-				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				masterspec->np->name, smmu->num_mapping_groups);
-			return -ERANGE;
+	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
+		for (i = 0; i < fwspec->num_ids; ++i) {
+			if (masterspec->args[i] >= smmu->num_mapping_groups) {
+				dev_err(dev,
+					"stream ID for master device %s greater than maximum allowed (%d)\n",
+					masterspec->np->name, smmu->num_mapping_groups);
+				return -ERANGE;
+			}
 		}
-		master->cfg.streamids[i] = streamid;
 	}
 	return insert_smmu_master(smmu, master);
 }
@@ -1390,6 +1401,7 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
 	int i;
 	struct arm_smmu_smr *smrs;
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
 	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH))
 		return 0;
@@ -1397,15 +1409,14 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
 	if (cfg->smrs)
 		return -EEXIST;
 
-	smrs = kmalloc_array(cfg->num_streamids, sizeof(*smrs), GFP_KERNEL);
+	smrs = kmalloc_array(fwspec->num_ids, sizeof(*smrs), GFP_KERNEL);
 	if (!smrs) {
-		dev_err(smmu->dev, "failed to allocate %d SMRs\n",
-			cfg->num_streamids);
+		dev_err(smmu->dev, "failed to allocate %d SMRs\n", fwspec->num_ids);
 		return -ENOMEM;
 	}
 
 	/* Allocate the SMRs on the SMMU */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < fwspec->num_ids; ++i) {
 		int idx = __arm_smmu_alloc_bitmap(smmu->smr_map, 0,
 						  smmu->num_mapping_groups);
 		if (IS_ERR_VALUE(idx)) {
@@ -1416,12 +1427,12 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
 		smrs[i] = (struct arm_smmu_smr) {
 			.idx	= idx,
 			.mask	= 0, /* We don't currently share SMRs */
-			.id	= cfg->streamids[i],
+			.id	= fwspec->ids[i],
 		};
 	}
 
 	/* It worked! Now, poke the actual hardware */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < fwspec->num_ids; ++i) {
 		u32 reg = SMR_VALID | smrs[i].id << SMR_ID_SHIFT |
 			  smrs[i].mask << SMR_MASK_SHIFT;
 		writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_SMR(smrs[i].idx));
@@ -1443,12 +1454,13 @@ static void arm_smmu_master_free_smrs(struct arm_smmu_device *smmu,
 	int i;
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
 	struct arm_smmu_smr *smrs = cfg->smrs;
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
 	if (!smrs)
 		return;
 
 	/* Invalidate the SMRs before freeing back to the allocator */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < fwspec->num_ids; ++i) {
 		u8 idx = smrs[i].idx;
 
 		writel_relaxed(~SMR_VALID, gr0_base + ARM_SMMU_GR0_SMR(idx));
@@ -1465,16 +1477,17 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	int i, ret;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
 	/* Devices in an IOMMU group may already be configured */
 	ret = arm_smmu_master_configure_smrs(smmu, cfg);
 	if (ret)
 		return ret == -EEXIST ? 0 : ret;
 
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < fwspec->num_ids; ++i) {
 		u32 idx, s2cr;
 
-		idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
+		idx = cfg->smrs ? cfg->smrs[i].idx : fwspec->ids[i];
 		s2cr = S2CR_TYPE_TRANS |
 		       (smmu_domain->cfg.cbndx << S2CR_CBNDX_SHIFT);
 		writel_relaxed(s2cr, gr0_base + ARM_SMMU_GR0_S2CR(idx));
@@ -1489,6 +1502,7 @@ static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
 	int i;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	void __iomem *gr0_base = ARM_SMMU_GR0(smmu);
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
 	/* An IOMMU group is torn down by the first device to be removed */
 	if ((smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) && !cfg->smrs)
@@ -1499,8 +1513,8 @@ static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
 	 * that it can be re-allocated immediately.
 	 * Xen: Unlike Linux, any access to non-configured stream will fault.
 	 */
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		u32 idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
+	for (i = 0; i < fwspec->num_ids; ++i) {
+		u32 idx = cfg->smrs ? cfg->smrs[i].idx : fwspec->ids[i];
 
 		writel_relaxed(S2CR_TYPE_FAULT,
 			       gr0_base + ARM_SMMU_GR0_S2CR(idx));
@@ -1903,9 +1917,9 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
+	struct iommu_fwspec *fwspec;
 	void (*releasefn)(void *) = NULL;
 	int ret;
-
 	smmu = find_smmu_for_device(dev);
 	if (!smmu)
 		return -ENODEV;
@@ -1925,13 +1939,19 @@ static int arm_smmu_add_device(struct device *dev)
 			goto out_put_group;
 		}
 
-		cfg->num_streamids = 1;
+		ret = iommu_fwspec_init(dev, smmu->dev);
+		if (ret) {
+			kfree(cfg);
+			goto out_put_group;
+		}
+		fwspec = dev_iommu_fwspec_get(dev);
+
 		/*
 		 * Assume Stream ID == Requester ID for now.
 		 * We need a way to describe the ID mappings in FDT.
 		 */
 		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
-				       &cfg->streamids[0]);
+				       &fwspec->ids[0]);
 		releasefn = __arm_smmu_release_pci_iommudata;
 	} else {
 		struct arm_smmu_master *master;
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831d90..a51ae3c9c3 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -140,6 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( !ops )
         return -EINVAL;
 
+	/*
+	 * This is needed in case a device has both the iommus property and
+	 * also apperars in the mmu-masters list.
+	 */
+    if ( dt_device_is_protected(np) )
+        return 0;
+
     if ( dev_iommu_fwspec_get(dev) )
         return -EEXIST;
 
-- 
2.17.1


