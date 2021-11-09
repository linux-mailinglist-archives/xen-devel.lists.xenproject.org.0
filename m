Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6DA44A74E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223713.386630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA5-0003qx-Lj; Tue, 09 Nov 2021 07:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223713.386630; Tue, 09 Nov 2021 07:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA4-0003eY-Tk; Tue, 09 Nov 2021 07:03:16 +0000
Received: by outflank-mailman (input) for mailman id 223713;
 Tue, 09 Nov 2021 07:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkLA1-00004s-PT
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a3634d2-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:03:12 +0100 (CET)
Received: from SN7PR04CA0171.namprd04.prod.outlook.com (2603:10b6:806:125::26)
 by CY4PR0201MB3619.namprd02.prod.outlook.com (2603:10b6:910:8c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 07:03:06 +0000
Received: from SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::b7) by SN7PR04CA0171.outlook.office365.com
 (2603:10b6:806:125::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:06 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0011.mail.protection.outlook.com (10.97.5.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:53 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:48 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9c-000Ga6-5x; Mon, 08 Nov 2021 23:02:48 -0800
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
X-Inumbo-ID: 1a3634d2-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3GKJ4r3y3CWlFyoB/zQMb0f7UQM5KSJLKCARc6DzgoW23d3RZcbavHp4fjoO2VtJ68Dycw8PUF6Vqiwota5tSVqvOMl4jmlmRk+mO3B8DsX6DmEMaU+lqp1vwiu4/Ar+fZLcS8t4EtNYqNEOV1v8952VnLhJSfnb091rb26IzM9snQvVW/bSZsR2EzT++2fxY9ZxI30f9HPA2W2L/+P0yD/XppTEPvqy3hZ4v0FsZG8/6uEZGrJPHJCFcj97MbPGHLQ9XKcJ1kQ6eH7alISNqoNS/3N7C2qVxrPlwtZ6Se/F0lEZklUmiNlZV50SJfoUaiqFCvHiEknYugCpT3Rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqdp/GvnsU179UtkDRtrXW3Ma3HQaHxw15Jk4pDNfYo=;
 b=ZD5xW270DnlVUPcovsyyDgb4hl8G4fLv2/wg5w9VwlH5Xe4JifH8z7+8hYWYeA3lFWA/PazEASRVCKmktZ9/6jokjynHgYZEM9dVnJ8GRh8exk6NQ4MFLAeJJntZ0mPgt8A7lb+7cY4aQaJCH570Ne7XxebeRw89nN4s7M/uOuI37R9RAYKfYrC5N1DuQxXXjPIiI6gTZNcMhTC5ot7D28rQH06TIsfG4rgEA9hfppSr4s3l8NpoGiUCO/EJ50S/pNKfXGIkKoOpEMpK/N4qjHhbZmmx1Qqc9DhJ7y9GxLGAHZ7YVy3stUDReq98TrOmAnHx0IkAX/sGreUifl4ACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqdp/GvnsU179UtkDRtrXW3Ma3HQaHxw15Jk4pDNfYo=;
 b=XBYUbDxAxubZQ38sWbNo/V4IM2MaLyBbB17nDFhX8vHg/T/GQNkmvHoGg+N4rqmQMzLb8snQ3Z+Vwz2a+Grm6jHWZ52nOOFW7EKR3TrPH35+PdZuvJymmFnbameTHOFBNYzOt1VP5XWfPrbfaArhsohoMnwiCh3EEQENyQFcG2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v2 06/12] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Mon, 8 Nov 2021 23:02:21 -0800
Message-ID: <1636441347-133850-7-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d74691a-c175-4967-4fe6-08d9a34efb27
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3619:
X-Microsoft-Antispam-PRVS:
	<CY4PR0201MB361909393219C8514602972DBC929@CY4PR0201MB3619.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VEOLW/UI1lpFtm/Lr4yeO2cQz5ryPivi0xHg5pebB55DFvQJs2gUUiXkhQOiDySkl1DDy07hiQJo+KzSgs5rvCyI3oYo2pCqSipboIPQHdiU9D6niTSeLfItzdI753H7F0psW1nJq1JWEsOrwDR1nNSPhf0UQnjjOH6IxsukDNN8rSRZhZ2igJjvdQBi7fUuG9csvt14outrrgGfVIFEIP48epZfpFUMk596R39LcBDUVfn6iS4QCfMQsHlr0Q2yqPgOARpbY3hUBwpSfOwhccybsQBEqL2XyHFyXoW7VRYNoy5+t1uAcI7e2sr735wg7wWA9j5ru32Uy3gIoKyp7DVdHsyhFqLLEVPW8SEkS/M+dEiVinx56JDNC6/EEjq0RTzb7ecSLLTX2vwbkWys7SC5XZIELPy/HLbth0VpPh1kathmHMKXA9xW749SyJwPHB7dhzkf+j1IDvoxzBJJOFL8P67sDnTHRGp5pvRYtKeKgQeEGX9cDCXth8Tcif9xk0Zg5qlU5FUV4SJRztsz/76H6mUJq2ZrGO+MEUzW1Sk9gne1rf4TeX++f2g6my9ejq2iJquhpw3lcMzYaPbOrrE9Z4wFProp/WlCczmtyiu74svUPIYYPNg4cawfESyEIcbjRPehJAqMXueDuuP0KpM45yhM/gAe95Ab5PoNHKocBYu2D+nTlYUBLNSBaxUYBFHa1tITPTd6yt/qeusydTZ1GqZ9fQs1MBUmiwY7FBk=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(8676002)(6916009)(186003)(47076005)(26005)(6666004)(356005)(426003)(2906002)(2616005)(70206006)(70586007)(7636003)(336012)(9786002)(5660300002)(7696005)(4326008)(8936002)(82310400003)(508600001)(316002)(36860700001)(36906005)(36756003)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:06.5220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d74691a-c175-4967-4fe6-08d9a34efb27
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3619

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Remove the SMMU master

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/arm/smmu.c | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c9dfc4c..1a32e2c 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -816,6 +816,17 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 	return 0;
 }
 
+static int remove_smmu_master(struct arm_smmu_device *smmu,
+			      struct arm_smmu_master *master)
+{
+	if (!(smmu->masters.rb_node))
+		return -ENOENT;
+
+	rb_erase(&master->node, &smmu->masters);
+
+	return 0;
+}
+
 static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 					 struct device *dev,
 					 struct iommu_fwspec *fwspec)
@@ -853,6 +864,32 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
+    dev_node->is_protected = false;
+
+	kfree(master);
+	return 0;
+}
+
 static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
@@ -876,6 +913,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
@@ -2876,6 +2929,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
-- 
2.7.4


