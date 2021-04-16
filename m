Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35577361E98
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 13:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111660.213543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXMb6-00051J-DW; Fri, 16 Apr 2021 11:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111660.213543; Fri, 16 Apr 2021 11:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXMb6-00050u-AK; Fri, 16 Apr 2021 11:25:16 +0000
Received: by outflank-mailman (input) for mailman id 111660;
 Fri, 16 Apr 2021 11:25:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDfs=JN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lXMb4-00050o-Un
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 11:25:14 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 77247f3f-4bec-4f82-8c00-71fb2616c192;
 Fri, 16 Apr 2021 11:25:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF50106F;
 Fri, 16 Apr 2021 04:25:12 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1083D3F85F;
 Fri, 16 Apr 2021 04:25:11 -0700 (PDT)
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
X-Inumbo-ID: 77247f3f-4bec-4f82-8c00-71fb2616c192
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv1: Revert associating the group pointer with the S2CR
Date: Fri, 16 Apr 2021 12:25:02 +0100
Message-Id: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Revert the code that associates the group pointer with the S2CR as this
code causing an issue when the SMMU device has more than one master
device.

This code is merged with the commit  "xen/arm: smmuv1: Intelligent
SMR allocation”.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 44 +++---------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 24ac4f3a80..1a68c2ab3b 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -597,7 +597,6 @@ enum arm_smmu_arch_version {
 };
 
 struct arm_smmu_s2cr {
-	struct iommu_group		*group;
 	int				count;
 	enum arm_smmu_s2cr_type		type;
 	enum arm_smmu_s2cr_privcfg	privcfg;
@@ -1498,7 +1497,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
 	struct arm_smmu_device *smmu = cfg->smmu;
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	struct iommu_group *group;
 	int i, idx, ret;
 
 	spin_lock(&smmu->stream_map_lock);
@@ -1523,19 +1521,9 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 		cfg->smendx[i] = (s16)idx;
 	}
 
-	group = iommu_group_get(dev);
-	if (!group)
-		group = ERR_PTR(-ENOMEM);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto out_err;
-	}
-	iommu_group_put(group);
-
 	/* It worked! Now, poke the actual hardware */
 	for_each_cfg_sme(cfg, i, idx) {
 		arm_smmu_write_sme(smmu, idx);
-		smmu->s2crs[idx].group = group;
 	}
 
 	spin_unlock(&smmu->stream_map_lock);
@@ -1966,27 +1954,6 @@ static void __arm_smmu_release_pci_iommudata(void *data)
 	kfree(data);
 }
 
-static struct iommu_group *arm_smmu_device_group(struct
-						arm_smmu_master_cfg *cfg)
-{
-	struct arm_smmu_device *smmu = cfg->smmu;
-	struct iommu_group *group = NULL;
-	int i, idx;
-
-	for_each_cfg_sme(cfg, i, idx) {
-		if (group && smmu->s2crs[idx].group &&
-		    group != smmu->s2crs[idx].group)
-			return ERR_PTR(-EINVAL);
-
-		group = smmu->s2crs[idx].group;
-	}
-
-	if (group)
-		return group;
-
-	return NULL;
-}
-
 static int arm_smmu_add_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
@@ -2027,13 +1994,10 @@ static int arm_smmu_add_device(struct device *dev)
 		cfg->smmu = smmu;
 	}
 
-	group = arm_smmu_device_group(cfg);
-	if (!group) {
-		group = iommu_group_alloc();
-		if (IS_ERR(group)) {
-			dev_err(dev, "Failed to allocate IOMMU group\n");
-			return PTR_ERR(group);
-		}
+	group = iommu_group_alloc();
+	if (IS_ERR(group)) {
+		dev_err(dev, "Failed to allocate IOMMU group\n");
+		return PTR_ERR(group);
 	}
 
 	iommu_group_set_iommudata(group, cfg, releasefn);
-- 
2.17.1


