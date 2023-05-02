Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ADF6F4DA5
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528864.822594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ1-0007fp-Rq; Tue, 02 May 2023 23:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528864.822594; Tue, 02 May 2023 23:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ1-0007Wg-HK; Tue, 02 May 2023 23:37:43 +0000
Received: by outflank-mailman (input) for mailman id 528864;
 Tue, 02 May 2023 23:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYz-0004sC-Se
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53a655d4-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:41 +0200 (CEST)
Received: from BN9PR03CA0358.namprd03.prod.outlook.com (2603:10b6:408:f6::33)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.28; Tue, 2 May
 2023 23:37:38 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::ae) by BN9PR03CA0358.outlook.office365.com
 (2603:10b6:408:f6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:36 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:36 -0500
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
X-Inumbo-ID: 53a655d4-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMuhiR7OjqK98R6C2Y+i2BwUPlmh/NGw2J8UYvPW8dKGxBa1iV1j5v33lhksmAVKe8fslgYp/p8OyGG+xz6Yr1br6oRqS0Rz0txYazHtUOD3ENh0pOiA/yDPtHWUDAxT7OftAIsG2ievhkgIQippqVQLEZAyw0TONxPYxx5dhumzJUrnPc8mXShxNWcUGBp07e/cxB+hH4Wn7z7+89ipGslY+3JEqTGd5NZbhw+pfEUEdSQbG+ECynalrKb3jBZJbH6kWsKdCQsfTePuf4YAURIh4hT1om4sjnbmzd9krWT5Vowk9s/jFQJqpKnvqgsBtq+LsKKsTsMr2fv5j2Ir0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o//kziDFlVk7rDkLuyZCz6gXGJUkyhMLecqyMP3X36E=;
 b=j8RnKyNane9AlUt12z+CtWCP8pOZJ9vwNhFsxN7qgdNLCaOXJqeW5/nstSsVhdlOdS2zpo9RJXTId1o+lgEA6ubGR0qWqV1zxbj6rqkju6O9IWxYmRaWHqIy4uBg+MTBWM3oZ383FjVz1K+kpQCezutbY8mrCbAvdSmXk205liAE5ejIgOHkfzMQk4IIfSICMGnGQpzwhjUopVSdr47z6VNVZmSn3ceddCp20aT/mh6hIS9Oad6BT/m2wrH1msLYYLzy1bmVFZ8U61GkSJ7yWEsZiOfAjB0rGJTiusxx0v3UYqnMd9WWb2wWMghl6/2BxWA8qOYIHKlwEPYgLPd4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o//kziDFlVk7rDkLuyZCz6gXGJUkyhMLecqyMP3X36E=;
 b=K4bFgZs7i4fiQhliTFJ3687gVb/NFX5VZnNbJDYqIW9oAIuSE3IMOJ2I+uhNXIlwU2L3tqpyVuXWv2EaH04PzPmADLC3xQ4laizDvvSdI6KWscP5sqSJy6huRLe+/sYVY0xti30U20nWlkJrdkgcfxaMe8iMNeaLbx39WJb6YJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v6 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Tue, 2 May 2023 16:36:43 -0700
Message-ID: <20230502233650.20121-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a718bd1-80da-4de4-b416-08db4b6636c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NiE6EW8yQhtuk8zLuQOPtsucZA/jm2YfnWqSL444s42WCtwp71ub9OatR2Zk4hEGxH4OiRqh+3BZj9X+/rjfKeubFY/6ciKhQ+1pvi2nyqzdIutUKkIeP5cCziAw1FLWaYZ/5BjtcBdZSMvrGqR+phs+kNQOtnSKM79X8lo+JvdRDsHR5pUBVWELT6C4qLbQj1eP6egOYuThDxG+2aBRWEXWDKel8IV/u+5AfT/ms6OGA0SJd+UEevJoae7OfTnCLkew/JMFZb+7udFcrwlg9sK8S9e3ejXkUBVJ0ANwZjNCzxNQgcmf8LmXHl181MER0Ltc1IIVfHwjut0Ab70W9sSeiFhG58DPmMYnTNEw4QU1kL+9b4MO0pivJgu5RKwWvYJ6vqwjZ1FaPsdVu83bnneVzMsnaLAT7cLGL58Xr9fjMYa9k/+v39LL0LNfGEVhr3QuE9GxBW9zqLFUI0NW33kDXfzlyytuBwJc8X//GWC7s82JEtLWz85zM7/h8YmNqWWRfuVNoxtzfrwLKEhXyQYiCrZn/iOMyPSPAPqSy20XRFmBI3YFoAp2hXPY9b1RVzgACY6Ay5jFdkebh/9l2pJlzKkVR7tG0vdDHxiiBu/+Dgfcd6x2SunGKnGV1QgKPU5xBiuPhY0rEQycKJWWbxvz8XKG03oDxR315qg+C9zAAPokCoHbTOEO24NCu8DfDyo3nmkHoe4R3UVJdaW52lMat4Htl1aQu8T0/HPqF7c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(478600001)(47076005)(70586007)(70206006)(40480700001)(8936002)(8676002)(83380400001)(5660300002)(44832011)(426003)(336012)(41300700001)(356005)(81166007)(54906003)(82740400003)(4326008)(316002)(6916009)(2616005)(40460700003)(36860700001)(6666004)(86362001)(36756003)(186003)(82310400005)(1076003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:38.0156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a718bd1-80da-4de4-b416-08db4b6636c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Check if device is currently in use.
3. Remove the SMMU master.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/smmu.c | 58 ++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3..39d3a5c345 100644
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
@@ -853,6 +866,34 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
+	if (iommu_dt_device_is_assigned_locked(dev_to_dt(dev)))
+		return -EBUSY;
+
+	ret = remove_smmu_master(smmu, master);
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
@@ -876,6 +917,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
@@ -2858,6 +2915,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
-- 
2.17.1


