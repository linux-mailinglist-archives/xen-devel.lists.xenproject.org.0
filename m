Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC71AD5D7F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012053.1390618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPbp-0005HL-9J; Wed, 11 Jun 2025 17:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012053.1390618; Wed, 11 Jun 2025 17:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPbp-0005Fz-5p; Wed, 11 Jun 2025 17:51:33 +0000
Received: by outflank-mailman (input) for mailman id 1012053;
 Wed, 11 Jun 2025 17:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPPbn-0005Bu-U8
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:51:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b33a52c0-46ec-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 19:51:29 +0200 (CEST)
Received: from DS7PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:3bb::27)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Wed, 11 Jun
 2025 17:51:25 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:3bb:cafe::86) by DS7PR03CA0082.outlook.office365.com
 (2603:10b6:5:3bb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 17:51:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 17:51:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:51:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:51:22 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:51:21 -0500
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
X-Inumbo-ID: b33a52c0-46ec-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDh/NYOK76VAUfe3NsGqu1T3/MPqr8CCvZI3gmkQOWiYtvucNaor135smGAN7awzZfA5zqq4FAH/vw1mz2FTuF6I6WiJ4x+ezkVlgCtHxZY74DaXvhYGjPhDHhwcS0z3WVxYjpZYhFdXEIcvy1MnVWjjTBFa33yT1jBDuUF70+JonvVVXPS6yZqZcJOgL9LE9/GdKVvjHUGbwlgAuRt8AmCkCCPXO8XDqkxyBH/woChVBn3M1lEU8OS/BZNO/5mXyoPIVsypqLZFiD03yQMl53i/phJCLTKcn7gKNd8UMYt6UUGywiIXYDk49B8mIDu0uicsN15vBw5H0b4HDh6RKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGLNAcHMQN3tEn5Sq+wi+jklFsofF17Ha4Z5ZK5ekUI=;
 b=m6VnlhnL6Sj9R+naMbZgq1d6M+CSZqCPsCa5AJ3HCYByS6VaM6y29CCatt+oWQ6lUHdt150OD1FoiFrM6hCEFtA0p2HnZpf/qpwPUVwF40VWzlnG9TZWL2mFW5K7IJyIw22jRsaLeH0XmuEaZN669kGqjUq+zGEZdVLhwtQwfsMqESRXOpiHKUj+3fFvwvdmWK+v/Q9U9gKSvD7I/+S66b0Jy1UFmAulw766PrGVfbVWT6RpeNsC2/HG9zuvzkpA3KEuImWTJI2pASE0rVddDbWuGUm8CcfdqMy5A2NjdafMWZ0CfKdYORQ76KLgToFE/npdaecfcESxpK06Gn20/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGLNAcHMQN3tEn5Sq+wi+jklFsofF17Ha4Z5ZK5ekUI=;
 b=YTmAHGjgvQZ35G+xnQckZU0RMs2aZcbm+dlTZv/lxCsyrHy+wRZiOm/xocHOqD1/whsf00d5S8nWG0OhNJSwtcYiw2ZcQu7Ce70j1wNfnR2Cj3VuLxKLIEHxKKcxFGyLAar9esWbWFbIihm1Z1XaN0HQqfJfP0tcJnvkDJ8Djvk=
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
Subject: [PATCH v5 2/2] tools/arm: exclude iomem from domU extended regions
Date: Wed, 11 Jun 2025 13:51:04 -0400
Message-ID: <20250611175106.269829-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611175106.269829-1-stewart.hildebrand@amd.com>
References: <20250611175106.269829-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 369f911f-cf31-4ca9-d5e8-08dda9109558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7iqFYPSaJBweMpj9Ldb35LKxV6mXE1vQapHUx06ySHGTXMGKJh7RD5M8Poxr?=
 =?us-ascii?Q?6SjE4Ew9dQTfU0Nld4VzTUyXWN85pQ3dTDj/0k2F3bRBSFeacnQ2w6Pd1ZRR?=
 =?us-ascii?Q?HaPobUQgLFSqWyr0emPQQDAzysoMrrRD823DtBcQ5crk2huheJbaXKPKE+DH?=
 =?us-ascii?Q?SaSOLbU/ZKrwJ4gl1h5463jZSOAv/hKu/vQb0prOH+/pUZX6+d1y5PjtoIKa?=
 =?us-ascii?Q?hefl3+F0UiToxzqp2L1cgYUaEkfZVP6DQCaIihS629ggLMICrbqRqDw+wXml?=
 =?us-ascii?Q?kTXSZhU8yGJ0/LDdjlc/ta4Ta7qo6NWxivIyiUMYRcUovwNotTd1neg2LCU5?=
 =?us-ascii?Q?QYiO124W+qhJDdFDFVHzs34Wkgyv+sSOyvo/4NkYhwLMEYgYmmikqE8yhAEE?=
 =?us-ascii?Q?1obXLoWfaRL6HzQmwA0+JPHRwKMzDIvCcFt6n73sEiz+W89U9y8pLGqn2wT9?=
 =?us-ascii?Q?gLkgWVBErE2KNIFKh+ReBsTL5v62jwAM2lwzwOJZa4HjMrK7kGX/dfqB1Tzz?=
 =?us-ascii?Q?yIL0nq56HINGXfily0bNL/dcjNM0EQgn7QcAJuOWN5htFJblb8xkZYVoLEvb?=
 =?us-ascii?Q?olXEUQ6p1CSOBaaP4qLsQDm0fKcWd/ig9pU08NgT7WY82563VdaHU0RM0LF0?=
 =?us-ascii?Q?oXb0T+F6Faya6YaAGpJWV+c9n1a1to1kiUMVkohJEj5JfUapbMpNsMwXdwpf?=
 =?us-ascii?Q?/loTrai9wSXkkW0Pci/4K4fERYGgjtgNdvSprBCq6eV/kGaCvM1Nt8pw1XZM?=
 =?us-ascii?Q?tRe0/udPDcMr31Xfrchu9MUKT1xnuBNOTVRyf1n91GfC88cR16lRzOLudoMB?=
 =?us-ascii?Q?45//6CkAYKebLKOvrz9zuKYNwODU7W3emw32cA0T/BNRk1r0Ef8UJtwAS0Ux?=
 =?us-ascii?Q?4PQoqiqFHNhlopcUOCi8rf+OL6b8SNJJPRZE0o692UI/h/OuDHVAbmBy3qqd?=
 =?us-ascii?Q?ru9mHAmZBXtpwQ/zd08NP2vXJCRRNxxdCUQLnSqETtm+mCHJwnAUK4pF4Bfy?=
 =?us-ascii?Q?aXpmIf2pqdofIqIH5IyBFXrjisEqwLfKYs3LAA5ZlcBZHjaYAoVqEIlY7usc?=
 =?us-ascii?Q?8Ot11FzTfubiuPStSOuzCzr34cn1ArCeccAXedBclaf0cp2hGcwWzm4h8Oec?=
 =?us-ascii?Q?LPxGMTyx/aA28NjTkLe99oBr+YLRTZ/MaLESsCY0RZkzj4qOaWynXflwY13t?=
 =?us-ascii?Q?nygsHS7rSGJ3m8GuEXp4UnjR884jt7v2u0S6nQs5TBKBFcnVRSDwwcUVv+FE?=
 =?us-ascii?Q?T3OkDLQd3dN/UeiFSlb4Nrc3utItYghp6ebUfin7UcQ5+/xoI7UuXix5H81r?=
 =?us-ascii?Q?r298kCeE+gWnt8NZagrHX5LJVcf4TlQcNwnjXjOdJYXHXMCeTK6vaeH4ATCW?=
 =?us-ascii?Q?Kl4WlEu2MlY4Yjx3Jo3RuHHKOXNBgsYVcf4aPHWunGuDl6CCd8lIJkQLuzz/?=
 =?us-ascii?Q?KQebHvjqufmftvnVNUGT+5wlLgavQFXddXBmbbdaAkiHt7W6VENrs7tC05ep?=
 =?us-ascii?Q?YF2W4VQaVgFL5uE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:51:24.6125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 369f911f-cf31-4ca9-d5e8-08dda9109558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019

When a device is passed through to a xl domU, the iomem ranges may
overlap with the extended regions. Remove iomem from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")

v4->v5:
* add Anthony's R-b

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


