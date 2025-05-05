Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B724AA8B37
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 05:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975782.1363113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm4M-0004Gb-BT; Mon, 05 May 2025 03:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975782.1363113; Mon, 05 May 2025 03:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm4M-0004Cv-58; Mon, 05 May 2025 03:00:38 +0000
Received: by outflank-mailman (input) for mailman id 975782;
 Mon, 05 May 2025 03:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm1b-0000Iv-Lw
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:57:47 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2407::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b892a49d-295c-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 04:57:46 +0200 (CEST)
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by SJ0PR12MB8090.namprd12.prod.outlook.com (2603:10b6:a03:4ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 02:57:42 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::12) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.22 via Frontend Transport; Mon,
 5 May 2025 02:57:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:57:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:40 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:57:40 -0500
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
X-Inumbo-ID: b892a49d-295c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ya40Kl7vpXW58SbKmT4wy6fSIm6yQZAsZ3pJs0TyxTohPtIFlh1QisUALELjViLYtHBJnL0JemLqq1Zrkc5tM+68pHa/dxHec6ASswHnI2qBkCmFDO6h48pPlzi1rdjr1I8O/ONtUZ0BEvFW8yB5cQ4cBkrAZzCGMOqqGyLsI7LxjWfuWfdMaKiqHRsw1oAzVRblFprWrzs4q59Yog+E9Rin2mlt2zk2O2H4BUrwbqNreB8J+OnDnYhdJoYDTg/lHMWGV/VqLS9rd1nHxRxL8gIVUhoEgcu+fQFkqCd2OqLSiPqejS+T4+nzyEioOYQWZm8VuqVbxHxRokR+VALVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRovNO/Yx1uPn92Z6qKe3rjpCFrCSbTdMugPgoXK3Mw=;
 b=TthiXljDvLNdx5zvJIWcHuuRtyw4toSL7V75GexyIAEeepcD8MGNSrfJhUdm+wnTvuSvrC/XADFEUqQ6alh4plpDDxl4ib2+TyL4EtmL3pLluI6HmXkUMW2CkfNFvA4PxrLVDN7jKYOphgTeLL3QtqFUtrw4Qivq1gDXUBCTGKw2gRGtjJ0MUocqLc+gqxaQdJzg5yROUv3TYZupjWF/FEPC3glV37FTxLnmWbbve/s9U+WlNDWl2yY8paTH/VC6EFiUuvQ3WQ8G8Wgta6yLYaiHoReupQhSvhIQum7oQsrT+4/qMkBw0bUw6e1Jq7+qFYn6Ldp9cRwIT3fSnYME5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRovNO/Yx1uPn92Z6qKe3rjpCFrCSbTdMugPgoXK3Mw=;
 b=nPbo9aXLQz3ssy5pugGLZvdcz8zwjG1V0IQiawQ6gWo5wMO6bVCBsLk/lhFaFhfb0IZZJyynnoH4bSJSFdkG/gphtJUbGdRh2hGZ2KuXfphvGjR40GHHc2vhy6cGU5hlKUIpXUj7aDG3jk0wsCwk79+a02Pbgx9kky9sue0Pxkg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/6] tools/arm: exclude iomem from domU extended regions
Date: Sun, 4 May 2025 22:56:29 -0400
Message-ID: <20250505025631.207529-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505025631.207529-1-stewart.hildebrand@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|SJ0PR12MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: b2eaadf3-8d25-4491-f6dc-08dd8b809a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OUaHII7SAKJin7t7jEG4qXm2nsBSz+4FHZWbvgzndMcMrjhMFlcf4lHRpSNv?=
 =?us-ascii?Q?smvr0bDGyOySVrnUlrY/eJN1wsplEPqeo9n6L1sESxpDbVWmaeydP5pLYRtM?=
 =?us-ascii?Q?cescWF7HVYuTwvqmNAh7fJQqCXLb2v8Z+Ovy9EPLClwHA4nami0/D7hKYk3j?=
 =?us-ascii?Q?8DWsW1a14+kjsz3CCNd/IwxHyRCxOKgMP6xmyPFhfBDKMQ2U7dHcBWW2G0J6?=
 =?us-ascii?Q?jqe7l5krdIVe0YjVmIFFFSo56DLraio3wq+BcSyJJkRkmSSCTOERswmUROYZ?=
 =?us-ascii?Q?mSkc8eARiqjMjXmjB6b0jt3/NEEmrh0cNvrZMZ3WScGbzCc8GdPEAXER4LS8?=
 =?us-ascii?Q?+V1dhqgTpg2JMuZ8fKhSqMngJltfxHAVXpuCsDCBP1UPqhjmhQlIrfSNI5hv?=
 =?us-ascii?Q?4f2tK5u6niJu+Efp9wHVQF8dCgkh2i0fUCXSKZx0mBP/PQygMZwKxbJ6QsCm?=
 =?us-ascii?Q?zMgsNNv5Hq0rtab+Clo4ndq/t7f6oDap2hEL55+7x2CgaWnLM/vJ6ZDsNChW?=
 =?us-ascii?Q?E4ej0IOJxReAnBF5SC1R3F3Josk2Z04+tGuVkSTUmSBzVve6TtEv81hSS+Ne?=
 =?us-ascii?Q?ia5QoX3PAGmit6ZlA+BAmD4240rX3Jv+Hb/s1iWTZO9gC+fWGq1uVT24A0O5?=
 =?us-ascii?Q?tAq3mKIy/z835DKWV4HmuR7EnQujZvn/dB67g/RKnuqmff8rta9gsEXxHIso?=
 =?us-ascii?Q?i3PmmW335A4Y/P55WCzZemHzDBbHf82f1jQ5/o9hQ6aXyBnQCfHqj8YT+HIV?=
 =?us-ascii?Q?MC2Nc0LtFDflXhQpH6KqIQ7EgfiuCypLPpafAVnEGMpdWY26J8nIwe7NS97j?=
 =?us-ascii?Q?JDCSyIpVD2IJKIfdaAvl+qZ1b3M+Gbhf//P+8UGqz20erH5SW9fd0ymammpJ?=
 =?us-ascii?Q?OM2GDfFR6DCp13hOFXKrGOb35FChSo5uDsHei5WUSjGxR6u/L8GQRob7zyAB?=
 =?us-ascii?Q?ilwFvXqYewh6K8L8lTqeO0NY71bd1QO6wb1n2izyy5xCAlIT2YvY6LtvtYFF?=
 =?us-ascii?Q?hcs5Vi3lS1kyx/FzbTz60BeuhdvPUHCcUN+rRrrahKzzo4AsVvzqLBF87uUU?=
 =?us-ascii?Q?ZxaCpQIsDGjbkQY4SUZxIUeTjoImwmSzBU+SaGCUAuy0Fd0hGwXCvu9aPVy6?=
 =?us-ascii?Q?D90lL8rMucKIqU/zd0uvR1VWjvPh8QvJFsLCT01r3EIB+OmUi/p826TCm4BN?=
 =?us-ascii?Q?e6zPok+5nILHfBn8+IFGxbuc+sP/dIX6TjG/CdV72lLpsVqzSA6oInKLIeYd?=
 =?us-ascii?Q?339B73G/Mbea+nX5BoqxnLaSioyIbeXauFYpjZcpsMJWCGiIqag1erSW2zJz?=
 =?us-ascii?Q?5QUYnj9UzuHzyzqxVaeU8tHinyDTwKdSeBUCbLSUbywmgKguFLlXs2O7lrv+?=
 =?us-ascii?Q?Rsy8EkYATuqu7gB3bJPtJgqOU/iTjVLa3+ISZsSG5nvFEpyA2M4agNdqUa6S?=
 =?us-ascii?Q?e49r0pWiNvk32ROiBIyK2f6RujjZc+NAbo7U8rUs4+iP8sHL3ZZOS6uoTn04?=
 =?us-ascii?Q?nVAKrcAjMmB9RBYEzCsqQA6A+5vJfMXlCJIH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:57:41.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2eaadf3-8d25-4491-f6dc-08dd8b809a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8090

When a device is passed through to a xl domU, the iomem ranges may
overlap with the extended regions. Remove iomem from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")
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


