Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33313D3046
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 01:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159904.294094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iFJ-0002D8-LO; Thu, 22 Jul 2021 23:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159904.294094; Thu, 22 Jul 2021 23:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iFJ-00029I-Gs; Thu, 22 Jul 2021 23:36:53 +0000
Received: by outflank-mailman (input) for mailman id 159904;
 Thu, 22 Jul 2021 23:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltuv=MO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6iFH-0001Fn-Cg
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 23:36:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad21ea5a-eb45-11eb-915d-12813bfff9fa;
 Thu, 22 Jul 2021 23:36:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7F2960EB9;
 Thu, 22 Jul 2021 23:36:44 +0000 (UTC)
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
X-Inumbo-ID: ad21ea5a-eb45-11eb-915d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626997005;
	bh=6TReV4Pdjfx3WD5lh4CLVkGlPCvVlrwBPMhSYNdvOVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lYd1xnzV0XCaves7HoNXnS/51OFkEUGhQNQpW03IZ1wp4dWpCpTvl4zRdCH2Fb3V7
	 0jt4o/EI0KhbBIFX7YYfX6xqF5bknn60kmzBTduspXEGonyUXr94Jrf+YbU+yqADOM
	 ZsMY/JaseJrRHDGMQkeTKjzi5D5bb4RuiZvBwnYUkYNTIanEfttj1dSuU9ZKyi3hAQ
	 oJ4OJJWcKBXarAMawwoKUcquuBXb3D95gYeksrP4NS+O4DCLmf6nbkZ0Vr0kQeubcn
	 gP+1qxnXoToT621XZbVzdQ4VOl9aHXlwu+kUU5oOctTXJk2sMXlC9nALkOFLE8VwiD
	 l5R/NsAHX1ozA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 3/4] arm,smmu: restructure code in preparation to new bindings support
Date: Thu, 22 Jul 2021 16:36:41 -0700
Message-Id: <20210722233642.22515-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Restructure some of the code and add supporting functions for adding
generic device tree (DT) binding support.  This will allow for using
current Linux device trees with just modifying the chosen field to
enable Xen.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/drivers/passthrough/arm/smmu.c | 62 ++++++++++++++++--------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 09773702c3..4aa3ecec57 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -812,53 +812,36 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
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
-
-	/* adding the ids here */
-	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
-				   masterspec->args,
-				   masterspec->args_count);
-	if (ret)
-		return ret;
-
-	fwspec = dev_iommu_fwspec_get(dev);
+	master->of_node = dev_node;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(masterspec->np);
+	dt_device_set_protected(dev_node);
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
-		u16 streamid = masterspec->args[i];
-
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
-		     (streamid >= smmu->num_mapping_groups)) {
+		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
 			dev_err(dev,
 				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				masterspec->np->name, smmu->num_mapping_groups);
+				dev_node->name, smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] = INVALID_SMENDX;
@@ -866,6 +849,29 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
+	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
+				   masterspec->args,
+				   masterspec->args_count);
+	if (ret)
+		return ret;
+
+	fwspec = dev_iommu_fwspec_get(&masterspec->np->dev);
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


