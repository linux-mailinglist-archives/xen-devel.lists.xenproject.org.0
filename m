Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985C6DE4B0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519874.807019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX8-00027g-S1; Tue, 11 Apr 2023 19:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519874.807019; Tue, 11 Apr 2023 19:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX8-0001y6-I1; Tue, 11 Apr 2023 19:20:02 +0000
Received: by outflank-mailman (input) for mailman id 519874;
 Tue, 11 Apr 2023 19:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUY-0004Ta-1E
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e89::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4ad9dd-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:20 +0200 (CEST)
Received: from BN8PR04CA0029.namprd04.prod.outlook.com (2603:10b6:408:70::42)
 by PH0PR12MB8029.namprd12.prod.outlook.com (2603:10b6:510:26c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:17 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::9a) by BN8PR04CA0029.outlook.office365.com
 (2603:10b6:408:70::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:15 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:15 -0500
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
X-Inumbo-ID: 7a4ad9dd-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzNQr2SLdVAdJZYxI0PgizBtvdz3yZFN10NELXNrTWTkU1yT4d7zyT2qsaTk80El/bDeQAg3eLkaD6zK0YlyCxErvuB/hbDhLaivuG8jpOszKOszktekyI3kO8ueiyKjr7s5QNyI2rzQzJ+sXp6OSRorFiWNigWWaprbhjv3b/+vafq6IZpGAMksC4MW+YAg9Fmg7pJujgMRO7dKME+DIDnkp+Bnh95+Xlx/BShiu0fJ+tZBeSBo6n3ILgNw9CSpRaEAPUvaAtlMjZmoc8vFZ6MU0sGKeeJsfHT5Ho+zmWY6stgP0Bn6XxUhiF7gsBD+qrQwW71ya+Icczl+7tRoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvjprfsFjT2q+G0BBsMISOBPht18qx5Ov6rcUISgUjE=;
 b=nkBUXiMU6lIQQwpdxAbfbWFCZ6TYiWvoM8erBKwAbx7S7ytEd1CkM3YMbbLQHGkM+/D2+jQEt1iaI/Wh9ulQRjrDj+9WNz7nUgYw1JRrnBfgMBsUKx2YcgxX+jxfzRkFsiKuvv1A/BcAg0emVYelnD2g0leMjx+sVgecT7fJwv+tuNkr36z3t5wE3KYcIHOPIcWigW2ZZ+yU1/0AmdWv6xPczWDvFG21vHld3xEciPzBvKFR7bYDvB17YUmic+s2doVAodUrVQwedABB5GeLL/o6UdHMU+vZ3d+8VdnZ4138SitgcnGQcrvrhyaUTBIoamUCqGLJ5iO6VWITMa/kEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvjprfsFjT2q+G0BBsMISOBPht18qx5Ov6rcUISgUjE=;
 b=Ly+lUQ0+M/IUp+B4OQS8qNOM8TYaB5uasdcrjoYspgz20WyS/UPD0htASwL6rO45lrVjKtv8zb6YxuNzTMM1uTmjU0flvEfsxmBavxHdB/ufDqqEZWLLSAFmnaLL+IjjgPzHVDv/wtlfuCX/w5b2upQNQONkaX8hn9CWp9zKrug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v5 07/17] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Tue, 11 Apr 2023 12:16:26 -0700
Message-ID: <20230411191636.26926-26-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|PH0PR12MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 50790be0-6352-4be7-7b8f-08db3ac15cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mAFf3vbwh8xgKfEkCpsPWufkJqzgszk8dRjmBqwJbNWlxJ+4MaLJCrh3ccDNlcLfayxl9wcH/xmIKVAon8eO33lB0xgU9U/mor0WczGDwNKR83kQdcfRIWBJoTm5tvf676K0Yg5hTKLKUUHJo69ZZ60lOLw2LeRT1zUJC/d3aXabjaQ47+PkrR5xRMsAY9mxb4XXREnJS2IKVeE0zjlkyJOSrktcywagpler50PR5tZCgeGKw+16N/Nf9ynCTBAUzF0/7UOm+Ey8dTNW0WDjnsrkoj+h44NAWDnlQ/6Giwl4Y+7PwmCvUUR9Z0ZlMsEfcy+5aoGNqM3WESMk+CSupsa1o2EPANS9moVe/epI1meG7z4vn3CcSAdraj1xoP2gaXUcMGV1avcP46Wsj9MBpxB+6QuUIw16OGnTafMmWuyVeigwyN0+plpQAiOBvz5I7QNEJuQyymxLF7yjcmpG9mbkf6mb9WxpW16MF5cu/0GP04gsRdDyXHaK9gkGhQ71n+sVvZT9utYjYXMUoIZB+3S3BdHO/WE0p9hEtyUDthLPRqx+skjdOhOVdgMus8lxMtzsPFH/mlauhsMLCyXE5t0Xet9Kz8iQDLKEUlVzHK3LnZePD5pWg5QRmmoDnbwMkiIuylXMQdCnYMRUTPJ6lI69oxCT6V2edfu5EHECe2G7J58mNFTUsGGZjjRdvMaLqkljziga/kiAm/tydIdQBCPQSpD6whYnqMsIZgNgYFM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(2906002)(5660300002)(8936002)(41300700001)(47076005)(40460700003)(4326008)(8676002)(6916009)(70586007)(70206006)(6666004)(316002)(36756003)(44832011)(478600001)(54906003)(186003)(81166007)(86362001)(36860700001)(356005)(26005)(336012)(426003)(2616005)(1076003)(82740400003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:16.3575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50790be0-6352-4be7-7b8f-08db3ac15cdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029

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


