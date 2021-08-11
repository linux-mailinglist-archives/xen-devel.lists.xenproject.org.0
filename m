Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BAC3E8E8D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165626.302692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQG-0002sv-Pd; Wed, 11 Aug 2021 10:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165626.302692; Wed, 11 Aug 2021 10:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQG-0002nq-IX; Wed, 11 Aug 2021 10:25:20 +0000
Received: by outflank-mailman (input) for mailman id 165626;
 Wed, 11 Aug 2021 10:25:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQE-0000BQ-Bu
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd9d89a5-d3a3-4741-ba50-954fbfc1dabe;
 Wed, 11 Aug 2021 10:25:12 +0000 (UTC)
Received: from AM6P193CA0096.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::37)
 by VI1PR08MB4382.eurprd08.prod.outlook.com (2603:10a6:803:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:00 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::fb) by AM6P193CA0096.outlook.office365.com
 (2603:10a6:209:88::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:59 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:24:58 +0000
Received: from e31897cafa99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7359A672-B132-4975-95F6-FC9733A0DB11.1; 
 Wed, 11 Aug 2021 10:24:51 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e31897cafa99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:51 +0000
Received: from AM7PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:110::15)
 by VI1PR0801MB1822.eurprd08.prod.outlook.com (2603:10a6:800:5c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:24:49 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::68) by AM7PR04CA0005.outlook.office365.com
 (2603:10a6:20b:110::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:24:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:41 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:39 +0000
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
X-Inumbo-ID: fd9d89a5-d3a3-4741-ba50-954fbfc1dabe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ONilfRs6Yw0UA5hM/jo7ynBsRjRbTUFfphDgQCzBbE=;
 b=W475vQAn2fpdoJ8+Ws9up4rgsyDEcKr0XzmHxeiLSkwubhvHGNYKU3aKpKGpIq3PL24beQbaS95hu48j/GETzFx8I7tfDCxUUxDV4xLHpC4zB2natIii/9jc6T/56SqJy6AwrKKsXWt8Lhma2bbUitwNqtrU10sd/oS5q0ZSqM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 315ae1731925a2a7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH0VQPASUcZTHYsvG5ERQ2pcL2rjFW2JpPh36q7TbFRNzF3arULhtxzMzzt6a/Jtdo7IvQ4oNGC8K/x3EGAp6+G2QUHOl31zVHDfWZPP0gDmjnur12YptZzzNst0RCFFw5r1aYbJuOuhVO0vs57zRYdu6/fMHXErZFXPNLCyJh++deKpefxepKOJbuee70xMkSLEmZn+sLQvIJ8t5H+MWGqKTqop5E380lepNpm9co3AdTQUDjVtbCi2m5uMXRfj+xwI1QXffdlxPSLBQzcJdLIqfHFBGgrRSCNbLojV/nsM24vIqqPoLUtAMNjcPjbJcIc4P3EVvKUKmUNEl9D6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ONilfRs6Yw0UA5hM/jo7ynBsRjRbTUFfphDgQCzBbE=;
 b=PhXzIFORhgqofwHOWrOwO72YBB1SKJStLJK1SKEKmMR0AbpmlBC/yc9lZcwr6z+J2UBrIecjRb5KrTtMwFgXhsTX5zs8d9ZX2cMtmHh13iJWzkypHcHIjPEqVhoOmDezkTpaQcPffui/5ZdSrhJPK+JCu3hZ6D5VNI5xhFL/1SBnSOOvZ+x95DZ9I3L58FvwYpK88Bh1CeGtimNcam2zmkBZ0WMMuiF8Qujg4Oaj6DDuLD+3V3BXgmmOr8BNcGfgFA+P1X15FkG4VYtFNquJIAY2w4GkrGmriEgj9dsEwA0WPG2sVJ1GeBzFdNqz5orKXGkCRM5Nhnr4pxwHV7jHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ONilfRs6Yw0UA5hM/jo7ynBsRjRbTUFfphDgQCzBbE=;
 b=W475vQAn2fpdoJ8+Ws9up4rgsyDEcKr0XzmHxeiLSkwubhvHGNYKU3aKpKGpIq3PL24beQbaS95hu48j/GETzFx8I7tfDCxUUxDV4xLHpC4zB2natIii/9jc6T/56SqJy6AwrKKsXWt8Lhma2bbUitwNqtrU10sd/oS5q0ZSqM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when platform is not set
Date: Wed, 11 Aug 2021 18:23:47 +0800
Message-ID: <20210811102423.28908-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 675fb2df-8614-4c76-0b6a-08d95cb245bc
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1822:|VI1PR08MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4382E909B359CBEF3A94D0FF9EF89@VI1PR08MB4382.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mmWuGuIeI55qnbkmxcr0UQQZuYZ8/SWgpugoLOAunOA918RvHAGJGreehvlRZVi7bO+84KAFCDvVGkdGVySpjNKLy7fMwmMH9tm5wbhs7MRpKp/apgcmReQB1uXWGiRSEKzAnXvXzP4Ik3QgUiTN7to5s1M1MTS/oBb9gVnqiZBhpkP9ayZENGmpkjYfASrMjamdVQEIebC0EtJW0gbxkXvKCalpfbNWKi//v1GCOb2QDRF4k/1SwFHJKZyJ3Jsqd1aa1qBAscnzz9TNfMLTDI0qL1PcbJteDL1slIx0CHJlYL+N7VyBpAcbx1q5simPbNLdBwDT8BbJwd6lyxYxJhlT6tnWDD3P1fh0ELq6x1b7b0KoIdSPfyPwhSlv+1FNCheo2M6Xy0hfpGwie4ak+DdF8tv5xnHeeeqHuAzbuDzWdShfMA2c3PS/sq1IK3j1jAi8nhXy4cIO8QNJN+gi2FkHOValKovnKg33dPdP0SNeX1094oMohIozsPmwS3hL68bTiFhzsVZxKdp385g4o4Q55Wspep+hEX5r1Az/FlGhdp/VUwxf1Ou4shEKeWly2y+R4ER7AzsXLTMQvXIQ+SQWRcCnuyima48DxbjxzbrT2uEE8ExUXkcEDwmikrCRk+fMWmBZ1C2quoHpmlMuAgwjGvyYLK2lTZxIj4MTJIvu401Odh8rFvvA81EeCuutYnLypuMSF4rEn5Z9EBymvU3SV3dkuulijmxoVvPzcCcLtYNofdrMurPCCkHUtMH3nptmfSvoFFNZo9G1DxlEv2IC1n4Q839KuF91prbCCVY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(36840700001)(46966006)(81166007)(110136005)(7696005)(316002)(83380400001)(47076005)(478600001)(82740400003)(34070700002)(86362001)(6666004)(82310400003)(70206006)(70586007)(44832011)(36860700001)(8936002)(2616005)(8676002)(336012)(5660300002)(186003)(2906002)(4326008)(426003)(1076003)(36756003)(26005)(356005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1822
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	696d9156-a991-4f5f-1f75-08d95cb23fa4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dUiae/JDPt9L/5Xv7JqfZxLvL8spMiS4TlVFFlwmOgzMDKLPbEVpEDPvblq2Ja3tvQ4OW6Ko+ojcxgE4ve6kDN08TjoMIJ3kNeRzQgbRC7Xm+pCW692MzvBn7oiFH0+/JlSMLRYuV2TQpJP8ggIliynY8r/ybzikEfeAOi81vDdylmhZyxpxSDlRxENnvZrMQ2aKKOErmJ1c2s6niBoOnb4T6GtWHrO+kRD0XeeLHt+TfBYQjfSn8gEtiMPrjB3kn1sqGy5/b0sdcp1s7LX5RxoeUTIPKkhKEmGERVYgPXpmZEc3B8i4vqvDok7Ov98YfT+p9iyryDzXwHPLmz/i+ZgcmQI9vqwe3fOjPVwO3i4A69qxra0PLsdmTUrSnliw3wqO/rjgwSdlTrPIW6ptTjwnRcftWAb7Srmni8NFWTfQJIg2NUzFR7CT/mPK4A3H/l1D7W7UkAW7Yh3mAduUgi3cZUegcyG1uqsenjDTMf/THmtvpHIk+IcBt/eXUKq/xeOgE1INOMpFvQAfXi154Mt9jIBOtQMcwrLUfMpemxbz7vul7mKP+ccUp/mjM8Ph64hLIjbiyvgMTTYSyMkcI+7ecPa+B4XOI1bfi7Ij/q4lKr+Xp6Sd2x6GGkQJYOCc5sbIJ92gHfRXploCze511EUc6XJC9J3/VXWce7vHd9pCDAWVZsa5nO1qqwU+Xh5gPEc8yDaUR0OE737roMfPMEj8ySNkvgFbH5HsB9+c6n0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966006)(36840700001)(36860700001)(70206006)(6666004)(316002)(2906002)(82310400003)(70586007)(336012)(110136005)(36756003)(47076005)(82740400003)(83380400001)(81166007)(4326008)(86362001)(186003)(5660300002)(44832011)(8676002)(26005)(8936002)(2616005)(478600001)(7696005)(1076003)(426003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:24:59.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675fb2df-8614-4c76-0b6a-08d95cb245bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4382

From: Hongda Deng <Hongda.Deng@arm.com>

In current code, arch_get_dma_bitsize will return 32 when platorm
or platform->dma_bitsize is not set. It's not resonable, for Arm,
we don't require to reserve DMA memory. So we set dma_bitsize always
be 0. In NO-NUMA system, arch_get_dma_bitsize will not be invoked,
so dma_bitsize will not be overrided by this function. But in NUMA
system, once the online nodes are greater than 1, this function will
be invoked. The dma_bitsize will be limited to 32. That means, only
first 4GB memory can be used for DMA. But that's against our hardware
design. We don't have that kind of restriction on hardware. Only
platform setting can override dma_bitsize. So in this patch, we
return default dma_bitsize, when platform and platorm->dma_bitsize
are not set.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
---
 xen/arch/arm/platform.c | 4 +++-
 xen/common/page_alloc.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
index 4db5bbb4c5..0a27fef9a4 100644
--- a/xen/arch/arm/platform.c
+++ b/xen/arch/arm/platform.c
@@ -27,6 +27,7 @@ extern const struct platform_desc _splatform[], _eplatform[];
 /* Pointer to the current platform description */
 static const struct platform_desc *platform;
 
+extern unsigned int dma_bitsize;
 
 static bool __init platform_is_compatible(const struct platform_desc *plat)
 {
@@ -157,7 +158,8 @@ bool platform_device_is_blacklisted(const struct dt_device_node *node)
 
 unsigned int arch_get_dma_bitsize(void)
 {
-    return ( platform && platform->dma_bitsize ) ? platform->dma_bitsize : 32;
+    return ( platform && platform->dma_bitsize ) ? platform->dma_bitsize
+                                                 : dma_bitsize;
 }
 
 /*
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0cd92..0f0cae5a4e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -227,7 +227,7 @@ static bool __read_mostly scrub_debug;
  * Bit width of the DMA heap -- used to override NUMA-node-first.
  * allocation strategy, which can otherwise exhaust low memory.
  */
-static unsigned int dma_bitsize;
+unsigned int dma_bitsize;
 integer_param("dma_bits", dma_bitsize);
 
 /* Offlined page list, protected by heap_lock. */
-- 
2.25.1


