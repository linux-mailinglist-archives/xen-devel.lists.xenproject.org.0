Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF7415E18
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193941.345557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNf7-0005yO-IJ; Thu, 23 Sep 2021 12:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193941.345557; Thu, 23 Sep 2021 12:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNf7-0005wI-EA; Thu, 23 Sep 2021 12:17:13 +0000
Received: by outflank-mailman (input) for mailman id 193941;
 Thu, 23 Sep 2021 12:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNWn-0005KP-7z
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:37 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::600])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a96bdc96-c20a-417c-a929-905a94858260;
 Thu, 23 Sep 2021 12:04:55 +0000 (UTC)
Received: from DU2PR04CA0302.eurprd04.prod.outlook.com (2603:10a6:10:2b5::7)
 by PAXPR08MB6972.eurprd08.prod.outlook.com (2603:10a6:102:1dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:53 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::e9) by DU2PR04CA0302.outlook.office365.com
 (2603:10a6:10:2b5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:53 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 12:04:52 +0000
Received: from ab7004a01c82.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3592E839-A002-464C-8159-FF9022817EE6.1; 
 Thu, 23 Sep 2021 12:04:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab7004a01c82.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:40 +0000
Received: from AM6P191CA0091.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::32)
 by PR3PR08MB5673.eurprd08.prod.outlook.com (2603:10a6:102:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:04:39 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::12) by AM6P191CA0091.outlook.office365.com
 (2603:10a6:209:8a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:38 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:17 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:15 +0000
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
X-Inumbo-ID: a96bdc96-c20a-417c-a929-905a94858260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kwEsupYdQhcxT6kCZF4Bnp8YHcdU6oO4hBw9qhon1g=;
 b=CQ7Jq1j8gT8ZK7pXB3x91ubyuMcIOIRnhXX+yKhgtDStU6CH8CLJaTfRZE5SNHjj92B5jZfFtfJUaxHpJk/UY6OcjswrGfUv8oQNki/2L/qQxt8uuKdjNLW0ABaWmD2p197BEUJfAHNGLvDSvF0O5E+M+oK4H8TrboMP1GnJS3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e27c485cd25f70f0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnZqa6OQT2k3vrlzKVEv7/To8p1VmmTxzOw8Wgwh6hSunYTmygsOKj67nj/q28CCuJIxzxfZeMhlVGhxX2QnJLbH25O3LtYw0a8ZwldtuWC3qguUOJbSNjKEPMtlv2rnaZM+Z+eec1OTtDT6LJUMq/7R2+OrAvSYeXR4p1fV26/68pCixOc6HpMuMhmd+LIHp3CCz4web+ZMuOesCILWZLwG1y2m6OpxbmS7alwLi0Caj23QdIxS+7Nkukck2wX7KrP4gwWb9fzGNstYVv0/1EbhKus98mfaQ6S/CMxdWz9t6hxogbL3CpX7eec+OLcbF+xcffj/yZON5FanRvibaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2kwEsupYdQhcxT6kCZF4Bnp8YHcdU6oO4hBw9qhon1g=;
 b=kyK2/b3yxutn6cCOcOBP6ggt+VOVIrssm8bhfaaWXXsaN5HT3P4t8+ObcOcDlMPloM88FEUZE7sehpgV+Zo1YYfSWdLmROSOVNzWV2f5GXT6riYW/ahNjTw8bLQAHCzPiHkti+nUojN/2LexELtoe3BrY9/etG85XXtcYr5VA5Fen8iLtBJZkbg6fizeAODI3veXCf5+ScS7jqWU/K8HV8WLMI0dmIjjP4GXDQcRJ7JCCPIQEsdg9rU/OIDBsxhXsXbhXYA4dZo9wILyGYrLRLTknOGkylWGrKLyl6Z4rOG7G+JWVyDxgWzxj2j/e79Y2efT1qKb0nbwy8KU/V+rDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kwEsupYdQhcxT6kCZF4Bnp8YHcdU6oO4hBw9qhon1g=;
 b=CQ7Jq1j8gT8ZK7pXB3x91ubyuMcIOIRnhXX+yKhgtDStU6CH8CLJaTfRZE5SNHjj92B5jZfFtfJUaxHpJk/UY6OcjswrGfUv8oQNki/2L/qQxt8uuKdjNLW0ABaWmD2p197BEUJfAHNGLvDSvF0O5E+M+oK4H8TrboMP1GnJS3M=
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
Subject: [PATCH 31/37] xen/arm: introduce a helper to parse device tree NUMA distance map
Date: Thu, 23 Sep 2021 20:02:30 +0800
Message-ID: <20210923120236.3692135-32-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f60a024b-3763-4276-f705-08d97e8a5a1b
X-MS-TrafficTypeDiagnostic: PR3PR08MB5673:|PAXPR08MB6972:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6972941BA98DFCCB6C80AFC69EA39@PAXPR08MB6972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I7HRuwLqb6rxp113nJfoi+GL1LRBKvxeVSVq/fZ1HxCVCTFy4aiFmHZGmrrsXr7D1g/KYvUi9sg/hiRpB41FKIL4l8Ka0M8a/tTwLS6kUggbcalrRnhOovfYWsVwItdjS1N0I7YlUpuNNVa1HdwOuAIVz6rPtzIjc5/I21SlswpaGeHZrjDsXRXhaFqMV6ZV7tISy3aBtdIZ2NKRSVF57b031sR/9l+ao1SEQdAkB++H1SmqoTuoIOHkWZB9qFFEE4dtf/uCdB7y14K/97uQN5mBrFmqdXhXIevf+Qv6uqBjzQreWjuX9mE05H5LkdmNJRxQpB/LXkJfSYuybGYsuCIz7P4Ef9LertVbUyWRg683Ek26M6t7dEKczXf1rfGu69blrNcQ9Ed4h4n/pQibU/Rqu79pZbrS7VogUxXzqKIEVY2YpnnhBsy53ws9sawUimWzrMSBbCOS4aLeVU5mG2/ZUOk/T2VthAL30bjY8QJ97f2T22ccnz385v+kWhhIBiwX7CRUFSlqXDE17+ALBVS9m2kd7ixL1TdDcNe/EDXtec+hq9/z7KpDteVd1xpMSJnRLVbZf51xlWFUSJJVlcLDqT1It0sYfVIQSjLdGo66/9wjKOP3M1zolzZEp8N97ub/9BrmE64UT20Q6EOZ25TCN9yQnrDjQTbY0kEB5XyIjyCE9DrmcAQYph0BfZ5Dnd/B3xU8p4n6JkANcFXTJ4/uFDqDL0hiP/E9CDNxdTAlCR9BONBtHHFUAirwBkxaWCOKTr2pwxzjEQIQCZLuIFKx2tjq+ujRmPH43uYp6m0hevcYM2PU0arlmyOeWEov
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(5660300002)(316002)(110136005)(44832011)(1076003)(47076005)(508600001)(86362001)(81166007)(6666004)(82310400003)(7696005)(8936002)(26005)(70206006)(8676002)(966005)(70586007)(36860700001)(186003)(2616005)(356005)(83380400001)(336012)(426003)(4326008)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5673
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d6f7704-002a-44c8-68cd-08d97e8a517f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wrCUhuLO0lH7466nBb5yETRORbCbwEQvuoBGor/OFCRMkBZDcy1UIcUvSnRBJT5pYyTd+/XRiiqS2s7tX8xggjoA7gkjr/yWt8rzwZPmxWE0gCbItieodg+ToFdUZK1XtAKEHcqblGYfN3eIxsFdw1s5jD/NpxYO7cDL21DqfLT6QA3kfFjnnstw6hZN7joVL2cgJmelQibgwm2XH9W5+yeuKb8aOBc5nYkotvrk6/hjYe5qLgXAiT2u1jwNoHE+THFYXcsLJCs31itbX16qVrBuXyYlWEdUOmK/SojeJleUO+YWAFoW/Ec5Nicxzd/l9IHcVHzMHilSb6kXOobc4IPwnNZq0Jmg5vEX9nsCgkf8L+yssgPyARrPqvHgBr9dHMJLfsLUgKjADJ4yGQArkCjimmgOcDqT9/UocuMqqBtNyCtWI1xgtgRJvYPVk2eozYOIULdLxC/iNNswszWf9ATDgemYDOPi9Y+VpwgrJnzJqXPcndO9nc/s0f8ooELgAWLEPEGv+jOK55P+eelJeFDlb/JpDouaYxyRFBiPwBIXzABWBEO9SMy+fcdCmghvfLPt5jZsvUnDjgcwYvqT+9MJqpA8grjF4zJ/rSzzyRopClbCsPNRIhEyRbtEeBp/voYsBs4L78B87dn50By9dIQS/CJExxdCw/+NeI/9CXXFcolwZ8rWGwUMo6jj7lgHsQSldBxUSyU8PCGFGOw3l3+coAc7TTE1NKgHNA20/g4XqopBY/zUMoDleDNyo/AwL3G4mRP+oXPT/kV8dBeorirLK9gWbqsthEYXc5KXK8I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(110136005)(8676002)(426003)(508600001)(336012)(82310400003)(36756003)(5660300002)(7696005)(2906002)(8936002)(316002)(70206006)(186003)(2616005)(966005)(4326008)(83380400001)(44832011)(81166007)(86362001)(70586007)(6666004)(36860700001)(47076005)(1076003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:53.1934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60a024b-3763-4276-f705-08d97e8a5a1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6972

A NUMA aware device tree will provide a "distance-map" node to
describe distance between any two nodes. This patch introduce a
new helper to parse this distance map.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 106 ++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 7918a397fa..e7fa84df4c 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -136,3 +136,109 @@ static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
 
     return 0;
 }
+
+
+/* Parse NUMA distance map v1 */
+static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
+{
+    const struct fdt_property *prop;
+    const __be32 *matrix;
+    uint32_t entry_count;
+    int len, i;
+
+    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "NUMA: No distance-matrix property in distance-map\n");
+
+        return -EINVAL;
+    }
+
+    if ( len % sizeof(uint32_t) != 0 )
+    {
+        printk(XENLOG_WARNING
+               "distance-matrix in node is not a multiple of u32\n");
+        return -EINVAL;
+    }
+
+    entry_count = len / sizeof(uint32_t);
+    if ( entry_count == 0 )
+    {
+        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
+
+        return -EINVAL;
+    }
+
+    matrix = (const __be32 *)prop->data;
+    for ( i = 0; i + 2 < entry_count; i += 3 )
+    {
+        uint32_t from, to, distance, opposite;
+
+        from = dt_next_cell(1, &matrix);
+        to = dt_next_cell(1, &matrix);
+        distance = dt_next_cell(1, &matrix);
+        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
+            (from != to && distance <= NUMA_LOCAL_DISTANCE) )
+        {
+            printk(XENLOG_WARNING
+                   "NUMA: Invalid distance: NODE#%u->NODE#%u:%u\n",
+                   from, to, distance);
+            return -EINVAL;
+        }
+
+        printk(XENLOG_INFO "NUMA: distance: NODE#%u->NODE#%u:%u\n",
+               from, to, distance);
+
+        /* Get opposite way distance */
+        opposite = __node_distance(from, to);
+        if ( opposite == 0 )
+        {
+            /* Bi-directions are not set, set both */
+            numa_set_distance(from, to, distance);
+            numa_set_distance(to, from, distance);
+        }
+        else
+        {
+            /*
+             * Opposite way distance has been set to a different value.
+             * It may be a firmware device tree bug?
+             */
+            if ( opposite != distance )
+            {
+                /*
+                 * In device tree NUMA distance-matrix binding:
+                 * https://www.kernel.org/doc/Documentation/devicetree/bindings/numa.txt
+                 * There is a notes mentions:
+                 * "Each entry represents distance from first node to
+                 *  second node. The distances are equal in either
+                 *  direction."
+                 *
+                 * That means device tree doesn't permit this case.
+                 * But in ACPI spec, it cares to specifically permit this
+                 * case:
+                 * "Except for the relative distance from a System Locality
+                 *  to itself, each relative distance is stored twice in the
+                 *  matrix. This provides the capability to describe the
+                 *  scenario where the relative distances for the two
+                 *  directions between System Localities is different."
+                 *
+                 * That means a real machine allows such NUMA configuration.
+                 * So, place a WARNING here to notice system administrators,
+                 * is it the specail case that they hijack the device tree
+                 * to support their rare machines?
+                 */
+                printk(XENLOG_WARNING
+                       "Un-matched bi-direction! NODE#%u->NODE#%u:%u, NODE#%u->NODE#%u:%u\n",
+                       from, to, distance, to, from, opposite);
+            }
+
+            /* Opposite way distance has been set, just set this way */
+            numa_set_distance(from, to, distance);
+        }
+    }
+
+    return 0;
+}
-- 
2.25.1


