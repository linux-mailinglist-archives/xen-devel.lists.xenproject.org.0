Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D66B6453E2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455843.713460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nk5-0000w7-8S; Wed, 07 Dec 2022 06:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455843.713460; Wed, 07 Dec 2022 06:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nk5-0000uM-5P; Wed, 07 Dec 2022 06:17:17 +0000
Received: by outflank-mailman (input) for mailman id 455843;
 Wed, 07 Dec 2022 06:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nk3-0008Ff-Ku
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:17:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca88b0cd-75f6-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:17:14 +0100 (CET)
Received: from BN9PR03CA0642.namprd03.prod.outlook.com (2603:10b6:408:13b::17)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:17:11 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::e6) by BN9PR03CA0642.outlook.office365.com
 (2603:10b6:408:13b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:17:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:17:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:17:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:17:10 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:17:09 -0600
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
X-Inumbo-ID: ca88b0cd-75f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlh/fb8KJ7GauHf27g/W1ggiylT5IKHq9ctZy/cvm4a9T6X03EeypBBbjXzRIa8NF/9h9MfEaf01leui1z5GZPs3V81p24O9lCsQAEjwRtrQK3bRPda9ibF+V/Y92JdnSkcEKQGjn+148/P9HgdrELY0vDE9yTci4hpg04dV14qIf3xA8MMFsgqEJqUOxnCoeh/NhCQ+wj1jRx9XJTW3QZqFHTQdlJl8gSuMjZDs17stclpGmZ9GmM1tq0LLi7Ia5wZZRX0Fc/nFvml/IAYAAsVULOVQCYMsgxja40e4sji9RkK2n5Ujddznz+LSVxDyC+WwH/MRvXuo4UQIFQTQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvjprfsFjT2q+G0BBsMISOBPht18qx5Ov6rcUISgUjE=;
 b=U4/akz42Wqp+igCe0Vw2nCKK4JFqhGrpcVfR2U+G9LN7PtAgq3PIM51tDoKcVSVRHylp+yyoDhCteBs61CpwYs+NkTDPm8lrw4A32tvYa1mdAOvZfjjFTebbJJI28WAGq3Ab0FFdPQllzRUepKFtF26uUQmAlVcAhyvfTS8JGHGpDNybeN26rpqG6THnTpaydJq/5QPC2pDCPFj9Rb0Y5KhnAfy9anktIdAwYIk/0+6/IqyGx6IiFPl43Nw21WjyRqjZNQzu2ijEQyHMDsgHM0fCTEQ7WxGipfuh4F70nuVVNE/eDhM3RGhW+AgTAvSYPZkOZGpn1wE7ex5i1fgLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvjprfsFjT2q+G0BBsMISOBPht18qx5Ov6rcUISgUjE=;
 b=VpRIKaNXuiCO/Ze7iyq6lgsToYXfAIHRY9G0K3CCm3ywkBOdLwdvGzOvBYOP5/c1eKQiJcJjpg6WVYFQxJ/7V1TO70BVJi0c02q0/ZkXov1+BHLqKJ44jH2KQVUhRK2hKuEadTQm3pfK7q+QnL9i6Xj+tumYG9AYwaD9oSW1eFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v4 06/16] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Tue, 6 Dec 2022 22:15:27 -0800
Message-ID: <20221207061537.7266-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061537.7266-1-vikram.garhwal@amd.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT043:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: c125e758-315f-4ea2-3bfe-08dad81aad16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t+4o159JBUmQ5ybNeBngZPrEGaNHTGn4PTSSy+sxBIPqXZJh/jLe6bCDa8gS65SVdW8iZCywsAMp5PzftxfX7u6Mq1cM17/4FkpcE78gPBjDhiLzxVSUEMeJyKLoXqLZd8iuHEVRetqJuWpXzYBGeisffw5AQztPnVYc/MxSalap3nosTM+Jbl9EQ/Qb3Klx1ECkgmbebqVgwLdY+kAkVUlz/1hna1I8AezCBtnTYPtD7GlXNHNF4QuGJls6zsYnki+U/iOf/P0AbvvVPwuW5exegdrfYTn3VgmGFS24egwyuEPuofR1S/klMk/QyKrGd/7WcYfKLDY86FxJMPU3EGohuCjvKmJWEju42EJc+9bmoQv2MjW072v6IO3SP/bJ2mGGZ7QVMn/orHp9IoJOEJHGXcgZT71nvepZG466bNNAIaDPafkU6DX0zOA6evGZjRQ98rF3H3yFmf7ZGuQ2G5KptXLtIs7xoTDGS5rd47gH5CvyyXrITS6WQseOZA4A5pT03rOd85QUEggOiMtFfu6m1P8++krT/LWxZPi83WL9jdmzVjKGkUzUhImQD5qhnliq4xzedWbVQbn/n2/4RH8W/qjeTFdOu/n++ZceEGSmr4xftTgd+3DYPPyTtDWA5rT9sWy/T3TUVDsKpbn07GOHGZkt85BkChWLxmQbzRGb9RNvYqqLad0YamiU14HJUuoINqT+XGX56cJv3FDvT3rS7dW3nxVI0Dfh7cvPiZ0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(41300700001)(86362001)(81166007)(356005)(70206006)(44832011)(4326008)(8676002)(8936002)(70586007)(2906002)(478600001)(82310400005)(40480700001)(186003)(5660300002)(26005)(426003)(336012)(47076005)(6666004)(54906003)(40460700003)(2616005)(316002)(1076003)(6916009)(82740400003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:17:11.0542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c125e758-315f-4ea2-3bfe-08dad81aad16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

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


