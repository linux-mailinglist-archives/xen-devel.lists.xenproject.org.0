Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E47415E25
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193980.345640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfe-0001M7-IM; Thu, 23 Sep 2021 12:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193980.345640; Thu, 23 Sep 2021 12:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfe-0001EX-A5; Thu, 23 Sep 2021 12:17:46 +0000
Received: by outflank-mailman (input) for mailman id 193980;
 Thu, 23 Sep 2021 12:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNWd-0005KP-7i
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 117f061d-c305-4d4d-b62c-bcfa36765019;
 Thu, 23 Sep 2021 12:04:53 +0000 (UTC)
Received: from AS9PR06CA0340.eurprd06.prod.outlook.com (2603:10a6:20b:466::35)
 by AM0PR08MB3762.eurprd08.prod.outlook.com (2603:10a6:208:100::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:04:51 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::aa) by AS9PR06CA0340.outlook.office365.com
 (2603:10a6:20b:466::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:51 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 12:04:49 +0000
Received: from 9a5a85aa1274.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0ADA806-D352-4668-A05A-41F79A4AF1E2.1; 
 Thu, 23 Sep 2021 12:04:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a5a85aa1274.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:37 +0000
Received: from AS9PR06CA0099.eurprd06.prod.outlook.com (2603:10a6:20b:465::34)
 by DB6PR08MB2837.eurprd08.prod.outlook.com (2603:10a6:6:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 12:04:35 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::16) by AS9PR06CA0099.outlook.office365.com
 (2603:10a6:20b:465::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:35 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:13 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:11 +0000
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
X-Inumbo-ID: 117f061d-c305-4d4d-b62c-bcfa36765019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSRPuHv3is6t7XfRKDtZ5lXIpe0r3zEXCQvXK2ZgwaU=;
 b=i+2MFZIKCPnC3jksxYDTfeUSsWSDDWs+TMTXiGQKJyx4PKDegyugKfBbqc63vT9cleJfr5r3rfAe1tGd9Ku5MqVIhwJCpJXfetJBxKb/SBbLWJq2PTHmKYqXbStvfuny++1/8v+bpdv9bQe0X/e6AwIzu2pYOUNjhZvPoDYfy0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35a3dcabb8d82fd6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Umpeg/t8Y7NsxzwY1dW0o1HvlMne95z94TyxFZBfJ48dF56YeG2/Ktxi7gu1hhu1a3Uus4zsHIwiQHGh9tv+Zo5VEH9c6sNsSE62rtI1arV/pgHz/xwJ3HNiLKBLW42N4j8XJ54QtoPSUTL3vVaJFNtPIXiRn8IVQo0l96Ha6aPp47IzRlHP5dLlBlxRCQT+B2LnGofroPKCzjQ5Z9tyRWw9gEHqzaSNCoBbnkkOYoAJhl30uiRSusMb+0zwDsMQs1wTIpBb63Yt3iNaGpSh3enmYqml+9gmZWaiToQ9nlFkN0DRfEVpMRpYp/yTDFRopDsY4U5YLYDY935IcY8OfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oSRPuHv3is6t7XfRKDtZ5lXIpe0r3zEXCQvXK2ZgwaU=;
 b=NzPYeHr5zVoNvXoM10dqNFZlWt+fVSI/IBUEax6bEKvNXfUqjdUQL0RpFENnmFtlpmrT7eSg+/9NWopx+sjjn7XK57NfTgFhdUofJfqtaqDtV+F662nlvkOOLhHwJFpT3L8ejRIHW5K6q5iZLb+Zx/I8Sw3yisOQVOodlJt6k99Ogj8tq0uI4I0TLyN6oMrSbJVns7efHB1I10iwMD/v0eAgLp5N3Rxg3u/GyBuR8+RrZJnQP123ceXZkczQSmKqnZERJofdr/vjmBQOA3bR4rbAvBx234QNGFVFpmYI7TP4fm9njzrKSUH2BadKhCmKzdF9tm81Yv4V7NVfIvE7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSRPuHv3is6t7XfRKDtZ5lXIpe0r3zEXCQvXK2ZgwaU=;
 b=i+2MFZIKCPnC3jksxYDTfeUSsWSDDWs+TMTXiGQKJyx4PKDegyugKfBbqc63vT9cleJfr5r3rfAe1tGd9Ku5MqVIhwJCpJXfetJBxKb/SBbLWJq2PTHmKYqXbStvfuny++1/8v+bpdv9bQe0X/e6AwIzu2pYOUNjhZvPoDYfy0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 29/37] xen/arm: introduce a helper to parse device tree processor node
Date: Thu, 23 Sep 2021 20:02:28 +0800
Message-ID: <20210923120236.3692135-30-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f731d929-9509-4fd5-4de6-08d97e8a58e5
X-MS-TrafficTypeDiagnostic: DB6PR08MB2837:|AM0PR08MB3762:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3762CA6623A477745C29DB119EA39@AM0PR08MB3762.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4XpKmFZYp9OJloY0jEYrHDi13BYRQOtMsSkFUIzRbyhq9kQtdLFd+M5F0kyKmkxMBFOqTYViCIeD7hG+6CGVYJJlrgMeFhQPg2pYo7LvX2fsN7RtAVWjnSj/bSlYKFMya1ZNqkQo0eJcgR/Br1veP8Ok/nXiPDnh3OrfYNHiryJ20sfwqOoue1NFz06/ForN7eZ8sXxnLPZdG6lYbJi2r7FBU5YBDa6rYnoPt6r4cNO7P7MdcXaYMWjh1MnR2u5JG5CY1GfygyM5YfmRNK8iemlzw87SxuIO/1R9GUBgke5DW77lnLNCCrCX7H5BooMbskP5pcb6NLoR7Y/GxdHnjU1fWrvm7ePPXKhDzZo+q06UzM9VNfKWwHDQGBpbdIo6Xvj50ciuPoz5BrtmkmDlfmVrgmehLAbOIUggRuJORhB7hT6yTZ6SHI0YbTuY+OKj3T77yBnsmQX4nJHmuVnGHhyE7EPCPQAO6XWra2LVQF90guX244oA7fmxkVAys5jeWmwYsXi/nkL0OxKlvheXekAuYHvVXNHED/fYUgL2u68a86plQCtVx263MdWElQ9CPo1rm7vI9jKz20IK1UT1YMYmRD9SkicOpXmoMR6dM6RXi5uEIwpER/4nvxaOIVaYpd3koJiIU1WQnwPeyfptf9VCASlIrTTUtYONOQ12YU1e4cRHQ57UWb2ghDMDJb1sYS8MSARIdShENLTKUQ6XtxL6MV6mm2fG+/8uL9QnJkmlyzmJB4O8gRaGhK7jUg1ZKIYBtAdOWoby1p5IiPcXc+Q1tS3PlzGs2/dJuyI1AVG+zw9BMcSuTkKZ1gPZtTh0bqu5kY8mySAm8I1dkxhlZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(81166007)(1076003)(7696005)(6666004)(36860700001)(316002)(186003)(110136005)(336012)(86362001)(36756003)(82310400003)(2616005)(426003)(508600001)(2906002)(44832011)(8676002)(70586007)(47076005)(70206006)(26005)(4326008)(8936002)(5660300002)(83380400001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2837
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97ae4213-0ad6-4049-1089-08d97e8a4f99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LBgkHJCzstKdOkbo4DSaxD2ubk79BzuD51XflmWJAwySzt/tJ71WKLivETk7uBQVD5uhseaiRsNoiHWE1E1xQJc1de/l6xh088P4Asec+XLEldh6ODSyoRXdp23Jc5w5uvhjO3/NQ+E58odz5byogcOfRWqINHmKbXHC2BIfMg1gcpcJNkIBHiCSMVfPuJsPattf/DBTi6XebZXQND8Qyawx3+/lsXgMNV7oJRaf6zMX0m8x3+C2DpWzL/jt5AjTunHNJTFh4eFZ8Pr8rdeDCbZf4MyKohzMUKnL2RRhQ7l77oYNC6+qBXkE7jJ0zNSPr8SNOBP/TRqGxEy41QmeM1Q6Cx7UQ47BljXBQ4S7yOM4K6fYwcYBHz5oua2fQiydrhQzqAeplaUSePa078JwmC2suWQV08yIVOhtVuLovGBXLVSO6QWNLpnzm8s8Xdo/8rP1P/pcX7gg83t5x6kiKF/3wBoizJibBwMICFZqmFL5UVdydO6KLXrlzHxgawyx7of5/vE5T9C2XwhiO5M61EXwGpUeLf78eRt5uY7m51AEJBJXyDkSToLei0JVgDGqv9J1c0cdTNf8fmPHyH79jjiTYqZ19RP6YmzWUQKV9TWCrBgMtifwtH07bgadgQ5PnQcgDsT+FNxTocGRPEJ/HBLeoISPL/zKk/Mv2B20QBSazy6KSb3R+wyX6KjN9xx4EoLpMV6BUtNCNCoC3TQ1zK8g6OyDcMn+UdpoDl8pWtGD7QcN5/4TjjABz2h1fSYfh4Tvvoca/VCGPNuB98MHRIEbne0u6u9fINrLoudJYS3Pj7aHti3BTgtcrPpIgda+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(70586007)(4326008)(316002)(82310400003)(7696005)(2906002)(110136005)(44832011)(508600001)(186003)(8936002)(86362001)(81166007)(1076003)(2616005)(36756003)(5660300002)(8676002)(26005)(6666004)(36860700001)(47076005)(336012)(83380400001)(426003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:51.0565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f731d929-9509-4fd5-4de6-08d97e8a58e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3762

Processor NUMA ID information is stored in device tree's processor
node as "numa-node-id". We need a new helper to parse this ID from
processor node. If we get this ID from processor node, this ID's
validity still need to be checked. Once we got a invalid NUMA ID
from any processor node, the device tree will be marked as NUMA
information invalid.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/numa_device_tree.c | 58 +++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 xen/arch/arm/numa_device_tree.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 41ca311b6b..c50df2c25d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -36,6 +36,7 @@ obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa_device_tree.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
new file mode 100644
index 0000000000..2428fbae0b
--- /dev/null
+++ b/xen/arch/arm/numa_device_tree.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Arm Architecture support layer for NUMA.
+ *
+ * Copyright (C) 2021 Arm Ltd
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
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/device_tree.h>
+
+/* Callback for device tree processor affinity */
+static int __init fdt_numa_processor_affinity_init(nodeid_t node)
+{
+    if ( srat_disabled() )
+        return -EINVAL;
+    else if ( node == NUMA_NO_NODE || node >= MAX_NUMNODES )
+    {
+        bad_srat();
+        return -EINVAL;
+	}
+
+    numa_set_processor_nodes_parsed(node);
+    fw_numa = 1;
+
+    printk(KERN_INFO "DT: NUMA node %"PRIu8" processor parsed\n", node);
+
+    return 0;
+}
+
+/* Parse CPU NUMA node info */
+static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
+{
+    uint32_t nid;
+
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
+    if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_ERR "Node id %u exceeds maximum value\n", nid);
+        return -EINVAL;
+    }
+
+    return fdt_numa_processor_affinity_init(nid);
+}
-- 
2.25.1


