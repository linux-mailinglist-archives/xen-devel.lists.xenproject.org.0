Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9C3E8E88
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165616.302648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlPy-0000oV-4I; Wed, 11 Aug 2021 10:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165616.302648; Wed, 11 Aug 2021 10:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlPx-0000lw-VC; Wed, 11 Aug 2021 10:25:01 +0000
Received: by outflank-mailman (input) for mailman id 165616;
 Wed, 11 Aug 2021 10:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlPw-0000en-AR
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:00 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60b8ffad-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:24:58 +0000 (UTC)
Received: from PR3P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::32)
 by AM5PR0802MB2401.eurprd08.prod.outlook.com (2603:10a6:203:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:24:51 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:b6:cafe::5a) by PR3P195CA0027.outlook.office365.com
 (2603:10a6:102:b6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:50 +0000
Received: ("Tessian outbound 077ab11054bf:v101");
 Wed, 11 Aug 2021 10:24:50 +0000
Received: from e5ec0673e643.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77AB03F5-FFF7-4056-8023-FE57619D1911.1; 
 Wed, 11 Aug 2021 10:24:41 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5ec0673e643.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:41 +0000
Received: from AM6P194CA0045.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::22)
 by DB8PR08MB5292.eurprd08.prod.outlook.com (2603:10a6:10:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:24:39 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::68) by AM6P194CA0045.outlook.office365.com
 (2603:10a6:209:84::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:24:39 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:34 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:32 +0000
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
X-Inumbo-ID: 60b8ffad-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbmZt/3Qnc8x9mhpmsFguDqJamcughb+6Xb0Z1N6iV0=;
 b=uy8+BZx4hpeTLpsZ4odoGCPYkREJ1UFRS/uxyjXDRH0kuo1zcI636QWljJExlgzAh41s6Frd0JFl7qOFWykv4jfZnztyHdr7c3RE9AjGjKEIjidwmLihGbRZRrGfTN/3tjyhnQrT9y8GqQ4ZDYujXJJJ9PFbTmmdaau4VHEPu4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5fea9b0aa8fa606
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+aSOJkWljn8dNbM7OpivMCS/cBtjK6o/cMszEMLeqvIquURXylBvokcVqdoY6LaIeW19lPYNGYRpC9KUFnB4TIqoYAVo6RJMtVW2A0n9cr76awaR3y8KLHLHLZCje08y7K359/fTqQNfQPQd2ZaHf74p1iHFHZ5iR84U8H+IW/jlrLPk3VeEdKNoplzFHENZrcDfxbF6NB6VT3xx6Qmwar1ukbYGlwR02AWyZzFNMQQnMoboisRwgKfG1GDDLe1IKEjUqv1o7OOGUr5fpzKRl8QxQLn1/mWHaD+tGPPpJpOmvg0Jjfl1nNObbeZT6NNsnGmrdhgZVWADDO22cLFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbmZt/3Qnc8x9mhpmsFguDqJamcughb+6Xb0Z1N6iV0=;
 b=Bc/XctFxJY111BIGhVY0YdrUtf2umPSqft5wkTTBRTet/8IznD2wnGBi8I+oTDQbAV7sAErPTbpQx6tuCO8ot92sK41blXWZVRl70whRMXyGniUUPKi+cPer2jEHz62wY96CKBIfSbGpkf77vfZjkD7qgU9YmrqAgs+FwR6/YWwjVslhVjkm+HQRSar9SpsEwpAVm99CYVhxIe7INkQxm1X08aAyE/8X3yh4AtqqFjNZTfCKiiTahQNXQVEfohb1s0+0yUGpgqUeP8h3glB3C+yNABTRKaclY0KcLh/NdZvgTSMfOYF7lkz51OESFXWIs5E9zunCTh5M8XP4C0r9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbmZt/3Qnc8x9mhpmsFguDqJamcughb+6Xb0Z1N6iV0=;
 b=uy8+BZx4hpeTLpsZ4odoGCPYkREJ1UFRS/uxyjXDRH0kuo1zcI636QWljJExlgzAh41s6Frd0JFl7qOFWykv4jfZnztyHdr7c3RE9AjGjKEIjidwmLihGbRZRrGfTN/3tjyhnQrT9y8GqQ4ZDYujXJJJ9PFbTmmdaau4VHEPu4U=
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
Subject: [XEN RFC PATCH 01/40] tools: Fix -Werror=maybe-uninitialized for xlu_pci_parse_bdf
Date: Wed, 11 Aug 2021 18:23:44 +0800
Message-ID: <20210811102423.28908-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36916feb-2158-4523-84cb-08d95cb2409d
X-MS-TrafficTypeDiagnostic: DB8PR08MB5292:|AM5PR0802MB2401:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2401AE0C39398A8BD46AAF2A9EF89@AM5PR0802MB2401.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MNurJbs3tCWzvpXNUWUbAYC6SghBgTn9HdIaIoQfr/jUlZ2zQiQifYjbj3eh81lBAYRfeCO6LX9bAVb7bH1USaKpm5HTWc4kctrIrhm1+wKHAQuLirex+DbFFCkk9XBxZqCgFTrRkUjc1StkK/MbLItO64N2nIV5hSHLmNTfGhoHXsTUH4Tja8x9uz5rRLrqk+esOFC58jlxNmFaS5h82sR7FiHTV8iBfCjPWmVLbiBXl3odtAwJIS+a00Rf/i9BTrMoDdtm0A4yrQDkuqb5kfuzjMa0+XGJUyeX53R+SAfU+p7jTMQIDJcaD5fCpo48sRqWzUbQsLk+KHfUctS5rq4GAPw/Krdu2t/QGMA4p4kh2Pky4iBC7t6M39SBv4VLdbnEoYR1eg3ZkfEhl5QNph+fflTKZIGgK9eQqYF1w/80KAujqa85yaxRp2aYKuQBs2JSbNqdFCg06IqKdZ27gwIqRRBp/kjhHgLX+mFjAEf9jX6nigM8T+sAVqSPU12UVLALJuOimkka9Tcdfz+w8ESi2RFTkWGii8dpC1vFJHNeMkzF5utv02lD8lmoWEV8x7YDbRRITdoCPNBJid9GV7BKe3BUT/51nRB+tLy6BRADR4TwHW8lKeLjiiv7e4nLbbFT03uxdjR+/6Y5ZYlin0YJE20NNgsIWOmKlMu3tBjY1qrj2prWXLX0VVFfXvYnZZ0UHcL/Imw2ER17uooKAvD9uEK5b3QR1ZEm7UJ5nvnSDTUHhcEAJi+zBjJx1n2rlSRwJPjB18hqqNSCdk9/6wCt1+Xby/apty71YPJFY40=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(8676002)(34070700002)(356005)(2906002)(5660300002)(44832011)(26005)(426003)(7696005)(8936002)(478600001)(36756003)(36860700001)(83380400001)(82310400003)(70586007)(186003)(86362001)(110136005)(6666004)(2616005)(316002)(47076005)(336012)(82740400003)(81166007)(1076003)(4326008)(70206006)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5292
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88154411-dd04-4c15-450f-08d95cb239ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m8LAgk5+fjRW313BazqjOzeiFnctBZvemA47LYbJPyV3LY0WhYJYAfJLVhY8O1Qjfvvf78DqCoz05b56H98rx084vF7bLFCySBVfb0U6ZBwG8NHQWWTq+Q5tK37qRp0WivP8JbHqdJvO3jaXFKIw8MOFyzfzZBchcAsEyWp9hORRHHwR4xS11JD/sy8UwW/TsY/SQfvTuzJi+50001vyfrn2EsS3nU5yGTWHn7qaY7vR1qGKPMKEd/jzevG6zXBaBSsC64Vav3OzIDBTQK1FKOBtjdKGKIL0JnD/mnCkPCgvE8ZQPGuaHs9h50wCmGRY4aSe6VwXcDoBLv0/oojmcDFbDOY0uq0ZZWoEtpgX55/iYG5hYi0Zj60PBOtMmjWYnzstAIztD9yQOHBuZLGGsfJbHWMn3izxOKunk0wetpKO9vr3l1rSlILqbSewIkUATJrWBYE/p1YftBtXf95UTouRstowrW4sNc9krKwRB/cj9mJsWiuP+WnFJzNcUL5ClOOVDE1B9kTFQaXmg6d1qxNyTuw8TOy++6g7zWUojL7OZzLPEjAawSXqpFJCpZx48BgM7ZQNKEjOlOXUqK1Q9jHVdEF+BMmDvNpyNarN9pVCVbdb+QzuWaEXCSpG7Quoo1gZSvdtUZawJ/pBaoeoW4KF6lREnVqXtR19l4QOudOQiwMLuGl6E75XaQZUKNdkn+CM9IY0ZxRFBPgT4n6SHuJppdopyxgymq9lFBAKSKk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(26005)(8676002)(316002)(2906002)(36860700001)(44832011)(36756003)(186003)(82310400003)(70206006)(70586007)(7696005)(81166007)(2616005)(426003)(478600001)(86362001)(82740400003)(6666004)(83380400001)(8936002)(4326008)(1076003)(110136005)(5660300002)(336012)(47076005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:24:50.6415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36916feb-2158-4523-84cb-08d95cb2409d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2401

| libxlu_pci.c: In function 'xlu_pci_parse_bdf':
| libxlu_pci.c:32:18: error: 'func' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|    32 |     pcidev->func = func;
|       |     ~~~~~~~~~~~~~^~~~~~
| libxlu_pci.c:51:29: note: 'func' was declared here
|    51 |     unsigned dom, bus, dev, func, vslot = 0;
|       |                             ^~~~
| libxlu_pci.c:31:17: error: 'dev' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|    31 |     pcidev->dev = dev;
|       |     ~~~~~~~~~~~~^~~~~
| libxlu_pci.c:51:24: note: 'dev' was declared here
|    51 |     unsigned dom, bus, dev, func, vslot = 0;
|       |                        ^~~
| libxlu_pci.c:30:17: error: 'bus' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|    30 |     pcidev->bus = bus;
|       |     ~~~~~~~~~~~~^~~~~
| libxlu_pci.c:51:19: note: 'bus' was declared here
|    51 |     unsigned dom, bus, dev, func, vslot = 0;
|       |                   ^~~
| libxlu_pci.c:78:26: error: 'dom' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|    78 |                 if ( dom & ~0xff )
|       |                      ~~~~^~~~~~~

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 tools/libs/util/libxlu_pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 551d8e3aed..b38e9aab40 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -15,7 +15,7 @@ static int parse_bdf(libxl_device_pci *pci, const char *str, const char **endp)
 {
     const char *ptr = str;
     unsigned int colons = 0;
-    unsigned int domain, bus, dev, func;
+    unsigned int domain = 0, bus = 0, dev = 0, func = 0;
     int n;
 
     /* Count occurrences of ':' to detrmine presence/absence of the 'domain' */
@@ -28,7 +28,6 @@ static int parse_bdf(libxl_device_pci *pci, const char *str, const char **endp)
     ptr = str;
     switch (colons) {
     case 1:
-        domain = 0;
         if (sscanf(ptr, "%x:%x.%n", &bus, &dev, &n) != 2)
             return ERROR_INVAL;
         break;
-- 
2.25.1


