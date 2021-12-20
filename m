Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53647A44C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249407.429857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7g-0000jA-0C; Mon, 20 Dec 2021 05:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249407.429857; Mon, 20 Dec 2021 05:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7f-0000gV-RR; Mon, 20 Dec 2021 05:22:07 +0000
Received: by outflank-mailman (input) for mailman id 249407;
 Mon, 20 Dec 2021 05:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7d-0007eG-Dx
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c459ccad-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:22:04 +0100 (CET)
Received: from AM6P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::36)
 by AS1PR08MB7498.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 20 Dec
 2021 05:21:54 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::89) by AM6P195CA0023.outlook.office365.com
 (2603:10a6:209:81::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:53 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Mon, 20 Dec 2021 05:21:52 +0000
Received: from 49c66bd62061.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48B64E95-1A58-4E68-B05D-87C73FE415ED.1; 
 Mon, 20 Dec 2021 05:21:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49c66bd62061.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:47 +0000
Received: from DB8PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:10:100::48)
 by AS8PR08MB7208.eurprd08.prod.outlook.com (2603:10a6:20b:407::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:21:46 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::ee) by DB8PR06CA0035.outlook.office365.com
 (2603:10a6:10:100::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:46 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:45 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:44 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:43 +0000
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
X-Inumbo-ID: c459ccad-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJcd0gELplO85ZW04E9W1750ifu69iwOym9xLUkG6o0=;
 b=5TrO9k244YUK0olDaLzypP7VFlJsvCqE2RvU+0vjpNAv7khTc+LyU27W1N/uSQKjwSWrbLnnqkRCUhZafdqdQHjCr4kEBl9Hl5E0K+xk1YjHJD7zOlk4IYCp9eMhYhBdEjsN6eMM3lB5hNdD0+mZbpLJlBIEf81D0l1Dgy2ClZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00ae99ad4c9d5654
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np0BPpnXvpx8yKQ/ZlcSWHAuDhL76qXAh8d+YdtKPpJfWQEwy8tRiSHvJMFMQRNwWQSc5p8ViTxpCRJJJKSRb4047/H246KLqfW46uUqrTYFkKV9+Kn/c7BIDD33jguSP5qLRrtHU2QsQaBSQzC8TeaXZqpSccVWB7Oc0+TxO5nuEqD+tGlxV0aQya5FHvUrz+eOlhVfsPOxKpD+jVEgrlRnMbys6vlXBGITgIb1gXAyRlh0GfTUXvCyXiTN2phOH05h+Rfxpn9+KuEDBXgOmaWJtTLwJER+Wep/BFLSBmdQ5uO3fqy2zcKT2gEPAGG3g8E7mVUcUghBzPYMSHCmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJcd0gELplO85ZW04E9W1750ifu69iwOym9xLUkG6o0=;
 b=jZfXI7sb4f1fQVJnyK+w7FjGVnJQgZKEDEA/t0sWliqBI2KE6wasT/8ouksVfnY/+qchWkhYA//fZagj7cxdpVT0qdvrY1nikVSEGB6UQJ6eRVaLi2+wk1xSlad6cfAgdiuGdKqt8BLeDJNuswAMj4xRzl32N7csplQZ92wnV4ylLB1uOG672Lngd6rd4yQA09c/B4bvIT3s+mxhZwLFZUZYMpmjVa2Td/qWHTgsyPYn32SC/SfvbFemP6pIOYCSuRz8DgaCJPieN3Gl31/LkEr4GAagEB/n4WZuKvxiZ5gfdidYSlXMW5PiAe24kq7UOdSStCWherl3Jl4wkPOw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJcd0gELplO85ZW04E9W1750ifu69iwOym9xLUkG6o0=;
 b=5TrO9k244YUK0olDaLzypP7VFlJsvCqE2RvU+0vjpNAv7khTc+LyU27W1N/uSQKjwSWrbLnnqkRCUhZafdqdQHjCr4kEBl9Hl5E0K+xk1YjHJD7zOlk4IYCp9eMhYhBdEjsN6eMM3lB5hNdD0+mZbpLJlBIEf81D0l1Dgy2ClZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v4 03/11] xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when IOMMU off
Date: Mon, 20 Dec 2021 05:21:15 +0000
Message-ID: <20211220052123.969876-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 41fa8410-e15a-4553-d70a-08d9c378a233
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7208:EE_|VE1EUR03FT061:EE_|AS1PR08MB7498:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR08MB7498F2A18C07D617A9D64EFBF77B9@AS1PR08MB7498.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mAFfSfnjbYNHj3J3X8WcYAhmRpGfR0nNYGBDuZk1UAbApkUZ3kYsOQ/S7tWF6hlw9/623+dEierTYuOxDzvmEMfqZmpRwtwjjDQX/ARo8gqpl4QcRYhfpyLi4DJw1hEoz9yCel7PZnqpGuHfjV72/RrIWEjrNC9MZ10jYohsiHMTbMP/XWT28+Gds2AZ2jIpkPijj1hf/HrQb/N9kJtypbTB3gE3Wzl7TX2OPuLWKXwXqDn1RfiEcRmSsUi6rub9wder5iFs5WXgtXjcMvt+lTFYmsy+DPuAM0uhaSzSavkZ7Wlnok9IniOQtv79d8SAYdqOwk40aAM6dI3+DUCsrbVchJ2r2GXZ4OlUOfMQ3XKdnz8WHFxNsJZzm7M56rYzQvzp2RCvwDHuJIuaIEhd3RFBOUg0Fh0KcDuY08jU0JbEPBNuVnxDo1xzD+wIwkfs9Wf8l/gtgE289NLu0TScFho+CILhLrh/CrNjkRsYh253FRpKR+EFZwO87bbvlV5ITSBgnXK0oAoeQYfjqLElVSUcLyB6mie5hLa/asyXAmvvZj07gfNHzlT1azQLrxyS1pfnJzxxX0BYkhc6o1o6lXIELuShS/o7a1O1fCpQVua0+RmmqB++KOAjsZbQmyBb1fR0N695SvKZ24Dr1lV9r+XWdgWT6NQWn0klbJy3dee5fL7xOgOO9pzsTvISNDMD4WcXMnuxkG7MUl1qX8K1cFwtxtNeThS1OkYHArmnz2Z5B4AJaa2GcIKV6UywB5LoTp4nrNkCR1rN6wuGDf00iyfMQLUoHNzbFyb0O6I63QE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(110136005)(7696005)(44832011)(26005)(1076003)(356005)(47076005)(36756003)(508600001)(5660300002)(36860700001)(86362001)(70586007)(81166007)(2906002)(54906003)(70206006)(426003)(82310400004)(8936002)(40460700001)(83380400001)(316002)(336012)(4326008)(2616005)(186003)(6666004)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7208
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71631a5b-98f5-454c-5f5c-08d9c3789d8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqTHN8NRFfiWaZJMMoUWBIpJujAmeBvf5qaSY5Rxo3kGW43Kp/x3fYyfJdUBz/R7IcpTcu1TqFmM1dOqn5J7EdugkZJNTr1hnNL1DOla11tCESXh2EfMHfutjwkUAgpwDIGMgGyhU6mDoRP55YClTg+esVH8j6fdCxxstx2XT3K0snrqHPm9TJpN7+tKKmfjrR9Es1oD7vrNOv2dvLzxzcEi4RtE9isG6G2SvxQuSBlE8tLEi1Bt7XuB6ZY2k+44875++paF81nJLp/WhKCi8UdL1mUmA2JKSj38sTUvZzedZqbMU9puuOBmHjgFwZbBiSYBGRRN0wYxtBC+yLm+XNaoK8FalnrgoKGN+jXIdch5QKv2nlx5LDCrjkJwn1532mDAXjp00XZpslumolmP9dUuJcZlMBGb8UyIVl6X7We43338IuW96TjnYdqfa4yRIOvMSY1u9uqS7gqQWUmKoekg4LWKBahrEPkZjq16rJp/vxHVYXRGnevI/QVwu7TLHQB8I1B8FCLuOWfbVhgihfR3uHX1s9qbFt1dhtpF6bt6zegg4JQAvaa7edRKLi86g9fE2lhVhSB9m9jHSmfh+E7fhN+o421a6b4+2dCLUs/hj57NxgbwCoQOFwau3Cq0wVEjQ6r3b44LqxM9M7U0y3134L+fpBrMUNcMDL6iRGc1kEWlnXKcKzOLMiHwN4kmU6DPRf+EHS4GildUka5lvg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(36860700001)(2616005)(47076005)(82310400004)(83380400001)(2906002)(1076003)(44832011)(81166007)(336012)(110136005)(5660300002)(4326008)(86362001)(508600001)(6666004)(8936002)(54906003)(8676002)(426003)(26005)(70586007)(186003)(70206006)(7696005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:21:53.3496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa8410-e15a-4553-d70a-08d9c378a233
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7498

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

When IOMMU is absent or shall not be used (trusted domain, performance,
hardware limitation, ..., etc), in which cases this commit avoids setting
XEN_DOMCTL_CDF_iommu to make those user cases possible and prevent failure
later during device assignment.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
direct-map for domUs"
---
v4 changes
- explain briefly in the commit message why we want to do device assignment
without IOMMU.
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9b1a5e38d3..5a106a977c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3047,7 +3047,8 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
+             iommu_enabled )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.25.1


