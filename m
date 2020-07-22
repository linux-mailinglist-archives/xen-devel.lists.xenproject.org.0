Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F287228EDE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 06:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy5wB-0001kG-NU; Wed, 22 Jul 2020 04:00:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEGq=BB=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1jy5wA-0001k6-BC
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 04:00:58 +0000
X-Inumbo-ID: f1ee473c-cbcf-11ea-a17c-12813bfff9fa
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.63]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1ee473c-cbcf-11ea-a17c-12813bfff9fa;
 Wed, 22 Jul 2020 04:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2f08OYIqR80XD+kfUIXmKKDiMxbomLiJJUOuvbBF6qLawwVhEEfkHdxGKzT2HiUfPEzBjxE/TPuZAitRKhepZX5mKJzHCa4t33a+ngOPtCZ2otRbOe/6/FDTHrVNziqDrdrBXWZDUV9iiIKBnjpLXtwn5dZzOd8J+T71wUORFWYgvWY0fOczoyRsmLGz6TJJY2oQd5alvsf613bfDm6E1AlMCB03hjbMuHnA/lzyzXzA3tDG4Qoln1fCPC0Xht4AUZ2gQnzDsyMHUvUuIVgVPsN3/eKHcR8h1n530rJKcKCiSCOiNGEqUwuqN5XsUZXRKtglm9HHRNi4ZzXyUSGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVUvECXV5L4nQYMNSDz3dm1kjTIFTD5CSE0XcToz2fQ=;
 b=mp6iMU4TdD/zV4vIBq8NtOTK7UIyadv2mPTRr7XQmv0+KN7afW63Wo83r8AHCjT/g3trQ1RGdDv9QpoGGB0zSP3T0DYDJnhzPlaVM8asARGXHaxg96hbouT5QxzVuH2oVyIjt7ckjvsScNEWctlZTn8LRfDtZ36zsyIdloAtckkkiLINj3sa6cBV1XdU8QPAAV2xaAkxbnYZiwIYP+H9mQDDVlhMwPbmqS2q93SEJ+Wmlb6Rrzrsaniye9zJfBGJ6efiFN92RFNuNQz1DkAaD1HtFSAqkZsB2DMI190wFwdWV84POqXlg6AMopsMw+xNy8egO6MYWmQopPHSjTiUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVUvECXV5L4nQYMNSDz3dm1kjTIFTD5CSE0XcToz2fQ=;
 b=JlacmhF3T1R0x7sfklGmGj73mtkaorE1OsKaiZR95Qi/8qk8rakFSvU2N4KMtmz9NuFwQKXqYEGA0FFsZAXgj4+CHqL022Dq3z1FeKlMyGtemGYQGt5HToJmcXuu+XZ7IfoRkGOnULb2HjOnAbSMgSHynpixe61gAZzSkkV7Y+o=
Received: from CY4PR20CA0042.namprd20.prod.outlook.com (2603:10b6:903:cb::28)
 by DM6PR02MB5849.namprd02.prod.outlook.com (2603:10b6:5:156::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 04:00:54 +0000
Received: from CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:cb:cafe::73) by CY4PR20CA0042.outlook.office365.com
 (2603:10b6:903:cb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Wed, 22 Jul 2020 04:00:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT030.mail.protection.outlook.com (10.152.75.163) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 22 Jul 2020 04:00:54
 +0000
Received: from [149.199.38.66] (port=50306 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5uH-0007kn-TK; Tue, 21 Jul 2020 20:59:01 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5w5-0002zS-T1; Tue, 21 Jul 2020 21:00:53 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
 be forged))
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06M40lJX012872; 
 Tue, 21 Jul 2020 21:00:47 -0700
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5vz-0002u2-Mf; Tue, 21 Jul 2020 21:00:47 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [RFC v2 2/2] arm,smmu: add support for generic DT bindings
Date: Tue, 21 Jul 2020 21:00:31 -0700
Message-Id: <1595390431-24805-3-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
References: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39850400004)(396003)(136003)(46966005)(7696005)(316002)(426003)(9786002)(4326008)(107886003)(83380400001)(186003)(44832011)(336012)(47076004)(54906003)(2616005)(8676002)(5660300002)(70206006)(26005)(6916009)(36756003)(478600001)(2906002)(8936002)(86362001)(82740400003)(82310400002)(81166007)(6666004)(70586007)(356005)(41533002)(142933001)(42866002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 100c8d46-da75-4a23-5ae1-08d82df3d4ab
X-MS-TrafficTypeDiagnostic: DM6PR02MB5849:
X-Microsoft-Antispam-PRVS: <DM6PR02MB58498124EA817EAF686ED9BAD7790@DM6PR02MB5849.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azwg7/hIzbt5KF3sK4i/FARUUAtfxD7R27j2LBDdT7GqIzgwuP3hzgD3QDzjm2rb+zSWmEA0QPwBC1b57/olVZi1GKMI9Ejjrad1UbF8O+fqgcPE0o+U6xEf3LALZFZ77zGp+pjFcy2yUTvPUXadrHlKB9vyZjNDGcQCyP/vqc4fPae3WUa+X2GM1Bg5S9zLK3anZn/4fEBjJ6oWlCn4ET1MhSozJgoj2cm3oNtHR+J0n+d4y6La4ZkQzdkUAIQoLWYD0xoaSJQAyi+VngPVkYIOAhTuH/QZUChzPTTi9ZPP+Jgm5829iNYRIwILRsGrni/25PeWD/msqhM7WcdHwl0N1T4lSq0/5JCM3gODrjdh966eQzGppQZWO9mqWksZizh99CdnIduL8LlGVnZaagflmXx4PC4JJ1z486dn2RZP1kCiUkjgHCfVkLOOf+XH3GBZlPxopbjdT87lSpPe/BEJdcYMeZ2HppShkuei7FZksx/HdOUONo7NNO5QIDu/
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 04:00:54.1157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100c8d46-da75-4a23-5ae1-08d82df3d4ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5849
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Brian Woods <brian.woods@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Restructure some of the code and add supporting functions for adding
generic device tree (DT) binding support.  This will allow for using
current Linux device trees with just modifying the chosen field to
enable Xen.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
---

Just realized that I'm fairly sure I need to do some work on the SMRs.
Other than that though, I think things should be okayish.

v1 -> v2
    - Corrected how reading of DT is done with generic bindings


 xen/drivers/passthrough/arm/smmu.c    | 102 +++++++++++++++++++++++++---------
 xen/drivers/passthrough/device_tree.c |  17 +-----
 2 files changed, 78 insertions(+), 41 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 7a5c6cd..25c090a 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -251,6 +251,8 @@ struct iommu_group
 	atomic_t ref;
 };
 
+static const struct arm_smmu_device *find_smmu(const struct device *dev);
+
 static struct iommu_group *iommu_group_alloc(void)
 {
 	struct iommu_group *group = xzalloc(struct iommu_group);
@@ -772,56 +774,104 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
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
 
-	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
-	if (ret) {
-		kfree(master);
-		return ret;
-	}
-	master->cfg.fwspec = dev_iommu_fwspec_get(&master->of_node->dev);
-
-	/* adding the ids here */
-	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
-				   masterspec->args,
-				   masterspec->args_count);
-	if (ret)
-		return ret;
+	master->of_node = dev_node;
+	master->cfg.fwspec = fwspec;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(masterspec->np);
+	dt_device_set_protected(dev_node);
 
 	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
-		for (i = 0; i < master->cfg.fwspec->num_ids; ++i) {
-			if (masterspec->args[i] >= smmu->num_mapping_groups) {
+		for (i = 0; i < fwspec->num_ids; ++i) {
+			if (fwspec->ids[i] >= smmu->num_mapping_groups) {
 				dev_err(dev,
 					"stream ID for master device %s greater than maximum allowed (%d)\n",
-					masterspec->np->name, smmu->num_mapping_groups);
+					dev_node->name, smmu->num_mapping_groups);
 				return -ERANGE;
 			}
 		}
 	}
+
 	return insert_smmu_master(smmu, master);
 }
 
+static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
+{
+	struct arm_smmu_device *smmu;
+	struct iommu_fwspec *fwspec;
+
+	fwspec = dev_iommu_fwspec_get(dev);
+	if (fwspec == NULL)
+		return -ENXIO;
+
+	smmu = (struct arm_smmu_device *) find_smmu(fwspec->iommu_dev);
+	if (smmu == NULL)
+		return -ENXIO;
+
+	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+}
+
+static int arm_smmu_dt_xlate_generic(struct device *dev,
+				    const struct of_phandle_args *spec)
+{
+	uint32_t mask, fwid = 0;
+
+	if (spec->args_count > 0)
+		fwid |= ((SMR_ID_MASK << SMR_ID_SHIFT) & spec->args[0]) >> SMR_ID_SHIFT;
+
+	if (spec->args_count > 1)
+		fwid |= ((SMR_MASK_MASK << SMR_MASK_SHIFT) & spec->args[1]) >> SMR_MASK_SHIFT;
+	else if (!of_property_read_u32(spec->np, "stream-match-mask", &mask))
+		fwid |= ((SMR_MASK_MASK << SMR_MASK_SHIFT) & mask) >> SMR_MASK_SHIFT;
+
+	return iommu_fwspec_add_ids(dev,
+				    &fwid,
+				    1);
+}
+
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
@@ -2743,6 +2793,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
+    .add_device = arm_smmu_dt_add_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
@@ -2750,9 +2801,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .reassign_device = arm_smmu_reassign_dev,
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
+    .dt_xlate = arm_smmu_dt_xlate_generic,
 };
 
-static __init const struct arm_smmu_device *find_smmu(const struct device *dev)
+static const struct arm_smmu_device *find_smmu(const struct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	bool found = false;
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index acf6b62..dd9cf65 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -158,22 +158,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * these callback implemented.
          */
         if ( !ops->add_device || !ops->dt_xlate )
-        {
-            /*
-             * Some Device Trees may expose both legacy SMMU and generic
-             * IOMMU bindings together. However, the SMMU driver is only
-             * supporting the former and will protect them during the
-             * initialization. So we need to skip them and not return
-             * error here.
-             *
-             * XXX: This can be dropped when the SMMU is able to deal
-             * with generic bindings.
-             */
-            if ( dt_device_is_protected(np) )
-                return 0;
-            else
-                return -EINVAL;
-        }
+            return -EINVAL;
 
         if ( !dt_device_is_available(iommu_spec.np) )
             break;
-- 
2.7.4


