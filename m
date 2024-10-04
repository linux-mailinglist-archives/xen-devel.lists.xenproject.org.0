Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C989902D8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810342.1223050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKW-0006fL-D8; Fri, 04 Oct 2024 12:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810342.1223050; Fri, 04 Oct 2024 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKW-0006dO-8m; Fri, 04 Oct 2024 12:22:44 +0000
Received: by outflank-mailman (input) for mailman id 810342;
 Fri, 04 Oct 2024 12:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKU-0005ue-DK
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2417::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 597c7128-824b-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 14:22:41 +0200 (CEST)
Received: from BL0PR1501CA0011.namprd15.prod.outlook.com
 (2603:10b6:207:17::24) by LV2PR12MB5847.namprd12.prod.outlook.com
 (2603:10b6:408:174::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 12:22:37 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:207:17:cafe::77) by BL0PR1501CA0011.outlook.office365.com
 (2603:10b6:207:17::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.2 via Frontend Transport; Fri, 4 Oct 2024 12:22:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:34 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:33 -0500
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
X-Inumbo-ID: 597c7128-824b-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG6IjzYO9AO3iSWdMkQcIP4fBNpwJMmjxBx2GU/iT7GyCzFUDIYfXjgUBCHGnVti4rEcHzilB/92aR4L6TKUpj/KH9BqTXylzKcezFs01fK3QZ4kyjFHnbLzlEKKMruLtbw6UHY6ShKVsY1rbDv/o3Q4cFKHLZQmBraI6msGfM2/UqDrgLVLpgf50AWdKwOAZbQslWCZW0kPxNLleR3iOQ8/DQSzaeKFZg2+hR7tU0SHc2ztmWbxLOLTeAHKgeb3zd27PgLe+1stEqGKdxkmF4LTmyUqHyU0clqMZni4RUbThcZ81UFbQV151DHqUxYcvlv5fr0orQJ9TmCR8VxaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJLyeaB5M/7YIwM/WFENv9oGD3G+4gjHz/pbXz8yRWs=;
 b=gxhVCnpZNNyBEmNsXydXPkhHMV19LJkkc0cC5N2KCiO+p5wSW6epJg0cdl0s+J2HtCNz7tOWG27qx3P9QLdMBSE8DM2xBS3/N0pz7E0yQQLo+obskig5UqhdJvSehieRKkNuguu04P9E8ovGSfxPJ5NjSLPMSdZKrtuTu5Cezevk2a7QGTKqC+o3O66UdbXzi41m7fv1K78cFHls+AljWWdM4l8z+zT17V8y2s6aVvYcunMHcUir0Zd1RoxoIVSmJA5S0JLwz+AgDn7di4uyGnMjB5aNlWOyWrXIUwNjZAwK8qwegzkSGy+L32T69AZe6Mzt6hDxpKzNjsj/IM2aNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJLyeaB5M/7YIwM/WFENv9oGD3G+4gjHz/pbXz8yRWs=;
 b=tbPmPGJXMG4WP7YElZ4G03hNWJwAh++5FxEUhEFcIlrtlZQeO0lMa2BSRJBxjpZ+GMZ0gCw+n8RLjfkS8UWrYBPh6V0zMGOzEIK0pPMrFTGIs8MfTDIjOIWUc0eVn6pbZP8iM+fZjKz19L8tV9O5jhXl/0nPl53YQmReBYINU54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 4/6] dt-overlay: Support target-path being root node
Date: Fri, 4 Oct 2024 14:22:18 +0200
Message-ID: <20241004122220.234817-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|LV2PR12MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e894b71-36ed-455d-4fd6-08dce46f3bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0EX1QhFSaSjFvuLtjA82g4DgiUP1k2e9Itab9WnCxo9S4wGAouMj9bLrDVaW?=
 =?us-ascii?Q?TjVCN0RetPuxc4kCaSl3HzOxc4Rz4WfAETM74mHLeMgR8YgLvkUI/i86TBIg?=
 =?us-ascii?Q?XBTdf2oU+upvzb8sUUhiSgSGFrqtl8KUgAR8j/q9aP1pdV6Cr98xd63vUVbZ?=
 =?us-ascii?Q?++0QgfBabOuIbcRQ2p12KWPNfpkCHaI8qoVgikkonrJ4r2+VaZgKx3I3Nq2k?=
 =?us-ascii?Q?bSybsj3BkF+zkn8XFH1c7yJnJ5+uWYa7NQe6+0Bi/PKYJO14aobdHRgrWIJ2?=
 =?us-ascii?Q?5y15x8We8S/0Ni1KBMtXf77B549fEym+p2m/IpD/SseOWKfx2KKgi75kV/54?=
 =?us-ascii?Q?c+oC6x0hIHkBiotX7/E2mauE0E6iyD62X6Gt2+7LxQ2kBPW6Or//YdkNIgWK?=
 =?us-ascii?Q?aNoE9dinOKj4oyV06WH6E1TAv1f2/XpGvkNZ6hBOBH81e+F1G65gEVff/Lw1?=
 =?us-ascii?Q?GBKGzwI9CyFdWYsyytCvvRj/JjIbJmpnp68/e5Hv7ibfU5qQhovbpN+O7v82?=
 =?us-ascii?Q?kaydyOyI9wrYk1X9ycHldmPEjnhBknYJVdHJvfmhCyMkeAd2nix2rE+7UF2a?=
 =?us-ascii?Q?mURZKVHwLi9H4lUj2Z3QWRBf/h27VI2aOAxfXFUun6oqyN2FJ6OwQCJT6bGI?=
 =?us-ascii?Q?FEI499q65g/9Zw6y0mgXQi8kzb4S0rpXqlT2QrHUOOi2pNnC810rrNi4pUVD?=
 =?us-ascii?Q?VbeFpdNJIGqiAcVnBnt4Z9q1NSIoXiA10KZcvnETYRWmm5W0cUrC/gI1F9NU?=
 =?us-ascii?Q?W028hyL1iuEZpnO3OlDLkGKicc1lFxykHJVmXfiJDtq23OTw8xH4RREMxmhI?=
 =?us-ascii?Q?O9MQWQ0ZqgCB+GFGYMdU7ZKid55a/3GpSRTFyUp8uVDvqhDtK8RerEnFxg3v?=
 =?us-ascii?Q?6I5LTez1HUwYzQaVzEaxPsEi1bXCM4EKG+nVDJPgfTZRpRnjQNJDlNO5HpPy?=
 =?us-ascii?Q?FTctP1zx/YyTV3OuJklnM6rP8ZkQAuVh6sRFXNSeWZ5g0R9nFLV4JtacywQy?=
 =?us-ascii?Q?+mx394Om2yTV8/QCpLcSqVQXeGS3XFV4PyTsuazVU5rSJtUXQFLQtXYyt/ni?=
 =?us-ascii?Q?TtjssAaVuxXdirpu6Mpy0jikJJC2b82zXapX6jvooZYkPQJ0bU0kYwVThcfi?=
 =?us-ascii?Q?YIbVMJTt7AHm3mdEJSGlEfDJ9ZpFNFgVpXv+o5L0E3Hmfw4sPLDkfcA3/Ing?=
 =?us-ascii?Q?DvfHaKT18Wye1Lq2dF9LWRBm4PVAIsywXPE5P8scK/t+3tgGtR0LYF9ZgqsW?=
 =?us-ascii?Q?zeg/IEFKSQm9IDcaWVE1VRZxbQQ8UiY9R4DB1gF1EK6tW2NR267+BWNWtTXq?=
 =?us-ascii?Q?EMnl1zO25yLz1a/Y9Od0ZR/B+BdNdWElmIIiCnLA9nNf153fqUxvI21riMqQ?=
 =?us-ascii?Q?l+nz4tX+7l9gqU0shXXySjsKFzv2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:37.5193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e894b71-36ed-455d-4fd6-08dce46f3bd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847

Even though in most cases device nodes are not present directly under
the root node, it's a perfectly valid configuration (e.g. Qemu virt
machine dtb). At the moment, we don't handle this scenario which leads
to unconditional addition of extra leading '/' in the node full path.
This makes the attempt to add such device overlay to fail.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - Use ?: instead of implicit bool->int conversion
---
 xen/common/dt-overlay.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index d18bd12bd38d..bfa153250922 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -325,6 +325,7 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
             int node_name_len;
             unsigned int target_path_len = strlen(target_path);
             unsigned int node_full_name_len;
+            unsigned int extra_len;
 
             node_name = fdt_get_name(fdto, subnode, &node_name_len);
 
@@ -332,10 +333,13 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
                 return node_name_len;
 
             /*
-             * Magic number 2 is for adding '/' and '\0'. This is done to keep
-             * the node_full_path in the correct full node name format.
+             * Extra length is for adding '/' and '\0' unless the target path is
+             * root in which case we don't add the '/' at the beginning. This is
+             * done to keep the node_full_path in the correct full node name
+             * format.
              */
-            node_full_name_len = target_path_len + node_name_len + 2;
+            extra_len = (target_path_len > 1) ? 2 : 1;
+            node_full_name_len = target_path_len + node_name_len + extra_len;
 
             nodes_full_path[node_num] = xmalloc_bytes(node_full_name_len);
 
@@ -344,9 +348,11 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
 
             memcpy(nodes_full_path[node_num], target_path, target_path_len);
 
-            nodes_full_path[node_num][target_path_len] = '/';
+            /* Target is not root - add separator */
+            if ( target_path_len > 1 )
+                nodes_full_path[node_num][target_path_len++] = '/';
 
-            memcpy(nodes_full_path[node_num] + target_path_len + 1,
+            memcpy(nodes_full_path[node_num] + target_path_len,
                     node_name, node_name_len);
 
             nodes_full_path[node_num][node_full_name_len - 1] = '\0';
-- 
2.25.1


