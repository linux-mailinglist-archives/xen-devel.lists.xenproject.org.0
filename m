Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D485AB5D76
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 21:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983527.1369820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvig-0004Qe-4t; Tue, 13 May 2025 19:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983527.1369820; Tue, 13 May 2025 19:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvig-0004LF-0d; Tue, 13 May 2025 19:55:18 +0000
Received: by outflank-mailman (input) for mailman id 983527;
 Tue, 13 May 2025 19:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKf8=X5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEvie-0004HX-CM
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 19:55:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2412::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ef48e13-3034-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 21:55:14 +0200 (CEST)
Received: from SA9PR11CA0004.namprd11.prod.outlook.com (2603:10b6:806:6e::9)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 19:55:10 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:6e:cafe::3a) by SA9PR11CA0004.outlook.office365.com
 (2603:10b6:806:6e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 19:55:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 19:55:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 14:55:08 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 14:55:08 -0500
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
X-Inumbo-ID: 2ef48e13-3034-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCpGVmIBjn2wOkpuMNDC822wlOz1QvGWHKk3Izp0zg3gDVMW+0YR3whimP/dJrk85eKVFuVkYNvJWudATrTzgjvz9YzZUT0RTRwsCtGrI147Epn3jUvjzFiVsQV4e1TUvFMvT5prWVz8unC2MadeF6mkmgZ90Fl5nb5inSo/+mjtYe5GWLZK22wWK4LUDdo+QE1eXiEU2LsaOswLUYAXRwVUrOJbumDXqy6oxdZfykx5weRK20W/cVTKmaLlxjHP6Yn7hhKr4R0mCb8uIdRAeUBKGX/j1zLrmizZARR09A803bzjkpgBttq4XkcLZujmHBxEZxrI8+QB+0ovmSOUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q/AfSxkx8gwLWAIeOfpqYIVtb/6CQnpScz5R+ZxTS0=;
 b=MiTeB2klZHi85ucFX/iRX1JFfxEzBsp0T39yECVUqUb0tUoZkHVJMIXLh6UL/XeRgz7YU0QC0uYnWeWPGTNvPU2R/dwaIyTfTaj1Jd1FN3sW9Alc1//fVi9zIzVpE/DGSLrnvzIw+E7aCVoD+UKAgqz1rdrvXDA5rvWsacQSGQ3SlAIvvKPoLaou/A7vWS7YL2nqm+M23I54iSkEOvPrq6/RJyZ1IohZjzKm4OpwADYhB8EZCt0u6cMqtE3erdnaWCz3vMHAM8Q7cp7o52qHEjSt8jCGTqaFoyfZ7SsqhkVA369tqb5y+IBHNe7FUfea1ltxyq7bsDqfgl8J09gtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q/AfSxkx8gwLWAIeOfpqYIVtb/6CQnpScz5R+ZxTS0=;
 b=iIQS7ThyaZoN5n6YMm7EiMa5aLcIopP+DXjS2CjIikmOUzd9DJhB2gGZ8w7fBr6E92KHNeIFmm1u6HG/LtSMpET8d2NNV2B+evuwCShNfmxSJJUbkQjOV63DKgQr97YilfKQFcl6JIZaKjOlKKxBxAZWcZnzGWc3mGuN6oFeM98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/2] tools/arm: exclude iomem from domU extended regions
Date: Tue, 13 May 2025 15:54:50 -0400
Message-ID: <20250513195452.699600-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513195452.699600-1-stewart.hildebrand@amd.com>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: beb95c2c-6f4b-4791-996a-08dd925810b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i8MeGLh9iTGti8f4ipxcpLOLCSixB20FnO0wN+GSvXkGyD+Q9vROcA5oqBEe?=
 =?us-ascii?Q?87tfM/Mu0frC3MOleyugvNrdr57GWqf1XoKWFOk/gOlmHoPnchIwHCRB3TJ1?=
 =?us-ascii?Q?8JyGr/QR17k3YntvVvHxwgCIhRTgzbk/a1MWAb1SMl+sDuGxAkJhcJTymsDz?=
 =?us-ascii?Q?RpJHTniu2ryV24wFJSrIcaOdQOq+mLQmMo6aTfVS6GDUiSJC2gu0ak5e0Y3R?=
 =?us-ascii?Q?4XzwyrqD3oFBNX3dhKJ4Hr+CeMsHLHVzo4Vz2xEEfNXIhQXnj74aMdt/bFb+?=
 =?us-ascii?Q?0MnGcjdHq/cbWb4psJ+8k9ym5/jmoI1IEqwIAAKa8St8WJH+H0MmVJhrbSUS?=
 =?us-ascii?Q?v0pj1V8qtB806aO7wemUS3CK+Dhp5niKL8imTm/7Nyu7/zQEvQiPVNFMzIdM?=
 =?us-ascii?Q?N3pm+6qH9yHN7IY0zH8EqcC1nkgfpn0046ZXzRnW6ix6uMX43cXNqbx5nJQ1?=
 =?us-ascii?Q?CTJdQGNk9UvGbVCNEuedHlQbsDh/VYv42IPzJQh5ynCZKKN/4tRjJKzb+GJX?=
 =?us-ascii?Q?DgzJuc0JyjSuIfatANP2Y4ZcuzfzIh/bjuasxjAQDDJRFSwl+wyZH6BG10Sr?=
 =?us-ascii?Q?JvwEJsdET9H6ACM4jCdyO7YYsQHmSv1hlvtJmgS97YRKqjI3RISCE8ftQ08a?=
 =?us-ascii?Q?qRLt06XCMAWavTet9Wh92LjOvE1N93hncB9BSFOJpau2SXNpzsJQ2NIjqX2Y?=
 =?us-ascii?Q?o4BXPheau2AcuPgTtSzfyHhCY9xIC86Qqo0AJk7V9GudhUNris/PC/CLspsO?=
 =?us-ascii?Q?T6EZMsA2NeVlLbxyzm+Ag4STUHRYVf7AqlxKxFL3ftQ6jk872zivqldrYO+S?=
 =?us-ascii?Q?YbM2SF3Rf9eyjAwFpMopmT7NdXW1R+r8zOySft9jKaiZSzP2UpfFyQt7T5wW?=
 =?us-ascii?Q?Q7bpmgXqmFrV+dVvjTmafRjp+45nvlkTJr0HdOL+CDuUPTjH7QZaCkvaPuED?=
 =?us-ascii?Q?lH0gmcL+V4/nvqlRDNG4Qhs5kvHno9OJPZtyM252QHvFJ/yDPRPe9LEwLvMP?=
 =?us-ascii?Q?SvhtJKiuUw7MdcOauHvAH7Nfg0gGBlw26uw/tRXUE6wQ7GboEa2Sg2XJ7r0Q?=
 =?us-ascii?Q?PK3qOLrrcBLsQsL1Gj+KZ2Jcj9GLNFLF3n5x7X+KFCaC6n9CBTv8Hy1hPAUV?=
 =?us-ascii?Q?DomrOMeE1RbgyiqQfCROwNLrxFONCjr4RyB8rrXgTCwAPjM1JnUbzwkQq0W1?=
 =?us-ascii?Q?kzJT0T6kqY23kqNvcEdHY4GQ3oZVzL22P1R0TJKTv/btqXesX8INlQuw1F0K?=
 =?us-ascii?Q?yx/SWuYMZgTL9OOyFJmAa8M0My9HTazRf4ngqxbXBdOMBp31xR1RFFJcxyDl?=
 =?us-ascii?Q?OPMFOAaG1lnHo0OpaLm5Us1841g5PGfHb8XrAfo9hTAGVHpJJICH4uHhFZb5?=
 =?us-ascii?Q?eC9EQlgDSc71iM8Ca+wHQxecYXNwQ2UwcXBqdrA9IYx83Q/PEJdApIvsZjFg?=
 =?us-ascii?Q?1fUCbJ8cZgu9cJMgsWfjeH0A0IgUZ1yaM7jm0xx5ZFGURGhUsxUGMNcgcOHa?=
 =?us-ascii?Q?O4yy/UzLxgLRvdXmQO/q/A0oEgD9+ioGiD8a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 19:55:09.1341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb95c2c-6f4b-4791-996a-08dd925810b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

When a device is passed through to a xl domU, the iomem ranges may
overlap with the extended regions. Remove iomem from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")

v2->v3:
* no change

v1->v2:
* no change
---
 tools/libs/light/libxl_arm.c | 118 +++++++++++++++++++++++++++++------
 1 file changed, 99 insertions(+), 19 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 75c811053c7c..8ae16a1726fc 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -798,6 +798,8 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+#define MAX_NR_EXT_REGIONS   256
+
 static int make_hypervisor_node(libxl__gc *gc, void *fdt,
                                 const libxl_version_info *vers)
 {
@@ -821,7 +823,7 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
      */
     res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
                                        GUEST_ROOT_SIZE_CELLS,
-                                       GUEST_RAM_BANKS + 1);
+                                       MAX_NR_EXT_REGIONS + 1);
     if (res) return res;
 
     /*
@@ -1517,17 +1519,29 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
 
 #define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
 
-static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
+static int compare_iomem(const void *a, const void *b)
+{
+    const libxl_iomem_range *x = a, *y = b;
+
+    if (x->gfn < y->gfn)
+        return -1;
+    if (x->gfn > y->gfn)
+        return 1;
+    return 0;
+}
+
+static int finalize_hypervisor_node(libxl__gc *gc,
+                                    libxl_domain_build_info *b_info,
+                                    struct xc_dom_image *dom)
 {
     void *fdt = dom->devicetree_blob;
-    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
-        bankend[GUEST_RAM_BANKS];
+    uint64_t region_base[MAX_NR_EXT_REGIONS], region_size[MAX_NR_EXT_REGIONS];
     uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
-                  (GUEST_RAM_BANKS + 1)];
+                  (MAX_NR_EXT_REGIONS + 1)];
     be32 *cells = &regs[0];
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
     const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
-    unsigned int i, len, nr_regions = 0;
+    unsigned int i, j, len, nr_regions = 0;
     libxl_dominfo info;
     int offset, rc;
 
@@ -1542,20 +1556,90 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
     if (info.gpaddr_bits > 64)
         return ERROR_INVAL;
 
+    qsort(b_info->iomem, b_info->num_iomem, sizeof(libxl_iomem_range),
+          compare_iomem);
+
     /*
      * Try to allocate separate 2MB-aligned extended regions from the first
      * and second RAM banks taking into the account the maximum supported
      * guest physical address space size and the amount of memory assigned
      * to the guest.
      */
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        region_base[i] = bankbase[i] +
+    for (i = 0; i < GUEST_RAM_BANKS && nr_regions < MAX_NR_EXT_REGIONS; i++) {
+        struct {
+            uint64_t start;
+            uint64_t end; /* inclusive */
+        } unallocated;
+        uint64_t size = 0;
+
+        unallocated.start = bankbase[i] +
             ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
 
-        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
-        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
-        if (bankend[i] > region_base[i])
-            region_size[i] = bankend[i] - region_base[i] + 1;
+        unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
+        unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
+
+        if (unallocated.end > unallocated.start)
+            size = unallocated.end - unallocated.start + 1;
+
+        if (size < EXT_REGION_MIN_SIZE)
+            continue;
+
+        /* Exclude iomem */
+        for (j = 0; j < b_info->num_iomem && nr_regions < MAX_NR_EXT_REGIONS;
+             j++) {
+            struct {
+                uint64_t start;
+                uint64_t end; /* inclusive */
+            } iomem;
+
+            iomem.start = b_info->iomem[j].gfn << XC_PAGE_SHIFT;
+            iomem.end = ((b_info->iomem[j].gfn + b_info->iomem[j].number)
+                         << XC_PAGE_SHIFT) - 1;
+
+            if (iomem.end >= unallocated.start
+                && iomem.start <= unallocated.end) {
+
+                if (iomem.start <= unallocated.start) {
+                    unallocated.start = iomem.end + 1;
+
+                    if (iomem.end >= unallocated.end)
+                        /* Complete overlap, discard unallocated region */
+                        break;
+
+                    /* Beginning overlap */
+                    continue;
+                }
+
+                if (iomem.start > unallocated.start) {
+                    assert(unallocated.end > unallocated.start);
+                    size = iomem.start - unallocated.start;
+
+                    if (size >= EXT_REGION_MIN_SIZE) {
+                        region_base[nr_regions] = unallocated.start;
+                        region_size[nr_regions] = size;
+                        nr_regions++;
+                    }
+
+                    unallocated.start = iomem.end + 1;
+
+                    if (iomem.end >= unallocated.end)
+                        /* End overlap, discard remaining unallocated region */
+                        break;
+                }
+            }
+        }
+
+        if (unallocated.end > unallocated.start
+            && nr_regions < MAX_NR_EXT_REGIONS)
+        {
+            size = unallocated.end - unallocated.start + 1;
+
+            if (size >= EXT_REGION_MIN_SIZE) {
+                region_base[nr_regions] = unallocated.start;
+                region_size[nr_regions] = size;
+                nr_regions++;
+            }
+        }
     }
 
     /*
@@ -1565,16 +1649,12 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
     set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
               GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        if (region_size[i] < EXT_REGION_MIN_SIZE)
-            continue;
-
+    for (i = 0; i < nr_regions; i++) {
         LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
-            nr_regions, region_base[i], region_base[i] + region_size[i]);
+            i, region_base[i], region_base[i] + region_size[i]);
 
         set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
                   region_base[i], region_size[i]);
-        nr_regions++;
     }
 
     if (!nr_regions)
@@ -1626,7 +1706,7 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
 
     }
 
-    res = finalize_hypervisor_node(gc, dom);
+    res = finalize_hypervisor_node(gc, &d_config->b_info, dom);
     if (res)
         return res;
 
-- 
2.49.0


