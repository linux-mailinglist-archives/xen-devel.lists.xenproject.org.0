Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE0663BF4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474487.735765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPm-0004jW-92; Tue, 10 Jan 2023 08:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474487.735765; Tue, 10 Jan 2023 08:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPm-0004eR-4N; Tue, 10 Jan 2023 08:55:26 +0000
Received: by outflank-mailman (input) for mailman id 474487;
 Tue, 10 Jan 2023 08:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAP1-0005oC-60
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2040.outbound.protection.outlook.com [40.107.6.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 684407f9-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:36 +0100 (CET)
Received: from AS9PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:20b:46b::26)
 by AS8PR08MB9930.eurprd08.prod.outlook.com (2603:10a6:20b:564::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:34 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::e8) by AS9PR07CA0032.outlook.office365.com
 (2603:10a6:20b:46b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:34 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Tue, 10 Jan 2023 08:54:33 +0000
Received: from 3390037eb137.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F7B9D46-02EF-44CB-AE26-D0F4CB766B0F.1; 
 Tue, 10 Jan 2023 08:54:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3390037eb137.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:26 +0000
Received: from FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::19)
 by DU0PR08MB9875.eurprd08.prod.outlook.com (2603:10a6:10:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:15 +0000
Received: from VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::a3) by FR3P281CA0159.outlook.office365.com
 (2603:10a6:d10:a2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT055.mail.protection.outlook.com (100.127.144.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:15 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:09 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:07 +0000
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
X-Inumbo-ID: 684407f9-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JD7QrIfD9JHz3fTuQsCfz4zF77DrQ2+h/779Q8LcaQg=;
 b=lZ9tyBRNocxLf39gyHK2PqW0/wInK5F7UD9wUV46pvLMvVjblxMPVLloJt341jM5uNGD7puh7H76ky3qYG3tRd2+3Aj72TTxrTCf7BvAfyQYTwP3m8icL+GSXYynQYx69XaUtEySS9Wy5yzX1bzK7T7iTkp1LLKzLpBsF/4eZCw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e8560d985ecbcc9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Maa6RscqbOXNhihsTbC3V4BIiMLxNz4ex48uAer04W/YxSLBW4l34l9d84ao67Z+rljmRddGrOrEB0fBQz9tOJZ5Ewx1BaYSrHxCT83vaOJXV+7hHh+GsqLiuzZ5fM3Xowqsf9enwpemcM6Gss6UiMi3qm/AVOSnY0U9TGsTnjvtCHcZRNyM8a+i5pHt++rRpVtbF7CKqfIpm+riOg2Qa03h31aLkcRNXjZjiaAuoHtRQUckIPLXZnO92N5LKDBbzhRNoV813Ea4kuTl/gitNCiT6QnDga27W1eVHz/Id279lG4mCYH7JSsVTinbYKZut/vcPxSo2/YALU/7970VCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD7QrIfD9JHz3fTuQsCfz4zF77DrQ2+h/779Q8LcaQg=;
 b=l8b/PBbDnukDhWNv9cJ0dia+1FmJCzQEZZ5O43lesbsfOdeqvSj+hdxdpp+hVKty5fUrQklIpicaM9iBJCEb4kL2Jnp8tx48S/MXtATUCjifaxUJoZwch/FnKikbXZXkh6iY9e2nn/zEnsvFyL2G2+OEpti+lbu1EDHO5+/QvHyHv4eTOeKiBGj4sCr7i3iRP6w8O9uL9b0P7P2vFTH1mc3CcsylUOL6mpST02dAuXcBZfJmlJ2dMCVx6CepzvseBoOn7WV418K3l9dMpuU9BijkexOTI/S0ieBe2/XGfjYBNbv83gzCHP5dYAisWx8Gp+JllFpAFxguwmsvz0NBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JD7QrIfD9JHz3fTuQsCfz4zF77DrQ2+h/779Q8LcaQg=;
 b=lZ9tyBRNocxLf39gyHK2PqW0/wInK5F7UD9wUV46pvLMvVjblxMPVLloJt341jM5uNGD7puh7H76ky3qYG3tRd2+3Aj72TTxrTCf7BvAfyQYTwP3m8icL+GSXYynQYx69XaUtEySS9Wy5yzX1bzK7T7iTkp1LLKzLpBsF/4eZCw=
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
Subject: [PATCH v2 09/17] xen/arm: introduce a helper to parse device tree NUMA distance map
Date: Tue, 10 Jan 2023 16:49:22 +0800
Message-ID: <20230110084930.1095203-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT055:EE_|DU0PR08MB9875:EE_|AM7EUR03FT025:EE_|AS8PR08MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ae5224-0cd0-4e27-de41-08daf2e84baf
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SirlqwtpLwHm2mWKsAdonfyzexqmkx2lbTAa6R1FFEe4+2+b43/bJrXeYmWZj5M7CE6/XjyuAn7BGq89ebRYbbE81EzQzL5Ob8Bw7Tp5fbHFzSZSgNpVK3fM61RQ1j3XzN08LNXSwOgH9jWNHCX5jKZ4AGOu7KxIZppUDCgy6RIMoXYylyOnBOLEllRuTn/see1sL0G1vq3uLW1cED8d/ndCvcEGs66HaP90qmRcPtY/qrG+Mvmab+VyvaahwiP9+5qdsd2rocpNj9TNBO87Py2g4vXIiQdLy9yLujxNslYNFneegDlZmIkjieubwxhTxiBSPKUndNZ9Srih8ur+WNl0PKmFN3YEhiubM+WPUu2yF7+UCU9+hsNdKVlgzykPN9TmiMq6/mgky0QxAi/16YJvxI+XAO4go+6cm+1NkwwWHeZvFWESRawMwsM8+Dx0LpheydWvnTXTydbEY4oiIGZ/WmFfYhKmWSM9KzG9bCz7mePNXiERfUo0CMODjxnS9zFvZvsdr2y+vY4SL33yKLu6gyrmW1OyNqUK05ab7R3BBWpXY/rUXz6EerjKHQZxkVwpBK4J/2/pQErpw85DUu3JXvnhdpb/WEyWYDBz/ZMGVsfnCcunwRV8Ulv6n2E8u+oYCKmnDaK/IA5uU4ZbEB2yrg+ub+O0Iv/P2Y3CwUuNppmqdL/9fGq5M/qBt/Z1KJYlVf93etvMRfOwMYTuY+ymWo5xo9fKk4KuVRj3IuI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(46966006)(356005)(81166007)(82740400003)(36860700001)(86362001)(54906003)(8676002)(4326008)(6916009)(41300700001)(70586007)(70206006)(8936002)(40480700001)(5660300002)(2906002)(44832011)(1076003)(2616005)(336012)(83380400001)(426003)(47076005)(82310400005)(966005)(186003)(6666004)(26005)(316002)(7696005)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9875
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec34f7cc-6957-4d43-a18f-08daf2e8408c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dOx2p4Nbu+Qq5yYF0i5m0xeM29ARRXdYzMPCVCdajFldRVlNWJDW+KFKTum7j+koVXpD8KtLgucfKy+Steb0nwTcSSu2g5T0vquGTjyykTd6i5d6z8GHAaedbUiev+BWtAKkp3XU0sRSZFkZiruPHPsaZgV57dWz2c6tRMQdIAUbloxktZp7qoXtiPFq3lXFimvUmG9mTavjO7xziNxoZsWPVK4csh2HgHDWxyygym7m3oHmIAa8s8EM7ifuX4vdAP5yD6rbg20tyiCv9aeSMj+Sve3ue42SjyG6rH2eM9OCdP/rEqKALDW7xV8xKqrOdm/qS8K6FeDkraj2AJ/iiu8Smm53JIIO/UF3lQbmSFcHQ+5TgzRccl3I1b8nnDvC3uRO+vTeSVdByxiL2pKWQf8ztuBxhtQBxrK2JjSaWVR9jFwpljkAd3AVh56qxWWJE23A8XrvmaCHG8F516HL1LtEM3CYBso3VEg1tLNetj5d2VElyAnIbBiqASv8SofF+cSpHkOFJjiwoxG0g9QhfrAaZYl5i7a8h7xuQQBTBb9muwarmvwKqFnHP9IXQ8ysc2PcDb132yYosPayw9C42eLuBJDXbEdsnrMiGQEcKeeHOrGFL9UrFaObDIeWe8/HHBnTlY83WuvvY1CgmVhmxlSc668UbDKpZ7ZiOS68sSitWEhEGPxSqbPh7CF2i573Svlr1WWk/CiW3ROsSb0FDwZO/8eF7264B6gCpJZsZVI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(36860700001)(44832011)(5660300002)(7696005)(41300700001)(8936002)(36756003)(4326008)(83380400001)(70206006)(70586007)(8676002)(40460700003)(86362001)(47076005)(82310400005)(1076003)(336012)(2616005)(6916009)(426003)(26005)(81166007)(40480700001)(478600001)(186003)(966005)(82740400003)(316002)(6666004)(107886003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:34.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ae5224-0cd0-4e27-de41-08daf2e84baf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9930

A NUMA aware device tree will provide a "distance-map" node to
describe distance between any two nodes. This patch introduce a
new helper to parse this distance map.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Get rid of useless braces.
2. Use new NUMA status helper.
3. Use PRIu32 to replace u in print messages.
4. Fix opposite = __node_distance(to, from).
5. disable dtb numa info table when we find an invalid data
   in dtb.
---
 xen/arch/arm/numa_device_tree.c | 107 ++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 793a410fd4..88056e7ef8 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -151,3 +151,110 @@ invalid_data:
     numa_fw_bad();
     return -EINVAL;
 }
+
+/* Parse NUMA distance map v1 */
+static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
+{
+    const struct fdt_property *prop;
+    const __be32 *matrix;
+    unsigned int i, entry_count;
+    int len;
+
+    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "NUMA: No distance-matrix property in distance-map\n");
+        goto invalid_data;
+    }
+
+    if ( len % sizeof(__be32) != 0 )
+    {
+        printk(XENLOG_WARNING
+               "distance-matrix in node is not a multiple of u32\n");
+        goto invalid_data;
+    }
+
+    entry_count = len / sizeof(__be32);
+    if ( entry_count == 0 )
+    {
+        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
+        goto invalid_data;
+    }
+
+    matrix = (const __be32 *)prop->data;
+    for ( i = 0; i + 2 < entry_count; i += 3 )
+    {
+        unsigned int from, to, distance, opposite;
+
+        from = dt_next_cell(1, &matrix);
+        to = dt_next_cell(1, &matrix);
+        distance = dt_next_cell(1, &matrix);
+        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
+            (from != to && distance <= NUMA_LOCAL_DISTANCE) )
+        {
+            printk(XENLOG_WARNING
+                   "NUMA: Invalid distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
+                   from, to, distance);
+            goto invalid_data;
+        }
+
+        printk(XENLOG_INFO "NUMA: distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
+               from, to, distance);
+
+        /* Get opposite way distance */
+        opposite = __node_distance(to, from);
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
+                       "Un-matched bi-direction! NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32", NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
+                       from, to, distance, to, from, opposite);
+            }
+
+            /* Opposite way distance has been set, just set this way */
+            numa_set_distance(from, to, distance);
+        }
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


