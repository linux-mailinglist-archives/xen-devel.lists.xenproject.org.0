Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6722917A6A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748462.1156179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNe7-00064T-6N; Wed, 26 Jun 2024 08:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748462.1156179; Wed, 26 Jun 2024 08:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNe7-00061w-2e; Wed, 26 Jun 2024 08:04:51 +0000
Received: by outflank-mailman (input) for mailman id 748462;
 Wed, 26 Jun 2024 08:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6S0o=N4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sMNe6-00061q-2L
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:04:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfbdc8be-3392-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 10:04:45 +0200 (CEST)
Received: from SN7PR04CA0085.namprd04.prod.outlook.com (2603:10b6:806:121::30)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 08:04:42 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::a6) by SN7PR04CA0085.outlook.office365.com
 (2603:10b6:806:121::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 08:04:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 08:04:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:04:41 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 26 Jun 2024 03:04:40 -0500
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
X-Inumbo-ID: bfbdc8be-3392-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG5vA3O1yl86CKJou0Meq900XZ7B9zPP2RP8XYnfMgqL2d5nTAXQCEu1wz8JGRy2UAVEf0voc00PyaJTprv2UVxiYcjDA08XYTdtAHuE0go4uk3VEc6J04LyqO/GsuK+wp6+ULr+aCWcupzEV6DfbMmxyBEjtJThypMKVY7Jm1RO+IoSTsydGW/kCkFCtWDz4/D/52h2T7u/JigS3BurEr9UgTMJ97mdPT7hYd+ZxAdwgXUrQqZbQ/5HRH/8p5Zc+09fxcygwlrz5hyN26WmuAoQCeX9R0miKPfuSH5bZuUuLCTZdkD8akpNHBVtl5iNTV2QCsl2RqUt9d5XBVidDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhiipniAr4aaZAMzuqDcpiRmiIFd3EPblKq1s2aS80I=;
 b=P+RZCUw4pk5lXsGiyOdp4XngMqGYrK0sO9YDAnuY3icpolpu16kGmcwWk4tvRcM2EFgxPA5kn2cxe4A4s4MBuDIOqjZaj0R0KEgXvqn6+OBFZ8W7/wya/2X2yNOAzqCuxxTPbd26sNeiw4r5d2MC0c1cN9z45HRRlNlgEo4szbzPFLYWRmzpizYym2Pm/vNLUNf1smxlkTTb4IVMR7BqCLRgv2hJFwjVileAxGIaNVnjVqQollL8ethP2xMfeRnvMoChl/5eVk4ywznbjgZ41GQ2giQBEWch0uIhf+qX2NUKUMnh4kcQ5c1i8gKSOW0crDGPWbl5Pik8YH9EtlBxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhiipniAr4aaZAMzuqDcpiRmiIFd3EPblKq1s2aS80I=;
 b=y/GCR7IwW5AbczkO4rh4axphh7/ltk7SMomGbiem6cleI5XvEFee9QM6nSK/r1/xcjEsPOvJookN3YBaOILgyW2FSLvbfnZRpV65ZepCI1qzGOaDi+1xyM+wxo17T7dC54WAl6aRlsSngIwRIp1e7Wqfrf7Apq4yzVAvimo+288=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node probing
Date: Wed, 26 Jun 2024 10:04:28 +0200
Message-ID: <20240626080428.18480-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|DM4PR12MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: d49f604e-8aba-47c7-7dee-08dc95b6a27d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|376012|1800799022|36860700011|82310400024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KUvnWMzpuJANhlvlsKxmXtF6O59CwLvhLbPgXy2jwQgqmz85ra4pe4/Ypcva?=
 =?us-ascii?Q?HQko81dixeW2ZASD9Ibdi0lILactg0RCaMUhNgwoQuzn6wq2TgWvNkOQDS8p?=
 =?us-ascii?Q?CcXv35+WWWuQCU8uqlzZmtPCW27Fs9fnsBmgB7G98GXAvD25vROSH22c83KI?=
 =?us-ascii?Q?qFCjj7YexSPBAkDbtJmZ9lfpGFNa/975jNdfgxPdHaRLWmU+YhNEgb7PhVRr?=
 =?us-ascii?Q?61SVp4iurnuB/XVHD8rU9gNUfbHEU/NFf5MuK34zeyQrrJvN8DR9/4JckXdB?=
 =?us-ascii?Q?N6oHx/NEM7+RTBPaapUMSZeoaON5eTFom/B6SXfWIXYZ031xkGxXWlX9HIZa?=
 =?us-ascii?Q?RKai3yY3tvpQaRQTZo/+9TXivc0j1IxcjIS3znvSSiAQTQ0cwLb4OR9SuGuA?=
 =?us-ascii?Q?Zkw3UKhPrue8aB3SpngCYyTMHmGOcQf/xtTRap9HPHL3/8wQAqO5f8co6B4P?=
 =?us-ascii?Q?k66qhLlRdFH+f173cKDPOJYYsSrYmkaMzPtK6Daq4q0wnF6TdaHetJFT9imZ?=
 =?us-ascii?Q?frdZiDVgGyVnbDXnI3ZQ/7y5qN3L+s/Gd9gva1XZsKuuKeXOAfX+6gffDfV7?=
 =?us-ascii?Q?4txnh6v3MAi2gDaNYVCQgmlYQMDYJGg0g40R6cK+Iyo9La7sfTgbGV6fVT+I?=
 =?us-ascii?Q?DWr+/pML/sKlOjwZJKb3JO3B9+AmtLonsgHrpf4aguvdfRUTYm7EFtm8yXL7?=
 =?us-ascii?Q?Z+5UO+tEjU9UOcWSv71rr42qb1b5btRrwCa0UgKC8si7yfjkh2Vaf3570kc8?=
 =?us-ascii?Q?/0sFHNu1YDteG7ZkSB3znqWLt2jTi2Lt6RdY3q+OqbnCuzFRv4H5hNpfnvXK?=
 =?us-ascii?Q?F1RbZ2vMDBadrhZlqdA0/NkmMOH/rWG/I7VYwYeQqsjQHqHX+2Pg8E7h7b4Z?=
 =?us-ascii?Q?VTcpZkB21UIdgaVSLWWvWk2ZpLdNK6VCbNXfA4MdUjmMqnOGag5lQjVMaLDh?=
 =?us-ascii?Q?cP17KXsbRWi0TwZxcLuMfDfcBmE2X65t8varyrbPK2GEzQO3WkRusFINf3+A?=
 =?us-ascii?Q?x52tR3W94AmhHocyIZ42lTXPCkICbiOPK5H23BJp6wPO9GLVbbznllW/cedD?=
 =?us-ascii?Q?e+eTdXB9MFWdFbNk61PYgtPf1dvUsVuFW7IK8zgSSbXrwbXl5BdnEHYWXAC1?=
 =?us-ascii?Q?aj9FH8YSAKqUkpV9F7DW1m6R1SPY8dhMirmj8+piSEOhIkDH5QfjMWEDGH9i?=
 =?us-ascii?Q?Q1q1BCzDQu42JKW8ZsyMEaN2De/+oML6ZfcpxLeKwJYeBHWzQaYFtyc6s4Lp?=
 =?us-ascii?Q?XZ5k+3SQn+/MgM3VZ/lRUFrt+BVNDlU/oZy2JSltlQnTgSZlbRHPzXjlNhTA?=
 =?us-ascii?Q?mRwgD1E01ybgZqO/XkJ5IL4TZ1d78R4Jc9Azb9heurZl+Rf98GcEZh098hf/?=
 =?us-ascii?Q?cM4jSexp7xLrRVAn9DwrEJU2gXrKXG7Nb853OXk3fwcqpk2RyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230038)(376012)(1800799022)(36860700011)(82310400024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 08:04:42.1550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49f604e-8aba-47c7-7dee-08dc95b6a27d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913

Memory node probing is done as part of early_scan_node() that is called
for each node with depth >= 1 (root node is at depth 0). According to
Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
as a top level node. However, Xen incorrectly considers all the nodes with
unit node name "memory" as RAM. This buggy behavior can result in a
failure if there are other nodes in the device tree (at depth >= 2) with
"memory" as unit node name. An example can be a "memory@xxx" node under
/reserved-memory. Fix it by introducing device_tree_is_memory_node() to
perform all the required checks to assess if a node is a proper /memory
node.

Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and size")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
4.19: This patch is fixing a possible early boot Xen failure (before main
console is initialized). In my case it results in a warning "Shattering
superpage is not supported" and panic "Unable to setup the directmap mappings".

If this is too late for this patch to go in, we can backport it after the tree
re-opens.
---
 xen/arch/arm/bootfdt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 6e060111d95b..23c968e6955d 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -83,6 +83,32 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
     return false;
 }
 
+/*
+ * Check if a node is a proper /memory node according to Devicetree
+ * Specification v0.4, chapter 3.4.
+ */
+static bool __init device_tree_is_memory_node(const void *fdt, int node,
+                                              int depth)
+{
+    const char *type;
+    int len;
+
+    if ( depth != 1 )
+        return false;
+
+    if ( !device_tree_node_matches(fdt, node, "memory") )
+        return false;
+
+    type = fdt_getprop(fdt, node, "device_type", &len);
+    if ( !type )
+        return false;
+
+    if ( (len <= 0) || strcmp(type, "memory") )
+        return false;
+
+    return true;
+}
+
 void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
                                 uint32_t size_cells, paddr_t *start,
                                 paddr_t *size)
@@ -448,7 +474,7 @@ static int __init early_scan_node(const void *fdt,
      * populated. So we should skip the parsing.
      */
     if ( !efi_enabled(EFI_BOOT) &&
-         device_tree_node_matches(fdt, node, "memory") )
+         device_tree_is_memory_node(fdt, node, depth) )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, bootinfo_get_mem());
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
-- 
2.25.1


