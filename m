Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0B3E8E8B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165619.302681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQB-000282-CH; Wed, 11 Aug 2021 10:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165619.302681; Wed, 11 Aug 2021 10:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQB-00023m-8K; Wed, 11 Aug 2021 10:25:15 +0000
Received: by outflank-mailman (input) for mailman id 165619;
 Wed, 11 Aug 2021 10:25:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQ9-0000BQ-Bk
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edef0319-e93c-4997-b111-0630fe5cd44e;
 Wed, 11 Aug 2021 10:25:05 +0000 (UTC)
Received: from AS8P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::15)
 by HE1PR0801MB1820.eurprd08.prod.outlook.com (2603:10a6:3:85::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 10:25:01 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::ba) by AS8P250CA0010.outlook.office365.com
 (2603:10a6:20b:330::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:01 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Wed, 11 Aug 2021 10:25:00 +0000
Received: from f07ecd72b4d3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B1A294A-3DFF-4105-9E76-B9013CA48E2D.1; 
 Wed, 11 Aug 2021 10:24:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f07ecd72b4d3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:54 +0000
Received: from DB7PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:10:72::36)
 by VI1PR0801MB1631.eurprd08.prod.outlook.com (2603:10a6:800:5c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:24:46 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::68) by DB7PR03CA0095.outlook.office365.com
 (2603:10a6:10:72::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:46 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:46 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:44 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:24:44 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:42 +0000
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
X-Inumbo-ID: edef0319-e93c-4997-b111-0630fe5cd44e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Quh0tEBLns+ar8JRFuw/KOQmJhLjKjIBZgg0xnsXg=;
 b=2eh5hJb21Lf3WOF4YqpiJr0AVtlRKXHzkZVjD2fdKTYiMPQRyrP2FfECRZ3luDtmOenT+c1YuUd16xrtiAABRZlXa9jeCZ2cPQRsYTbAPXK/b6TbKmi/2IrWEIhMs6FYXj414It9OS8+pvl63Axf+UhT1xg2qkVPA7elF9xeWio=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a89ea8ceb0cfa144
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBMuQOK7uD9l1ovvWUo902MSVKdGnsrqP2B7kdd0qo/QVvBsGegoJvd2MO4ganAw90dkn/AUxsZ8kGVzqLocuvugdKzkJ81A0zN24XOo+Gjmr9KxDBDaomSV5f283HYZQWUdxSIymRaHGXMktX9awCDD1SAql0gQC2bXU/yag18v6uT98iP4QMudNbDDksNVpHa1FmKNrE6MPfArr6CRV9n3SyA689IZA2DkMHLVFUJ4K57sY+9l/rAA94r0EZQ0FsfZQ3nSa+G/+qzLAS0p9jglNSmEV4xWh1zdJ+8+o7QLCvPqtFa7ksy0F6BcAyNLFQ+8WuUyl0nwjVaRNCTx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Quh0tEBLns+ar8JRFuw/KOQmJhLjKjIBZgg0xnsXg=;
 b=aOZbkqqIJezjhrLmlLgFRT2T8wHr1sVZSWrC4NdRh8ej6EPlXiZRTs7ozRFnyghTGdHSVnE/F8lp2VrB+ui8ufImHOogQFwq9DKuxvZvKQ5+oHMATnaXHQT4cqVOhFd0wmcakQKzrSa4QaaYrtKB+E6qbOwJqFMLiTAqPG5cUZXtC+Q+1KaBdR0MUujjILcYOOppSlWo5D+W2xzjovtXX1nGXNrsSCf2YXDls21U2Kk5d0V0a8q4FpQtgjGNlAtNy6Ra6jXPeB7z+2YOa/x2tJN+TTBdnsBr9bebb4sZTkoMNmROI/Bh/7xfn5vvMySsOUGVo9opQHDW+jmnlc2hOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Quh0tEBLns+ar8JRFuw/KOQmJhLjKjIBZgg0xnsXg=;
 b=2eh5hJb21Lf3WOF4YqpiJr0AVtlRKXHzkZVjD2fdKTYiMPQRyrP2FfECRZ3luDtmOenT+c1YuUd16xrtiAABRZlXa9jeCZ2cPQRsYTbAPXK/b6TbKmi/2IrWEIhMs6FYXj414It9OS8+pvl63Axf+UhT1xg2qkVPA7elF9xeWio=
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
Subject: [XEN RFC PATCH 05/40] xen/arm: Fix lowmem_bitsize when arch_get_dma_bitsize return 0
Date: Wed, 11 Aug 2021 18:23:48 +0800
Message-ID: <20210811102423.28908-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85de283d-db0f-4017-0929-08d95cb2470b
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1631:|HE1PR0801MB1820:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB182079DB7171F55857CDD0219EF89@HE1PR0801MB1820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z4IAsI0b6ngauI/JeUMz1wBAaKVpFhny3snomKpsVDwx3yTq3TckQ5mDKh9YAY3Ed6oydvj0d97ezD4NpAshzEixq6bHMFkYNECsM3qqZAJBlNiWdCAjcI7AE8HBcX+5MJzWWFgcVMEzz5+qwmS43981bSitlNZ0WHX0f94UViNpufgkFWalnbJyRVAV9hdgsMfZOVYoAymBWqcv9KdUoeX3DOZDFIF0IZ484TKg7w3sSg7CBGmQWJLd6JO6miG2rmKuROkDXkx/XQXZ9PSzZq37G8mBJCVZtxidkfcbe7c0th5hsvIU6CcUQS5rnq4fZzo2gJbvFix8tPOMUN/ciBSgUNgfmOVZ6kuzJ+s0LM7y2mgQ+3oKQHWSXQYEeQ4NGCQ1QU01Ec7duUO/4aY38QJPvK+hENVh8NCoC7zkPMs4MVKgxehGtW3eSSabzO7Tj6FEwBtC9TrWvsz3PDlCmAtY4TuIvd7UPP6ZPsigipPJY2N+chUYvISo06Nuo6un9oIit4Pee1uoahPh8R5WR3R/nEJDqUktxZ7ZdP3R1W5MzYPKISg2Ygn/NhNUK14HJH6/C56r+yqjefCzmvcU+6/NHt3xlUXsBluZnp7RnwhaqyI+oYocOdTuZj5TdQrN1r1lmf/hly3PSgILGRcD8F8FNsnhc3O3fjcB+xexXsqhd/97DFv1LmJpVW868Yo5Ij0f28JGe64I6F2Yq81dZLa4nOg5vZ9rXDRTcJVJ1b/ZIf1adRCxxaM0vWAzmlp7Pht2+fA1ADFPfDEpsUe3WPUG0aFX58nRc7b1tAFqXeU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(110136005)(81166007)(36756003)(8676002)(336012)(316002)(5660300002)(426003)(36860700001)(26005)(82310400003)(2906002)(186003)(356005)(8936002)(7696005)(4326008)(508600001)(70206006)(1076003)(70586007)(44832011)(34070700002)(86362001)(47076005)(83380400001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1631
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5dda8c7-6844-454a-b05d-08d95cb23df4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9WEWsZ09KGe+kslieg86Jd5/TG255oLiZR1zpBktABw0LKwK2tmyuI/1b4Ms9OSf3Pta4m6UO31lJXCmGtoxTiu3ptCdEn7QOzoI90vMih/LyqWyZR8PbFqi2v4OlVWlGBdOOouyRArAr7JspoUVHksKInWNMZ0j4HH8UTO6p61RZ1hyNbh1S7x34YqzFKnpsTW8rhAUswUkvwvynz4q99n6TZLKc5yqp++gtmVqqNuZyTnInwKcV8C7+lW8w6WTYr+SCBIvicAqmNjgi6MkboWd2FML0mCY/EmlpdLpTX2wHHjiFf2RPLZ28N3CiCnqwIDfS1Tk6zmpV6QuIy+VrPBFoYl5nWWSSwzQqV9Vh8lxop6qjN4XFaIu84AIOK8QTwK9y3o6uZoJFTkg19zepXhm+jvw0nKSHwGsLY8lloClXfj4dR4FDlnoFCsunbDlejWk0jZRzHwZ8yQ1rSbcyV0QnZUwp1ujBq/zm+gfn8fJqeI8OB0i/s56qt0g8UIXRLyAZm+O+yZlaRFd3cU2cEaF7qGOStK4ipY+DvRIaL0cVplr71zabBkvhoUy2+N9yO9x3fOlgGXgfBEh1XK6q7uQ/p7JIpyTaRt3jKktHy5reIejRROPB5G5ypYOGWbTBFA0waa2u2chYL03H7tRy+RVDBG9mSXVL67C0YMvrc/WR+WX7l74r2dkTDrcjDKwyWi2orRQ8ItaXebsBOEEkYk9KdMvzkUkkznAuerkOY8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(36840700001)(46966006)(186003)(36756003)(26005)(7696005)(5660300002)(426003)(2906002)(478600001)(2616005)(336012)(82310400003)(44832011)(47076005)(1076003)(316002)(110136005)(70586007)(81166007)(82740400003)(4326008)(8936002)(83380400001)(8676002)(86362001)(70206006)(36860700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:01.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85de283d-db0f-4017-0929-08d95cb2470b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1820

From: Hongda Deng <Hongda.Deng@arm.com>

In previous patch, we make arch_get_dma_bitsize return 0 when
dma_bitsize and platform->dma_bitsize are not set. But this
will affect lowmem_bitsize in allocate_memory_11 for domain0.
Because this function depends lowmem_bitsize to allocate memory
below 4GB.

In current code, when arch_get_dma_bitsize return 0, lowmem_bitsize
will be set to 0. In this case, we will get "No bank has been
allocated below 0-bit." message while allocating domain0 memory.
And the lowmem will be set to false.

This behavior is inconsistent with what allocate_memory_11 done
before, and doesn't meet this functions requirements. So we
check arch_get_dma_bitsize's return value before set lowmem_bitsize.
Avoid setting lowmem_bitsize to 0 by mistake.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
---
 xen/arch/arm/domain_build.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c86d52781..cf341f349f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -265,9 +265,18 @@ static void __init allocate_memory_11(struct domain *d,
     int i;
 
     bool lowmem = true;
-    unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
+    unsigned int lowmem_bitsize = arch_get_dma_bitsize();
     unsigned int bits;
 
+    /*
+       When dma_bitsize and platform->dma_bitsize are not set,
+       arch_get_dma_bitsize will return 0. That means this system
+       doesn't need to reserve memory for DMA. But in order to
+       meet above requirements, we still need to try to allocate
+       memory below 4GB for Dom0.
+    */
+    lowmem_bitsize = lowmem_bitsize ? min(32U, lowmem_bitsize) : 32U;
+
     /*
      * TODO: Implement memory bank allocation when DOM0 is not direct
      * mapped
-- 
2.25.1


