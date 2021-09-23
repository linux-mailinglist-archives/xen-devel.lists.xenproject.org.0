Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7704155D2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193315.344374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9V-0005lI-Qx; Thu, 23 Sep 2021 03:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193315.344374; Thu, 23 Sep 2021 03:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9V-0005gE-LU; Thu, 23 Sep 2021 03:12:01 +0000
Received: by outflank-mailman (input) for mailman id 193315;
 Thu, 23 Sep 2021 03:12:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9U-0004kC-B3
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:12:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6959f0f-a5b0-421c-a025-dc6fb36d9bcd;
 Thu, 23 Sep 2021 03:11:54 +0000 (UTC)
Received: from AM6P194CA0029.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::42)
 by HE1PR0802MB2540.eurprd08.prod.outlook.com (2603:10a6:3:d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 03:11:52 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::c7) by AM6P194CA0029.outlook.office365.com
 (2603:10a6:209:90::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:51 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Thu, 23 Sep 2021 03:11:49 +0000
Received: from 02875dfcb4fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54E4DF64-BF4C-4AFF-B8B0-218451B1D66B.1; 
 Thu, 23 Sep 2021 03:11:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02875dfcb4fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:34 +0000
Received: from AM6PR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::19) by DB6PR0801MB1944.eurprd08.prod.outlook.com
 (2603:10a6:4:73::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 03:11:30 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::fe) by AM6PR01CA0042.outlook.office365.com
 (2603:10a6:20b:e0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:30 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:30 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:28 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:26 +0000
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
X-Inumbo-ID: e6959f0f-a5b0-421c-a025-dc6fb36d9bcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXV5Lffa19mU+2iwdP2TQ82Nx4ZrJiOJhVjvupxNFvU=;
 b=u3vK5WpREiAZkA12VE6wgC1OepCyGY4Eulp+pSMoc1/08chn2y1uadcFgtfMXrxKEWgRxUfQX39hohbxkfiA1Htg6F3ljf6XlF9j79iVRfy0NgM66u95OmuW/XH/JxOqEmMFZDZ4VXWkQd635kQ/k3w2EL7q9P8f5UnPoakEjwc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c826ebf4bbbf4bb0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJVKCqT/pGIrTwjTY1VJGO5SmMpxKe+V28PjeZD35AaZxe07UsS4CFGrcQZ6tmSlUo6fJIkkTxxW14DAFx0yKjT2FBhWv+yZxwog/lqQCF0yZ8PDP4940kqIOhHKhLxJG8LTx+0PtsRjnAEeLXF+hvFMA0m8cqFTJ5Sa8gDXBsqLfIn7RuXROEiCDuFN+/fCeusPwaY0n8FGIXmgL9woKQLdiykUtmlnPAKHr7vFami4U67mEf0pXD8+4kl31JKrqznvVLxltQ+jx1+txGZNooJgE1zjMw0uH4Jf8j8LBxbF258YSoy0KqJgoptqvh0FukKDERgtQqIZEKDWdvVFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cXV5Lffa19mU+2iwdP2TQ82Nx4ZrJiOJhVjvupxNFvU=;
 b=Kl4h/Joyu9Z40IJx4ZSl0IvqTEOYscNOh8JUjfezIlb6mlmFSrlUAjefcKnkBT2u4ZLjLGBl6kDsYYS6E8w/hiyZPAzE09u0aRnCn3gXLfTmBDZrIgsYkWxD63Atr56sab0YoL0+GOhsvxJ0jeLR4E6LkrmoLpCPNuTCzJmfK49mTVKLzHlezy8NEeEHfxkqh6F0A22jlIuFLj7hi92ENIpPV6VAmkoUgHEYmoN/OrK17lREKLjBhRGCX6Hw1VsYSNdsaeSjDEtMYPJm5FctRYV6D86yhFCiumf9UvQg5Jajg6Z0L1avO+3PDAI+T/2sHJ2BjZ7oblAt9lL/+3JyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXV5Lffa19mU+2iwdP2TQ82Nx4ZrJiOJhVjvupxNFvU=;
 b=u3vK5WpREiAZkA12VE6wgC1OepCyGY4Eulp+pSMoc1/08chn2y1uadcFgtfMXrxKEWgRxUfQX39hohbxkfiA1Htg6F3ljf6XlF9j79iVRfy0NgM66u95OmuW/XH/JxOqEmMFZDZ4VXWkQd635kQ/k3w2EL7q9P8f5UnPoakEjwc=
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
Subject: [PATCH 03/11] xen/arm: introduce 1:1 direct-map for domUs
Date: Thu, 23 Sep 2021 03:11:07 +0000
Message-ID: <20210923031115.1429719-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c77710-aad9-4476-f8b8-08d97e3fe3b9
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1944:|HE1PR0802MB2540:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB25408CC4CDCA8644CDC7703FF7A39@HE1PR0802MB2540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6AQ8kthB+tJZm9n6CUjNlHXgh+/MTN9V7hUEu4Us+XL60lMqpWrwpR/yXgDSxa+4PBzukkbP77oSJ8ORD7VrtKW1zLoEUd39BNpBc99PP8CeoUk25azucU+/UUREtPVYbfO+faVi+Otvs8DZeYo+qWh5LHG6uV3inwUUwqhPviiUJebkTPwleioVIg0QyRI49ml67SIWG3fHzfHyPhCpqzPmgYixZDFVfYDKzm5qcecG52lGMtC9LDH/ETI8fFd3/cB63uNHcyjgUvwBX+ZhhevFSoI3HwOEIL77yve93TwyjbEHi9JC3QuapxJYg6G/5ZpPvY/ZJUjHrL8s7+knQsmfssp/8NpiyQIsLjfUYn/Z9T7wq7oxV7bsOLkP/0ROiA0MS+naYm9pYHyEeUog4TObSbnLk9iFbH5PYAguQ91ChlJt2cMd8cy1n0ppp6R7BvlKHWYKnUA2RK2YWPnMBVeT0rgkk6WKaYw2MGBA8e1BH4gz210GVlOjHAyOlBGgjaH4DICT/JXDUYYniFIolqW/80Ew86QWNr8egN72FMS/SyayAZ6povPcHWne0AVg5Qvs3nq0Yb9AVfvzqvzOY2xKWPkjmOPR9xAa1UsnAzMT32i6b9VEenS3twuhS1AGpkfNWW0wSgaCQaEch6aN7ZzGUUZmkMTS+e8HmA4wTJs/7LFomrqgGZ+r1Ngio290mb2gfMO9C3shYAhoPeV3yvkCjlNQ16ReeBWQDXzcbeg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(2906002)(8936002)(5660300002)(508600001)(316002)(82310400003)(44832011)(186003)(8676002)(6666004)(1076003)(7696005)(54906003)(47076005)(83380400001)(86362001)(81166007)(70586007)(70206006)(36756003)(26005)(426003)(2616005)(4326008)(356005)(336012)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1944
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6bef1812-7ebd-4191-99dd-08d97e3fd710
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qon82hJ+m+y/Qe7jLVr3phHxpqfnDfPTE2IB8xRnY91ep3vsp1HzXPw/Tp//zWT9115JPbPjn0NQmVA1IqzHhC9XPuEwB+u1kpZme1EUUxG3byC7amXccvYBknL9+1HhSYuzEkcqYiOJoMT1GOLdx/bmFbU+9LohpNcW74Hw9Zoq8LJuMF0Ha96pfAyMIe7hAYRc8+m03iNApO0A/kBkjktY6F4iw3PPpTTuq55Cl2LK0KamHA0djFyULJsTacetZzt6UuUFi8UtPObKrF0RUMWxT1yBe1IH08dRKIEpoLWk05LUeK/rR4rvuaLKy8++QMo1g8SghhxMC/MXtYduY2t7PJoi9EIFpBQ9Z0j2KxQfPgEKTepbjB/DFrxot3RCCkaG2ySFe1J0iW/rxp31nUxRKmEUTGQJVUd6dYG59EV6ApePm3glyGYPYknPTqvoWu9LsHhEXWGT4R7GPsmZ1gNiS3LbL65fEVInJacs9jrCmetjgEJYWuMmyTGTfLXtAbeYqH9QNcEjKYhpbAm7Q0f3WMiU4WOlZWEtQ+HqeSbuOOIwD9IBVPZcimyLc9rpHapicgoeVqYdgqxXOtwVy3ZCHqt6uwNYzIn5fbaI22kPxlR+/xgguEbOFthMZaMmVEBfJ2Hfqrkp+MBhH/A5LAtCUAJ/vB8ran58CcyONolBE0Jz1tTXo+ZGULunMdU/JJ8TAVEaxTt9PlQMmZ5Kgw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(508600001)(110136005)(36756003)(82310400003)(186003)(83380400001)(26005)(2616005)(1076003)(6666004)(47076005)(316002)(54906003)(426003)(70206006)(86362001)(70586007)(4326008)(8676002)(2906002)(336012)(44832011)(7696005)(81166007)(36860700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:51.7431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c77710-aad9-4476-f8b8-08d97e3fe3b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2540

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Cases where domU needs 1:1 direct-map memory map:
  * IOMMU not present in the system.
  * IOMMU disabled if it doesn't cover a specific device and all the guests
are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
a few without, then guest DMA security still could not be totally guaranteed.
So users may want to disable the IOMMU, to at least gain some performance
improvement from IOMMU disabled.
  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
To be specific, in a few extreme situation, when multiple devices do DMA
concurrently, these requests may exceed IOMMU's transmission capacity.
  * IOMMU disabled when it adds too much latency on DMA. For example,
TLB may be missing in some IOMMU hardware, which may bring latency in DMA
progress, so users may want to disable it in some realtime scenario.

*WARNING:
Users should be aware that it is not always secure to assign a device without
IOMMU protection.
When the device is not protected by the IOMMU, the administrator should make
sure that:
 1. The device is assigned to a trusted guest.
 2. Users have additional security mechanism on the platform.

Given that with direct-map, the IOMMU could be used but it is not required.
This commit avoids setting XEN_DOMCTL_CDF_iommu when the IOMMU is disabled and
direct_map is requested.

Since, for now, 1:1 direct-map is only supported when domain on Static
Allocation, that is, "xen.static-mem" is defined in the domain configuration.

This commit also re-implements allocate_static_memory to allocate static memory
as guest RAM for 1:1 direct-map domain.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt |   9 ++
 xen/arch/arm/domain_build.c           | 117 +++++++++++++++++---------
 2 files changed, 85 insertions(+), 41 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 44cd9e1a9a..3d637c747e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -164,6 +164,15 @@ with the following properties:
     Both #address-cells and #size-cells need to be specified because
     both sub-nodes (described shortly) have reg properties.
 
+- direct-map
+
+    Optional for Domain on Static Allocation.
+    An empty property to request the memory of the domain to be 1:1
+    direct-map(guest physical address == physical address).
+    WARNING: Users must be aware of this risk, that guests having access
+    to hardware with DMA capacity must be trusted, or it could use the
+    DMA engine to access any other memory area.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 21d8a559af..213ad017dc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -488,8 +488,14 @@ static bool __init append_static_memory_to_bank(struct domain *d,
 {
     int res;
     unsigned int nr_pages = PFN_DOWN(size);
-    /* Infer next GFN. */
-    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+    gfn_t sgfn;
+
+    if ( !is_domain_direct_mapped(d) )
+        /* Infer next GFN when GFN != MFN. */
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
+
 
     res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
     if ( res )
@@ -537,14 +543,17 @@ static void __init allocate_static_memory(struct domain *d,
     }
     reg_cells = addr_cells + size_cells;
 
-    /*
-     * The static memory will be mapped in the guest at the usual guest memory
-     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
-     * xen/include/public/arch-arm.h.
-     */
-    gbank = 0;
-    gsize = ramsize[gbank];
-    kinfo->mem.bank[gbank].start = rambase[gbank];
+    if ( !is_domain_direct_mapped(d) )
+    {
+        /*
+         * The static memory will be mapped in the guest at the usual guest
+         * memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+         * xen/include/public/arch-arm.h.
+         */
+        gbank = 0;
+        gsize = ramsize[gbank];
+        kinfo->mem.bank[gbank].start = rambase[gbank];
+    }
 
     cell = (const __be32 *)prop->value;
     nr_banks = (prop->length) / (reg_cells * sizeof (u32));
@@ -572,42 +581,58 @@ static void __init allocate_static_memory(struct domain *d,
         printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
                d, bank, pbase, pbase + psize);
 
-        while ( 1 )
+        if ( !is_domain_direct_mapped(d) )
         {
-            /* Map as much as possible the static range to the guest bank */
-            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
-                                               min(psize, gsize)) )
-                goto fail;
-
-            /*
-             * The current physical bank is fully mapped.
-             * Handle the next physical bank.
-             */
-            if ( gsize >= psize )
+            while ( 1 )
             {
-                gsize = gsize - psize;
-                break;
+                /* Map as much as possible the static range to the guest bank */
+                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
+                                                   smfn, min(psize, gsize)) )
+                    goto fail;
+
+                /*
+                 * The current physical bank is fully mapped.
+                 * Handle the next physical bank.
+                 */
+                if ( gsize >= psize )
+                {
+                    gsize = gsize - psize;
+                    break;
+                }
+                /*
+                 * When current guest bank is not enough to map, exhaust
+                 * the current one and seek to the next.
+                 * Before seeking to the next, check if we still have available
+                 * guest bank.
+                 */
+                else if ( (gbank + 1) >= GUEST_RAM_BANKS )
+                {
+                    printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
+                    goto fail;
+                }
+                else
+                {
+                    psize = psize - gsize;
+                    smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                    /* Update to the next guest bank. */
+                    gbank++;
+                    gsize = ramsize[gbank];
+                    kinfo->mem.bank[gbank].start = rambase[gbank];
+                }
             }
+        }
+        else /* 1:1 direct-map. */
+        {
             /*
-             * When current guest bank is not enough to map, exhaust
-             * the current one and seek to the next.
-             * Before seeking to the next, check if we still have available
-             * guest bank.
+             * One guest memory bank is matched with one physical
+             * memory bank.
              */
-            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
-            {
-                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
+            gbank = bank;
+            kinfo->mem.bank[gbank].start = pbase;
+
+            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
+                                               smfn, psize) )
                 goto fail;
-            }
-            else
-            {
-                psize = psize - gsize;
-                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
-                /* Update to the next guest bank. */
-                gbank++;
-                gsize = ramsize[gbank];
-                kinfo->mem.bank[gbank].start = rambase[gbank];
-            }
         }
 
         tot_size += psize;
@@ -2638,6 +2663,7 @@ void __init create_domUs(void)
 {
     struct dt_device_node *node;
     const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+    bool direct_map = false;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -2658,8 +2684,17 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
+        direct_map = dt_property_read_bool(node, "direct-map");
+        d_cfg.flags |= direct_map ? XEN_DOMCTL_INTERNAL_directmap : 0;
         if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        {
+            if ( iommu_enabled )
+                d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+            else if ( !direct_map )
+                panic("Assign a device but IOMMU and direct-map are all disabled\n");
+            else
+                warning_add("Please be sure of having trusted guests, when doing device assignment without IOMMU protection\n");
+        }
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
-- 
2.25.1


