Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E225304CDF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75652.136274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XII-0003lJ-CA; Tue, 26 Jan 2021 22:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75652.136274; Tue, 26 Jan 2021 22:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XII-0003ke-8V; Tue, 26 Jan 2021 22:58:42 +0000
Received: by outflank-mailman (input) for mailman id 75652;
 Tue, 26 Jan 2021 22:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4XIH-0003iw-23
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:58:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3734734-292e-4661-8063-0dcccaad7a10;
 Tue, 26 Jan 2021 22:58:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 291122065E;
 Tue, 26 Jan 2021 22:58:39 +0000 (UTC)
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
X-Inumbo-ID: f3734734-292e-4661-8063-0dcccaad7a10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611701919;
	bh=zOWrR4VH8CVYg9SMt9hKgpD629fQnlmWeS5U6jKieqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+dK7+mrMvngn8plnOso2EjdwsLPFOpJ3JqK3vINRnD1OX23OxIwkPOXMRRYP7+uP
	 4hKXKCpNVCuwPRLbs3hEU3q6jLEN9OBFBdHLUIdlIzrLWg2U5RnADY1q7lTQgi9l0Y
	 LZcJHfp5Rb72RweGUfsiD+sFZAg+5et5SmthIWHV7Z6GXRk0i4v+jfa7pR97yWai7J
	 ukQ16ou/GyEvLT350boJnzcsrbokUlDWFxHEcbsPUalF+pnJiiTPkh1Zj+6H9pZRUl
	 uAWmJTSKJgoVWB2CG0eIP49Wi0BcoRDKBoXjYcsEMqli0pl5Fg43bn0+jpjorKs2pt
	 lwSAWsDUZ3LrA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 2/3] arm,smmu: restructure code in preparation to new bindings support
Date: Tue, 26 Jan 2021 14:58:35 -0800
Message-Id: <20210126225836.6017-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Restructure some of the code and add supporting functions for adding
generic device tree (DT) binding support.  This will allow for using
current Linux device trees with just modifying the chosen field to
enable Xen.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v3:
- split patch
---
 xen/drivers/passthrough/arm/smmu.c | 60 +++++++++++++++++-------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 3898d1d737..9687762283 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -782,50 +782,36 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 	return 0;
 }
 
-static int register_smmu_master(struct arm_smmu_device *smmu,
-				struct device *dev,
-				struct of_phandle_args *masterspec)
+static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
+					 struct device *dev,
+					 struct iommu_fwspec *fwspec)
 {
-	int i, ret = 0;
+	int i;
 	struct arm_smmu_master *master;
-	struct iommu_fwspec *fwspec;
+	struct device_node *dev_node = dev_get_dev_node(dev);
 
-	master = find_smmu_master(smmu, masterspec->np);
+	master = find_smmu_master(smmu, dev_node);
 	if (master) {
 		dev_err(dev,
 			"rejecting multiple registrations for master device %s\n",
-			masterspec->np->name);
+			dev_node->name);
 		return -EBUSY;
 	}
 
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-	master->of_node = masterspec->np;
-
-	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
-	if (ret) {
-		kfree(master);
-		return ret;
-	}
-	fwspec = dev_iommu_fwspec_get(dev);
-
-	/* adding the ids here */
-	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
-				   masterspec->args,
-				   masterspec->args_count);
-	if (ret)
-		return ret;
+	master->of_node = dev_node;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(masterspec->np);
+	dt_device_set_protected(dev_node);
 
 	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
 		for (i = 0; i < fwspec->num_ids; ++i) {
-			if (masterspec->args[i] >= smmu->num_mapping_groups) {
+			if (fwspec->ids[i] >= smmu->num_mapping_groups) {
 				dev_err(dev,
 					"stream ID for master device %s greater than maximum allowed (%d)\n",
-					masterspec->np->name, smmu->num_mapping_groups);
+					dev_node->name, smmu->num_mapping_groups);
 				return -ERANGE;
 			}
 		}
@@ -833,6 +819,30 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 	return insert_smmu_master(smmu, master);
 }
 
+static int register_smmu_master(struct arm_smmu_device *smmu,
+				struct device *dev,
+				struct of_phandle_args *masterspec)
+{
+	int ret = 0;
+	struct iommu_fwspec *fwspec;
+
+	ret = iommu_fwspec_init(&masterspec->np->dev, smmu->dev);
+	if (ret)
+		return ret;
+
+	fwspec = dev_iommu_fwspec_get(&masterspec->np->dev);
+
+	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
+				   masterspec->args,
+				   masterspec->args_count);
+	if (ret)
+		return ret;
+
+	return arm_smmu_dt_add_device_legacy(smmu,
+					     &masterspec->np->dev,
+					     fwspec);
+}
+
 static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
-- 
2.17.1


