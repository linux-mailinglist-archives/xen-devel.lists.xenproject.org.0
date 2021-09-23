Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E204155D5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193319.344396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9f-0006um-NL; Thu, 23 Sep 2021 03:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193319.344396; Thu, 23 Sep 2021 03:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9f-0006rv-Gs; Thu, 23 Sep 2021 03:12:11 +0000
Received: by outflank-mailman (input) for mailman id 193319;
 Thu, 23 Sep 2021 03:12:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9e-0004kC-BV
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:12:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7b3318f-daef-48a0-8d6d-121684e888aa;
 Thu, 23 Sep 2021 03:11:57 +0000 (UTC)
Received: from AS9PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:20b:465::17)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 03:11:47 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::d4) by AS9PR06CA0111.outlook.office365.com
 (2603:10a6:20b:465::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:47 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 03:11:45 +0000
Received: from fd11e5c1008d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A0D787A-399B-4616-AB80-4A7C3AA939A5.1; 
 Thu, 23 Sep 2021 03:11:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd11e5c1008d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:34 +0000
Received: from AS9PR06CA0295.eurprd06.prod.outlook.com (2603:10a6:20b:45a::12)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 23 Sep
 2021 03:11:33 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::42) by AS9PR06CA0295.outlook.office365.com
 (2603:10a6:20b:45a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:33 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 03:11:30 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:29 +0000
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
X-Inumbo-ID: d7b3318f-daef-48a0-8d6d-121684e888aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvsXP25FrtNtNR/vVLA1gpBc4hkPTM/WhSOqFIm620Q=;
 b=55QgxqE2cFizlZ8kNtpKAh568tZfqhHm2ey89kHnlpZvQUxIPEtL5sGBmTmzdTYu7pPdAD7UIXroCDLXBwz6H5GPisevhKsqK3Xx6LwtI/VNuavLNb5AG2nTqsaBE4SJ1PyOQIezMUnSxwVZPKroAlgeTp14z2RGkekgkEAyj8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 988e15c28dea971f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLzx9KM4JSp1NdRqDOXe8Q6BKLxzJlTJRqf0UQ0DmwlSFDcKT56CJJ5d1+6kogBd1FGsWzD8F343u4MaFk71+kcqd93S9gmX9SIyb8W3rMd8mt20sT2JOXqbRjAnoIk1IBj1nhdeciwuOvSzpNcCprTZgJQySbyaAbvemX9eCVx5ZiSvHJPpfqwl01upB7o7wSQXHqymfeEut8/wLodEtZfDPnQFUn1Ta21WFqGwe+4nje6ZOpjmi/yfpirRbRgQMN2DZ7RCSF0c8S+p6sp23A3WMHGn9XEV0pNzvNP/t65/X9z7AbETAwpeZXq3LCy88x/KTwwMssfpW7IdhmRyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IvsXP25FrtNtNR/vVLA1gpBc4hkPTM/WhSOqFIm620Q=;
 b=K5STUHFGi5ZICjkb9l7fa0giC5YJIwXMPV9i0sKzOgBnp0VTO2/byidot0W6jCUAi0v8BFglVVdNIyKX4vE1CNFCCJ+Rw2wo33MbAuAtzF02KOVFgM1aDqZoC5hkrpx9YqtXPcpyNleg18nNTYKeyMyP5bKe3zLLV9l8CuZTG3PXxjTlI1P1MZBsxR2iYxP5g4BkeGmiZWMoDGcTHgO04xL2n2Jbq9ZN2jaRsqVMNy/q0c5hvy/Pwq7ypaN/qx9aj6Ycr8zKvlaKVInJkm39q0BIhY5AXypvyz1ywIGzq2ERDhpVKe4NqiVf3QehmY3Axn9bHV4hIXkIMmNQ3pkgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvsXP25FrtNtNR/vVLA1gpBc4hkPTM/WhSOqFIm620Q=;
 b=55QgxqE2cFizlZ8kNtpKAh568tZfqhHm2ey89kHnlpZvQUxIPEtL5sGBmTmzdTYu7pPdAD7UIXroCDLXBwz6H5GPisevhKsqK3Xx6LwtI/VNuavLNb5AG2nTqsaBE4SJ1PyOQIezMUnSxwVZPKroAlgeTp14z2RGkekgkEAyj8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 04/11] xen/arm: introduce accessors for vgic dist, cpu, and rdist base addresses
Date: Thu, 23 Sep 2021 03:11:08 +0000
Message-ID: <20210923031115.1429719-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a3d896b-0906-4419-ddd4-08d97e3fe0fb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:|AM5PR0801MB1650:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1650E97531EF0A21E146E896F7A39@AM5PR0801MB1650.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:163;OLM:163;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3oj82O+hzAwwN+0MZhWDjXpDvx2bWfSrU2AMJiVz+xCzac2sRZY8/N8yVEficc1fb6/VJ55+IE1M6b/XNhFxQ6NjhYh7WAg8bDShvhBaISaeeDPaCTNboXj6tkNdpAQuh+KEVgbmYElWr07GqHpdBQghNh1ZBOY+8LFjgo2/UEnwmyu4265d4FiVySO9njjidb3ZNdFEy2SjtxXIE5/Fr5STDgcNQD27XtRjNJoVr9qs7ckYWbpIDuH+ubbUQbNhhSE4K75y9ZlySUyESWGnFazvXG4jaCl8TCdyqKOB1WS3tzWr/lzhbk9aW/T6S9xbTRDOtKtzi5ID7UMF4pdCnX/LTmLQV7JQgFIdri8Q7Q2TtNm3iL4Fxjh9+G8aDfvT2jzZJoAvRzNDEyJ38y3jNkH1Zj80VR1dM4w5hfhzMZbEeIaejvkTagx2654bN10WZncLt5DW79kT6hruB8k1lJJPJuXs3kcrP1OPoGMU6RrQT50ck4TG3rEqWfPb2SjGUdVmaH8vvkYaFJ4SpMWL3P9Xe95O7/adxbJzFEtvAkIenaXKpi/wX1/TdP4ypdMLPRClb6z9tr6hIfeAl/1Wyw+z/vU4I1U7UGIh3rY5J82laYXBhAtE3/MoZvhZPp83Q9SQ+t/EPUf4YJcfYli+xiaGVAhiJGgdQGccBg0D6B1Xk2uvLEEM8hjnEEIzeRn+yNneQOScmCmnOhuHKOmpDxCHxeUnZdOYLyGFJSIod3A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(44832011)(26005)(2906002)(5660300002)(2616005)(81166007)(4326008)(336012)(8676002)(70206006)(70586007)(36756003)(110136005)(54906003)(356005)(508600001)(7696005)(1076003)(186003)(8936002)(82310400003)(36860700001)(426003)(47076005)(6666004)(316002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e09a20f9-2044-4964-ab9d-08d97e3fd89e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WGI6Mv/R8w+zpoI9En/0iMdIRs0ImFzletsm3W3349YfDALldtd6QdjrccedLsXpxGm/N7nIHSWpm9vvv83bwUMGJ2psCp9zSzmrTS5d45G6yV8JQAzr2h+bU+s6/HlaCVdkfNOHVsbFqHbpXbKnAyLaiP9IeZmP2AhBJ23GdmLt3z5zZ4NO80rhlkFQ9D7ZpXn3Og8Q9j4dEIuwIWU6Iu3oO0rC7Nje7mbA8TmXzgSMvRfUmm7xdrKKezAULDfPSpG1nafg9EUdGDi3VXmnheZkl23hfJJ2x1C5XpEH3XPzSB8mlOQZbjAX1jOb0aEd4CN6kWuGxIXmHnxaquKjUANJLV3Y7zZ6R5IfLSpqxkvVg76OAoecYB9bzS3Qm1d/TO2bcOI1tyOwLWamiIG+BB2OB5U+SeVhP9QJJLLj+5PWfdAFGa7aFYuMBHwm9bsF6FGPMlXXrtPAosuTgfmki7KMHeQqZHDXgmPR2xz3C6oJAgc9bCwvqfoWRCXaxhT9TdAo6BKAODsalWVYOSlynYoyksr16zgZRiEX1rhbYLxC47EgN1dIe7Vd3+aRUwY7cV1mOrxnvyRTk7+RMV7W7ambwncwKqZjiKoFmbTSBy/w/3pdGM33msw/SmdudQhbxHw+FiGSG2fcU1/9rFu+rq00H/DPamJFNPzEpiamBOHTsPhzPTrCNWv3A97C1JMCcl/vj307E3xI5KJ/ErSsdg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(426003)(2616005)(2906002)(8936002)(6666004)(5660300002)(110136005)(47076005)(508600001)(81166007)(83380400001)(8676002)(4326008)(36860700001)(7696005)(316002)(44832011)(186003)(1076003)(86362001)(36756003)(26005)(82310400003)(70586007)(54906003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:47.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3d896b-0906-4419-ddd4-08d97e3fe0fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce accessors for vgic dist, cpu, and rdist base addresses, on
all gic types.

Use the accessors when making gic node for device tree of domU.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c    | 21 ++++++++++++-----
 xen/include/asm-arm/new_vgic.h | 24 ++++++++++++++++++++
 xen/include/asm-arm/vgic.h     | 41 ++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 213ad017dc..d5f201f73e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1802,8 +1802,12 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -1825,9 +1829,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
+                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
@@ -1852,8 +1856,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -1875,9 +1883,10 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+                       vgic_rdist_base(&d->arch.vgic, 0),
+                       vgic_rdist_size(&d->arch.vgic, 0));
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
index 97d622bff6..9097522b27 100644
--- a/xen/include/asm-arm/new_vgic.h
+++ b/xen/include/asm-arm/new_vgic.h
@@ -186,6 +186,30 @@ struct vgic_cpu {
     uint32_t num_id_bits;
 };
 
+static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
+{
+    return GUEST_GICC_BASE;
+}
+
+static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
+{
+    return GUEST_GICD_BASE;
+}
+
+static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
+{
+    return 0;
+}
+
+static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
+{
+    return INVALID_PADDR;
+}
+
+static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
+{
+    return 0;
+}
 #endif /* __ASM_ARM_NEW_VGIC_H */
 
 /*
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index 62c2ae538d..e1bc5113da 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -277,6 +277,47 @@ enum gic_sgi_mode;
  */
 #define REG_RANK_INDEX(b, n, s) ((((n) >> s) & ((b)-1)) % 32)
 
+static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
+{
+    return GUEST_GICC_BASE;
+}
+
+static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
+{
+    return GUEST_GICD_BASE;
+}
+
+#ifdef CONFIG_GICV3
+static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
+{
+    return GUEST_GICV3_RDIST_REGIONS;
+}
+
+static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
+{
+    return GUEST_GICV3_GICR0_BASE;
+}
+
+static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
+{
+    return GUEST_GICV3_GICR0_SIZE;
+}
+#else
+static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
+{
+    return 0;
+}
+
+static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
+{
+    return INVALID_PADDR;
+}
+
+static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
+{
+    return INVALID_PADDR;
+}
+#endif
 
 extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq);
 extern void vgic_remove_irq_from_queues(struct vcpu *v, struct pending_irq *p);
-- 
2.25.1


