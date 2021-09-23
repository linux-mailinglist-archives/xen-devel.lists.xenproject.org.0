Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A584155D0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193310.344330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9L-0004Ud-6T; Thu, 23 Sep 2021 03:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193310.344330; Thu, 23 Sep 2021 03:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9L-0004RJ-2q; Thu, 23 Sep 2021 03:11:51 +0000
Received: by outflank-mailman (input) for mailman id 193310;
 Thu, 23 Sep 2021 03:11:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9J-0004Qj-IH
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:11:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcac06c7-1c1b-11ec-ba0a-12813bfff9fa;
 Thu, 23 Sep 2021 03:11:48 +0000 (UTC)
Received: from AM6PR0502CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::22) by AM6PR08MB3301.eurprd08.prod.outlook.com
 (2603:10a6:209:47::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:45 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::61) by AM6PR0502CA0045.outlook.office365.com
 (2603:10a6:20b:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:45 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:45 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 03:11:44 +0000
Received: from 7c3ccbc109e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3601AE50-2D27-433A-9DD1-36EFAED7F40C.1; 
 Thu, 23 Sep 2021 03:11:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c3ccbc109e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:37 +0000
Received: from AM5PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::21) by HE1PR0802MB2300.eurprd08.prod.outlook.com
 (2603:10a6:3:c5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 03:11:35 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::20) by AM5PR1001CA0044.outlook.office365.com
 (2603:10a6:206:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:33 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:31 +0000
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
X-Inumbo-ID: fcac06c7-1c1b-11ec-ba0a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mymiVU6RzNe2URN+GFVNzglxdb0Bxcz77lG7C4aSLI=;
 b=dxA0TeTBVgUDOEWhgjUD7WpUCdGHpIG0fdiIBqQueFcErs6GiHr6N34IvznhF2mocSJFrS1Imsm3INSOTicGcbEvSm/PMmdzdyvpdxasMWptvh0t0jqFpqaYQjigg5Lfqu2qBQ79rx6kK2lWwiivilLybPDHlrJjlF6NiaIu8xw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78d99569b4e49507
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp7JW3SPkZTY5hxQi8HAeL0s7uw8wnulE0FaPPL8AjcvN0DrZoKlufiGxpu9UKXI09K3q9J+y70unC9EFlYkqlWDQXHcLlYcFakMHcCFY/hANqI2+/29MbNiq8Om+F/ytolv9hTyWlKxRADUDP14ef01+JvR1b6+5C94zcvBjQTq0uV4q8k+Ixlblvmwy64kJIPyUB9sGtArg1HHK2cPbA4eSOz+yVOIcGuWI3udj5nei6slZH2P6ZRquHT7P7j8d/tJf+hzOzxlPau02UIuxUif695u90IX2k4ZSUYVusW84+5Q5m2xTiXYPQi3QvHYxx/g2r3FDBMSqe8CPID5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8mymiVU6RzNe2URN+GFVNzglxdb0Bxcz77lG7C4aSLI=;
 b=TCiv/3ClcRi+R9WXzCpnoN3MYeWqX5KUQeED5q7b9AwXS/WIG4mElCxKsQb4RWW8Iw03BbL+ATCIiaeYcxiiPt6FFCDvzgsSz0cdB5oDuUkuN307Gh8ZxD0KlBS52Ax4T2byVXjOiGUdA37BUzV3ydPBaeGQXe+UgdMrtBsKklZN8dEpKhQ9oqsZzLaY+oRE7Y7lr46AjavlSdRkw3GuHBmqdUdjDtNzFevfWgw0UvCGbsI1DWWgHKBBGhtUAU9Oe07fxs+m7ot18IFmrKYw7BEyY2KcQd3jaiETPoAkqPz/oKqr2YRVwufmNq448qqc2Opwi81t3LdvNLlSUS5Xgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mymiVU6RzNe2URN+GFVNzglxdb0Bxcz77lG7C4aSLI=;
 b=dxA0TeTBVgUDOEWhgjUD7WpUCdGHpIG0fdiIBqQueFcErs6GiHr6N34IvznhF2mocSJFrS1Imsm3INSOTicGcbEvSm/PMmdzdyvpdxasMWptvh0t0jqFpqaYQjigg5Lfqu2qBQ79rx6kK2lWwiivilLybPDHlrJjlF6NiaIu8xw=
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
Subject: [PATCH 05/11] xen/arm: vgic: introduce vgic.cbase
Date: Thu, 23 Sep 2021 03:11:09 +0000
Message-ID: <20210923031115.1429719-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44e16a65-030b-4bfe-3ac7-08d97e3fdfe5
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2300:|AM6PR08MB3301:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3301B46AA588A0A6228DA53FF7A39@AM6PR08MB3301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0DVkdkx1a7AggDmFp3WKDFBdv2YkJ7Juar9krB/+s6hCz3JySXZv6AtIHDPw9pwFWwdDthDdantcFNtUoQIjbaVZr6hSuHRpC6CMu2tZvZ9ie4y7VBjwKEDvDrYYydLH9r4z4Y3GBmziLPySaP+Yh2kbjzfWRzXuTts6n+T2qq1y0749Sv0uU/BGvSSZHFBwGPSId0fEefZTJLRTRQK/JYkxTQ1HsEt0oitVN0CCt8Lv4SsTrOsKJPhKoTbePRULUtm4OXBLvRDUjonYNJHzk/hh737zNLfoLbmKw4MBs/EFY/qo9R4eDBdH3x35p3XvnrgTSU+h1O+L1D4XWOvAeuZV0hZVHiBCLiE349N4d48UR3KeW0/VQNZZL3qJ+kbWsJ7qjhDMkzlxTFAvH/TgzxfGCsT0HEQA9iAlBUa5l1rXVnLoH7nh/RJ74Sc5J7/EsEBWm7jDPmBBDi8h3v7jOfLLtM5soY7NYsfgiPiZOKcc0oTG9LBYq9sC8tBFjhbibqLGDjRVeERldBJd4S8hlS6Ib94ra5KInZfVV29vfun3EJYvfvOfShRw1T/Rq6MDYve2dFTL9RkUWEw6acUjk/zr6a9DWANwuc9AO1EzaOXI+fd4XeLlSgZWKMmMBZxNq38ViMjm3cEInq1Ac1J4+Ylw2XDECJ5QpNzUz1g4aLMkcVjPO9EsVOCnT57QFofoW82+uB5sh/kNS22MhN/EqadvkfRJIaQta8U0gH40Tbo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(2616005)(47076005)(36860700001)(81166007)(26005)(7696005)(36756003)(356005)(508600001)(8936002)(186003)(83380400001)(110136005)(70206006)(8676002)(44832011)(426003)(54906003)(336012)(4326008)(1076003)(6666004)(2906002)(82310400003)(70586007)(316002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2300
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	413c93a0-b8ba-4117-b2d3-08d97e3fd9db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ssivSYRW/dvVt5d8EiHGb5YaRrbbDmchSLxVgoD9BheiAJ0aAr35JUaf+GXEqMPOtjzg2IBeEMGPfzgOCygdBtrng++wlmHL09FmalHks7MHKOcFevm16CbjhksQijn/S2H0Y1KR7SRaATKbjFma3nzORHIAlgOIxck+o56+c3R8QhcIrI+biQNPN8yMh8K4od16kkPrvtSkAIsLKnp08eA+eGZ4jOKjG997UjpzlAZO9MoBQWc5kELtONuLGQIea+TCvSlGlXBky1H6Wq6kq2tj5Z5zr8oUwBObgKhBN8mzBI6M3VcChLxY0mNJ7WhMI0Qyngyrcwl2RuY20HTzTDHBw2c2zSHGpzYpHfFc69REuEEd6vOmM1Omkf6gk4iHZr3/xAqmkx9CrrYXQvxct6eeB3Nv0VLdf3NlkMXFXa/dO2aNkytmzuZZ6VVAtSDwbQAslJXf6qT/PyYuBBXXSyd8RKeRZydyJ97S09bk8RaqOWaWZ0jj3HAV5cgzkPaD/D8Yz+EpcLSJx6UQUtcbVfhqSuTyEb6MAynUDQ/CTHWkkqk9asPMIC4d5+s5TrnPvl4idCUOLbMvvJ+OGlIDAcmwTFTU8CHCOoA9ZtmUrgCb1//IAJQEIoRtsAQI0PexWdsXfMSuXP0Kag55x/3JJGzCPCynU4ucRrndEOwbuomNYdtj0ixJDJyByBNJB6Xqo2cd8ONH0QsThETQ//Qp4A==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(54906003)(8676002)(70206006)(83380400001)(316002)(426003)(26005)(82310400003)(336012)(110136005)(7696005)(70586007)(44832011)(2616005)(5660300002)(186003)(36756003)(81166007)(47076005)(86362001)(1076003)(36860700001)(2906002)(8936002)(6666004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:45.3373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e16a65-030b-4bfe-3ac7-08d97e3fdfe5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3301

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Add a field in struct vgic_dist to store the cpu interface base address,
similar to the existing dbase field.

Use the field in vgic_v2_domain_init, instead of original local variable.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/vgic-v2.c     | 10 +++++-----
 xen/include/asm-arm/vgic.h |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b2da886adc..b34ec88106 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -652,7 +652,7 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 static int vgic_v2_domain_init(struct domain *d)
 {
     int ret;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
 
     /*
@@ -669,7 +669,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = vgic_v2_hw.cbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
@@ -683,7 +683,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
@@ -692,8 +692,8 @@ static int vgic_v2_domain_init(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
         return ret;
 
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index e1bc5113da..d5ad1f387b 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -152,6 +152,7 @@ struct vgic_dist {
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
+    paddr_t cbase; /* CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
-- 
2.25.1


