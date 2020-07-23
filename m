Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182222B2B2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:41:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydL6-00059K-V5; Thu, 23 Jul 2020 15:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJck=BC=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jydL5-00056E-Gp
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:40:55 +0000
X-Inumbo-ID: dd870334-ccfa-11ea-873e-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd870334-ccfa-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qBrQE/prViUqVQSn9QqWxYINAyZdBmv/u8R521Hni8=;
 b=sz7op+iZCDFJT9d88nFiyJBooGs+Lw7Xi+hNZkfkcgL7vy721rGcergeq+s6o2XYl0FgFR94TyWFAhrhlH6GrKpk74/NnE+kjTmbnYmWs5jGWPgEkBXV5iltnmDsVT0vhAUGWXsi2/G+tJURuEFk60RQJ2aV/4n3RDXIkv2R0ws=
Received: from DB6P193CA0017.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::27) by
 VI1PR08MB4336.eurprd08.prod.outlook.com (2603:10a6:803:fe::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24; Thu, 23 Jul 2020 15:40:40 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::a2) by DB6P193CA0017.outlook.office365.com
 (2603:10a6:6:29::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Thu, 23 Jul 2020 15:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 15:40:39 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62");
 Thu, 23 Jul 2020 15:40:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb8faa3ba6261820
X-CR-MTA-TID: 64aa7808
Received: from ad811b610fbf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70B6FD04-E237-4C1D-B191-796C7021326B.1; 
 Thu, 23 Jul 2020 15:40:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad811b610fbf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jul 2020 15:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUvJLRv4MULblw8+//xIveknlhcwLLYeI2U8tsdvu3/rZS6GKQePe6ut6k+u779wAHBxNcd1F8wvG82oTUArLyTBhDhOvJ8mmeuwwNG9IXnAyzK5T4p86q0L9ooCF4q5kdvEY2iFG5gxCYZHGCaxlrgHjA47IJ7WsQXzCW+QTJWaoJlJibk7b3g3vNb3XIXbpgYM93t/nbyEMsztf9OcPd2gley3Rt4IZA3ZW74pF69ZlLzuQ8x7Ljfee/aJBvDTR8zBur8RPJ3neI1HbV8s3J2S7KR8c+dtpJ9aT95b4gGsvxJ1u+YTd3RPuEFrnFuTdSNi9If8HJWoUzwD21V9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qBrQE/prViUqVQSn9QqWxYINAyZdBmv/u8R521Hni8=;
 b=lunZUay2OG4xjT+2Kg+xqoqv97Oic6hMTjuQuOuM0RcrU0osK1NMhX0a9XdrKtFa3qBEFptutI3xAQrpSXu1Z7/fU6zWRCIBoCENx/wmWTHNyV6LV2ZqjiF8v87NBzq9nCmSmgqaplhyHcWPI9ZCay3C7OzBBXX6IENRUllmK5Z/4dCXY7Je1gbqK+tVIoQouVWgb3d//Yfiks0eO9BWWL3N54k2qSPdEedhjYmMCbqCz138o9dhiCQb/3WCFKco7p3z64WC4FDB5zp+ldTRL174RU8nUpRq4pReymw1vbwoaDgnl4xTDa9F1zxHiRd+kMa8srqCPKTZA/6mRmFk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qBrQE/prViUqVQSn9QqWxYINAyZdBmv/u8R521Hni8=;
 b=sz7op+iZCDFJT9d88nFiyJBooGs+Lw7Xi+hNZkfkcgL7vy721rGcergeq+s6o2XYl0FgFR94TyWFAhrhlH6GrKpk74/NnE+kjTmbnYmWs5jGWPgEkBXV5iltnmDsVT0vhAUGWXsi2/G+tJURuEFk60RQJ2aV/4n3RDXIkv2R0ws=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB4439.eurprd08.prod.outlook.com (2603:10a6:20b:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 15:40:33 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.021; Thu, 23 Jul 2020
 15:40:33 +0000
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the PCI
 devices in XEN.
Date: Thu, 23 Jul 2020 16:40:22 +0100
Message-Id: <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595511416.git.rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To AM6PR08MB3560.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (217.140.106.54) by
 LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 15:40:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e163d089-4ce9-4596-93a1-08d82f1ec084
X-MS-TrafficTypeDiagnostic: AM6PR08MB4439:|VI1PR08MB4336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4336F196A6CF6BDE08AD2D82FC760@VI1PR08MB4336.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ptv+FrxmpR/clN3SqjLCV2rTdg5I9MA0Gvy7zfMwCKX7p78FL7Zi1LkKZmjvPtRC+NsJZ462eVC9RgboO6qxz1Jy3OrZ2oxWTfeQXDRM/K8wZjmSsLkbz1B4DDn1caTyeIWxPNvXpoD7y9XrRa6DIbkWpYplLCQAtz0PCmWQCeSJxXYbVIYKf5KmCLJ/HGV4TP3MCVuBvfow345mP5SNdjMkITRR8MEOvXkvaY5ZbJ+KR7ltwncKuwH4nJVpQuRZ8g0AmbObmJBZOS+qFOrt1TixtSdWb746uaya6vbXCWBp5kVE0OI4/gA1K6KkGZ8AYSeC0haBrwvyvh0wtkP9ilBkj4oyvQy2MVfa329k5JMNkUvSAbD/DayEgljfT8Fa+gCqOuLrQbqJNSJlDLFJfP3E3fSKWKzK5LqjFB0MdPI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(8676002)(26005)(6512007)(2616005)(316002)(54906003)(6666004)(6506007)(66946007)(4326008)(6486002)(956004)(36756003)(86362001)(6916009)(44832011)(8936002)(186003)(16526019)(478600001)(69590400007)(5660300002)(52116002)(83380400001)(66556008)(66476007)(2906002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: V6p+QxlCAKI1SnVCOI1NYf3z8YqrcqbwCwBe4KEApsMOn/4/qraoGFIRMv2T24PL3HUD4COUWzkdfcemDcXPE5/h9mVxeuUij137Xon91lVXqnH2/5VW8CMbh8Ej9ZomfAuZ6CQynIF/sHwnColr3U6yyNMpF4y6wLh6NQhbBtJaqaYKkpJBC24hXgUavL1em5miSGol6vYh7ytzjW913cR7ATfT2ap/byHV2AyHlMnp6wRJHT2x4kFuHJdQ++LIYQr2h1FEf8Fcyx9xn+e4VQ1jk7vyOqqN/eBVjbZjFlSsPJUF+jnPZaMrqH9Zvvq/nXCAM3lCvFNNIhbV88bxejIow9Gbs0mbbhvzHdjPuiR9W7f1P8YbJ9sZ+8D1N0c7J3Kz7/EJ9v2mPaaZ9eYJCF7BFmmKRNRI1R9u/Tij5fsySyypctMOn06XSb3OxvG+GodIE9DONhduNL13sNZez46zElTzggxHUTC0OQ58Nke+hB780k91xCcWxcbZx4L6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4439
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bfec9df7-fd04-4258-b2ff-08d82f1ebc8a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UP7NBQ30G58bAqNZDTgYA8WBwrr1OU1mKU9BD9jQlV5eOwS6S9LuY2yquTxywY4J00mb5muPGN9qcnLzfx7y98SHVXIGLeQnIlkbxIsKp/7dXaAm1yEsMUCugzysOXIMIKR8L+hJ0fBBhCBqZhIwrtgNtvV+TCqLjWhBeAoiAkFXBhNJ3TbcxbTiFeH2bzJ0h3j1dm7S+0G8vcsVq6+btB6iDHs2tjesfqKk/B2u5TSdsgUlgr3J1PSoBFmP1SkNPm6B5wtbM6ds/wSGt6zskAjySyvUT9arvY8g7xLMNYsWHBxejaWW57WstuQY51WITmSgFWBHboHQHu1LtNJ8+QUQktB4p4wllXObhvtzp8etaPU+37TpGzPoNVPPMaVHyos9+Wqs/kPwXnLUsLMNX1ZzcO15dYrbgK66Je2Ght9eJXs9apC9EDYKIGE9+CE3GxfHUhAzTKW6aU/Vy1Tq+Q==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(8936002)(82740400003)(36756003)(69590400007)(70586007)(70206006)(81166007)(8676002)(5660300002)(47076004)(2906002)(107886003)(54906003)(186003)(6666004)(356005)(478600001)(336012)(316002)(26005)(4326008)(6506007)(6512007)(2616005)(44832011)(6486002)(82310400002)(16526019)(86362001)(83380400001)(956004)(6916009)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 15:40:39.8293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e163d089-4ce9-4596-93a1-08d82f1ec084
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4336
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: rahul.singh@arm.com, Julien Grall <julien@xen.org>,
 Bertrand.Marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hardware domain is in charge of doing the PCI enumeration and will
discover the PCI devices and then will communicate to XEN via hyper
call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.

Change-Id: Ie87e19741689503b4b62da911c8dc2ee318584ac
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/physdev.c | 42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index e91355fe22..274720f98a 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -9,12 +9,48 @@
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <asm/hypercall.h>
-
+#include <xen/guest_access.h>
+#include <xsm/xsm.h>
 
 int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
-    return -ENOSYS;
+    int ret = 0;
+
+    switch ( cmd )
+    {
+#ifdef CONFIG_HAS_PCI
+        case PHYSDEVOP_pci_device_add:
+            {
+                struct physdev_pci_device_add add;
+                struct pci_dev_info pdev_info;
+                nodeid_t node = NUMA_NO_NODE;
+
+                ret = -EFAULT;
+                if ( copy_from_guest(&add, arg, 1) != 0 )
+                    break;
+
+                pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
+                if ( add.flags & XEN_PCI_DEV_VIRTFN )
+                {
+                    pdev_info.is_virtfn = 1;
+                    pdev_info.physfn.bus = add.physfn.bus;
+                    pdev_info.physfn.devfn = add.physfn.devfn;
+                }
+                else
+                    pdev_info.is_virtfn = 0;
+
+                ret = pci_add_device(add.seg, add.bus, add.devfn,
+                                &pdev_info, node);
+
+                break;
+            }
+#endif
+        default:
+            gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
+            ret = -ENOSYS;
+    }
+
+    return ret;
 }
 
 /*
-- 
2.17.1


