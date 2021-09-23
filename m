Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04E415E1B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193959.345589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfG-0007HU-QI; Thu, 23 Sep 2021 12:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193959.345589; Thu, 23 Sep 2021 12:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfG-0007C3-Mo; Thu, 23 Sep 2021 12:17:22 +0000
Received: by outflank-mailman (input) for mailman id 193959;
 Thu, 23 Sep 2021 12:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNWY-0005KP-7Q
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 763e903f-e63c-4fdd-ad36-f687d916c203;
 Thu, 23 Sep 2021 12:04:52 +0000 (UTC)
Received: from AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19)
 by DB7PR08MB4219.eurprd08.prod.outlook.com (2603:10a6:10:34::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:50 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ac:cafe::e6) by AM0PR07CA0006.outlook.office365.com
 (2603:10a6:208:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:50 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Thu, 23 Sep 2021 12:04:49 +0000
Received: from 6a4a37fc73d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAF65ACB-7FF1-43C9-93F8-7DF9683493FB.1; 
 Thu, 23 Sep 2021 12:04:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a4a37fc73d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:41 +0000
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by PAXPR08MB7187.eurprd08.prod.outlook.com (2603:10a6:102:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:40 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::a9) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:40 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:40 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:20 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:04:18 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:18 +0000
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
X-Inumbo-ID: 763e903f-e63c-4fdd-ad36-f687d916c203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Uy52E7uZCYgh1DxgAv2AGcqP59JVjmgUIyI38scwW0=;
 b=boAtcNAaol8Owam3CPCcBG6TXy7Pdcnsct5SYv/1A9wDlPRGKM2txYwrEtZnm1TAI+RbDT/v1qwUMKZ9eUCUBYWs7rDua14VappPdVm+/n+RufBH+CYd0tLTnaf9kvRNuXBKuL8hOrB34jSsltBuRvCNZ7y4twBIag3hgTaHebU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9018c8cdcaaecb1f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjcsaJdjsQluXeD75CTF/v8sr0LRGFljDEWIYaJ6+VHxpYnBxByxpa9AptaOpnjVocUt9i+5bJDVn+vFIgA56Tlr4uQzFOVuYLaZK0zZZKRlyTEkRlGr1ECRzZt4/3e68HgIwOkDvYNmHVSAE0XwGu7VueDUXjPnnkU2IBrcfzrRqa0zafcOi1Ihqx8xaSHlIFzTE5O030V+KKIz4yyp5DDf3kkC6CjfzOHxJUSMIHc+LQ6fdYHYE3e9+g1F8nzD/kd/dskFapcsWB14C6W+CTVLiIK3ZZzo0nMzxxND4m/HnBQM/q3HQhZARxy6Fd3AhsNeIdLVCM+aQ0IvoEf6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/Uy52E7uZCYgh1DxgAv2AGcqP59JVjmgUIyI38scwW0=;
 b=gKPiSHe4B/QGe1oWddpxjfk4L7U4g/jMKtAhblCOf0l3oo6UV1rIQ+crjQfyjtNk/Jw+DpUnunTETYcdMpSNVzjVNGFzLVTdKBCbPu9Xl/uh35a8octOhVzHZyqbeJkajJmWBBagwEHpC+NvK8+UnBKjG7wUowf3tez6YYaILJxjjdiOera6rC87C2muTDveimR4yHDtb2iMPzXSlq0T9Hu2ag+sEVExJcMZt/6AqMlI0QYNIlc/QFZjBcIwT29giD9kT1qNMuPr7YaN+R98IIJG1COno1c9fALpwyoh3ES7rCHObAyIiyDJ/f4O/0I7plnD+AS7Uc15JOSNjXZNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Uy52E7uZCYgh1DxgAv2AGcqP59JVjmgUIyI38scwW0=;
 b=boAtcNAaol8Owam3CPCcBG6TXy7Pdcnsct5SYv/1A9wDlPRGKM2txYwrEtZnm1TAI+RbDT/v1qwUMKZ9eUCUBYWs7rDua14VappPdVm+/n+RufBH+CYd0tLTnaf9kvRNuXBKuL8hOrB34jSsltBuRvCNZ7y4twBIag3hgTaHebU=
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
Subject: [PATCH 32/37] xen/arm: unified entry to parse all NUMA data from device tree
Date: Thu, 23 Sep 2021 20:02:31 +0800
Message-ID: <20210923120236.3692135-33-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0deb3f8-9145-4d00-f441-08d97e8a5896
X-MS-TrafficTypeDiagnostic: PAXPR08MB7187:|DB7PR08MB4219:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB4219C193E81EB523CCABF8DC9EA39@DB7PR08MB4219.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /XyZspcenSR+Xfp/bqrbh8RJhaBTqQIxeIXfbOEXA18fWLrHld2s7bm6jQH85duPf3O7OTBe+VkabINbquY35zYYMpN4v1fz2RbfwzBusOC2a2VU+taIsNtPTIun9lgJHNirlrx/y+bFwmzeyrtbvQExnhZgwJMie+7H30NBveONWyveLy1J3tsEiezkwLNpgJeeQm2jN86emK8yzO6BqN6Xz+X7LRGczfEABK2WsOgJwuj4DyTzmzJ3hjgDSOU3EgJMRP+zyXzNuB1qjpRWJxppM9rlLfRnJZ/pXpyIM8jPDcPs2d53yjH8PmlRo1qXIBTO39e65fRaUz8IRzDIhVDihrIUQxXw8KHb6yhqOUhMYjBAA7DlIBj7LQpigu/BQZ2Ea/I5qSleXeBU7T9j8X8L2jU+hjwh5XzzVQWgAMz+vrVxLhPdaDp/NFGykfk/krAHVsP0iYOZ+/2Z/prz6WSYuCUkbKRQdr4YXokwoQJvGS8N6mk/l86moDCyTU4dvq0MIjo6WI5B6EBy4h4Lu3hdiHtpAJiGu7ddo4fm1LctjaHY2FugzuNoGkVVmWqaxptLw5gRBa9Jfs20gLc6oOvAiiEXFWJAa1w9yIUbAUbf4YoTWM1g6DNRCWtF+svpYERApK+Am94UpfQ6YC9GTutWmLUVDSQ59bh2cUTgXeRvLJYM6s4+qcLokQ6G2RwjwTuSw2uBGwpftGOqwyeB6be/Ttj6vIzhUR/OuF/NdEg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(110136005)(2616005)(1076003)(82310400003)(316002)(336012)(47076005)(81166007)(44832011)(70206006)(4326008)(70586007)(26005)(356005)(36860700001)(86362001)(8936002)(508600001)(83380400001)(5660300002)(2906002)(186003)(6666004)(8676002)(7696005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7187
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8b70389-a79a-4536-ebe1-08d97e8a5281
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+nuLdw1t/NfZzBnKYdvlWqFmM4OA2Hw1HnD8/QIx+SMu9csE3LTwvKgL5uSBfr/QG8vbXaHXKh5b28l3gO0zb0NsVuncN42hxyWsziD5sIiZ0/CQrzGDRT2EoHR/OaJobBYL69uU3e1HRsysAdDuDzsePffD2tFfBbiJBQVkXl87oKeWwrkSzDbNSPHhJ6XI/SNJ3KOE0rBw5zU/xs5lcXFekGQADxABXxSd3KR9jrC5IJrDslmnMyfmnwIsUy+4rjAFmZb1sQY+tUifgvo2SopWYPuPs28Lk9XzOnIgBD3bFRvbVUN35b2I7UpgP+Qg6VtmkdSFUlfYTNHUaS7NUwJBeN62mVIVj4BAnr4fDvKWaavNAxKvxfLIRDO9RQCKjL4o5sq7aE0JQHPjMHw2MTmbrgUvPGfGbJYno0udx1YLskWTrUYctqxybleJmAWdq8FrkqY9AwGTnSuoZDIhWeN7NV66YS4Tx6rWMQhX+EM/yhS7o/G2R8bxAdBtjA70Z6Trx6+WZva6inGkHhB9+OWolTLejbqXF9/2NdT7sU2U/BYGZyZ4vG0qW7fKf6VRf4qc+w0++gKJcFLGDkPqdFMEt4PG0rQtRmi/WxfS3XDF2Ktbh8/jEZRUyopfKlCRI1A2KOvWBA0WYE+sk9/NpyMgtxXPDma0epDTWLSuLE45CVo9NDiJHTcnY/xHgD53JmPysW3niWzSqr0SMhBdTA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(86362001)(508600001)(1076003)(316002)(110136005)(2616005)(5660300002)(8936002)(186003)(70586007)(36860700001)(4326008)(26005)(47076005)(336012)(6666004)(426003)(82310400003)(70206006)(83380400001)(36756003)(8676002)(81166007)(2906002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:50.5091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0deb3f8-9145-4d00-f441-08d97e8a5896
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4219

In this API, we scan whole device tree to parse CPU node id, memory
node id and distance-map. Though early_scan_node will invoke has a
handler to process memory nodes. If we want to parse memory node id
in this handler, we have to embeded NUMA parse code in this handler.
But we still need to scan whole device tree to find CPU NUMA id and
distance-map. In this case, we include memory NUMA id parse in this
API too. Another benefit is that we have a unique entry for device
tree NUMA data parse.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 30 ++++++++++++++++++++++++++++++
 xen/include/asm-arm/numa.h      |  1 +
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index e7fa84df4c..6a3fed0002 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -242,3 +242,33 @@ static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
 
     return 0;
 }
+
+static int __init fdt_scan_numa_nodes(const void *fdt,
+                int node, const char *uname, int depth,
+                u32 address_cells, u32 size_cells, void *data)
+{
+    int len, ret = 0;
+    const void *prop;
+
+    prop = fdt_getprop(fdt, node, "device_type", &len);
+    if (prop)
+    {
+        len += 1;
+        if ( memcmp(prop, "cpu", len) == 0 )
+            ret = fdt_parse_numa_cpu_node(fdt, node);
+        else if ( memcmp(prop, "memory", len) == 0 )
+            ret = fdt_parse_numa_memory_node(fdt, node, uname,
+                                address_cells, size_cells);
+    }
+    else if ( fdt_node_check_compatible(fdt, node,
+                                "numa-distance-map-v1") == 0 )
+        ret = fdt_parse_numa_distance_map_v1(fdt, node);
+
+    return ret;
+}
+
+/* Initialize NUMA from device tree */
+int __init numa_device_tree_init(const void *fdt)
+{
+    return device_tree_for_each_node(fdt, 0, fdt_scan_numa_nodes, NULL);
+}
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 7675012cb7..f46e8e2935 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -23,6 +23,7 @@ typedef u8 nodeid_t;
 #define NR_NODE_MEMBLKS NR_MEM_BANKS
 
 extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
+extern int numa_device_tree_init(const void *fdt);
 
 #else
 
-- 
2.25.1


