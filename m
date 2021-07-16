Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573823CBFEB
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jul 2021 01:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157774.290613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Xk7-0005WP-UZ; Fri, 16 Jul 2021 23:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157774.290613; Fri, 16 Jul 2021 23:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Xk7-0005UY-Qn; Fri, 16 Jul 2021 23:59:43 +0000
Received: by outflank-mailman (input) for mailman id 157774;
 Fri, 16 Jul 2021 23:59:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4Xk7-0005UR-9T
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 23:59:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2f1813a-e691-11eb-89d6-12813bfff9fa;
 Fri, 16 Jul 2021 23:59:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30B5F611BE;
 Fri, 16 Jul 2021 23:59:41 +0000 (UTC)
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
X-Inumbo-ID: e2f1813a-e691-11eb-89d6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626479981;
	bh=NVXFwc826W8ZK0AzWf2EJbfB+haRuWSUP9UYkEvEuYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ozje3Fvcd9kiNvmaMELFurN5SgrTFG/8ywPOnCYbDAx8fUGzuPWDsMcb4v3RVJT5O
	 RFWtyqezJV4kDQyJjVZxqg3na/ucU4moc4QTlwu2/hxpav/MMSrko7LaryOlZnzb8U
	 t1PRYYzjwx8rgxD8jkje6qM7iGn5lJ84IAfODHQbVxzYCpXDANFqmxAz0JKQMVNf/+
	 A4XYZw+YgC2IpKyfXeRVt7kmOtJk1odL7wXKET92A8bExE5Q7SqJmFNQJ4bLMNDsCk
	 RKfu70hW6tQt2lRgwwBtKUKks9ui3zZY4w8WN0N9L1BsAI1zRSmjAxYGIkwJMhx8QN
	 jJnHTR8NuMfyQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 1/3] arm,smmu: switch to using iommu_fwspec functions
Date: Fri, 16 Jul 2021 16:59:37 -0700
Message-Id: <20210716235939.9585-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Modify the smmu driver so that it uses the iommu_fwspec helper
functions.  This means both ARM IOMMU drivers will both use the
iommu_fwspec helper functions, making enabling generic device tree
bindings in the SMMU driver much cleaner.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v4:
- fix spurious newline
- fix a word spelling
- reuse existing dev_iommu_fwspec_get check in iommu_add_dt_device
  instead of adding a new one
- get fwspec (dev_iommu_fwspec_get) after calling iommu_fwspec_add_ids,
  at the fwspec pointer might change
---
 xen/drivers/passthrough/arm/smmu.c    | 75 ++++++++++++++++++---------
 xen/drivers/passthrough/device_tree.c |  6 ++-
 2 files changed, 56 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index da2cd457d7..b34f537edd 100644
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
@@ -616,13 +620,11 @@ struct arm_smmu_smr {
 
 struct arm_smmu_master_cfg {
 	struct arm_smmu_device		*smmu;
-	int				num_streamids;
-	u16				streamids[MAX_MASTER_STREAMIDS];
 	s16				smendx[MAX_MASTER_STREAMIDS];
 };
 #define INVALID_SMENDX			-1
-#define for_each_cfg_sme(cfg, i, idx) \
-	for (i = 0; idx = cfg->smendx[i], i < cfg->num_streamids; ++i)
+#define for_each_cfg_sme(cfg, i, idx, num) \
+	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
 
 struct arm_smmu_master {
 	struct device_node		*of_node;
@@ -712,6 +714,14 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
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
@@ -805,8 +815,9 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
 {
-	int i;
+	int i, ret = 0;
 	struct arm_smmu_master *master;
+	struct iommu_fwspec *fwspec;
 
 	master = find_smmu_master(smmu, masterspec->np);
 	if (master) {
@@ -816,24 +827,30 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
+
+	/* adding the ids here */
+	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
+				   masterspec->args,
+				   masterspec->args_count);
+	if (ret)
+		return ret;
+
+	fwspec = dev_iommu_fwspec_get(dev);
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
 	dt_device_set_protected(masterspec->np);
 
-	for (i = 0; i < master->cfg.num_streamids; ++i) {
+	for (i = 0; i < fwspec->num_ids; ++i) {
 		u16 streamid = masterspec->args[i];
 
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
@@ -843,7 +860,6 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 				masterspec->np->name, smmu->num_mapping_groups);
 			return -ERANGE;
 		}
-		master->cfg.streamids[i] = streamid;
 		master->cfg.smendx[i] = INVALID_SMENDX;
 	}
 	return insert_smmu_master(smmu, master);
@@ -1499,22 +1515,23 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	struct arm_smmu_device *smmu = cfg->smmu;
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	int i, idx, ret;
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
 	spin_lock(&smmu->stream_map_lock);
 	/* Figure out a viable stream map entry allocation */
-	for_each_cfg_sme(cfg, i, idx) {
+	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
 		if (idx != INVALID_SMENDX) {
 			ret = -EEXIST;
 			goto out_err;
 		}
 
-		ret = arm_smmu_find_sme(smmu, cfg->streamids[i], 0);
+		ret = arm_smmu_find_sme(smmu, fwspec->ids[i], 0);
 		if (ret < 0)
 			goto out_err;
 
 		idx = ret;
 		if (smrs && smmu->s2crs[idx].count == 0) {
-			smrs[idx].id = cfg->streamids[i];
+			smrs[idx].id = fwspec->ids[i];
 			smrs[idx].mask = 0; /* We don't currently share SMRs */
 			smrs[idx].valid = true;
 		}
@@ -1523,7 +1540,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	}
 
 	/* It worked! Now, poke the actual hardware */
-	for_each_cfg_sme(cfg, i, idx) {
+	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
 		arm_smmu_write_sme(smmu, idx);
 	}
 
@@ -1543,9 +1560,10 @@ static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg)
 {
     struct arm_smmu_device *smmu = cfg->smmu;
 	int i, idx;
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
 	spin_lock(&smmu->stream_map_lock);
-	for_each_cfg_sme(cfg, i, idx) {
+	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
 		if (arm_smmu_free_sme(smmu, idx))
 			arm_smmu_write_sme(smmu, idx);
 		cfg->smendx[i] = INVALID_SMENDX;
@@ -1561,8 +1579,9 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
 	u8 cbndx = smmu_domain->cfg.cbndx;
 	int i, idx;
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
 
-	for_each_cfg_sme(cfg, i, idx) {
+	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
 		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
 			continue;
 
@@ -1961,6 +1980,7 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
 	void (*releasefn)(void *) = NULL;
+	int ret;
 
 	smmu = find_smmu_for_device(dev);
 	if (!smmu)
@@ -1968,19 +1988,26 @@ static int arm_smmu_add_device(struct device *dev)
 
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
+		struct iommu_fwspec *fwspec;
 
 		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
 		if (!cfg) {
 			return -ENOMEM;
 		}
 
-		cfg->num_streamids = 1;
+		ret = iommu_fwspec_init(dev, smmu->dev);
+		if (ret) {
+			kfree(cfg);
+			return ret;
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
 		cfg->smmu = smmu;
 	} else {
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831d90..911f82a561 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -140,8 +140,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( !ops )
         return -EINVAL;
 
+    /*
+     * Device already added. It can happen when both iommus and
+     * mmu-masters are present.
+     */
     if ( dev_iommu_fwspec_get(dev) )
-        return -EEXIST;
+        return 0;
 
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
-- 
2.17.1


