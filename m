Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E178F7D3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594252.927538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwQP-0000Oe-U7; Fri, 01 Sep 2023 05:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594252.927538; Fri, 01 Sep 2023 05:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwQP-0000Mz-RI; Fri, 01 Sep 2023 05:10:29 +0000
Received: by outflank-mailman (input) for mailman id 594252;
 Fri, 01 Sep 2023 05:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGc-0001Hn-KV
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72e360b3-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:20 +0200 (CEST)
Received: from DM6PR17CA0009.namprd17.prod.outlook.com (2603:10b6:5:1b3::22)
 by CH0PR12MB5330.namprd12.prod.outlook.com (2603:10b6:610:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 05:00:14 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::21) by DM6PR17CA0009.outlook.office365.com
 (2603:10b6:5:1b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:12 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:12 -0500
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
X-Inumbo-ID: 72e360b3-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTSZxqIGX6QUklP7E+2bT/V1IuikQIE7ptoo+pjO/hd1Go0+JvZiGOqh2QD11Qeq9To5cOfeLioLO/L2WEPvabHLtcOhC8fX+JENV1xPYwU9Ls1r9sF3H9YCQtVtSfC5Lgca4oHRzEzDj+nDlL0ChVqnXVddqi9FqmRSk0HhjMppx+A8Qn0u+eYR9K2gbLFVLCUkB15oAiT24/+3MYiNd4S/28D94MZQi7c/ak6zzMS6vVtqlLES7yCtRXiyM6m40N7gQeLodYTBE8ltFTP1zCdFXd6Us5Pa59LCIjTJ5zXVHoKxXPWMG2uj33pF9MkQ8RodIsR9lvJLV9ox20Q7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Ad07nFyqe3yvUSTljKoScg3IAugPfBscvADFFb2TQ=;
 b=cfoERg+tJmlDINXCzok+2CY0OCeCSEjzptvM96kFfbMXaRJjGM7zr3+kp03HRbf/5XfXN5TJDkqOF3a80bcPxnEt5+cBOiT2NKhBmjhBe6SbMgK+PD3w4SxofdoD8gpO0+1udy5dn+ilQMG8zlRFavKi84lii1al8V1NKOW1Srt3t6WAB9jXuMpg7tf+0kepteck8tUwmRhVFbxStlRzPso2CqcapRc7VbYlAZOO+QWa7Qta0qDBKNdRcs3Cgxeek78CjkSBLIXaDdfgSIa8BtmkWwmM1HV0K3hahzf2bpWWHy99ir2/D66GNi1WIxQoSso4Zfx0D61REXPj1SLuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5Ad07nFyqe3yvUSTljKoScg3IAugPfBscvADFFb2TQ=;
 b=qwxtyOjyiw0it9jprvyaGDAx8fvVBChsAjAVNbo9CrfC9gDmtKH0EcHVwKZX+7BEwQNh/uWTu4oWpgeOB8owMRn2ld0ViOfeV26L6ipx1fxE3yDFgr0ff/wltqKEd/svN2gQfPJUS6JZLfC85X2h4w9h1FtPbeLVXgKeZEvhsGM=
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
Subject: [XEN][PATCH v11 12/20] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Thu, 31 Aug 2023 21:59:39 -0700
Message-ID: <20230901045947.32351-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH0PR12MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: f501a0e5-1e22-4433-c043-08dbaaa853ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0RiqoHbUAXBiQXKngOBAEYk8huoJjUHKDssVxDMWg0j6Hrilp0n+HYctAR4gw42huHltIQ1EPXD6zZEWCsJyfywkyfSaMbnzz5plYB772Yjm1BRDEeC1CQ56ms3o7b8NQ86vZYp0CjIIj6Lq7py0b0ziSLRp2FXF44y5f9miA6P7AHmgPJYaZzTts3rTfLUJkFyV8+9t+85YRzIiYNGVFt7BRO68qzwQ1uSaFElvDP2HsBb+Ubg4qcBSh6zE/RKXd1NmraABJYOjCYGzIAdwOZxH97WVlIPO3414q5qYu0HWvfFFD6b7mlmjBNt9g48uSCCA/O1iDZ/S7QThuyAn9QeewHf5WvEy7HacT6EI4SfpzdZXINIwXsrPirg+fLTOrKVAhsETfw+CCrauoxqgHmtDeibvSOBbv82EMrFeWgCi6UwmoiqnQaIPkfX3dtrVCqFol6Izn45l2GgdEg52LrT8SvAirtXDu/PZ7Xoq29MzDyZQqDqP2IIy8ygb0zZAYdxPGcxGoS6vt8InsYhFtxTnMi5RIXfMzUs3HeAJb4JMNKkOAQ9azPqLKIuT0J28PoLtpDsLbOfNQa8/QEfiL29Qp0HcJHMpkn51dQg6Qg3zQbTqt9pNxszfTWphoKq5ht3NDH+Wpx9JZew60enARBs7CsIJ8K/QcUAEWzc4vr/DG7Mv2IFIjHLRlZ+Jzv7OTWYXZbmp5LVXFlPb1BG5LxbuyS+L70xudCTvGG/8cQ2llQ4/0qFGRBt/p1H3K/2pnrD8VYaxXb4q67kongdag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(6666004)(478600001)(83380400001)(1076003)(2616005)(336012)(426003)(26005)(2906002)(44832011)(6916009)(54906003)(316002)(41300700001)(70586007)(70206006)(5660300002)(8936002)(8676002)(4326008)(40460700003)(36756003)(40480700001)(47076005)(36860700001)(86362001)(81166007)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:14.1503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f501a0e5-1e22-4433-c043-08dbaaa853ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5330

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


