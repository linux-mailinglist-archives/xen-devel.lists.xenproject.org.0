Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F36AD25A9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 20:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010407.1388528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOhKs-0004pp-5U; Mon, 09 Jun 2025 18:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010407.1388528; Mon, 09 Jun 2025 18:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOhKs-0004nt-2H; Mon, 09 Jun 2025 18:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1010407;
 Mon, 09 Jun 2025 18:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/lO=YY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOhKq-0004H5-Qv
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 18:35:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20631.outbound.protection.outlook.com
 [2a01:111:f403:2409::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c338c0-4560-11f0-a305-13f23c93f187;
 Mon, 09 Jun 2025 20:35:03 +0200 (CEST)
Received: from BN9PR03CA0759.namprd03.prod.outlook.com (2603:10b6:408:13a::14)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 18:34:59 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::94) by BN9PR03CA0759.outlook.office365.com
 (2603:10b6:408:13a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Mon,
 9 Jun 2025 18:34:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 18:34:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 13:34:57 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 13:34:56 -0500
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
X-Inumbo-ID: 74c338c0-4560-11f0-a305-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DutKV8WaGTg8FhrMDrhoW84o1VELPxseDGz+BmJ11Wi/DzXM40+sBqVnhkFyFO1bGsZyYMTAGYDA0VEwQ4BZSdTHXrvfqk56Qv34bob/LZYxK/IgEcwbeWqqYX1Zm/Tpff1wnIIVCzOO6n7Vj9SBmIMhIdC5U/0YNFVlizG+9SJTnBJbvoD7XY5YSgg7lGq9ERKVPOYNl0+WLQYEYVBHuqRG9GJg0P/eddM67gHuEYuK6CVSUy+ygABApa/fn/fmD2Ov32avAURnBWtk34sT6SlGrgsN3emLDh/DmevzCL+82VqalD7s6SpI5xssJPr6GOCQYOP3uYqmOUM+U9L7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZnrDKYY3avTKdpFv8IWwACHQfdwIEteEIO5b/rIpco=;
 b=cyRtM30GBnrt45htqhBlYKXSahYToSXlmoUQKjE9J7yqKacgslL+VjMVL9FbIsNhJ5XEwenpZpzsZEVXOLNEnKOzBqXZbZsa5vNlfEZ+la0jdhgkQEThVimFF0tD+fbTtXouziJdlQtXEr/ThgoV+55I5AmHo+LFdj3FJjiXVVH/Q4wbF9JLx21jzEgg03gh1RW95IsCmd9Aw5WoQxkr0KDe75Jx/0dSVt5VTmhb+BGvWFUCkjcSsIcBkRju0/FiCsPg8Et/mv9mKT2XWm5MRiOn6arQJPAbmSUCwGVk186SCla36xItxt3mNOz0S7XAtUSYjfHrpr93JQsVZuryLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZnrDKYY3avTKdpFv8IWwACHQfdwIEteEIO5b/rIpco=;
 b=OD5fX/1FHFr8bwUi/epX+5cOxtiS3ZBDmis00FpjTk5Bs9F7BPb7VYx/0SFZrZxzq3yuYivRkkUlBQHuNGv//DUcQYEr158c7pPzA3rCVn4k+saRDtmzBpwimiFYvc5I8nuM4XQrZ+uH0asRJZo5NZKwW5RaL8O85mSgLuDxGpU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 2/2] tools/arm: exclude iomem from domU extended regions
Date: Mon, 9 Jun 2025 14:34:33 -0400
Message-ID: <20250609183438.178214-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609183438.178214-1-stewart.hildebrand@amd.com>
References: <20250609183438.178214-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d11a86f-b415-409e-6555-08dda7845630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bB6AZCM9q6CeSGTOOKudle/jWcvg9lqoVTV2uWjGEyL8cOetJBuEGQQVL3hW?=
 =?us-ascii?Q?q/VcsJ0+AwR10UlwMT5XJE1SQPFWbrXZ6l7a0rxtN2x9HlHaK5VHBF7DT8Zd?=
 =?us-ascii?Q?Wf+eq+9saCrTq4rZOOxfJ9QQBOoAeV8Nq4FUgJtB06Y7Wf6/ZT6+ulI4CimX?=
 =?us-ascii?Q?nHapiaWS7H8QovEuSbhJNN3nroFkLinkKzO4Zt6j1zVVreMSBmRLKBpY+1QE?=
 =?us-ascii?Q?j7+xU40j5AHF5+OltwMzRexR6z98qqz//lrpr57ahvbmTXDTpA0r5PjIxPjK?=
 =?us-ascii?Q?3F+dEVtZmoAgrBTliCHljL2mzbUyzgK+VPdlDJaGPsqAn8+t6/wLi3BVy88V?=
 =?us-ascii?Q?oADFqWJdkyjqxrb/11mdUox2bdNzSNXkQ9i7UCTIaiYA/5kswUlKLuUDjmQD?=
 =?us-ascii?Q?RxUlrg7jDTnb2in8LjvUmZnrWs4RwRck8u5HSLYduoRxkdy3pVzUAy7+KWmO?=
 =?us-ascii?Q?fI0ly34y+ZivD0TW90fVG3HiOKDtztSh/5V/d+EBuXStnR8MJfdY9he4LZIq?=
 =?us-ascii?Q?GtNS6ghkL+YN17W4BovO3ytpoEWjlSAkzcbU/hpJGVuRfZKfHf9kJnEUfEl8?=
 =?us-ascii?Q?ky2zycCYXUfkJPX/cdZ4x8XnNdO0+gzl6ilPutAzU+xrQoOawwecMWLI9abH?=
 =?us-ascii?Q?7isP8caZnhbPNPD50n2cmIgQuYdCN1HmwfjxIggMQHnw7AC7iwyN1a8gxoxv?=
 =?us-ascii?Q?IDnuhdaGUAEqXEf/PhH89kUxV3LnVYveWI2srrble2r1gFj2TWP39IF/8k/b?=
 =?us-ascii?Q?dZpVEj+nTerWbxr92Dx0JyQEeUYd7+GSfluBb+vprO3vaxdTjhqVmHyMN7lw?=
 =?us-ascii?Q?Eb9uLjEtEw2BiRoh4rk9hHnyfWt/v9g1koY0CvSi8+u9ezZoV8DTMfLfSWfx?=
 =?us-ascii?Q?vjZo6GtGG9XJlg4BtdiG7y93xORDIYuhqCvke71b+Di4vhzfpVw47gyDwioy?=
 =?us-ascii?Q?hIyEQvbNVfIFxHSLV9CO3WA5gqVOW1KtHL3feQS5yBUSZNpP5UMVuuqClTdk?=
 =?us-ascii?Q?Ddl7vL+5FqT30LRlLc6vitt23tJe++Q5jCylRXM75U1aoR4CvX5XcQp6wINe?=
 =?us-ascii?Q?xFap7qrFW5kRLyQ3BzWjBT3kvz+spIoKKgW12Z9Y9YVyP2t48hZLJBXOxo+Q?=
 =?us-ascii?Q?m7qGlGEg+kGRLqIxbwVDwKL8NX5JlcQS6t2o+IFOSECdu+NEtGrbt/dg3QY8?=
 =?us-ascii?Q?wUdiP8m7sHePtpmIJwQZmPxJdCT49VnbEZ7jGLey9k59D5QX4q8+zVivcQoT?=
 =?us-ascii?Q?bHui/8Qr3+rLjBliNAJkaKU8o++/1xu8OymLrPmQo3Z50C5207gNqzSzkgAX?=
 =?us-ascii?Q?NNBY58gnaceqnXW+QoJ5umdv73+maO7hkjkZp6Pf3UZEPN8F3t/XPx62Crd5?=
 =?us-ascii?Q?9yAFbfTQu2DtvIvGT+UVfJQ8R6VL7skzWS/DZdWqUhNCDaKaOj1RPFud/OfV?=
 =?us-ascii?Q?c1qhFz/vkFLuHtz3nr6syeTvumYi6bkzNIbf6RQKGjmhWui5BBnlDZnYnemM?=
 =?us-ascii?Q?yMdNqPlJNMH3LRWcDoVup2E4IMtYYgqu11ED?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:34:57.9576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d11a86f-b415-409e-6555-08dda7845630
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455

When a device is passed through to a xl domU, the iomem ranges may
overlap with the extended regions. Remove iomem from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")

v3->v4:
* use "else" instead of continue + another if statement
* remove assert
* s/iomem.end >=/unallocated.start >/ in two conditions
* new variable to distinguish unallocated size from region size
* print base + size - 1

v2->v3:
* no change

v1->v2:
* no change
---
 tools/libs/light/libxl_arm.c | 110 +++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 19 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 75c811053c7c..3086c52acf83 100644
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
 
@@ -1542,20 +1556,82 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
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
+        uint64_t unallocated_size = 0;
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
+        if (unallocated.end >= unallocated.start)
+            unallocated_size = unallocated.end - unallocated.start + 1;
+
+        if (unallocated_size < EXT_REGION_MIN_SIZE)
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
+                    if (unallocated.start > unallocated.end)
+                        break;
+                } else {
+                    uint64_t size = iomem.start - unallocated.start;
+
+                    if (size >= EXT_REGION_MIN_SIZE) {
+                        region_base[nr_regions] = unallocated.start;
+                        region_size[nr_regions] = size;
+                        nr_regions++;
+                    }
+
+                    unallocated.start = iomem.end + 1;
+
+                    if (unallocated.start > unallocated.end)
+                        break;
+                }
+            }
+        }
+
+        if (unallocated.end >= unallocated.start
+            && nr_regions < MAX_NR_EXT_REGIONS)
+        {
+            uint64_t size = unallocated.end - unallocated.start + 1;
+
+            if (size >= EXT_REGION_MIN_SIZE) {
+                region_base[nr_regions] = unallocated.start;
+                region_size[nr_regions] = size;
+                nr_regions++;
+            }
+        }
     }
 
     /*
@@ -1565,16 +1641,12 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
     set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
               GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        if (region_size[i] < EXT_REGION_MIN_SIZE)
-            continue;
-
+    for (i = 0; i < nr_regions; i++) {
         LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
-            nr_regions, region_base[i], region_base[i] + region_size[i]);
+            i, region_base[i], region_base[i] + region_size[i] - 1);
 
         set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
                   region_base[i], region_size[i]);
-        nr_regions++;
     }
 
     if (!nr_regions)
@@ -1626,7 +1698,7 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
 
     }
 
-    res = finalize_hypervisor_node(gc, dom);
+    res = finalize_hypervisor_node(gc, &d_config->b_info, dom);
     if (res)
         return res;
 
-- 
2.49.0


