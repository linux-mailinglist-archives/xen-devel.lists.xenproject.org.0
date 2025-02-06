Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51796A29E3D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882392.1292543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO2-0007uo-FP; Thu, 06 Feb 2025 01:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882392.1292543; Thu, 06 Feb 2025 01:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO2-0007mD-7S; Thu, 06 Feb 2025 01:08:58 +0000
Received: by outflank-mailman (input) for mailman id 882392;
 Thu, 06 Feb 2025 01:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO0-00072L-Pb
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef86a1cc-e426-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 02:08:56 +0100 (CET)
Received: from CH2PR11CA0021.namprd11.prod.outlook.com (2603:10b6:610:54::31)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 01:08:52 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::b3) by CH2PR11CA0021.outlook.office365.com
 (2603:10b6:610:54::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 01:08:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:51 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:50 -0600
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
X-Inumbo-ID: ef86a1cc-e426-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjQBKBD3P8Fpijt1J99iIgWaJPxMvcDZwEMnZqfIhUMNRbvrz9vM5e87hesSgsMgno+f12OPovqYCQTnEmdJcbTvoOv9bvhcZWZjUj8X609+4FwNaYDdcIfuPGoeLwF8Q/i1VzOL3hr2Pfd7dlo6YlcLPFd8iKYhiaGJrXP47FPaPAnHJK6+Dq/8jj81LzHjFnnI79AiTSRbrtYiHOnR3qgbJjdB15D4sNZbpw011iw8ZK7jvqeqpfsooAywSYFUuael+BK09wat44U3mdHeGkW7R4G7zQn877HEY6jWrs2dLbvY/I0roT3xzxcQ5IzRBs0zun5jxsQbI2XOi9xgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daOax8klOqjAxSCiNvctaqLlfeBSvVM5+snjZ6hLooc=;
 b=esYU0c/NNYKisrAkpinQkvXINlX1+yOTnzOszWo55qbKT4aHNH/KZqAo10ZRwutx9A1W27M7IYWKNbHIzzJRs+lcTgMVSo4DQnjmSbA+V7upa3OIBgQbnx8WSLAdU4TNeQAem0XzhFF3hsa5rPL+6yWJtfttkUlWQJpXdCbY3px7m7FwcAmqZzChD25tUKDYa3zpXjaS6EFqEBaEkKD3W6vNI1s4h+7tq/yEN5NK7A3+Cgp3BIVByIhFopA8vd01XJOQSvrf3B76x105KmfS20LCYyPqsU2BFr1zroPGmCSPE7lH/yrb7r7v+XE2/IaLlTUrIntWCuVjtq0ZJP3M1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daOax8klOqjAxSCiNvctaqLlfeBSvVM5+snjZ6hLooc=;
 b=WwZo2ye6hVDawN2ZnI4hNjRgouXDL/2CBNBBSCAmoOTRObZxL2aw32/R99hWqfUDhuNYklboUzvSOZw7+0+Ibdnrbm3ywEDIryuswG7f1NMEQLoPLpfPZJssmSsvTL002P0R9DRuIK307Jh1eh/YWjtbKk6VIvIZD09nj+J1808=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v5 7/9] init-dom0less: allocate xenstore page is not already allocated
Date: Wed, 5 Feb 2025 17:08:41 -0800
Message-ID: <20250206010843.618280-7-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d92ad6-c649-46ef-ba7c-08dd464ad22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P3kpe/nVtzciGgfHOTioDOTToIjUNhoWvCdip3892zIJ9fPdY2pjy7SzEHNa?=
 =?us-ascii?Q?/xREjDNQkxiIiGBLOtjVjOMbz63SequwAdd+5tKTussexZwMy3u+mFjQ+uCe?=
 =?us-ascii?Q?VWVBNk1L9tYWUM2o3uk7GNDEHzz1ld3GbOo9CrAMie8KoNaq62DPO81lOqlw?=
 =?us-ascii?Q?VYZXATn1mVAdSsJFRbwiVwcY7GN+zDX220TI+3P3Dw34GFiaA2OsA/MgnLqR?=
 =?us-ascii?Q?phitQnXbUvTH7MpvJq/5MWP7WBPtc3esA3xNKzYvrqsGQlsAky9Og66yxQKV?=
 =?us-ascii?Q?3xPkdtJWgQ/S6bCs+mGEPbyh0t+1FuKZ99uTFj091pccpNTQxpsHkPTek0Jv?=
 =?us-ascii?Q?t3VL20TCk8/M/lrZSCzMX0uwQZZFRSbfh5JT4GUvN2kNDuk7nimNIJFHzdnG?=
 =?us-ascii?Q?a1cw0wVzCjAYRt0u9Yxs8hZlNcXOIteCJOY7FYcNSMuZww2Uv3TC8zbrU9YR?=
 =?us-ascii?Q?jjuRHxvPG2fyE0jPaNxqC84WX4pSMIi+4wLzTBl/SeWShBubCiML5Oubdf1S?=
 =?us-ascii?Q?TkryXfunX6N6tb24XZl1VRfzWxsWxx6IOk899UYskdc4VPvNOSiO+BXRYQUU?=
 =?us-ascii?Q?DSbShFpMP9VCsInOXXQnpGuagCVGf6IOx5qRmeQyJfsKn7Ckud7kuNSni2H+?=
 =?us-ascii?Q?l76Bl0NF/jEihc7hRBk55JxksvNFYZGV0Y7OU62BTqPQCOf2U/twjWuTaMYv?=
 =?us-ascii?Q?+YuykIMgJZXLJi6PwUYHZFqqx3XSZklbJuwnTkqgSeyvZdDzUDrx6ufsxda3?=
 =?us-ascii?Q?JET/y3Sr46bXKAmRGA7mRz9Y95NCAoBoQB+f1EiqbimWPE7+E4twEo9cVmrs?=
 =?us-ascii?Q?QW2a9aEo0GDixySDdMQEceanN7iMtx02+VwIFcEcAECvs9izWawRQQsdlkWn?=
 =?us-ascii?Q?9+biiKSNWlcLjyC7pJo35hUePzx0CSPQA0ytcvtSeg2BEoZhEOePsEJlrF5J?=
 =?us-ascii?Q?9rYthotnOoDccHXosmr7P/f4a+n9cQCr9xykEw34XI2bDZ2dj6cSd0tlYRKH?=
 =?us-ascii?Q?joAXhjA4H7YpS/ATVaYXQt5nmUS7lKBjHLV/95VkS5TfNbvA8nwcxHV0cxIZ?=
 =?us-ascii?Q?HEYY6LMCIk/5/5Uze01ydOeGdCj78fc721ovGCu0P7dSZMQcLlUXmbMVAiMF?=
 =?us-ascii?Q?dpisAN3hiwwd4NksWMqTuft+IySeNyGtv9LbGZt6s5KY4XFGXoDmdVfWN4Zx?=
 =?us-ascii?Q?wouUD+nj08aqP4RK7Zsh9MLorbwxw36OaeMCtRbteW79ta+qTvjY1DhSFhn/?=
 =?us-ascii?Q?IM53hh42D80O4C1Fz6L9cTEBogzlRHaZ+EtO6QgRsCPR+9XtPcYO0OebG4gx?=
 =?us-ascii?Q?ETxoU4B9hkR4+j2+O2W7t8FkAhjuD6v1Tm4gcAIl2F7rhB2wJ4rQJwCRzBFM?=
 =?us-ascii?Q?ceqEcfyCi97CDacPvdTWU8kEKwkq5QSiWBJ+Bfahu9H2MuEx4k4oU8TYuqyc?=
 =?us-ascii?Q?CpbCapoKpzOWJTl5wLvX9hfxiwksLwsXdVVmZr7Ro/PJ4AYbcxu1CzfYahfY?=
 =?us-ascii?Q?rCkYO37JwWi8BWw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:52.3277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d92ad6-c649-46ef-ba7c-08dd464ad22d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271

We check if the xenstore page is already allocated. If yes, there is
nothing to do. If no, we proceed allocating it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 tools/helpers/init-dom0less.c | 54 +++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 2b51965fa7..3cee325358 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -16,8 +16,35 @@
 
 #include "init-dom-json.h"
 
+#define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
+
+static int alloc_xs_page(struct xc_interface_core *xch,
+                         libxl_dominfo *info,
+                         uint64_t *xenstore_pfn)
+{
+    int rc;
+    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
+    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+
+    rc = xc_domain_setmaxmem(xch, info->domid,
+                             info->max_memkb + (XC_PAGE_SIZE/1024));
+    if (rc < 0)
+        return rc;
+
+    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
+    if (rc < 0)
+        return rc;
+
+    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
+    if (rc < 0)
+        return rc;
+
+    return 0;
+}
+
 static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
                        uint64_t *xenstore_pfn)
 {
@@ -233,9 +260,30 @@ static int init_domain(struct xs_handle *xsh,
         return 0;
 
     /* Get xenstore page */
-    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
-        printf("Error on getting xenstore page\n");
-        return 1;
+    if (get_xs_page(xch, info, &xenstore_pfn) != 0 || xenstore_pfn == ~0ULL) {
+        struct xenstore_domain_interface *intf;
+
+        rc = alloc_xs_page(xch, info, &xenstore_pfn);
+        if (rc != 0) {
+            printf("Error on getting xenstore page\n");
+            return 1;
+        }
+
+        intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
+                                    &xenstore_pfn, NULL);
+        if (!intf) {
+            printf("Error mapping xenstore page\n");
+            return 1;
+        }
+
+        intf->connection = XENSTORE_RECONNECT;
+        xenforeignmemory_unmap(xfh, intf, 1);
+
+        /* Now everything is ready: set HVM_PARAM_STORE_PFN */
+        rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
+                xenstore_pfn);
+        if (rc < 0)
+            return rc;
     }
 
     rc = xc_dom_gnttab_seed(xch, info->domid, true,
-- 
2.25.1


