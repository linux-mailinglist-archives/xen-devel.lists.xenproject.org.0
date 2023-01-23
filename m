Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33F677CD4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482846.748596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8W-0004mT-Fh; Mon, 23 Jan 2023 13:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482846.748596; Mon, 23 Jan 2023 13:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8W-0004ix-C8; Mon, 23 Jan 2023 13:45:24 +0000
Received: by outflank-mailman (input) for mailman id 482846;
 Mon, 23 Jan 2023 13:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pJx8V-0004ON-2R
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:45:23 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dba2647-9b24-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 14:45:21 +0100 (CET)
Received: from MW4PR04CA0315.namprd04.prod.outlook.com (2603:10b6:303:82::20)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 13:45:19 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::98) by MW4PR04CA0315.outlook.office365.com
 (2603:10b6:303:82::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 13:45:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 13:45:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:45:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:45:14 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 23 Jan 2023 07:45:12 -0600
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
X-Inumbo-ID: 2dba2647-9b24-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adfer8I6wajabxzNXMrMGUmPYLAd54gjLCWLQZSEBcwkqbhVkfb1qiuiw352oTiyWwNjKTKgd0HJQ+Uw/XN+jFG2G3hntQeB6nvsTxEy4O1V1OgR9U+aCybC3Z1RygxIEqPVFGBUdS5ufSodutrm65Ffga2c3bYQyRtV5pw0zz7N+sI4QFi/qbkQeSEYHS6YrJ6dmmZkRISF2CHkXM7imfb+2O1vFo4it76yv5ggqSVUnhctXR33Xz3hShBiHCqgoZqJI1MJPK2TPk3KE89u7gXqr5z1TTEDFK2eLJnRHqCb4gJHPMSTWOPnmiJkSgPJv1Zbebd0voGNuFRWz1lsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLecMdgM3KRy1EpKfpCPHyv+jnvzB/bvcSdkTjM3ULk=;
 b=eALDGAl+rjrBFhAaX0j3ABdGi/t2i8TRrkfKRP0XTZ4SuuAOsw6HEL3hM6uz1wlVSOPTeEtjtQgtvGJfq8elMRQOOKZ1GCAjo64o95WnnQzbnMfwZQVuUW5R1afUo60O3jd2HTezbalajT56TJFRZA6sQNoos8Gktu4cLBKh13PmZSbUhmP0na9re8NsieEYNlGKvAFORQs2L41vckQTIBS/+s4L4k41E1mH3miTpLxzEAKW6B5HuuvM55SDAGYO47WZT/0YQik2GsIUBUepBprYTC/YF6d66zEa/+uD9M6k6U+vH+qcd3ZyPHu9n5OJ7NmtIqyNy46gNxytOlENSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLecMdgM3KRy1EpKfpCPHyv+jnvzB/bvcSdkTjM3ULk=;
 b=R++C4ySyMNLQST4LnZul3+3ZdBveL5r7fan3sHLMX77AHfSJ8sKoYmbvbFf+wDOBp2he/PT1GE60uX7fGBZpt8y1ucr0R13BKoAmprXCMDBU9HTa6TOPKu9DZ+8aS8AljwG0usEYdZNo+HKmR9NeNxMG/H6OI/3DXC7mrCsZVp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <xuwei5@hisilicon.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 1/3] xen/arm: Use the correct format specifier
Date: Mon, 23 Jan 2023 13:44:49 +0000
Message-ID: <20230123134451.47185-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|DM4PR12MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a883af0-8f19-4874-f65a-08dafd48109d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9dAIlF+ZCI/M3bmEnpMjyubLm4auhsXUoKVnRmrfJ8ImZm7U60L5wka9IvzyPcsFmqvmm0zXYOZ5dl8arX7TmaTZZH805mSA5i3iap9clq2Abn4DQglzML3dYr1dFOfr5+r1AeQ/6FdVXNZ8Glg+M1W/sJACm3VGNmMjv8iB8tg/8WiDUtwFIq2IAT/xoyKzLRbZKg8SG3Vo0anU8A6CP/xgh1tzztEAYCwvDg4D8w31fM/EOVeq8KgxsUTPYzluBb0DWdr/d1xvZx9ydaxT5y3xUTf2AbHlHV+J5GosQ8eStoHieXFN628wu5xiBvHY7dNrYYgOQ27eKTWdYvSbp6OLp8HJPSAJy8IMuEheuzaJCUJhsy1WYXMVxcjNpBgjLLuzWFgQqfyLQuF3ePktBo4keL/LksWCuqMLEyadKoY7TS2hXwc+DlVJ2VnRGlYuUAm5TSNYv/HGBTVI+CJ/xRJbnD4cz5+hQQe2vffX6ZZPNQfaroZNjfe2QTyX9cI88gpVRtmG5Pt1XHwo/GNuosBQxVRQOsdaB+V5CNFFu2UQ2TSE7tGx3G5w2212Ts7CRbVLNVrH1MluYvUhU2nwuUhsbPZQe6D/2vYXaqFcUjNZNpkwRLu8tqcO5OUvdDra8e7crTskoFRKwaP+MyK9IxtHIIvX3cB5rG5lGVwnxdvsBEJX8NbW+T4tqO/cmXskXeeYfK1AxU6WjKkWpK4SY9K+ymZFGxT1AFx1X049Y4ofcJ/DH09QEVZ/wTfYyprbQHodU/T2OQ/JraJ//+Bauw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(86362001)(40480700001)(2906002)(103116003)(70586007)(8676002)(336012)(41300700001)(70206006)(186003)(26005)(426003)(1076003)(4326008)(6916009)(47076005)(2616005)(478600001)(966005)(54906003)(40460700003)(316002)(6666004)(81166007)(5660300002)(356005)(7416002)(82740400003)(8936002)(83380400001)(36860700001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:45:18.3200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a883af0-8f19-4874-f65a-08dafd48109d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868

1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
while creating nodes in fdt, the address (if present in the node name)
should be represented using 'PRIx64'. This is to be in conformance
with the following rule present in https://elinux.org/Device_Tree_Linux

. node names
"unit-address does not have leading zeros"

As 'PRIpaddr' introduces leading zeros, we cannot use it.

So, we have introduced a wrapper ie domain_fdt_begin_node() which will
represent physical address using 'PRIx64'.

2. One should use 'PRIx64' to display 'u64' in hex format. The current
use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
address.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - 1. Moved the patch earlier.
2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
into this patch.

v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes the CI failure.

 xen/arch/arm/domain_build.c | 45 +++++++++++++++++--------------------
 xen/arch/arm/gic-v2.c       |  6 ++---
 xen/arch/arm/mm.c           |  2 +-
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f35f4d2456..97c2395f9a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1288,6 +1288,20 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
+static int __init domain_fdt_begin_node(void *fdt, const char *name,
+                                        uint64_t unit)
+{
+    /*
+     * The size of the buffer to hold the longest possible string ie
+     * interrupt-controller@ + a 64-bit number + \0
+     */
+    char buf[38];
+
+    /* ePAPR 3.4 */
+    snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
+    return fdt_begin_node(fdt, buf);
+}
+
 static int __init make_memory_node(const struct domain *d,
                                    void *fdt,
                                    int addrcells, int sizecells,
@@ -1296,8 +1310,6 @@ static int __init make_memory_node(const struct domain *d,
     unsigned int i;
     int res, reg_size = addrcells + sizecells;
     int nr_cells = 0;
-    /* Placeholder for memory@ + a 64-bit number + \0 */
-    char buf[24];
     __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
     __be32 *cells;
 
@@ -1314,9 +1326,7 @@ static int __init make_memory_node(const struct domain *d,
 
     dt_dprintk("Create memory node\n");
 
-    /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
-    res = fdt_begin_node(fdt, buf);
+    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
     if ( res )
         return res;
 
@@ -1375,16 +1385,13 @@ static int __init make_shm_memory_node(const struct domain *d,
     {
         uint64_t start = mem->bank[i].start;
         uint64_t size = mem->bank[i].size;
-        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
-        char buf[27];
         const char compat[] = "xen,shared-memory-v1";
         /* Worst case addrcells + sizecells */
         __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
         __be32 *cells;
         unsigned int len = (addrcells + sizecells) * sizeof(__be32);
 
-        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
-        res = fdt_begin_node(fdt, buf);
+        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
         if ( res )
             return res;
 
@@ -2716,12 +2723,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
     const struct domain *d = kinfo->d;
-    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
-    char buf[38];
 
-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
-             vgic_dist_base(&d->arch.vgic));
-    res = fdt_begin_node(fdt, buf);
+    res = domain_fdt_begin_node(fdt, "interrupt-controller",
+                                vgic_dist_base(&d->arch.vgic));
     if ( res )
         return res;
 
@@ -2771,14 +2775,10 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 *reg, *cells;
     const struct domain *d = kinfo->d;
-    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
-    char buf[38];
     unsigned int i, len = 0;
 
-    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
-             vgic_dist_base(&d->arch.vgic));
-
-    res = fdt_begin_node(fdt, buf);
+    res = domain_fdt_begin_node(fdt, "interrupt-controller",
+                                vgic_dist_base(&d->arch.vgic));
     if ( res )
         return res;
 
@@ -2858,11 +2858,8 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
     struct domain *d = kinfo->d;
-    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
-    char buf[27];
 
-    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
-    res = fdt_begin_node(fdt, buf);
+    res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
     if ( res )
         return res;
 
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 61802839cb..5d4d298b86 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1049,7 +1049,7 @@ static void __init gicv2_dt_init(void)
     if ( csize < SZ_8K )
     {
         printk(XENLOG_WARNING "GICv2: WARNING: "
-               "The GICC size is too small: %#"PRIx64" expected %#x\n",
+               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
                csize, SZ_8K);
         if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
         {
@@ -1280,11 +1280,11 @@ static int __init gicv2_init(void)
         gicv2.map_cbase += aliased_offset;
 
         printk(XENLOG_WARNING
-               "GICv2: Adjusting CPU interface base to %#"PRIx64"\n",
+               "GICv2: Adjusting CPU interface base to %#"PRIpaddr"\n",
                cbase + aliased_offset);
     } else if ( csize == SZ_128K )
         printk(XENLOG_WARNING
-               "GICv2: GICC size=%#"PRIx64" but not aliased\n",
+               "GICv2: GICC size=%#"PRIpaddr" but not aliased\n",
                csize);
 
     gicv2.map_hbase = ioremap_nocache(hbase, PAGE_SIZE);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0fc6f2992d..fab54618ab 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -249,7 +249,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
         pte = mapping[offsets[level]];
 
-        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
+        printk("%s[0x%03x] = 0x%"PRIx64"\n",
                level_strs[level], offsets[level], pte.bits);
 
         if ( level == 3 || !pte.walk.valid || !pte.walk.table )
-- 
2.17.1


