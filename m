Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99114663BE9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474438.735666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOm-0007yT-Mi; Tue, 10 Jan 2023 08:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474438.735666; Tue, 10 Jan 2023 08:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOm-0007v2-Hq; Tue, 10 Jan 2023 08:54:24 +0000
Received: by outflank-mailman (input) for mailman id 474438;
 Tue, 10 Jan 2023 08:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOk-0005oC-ED
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eadc0bb-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:19 +0100 (CET)
Received: from AS9P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::26)
 by AS8PR08MB10272.eurprd08.prod.outlook.com (2603:10a6:20b:62b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:17 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::a0) by AS9P251CA0024.outlook.office365.com
 (2603:10a6:20b:50f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:17 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Tue, 10 Jan 2023 08:54:17 +0000
Received: from ce7d68c79393.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DCA68D6C-84A1-4841-B4DA-AE16FA9E8149.1; 
 Tue, 10 Jan 2023 08:54:10 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce7d68c79393.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:10 +0000
Received: from AS9PR04CA0143.eurprd04.prod.outlook.com (2603:10a6:20b:48a::24)
 by AS4PR08MB8021.eurprd08.prod.outlook.com (2603:10a6:20b:584::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:07 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::74) by AS9PR04CA0143.outlook.office365.com
 (2603:10a6:20b:48a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:07 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:07 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:07 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:06 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:04 +0000
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
X-Inumbo-ID: 5eadc0bb-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKOqbwKgR3BpQXq2D8GZb/uo0PrVqRyZlKb7VkWKCUg=;
 b=AXnC8dht/q3saI6VzXewmyQIF1ygQWApxX737ntEYgSF1qsK0vD6c2sA1RwMWmPf+SCr2xHX2aP0c+uPjVufXv4LGxXiZicbyTVPFVLFUqb8Bi6zbndNDBHYEpua9CfhXTpHhIgEvgs3u4qmS9b9dp6XsAV4wrltkq/IVBZcCDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cb5e6b944ac46a3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVvzccwh/3zGxJOsUbts1FUGLsjFolK0rMjB/BlvVlK//6wTHke8+1th5q8ij6DxZrh/QsjLpR+UxOmunx6+PQQKD9jCt1L8M5j+wGeKlEXn62p6SFRn+yg0GB0Q6dnIwdD+axbqn5aWghkmlOu/oSr9Bvz/ktJ3HdFcnCCyiBSotmaLi5a9MSTrZ1lk1g/IuqNL+PwnLNz7Wu8heDRJxTLoKj6eLD83N6gVYby2iBKosPeRz0E4l3xwI6TPGUT0qMiGdBh8Wcq37uUHA69z/rQbQ/4EXT5/xMxX5vHgk1fmI6iNPM6WBQbMG61c5719+PL+lXOg5NAAtgQDZpj8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKOqbwKgR3BpQXq2D8GZb/uo0PrVqRyZlKb7VkWKCUg=;
 b=XfnTSQv3AhqoRJm55lqZgy4/BvOzddIojFoX+9svsbb+3WTmYzyinyeIH2vhOZ9sfDN9WSGWmztDbj2Fo0LNX9tSDIRqQ27J9eWAyursULHI+BL/iJRZfhDZftRgiPIu3NcuH2ElxbjWmrg2VO+MLqDyydvMztkaWDFng4CEjce4l9EjXBkik4sakk6afa3vePd1o2AnuW4Dw68Ac4BF9O2AqZTFn9l3RWeD1gKrxGf6RviO3N/Kn12TgLV18uc6sTgoyYIpI14n5eKrvCL/bMxYuF9CFT7m1CSRDN8iwUGpN6uFuyoqcuDQXkzgUqYSMYjsEInmV4W1QEo51z/3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKOqbwKgR3BpQXq2D8GZb/uo0PrVqRyZlKb7VkWKCUg=;
 b=AXnC8dht/q3saI6VzXewmyQIF1ygQWApxX737ntEYgSF1qsK0vD6c2sA1RwMWmPf+SCr2xHX2aP0c+uPjVufXv4LGxXiZicbyTVPFVLFUqb8Bi6zbndNDBHYEpua9CfhXTpHhIgEvgs3u4qmS9b9dp6XsAV4wrltkq/IVBZcCDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 08/17] xen/arm: introduce a helper to parse device tree memory node
Date: Tue, 10 Jan 2023 16:49:21 +0800
Message-ID: <20230110084930.1095203-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT045:EE_|AS4PR08MB8021:EE_|AM7EUR03FT020:EE_|AS8PR08MB10272:EE_
X-MS-Office365-Filtering-Correlation-Id: 804971e2-82c8-4155-85b5-08daf2e841d4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cYC1f+ENHyJAnlqwLMSVrd/QKZpp8bFQw/NYKKG7PF23sg5hOcL8aXy9meIimpkmkmoX0f108tkj+WLiA8zoksBm92kundWXXBtANT3EFsrL05GmUeibh+Rb6td7vJf1lZOnIhC5NvpF6u8h76EadVhTDTNS9nrHyMH04Z3tzFRI7jefglp/b7ZvgJTnBqWXCNzxWtsGkQHP0eX8+RFvzhblIsgg8j5if/EPGHbXA01umoe9wYjjaQeQBcxwbbNoN3cioqZMGPkYQaPL7/OqC3EwheIoyucUdgNtMWD50gK+5T33/aDVPITtDE/HPYR+0lGkHM2hLbj2Af5mRvnlRDXWRpY5qfz0Gr4JwjAGyF9TcANP53AAD2scNH/pbhgOQYlQCVyrYQmU2p4OXHPKxHrF307cQ064ST5RmCnxdx0F9HUjDrTjGRD1L6ax/P3dhi9cZkw6YKPRXvql9F7jeI/OflVpXCAQuzHMQJ3VmNzHvrAVUFDiJu1V9XCClHQ0DkMj1jLCnQg/j+bqX7FhHj3FWkPr2gBUaixh+wHECaPQo4wrZDnY4f44BqbUUe2+xXwuqQ0DmGGQ7f+XjmakcNq9gvYAAQp+Cg4yOtkyatSPpm0n6cy+NG5v/RXg/mSpeuRfFTy/QRVYhORYWOJIkHgOrqgANSi2YG/F9tDR+x42xwGZ7DQFN3WniF3oZHjkwiOi8SgirOb2EzSYyS8vSw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(36756003)(82740400003)(81166007)(356005)(86362001)(2906002)(44832011)(8676002)(70206006)(70586007)(4326008)(5660300002)(8936002)(83380400001)(36860700001)(7696005)(316002)(54906003)(6666004)(6916009)(40480700001)(82310400005)(41300700001)(1076003)(47076005)(336012)(426003)(478600001)(186003)(2616005)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8021
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed89b6d8-b1b3-4969-9475-08daf2e83bcb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tASn4v6OG2BoFMYZF9AgW2RWMlFlKpGv9j/M0edEIiWzE4w4kB/48VYlPsavsFGiSwzxeXl4GGIMqH7P53um9SQqgoag6SyOikYCnS/WuzPqQ1YsVnFTf6yVE8icJiU4zANRc5hkkCeM+HlGN0MBGUUersvOKdyJOg98t872jSEdCgv9P5Bn9uRbC6ekrKg6UOM/RGUD2QvG4UoHuK99HMhVl+1GAxWxX/JcJU26h38nSX5PEz1FJFqkz8umipHIPG/wGhvnn7k9vYKkIMmMuJ2zKMcrneVyXiTEJ697+Y6r71RV8ETCltuKwSfyqZg8IzEC+AwJejMd/AvjE83dufsElbdhf7myh2z9yNHCFwzc3OM3xs5om7Jd7Zlvu4o2AWLvcyhm9ozRrEJn9Rj3SSUj/79yBbMh/BvkbPOYQ8IrRSzMnPKYddZCuTIHH8JIi8AylqPAcMJmzBTZvjFb1Zd/rwAAuMWIYnqKMa2IYxQ+boHa+56k9KyIB+MbAgquPy7BhZK2BYwcryI7u1rDO7YWjQrDQnX120qxht6DJs1VkUHTXyB6f4q1B+eHPUFQSCXkAiI0n51KEyVtUUvFmPFak4FieMd+InFxlZ2SYnK9330M39OHbJHbF51/2l/1suyWYMC2WI/I9GmSThjdoTnNuSxgCrvwzfDQ74g/3T7j+qHkZ/LGoS+wRxQCAzRL2wen8cE2/iHQ3OPyHwfnyw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(81166007)(36860700001)(54906003)(41300700001)(70586007)(86362001)(8676002)(40460700003)(6916009)(70206006)(6666004)(5660300002)(316002)(40480700001)(2906002)(44832011)(2616005)(1076003)(426003)(336012)(47076005)(83380400001)(7696005)(82310400005)(26005)(107886003)(186003)(8936002)(478600001)(4326008)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:17.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804971e2-82c8-4155-85b5-08daf2e841d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10272

Memory blocks' NUMA ID information is stored in device tree's
memory nodes as "numa-node-id". We need a new helper to parse
and verify this ID from memory nodes.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1->v2:
1. Move numa_disabled check to fdt_parse_numa_memory_node.
2. Use numa_bad to replace bad_srat.
3. Replace tabs by spaces.
4. Align parameters.
5. return ENODATA for a normal dtb without numa info.
6. Un-addressed comment:
   "Why not parse numa-node-id and call fdt_numa_memory_affinity_init
   from xen/arch/arm/bootfdt.c:device_tree_get_meminfo. Is it because
   device_tree_get_meminfo is called too early?"
   I checked the device_tree_get_meminfo code and I think the answer
   is similar as I reply in RFC. I prefer a unify numa initialization
   entry. Don't want to make numa parse code in different places.
7. Use node id as dummy PXM for numa_update_node_memblks.
---
 xen/arch/arm/numa_device_tree.c | 89 +++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index c031053d24..793a410fd4 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -34,6 +34,26 @@ static int __init fdt_numa_processor_affinity_init(nodeid_t node)
     return 0;
 }
 
+/* Callback for parsing of the memory regions affinity */
+static int __init fdt_numa_memory_affinity_init(nodeid_t node,
+                                                paddr_t start, paddr_t size)
+{
+    if ( !numa_memblks_available() )
+    {
+        dprintk(XENLOG_WARNING,
+                "Too many numa entry, try bigger NR_NODE_MEMBLKS\n");
+        return -EINVAL;
+    }
+
+    numa_fw_nid_name = "numa-node-id";
+    if ( !numa_update_node_memblks(node, node, start, size, false) )
+        return -EINVAL;
+
+    device_tree_numa = DT_NUMA_ON;
+
+    return 0;
+}
+
 /* Parse CPU NUMA node info */
 static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
 {
@@ -62,3 +82,72 @@ static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
 
     return fdt_numa_processor_affinity_init(nid);
 }
+
+/* Parse memory node NUMA info */
+static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
+                                             const char *name,
+                                             unsigned int addr_cells,
+                                             unsigned int size_cells)
+{
+    unsigned int nid;
+    int ret = 0, len;
+    paddr_t addr, size;
+    const struct fdt_property *prop;
+    unsigned int idx, ranges;
+    const __be32 *addresses;
+
+    if ( numa_disabled() )
+        return -EINVAL;
+
+    /*
+     * device_tree_get_u32 will return NUMA_NO_NODE when this memory
+     * DT node doesn't have numa-node-id. This can help us to
+     * distinguish a bad DTB and a normal DTB without NUMA info.
+     */
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", NUMA_NO_NODE);
+    if ( node == NUMA_NO_NODE )
+    {
+        numa_fw_bad();
+        return -ENODATA;
+    }
+    else if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
+        goto invalid_data;
+    }
+
+    prop = fdt_get_property(fdt, node, "reg", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "fdt: node `%s': missing `reg' property\n", name);
+        goto invalid_data;
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
+        if ( ret )
+            goto invalid_data;
+    }
+
+    if ( idx == 0 )
+    {
+        printk(XENLOG_ERR
+               "bad property in memory node, idx=%d ret=%d\n", idx, ret);
+        goto invalid_data;
+    }
+
+    return 0;
+
+invalid_data:
+    numa_fw_bad();
+    return -EINVAL;
+}
-- 
2.25.1


