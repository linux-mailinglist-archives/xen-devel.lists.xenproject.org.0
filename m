Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC04155CF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193313.344352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9S-00057S-TM; Thu, 23 Sep 2021 03:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193313.344352; Thu, 23 Sep 2021 03:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9S-00054G-Nu; Thu, 23 Sep 2021 03:11:58 +0000
Received: by outflank-mailman (input) for mailman id 193313;
 Thu, 23 Sep 2021 03:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9Q-0004kC-Mt
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:11:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 778e0bce-ad3f-4456-8a34-228c3e56888f;
 Thu, 23 Sep 2021 03:11:54 +0000 (UTC)
Received: from DB6PR07CA0101.eurprd07.prod.outlook.com (2603:10a6:6:2c::15) by
 PA4PR08MB5887.eurprd08.prod.outlook.com (2603:10a6:102:f2::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Thu, 23 Sep 2021 03:11:53 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::30) by DB6PR07CA0101.outlook.office365.com
 (2603:10a6:6:2c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:53 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 03:11:52 +0000
Received: from 91027c4583da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A2E9B97-84CC-48F1-B068-6DF3A2608A30.1; 
 Thu, 23 Sep 2021 03:11:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91027c4583da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:45 +0000
Received: from AS9PR06CA0264.eurprd06.prod.outlook.com (2603:10a6:20b:45f::9)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:43 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::cd) by AS9PR06CA0264.outlook.office365.com
 (2603:10a6:20b:45f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:43 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:38 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:36 +0000
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
X-Inumbo-ID: 778e0bce-ad3f-4456-8a34-228c3e56888f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e41YLk3dIbgdmwmpIt94ilkD1EszsH0czIzcF48m2hU=;
 b=DpeA9lX6eC9cJYKShAaXaM0mb2wSy4r7+a/sgcrVzireNfDh9QhtjsyEMQr98V1+/tsw2J6MSJA6M9feJfJtofmubAdRkusSnO1QgTWFF5rqmb3mrHh9/B1T6AfvHNGEgBBkS6rp+lAEFclfPn9rJOyTTM2wzAMsL/NC2g2KQaE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e3f64499d581046
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOgeWG4uMUCwoCIp0NFyr9RuM1AhSE6MHUBa89vTqSxCSDJJWPulZqY9vCZaMkMiH7wGCD40UWDWQ28FlqVU8fCoaaJL+DR9TFDTemRo4MGMCHXsHrROUdyJFLnBxjvarRur9/+QEmBMarM2i0RHdG7ZehXvrQxJy4JamRNyuED4Nsf4EfF+zbkUr7hfulHYJCIWs7/9S9/A+A3zE9U19QeE4jh/0S7+j3N2cvKYo2W/D/uurZ/Opg/IS104+zPqcqybEfWUSoUi/TYwHBZ4thrxLlxvdGmUQd8QhhHtiSgRivX6OTYJo4l2OTSzNPvsefoxsp4JNIXrSBCcEnlfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e41YLk3dIbgdmwmpIt94ilkD1EszsH0czIzcF48m2hU=;
 b=jYzuEPIVgk3hWoT0P6/rYgZfZlkV+qQJ1W7E/Kw5WhvuSgk15Y1PqJDXKEALKXjARQ6OSKLSzDU8n2RX0I/e9lKDnLlbU20+QEWG4Ipzp6rmWRIDP1ILpgMqQS7zipCykZ/bPHyjOi4sMVk+aZbmftI6YlHwueryphYqLBvCUPuUPzgjac13Q2Ehm6g7UFRykS27O5H6/5UL/AJPPZvl5n+X7FN9YN2PfXA6sA3FXGO0EtodaMllcg+rbJFCJUKNT7o2BmJb591sOBEDaN75PUZHIHlBGCX1LxSuYGng8r549y5bM8jvMwsh7GQRCFWlw35ciBNWnRzBjpsr8qJblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e41YLk3dIbgdmwmpIt94ilkD1EszsH0czIzcF48m2hU=;
 b=DpeA9lX6eC9cJYKShAaXaM0mb2wSy4r7+a/sgcrVzireNfDh9QhtjsyEMQr98V1+/tsw2J6MSJA6M9feJfJtofmubAdRkusSnO1QgTWFF5rqmb3mrHh9/B1T6AfvHNGEgBBkS6rp+lAEFclfPn9rJOyTTM2wzAMsL/NC2g2KQaE=
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
Subject: [PATCH 07/11] xen/arm: if 1:1 direct-map domain use native addresses for GICv2
Date: Thu, 23 Sep 2021 03:11:11 +0000
Message-ID: <20210923031115.1429719-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6142d902-90fa-4d54-2c0e-08d97e3fe47a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3137:|PA4PR08MB5887:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB5887B37A8575CE966E26F472F7A39@PA4PR08MB5887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FLiKy1Ir1H1QB01hK7TC2sRyFE97xkd/sUGW2vJEg9VBp+lbrcJs9sV7PvWJTcNIU08VsDlCVD6AsXQ/UdiwiWrBH424rHh2xwokZk333SW0wUubIWSpCg8MIbuqL4UimhGBjR+CxeAi6IzZyrsMEq389TRKo53ETecWGgnBWxY9+ZOUr1EUIo9mOQ+rKM+zwUOpsK54FPW2ndtY2cmc9guostmSV+Qx6cQRQ5/DJcRi1FBk01mxfe2FjOuKyuKDrVPKXf1Q+7drg+ZgZlXbcMFeeRGajd9TYv/iw4QueIGEQthYUynawkV+ZoXk2YCNl7Au1GuDgSkkTx6NYG+x6Umfp+Wfn/HuTqqth2sCimWtEiD4XH5NMLarTQDVJA4YB2Pf237JPrVCsJccl3iw0sbke2TBD1h7wGpJ6vOhXjDMRE0V+HfDOhjPXsjRmodmOLU9+ZaFcd68ePGmoer052B3hBlnlVfNPqaEfqfyv7uZ0CxHsEZNQ+V8K0NdVBbE1ivwC6hGn/9EXnSPtFseV0Pl9lJozAs0n/csyhLsIgCqIZLpKlnqSUoCfwIsKQf7oY4CHOJyQ2MqRG6vQ5HFuonn2VwMxDFVK2fv8o0kTCwUtB2W9pZCW+aZY8F4jbITLr3w1jIQAA212vTaxnedX1BEVCxE8WNn2/K3S0jek35MMJ8QL8RKUlgiZlfhHeM889HIssstCuGg2bLgOwvWmSDY5gXkgAH5AtNc+xguVgM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(2906002)(2616005)(1076003)(36756003)(82310400003)(4326008)(316002)(54906003)(5660300002)(8936002)(426003)(356005)(508600001)(26005)(6666004)(7696005)(86362001)(36860700001)(70586007)(186003)(8676002)(81166007)(70206006)(44832011)(83380400001)(336012)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3137
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c52c898-0a8f-42ee-5ee4-08d97e3fdece
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jb2aR2oLJpNDTd2Tej4BUq0E7WiabSnCIXC1K01W1KfpFLOH2Zls0ngOIBzaGodYcA5mdeKxhB6I1J9SWDwbo34gTml/YYpGaurmJb75sMlizWlBTvC4il1eqF7A1QhcuLczXZ4DNGSsyxG6Ig8otGhaWGcV0gEODf+k2+tK1jbaBuYAstTzO037+dGzdlIvIwwaivMw6bsabErx2TEcg2pwIVjODnO9dyVxKK5T9dg5FTgR0pEsXJUVnNgZwegV2xLXgwEti4thF/dDW2i1zXPtRL3zb0lJjk0LqJnQNuuBG4PyMvTxXSMP++jaTFKdKork1Um294C1KWNAcwb9yS8SIm2DMMD9AmV+bw8SvmgDwrIP1R5zxxBhdS+rIecPEnDfs6SXJnzXgru6voGBg56Gm2K5xL9NYR4SIs2BFxQR6yb/BVmV4X1aCOfl4cqQcvK0RVApJcll4XOn04jujUmonrGuVkl2a9ozd61jyJyRhxEkc48uLLJ/j7iloKCMAOu9QJFG04GjHYGCgTwnHsUU5dwDALsi9trUyuJawBEShRH+fyKs6sgkvLezcaP1Mh+FFi1C4wsCiNOUTZesOLujruMcrrqEnyA7iRlntCoaL6MmheDYR+SBNcNIXIgbX6NRyzXkKn8L8mi+x2j+mjBAuD837H3CCUExYuORzvCfAKcK8bipYYCQItuNVX75QKdJcZ3ZwZBynvQK1WxA4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(26005)(7696005)(70586007)(4326008)(81166007)(36756003)(8936002)(5660300002)(426003)(336012)(44832011)(70206006)(82310400003)(8676002)(2906002)(110136005)(2616005)(316002)(508600001)(54906003)(1076003)(6666004)(86362001)(47076005)(83380400001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:53.0817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6142d902-90fa-4d54-2c0e-08d97e3fe47a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5887

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are 1:1 direct-map(including Dom0).

Update the accessors to use the struct vgic variables to provide the
updated addresses.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/vgic-v2.c         | 16 ++++++++++++++++
 xen/arch/arm/vgic/vgic-v2.c    | 17 +++++++++++++++++
 xen/include/asm-arm/new_vgic.h |  4 ++--
 xen/include/asm-arm/vgic.h     |  4 ++--
 4 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b34ec88106..a8cf8173d0 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -673,6 +673,22 @@ static int vgic_v2_domain_init(struct domain *d)
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        /*
+         * For non-dom0 direct_mapped guests we only map a 8kB CPU
+         * interface but we make sure it is at a location occupied by
+         * the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.dbase = vgic_v2_hw.dbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase + vgic_v2_hw.aliased_offset;
+        csize = GUEST_GICC_SIZE;
+        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+    }
     else
     {
         d->arch.vgic.dbase = GUEST_GICD_BASE;
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index fd452fcb5a..ce1f6e4373 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -280,6 +280,23 @@ int vgic_v2_map_resources(struct domain *d)
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        /*
+         * For non-dom0 direct_mapped guests we only map a 8kB CPU
+         * interface but we make sure it is at a location occupied by
+         * the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase +
+                                     gic_v2_hw_data.aliased_offset;
+        csize = GUEST_GICC_SIZE;
+        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+    }
     else
     {
         d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
index 9097522b27..0d16f878eb 100644
--- a/xen/include/asm-arm/new_vgic.h
+++ b/xen/include/asm-arm/new_vgic.h
@@ -188,12 +188,12 @@ struct vgic_cpu {
 
 static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
 {
-    return GUEST_GICC_BASE;
+    return vgic->vgic_cpu_base;
 }
 
 static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
 {
-    return GUEST_GICD_BASE;
+    return vgic->vgic_dist_base;
 }
 
 static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index d5ad1f387b..92f6a2d15d 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -280,12 +280,12 @@ enum gic_sgi_mode;
 
 static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
 {
-    return GUEST_GICC_BASE;
+    return vgic->cbase;
 }
 
 static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
 {
-    return GUEST_GICD_BASE;
+    return vgic->dbase;
 }
 
 #ifdef CONFIG_GICV3
-- 
2.25.1


