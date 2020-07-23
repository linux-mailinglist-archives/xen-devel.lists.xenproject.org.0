Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1822B2B3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:41:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydKx-00056V-U1; Thu, 23 Jul 2020 15:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJck=BC=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jydKw-00056J-8u
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:40:46 +0000
X-Inumbo-ID: de83a166-ccfa-11ea-a2c5-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de83a166-ccfa-11ea-a2c5-12813bfff9fa;
 Thu, 23 Jul 2020 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkaWWEiIcI3MklJyY5OREQ/S5Dx+rNCL9jY/oAp4P4A=;
 b=IKRZM17c7fNeNJ3E6n1oIfvf2aAQA6xzvLsXDKwu7qwb9rsMBmu3hNGBJXkwmC+DbpK8GWz420kEZ7TChr8unf5A+fDVOp02Tm+o+WzKMDoAamHQZ4N9+7TgC4LMjXR+Hzpwyutjns45JRn2VRk2w35uZkcvfsp+7wkDpazUI3o=
Received: from DB8PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:10:100::31)
 by DB6PR0802MB2245.eurprd08.prod.outlook.com (2603:10a6:4:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 23 Jul
 2020 15:40:41 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::a1) by DB8PR06CA0018.outlook.office365.com
 (2603:10a6:10:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Thu, 23 Jul 2020 15:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 15:40:41 +0000
Received: ("Tessian outbound 8f45de5545d6:v62");
 Thu, 23 Jul 2020 15:40:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0afc5ea6deeedb69
X-CR-MTA-TID: 64aa7808
Received: from a28b84a73466.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 629A4F73-8B5C-4DF7-9894-DC8F479DA64D.1; 
 Thu, 23 Jul 2020 15:40:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a28b84a73466.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jul 2020 15:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vzj44P8ENkdYkCx1Bc2O+ZadrHl3gMkiVWgJe37d5Sb4ORZAcM0HSHnQAwWS+7iFQgqpZIl44sA+twJJ8BvAkT8Y4xvgie1qEzb/44710XPA2e1Zm2yw68qyqBKrKqEjEs0Rkk7Se2WzVjqKF/nlRkmme3xY5YTbRG/iO0+hSxHqV9NpCrTQRkZNMtCbZ585qXmGwRlXH8RHCfv2MoaZtOCSBjWtpgiY6Z1hyHr1kUCYbXavQm1Sg29GbVXNy2IuQXKy7HhQgJrEfcImXEgXmO2nS3/iOTBod0ZOf8hIQ5T37f60v7fNKSRAkN1ZA+jTz4FGPLM6MABL8UiTIPb4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkaWWEiIcI3MklJyY5OREQ/S5Dx+rNCL9jY/oAp4P4A=;
 b=IuEpAT2IimnNbyUYJ3NPAykMquopVgljYBJAycTGAXWoSsbrkeN/bhmbFXriJCCXOSio1tCwaAus9feDLlI9ICE9p+q7SnQ1WCo5tc56Dd1uz35oGPDaN/uN2Zs7kV6y6S8o7Hw0KiYsOkAd4sF+//KdkNgIeWV2s3BIZEE7sP8VaRrY03C+G1eutZDRFiDwEwdX5oH619n6VlWo52+7OHEFWIYRu3bTmRLTQtRSBqinooSYnIiUZfkkz987iCui0Jv8vYkGIJzjP2PxO0cD8l5YRfLAV7hUPsYVxE+82PdQe8XVHZTOvaaZma2AyoieeDpzWwr7Fbv3MbyyVOQu8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkaWWEiIcI3MklJyY5OREQ/S5Dx+rNCL9jY/oAp4P4A=;
 b=IKRZM17c7fNeNJ3E6n1oIfvf2aAQA6xzvLsXDKwu7qwb9rsMBmu3hNGBJXkwmC+DbpK8GWz420kEZ7TChr8unf5A+fDVOp02Tm+o+WzKMDoAamHQZ4N9+7TgC4LMjXR+Hzpwyutjns45JRn2VRk2w35uZkcvfsp+7wkDpazUI3o=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB4439.eurprd08.prod.outlook.com (2603:10a6:20b:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 15:40:34 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.021; Thu, 23 Jul 2020
 15:40:34 +0000
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 4/4] arm/libxl: Emulated PCI device tree node in libxl
Date: Thu, 23 Jul 2020 16:40:24 +0100
Message-Id: <23346b24762467bd246b91b05f7b0fc1719282f6.1595511416.git.rahul.singh@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 171f2c16-d7e3-46a6-55b0-08d82f1ec15f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4439:|DB6PR0802MB2245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2245F92CF439C5EE22CB83A7FC760@DB6PR0802MB2245.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: I6pVXL5VHbkxS9luoZl0deZTqx1tYLyNqe7oANXwLkTBEPiAMacVZlKVmiXZRXRRUImjx/mMxTYEGhnMlx5CYA14GqPmXNIiDxhiEvrWc1QRKZlceizh0MzCn8nSn2vkAa5W8TpTPgmUk9Qmxoa3FElfOn2ukTqVHKExxfEKgQy51YlSLG7AMHCFl6n3VCxwSfnOoRKzk5xzwNoCNKXSx0i4ToSFXaFcsTqCQvXHPbRMDGWw8Vy4QsdAoBqYDhTF8N49J13wDiinUUSX7tRQKhCdSD/JCKrTY5Uvd596fIuONHBtMENS1w72bpAReA7iFvNrNoKp8iBwivAXHZBBEuv57yurNhcdP/bSYH0NUteFwsxrMrffKJi5XjZNioeG/qd+3fWqu8zbF7cz72sdiAwtipKhbHzP/9pXVWbap6g=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(8676002)(26005)(6512007)(2616005)(316002)(54906003)(6666004)(6506007)(66946007)(4326008)(6486002)(956004)(36756003)(86362001)(6916009)(44832011)(8936002)(186003)(16526019)(478600001)(69590400007)(5660300002)(52116002)(83380400001)(66556008)(66476007)(2906002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b8k+/EHco7QtKNmMcz24c8SZ8AXyJeoJzkI1JA5izQu2n9wmk6F+SlSzJktP2QMysXXezr+i2nq+rV//SiG4AqvMIrCTrzfOuoiP6usd0QFILoY4Yz8D8H5DjEbl2uYT+JnzMFva3/hxDfSgiLPVy40NLBCWcA8we+s4Q6WoDHeoHIPAoum3u/ZjnDOo1SM1l74V/rUfaYda2+9iOhHFG8KaB4wq5eaOTKWZ8qImp3D2wwuE2XbyvpkzQgRZZziJ61TejXMHUNsmZ7TMciCdUC2Tb7XGpo3Kq9YV8+/HwYu0h0ebmE0t/uRMtTv/wlNk/EJwH5QLI/quD5uEfQK0QmEAZTIEFrPmLCWm9tAzL4Ov368CNtPVyfPU+cPcTW/wStrOOCQzmq9TjXgMOSvxHarMvxLbY3u1dpFbfqgnbOWes4i+2vpUAoVYsYAYr/FXamo2inqskYZOT85EdTKQoKOp6uujAUU8rVoRT5EfVfi5VwhreoS+KubBvDBric/e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4439
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c19e5cea-9d04-40bc-6357-08d82f1ebd1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: suexNXHd03d65BclGREEECEzmCwd+6l5EXN9pyQgDIYFq/lKYKGdzHPtXOFXLUnGbPex30q3KqWhcv39UTN01BGw+A1EX193r/8Pd11+/9pRV5hWbo2XmVcb4ktJGTWo+Z+JdCpb7M9MqGvyP9PT43eJiqpnFTh+TV2R0hAICz3R3JkxXMfRY7NGqD/UWu+kx02iC4eeIdlF2E/SiNU5sq8VAw1DnPwQ8ib9CIzI62wiV0gJHxGRGqfSSuV4G4MMrQXj1bepFTxloFTprmegoL9xfu8V+lzr7+ipBr8tiF0recGkaiZQFDH9iSkvAh0wQDyNNb3cMIsMQCYDRgcE+fBElfYf6jcFZI3LsZpvhkjXVVcpUXlANZEmIk8+9Re6pF9gVxB8t+cFHXgJIB34MuRFyY1ZoksJAdpWJuSy4Wi5Id4Tg21KDnyJWZzdRP1PPFf/1+TSFGhOZhWuKPKEYQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(70586007)(70206006)(6512007)(4326008)(69590400007)(44832011)(6506007)(8676002)(478600001)(6666004)(83380400001)(36756003)(107886003)(336012)(47076004)(6916009)(82740400003)(26005)(2906002)(356005)(6486002)(16526019)(82310400002)(186003)(5660300002)(8936002)(316002)(86362001)(956004)(54906003)(81166007)(2616005)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 15:40:41.2520 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 171f2c16-d7e3-46a6-55b0-08d82f1ec15f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2245
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
Cc: rahul.singh@arm.com, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Bertrand.Marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

libxl will create an emulated PCI device tree node in the
device tree to enable the guest OS to discover the virtual
PCI during guest boot.

We introduced the new config option [vpci="ecam"] for guests.
When this config option is enabled in a guest configuration,
a PCI device tree node will be created in the guest device tree.

A new area has been reserved in the arm guest physical map at
which the VPCI bus is declared in the device tree (reg and ranges
parameters of the node).

Change-Id: I47d39cbe8184de2226f174644df9790ecc610ccd
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 tools/libxl/libxl_arm.c       | 200 ++++++++++++++++++++++++++++++++++
 tools/libxl/libxl_types.idl   |   6 +
 tools/xl/xl_parse.c           |   7 ++
 xen/include/public/arch-arm.h |  28 +++++
 4 files changed, 241 insertions(+)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29056..84568e9dc9 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -268,6 +268,130 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
     return fdt_property(fdt, "reg", regs, sizeof(regs));
 }
 
+static int fdt_property_vpci_bus_range(libxl__gc *gc, void *fdt,
+        unsigned num_cells, ...)
+{
+    uint32_t bus_range[num_cells];
+    be32 *cells = &bus_range[0];
+    int i;
+    va_list ap;
+    uint32_t arg;
+
+    va_start(ap, num_cells);
+    for (i = 0 ; i < num_cells; i++) {
+        arg = va_arg(ap, uint32_t);
+        set_cell(&cells, 1, arg);
+    }
+    va_end(ap);
+
+    return fdt_property(fdt, "bus-range", bus_range, sizeof(bus_range));
+}
+
+static int fdt_property_vpci_interrupt_map_mask(libxl__gc *gc, void *fdt,
+        unsigned num_cells, ...)
+{
+    uint32_t interrupt_map_mask[num_cells];
+    be32 *cells = &interrupt_map_mask[0];
+    int i;
+    va_list ap;
+    uint32_t arg;
+
+    va_start(ap, num_cells);
+    for (i = 0 ; i < num_cells; i++) {
+        arg = va_arg(ap, uint32_t);
+        set_cell(&cells, 1, arg);
+    }
+    va_end(ap);
+
+    return fdt_property(fdt, "interrupt-map-mask", interrupt_map_mask,
+                                sizeof(interrupt_map_mask));
+}
+
+static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
+        unsigned vpci_addr_cells,
+        unsigned cpu_addr_cells,
+        unsigned vpci_size_cells,
+        unsigned num_regs, ...)
+{
+    uint32_t regs[num_regs*(vpci_addr_cells+cpu_addr_cells+vpci_size_cells)];
+    be32 *cells = &regs[0];
+    int i;
+    va_list ap;
+    uint64_t arg;
+
+    va_start(ap, num_regs);
+    for (i = 0 ; i < num_regs; i++) {
+        /* Set the memory bit field */
+        arg = va_arg(ap, uint64_t);
+        set_cell(&cells, 1, arg);
+
+        /* Set the vpci bus address */
+        arg = vpci_addr_cells ? va_arg(ap, uint64_t) : 0;
+        set_cell(&cells, 2 , arg);
+
+        /* Set the cpu bus address where vpci address is mapped */
+        arg = cpu_addr_cells ? va_arg(ap, uint64_t) : 0;
+        set_cell(&cells, cpu_addr_cells, arg);
+
+        /* Set the vpci size requested */
+        arg = vpci_size_cells ? va_arg(ap, uint64_t) : 0;
+        set_cell(&cells, vpci_size_cells,arg);
+    }
+    va_end(ap);
+
+    return fdt_property(fdt, "ranges", regs, sizeof(regs));
+}
+
+static int fdt_property_vpci_interrupt_map(libxl__gc *gc, void *fdt,
+        unsigned child_unit_addr_cells,
+        unsigned child_interrupt_specifier_cells,
+        unsigned parent_unit_addr_cells,
+        unsigned parent_interrupt_specifier_cells,
+        unsigned num_regs, ...)
+{
+    uint32_t interrupt_map[num_regs * (child_unit_addr_cells +
+            child_interrupt_specifier_cells + parent_unit_addr_cells
+            + parent_interrupt_specifier_cells + 1)];
+    be32 *cells = &interrupt_map[0];
+    int i,j;
+    va_list ap;
+    uint64_t arg;
+
+    va_start(ap, num_regs);
+    for (i = 0 ; i < num_regs; i++) {
+        /* Set the child unit address*/
+        for (j = 0 ; j < child_unit_addr_cells; j++) {
+            arg = va_arg(ap, uint32_t);
+            set_cell(&cells, 1 , arg);
+        }
+
+        /* Set the child interrupt specifier*/
+        for (j = 0 ; j < child_interrupt_specifier_cells ; j++) {
+            arg = va_arg(ap, uint32_t);
+            set_cell(&cells, 1 , arg);
+        }
+
+        /* Set the interrupt-parent*/
+        set_cell(&cells, 1 , GUEST_PHANDLE_GIC);
+
+        /* Set the parent unit address*/
+        for (j = 0 ; j < parent_unit_addr_cells; j++) {
+            arg = va_arg(ap, uint32_t);
+            set_cell(&cells, 1 , arg);
+        }
+
+        /* Set the parent interrupt specifier*/
+        for (j = 0 ; j < parent_interrupt_specifier_cells; j++) {
+            arg = va_arg(ap, uint32_t);
+            set_cell(&cells, 1 , arg);
+        }
+    }
+    va_end(ap);
+
+    return fdt_property(fdt, "interrupt-map", interrupt_map,
+                                sizeof(interrupt_map));
+}
+
 static int make_root_properties(libxl__gc *gc,
                                 const libxl_version_info *vers,
                                 void *fdt)
@@ -659,6 +783,79 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_vpci_node(libxl__gc *gc, void *fdt,
+        const struct arch_info *ainfo,
+        struct xc_dom_image *dom)
+{
+    int res;
+    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
+    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
+    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
+
+    res = fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
+    if (res) return res;
+
+    res = fdt_property_string(fdt, "device_type", "pci");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
+    if (res) return res;
+
+    res = fdt_property_vpci_bus_range(gc, fdt, 2, 0,255);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "linux,pci-domain", 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", 3);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", 2);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", 1);
+    if (res) return res;
+
+    res = fdt_property_string(fdt, "status", "okay");
+    if (res) return res;
+
+    res = fdt_property_vpci_ranges(gc, fdt, GUEST_PCI_ADDRESS_CELLS,
+        GUEST_ROOT_ADDRESS_CELLS, GUEST_PCI_SIZE_CELLS,
+        3,
+        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_PCI_ADDR,
+        GUEST_VPCI_MEM_CPU_ADDR, GUEST_VPCI_MEM_SIZE,
+        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_PCI_ADDR,
+        GUEST_VPCI_PREFETCH_MEM_CPU_ADDR, GUEST_VPCI_PREFETCH_MEM_SIZE,
+        GUEST_VPCI_ADDR_TYPE_IO, GUEST_VPCI_IO_PCI_ADDR,
+        GUEST_VPCI_IO_CPU_ADDR, GUEST_VPCI_IO_SIZE);
+    if (res) return res;
+
+    res = fdt_property_vpci_interrupt_map_mask(gc, fdt, 4, 0, 0, 0, 7);
+    if (res) return res;
+
+    /*
+     * Legacy interrupt is forced and assigned to the guest.
+     * This will be removed once we have implementation for MSI support.
+     *
+     */
+    res = fdt_property_vpci_interrupt_map(gc, fdt, 3, 1, 0, 3,
+            4,
+            0, 0, 0, 1, 0, 136, DT_IRQ_TYPE_LEVEL_HIGH,
+            0, 0, 0, 2, 0, 137, DT_IRQ_TYPE_LEVEL_HIGH,
+            0, 0, 0, 3, 0, 138, DT_IRQ_TYPE_LEVEL_HIGH,
+            0, 0, 0, 4, 0, 139, DT_IRQ_TYPE_LEVEL_HIGH);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -962,6 +1159,9 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
+        if (info->arch_arm.vpci == LIBXL_VPCI_TYPE_ECAM)
+            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f399..d493637705 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -257,6 +257,11 @@ libxl_vuart_type = Enumeration("vuart_type", [
     (1, "sbsa_uart"),
     ])
 
+libxl_vpci_type = Enumeration("vpci_type", [
+    (0, "unknown"),
+    (1, "ecam"),
+    ])
+
 libxl_vkb_backend = Enumeration("vkb_backend", [
     (0, "UNKNOWN"),
     (1, "QEMU"),
@@ -640,6 +645,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("vpci", libxl_vpci_type),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7b7e..58b7e6f56a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1386,6 +1386,13 @@ void parse_config_data(const char *config_source,
         }
     }
 
+    if (!xlu_cfg_get_string(config, "vpci", &buf, 0)) {
+        if (libxl_vpci_type_from_string(buf, &b_info->arch_arm.vpci)) {
+            fprintf(stderr, "ERROR: invalid value \"%s\" for \"vpci\"\n",
+                    buf);
+            exit(1);
+        }
+    }
     parse_vnuma_config(config, b_info);
 
     /* Set max_memkb to target_memkb and max_vcpus to avail_vcpus if
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 7364a07362..4e19c62948 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -426,6 +426,34 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
 #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
 
+#define GUEST_PCI_ADDRESS_CELLS 3
+#define GUEST_PCI_SIZE_CELLS 2
+
+/* PCI-PCIe memory space types */
+#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
+#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
+#define GUEST_VPCI_ADDR_TYPE_IO           xen_mk_ullong(0x01000000)
+
+/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
+#define GUEST_VPCI_PREFETCH_MEM_CPU_ADDR  xen_mk_ullong(0x4000000000)
+#define GUEST_VPCI_MEM_CPU_ADDR           xen_mk_ullong(0x04020000)
+#define GUEST_VPCI_IO_CPU_ADDR            xen_mk_ullong(0xC0200800)
+
+/*
+ * This is hardcoded values for the real PCI physical addresses.
+ * This will be removed once we read the real PCI-PCIe physical
+ * addresses form the config space and map to the guest memory map
+ * when assigning the device to guest via VPCI.
+ *
+ */
+#define GUEST_VPCI_PREFETCH_MEM_PCI_ADDR  xen_mk_ullong(0x4000000000)
+#define GUEST_VPCI_MEM_PCI_ADDR           xen_mk_ullong(0x50000000)
+#define GUEST_VPCI_IO_PCI_ADDR            xen_mk_ullong(0x00000000)
+
+#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x100000000)
+#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x08000000)
+#define GUEST_VPCI_IO_SIZE                xen_mk_ullong(0x00800000)
+
 /*
  * 16MB == 4096 pages reserved for guest to use as a region to map its
  * grant table in.
-- 
2.17.1


