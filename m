Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C300B793361
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596109.929881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhLS-0003Q9-Sh; Wed, 06 Sep 2023 01:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596109.929881; Wed, 06 Sep 2023 01:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhLS-0003O6-Q0; Wed, 06 Sep 2023 01:28:38 +0000
Received: by outflank-mailman (input) for mailman id 596109;
 Wed, 06 Sep 2023 01:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA4-0006tr-5s
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dedf5bb-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:51 +0200 (CEST)
Received: from MN2PR19CA0007.namprd19.prod.outlook.com (2603:10b6:208:178::20)
 by BL1PR12MB5031.namprd12.prod.outlook.com (2603:10b6:208:31a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 01:16:46 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::35) by MN2PR19CA0007.outlook.office365.com
 (2603:10b6:208:178::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:43 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:43 -0500
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
X-Inumbo-ID: 0dedf5bb-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTS5niPUpI3bBgY1brrkFz1jq7XueygLFpQStz/ob76cPRWBr4zwC0nBZBxD6D1bcnD1G8Fpp4l+UFiI1NkDeek9khatGgmWbbZtbyDZhRKTmZ1u89/YYtS3VaRROHSXrTNjCiEOTqIt0Nt4I1eake+4fDOPnSUZETZ32k+ozVaLCco6mfP36I6q5o8hgjYOokJzlrGAxY7Qf7w5tciwMBzJEDB+N59LBgU84+tH9GlfNcz6RIVt2tpS27T04xTgbMGdKMCpJeyimbcHXiuTwIOWI0/5pdkkuOO7QMhW1SeFDHL9N8Bnl0yP6Ymd6QVyw9i+93lVH8WzSNdmq10Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SW4wKXQYKIhPbVrs0COOCkOCwqWA0YoU6tRZStnLaY=;
 b=K8xgQEPwiBp28p44BBLFce4Gmu555Noe+My3/9s/md9FUenqQWBKIx0m2E8Hz5MOEDnCnX4gceVMg7aToZpfFR3auaKvwsZzOVWyDzPY29c8eQA2jOo8W0WkaryI4cfYP4aJK7snLfls5HBm6sm7NGpV7UHRpEdt392n2j1Nba6hK3Z74fkxz6RUKKQ1ORoj6KKvjfqibIHCZseX8rZ6PZCeiTo3BpYy5VNfFLIf5tOhb7YlKKqqYykb+cQfzWY2MkVBsNBL6nrujEliYhGOGBNl/+HDXtj/M2L9ImUjz21mr45pZksmgqwh+9Iqbd8L+eP2hCavEq7Z6l+JVVJukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SW4wKXQYKIhPbVrs0COOCkOCwqWA0YoU6tRZStnLaY=;
 b=2lgEjYy7zmTz1+PT5azLMf6CcCJibpCQ0JYd+cvG/s3tLtEZQ5KZ1KlT69WSRPSt71Lvsc3kL2aImBbsSKVhiTHXMKL1XnPvJxnuAaZ9eFs5dD4ldmZXZZ19VgXV1KiJ5wObHh9/h3uKIUXXzdSxA5+ZljqoHegOqBLKEovnt7s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v12 12/20] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Tue, 5 Sep 2023 18:16:22 -0700
Message-ID: <20230906011631.30310-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|BL1PR12MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: 180f8bdd-565d-401a-a82a-08dbae76f03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4WPy7IofN+szBGIbDlPd+HYyenDo108xNcupNYuj0V7v+J8Wtqsg0DzvNEdBbxNgAVQxQf1JsWR/793BpxWa++7DS09X+qw6i4bIMa2jhPJ/Ymg9bQEs8doLOdMvttVCmALXliiCjNBVSJ+KeNqL/8dS38pUBQnefWAP2ETflWeDCp43obdnPO1Yw3kCge0qaHiRB1a6rFeoTF5ugWBUjmnEZI+KWwYaBBRO3FfL4CXHbWJQuNEmVHRZ4JqdkkS2CiGRfEj/0S30KJtEpQSk5LZOnodKFVF+tv44lFSHLCPUwrvNL+nESdgBZbtXsc6EBO5BVYP9rPEtWFic0m3AEhWD2yXHitlYkp707cj0rdB1jINs7pnknGkWwGodH7cKoztzWMkdNj1u/zS4a1FxzScTsBieWUK/Mhhm5w+OJ/fLC/2aJ8FkniGYTc1EZlat8KX1ao1lk6ORO8o1SV6OdJbH2okZHfi/ucr2v3I2zCkMemgXf8rSJFGFfx6hbZrp+xZjMtRyNd0HsdzVbwRsYAh4cn2iiwvQyw1molBu/FxZ2xc0f51MUMc2h6yTFRCV2X4WiO7Nh/swN2WnvTTSwy9Rh5XmyqXllcLEGWH5DZLmzNdTxQ6Q/KdQm4htydVEEnitc7tnJy5rgd6eW1IQ6TmUG/QWD/KYxgqkgZ7djhuwYcQhljTWmIWTQjasYlllXWoNNf6pSLpqJRnU8xbbZPEbFGIjyczslAJcYcl8O82uoS4OhRYFkOl3yuWJDNg1NQSKb9D+FKGl8IZtBfQJ9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(82740400003)(81166007)(356005)(6666004)(36756003)(40460700003)(86362001)(36860700001)(40480700001)(47076005)(2616005)(1076003)(2906002)(26005)(426003)(336012)(83380400001)(478600001)(70206006)(316002)(70586007)(8936002)(8676002)(5660300002)(4326008)(44832011)(6916009)(41300700001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:46.2534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f8bdd-565d-401a-a82a-08dbae76f03d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5031

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Check if device is currently in use.
3. Remove the SMMU master.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
 Changes from v9:
    Remove iommu_dt_device_is_assigned_locked().
    Add comment regarding caller holding the locks to protect concurrent access.
 Changes from v7:
        Added comments on arm_smmu_dt_remove_device_generic().
---
---
 xen/drivers/passthrough/arm/smmu.c | 60 ++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c37fa9af13..71799064f8 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -815,6 +815,19 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 	return 0;
 }
 
+static int remove_smmu_master(struct arm_smmu_device *smmu,
+			      struct arm_smmu_master *master)
+{
+	if (!smmu->masters.rb_node) {
+		ASSERT_UNREACHABLE();
+		return -ENOENT;
+	}
+
+	rb_erase(&master->node, &smmu->masters);
+
+	return 0;
+}
+
 static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 					 struct device *dev,
 					 struct iommu_fwspec *fwspec)
@@ -852,6 +865,32 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 	return insert_smmu_master(smmu, master);
 }
 
+static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
+					 struct device *dev)
+{
+	struct arm_smmu_master *master;
+	struct device_node *dev_node = dev_get_dev_node(dev);
+	int ret;
+
+	master = find_smmu_master(smmu, dev_node);
+	if (master == NULL) {
+		dev_err(dev,
+			"No registrations found for master device %s\n",
+			dev_node->name);
+		return -EINVAL;
+	}
+
+	ret = remove_smmu_master(smmu, master);
+	if (ret)
+		return ret;
+
+	/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
+	dev_node->is_protected = false;
+
+	kfree(master);
+	return 0;
+}
+
 static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
@@ -875,6 +914,26 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 					     fwspec);
 }
 
+/*
+ * The driver which supports generic IOMMU DT bindings must have this
+ * callback implemented.
+ */
+static int arm_smmu_dt_remove_device_generic(u8 devfn, struct device *dev)
+{
+	struct arm_smmu_device *smmu;
+	struct iommu_fwspec *fwspec;
+
+	fwspec = dev_iommu_fwspec_get(dev);
+	if (fwspec == NULL)
+		return -ENXIO;
+
+	smmu = find_smmu(fwspec->iommu_dev);
+	if (smmu == NULL)
+		return -ENXIO;
+
+	return arm_smmu_dt_remove_device_legacy(smmu, dev);
+}
+
 static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 {
 	struct arm_smmu_device *smmu;
@@ -2859,6 +2918,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
-- 
2.17.1


