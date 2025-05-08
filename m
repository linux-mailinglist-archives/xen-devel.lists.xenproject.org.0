Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E4AAFB60
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979449.1366070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1M4-0001wy-0W; Thu, 08 May 2025 13:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979449.1366070; Thu, 08 May 2025 13:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1M3-0001uu-Tq; Thu, 08 May 2025 13:32:03 +0000
Received: by outflank-mailman (input) for mailman id 979449;
 Thu, 08 May 2025 13:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1C7-0005gg-GA
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:47 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2409::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62f85110-2c0f-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 15:21:45 +0200 (CEST)
Received: from DM6PR21CA0019.namprd21.prod.outlook.com (2603:10b6:5:174::29)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.39; Thu, 8 May
 2025 13:21:38 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:174:cafe::65) by DM6PR21CA0019.outlook.office365.com
 (2603:10b6:5:174::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.5 via Frontend Transport; Thu, 8
 May 2025 13:21:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:21:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:36 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:21:35 -0500
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
X-Inumbo-ID: 62f85110-2c0f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqohRbcxRLwd473pEt09JjDS0dEQmSt93Td4nlMey/hyza/Ke+9YNATRbmPV+/F/fhaNLKy5O2DYJIL3lMDGml9UngFaZqJRnA8W/vkoYsAo9VqRGiHCY9/YIRSN3ES8xDL1UZxS/eHHe3typhh+/VLnE4xzGOAb/brZCGL5RE8wAU2xe7VOazEUIMVz5mnHlmQg0Jt5oxQf9Q0jRDUoAkepFV5ImCKJw0gU+wFigSfC3lDZKq7OtHcW6DiTP/+BmS5vop++cyCROCAw25Ed6rCmqcK9aEuckx5zkptijM9J//mRAF7tHnBwvtml7zfvNYxJTV9AeTQQbAMappcdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv0aMNinUzwZLRqD5eOkzeUkgE+Ciartx/yFqrABJLc=;
 b=thfQdILzQPpJGmWWbjsVQ2vM6KEucnR7ZW9t276lDkK50aYxd332ZtDS+H0cYUH/cLiCLNe8l83tOT5qoa4RW0uCXXsTkr9BvqDHFIuBeTcAxl1PHSG1AxpH4enTwLVnY8i4iSwYwprOoFBJDa82SzZAdCdx00CToSMSWUr9UMdRv6zjrlQWzthdr1E4xFhlJG8aBfsFhfXvU9jvihKPgNBSTX+Ws08EDw/Myj+A4i1DFmy9yRYXbPBpT3NGfpz/8e/GYeTBk+Ae/djFCSvzgh0n42TBPmA+B8WGl1W/1Y7Dd/vxCecGClck1Pdr1FhcC6+ZZycj/VNLnNzlp+h8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv0aMNinUzwZLRqD5eOkzeUkgE+Ciartx/yFqrABJLc=;
 b=aVDJCLEu1+qeR+TQTNa3rINmf9aWaOsmmJcOZLVgn9poDrX6jYYDpZEcf5OItiTfD+Kbcwk0pYsFEVBb/4NBEjK77xdf09+UtyX3xRVdh1UT3lDooFwaYiiZpCI5N4qYIr+GbizBqQbGDwVyYJTNBcLGyStl1tdX6TwNEn6FnsI=
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
Subject: [PATCH v2 6/6] tools/arm: exclude iomem from domU extended regions
Date: Thu, 8 May 2025 09:20:35 -0400
Message-ID: <20250508132040.532898-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508132040.532898-1-stewart.hildebrand@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ad42c7-53f5-4d26-cb49-08dd8e3342ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4wn4ENDV+UDzYdh9V/+IYwfU9Zv2SpWycpPtSSzHKtjjWEELugfZAcLS2Imp?=
 =?us-ascii?Q?UmpuxGC3fzK1ka4kTMarOtMnZHfWBf0CBtyqAz/psAFwVjnkZnEvYAuLtSVA?=
 =?us-ascii?Q?uH0Ox+nyNyUxZB6BBuQI7hKPoXeZfwaeMgi0oXoZxrg6jwSuZ7lj678kXMvm?=
 =?us-ascii?Q?BDUJE6EYhZ+1UzCk8e7VSjMXbodzr1r6+MJbs0jwP76apF2ApzUTLzxBONof?=
 =?us-ascii?Q?eeWSZ5gkFCJ4Qpzst2i31hGq1GeoC97Uo8lWCLclTXeBtnvqYzryjfUi6sIH?=
 =?us-ascii?Q?Sy4nE5Vnzpc39UmG/N1ml8g5nomzk+ioihQctyCPrik01KEBCaiEFHnrGrHf?=
 =?us-ascii?Q?T+m412NP5cEWjnCmaSHUYX3RdVECcAhn4oOv5LKX85+MnqN3d1w3lwsVJ7zt?=
 =?us-ascii?Q?hxcsNBRMwumhUVoiG2/a/Oq0WcmD5zpZuAWlL6Vqs+u/ujh2Ed6wEFg6xIw6?=
 =?us-ascii?Q?hEK4yNJpsCo9qDG85iunKVwCPsAeWH571wLSwQTl+Yb2t7LLb2QVlAjQGRgX?=
 =?us-ascii?Q?O6lieJOBYSgV4ICM+FXi4tDRZC1VRCWG4k0lfysw051o5P8wLLgHv97xQAMk?=
 =?us-ascii?Q?OvSt0nnNHW3POc9eiRpL+USQD2MDMYIJGbAoBP2cK3rVz2hy6YYMMHlZARU7?=
 =?us-ascii?Q?vatDoFdSgkH3iUvjVLdCbcCbasMRXg136gkyPDDFjRjlqk324hk/6cmIt+CU?=
 =?us-ascii?Q?DiCOwrm1NXtpZzyZvgZOr0kweiAMFHw00GR6VzEYGO7lEx/kr1MW6i1VG25z?=
 =?us-ascii?Q?pUbb6Prl+uNfs93TpcLXELxoLO/EaUZKotVDtTy2h8e0uDyzfYy6axktfqsd?=
 =?us-ascii?Q?lFn1e9iTKum4Qjqz+jq+iKShgnJkKYdbd/JLV//QKVk1ikE+gWOshqEvewqS?=
 =?us-ascii?Q?SbQHS4KqKl/7JNeYwn3fJH7l3MPXdvHF0TJeFR9XCsuYb60/rXA4ZIt743MP?=
 =?us-ascii?Q?kL7npVgB9hhgaUtc2uxWqG03gX5qeEzK/eyr36gejCXevWn27hsHfJbl3zJ7?=
 =?us-ascii?Q?OBzX4sojIAcEf1AfIG5vOw3zs4+xDDiDZShegnsCzu74TRCVlyfz3eZV1s6j?=
 =?us-ascii?Q?sUuNzA1VPbIA/PRvof9TKCriYFGKuFlCAf0hfDdiySDNQNKay+yTaC1wpdTN?=
 =?us-ascii?Q?bywj1cNFGv+CqjpgB3LBJiUu/mI02Xr7Q6I3vmg2FEtCDrS/Qucqq9WAWhFh?=
 =?us-ascii?Q?xRkQPbrHSrsfnY60cKBKIuhDXvzZ+Pf01kiUm5Pu8MMOjz758Xwr8xz1uaYO?=
 =?us-ascii?Q?OgWYZzhONCpvudcGzjaz7KP8asZO/CTi4HGLNI1bfU9VVZf+2uFZL9OnnXHj?=
 =?us-ascii?Q?aUM4LR9bpt8uIA5AtL81L0fMv3rv+g1zzpYNmb6u50eyCFU/l+WWm9IFiy0y?=
 =?us-ascii?Q?VfgBmj0n5wil2cZxCj5ZAHRwcm13+OeIBHzEgqO4U64rjGn5IiDaE/y/gq6a?=
 =?us-ascii?Q?uEUCXiNlwwW6EbTdYu00ZuAJ2DgeSoKbvtqfpMKALDbO7+6j927VknCJuqpI?=
 =?us-ascii?Q?AOl+pyIRVJvHVInRdV0Bej8i4SYMajjhSJ0d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:21:37.3157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ad42c7-53f5-4d26-cb49-08dd8e3342ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162

When a device is passed through to a xl domU, the iomem ranges may
overlap with the extended regions. Remove iomem from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")

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


