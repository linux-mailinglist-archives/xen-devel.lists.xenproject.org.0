Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB222B2B6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydL2-00057X-F0; Thu, 23 Jul 2020 15:40:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJck=BC=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jydL0-00056E-Gk
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:40:50 +0000
X-Inumbo-ID: dd90bb18-ccfa-11ea-873e-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd90bb18-ccfa-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ig21FGJcaMYflDSUeuWkPVGyi1CGLYgrcJFV+ngOUE=;
 b=WE/koDoMYxR79CrdgfSWygikzr0sKfoO//pOmcNrIR0XL9dPT71qs8xLBU+Ax3EfwjxRQoCVZVVSo0kYd4Iq+SRmGmWIDv6H0Z+ZuowzZ2IVMTV9k633D3wMhJL7i1pSGo64HlkAOQBZfAz4jonVxSsqsgUgqbLk7RBksbezNms=
Received: from AM5PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:206:1::27)
 by VI1PR0802MB2256.eurprd08.prod.outlook.com (2603:10a6:800:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 15:40:40 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::c3) by AM5PR04CA0014.outlook.office365.com
 (2603:10a6:206:1::27) with Microsoft SMTP Server (version=TLS1_2,
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
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 15:40:40 +0000
Received: ("Tessian outbound c83312565ef4:v62");
 Thu, 23 Jul 2020 15:40:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fa9bceec7b6ce00
X-CR-MTA-TID: 64aa7808
Received: from ad811b610fbf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04FA8CF8-6D49-4C38-93A8-8B180895957A.1; 
 Thu, 23 Jul 2020 15:40:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad811b610fbf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jul 2020 15:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h60RQ8yHONI/PAgVn2nug5PWcCqo+xRnrNDK+r8cFczVo5fVYYcP7q+EhyJCtoZTd3d5p4qn009BgO12GDQMmL0rX3lt3o++8wkChVLuidoEluXvLmDatAx+vbUKqCXb7BIM7dpuweK6uXNjvOZNkybdeSUl0Nn3QVGgVBYRG96AzPqMrOUgKo9Kg+lrZUa+1rryFJkDoSOtOQt0OgXzeNf/S6JCW39YnEYsqlhUXp25vnupYqN8yaNJMboylwtdDjjJFiP+ETaGPkeOq0KqclucsF8szJS76PX0tJumoq2oJ4oFiH3/3Apjzt5V879NElw4B0AWTRqQlyfvZETGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ig21FGJcaMYflDSUeuWkPVGyi1CGLYgrcJFV+ngOUE=;
 b=BqdFd6ap7yNCzuu/z9jm00cGZcA/1V2KA9ojNYaDo56kGNk0+UULXkOa+z4MtWZBf9L9l4XuLB+AnlJ4JFzVd/AE11zlc/fOZjqMr7xWqivTZcakIjymx7XLhqTQQLrVqYXXQIGFRxdS4hHtE5pJ0+0+zZVSdwyu/QTh7py3A5000dAtmskTS/62qt3Ut/AJGnXmfr5ZcyVk/fsUhDeSMUAIuZLM7aYLk9zJQDYGIKXMk8ifBmtESXZlQKhU8JOve2PS7W+1g2fdcM8bMa7MOnUaSuVGP+994jYswJH3rZNBEyab3n100NiuwXYZdh1rbkS9bipVTI2Q2GWGCao76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ig21FGJcaMYflDSUeuWkPVGyi1CGLYgrcJFV+ngOUE=;
 b=WE/koDoMYxR79CrdgfSWygikzr0sKfoO//pOmcNrIR0XL9dPT71qs8xLBU+Ax3EfwjxRQoCVZVVSo0kYd4Iq+SRmGmWIDv6H0Z+ZuowzZ2IVMTV9k633D3wMhJL7i1pSGo64HlkAOQBZfAz4jonVxSsqsgUgqbLk7RBksbezNms=
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
 15:40:32 +0000
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge discovery
 within XEN on ARM.
Date: Thu, 23 Jul 2020 16:40:21 +0100
Message-Id: <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595511416.git.rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To AM6PR08MB3560.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (217.140.106.54) by
 LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 15:40:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f18fe8ae-df6b-481b-e097-08d82f1ec0b4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4439:|VI1PR0802MB2256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2256033731EDA72EF87EBB71FC760@VI1PR0802MB2256.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: q4OnUcQirivsHUj4PMJQLjan/DGV9xSaWQBwsvkimyiVSPHp7lSBiucO8yBcFHA1sJnEfOEHFFNL+Vozu6JHsjyI4BmjDPV8/f07WF+iwXPKPY6M6sKn7HaXuuuPcQuUfHQuboRPOCKB4aNYBvml4kvNsJIFbNnawHBEob9kCKcKXjSbL3ASGWCV3FPeKsYTQb73ZfYlUUKQAHXkaRremIIXkwoBe682W8xo+nne7a/66C4q+eRegcRJH0KeA2EwCsL89RgmAc+nl7I3eaX0sMoqweSpx1XVkGcJkEeFdUUIRhS2d7s8maHa7KkE0EARgGJSaV4Ue1YUO9wPWTVIJ0z19cyOsqreIFpq2V2TZN9CJ9AaJO3NoPqJmYwFAaoAS0nUjfyt7wwS6RY0iPpsfsV0tQ4kWXQKt8xsfPQiKZzkmSiZheiAJfgQzPXytpdlcqjSzuZy94cshjOYp8XSOvXYV8zC0blUZ3WT0Tpz4hM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(8676002)(26005)(6512007)(2616005)(316002)(54906003)(6666004)(6506007)(66946007)(4326008)(6486002)(956004)(36756003)(86362001)(30864003)(6916009)(44832011)(8936002)(186003)(16526019)(478600001)(5660300002)(52116002)(83380400001)(66556008)(66476007)(2906002)(2004002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rVIcaR9ussPehTx01moTc/TbtgWLlGAUvxdG4vPhJ3tUURj+7yeneD3YBHRHpdBMf5NOOTEHuokUCQVhq1wPbgH+rXrnbrKAWmfHI4e9geQZZZBFWV+A+Gzx5hwLcQTmq8t8Mpm37/VUszcBUx8N/cHGiqb+z1IO3KY9f+qPNIkd0v0srXWN69o6QZyP2af4YPazKl6Tmqw27geRGHwv7m0SKxPKtAAeBDMLN6R6lkS2FjTI2W/SnwqvsdCFFdnDqemBkgtyPfQHVXBP3ZmmWs/jMURuY+/AFsxtICnr9Kn+mTkC1VPbRYZep3n8zjeuD5d9IGuRq7XpdoC1Z2BDUPseJQU/bGsvgJU7SpBSqJokSVYrPqVKl8GUFR0Nh8O4+qCJ7UBZY3tyyn0HB4+karq7b+UgtqFD0bKUrbBv8p1DJOw/7uo9GA39XgjHaIH/CgDCi1NNwUaDrUHRYdXr2Sv0g+HQmuhM9GQil0umWRFq7IVYLWCtlBaALyy34LWU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4439
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3d62723e-38e2-4302-c5ff-08d82f1ebc33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2kKBe2HC86OKa6ch1MavynG/PTUlZgwNpshYyJEaG9D3YGMSxZvDH7hKUns9znglbaQ1NXx4KmROlhHKu9F5vdZ9EpyWSbEGHs3ZMiKcHqXL2J/iaBSIEHEU05p0Ok36hvvjdLrxWvnMBRrbO32TwxlI2WOOsNCwwnBz8pIIWpwnyzbHIben7aXq6gRxGs/rix6tvtBrvr67pDrEscnnbXjNa2BXA1V9iBJnv8xXUj3NVg2mV3+FeEkD9opukAo5660d+PF2ziRCpfzyR9oyjJkir/dTM7mLGVtJax3jt/qoNYqrL5W4p1JxbcAhgp6pksguHePX/QHSCb0BQ4Q2zj/barL/zlGhpxJuSwKkD+bWl5N13zWmDI6O9fQ2EgsL3A4BFDaDxYtzwhD13DpKNV0zeeegQaTb1zJmqPdjHmW7UxhjFNBy1cGx0dDRkbETGq+VQ5HrsZNdPIJp158q7Jjl/UuTVLAzg5VaoiBdypVzqURbY1iF/jbp56VIg8u0mFaVqMNekJ/Vxb6Udak27GXdZzsCVWUdcygbeQ1Ayo=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(2906002)(6666004)(6916009)(8936002)(82310400002)(6486002)(16526019)(186003)(86362001)(81166007)(356005)(83380400001)(107886003)(26005)(4326008)(36756003)(8676002)(47076004)(6512007)(82740400003)(336012)(6506007)(956004)(2616005)(44832011)(478600001)(70586007)(70206006)(30864003)(316002)(36906005)(5660300002)(54906003)(2004002)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 15:40:40.0769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f18fe8ae-df6b-481b-e097-08d82f1ec0b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2256
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

XEN during boot will read the PCI device tree node “reg” property
and will map the PCI config space to the XEN memory.

XEN will read the “linux, pci-domain” property from the device tree
node and configure the host bridge segment number accordingly.

As of now "pci-host-ecam-generic" compatible board is supported.

Change-Id: If32f7748b7dc89dd37114dc502943222a2a36c49
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/Kconfig                |   7 +
 xen/arch/arm/Makefile               |   1 +
 xen/arch/arm/pci/Makefile           |   4 +
 xen/arch/arm/pci/pci-access.c       | 101 ++++++++++++++
 xen/arch/arm/pci/pci-host-common.c  | 198 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-generic.c | 131 ++++++++++++++++++
 xen/arch/arm/pci/pci.c              | 112 ++++++++++++++++
 xen/arch/arm/setup.c                |   2 +
 xen/include/asm-arm/device.h        |   7 +-
 xen/include/asm-arm/pci.h           |  97 +++++++++++++-
 10 files changed, 654 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/pci/Makefile
 create mode 100644 xen/arch/arm/pci/pci-access.c
 create mode 100644 xen/arch/arm/pci/pci-host-common.c
 create mode 100644 xen/arch/arm/pci/pci-host-generic.c
 create mode 100644 xen/arch/arm/pci/pci.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388265..ee13339ae9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -31,6 +31,13 @@ menu "Architecture Features"
 
 source "arch/Kconfig"
 
+config ARM_PCI
+	bool "PCI Passthrough Support"
+	depends on ARM_64
+	---help---
+
+	  PCI passthrough support for Xen on ARM64.
+
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
 	depends on ARM_64
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7e82b2178c..345cb83eed 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -6,6 +6,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
 obj-$(CONFIG_TEE) += tee/
+obj-$(CONFIG_ARM_PCI) += pci/
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
new file mode 100644
index 0000000000..358508b787
--- /dev/null
+++ b/xen/arch/arm/pci/Makefile
@@ -0,0 +1,4 @@
+obj-y += pci.o
+obj-y += pci-host-generic.o
+obj-y += pci-host-common.o
+obj-y += pci-access.o
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
new file mode 100644
index 0000000000..c53ef58336
--- /dev/null
+++ b/xen/arch/arm/pci/pci-access.c
@@ -0,0 +1,101 @@
+/*
+ * Copyright (C) 2020 Arm Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <asm/pci.h>
+#include <xen/rwlock.h>
+
+static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
+                            unsigned int len)
+{
+    int rc;
+    uint32_t val = GENMASK(0, len * 8);
+
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+    {
+        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
+                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
+        return val;
+    }
+
+    if ( unlikely(!bridge->ops->read) )
+        return val;
+
+    rc = bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
+    if ( rc )
+        printk(XENLOG_ERR "Failed to read reg %#x len %u for "PRI_pci"\n",
+                reg, len, sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
+
+    return val;
+}
+
+static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
+        unsigned int len, uint32_t val)
+{
+    int rc;
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+    {
+        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
+                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
+        return;
+    }
+
+    if ( unlikely(!bridge->ops->write) )
+        return;
+
+    rc = bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);
+    if ( rc )
+        printk(XENLOG_ERR "Failed to write reg %#x len %u for "PRI_pci"\n",
+                reg, len, sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
+}
+
+/*
+ * Wrappers for all PCI configuration access functions.
+ */
+
+#define PCI_OP_WRITE(size, type) \
+    void pci_conf_write##size (pci_sbdf_t sbdf,unsigned int reg, type val) \
+{                                               \
+    pci_config_write(sbdf, reg, size / 8, val);     \
+}
+
+#define PCI_OP_READ(size, type) \
+    type pci_conf_read##size (pci_sbdf_t sbdf, unsigned int reg)  \
+{                                               \
+    return pci_config_read(sbdf, reg, size / 8);     \
+}
+
+PCI_OP_READ(8, u8)
+PCI_OP_READ(16, u16)
+PCI_OP_READ(32, u32)
+PCI_OP_WRITE(8, u8)
+PCI_OP_WRITE(16, u16)
+PCI_OP_WRITE(32, u32)
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
new file mode 100644
index 0000000000..c5f98be698
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -0,0 +1,198 @@
+/*
+ * Copyright (C) 2020 Arm Ltd.
+ *
+ * Based on Linux drivers/pci/ecam.c
+ * Copyright 2016 Broadcom.
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <asm/pci.h>
+#include <xen/rwlock.h>
+#include <xen/vmap.h>
+
+/*
+ * List for all the pci host bridges.
+ */
+
+static LIST_HEAD(pci_host_bridges);
+
+static bool __init dt_pci_parse_bus_range(struct dt_device_node *dev,
+        struct pci_config_window *cfg)
+{
+    const __be32 *cells;
+    uint32_t len;
+
+    cells = dt_get_property(dev, "bus-range", &len);
+    /* bus-range should at least be 2 cells */
+    if ( !cells || (len < (sizeof(*cells) * 2)) )
+        return false;
+
+    cfg->busn_start = dt_next_cell(1, &cells);
+    cfg->busn_end = dt_next_cell(1, &cells);
+
+    return true;
+}
+
+static inline void __iomem *pci_remap_cfgspace(paddr_t start, size_t len)
+{
+    return ioremap_nocache(start, len);
+}
+
+static void pci_ecam_free(struct pci_config_window *cfg)
+{
+    if ( cfg->win )
+        iounmap(cfg->win);
+
+    xfree(cfg);
+}
+
+static struct pci_config_window *gen_pci_init(struct dt_device_node *dev,
+        struct pci_ecam_ops *ops)
+{
+    int err;
+    struct pci_config_window *cfg;
+    paddr_t addr, size;
+
+    cfg = xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+
+    err = dt_pci_parse_bus_range(dev, cfg);
+    if ( !err ) {
+        cfg->busn_start = 0;
+        cfg->busn_end = 0xff;
+        printk(XENLOG_ERR "No bus range found for pci controller\n");
+    } else {
+        if ( cfg->busn_end > cfg->busn_start + 0xff )
+            cfg->busn_end = cfg->busn_start + 0xff;
+    }
+
+    /* Parse our PCI ecam register address*/
+    err = dt_device_get_address(dev, 0, &addr, &size);
+    if ( err )
+        goto err_exit;
+
+    cfg->phys_addr = addr;
+    cfg->size = size;
+    cfg->ops = ops;
+
+    /*
+     * On 64-bit systems, we do a single ioremap for the whole config space
+     * since we have enough virtual address range available.  On 32-bit, we
+     * ioremap the config space for each bus individually.
+     *
+     * As of now only 64-bit is supported 32-bit is not supported.
+     */
+    cfg->win = pci_remap_cfgspace(cfg->phys_addr, cfg->size);
+    if ( !cfg->win )
+        goto err_exit_remap;
+
+    printk("ECAM at [mem %lx-%lx] for [bus %x-%x] \n",cfg->phys_addr,
+            cfg->phys_addr + cfg->size - 1,cfg->busn_start,cfg->busn_end);
+
+    if ( ops->init ) {
+        err = ops->init(cfg);
+        if (err)
+            goto err_exit;
+    }
+
+    return cfg;
+
+err_exit_remap:
+    printk(XENLOG_ERR "ECAM ioremap failed\n");
+err_exit:
+    pci_ecam_free(cfg);
+    return NULL;
+}
+
+static struct pci_host_bridge * pci_alloc_host_bridge(void)
+{
+    struct pci_host_bridge *bridge = xzalloc(struct pci_host_bridge);
+
+    if ( !bridge )
+        return NULL;
+
+    INIT_LIST_HEAD(&bridge->node);
+    return bridge;
+}
+
+int pci_host_common_probe(struct dt_device_node *dev,
+        struct pci_ecam_ops *ops)
+{
+    struct pci_host_bridge *bridge;
+    struct pci_config_window *cfg;
+    u32 segment;
+
+    bridge = pci_alloc_host_bridge();
+    if ( !bridge )
+        return -ENOMEM;
+
+    /* Parse and map our Configuration Space windows */
+    cfg = gen_pci_init(dev, ops);
+    if ( !cfg )
+        return -ENOMEM;
+
+    bridge->dt_node = dev;
+    bridge->sysdata = cfg;
+    bridge->ops = &ops->pci_ops;
+
+    if( !dt_property_read_u32(dev, "linux,pci-domain", &segment) )
+    {
+        printk(XENLOG_ERR "\"linux,pci-domain\" property in not available in DT\n");
+        return -ENODEV;
+    }
+
+    bridge->segment = (u16)segment;
+
+    list_add_tail(&bridge->node, &pci_host_bridges);
+
+    return 0;
+}
+
+/*
+ * This function will lookup an hostbridge based on the segment and bus
+ * number.
+ */
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
+{
+    struct pci_host_bridge *bridge;
+    bool found = false;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        if ( bridge->segment != segment )
+            continue;
+
+        found = true;
+        break;
+    }
+
+    return (found) ? bridge : NULL;
+}
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
new file mode 100644
index 0000000000..cd67b3dec6
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -0,0 +1,131 @@
+/*
+ * Copyright (C) 2020 Arm Ltd.
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/device.h>
+#include <asm/io.h>
+#include <xen/pci.h>
+#include <asm/pci.h>
+
+/*
+ * Function to get the config space base.
+ */
+static void __iomem *pci_config_base(struct pci_host_bridge *bridge,
+        uint32_t sbdf, int where)
+{
+    struct pci_config_window *cfg = bridge->sysdata;
+    unsigned int devfn_shift = cfg->ops->bus_shift - 8;
+
+    pci_sbdf_t sbdf_t = (pci_sbdf_t) sbdf ;
+
+    unsigned int busn = sbdf_t.bus;
+    void __iomem *base;
+
+    if ( busn < cfg->busn_start || busn > cfg->busn_end )
+        return NULL;
+
+    base = cfg->win + (busn << cfg->ops->bus_shift);
+
+    return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
+}
+
+int pci_ecam_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
+        int where, int size, u32 val)
+{
+    void __iomem *addr;
+
+    addr = pci_config_base(bridge, sbdf, where);
+    if ( !addr )
+        return -ENODEV;
+
+    if ( size == 1 )
+        writeb(val, addr);
+    else if ( size == 2 )
+        writew(val, addr);
+    else
+        writel(val, addr);
+
+    return 0;
+}
+
+int pci_ecam_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
+        int where, int size, u32 *val)
+{
+    void __iomem *addr;
+
+    addr = pci_config_base(bridge, sbdf, where);
+    if ( !addr ) {
+        *val = ~0;
+        return -ENODEV;
+    }
+
+    if ( size == 1 )
+        *val = readb(addr);
+    else if ( size == 2 )
+        *val = readw(addr);
+    else
+        *val = readl(addr);
+
+    return 0;
+}
+
+/* ECAM ops */
+struct pci_ecam_ops pci_generic_ecam_ops = {
+    .bus_shift  = 20,
+    .pci_ops    = {
+        .read       = pci_ecam_config_read,
+        .write      = pci_ecam_config_write,
+    }
+};
+
+static const struct dt_device_match gen_pci_dt_match[] = {
+    { .compatible = "pci-host-ecam-generic",
+      .data =       &pci_generic_ecam_ops },
+
+    { },
+};
+
+static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
+{
+    const struct dt_device_match *of_id;
+    struct pci_ecam_ops *ops;
+
+    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
+    ops = (struct pci_ecam_ops *) of_id->data;
+
+    printk(XENLOG_INFO "Found PCI host bridge %s compatible:%s \n",
+            dt_node_full_name(dev), of_id->compatible);
+
+    return pci_host_common_probe(dev, ops);
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
+.dt_match = gen_pci_dt_match,
+.init = gen_pci_dt_init,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
new file mode 100644
index 0000000000..f8cbb99591
--- /dev/null
+++ b/xen/arch/arm/pci/pci.c
@@ -0,0 +1,112 @@
+/*
+ * Copyright (C) 2020 Arm Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <xen/param.h>
+
+static int __init dt_pci_init(void)
+{
+    struct dt_device_node *np;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc = device_init(np, DEVICE_PCI, NULL);
+        if( !rc )
+            continue;
+        /*
+         * Ignore the following error codes:
+         *   - EBADF: Indicate the current is not an pci
+         *   - ENODEV: The pci device is not present or cannot be used by
+         *     Xen.
+         */
+        else if ( rc != -EBADF && rc != -ENODEV )
+        {
+            printk(XENLOG_ERR "No driver found in XEN or driver init error.\n");
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
+#ifdef CONFIG_ACPI
+static void __init acpi_pci_init(void)
+{
+    printk(XENLOG_ERR "ACPI pci init not supported \n");
+    return;
+}
+#else
+static inline void __init acpi_pci_init(void) { }
+#endif
+
+static bool __initdata param_pci_enable;
+static int __init parse_pci_param(const char *arg)
+{
+    if ( !arg )
+    {
+        param_pci_enable = false;
+        return 0;
+    }
+
+    switch ( parse_bool(arg, NULL) )
+    {
+        case 0:
+            param_pci_enable = false;
+            return 0;
+        case 1:
+            param_pci_enable = true;
+            return 0;
+    }
+
+    return -EINVAL;
+}
+custom_param("pci", parse_pci_param);
+
+void __init pci_init(void)
+{
+    /*
+     * Enable PCI when has been enabled explicitly (pci=on)
+     */
+    if ( !param_pci_enable)
+        goto disable;
+
+    if ( acpi_disabled )
+        dt_pci_init();
+    else
+        acpi_pci_init();
+
+#ifdef CONFIG_HAS_PCI
+    pci_segments_init();
+#endif
+
+disable:
+    return;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..2d7f1db44f 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -930,6 +930,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_virt_paging();
 
+    pci_init();
+
     do_initcalls();
 
     /*
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index ee7cff2d44..28f8049cfd 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -4,6 +4,7 @@
 enum device_type
 {
     DEV_DT,
+    DEV_PCI,
 };
 
 struct dev_archdata {
@@ -25,15 +26,15 @@ typedef struct device device_t;
 
 #include <xen/device_tree.h>
 
-/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
-#define dev_is_pci(dev) ((void)(dev), 0)
-#define dev_is_dt(dev)  ((dev->type == DEV_DT)
+#define dev_is_pci(dev) (dev->type == DEV_PCI)
+#define dev_is_dt(dev)  (dev->type == DEV_DT)
 
 enum device_class
 {
     DEVICE_SERIAL,
     DEVICE_IOMMU,
     DEVICE_GIC,
+    DEVICE_PCI,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index de13359f65..94fd00360a 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -1,7 +1,98 @@
-#ifndef __X86_PCI_H__
-#define __X86_PCI_H__
+/*
+ * Copyright (C) 2020 Arm Ltd.
+ *
+ * Based on Linux drivers/pci/ecam.c
+ * Copyright 2016 Broadcom.
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
 
+#ifndef __ARM_PCI_H__
+#define __ARM_PCI_H__
+
+#include <xen/pci.h>
+#include <xen/device_tree.h>
+#include <asm/device.h>
+
+#ifdef CONFIG_ARM_PCI
+
+/* Arch pci dev struct */
 struct arch_pci_dev {
+    struct device dev;
+};
+
+#define PRI_pci "%04x:%02x:%02x.%u"
+#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
+
+/*
+ * struct to hold the mappings of a config space window. This
+ * is expected to be used as sysdata for PCI controllers that
+ * use ECAM.
+ */
+struct pci_config_window {
+    paddr_t     phys_addr;
+    paddr_t     size;
+    uint8_t     busn_start;
+    uint8_t     busn_end;
+    struct pci_ecam_ops     *ops;
+    void __iomem        *win;
+};
+
+/* Forward declaration as pci_host_bridge and pci_ops depend on each other. */
+struct pci_host_bridge;
+
+struct pci_ops {
+    int (*read)(struct pci_host_bridge *bridge,
+                    uint32_t sbdf, int where, int size, u32 *val);
+    int (*write)(struct pci_host_bridge *bridge,
+                    uint32_t sbdf, int where, int size, u32 val);
+};
+
+/*
+ * struct to hold pci ops and bus shift of the config window
+ * for a PCI controller.
+ */
+struct pci_ecam_ops {
+    unsigned int            bus_shift;
+    struct pci_ops          pci_ops;
+    int             (*init)(struct pci_config_window *);
+};
+
+/*
+ * struct to hold pci host bridge information
+ * for a PCI controller.
+ */
+struct pci_host_bridge {
+    struct dt_device_node *dt_node;  /* Pointer to the associated DT node */
+    struct list_head node;           /* Node in list of host bridges */
+    uint16_t segment;                /* Segment number */
+    void *sysdata;                   /* Pointer to the config space window*/
+    const struct pci_ops *ops;
 };
 
-#endif /* __X86_PCI_H__ */
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
+
+int pci_host_common_probe(struct dt_device_node *dev,
+                struct pci_ecam_ops *ops);
+
+void pci_init(void);
+
+#else   /*!CONFIG_ARM_PCI*/
+struct arch_pci_dev { };
+static inline void  pci_init(void) { }
+#endif  /*!CONFIG_ARM_PCI*/
+#endif /* __ARM_PCI_H__ */
-- 
2.17.1


