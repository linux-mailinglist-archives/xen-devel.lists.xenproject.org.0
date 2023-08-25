Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789878817A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590553.922925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmj-0000W2-9Q; Fri, 25 Aug 2023 08:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590553.922925; Fri, 25 Aug 2023 08:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmi-0000Nm-SC; Fri, 25 Aug 2023 08:03:12 +0000
Received: by outflank-mailman (input) for mailman id 590553;
 Fri, 25 Aug 2023 08:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmg-0007G4-Nj
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e89::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3910c9e-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:09 +0200 (CEST)
Received: from MW2PR2101CA0034.namprd21.prod.outlook.com (2603:10b6:302:1::47)
 by SN7PR12MB6741.namprd12.prod.outlook.com (2603:10b6:806:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:05 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::7e) by MW2PR2101CA0034.outlook.office365.com
 (2603:10b6:302:1::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.7 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:03:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:02:55 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:02:55 -0500
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
X-Inumbo-ID: d3910c9e-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBCmLBnOjn7lWk/MC1zY2SZOHg+kHDx1OVw70bNVGABBnMb0oN0GhuIKPmR+hMw84KS5m+BUCJ8r5SmctUPxzlumJssQsVTBjvFd3vt/TlkarEz9XP/exJ1tPUM+b+wqvSGlTgC7x4N0TfJqJJ8RFuzGnxYOwuJPKSREXbMopRgrbe6Ojdi91LDJuBfsA82pX6/S17b1F25T/Jsq4I26e/GnG7oJr3tNEwfMUOOL+8Bm4q6QjQCcoidUrBJ6trE8FDdr2yUTjVcthcNUOLuBSJ33MrT9bd1w3Ka48yIRR96j3eYMtERy4TL5heGjNY5L4hKpEnkERV1tFM+L0P4yvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=551FbITUy/lX+UFAVwLYLGK11TzVaHOhuLFDvzMcrP0=;
 b=MDmCxmk7ELWq9ChnVqgxZ0lZlpdingdbmtaimrlP2vnSWO7mt5U7TvglCNOuv1l8k6lWI17pHmYvW1GAsr+IJAp/Nr9U3H9SLfewbRWhn2z6Y/dGs+h+7ZT5ZOgs17KdFCB5Q/X5wCdEonBnAftGRoO4q+AbWIZFqMtwrs6XRM0ez8lkw9sGZy540d4yxBc5ww3hHcHgK+XU1N6CSJuSEZDrqjw7/jEp6IPZyhpE7+IjOFeRN+J8CQtvDoPptfSai8gQG+28ukhVcQHpaagLR+WmKPCRecPdzRPL0KdJHaMPAql+Pvld0B2jvjfugpXjkLBHyX1qFJgs6U2SWOVUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=551FbITUy/lX+UFAVwLYLGK11TzVaHOhuLFDvzMcrP0=;
 b=qPu4tragayB/zBNjGd+YzlfTi702XXTwdN2BwVUjoIWJsNde2hQPvp19i0sqzH3YAxOiu6rj8K5oFpdSGLXy75hjxuL5UoLfBqpHE7yn+3Bqjw0gojc3O4FP4l6zajOlY8OhZIijqL9q9YhSoFJCRO6zFqm1viFRlABXXjEfSUw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 01/20] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Fri, 25 Aug 2023 01:02:03 -0700
Message-ID: <20230825080222.14247-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SN7PR12MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 942ffa70-5870-42d2-03be-08dba541b5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SQ4w+gZ24TKjXHRlyIpg25a/uYFQJlvyBN2NI0xbLubS/nJ8u6TaOxcxQCxyQDnMl7Vms0PCAT+6fR0F+7By/Bp8q4ASxHrnFTPIxBy+Hjp4PSM42wajjt2PDSRgK1j20pxlB4AYM+o+L2yGQoJ2WYjxQdrQVWeawAdaej2ogNztxufkXroj0LeEdtwfXufyWdg/iPiot2Rg857u88GgMqAgKKAVd0DpbRUeSyFynoUFVmx2tQeDetN9W+D79pvWCkYWLD7fmVuugjXI9ZySbabE1+xO6rvQY32APEKHfE4vQmbF0bGSii7XlPyB2lbWoGCooet8fvr7OB2JTUJj/aGGlxtWJnpRTzZPphgi0wwl/o0DP2a4Geh3nxJEdgjtI4+kwzjdUShfX03cxRYDsaDAQlDU4/gosETsF4KBZhryk8Wk/4OB3B3vKdY5055uuoxfKM5cSxM/Fj/gVadAC1Q0xTS60XCMKf/HwF7M8slbt5b5JcUpq6FcYydriOioYr6acfJQrr7Dzl6KV/lJlL8cHk6eCvAE50xGda6qxnGEy+6nDHVTkP9YNXdRZlLeYuRtvSI9Q2dNF6YuzqwURp/qixVVHUTYPgoGYH1zEqP9zftl6kP21sjRGmfoHZLPlZX9zuClCei2NKiZxOODIsK5/O6Af3bZSkOtxW6GDWWEMc3n27Tq8lQmZzr8su8OyOpSbHL0qxYK2aLRDGCgFbUHlinMfHBrFIW8sq31WUvz55OMzkZFOZeJCW6f+bxQTelEUsY5fimn6DaT9ZWIAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(36860700001)(47076005)(40460700003)(44832011)(2616005)(41300700001)(86362001)(36756003)(8936002)(8676002)(4326008)(6666004)(81166007)(316002)(6916009)(54906003)(82740400003)(70206006)(356005)(70586007)(40480700001)(1076003)(5660300002)(2906002)(478600001)(83380400001)(26005)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:04.5201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942ffa70-5870-42d2-03be-08dba541b5f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6741

Change __unflatten_device_tree() return type to integer so it can propagate
memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
memory allocation failure during boot.

Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes from v9:
    Update comment regarding return value of unflatten_device_tree().
---
---
 xen/common/device_tree.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0522fdf976..7c6b41c3b4 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2091,9 +2091,11 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * can be used.
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
+ *
+ * Returns 0 on success and a negative number on error
  */
-static void __init __unflatten_device_tree(const void *fdt,
-                                           struct dt_device_node **mynodes)
+static int __init __unflatten_device_tree(const void *fdt,
+                                          struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2114,6 +2116,8 @@ static void __init __unflatten_device_tree(const void *fdt,
 
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
 
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
 
@@ -2131,6 +2135,8 @@ static void __init __unflatten_device_tree(const void *fdt,
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
@@ -2215,7 +2221,11 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+
+    if ( error )
+        panic("__unflatten_device_tree failed with error %d\n", error);
+
     dt_alias_scan();
 }
 
-- 
2.17.1


