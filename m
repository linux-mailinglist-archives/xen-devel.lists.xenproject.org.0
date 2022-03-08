Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B34D21E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287478.487591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoI-0008Vz-KA; Tue, 08 Mar 2022 19:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287478.487591; Tue, 08 Mar 2022 19:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoH-0008PA-Ov; Tue, 08 Mar 2022 19:47:53 +0000
Received: by outflank-mailman (input) for mailman id 287478;
 Tue, 08 Mar 2022 19:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfoF-0004Om-Pl
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eab::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a252d0fa-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:49 +0100 (CET)
Received: from DS7PR06CA0029.namprd06.prod.outlook.com (2603:10b6:8:54::29) by
 SJ0PR02MB8784.namprd02.prod.outlook.com (2603:10b6:a03:3e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 19:47:46 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::92) by DS7PR06CA0029.outlook.office365.com
 (2603:10b6:8:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:21 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnl-000Cws-5e; Tue, 08 Mar 2022 11:47:21 -0800
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
X-Inumbo-ID: a252d0fa-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evO+N4/NqQj5VI5dAlaM6O4Yo2tX0jJQ8SDjFtHSF8I+OiR2/+vGinMiMDYOgWI4qZ//eg2wjwblNMzG06946MDLv00u3JZ74N6gu3F5lyOGjjVGe/r/gC9+IrkvdsrE2CSgxQGigWcodanRl8w3AZ5hBvyzjZAVtOxQPsHh7uPo89e/kCSvJ5N+7enyhmw80IPl2v8h6CXNo1KxsmCaYYzVIxjW/nilXLx/oMTExKnOAQxc7/y9r4haqHE+pFvfGOMxASYjx2fJV2KeOhi9SdV72dznYBfHsxR3cJq4xad5CURst/TPjl2MbulRR0hnNWKiKaZ6p7BrH09931Sgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7qfG/E62ZPUQLKP3CMDSNtZWZYJXpDeF3V5RfWzOVc=;
 b=k7MyJrWg39HGU/4vZC1XRjnzJWQDtBTJiqfAHhEgMqanlqk2bY0ypKeQVHzNcmRm0WtKWUzp8wGDMF53NFQqhnlXglR3sZFIwXhHUmc+SwEaP6rg36rPp9T359o9q10FxeI8ABKCrCbJ3GVBEE6l3Iy7sTFPEz7fmMYengLI1Nc+WjLbIP+O5DLSOBf2EqyenmsiRGPquhAuQ7OLnW99aPqry9bOCX0A3v6Lf8YmkPpUAL23kj38IgiCjPgCuZ28y1loAm3RT6E8ix9xcS073rThqEjaZz6AWvTXIgqqVU4oC2HmpEX8afN+O0WZvur73AdAxYaWW+qrgEDT7JSNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7qfG/E62ZPUQLKP3CMDSNtZWZYJXpDeF3V5RfWzOVc=;
 b=QbgF+U/E95WZso4QCEbIj/KlZ4pc452OiDNG4SDGpcXAPHihjXoTrZFdl9NgYdZx+0nSiacUh0u2kKfZtS91YOCxnOFHJqcDeCyKBkk+mUjwzb0qkLurzoJhEKoOGuBUOV/tnSa238ql2f2zCEvd9jjCLjs8Uw+hpXwy7+FlVzs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v3 06/14] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Tue, 8 Mar 2022 11:46:56 -0800
Message-ID: <20220308194704.14061-7-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bef838d3-10fd-4806-fe9a-08da013c846d
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8784:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8784A51BCB98DC45C0BB1EF7BC099@SJ0PR02MB8784.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g1o9PnDS8k8B4xsbIxjCbdSVqwspk9GkJBJaPYgyG2EDBLHw93Ng9bi4QBvcMmPbbQz7+0xvTxdgOdbf7uvVZNs3zmzjOajkPsUihcfDOkHslJFzlIIiZWKJbMgCWPXhsnqcTXUcNbQBk9dnl2fjqEF9R+X9SIBHuzKsrTyqwANfONZBdclyWbcospVG581HFt3b5l3hO46QFyXKzRaIUp+5gCZgUkVaB62webvcrjDh6rBinvhZp+vYK3NBOv+kUQ8xfm+faFxdbCIQYXh6WVGXW57M9n1usWqOWKXiIA4VJyXFZZ3finu5oPZE68o6zZJSq1OXTm0FY2paJ/8gHoW2WmgHr2Icszc1869TND3dBgJdMkQA+75WprB/IfPokPEtI7JjIK9/cDcchfGI49PwJQwcoL13ECD69NDJGFZvji/S9fGJWwZXSrsbKxO/c4qwjL6q1UiigYQ448Cs1ACdtbAmbXEHRUqYho3MtY175lSQKNLUOdfsOCz1ASSblXf0FMO7/3Q9FmytMlAicW+DcrUefkxtVwwuPYsKd1BRDoQYQ7R92CoudmvDI5+5vtOs5KsOEu1A/344FMoK4+MuE4/mF7fWKkIj3CQB0NZ8wp0aFuSMs4smIYCTQtfuRQjrBN/SF/U5auIv3KiuTmxkdsRgIOXWgFEOltp3HdHTvQ03iHIwPXnXGGm27Ui0Cvk7o8ZMncr9gGabIPVVYg==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(2616005)(8936002)(8676002)(4326008)(508600001)(70586007)(70206006)(5660300002)(36756003)(1076003)(9786002)(26005)(2906002)(316002)(186003)(7696005)(36860700001)(6916009)(54906003)(47076005)(336012)(426003)(40460700003)(7636003)(356005)(82310400004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:45.6875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bef838d3-10fd-4806-fe9a-08da013c846d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8784

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Remove the SMMU master

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/arm/smmu.c | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index b186c28dff..8b3b8b9850 100644
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
@@ -2861,6 +2916,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
-- 
2.17.1


