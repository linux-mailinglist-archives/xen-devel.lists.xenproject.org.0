Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51A4155DE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193343.344429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTFEN-00028k-69; Thu, 23 Sep 2021 03:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193343.344429; Thu, 23 Sep 2021 03:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTFEN-00025l-1t; Thu, 23 Sep 2021 03:17:03 +0000
Received: by outflank-mailman (input) for mailman id 193343;
 Thu, 23 Sep 2021 03:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTFAX-0004kC-Dn
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:13:05 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb3b812b-6dd4-4371-b27f-310d578d9eb4;
 Thu, 23 Sep 2021 03:12:10 +0000 (UTC)
Received: from DB6PR0601CA0019.eurprd06.prod.outlook.com (2603:10a6:4:7b::29)
 by DB9PR08MB6428.eurprd08.prod.outlook.com (2603:10a6:10:263::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 03:12:07 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::10) by DB6PR0601CA0019.outlook.office365.com
 (2603:10a6:4:7b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 03:12:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:12:07 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Thu, 23 Sep 2021 03:12:06 +0000
Received: from f22e634b0734.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD0D7A2A-0C9C-4596-B7FE-4BD63411E029.1; 
 Thu, 23 Sep 2021 03:11:55 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f22e634b0734.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:55 +0000
Received: from AS9PR06CA0254.eurprd06.prod.outlook.com (2603:10a6:20b:45f::29)
 by DB7PR08MB3259.eurprd08.prod.outlook.com (2603:10a6:5:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 03:11:47 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::6f) by AS9PR06CA0254.outlook.office365.com
 (2603:10a6:20b:45f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:47 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:45 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:44 +0000
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
X-Inumbo-ID: fb3b812b-6dd4-4371-b27f-310d578d9eb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SA4d2GeBF/c/7lvVqfUDdcRMEVLTNcBLtAK0ks8Cfg=;
 b=Ur4Mcgrca3EVT13PDYApcCW+O3mXljiraAtQZOSqoZWUnCSSoZhb0OSuPKkpBzjt7FplnRASaZ84gtsr5P2a6UGQoVSYxDrV5/11dLvkdS+rafDKzYzbgoykxfIyKgueJCWzZj7bSOVQqk+y8W6TgRxJv9jpRK5f+QJ9GorDqt0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf5a9cc62c8cf42a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Utw3mh2tL9u54gxSJBfNFCpBgsU32aT5P4B4Jk7bJsV426RPe1lcZi6dP/BtGat2QDEczgHJNq41eBxAmJDcSEVYZ0N0uuBIC50qEcxcnZHlj76P/FDjer+Umky9nld0J9PMxWLRl/mj4uwtAD6wmkq3ntzMItbDIuPMBMNgapyIBu0Z7LIzA6jfOge87o5vp2yXuXL7lA/6HFt6vGypk8z4TIS74HZwQDds98DI9PiTctA9sWR7whoLa15jz0yhlsBX+AgdmjOG6SUvoCQ7M5k3PsNJI7DHFl3/7AP7+noPPddieH3YDw8hE008gxKdwcLfrLtlImEUL7hohWfkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5SA4d2GeBF/c/7lvVqfUDdcRMEVLTNcBLtAK0ks8Cfg=;
 b=cg0STODoC+kwN6BBhu+tY1r8ABimttGv0/VdcXdREYEbl9W3JwdBQGaacTncHMwXpE3DyncCt2vi63IAdM8hMqPcTNQaIoPLl/rrN4ryplZQr+8FzHxZGf/dv2mJqxKkEwHoGQIwWH1cKJ/e6XvB6t0fu3+WnAilIyJW0KbBoreof/JODSwhiWCE+W3nqcA24yMysssbTnQSQkQGxHD6rixBDVCXs67TgfeF6hL2ulQEnaUhAPWreNCHWJa/OysbNcCh9tDjgrHLjSDvM/SYgWoELYwBwhh2EgcCBuE2R2wwp0pjgmC2Kp4cD+R+AbaBcPBwl5YWGsRz+TOLYB9/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SA4d2GeBF/c/7lvVqfUDdcRMEVLTNcBLtAK0ks8Cfg=;
 b=Ur4Mcgrca3EVT13PDYApcCW+O3mXljiraAtQZOSqoZWUnCSSoZhb0OSuPKkpBzjt7FplnRASaZ84gtsr5P2a6UGQoVSYxDrV5/11dLvkdS+rafDKzYzbgoykxfIyKgueJCWzZj7bSOVQqk+y8W6TgRxJv9jpRK5f+QJ9GorDqt0=
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
Subject: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
Date: Thu, 23 Sep 2021 03:11:14 +0000
Message-ID: <20210923031115.1429719-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2df8bc4-31ff-4b02-8d2f-08d97e3fed10
X-MS-TrafficTypeDiagnostic: DB7PR08MB3259:|DB9PR08MB6428:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6428A1CF676E76A321978571F7A39@DB9PR08MB6428.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mC71vN8PmQhpFwfMtuEw25+9nkVlkF1H6N8g4warMvgpphEbiMth5DFk7ZddUe3Ei37ELoJuRVHrGEx1NHMTiYTN46MpNR95YXL42EblJaIk5fO/e75lN3DNzgrnY74lN7nf2YBClspzZo/dvA3QUqR/vdbyzOdJZcn+i2b260pikRQTxeQb6dOFuNts+0g11PS4x7YeibFMhaAxotzTJE+X93MMPdk1zmVclR918DrDlVtsOeEvfytc6hHDvE9XkVsguavhTbct4aiJRP23sicz0X/RtImu5tGBOMU8liH5wb46uBVVxEOjud+l47uHH3vOIVMVLSJ01RihWoKmdVFevKk4Cx9rmyoBcNn/m1EkBUOcFYOk0252ytfEryP/ClMLuzpLtf6A66nI6J9GtjwdFucN3Dgp9hLEVtvoDqgx1cIQeQj2u9O7ZXx7oK7QOLlf+/+CY5P9cFo39PxWLxg2hOXwU8Ypb1D4uz5Iw93mAla1Klf/zkOEdwu0uyOZeJ8EA24vY/ai23VuINrNzy9PH4WDmFcmRJgfXmS392jPXj3Ci4wM8p7LzJw6yumc3YcF7kIEbV66xR25LNfrxfA6A3qg0vUgamcM1TPPAa5pFUyb74Pp+KG9eWYLXmuY0vo3JiPIEj0PpTKU2f/juKG/ys0ylA2UEbv4FwrTYlC75ZRIvheu3FQU1bxm0zYQ7ul8Y+M18gdPc86N5cYRMCvxoTXQW96OIGbH2HoD5XE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(82310400003)(2616005)(7696005)(47076005)(336012)(4326008)(2906002)(426003)(86362001)(44832011)(8676002)(316002)(36860700001)(1076003)(8936002)(5660300002)(6666004)(83380400001)(110136005)(70586007)(36756003)(26005)(186003)(81166007)(356005)(70206006)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3259
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4008d624-2b61-497f-b4cd-08d97e3fe12f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+mXLZhU8nfvo6aDPST20DoqJwMn/6reOzzOmVo5Nw0yMJDc9X8B8eDKs+MgNYI6mCDT/rW3KELft2aQJuW/51rtK5oqYEX13+Khktdb+GGUAcmcX3F66x1x/SfBHmPSq4c+eF77UlTatDUY9flktSo2kncYv1CDNXZFCXsAzHIkIM/AcQbuUPEC5AzBKS+xJyZbI0Rn8Agn7EbqlGnEo4OphI0vn8W98y/6uJLouc0xTaYh4/lRtnucOF0OCEb/ypcfCc3kGDJyVa02Myy596a4fM4I0qZHzpvip1V7IplEkTcCN8jyS277eUms8GnQ/qCzrRRKsk8D1f9sUsco31fpbHC2zHSU5j8eiIbCpqVcxUil7OOxjkwL0BTE2MbWZ7ncY1dzvVlLZ3K1DsM0T5szLOxvkIlEh/RLqAUeODF/kvcm/bCHHfNQpTzV9HF+JmDiDS9dZehjs7VsoFtaGkVdnTx8cYZd1RcQA2hq5bZxqf0gSLNS01LVpqBW1qimP3xnQF3RZ0j4i0yPTRz7sS7o7ZIIPlNYgR49mehhk5LdbJkI7wIB/o2xYx27Hdh8/37OGMqZW2OruIpkZwfco/n6rmMfrXsMVKXQhFo1gf9PErQlj9um2hN79ITEE5929N84Km2hdLldLHtu1xWvBGbxjZX7ObSSoMJwKbPG/hSDGG01xJ58yYhgB40Al2L0RyZxqQVUnTiJrHyvtZNrbLw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(70586007)(81166007)(508600001)(426003)(54906003)(83380400001)(336012)(316002)(36756003)(8676002)(82310400003)(110136005)(5660300002)(2906002)(6666004)(26005)(44832011)(36860700001)(7696005)(4326008)(86362001)(1076003)(8936002)(186003)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:12:07.4890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2df8bc4-31ff-4b02-8d2f-08d97e3fed10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6428

User could do device passthrough, with "xen,force-assign-without-iommu" in
the device tree snippet, on trusted guest through 1:1 direct-map,
if IOMMU absent or disabled on hardware.

In order to achieve that, this patch adds 1:1 direct-map check and disables
iommu-related action.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c92e510ae7..9a9d2522b7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2070,14 +2070,18 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( res < 0 )
         return res;
 
+    /*
+     * If xen_force, we allow assignment of devices without IOMMU protection.
+     * And if IOMMU is disabled or absent, 1:1 direct-map is necessary
+     */
+    if ( xen_force && is_domain_direct_mapped(kinfo->d) &&
+         !dt_device_is_protected(node) )
+        return 0;
+
     res = iommu_add_dt_device(node);
     if ( res < 0 )
         return res;
 
-    /* If xen_force, we allow assignment of devices without IOMMU protection. */
-    if ( xen_force && !dt_device_is_protected(node) )
-        return 0;
-
     return iommu_assign_dt_device(kinfo->d, node);
 }
 
-- 
2.25.1


