Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D374022B2B5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydKw-00056K-J7; Thu, 23 Jul 2020 15:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJck=BC=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jydKv-00056E-Ix
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:40:45 +0000
X-Inumbo-ID: ddbf2d22-ccfa-11ea-873e-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.66]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddbf2d22-ccfa-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtXKQEmKNjdCjhdq8ucgvNPIQLHD6guIeLAAonP1+9k=;
 b=dQJ+G4REhbzxIPd+8mAlVfqzQXg7Is88J6ECMFwWDinJVrHUxK0ERZpsdO/QRCq91vy/KnghD/8GWOD6J6Ofm8irS1VVMBuybEBmx9aijERLGxIvjFz4L3GWUKA3e/iroc+6Br65dzFk7ZwfohmsnVafdnICXaSuJgyg7D6hrL8=
Received: from AM5PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:203:90::26) by AM6PR08MB3720.eurprd08.prod.outlook.com
 (2603:10a6:20b:8f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 23 Jul
 2020 15:40:40 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::4e) by AM5PR0402CA0016.outlook.office365.com
 (2603:10a6:203:90::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Thu, 23 Jul 2020 15:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 15:40:40 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Thu, 23 Jul 2020 15:40:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca370f21c0ea2171
X-CR-MTA-TID: 64aa7808
Received: from ad811b610fbf.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CBECA01-FB0A-4209-B243-03FEA6F29218.1; 
 Thu, 23 Jul 2020 15:40:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad811b610fbf.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jul 2020 15:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKnOrL9mAMiQHrzOPAYcjpNzfUk4NORaDHTuCLtomUsuIdIuSuSWEbDzn78Za/BHYjk5CWEomyhZBnVw6YZxuHM8Kl/GELCWUvfGwfUMeqvUCEY6EEvkpnTMGM7klRjkFSEwkiAMC7S41QoUm551+8t6jepVTaW6BreJcbvKnT+OMTymiZiua/u4TISfAFmYzAvAyvOI43sMCf2NDvwqWz92qFbLHcR3YNKpr2D4gwZuSk78NjvICX9AttZgSJIaMeeRWYL+v1tcvXWF0nG6rEZkwvcZNFCvwXcF7XNXq5DP9+1gQkvTIK738MOw13U/TDTT5CZVCx8dyJPXyFYIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtXKQEmKNjdCjhdq8ucgvNPIQLHD6guIeLAAonP1+9k=;
 b=bnMVeMqFOBcBwDvKMw6m387+j5c+zg6qxeL/lLbhjwC0vvTBZv3jQSCuwd2R6eoV/+Ki5B48cvolJ2Av2z6Rjk9xNPbS4q51bei4maHA2b8WQgPPjDnblw4Zr0dbky2n03ZIqFYPZPpvFBgzDUMDekarrHmPipyc+GiwntiQ1jFePqkQQ6wVcbs3dInU84ssGkV8xP8+1CQV2hTsoZMrm9kLd+7t3xBoLBjej4Bxlqm67GdlrQRc7NnIVggQXnPkwEwHQTSKn4by5YniITK6GMujGINd/82ctMlo8PtpiRakYoHl5m5NjhmeJOg/miPSKkvbaZiHfBrjbgSBnv65pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtXKQEmKNjdCjhdq8ucgvNPIQLHD6guIeLAAonP1+9k=;
 b=dQJ+G4REhbzxIPd+8mAlVfqzQXg7Is88J6ECMFwWDinJVrHUxK0ERZpsdO/QRCq91vy/KnghD/8GWOD6J6Ofm8irS1VVMBuybEBmx9aijERLGxIvjFz4L3GWUKA3e/iroc+6Br65dzFk7ZwfohmsnVafdnICXaSuJgyg7D6hrL8=
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
Subject: [RFC PATCH v1 3/4] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Date: Thu, 23 Jul 2020 16:40:23 +0100
Message-Id: <c719ed8e92720d0b470a130c1264f8296dac32ac.1595511416.git.rahul.singh@arm.com>
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
 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 15:40:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d689e4e6-629c-4367-b69c-08d82f1ec0ed
X-MS-TrafficTypeDiagnostic: AM6PR08MB4439:|AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720984070785AF6CA0BDD20FC760@AM6PR08MB3720.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: twxUAxnDELd1QEoToMFx19uDgbqmR6cSGZsKMUUcSsoWBTSxFEuXJmK2iZ0TOvH63QVEjoL+YxwLMlhcDvi5Cqq4NAG7mH4HCt1iJN+rBSZJeRRedTpvCOLOQ7xuwE6xTYFnitC4ouR/96EnGu9xjaEm9t15f2BvE9bph3cXJWBIkaeCOCsECGphksVMMQy1dN+u7WFM3X+ScEoUbVW5yRkzIq5WSm3CjTr02BFKAvP2n9BoeID2+RfdwtjYp9VKqm0Xm+xQfu0av9aO1tJJO+LU0LupmXSUKcbQc5nnRz8Vl+GJL17a0RkXu1+OlXuMHRuOYxz+aMqNRAmrWkJ8igHfaR2SmJKwD9zoM3q8QgSaI/N8362n0EhdkPNvwSTa9K8SSiZ48C5Y+niR0tYPig==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(8676002)(26005)(6512007)(2616005)(316002)(54906003)(6666004)(6506007)(66946007)(4326008)(6486002)(956004)(36756003)(86362001)(6916009)(44832011)(8936002)(186003)(16526019)(478600001)(5660300002)(52116002)(83380400001)(66556008)(66476007)(2906002)(2004002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: VR4zt7JlXihk55B+yimqS+HoPNH8z1eqW8D4Y+NSqFQp+YQNEAmA0boS9FQi4RZoY7Ao6ArnkK+cXne1C68Ba1vqu2ZQIL6rH9PeduMDipbI8gtJZgTwFbLLvUn21lsTWRTa6jJml/76/yXrF1+53kpMH6C9WNt8jGOYD2xXoJ4RSHghJ3xAbpTzubhOrRmizbaPxy6yfy8pEpqso5fRVH3EeRkE7vUBwNwX+6YPDp/VLilLzWNOihbqP0kQo6LcSorhnUF2/GzgEua0RtD3HnbYXVBk10JMU8Zo4YLh6cWFubLSZPAUElNKTjIw7Hz55E/fZadVhfogNFvOqheiUxRK4MTY7yE8+8FnsqVwnB4FNDZwc322mzPU/Ll82EEBQ875FKDFwvRfK0+uYV5KMbRwtkbDcDFWa8y11NuFQaloASKxtqS56n2GNadjYC/byrpeLZWzMRNAi07XY5R7YWtJoBrvb8CFNC6pavrommXcQNsvxn66MvwAhnZhISyK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4439
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ed81a51-0ba3-4faf-0d63-08d82f1ebcd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wke04LIe2H6RUlAisrw8zc7WwCxVHAVH+HHFEanbqmDct8atz/Una7g5WGyO65VbtSdrqczqjMf71KEUcvWAiyZB6B4Ga/1mC5OZzgVpJe2kTMrZgED/6YDhHszuBtgrDcf+IFpORoywn7VlAp9xmX+aBYGkEl8zmqnIk98x9ZGbJZhGUB4S5ZR74tdnmloP/6pCK7l1TvJX/4smHJwGBFIlINEKozcinu2eQc1+zdrmSad43y4roTWRrfkX3qGsTwyrRMDiSmxSy8gVL2s2vYe+A+H4nuWASG/0Y+MjKLMouiyW42YXxLRgREf4qbcNuXqIPK9flC+PjTfgOaVlrrMW+ktSGbEIUn24fnxeFuZhqfizCrdInYde17bKpAzdJ6d2aZVlrqWKxqr7C86peHY2EFoWcAjDpY/GQ2nY7JcVUpsY1FhkQUcIFZIBr/Et
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(44832011)(70206006)(70586007)(478600001)(4326008)(956004)(336012)(5660300002)(36906005)(2616005)(54906003)(316002)(36756003)(86362001)(8936002)(81166007)(6666004)(6512007)(82310400002)(2906002)(6916009)(6486002)(16526019)(47076004)(82740400003)(186003)(356005)(8676002)(6506007)(83380400001)(26005)(136400200001)(2004002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 15:40:40.4504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d689e4e6-629c-4367-b69c-08d82f1ec0ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
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
 Paul Durrant <paul@xen.org>, Bertrand.Marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The existing VPCI support available for X86 is adapted for Arm.
When the device is added to XEN via the hyper call
“PHYSDEVOP_pci_device_add”, VPCI handler for the config space
access is added to the PCI device to emulate the PCI devices.

A MMIO trap handler for the PCI ECAM space is registered in XEN
so that when guest is trying to access the PCI config space,XEN
will trap the access and emulate read/write using the VPCI and
not the real PCI hardware.

VPCI MSI support is disable for ARM as it is not tested on ARM.

Change-Id: I5501db2781f8064640403fecce53713091cd9ab4
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/Makefile         |   1 +
 xen/arch/arm/domain.c         |   4 ++
 xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/vpci.h           |  37 ++++++++++++
 xen/drivers/passthrough/pci.c |   7 +++
 xen/include/asm-arm/domain.h  |   5 ++
 xen/include/public/arch-arm.h |   4 ++
 7 files changed, 160 insertions(+)
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 345cb83eed..5a23ec5cc0 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -7,6 +7,7 @@ obj-y += platforms/
 endif
 obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_ARM_PCI) += pci/
+obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 31169326b2..23098ffd02 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -39,6 +39,7 @@
 #include <asm/vtimer.h>
 
 #include "vuart.h"
+#include "vpci.h"
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
@@ -747,6 +748,9 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
         goto fail;
 
+    if ( (rc = domain_vpci_init(d)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
new file mode 100644
index 0000000000..49e473ab0d
--- /dev/null
+++ b/xen/arch/arm/vpci.c
@@ -0,0 +1,102 @@
+/*
+ * xen/arch/arm/vpci.c
+ * Copyright (c) 2020 Arm Ltd.
+ *
+ * Based on arch/x86/hvm/io.c
+ * Copyright (c) 2004, Intel Corporation.
+ * Copyright (c) 2005, International Business Machines Corporation.
+ * Copyright (c) 2008, Citrix Systems, Inc.
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <xen/sched.h>
+#include <asm/mmio.h>
+
+/* Do some sanity checks. */
+static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
+{
+    /* Check access size. */
+    if ( len != 1 && len != 2 && len != 4 && len != 8 )
+        return false;
+
+    /* Check that access is size aligned. */
+    if ( (reg & (len - 1)) )
+        return false;
+
+    return true;
+}
+
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
+        register_t *r, void *priv)
+{
+    unsigned int reg;
+    pci_sbdf_t sbdf;
+    uint32_t data = 0;
+    unsigned int size = 1U << info->dabt.size;
+
+    sbdf.bdf = (((info->gpa) & 0x0ffff000) >> 12);
+    reg = (((info->gpa) & 0x00000ffc) | (info->gpa & 3));
+
+    if ( !vpci_mmio_access_allowed(reg, size) )
+        return 1;
+
+    data = vpci_read(sbdf, reg, size);
+
+    memcpy(r, &data, size);
+
+    return 1;
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
+        register_t r, void *priv)
+{
+    unsigned int reg;
+    pci_sbdf_t sbdf;
+    uint32_t data = r;
+    unsigned int size = 1U << info->dabt.size;
+
+    sbdf.bdf = (((info->gpa) & 0x0ffff000) >> 12);
+    reg = (((info->gpa) & 0x00000ffc) | (info->gpa & 3));
+
+    if ( !vpci_mmio_access_allowed(reg, size) )
+        return 1;
+
+    vpci_write(sbdf, reg, size, data);
+
+    return 1;
+}
+
+static const struct mmio_handler_ops vpci_mmio_handler = {
+    .read  = vpci_mmio_read,
+    .write = vpci_mmio_write,
+};
+
+int domain_vpci_init(struct domain *d)
+{
+    if ( !has_vpci(d) || is_hardware_domain(d) )
+        return 0;
+
+    register_mmio_handler(d, &vpci_mmio_handler,
+            GUEST_VPCI_ECAM_BASE,GUEST_VPCI_ECAM_SIZE,NULL);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
new file mode 100644
index 0000000000..20dce1f4c4
--- /dev/null
+++ b/xen/arch/arm/vpci.h
@@ -0,0 +1,37 @@
+/*
+ * xen/arch/arm/vpci.h
+ * Copyright (c) 2020 Arm Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __ARCH_ARM_VPCI_H__
+#define __ARCH_ARM_VPCI_H__
+
+#ifdef CONFIG_HAS_VPCI
+int domain_vpci_init(struct domain *d);
+#else
+static inline int domain_vpci_init(struct domain *d)
+{
+    return 0;
+}
+#endif
+
+#endif /* __ARCH_ARM_VPCI_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5846978890..28511eb641 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -804,6 +804,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         iommu_enable_device(pdev);
 
+#ifdef CONFIG_ARM
+    ret = vpci_add_handlers(pdev);
+    if ( ret ) {
+        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
+        goto out;
+    }
+#endif
     pci_enable_acs(pdev);
 
 out:
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 4e2f582006..ad70610226 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -34,6 +34,11 @@ enum domain_type {
 /* The hardware domain has always its memory direct mapped. */
 #define is_domain_direct_mapped(d) ((d) == hardware_domain)
 
+/* For X86 VPCI is enabled and tested for PVH DOM0 only but
+ * for ARM we enable support VPCI for guest domain also.
+ */
+#define has_vpci(d) (true)
+
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c365b1b39e..7364a07362 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -422,6 +422,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
 #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
 
+/* VPCI ECAM mappings */
+#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
+#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
+
 /*
  * 16MB == 4096 pages reserved for guest to use as a region to map its
  * grant table in.
-- 
2.17.1


