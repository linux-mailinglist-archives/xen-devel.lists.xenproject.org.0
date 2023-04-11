Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E96DE49D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519774.806783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUN-0005yQ-Hc; Tue, 11 Apr 2023 19:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519774.806783; Tue, 11 Apr 2023 19:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUN-0005nZ-2p; Tue, 11 Apr 2023 19:17:11 +0000
Received: by outflank-mailman (input) for mailman id 519774;
 Tue, 11 Apr 2023 19:17:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUL-0004DR-4f
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e89::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 727aca3a-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:07 +0200 (CEST)
Received: from MW3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:303:2b::20)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 19:17:03 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::98) by MW3PR05CA0015.outlook.office365.com
 (2603:10b6:303:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.27 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:59 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:59 -0500
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
X-Inumbo-ID: 727aca3a-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDZel6WEBGb2aTYAnYAotrmzVbZ3s3kcfUhLpszVA23+8sB6m7eS38UT9bYqoRo6RP23ED4kQur/HOYEtasxuVNCH2OINnUCwHgjJBrrPz/EQEzneYHUaMhiwE6tSOH7ZTDIbyopUVlTXoj1irUeAIHzr0qJa79iKrprkvfH0bGG478A723b3fPn0GdS2JgFHW8dj8i9FwM19w51JAtejG+N24Sw9LsGNC5yJy9IV8OiftA4AyouNKMQhf9HDP23SNhsv7wJqyAC+07IxAtkNBrK0996Ut17FGuOYWMYtSLrVwrJbwiG7C3759csDuFlp7vdsfzDkoqFHwGNTVXo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvjprfsFjT2q+G0BBsMISOBPht18qx5Ov6rcUISgUjE=;
 b=dw5LUMyKeF5kkahMH7yGjNK1hZL2dfKx4esYNnvJI8FmdkkhcX8LaD/tLlW+JYtNFKxonu4qD8NlSbJO9k7b6LEo5QMSpEznWwTFYdC8p/kK9JkcBBv0FPlcWd7M6PN6EdR1nuGk6dCABARmo33RFDXAM4OYiTXk16JNTyg6My8aoS8Im3Yae7e+z3VwdLecvoxpgiMWhUtLotEM8m3Nz7NxyCcrc031cS8qmdxC2SNOr6fGWaEv/VleGwn6A8tOwATNZKIvLo++UhVR8W5Az4qEAa+jS8kt6vu1yl8bi0nblYOPf1hMg3ZR2UXNdVip2ZhsluYEnJZb05efiLzOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvjprfsFjT2q+G0BBsMISOBPht18qx5Ov6rcUISgUjE=;
 b=37Bcs5BNxuIQA4OVW40raq+uSYlN3KhcoUpYSnVGbWlCEJDzDZYDouCqG/QsSbIcef6GSJ6TPWTkiNkRQPAYIrAAWmRrEtsOY9jdJolx4wj10djxsKpGqzim6xKu8aUSgLSfZDP8Av4z2wQDegFm51ZAjcZrZE1XNNQewGfi+1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v5 07/17] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Tue, 11 Apr 2023 12:16:08 -0700
Message-ID: <20230411191636.26926-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|SA3PR12MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9a7f2f-a193-4b53-18b5-08db3ac15512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DR+ixQxTfr4F1T81YK50UlMuZ859lngTVfX60KdhxnLbhinqY03bYxNAzFU/gcCZ5s6LA5Js9UQZcEl8RamVvLuIvh1Fuy6KKfhr4tsA2xxQrmnR08hnkxfJeGCQaSmDAXvL3eHxqgo1TiQqGaAV1Sf5feOZjPeIM9s0AHubsl1BRLMcTCi538v0w3WLCKKKH21Y9zPDunYZVpx/bkVQpu1bGxi01n8wb+H0DH84qci3sRFtGa7o/ertOi3A2igLGal3mDlIQGedktPkaa1iNb5KYb1iJYEH2FS7UkPknbiL2NV7vp6RMK4PA4czQjI3EgMKg+wM/nW42TYgAs7vbPx+ksJRTeFi2pxLPB7G74Y2ww+IfL8ViFTev06tC9+FGtaP8B+U/BujH+Lm8s6qUEJw6BFL/g6C3onBWcrDDLoObosYP1b7FqPX4DAxQA8jvl6pr94dAw3HavaHiH0nyxwAqpzt+mTUcyd7WUiu/roG43XjG0fPZilSbqr0EWEHdSvhx6L0+Sb+XDj1m6/5KzFkhYF5L/+q1dWSihWClC+4bTJaWvm1S48337U87hTkHZAn5ub1bE7WfIwFS+upjkIZkXWVPEryBw3ftrJKGuP93tx0y7xIebcj1aAyv87qSH5xcEcnMhr/r8Bz9ZTst5YYo21V6teKVAT1TEXOyPgmSE8SV3p1G79jpyQ+GLNHHubHTSA48X6q1d6MJ96hXiLDCfQWy3iPMYV9fhgAoLA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(70586007)(70206006)(4326008)(478600001)(6916009)(8676002)(41300700001)(316002)(36756003)(54906003)(86362001)(47076005)(426003)(336012)(2616005)(26005)(1076003)(6666004)(8936002)(44832011)(5660300002)(40480700001)(82310400005)(81166007)(2906002)(82740400003)(186003)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:03.1999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9a7f2f-a193-4b53-18b5-08db3ac15512
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Remove the SMMU master

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3..14e15f1bc6 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -816,6 +816,19 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
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
@@ -853,6 +866,32 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
+
+	if (ret)
+		return ret;
+
+	dev_node->is_protected = false;
+
+	kfree(master);
+	return 0;
+}
+
 static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
@@ -876,6 +915,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 					     fwspec);
 }
 
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
@@ -2858,6 +2913,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
-- 
2.17.1


