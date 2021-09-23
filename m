Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC7415DE4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193868.345447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVq-0006pT-20; Thu, 23 Sep 2021 12:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193868.345447; Thu, 23 Sep 2021 12:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVp-0006mC-UG; Thu, 23 Sep 2021 12:07:37 +0000
Received: by outflank-mailman (input) for mailman id 193868;
 Thu, 23 Sep 2021 12:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNV4-0006xV-T9
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 727f9474-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:49 +0000 (UTC)
Received: from DB8P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::37)
 by PAXPR08MB6541.eurprd08.prod.outlook.com (2603:10a6:102:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:47 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::5) by DB8P191CA0027.outlook.office365.com
 (2603:10a6:10:130::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:47 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:47 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 12:04:46 +0000
Received: from 60a7a5fd6538.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D06DFBD3-EACD-4321-8B02-FEDEB3E5EADC.1; 
 Thu, 23 Sep 2021 12:04:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60a7a5fd6538.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:37 +0000
Received: from AS9PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:20b:465::11)
 by AM0PR08MB4228.eurprd08.prod.outlook.com (2603:10a6:208:138::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 23 Sep
 2021 12:04:36 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::c4) by AS9PR06CA0100.outlook.office365.com
 (2603:10a6:20b:465::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:36 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:36 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:15 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:13 +0000
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
X-Inumbo-ID: 727f9474-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5dCi7RLHOGiZwjaffySQjpEEHSFmEIlzO2cAQzos3g=;
 b=l5Jsji4GLT7sCjHfjs2qGAYISvSiRQm7uheZnkHoMUFsd+bB5Cq3o5x7O15o/dlmVQjTJp1OOT0ErNKupDNvPvlWxiaAm2TghCWPtn0JCEVvGPlIzxDgb3QKUfjnRC4xqzkp1tGs3R170FBY6BmFgP3FShS5YuVz6xARDLEVCPo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef6df92a1e0be266
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWAScDte5A/sajD+TCyI8Ag9Ekykw0r5fbmaOkmDWjyRj7tuV105qi2Cx4HnlqPnpBovzMZb6N3U0IX9bRR0yXUJzFZ9zuV3lEQH97slkCeo04+KEfLrWQNRPDB94q8aZr5MBR5KohG9iGnSzM+lUVlPsafZjw9BPw7o3b3ZAzqjFHErHG3T8H2whVooAr02Yuhpw52PkIzahZjp6qJ8rh2jYCjaB0xso+42lIqsTS7QM5uoM3K4ZBuFo7sif1u3ej2VMpTRGlP0LI1ipeNAGL3HaXB7ga8lSL6OaC9D0jFWGSr3jxrBGeNeiWr3NOQDkmRXyJ56IavLMiMnBrKmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=V5dCi7RLHOGiZwjaffySQjpEEHSFmEIlzO2cAQzos3g=;
 b=MjuN5ixREG24663ZzfVO4c2k1ZOJ78DUtTp/9CW1PgbwigKVqyB7FOUyxFgvqfKb73hDo/Wb3Poqz+a7kzKe57BUD5tmZhL2hIdA8axiIHL13f0N9F7Ete+20lYsanIqLoS+lwiphFWY9SuBRtWG4qFnfrXJV2VcVvGYRwtLtFNJ/JI/JQDb3to72jbbwbrx6VvaaODF5FzyRb84uL+33rY9CFGJVWg4m728nJtQcRpmFsLzwWAidga0PJr++7mP9lm8ixDYHwkGfOECVj4KQYlcw+QHUKd8hdDwS961xGWryiqin7KOe0rHGcZFsn7eMKo0gjivS8gkCcR+wOuWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5dCi7RLHOGiZwjaffySQjpEEHSFmEIlzO2cAQzos3g=;
 b=l5Jsji4GLT7sCjHfjs2qGAYISvSiRQm7uheZnkHoMUFsd+bB5Cq3o5x7O15o/dlmVQjTJp1OOT0ErNKupDNvPvlWxiaAm2TghCWPtn0JCEVvGPlIzxDgb3QKUfjnRC4xqzkp1tGs3R170FBY6BmFgP3FShS5YuVz6xARDLEVCPo=
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
Subject: [PATCH 30/37] xen/arm: introduce a helper to parse device tree memory node
Date: Thu, 23 Sep 2021 20:02:29 +0800
Message-ID: <20210923120236.3692135-31-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40370d81-b797-4c86-e01b-08d97e8a5681
X-MS-TrafficTypeDiagnostic: AM0PR08MB4228:|PAXPR08MB6541:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6541D5E42CD45CCF0C95AFE49EA39@PAXPR08MB6541.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YcJKU/oOfBJYCoGuRGXQFHKmi1+4wu6ZWxCym+qF4vmJajknFztJ0P2Yu3Um15CVWqQ33vn/yO6zZrkMPiq5eRelzrpC6/GZoI5kf7Ny28LeUh4npbS08QKNtrtJAtasFlfzbeaQuOi+B4lBD3+/SKuKzGXjuuyaGr6FBDuWzw9Vq2rizMSfxk00vxyy8vtIkF+GuCg2/1S4q69bUmSwiSwMjlk2MHiqlj2Aqiug8G5xfQ7C3+Agc5kyZ5Yg4a0gQKnDBzN44jm3UoHbLiLnCYSR7QGQEghtqho6z6Jyz2RcL8cpTgGtOhzKAl07mM1kBXClEg+SRuPQ3F9qdkEuzj9YXmMsPpLoltpr5gcYh6/ORY7HEwVwFXp/N2ds3TS7vdWSR4WlAy7bGk1H4T89lSZiykJd+R10Ld/hDFrPQOf59S6CrdC74BryCedR8h/X8+oyrV0363RMhUP+RCCNs4fgecfrvohu9QoASWznW28VV84ZvQw7QJHdhqNSWv9yybCsain1iG6h3SPxRx+GX4S88kKw1sv1SmQla5t3F+ad+eLrH8ZGyj5B0iJUlE6/kARPKlUqDwpnbj0MWJtwm0a36uNP6/qe6YugtnJknjLiCzswMEmkMdgGO/H7Y5zuPo2IsUYDAX+Kee4gHCRjLuD5MdqPyJnImSWRaPI30UZ1a5hojaCbNLAlq4RpQmsCcQJychAzvX74Ov0YyTW0kYlX8+WtnPy+2PS61bMxLwQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(36860700001)(508600001)(356005)(83380400001)(426003)(110136005)(6666004)(82310400003)(47076005)(70586007)(70206006)(316002)(5660300002)(86362001)(8676002)(8936002)(7696005)(2906002)(36756003)(26005)(1076003)(44832011)(186003)(81166007)(4326008)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4228
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	268c5f9b-2163-4497-8f2d-08d97e8a4fe4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEd809IuaD1FS0Yo4ezVc1OxJU9ltWUh9NVeI5ovZfdXC/tugWMEMoKjrQReiH5alCo3ukITtfV9xLyRw6TuWSJhexn0J2x+Fjzd0in+SZA5hbTHEF4jiBi7FSExlhTkAQXxnYNHTC6Kb2owFxNcnAziEf2KMWZyEWfCeA4xN3ODNczdUlfboAgg9EyHSXK7BUHuxCBV+ziICv3X7uwY7JOBiP0mNK1QWb0NNXyeIunS8wAHuphYBaiZCgJD7HQbzQwVE4R/xmljcRa1OBvlSWrzvxJu1fir6pLwHUoPhUlYE6S8GbfIEJmoY+RUuzluuTHukG+bk8vAcJwnWOBqxmfFRDQrbQ2i/iCqEqhaG1rBY3qRYdkUOuu7bE0TRuSJQ3R/LnIMU27DyHNHYCaxmpqrfoR+v04Qb00dupKNWhJdRPS6j0/qQLGXtLOq0huX0VBY2M/1vJl7Un5AXh6gUVDalkkmA3mfSZljo5sjm65Xd9kjnMJLj/i914143xgshCaGq8BQ8zEsoCaCuuDOE/pCN+SDQhuxMtiv4NfQHDpgir3eJAutGTsZS+510gpIKp2PqCk7SFfPu5Zps2iCLEj6hLLGpIRRRaN41ZZ6tfd2Kil15W6yt9K5UDjorzWgQBbqIhEkAVeYfvllYhn3EH2vN95RPH+PIbgymG3icNsuKuDY9VpyOShCtNfo7g7pGg+oV3FUOsltmNB2wv1kYg==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(508600001)(426003)(86362001)(336012)(316002)(1076003)(36756003)(83380400001)(186003)(26005)(70206006)(2616005)(44832011)(70586007)(47076005)(36860700001)(110136005)(7696005)(8936002)(6666004)(2906002)(8676002)(81166007)(82310400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:47.1514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40370d81-b797-4c86-e01b-08d97e8a5681
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6541

Memory blocks' NUMA ID information is stored in device tree's
memory nodes as "numa-node-id". We need a new helper to parse
and verify this ID from memory nodes.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 80 +++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 2428fbae0b..7918a397fa 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -42,6 +42,35 @@ static int __init fdt_numa_processor_affinity_init(nodeid_t node)
     return 0;
 }
 
+/* Callback for parsing of the memory regions affinity */
+static int __init fdt_numa_memory_affinity_init(nodeid_t node,
+                                paddr_t start, paddr_t size)
+{
+    int ret;
+
+    if ( srat_disabled() )
+    {
+        return -EINVAL;
+    }
+
+	if ( !numa_memblks_available() )
+	{
+		dprintk(XENLOG_WARNING,
+                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
+		bad_srat();
+		return -EINVAL;
+	}
+
+	ret = numa_update_node_memblks(node, start, size, false);
+	if ( ret != 0 )
+	{
+		bad_srat();
+	    return -EINVAL;
+	}
+
+    return 0;
+}
+
 /* Parse CPU NUMA node info */
 static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
 {
@@ -56,3 +85,54 @@ static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
 
     return fdt_numa_processor_affinity_init(nid);
 }
+
+/* Parse memory node NUMA info */
+static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
+    const char *name, uint32_t addr_cells, uint32_t size_cells)
+{
+    uint32_t nid;
+    int ret = 0, len;
+    paddr_t addr, size;
+    const struct fdt_property *prop;
+    uint32_t idx, ranges;
+    const __be32 *addresses;
+
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
+    if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
+        return -EINVAL;
+    }
+
+    prop = fdt_get_property(fdt, node, "reg", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "fdt: node `%s': missing `reg' property\n", name);
+        return -EINVAL;
+    }
+
+    addresses = (const __be32 *)prop->data;
+    ranges = len / (sizeof(__be32)* (addr_cells + size_cells));
+    for ( idx = 0; idx < ranges; idx++ )
+    {
+        device_tree_get_reg(&addresses, addr_cells, size_cells, &addr, &size);
+        /* Skip zero size ranges */
+        if ( !size )
+            continue;
+
+        ret = fdt_numa_memory_affinity_init(nid, addr, size);
+        if ( ret ) {
+            return -EINVAL;
+        }
+    }
+
+    if ( idx == 0 )
+    {
+        printk(XENLOG_ERR
+               "bad property in memory node, idx=%d ret=%d\n", idx, ret);
+        return -EINVAL;
+    }
+
+    return 0;
+}
-- 
2.25.1


