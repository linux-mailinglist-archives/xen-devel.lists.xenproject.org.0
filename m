Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C11778116
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 21:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582175.911806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6k-0004N3-GS; Thu, 10 Aug 2023 19:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582175.911806; Thu, 10 Aug 2023 19:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6k-0004Jv-D8; Thu, 10 Aug 2023 19:14:06 +0000
Received: by outflank-mailman (input) for mailman id 582175;
 Thu, 10 Aug 2023 19:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFdC=D3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qUB6i-0003Ze-Rx
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 19:14:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c000ca-37b2-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 21:14:03 +0200 (CEST)
Received: from CY5PR14CA0014.namprd14.prod.outlook.com (2603:10b6:930:2::27)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 19:13:59 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::72) by CY5PR14CA0014.outlook.office365.com
 (2603:10b6:930:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 19:13:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 19:13:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:13:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:13:57 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 14:13:57 -0500
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
X-Inumbo-ID: 10c000ca-37b2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frt7eqpDRVjpO63Xw4tuM2/DRqg33XW+xaMuVkGL4wIGH0FwxTqK2DpEA8ezB+PABXWn6LxcrO9WGOxUXIOgEVt7Vo5MkdS8lSM+XLtrBKCOWAGIo3iyN5eM0NrV3LmG/TYYceXrK+qCXOXPfggcozy5uWWnB8uM+m8dO5+XiPCyWyfCgNjl3upVBOuk9kKkTn0/wA/VmmnkouMfu4aF2c3H0n8gAsBage2pHJmQRBqMDfxmpeF/WEkufuZ/QDlnO+Azu0s6l23QRa2o+YM8+2B8gxvOyQzjb1HcPDGf1ogY8THYfgl3/3+tWkrF/xlIXzQdDtDDBh1LSYCAQHEcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlSGpBPqcY633oL1I0uwX+30drJWk9gY6gx+J9uhOBw=;
 b=j0m5y0FLl5ctbfLv1bfq8Wz/6DONkZNTmlQe1QdIoSPvv+0Mg0lfAjayXo6XZc0JVGGwUSXRnw9qKVekI2I0/cuViQgx4YnAOhSAG2/uIxs+kDZvtTIxOUgKF68aR+c/BZ4uJKWx3vN/CYAQ2837ox+36eg4Y3ism95RK7ahJsIeQ3M2vkag8NMlJi93q1YUKfKuNZTrBPb4MA/raadasyEbu/vlYhByOuig58+Q3VS2Pr1mXQnmc9Ws2GZbUt1q2ZsQbr3Qao1NT7ubkfkhaYdoiHUkSryFlLe/STO7pXJjyy/+Td8e4l2nf8G4m17STlgFUczBIy0GBOZX8Rq+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlSGpBPqcY633oL1I0uwX+30drJWk9gY6gx+J9uhOBw=;
 b=IWW7Yh/Qe+/0zo5VxuQER+eBriR0XXoqvVgS39BwI3uqmAPP/AIDYR0p376mK8zCPSzcrpMPRq+Vx9nEeuX91CWsQCYJSWZbAyMANCQujgoeQkxxz5chnvjRsiIN61M+mnxyl6CP0p+SwmWOGBIIMMGKysqTOEOLBUJW/wsYEpg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 2/3] xen/vpci: add vpci_read_val helper
Date: Thu, 10 Aug 2023 15:12:58 -0400
Message-ID: <20230810191312.644235-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810191312.644235-1-stewart.hildebrand@amd.com>
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: e91fbfb2-1328-4f37-134a-08db99d5f323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UX7+T/dui+uch7n0WnTb5dxfauOWobY1HESlu+E6usctLE2fSkOqh2t1YbSyUkhfx9EdITwo2OwsbqJ11a1i8RJMAkTIv15ywTEwtICxioCKY1/6aDm2T79MSi6SvzfjDu1ATlMF0XTzkj4T3h2kI4z3MukUX2Mft0UrK7MjVlY+iOKl47UJ7DK0lcQotU/38nZR2Cr+d60IgIaXE8thxtQf/IHua3nk95qzTHOdeG3jowR+3azzH5XAzpxboBC3WcqBqYXO2XKLJ8lpUKnphzefHsgC4zdzfcb30buY1MK41VOeRhEPDODw1psPIWRs7LAwwcuoO6jZjvjnlI6ekCIZ6v6YE/ZjFYtDWqaq0BIQujrq1jteFkcGbNZdDVfUeuOb0NAb3rfHJUrfAGEzNdzCN2X3oZGwaYUbVqso9ZbEcgokSlesZTFDIh0F9/OfzGb0mRWbw0JESsIVcG6IOnhHAvRk2TYyWZI6yfcT5lHsTV/OzZO106VW7L0AqSSDFARbR9zE1MtcCyrNUa993kgsfE9cuJ4AtaDC/MUF8f/Ra9Ae6vIagE4taISxkTsBrlENE2oEOB9EdylQt/U6tKBhFLuIi8UUDy/kMWGNfzQQ4n/fL/ANlxlqFbRt0Tm/KkVlPUVJGgTmaPUhIf1X5n0/c8AcLpu2i2TrtqKe/I2p+KOeO9D3llc5jpFFJKBkLwJxFAzIFFGJJ8H/4UEBbSFqurYj5mU8hNiif3Au70Txrqcr2oUNY7Vd3iujWecsyUBvd8gWOpu8UGfW5EFSpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(186006)(82310400008)(1800799006)(451199021)(36840700001)(46966006)(40470700004)(478600001)(70206006)(70586007)(4326008)(6916009)(5660300002)(316002)(54906003)(41300700001)(40460700003)(8936002)(8676002)(26005)(1076003)(86362001)(82740400003)(336012)(40480700001)(44832011)(36756003)(47076005)(36860700001)(81166007)(356005)(2906002)(2616005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 19:13:58.8209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91fbfb2-1328-4f37-134a-08db99d5f323
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829

Introduce a vPCI read helper function that returns a fixed value. This may be
used for RAZ registers, or registers whose value doesn't change. This helper
will be used in a subsequent patch.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
RFC: I'm not a fan of the (uintptr_t) cast, but without it I wasn't sure how to
     pass a value without allocating more memory (either with an xalloc function
     of sorts, or by adding a new element in struct vpci_register and changing
     the interface). Plus, in the current state, to pass a value to
     vpci_add_register(), it may be necessary to cast twice:
     (void *)(uintptr_t)myval. See next patch. Perhaps a new allocation is worth
     it to avoid the casts? Or maybe I'm being overly pedantic and the casts are
     okay?
---
 xen/drivers/vpci/vpci.c | 6 ++++++
 xen/include/xen/vpci.h  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index acadba1fd6c5..4a96aa50494d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -133,6 +133,12 @@ static void cf_check vpci_ignored_write(
 {
 }
 
+uint32_t cf_check vpci_read_val(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    return (uintptr_t)data;
+}
+
 uint32_t cf_check vpci_hw_read8(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index ee7a8fcdee83..17fd252746ec 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -45,6 +45,9 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data);
 
+uint32_t cf_check vpci_read_val(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+
 /* Passthrough handlers. */
 uint32_t cf_check vpci_hw_read8(
     const struct pci_dev *pdev, unsigned int reg, void *data);
-- 
2.41.0


