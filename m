Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FAADDAEB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 19:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018405.1395319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaWD-0000D1-To; Tue, 17 Jun 2025 17:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018405.1395319; Tue, 17 Jun 2025 17:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaWD-0000Am-Qh; Tue, 17 Jun 2025 17:54:45 +0000
Received: by outflank-mailman (input) for mailman id 1018405;
 Tue, 17 Jun 2025 17:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9LFW=ZA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uRaWC-0008Hi-0I
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 17:54:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 248ee751-4ba4-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 19:54:42 +0200 (CEST)
Received: from CPYP284CA0050.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:81::19)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:54:34 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10d6:103:81:cafe::3f) by CPYP284CA0050.outlook.office365.com
 (2603:10d6:103:81::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Tue,
 17 Jun 2025 17:54:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 17:54:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 12:54:28 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 12:54:28 -0500
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
X-Inumbo-ID: 248ee751-4ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opp+ksGDZ0ymJfPvw+IEsjgcA58OFjlU7sYZ9kn6xoeK+RdYGtmrc3OEUMa5aj8W84drfBXgyXxsYjUwZHKIle1mc3Gnkh1ISJEV/4cBGucELcUk5memrHTiLBeZuCNWKBmnGnG3JR+TFfh//WJmxdb4VOY2SU7unNAnPjAvWfdvE8RzdV1q5iRHfdjh8kvNKZPkYhpTpiIwrzQWErxBbqNQZjfKWsgLbDizBugEk2WvSPYfXkJNhTH02T8fRXKStpGxCj1ApxHVbMtLhizAWnL+GzIDhgavKpYwqEhZy5gqcD37iPpcEXI6FBktEASvVZXt1sQWTmgeOAAsVq879g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1HnX/uD/d1EMBFjvqziyhkrvmBbMyjU+rbRy1CyT3Y=;
 b=w2+67dUej3RA9l7cRNRLu2nPsy6i+GgBvmG3NwNpPJgvVF9GJ10x9YfjfJVjSnaXT3fOv2/hUx4vr3msa/ihaTxM/vFx2BsSZFz22KXSWLUORZgV2xQfgFxJA2qsoilDbdCozRtVG48Wf5CUGeFD44UKbMwe/BdKcDgYlhXob1LK2tHPoHE1VxXcj8v5LjSV9wvpfE4DH7wgr1lJxu1ymCQDkCAvLfMMGhPXWKIb46jdKLzHPPXQ+MdnuxoNMwoXCuykcoLVERhDM4OxJS+8BE/cu0XPbM5Ukvxhx6OWCNV+Kc2DLNacu/I37nSVDg8wxsqIST/ALyuXBcYF/naEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1HnX/uD/d1EMBFjvqziyhkrvmBbMyjU+rbRy1CyT3Y=;
 b=BemZXtuaeojg3XxUaQEoATuz61r20TA7t34XS5SxyiDmbPA9QYtQdfIZFFm22pRQ3d3ZM2I062jmwzw0keqphxZh+7HJMyqrkMLzVlhZZ3a/U51Bo0WDHEBocYeo4tadsz3KukSvCNm8efVB4TfcumxEbvt1qSfSS+Mzup4tE8A=
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
Subject: [PATCH v6 2/2] tools/arm: exclude iomem from domU extended regions
Date: Tue, 17 Jun 2025 13:54:05 -0400
Message-ID: <20250617175411.398083-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617175411.398083-1-stewart.hildebrand@amd.com>
References: <20250617175411.398083-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d6ed04-72fd-4650-7b38-08ddadc80405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lhh95Ih7KwYKBBlGcynvTsy14xdprS4xcUIWhRoFjpGB7+KnibEBwtRLwayC?=
 =?us-ascii?Q?XjIuzvGhOnTUXYJakddsfXT07JfNkyOsK2q/Xo80Hr+/Rs9AMBSNJJx62rP5?=
 =?us-ascii?Q?slzpSPRIVEMsLKDL9nAd1XQ+n66Ua3cIXxVIXluz9J529zGXgeS7+bJmpR3o?=
 =?us-ascii?Q?z0T0bcAZUucd6MSZbRAnODnlxT7fzh6YHYDKRnNWl8YD/nTnjAoc+nFA8M7U?=
 =?us-ascii?Q?XDUdXpImJUzGOuj0DDvGJjt4hPI3DXisakcajKJYn5eVA7za33sCExTa6Wzt?=
 =?us-ascii?Q?k/RUe4d+LuC8dT/gbqdnFlWTU/I5gh39w1NNON1Lftig2vLS7Nqsp0AKZI7v?=
 =?us-ascii?Q?WfIDi+M9E5bL+xABYhI5fEsFY1zJ3NpX5lT5AyLu6o2KLhjyAmV06+q63k71?=
 =?us-ascii?Q?lN4USJHPDEYwN56cy6yfj2pq8aN6xNtBpC0wGBspvVpzeCjpiHCjxBegMZKY?=
 =?us-ascii?Q?Hawaew4b1KnKP2xJN9jRfM3DJXYySKgpmcrqH1WNEhrfgO/XZLrRnAk6pGR7?=
 =?us-ascii?Q?xIsZqvLO4JfrhomYyQkYCYGx3iOqE15QzIQ8nfP4ZL6kXcniX9Bu10CihPFT?=
 =?us-ascii?Q?OKtWl5m3ZsWezZY6Pzqg11IfTs+FX24c4wNkcP5fF8KaVF4jMaFp6I4k3iiT?=
 =?us-ascii?Q?6Z+hx2gXZ1SfcDI/0Rc8HLGy7QwKN/gFZ6YjlnSFEt3xIbP6mSS32R0059di?=
 =?us-ascii?Q?uIXA0GGxOXqeXzobyo7tR6vTRaIPV2B71dhDKFlvqpxoTeOD4je3CjlJy5lz?=
 =?us-ascii?Q?VUyXLyXdLJrF/rUIXI+1T78wrwFjBLJApIpWkPUJqHbrO458mx00vNnkt9+Z?=
 =?us-ascii?Q?KNjsY4yycRBXI1APZl8kSfcqzSU2RL1whksyyFSNgQix+U1nFA9uRe6aaQ+g?=
 =?us-ascii?Q?uL6gP+ywqSxNlq4Oz3EC02kU1h0hq8/5eLwnWhnZcABbGO9gqqZJjxmlv5Lr?=
 =?us-ascii?Q?qYwaSU5nlUJMMSAL4kLrOiJ5bms2eI3Us93PLSdD89PBzbkFEm1VC1jfAiOb?=
 =?us-ascii?Q?HFrLJ2+dKaSz/hIzrsEmsL5KO4GyE3dWAdeBGWmrvrCzL6f7lyHf2WyrMZu4?=
 =?us-ascii?Q?MSkqEZJzj11WNGHqPdjt7xyHvlOJSML7OK95zEj1Xhdw8+fRKBYBFgpoi9+G?=
 =?us-ascii?Q?a21b4BM5YzJxQENE6W2so1BfcZKRREHDdXj3jfjTiC9uCseWElBTgdJGqRV8?=
 =?us-ascii?Q?XbtDkWhF6QKtyDgYe/eOTe71oxHJLmStGghyy5QtLZOQ/sr3jG7eHn0z98nM?=
 =?us-ascii?Q?uCJ0cCSbmrMTn2yXGJu0v62Yux5sVjOVGQ1n2F7R0Ec/URPcYemp4F8+g6V6?=
 =?us-ascii?Q?bJsksJgRPI5mcs3FO2RSjnAvsGuH/BUupx0W3tA0xl/tia3fRC1jmNTflbFT?=
 =?us-ascii?Q?urxbG4kOelv99Pail0pX3oHIQ7ciGNzkDtsk8P6TqdIXQPI/tKLVXAOudJB7?=
 =?us-ascii?Q?wCMrGNcm+1zbiX+hQJc0Tb7U9GxzBiYtBks09Tej7V2zL73/5+JNJh2eaYmX?=
 =?us-ascii?Q?YvKhqzf1479c5JlhLllYB8x7ZJAuuGnJBDIu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:54:32.7642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d6ed04-72fd-4650-7b38-08ddadc80405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647

When a device is passed through to a xl domU, the iomem ranges may
overlap with the extended regions. Remove iomem from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")

v5->v6:
* no change

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


