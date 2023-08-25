Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18E78817D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590559.922976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmp-00029Y-LK; Fri, 25 Aug 2023 08:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590559.922976; Fri, 25 Aug 2023 08:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmo-0001rm-VB; Fri, 25 Aug 2023 08:03:18 +0000
Received: by outflank-mailman (input) for mailman id 590559;
 Fri, 25 Aug 2023 08:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmj-0007G4-NN
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d49b80d1-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:11 +0200 (CEST)
Received: from MW2PR2101CA0020.namprd21.prod.outlook.com (2603:10b6:302:1::33)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:07 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::d5) by MW2PR2101CA0020.outlook.office365.com
 (2603:10b6:302:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.4 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:03:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:04 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:04 -0500
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
X-Inumbo-ID: d49b80d1-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9fSMHGAn/RPAGfsMrquwkKdth5HwKK8UMp4zpSTHZ1ZPt2qJ4bWOeAvPFBKSpAWmMaSexqfGI/13ti8glfcV3jIaQLr0ZvfHKyjF4vA3h6suRG8bd+boA95031YB/rRSkI2FDP/GZucpEFWWMuBb4up2ejBkTBXGiRmbcSm5pW2h/slKg5HaU1PoLymkbOBOE2UtTnUwMceHOg1iMGYQuyjLRLhp4GF4oXcfgsCRqz/exjXQv2XSEl0Pb/H06yp12wzMGB5roXusJixt6v/fuKayILQb6gXZwPPH8vFgcyM453g+3EsEhZoviTT3EKVzhmoWg+7hfwplyCXjvZqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Ad07nFyqe3yvUSTljKoScg3IAugPfBscvADFFb2TQ=;
 b=hjH87sBgZfsR/bauTspleETzz4qLAKFCGHpCFRUnE0bqtHtJRjQtA7mjD/bDS8hNdRc0636zyMMwMpu25Xd4iEKFOENmPde+JgwipKM/zYkqQlj+yeNBMXlQGR7QGq6mzZ1xzfG5QZ38i0bsAKtWmIzbc83nTPa7w1TRlPbaWjL+MB/PxIzoHu3g4ceszqOHQJJNj99H3i5AYtZ2uMA0qPdNm9AFjzXgil+L4odscufsgOJI1fxhqLFx6Ha6SiGFWgcR3f3MMreL+Ol4EfkNICLN3CTGTKKLd+yFk+TtIIp+u4MFYdRfY16Jfi42gK9nICddJ2SBG085VBmErKpVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5Ad07nFyqe3yvUSTljKoScg3IAugPfBscvADFFb2TQ=;
 b=YbPyfTwiIQOPFKBiD+vks2W6K1+eL0tKgHYRF6n8PSxiDIwWl7ChqikcRe2JFUPof8jks7DvWnp9rl7lRWD5s8yx597jnzB4PRcn1qSaS8moJ7IzkO4DRYmyicXFL1+9d4pfN2obxwwJoDE2pa5PkkLgJM4uEJe7X98IRIuxdSw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v10 12/20] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Fri, 25 Aug 2023 01:02:14 -0700
Message-ID: <20230825080222.14247-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DS7PR12MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7bdd2e-0999-4a0e-cbb4-08dba541b75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m38KQQdC7AQ7kO6bbLtZ7xwFS/eCXNRwCJpc+5GoKy4EVwzS1whiLFXISCaU0rFyeZWt3TTcphOpzx/X2SL0E3JHPke0SGqLJC6OfSACNEyt9lcM8AR/l0l1Rm+tigN6rGVGT8Bead0JmHCZqJlBf2kgOOZ79JLUSxYj8tHkpX21cS2LioiI9sP4m5tYVGGzaVBWZkae60Oxg+5S6qpLD1vjw3GKSWBNuFRgDDcLCNnffJY8p0hJsqCVCgZtt69qCTWpZaYHt50BKDcFJ1m5vY4SS6+EncXAmDu557AvdbVtCCvdmdz4ZeBJ2+DsNr37aFG5X1atpf1BaT/WqZ51zp35EAmzGHi6Jq97l5pRexlD3TQGuA0qszKgz+b0G33UpHxyVyPK1vegkQJ7zKSj13A23411WW48hnza4TaSlfWKs7Oc8oFTU/4J22Bsd0Pm8saPtO5Ivc1sMTEZT8Qi7Qu+4TdTkQshWUBgyIpacBuZlmuumb+nkQjryiv5or0otjLNqikHhFXqr8bbmsq9LAc03v+t3bfyx/B4Dt0F5SZc2xwPbFRwAXaSPsSTfTBCRMouMYcHlX7tF134YkQJ5Pp73lYY86Jj3FQ3Wn5k24L6uPr7jXXa1QtYFUUFXMCxD0s08hm0uaG4y4XJ/gyxzEgo875YT6GxBAbpQeNLAYrcIouhcvp2lOt6p3M7wiBh1jsKw2VKhdCgyFdi8StOsRYTxNeCzDMi+BPW9kLdPAt3bxpacBiP4RK7hqE6Wy+a23hZclMUfitllmTt+B1oaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(54906003)(70586007)(70206006)(316002)(6916009)(81166007)(478600001)(40480700001)(26005)(6666004)(82740400003)(41300700001)(86362001)(2906002)(356005)(4326008)(8676002)(8936002)(83380400001)(2616005)(40460700003)(5660300002)(47076005)(44832011)(1076003)(426003)(336012)(36756003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:06.9107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7bdd2e-0999-4a0e-cbb4-08dba541b75c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Check if device is currently in use.
3. Remove the SMMU master.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

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


