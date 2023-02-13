Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A7694620
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494414.764468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYCj-0006ed-Gc; Mon, 13 Feb 2023 12:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494414.764468; Mon, 13 Feb 2023 12:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYCj-0006c1-Dp; Mon, 13 Feb 2023 12:45:09 +0000
Received: by outflank-mailman (input) for mailman id 494414;
 Mon, 13 Feb 2023 12:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLJL=6J=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pRYCh-0006bE-LD
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:45:07 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d50cf24-ab9c-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 13:45:06 +0100 (CET)
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 DS7PR12MB5767.namprd12.prod.outlook.com (2603:10b6:8:76::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.23; Mon, 13 Feb 2023 12:45:02 +0000
Received: from DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::63) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 12:45:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT104.mail.protection.outlook.com (10.13.173.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Mon, 13 Feb 2023 12:45:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:45:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:45:01 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 06:45:00 -0600
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
X-Inumbo-ID: 3d50cf24-ab9c-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYQKX4/gKMefQGovOPM2spOFhzCZ+IPIXWbHYXbYSu2jLmmr5HeQDuQVCosRKsifKVphZ5deaXEvViOUFzTvqEf8pSkSMptWLVH/mxE29VakIHrwsGrHf3x3Y771ZVtDiSYt7ixhFaIvO0wSAPL2nvTLwgkQSZBW0tK1QIQsxmitOm4DittoATw3+aQY2bznTEQ90kFMMgbpcsi7PJgSFjAr06rLDY3oHDDiqIcvXEsa54tq31F5yfnm8owXYLOM9jmxPIuNnBJvXQvdtw4J/RvJxDMNbrQV938jdyGekGB5WmS+CAtAnD9hSYP5LcA1KA34YeW8apukDLgeDnvPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlgQKmohEtacQnMD+bkEbzo8njZdJKjN33VbXURvNlw=;
 b=mdNQ+AXkWgB5RMNfMlyHtvGGYUePJ1wr/EWHzCgg2HoSzmjT7o63iGcfKgB0GdZGJBW11QKjs2dJHSIeWEaKKyF1mHi/e0XNKuHLPYad6jFRffxNQFKlf3HF1Y+g3QtIxdliJtoepu5BA6fX8EkTnXon4BX7cdyA6KfBHWGfqOwXyymJl1bgi7KhuXzFaP5y3M9oJL5gngb9MiqjN9Tz5wEUn+pnOTvD4F1Z4uvGOm+0c3DPzm6T72gfcyG0jq7lOt0XnnX1qjRFJ5WCYQv3VaAOycrrdkxCho6arXcwagAXgFHrmT6pYifCCt6S3jF6M/3NVKubmZTip3kt9WGpow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlgQKmohEtacQnMD+bkEbzo8njZdJKjN33VbXURvNlw=;
 b=i5Gt7gT14si+2KvZDS4l/z7tdIrF8XrZ9XX6cQzdr2TF006G9YQPbRsLIaf6jRhRlC41f9JUScLasXu9Lojnvh/DDlNeqmE2u6NWZdG4G0/AaFskoOsnzdPcRXI9nEAm9DeawvC5w7SchlmqbZDfsVTn1NbSTtBGYhqCFxOOJes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, <jgrall@amazon.com>,
	<stefano.stabellini@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 1/2] xen/arm: Use the correct format specifier
Date: Mon, 13 Feb 2023 12:44:37 +0000
Message-ID: <20230213124438.14836-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230213124438.14836-1-ayan.kumar.halder@amd.com>
References: <20230213124438.14836-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT104:EE_|DS7PR12MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a442292-dd86-4c50-30ea-08db0dc02017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W1GGhl4MfXQNiChkqe55syZHNEOryg8QShW1KeBWvGgLVkTddDtDZSwveab6gX1euA0IMq53uBr8kuEFi2Cmg4+kntHM433lBvegfvlm0k414oa1/Ke+z/pMIU9b4kgaMVxaqICh9Ojz5R60yelWCTppbbdtX2zBbwmtNzYdz9HIfF3zWMPc73JTSx+1FXUIkxiQdLik+6NbN1JNMnzVUNYkzpAIubCjOpP1QwstAReY4cnrmjTv03dtsmm+kjuZ1ztC9y6FE/9wDp1NBqKVjcFnBuOVYLNJ+JBlvTKTPOZ+0CO2SonYHlvGNyNnFSiGmOMV1ROpP2qyvVWa3M5yOvEOdEDQ1SGp8PhyGILzVyTTxN15iBHj/+QFf2g+Rn1JD+3j3b+nPKOrQDxy+Ho4HA5zQhtsL7l5s4X1pAYVJjbmGWsVvDuQZ7WxAcpUtkmz5yFuZ6NAbi4myZNdnB5/7PLjpEjEkWd9JUAXQdJnFdaFGqzpeDcU3Ey+WooZR+15bslpEEe9NZiXjOaD+C5Jd7w8JARMHqB3w+E6IgfHlJVhCZF165A72TKrWezwVAwgA3VWyIkJlkAp8r4EvrrkMqPM9/QBD3INTH/dekDRqAYLPaNYHCCbEdp47nFb3xF9L+vZ6w/szYfvndqQDRo9dDF2xGlLkjEDo0MIXV/fQuTUOjkSGV7SjMKgl4JF3rAeRSBn6c/cwIbTKmb+K3qw1ST3Vrk0fZmkc1AQjA05Uts0XD9M3PzeQrGAFcOYe+/q
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(6666004)(81166007)(2616005)(1076003)(356005)(83380400001)(40460700003)(478600001)(966005)(26005)(186003)(336012)(86362001)(47076005)(82310400005)(426003)(82740400003)(2906002)(8936002)(5660300002)(54906003)(40480700001)(316002)(103116003)(8676002)(36756003)(4326008)(41300700001)(36860700001)(70206006)(6916009)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:45:02.5548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a442292-dd86-4c50-30ea-08db0dc02017
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5767

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from -

v1 - 1. Moved the patch earlier.
2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
into this patch.

v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes the CI failure.

v3 - 1. Added a comment on top of domain_fdt_begin_node().
2. Check for the return of snprintf() in domain_fdt_begin_node().

v4 - 1. Grammatical error fixes.

v5 - 1. Added R-b and A-b.

 xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
 xen/arch/arm/gic-v2.c       |  6 ++--
 xen/arch/arm/mm.c           |  2 +-
 3 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c2b97fa21e..a798e0b256 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1288,6 +1288,39 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
+/*
+ * Wrapper to convert physical address from paddr_t to uint64_t and
+ * invoke fdt_begin_node(). This is required as the physical address
+ * provided as part of node name should not contain any leading
+ * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
+ * unit (which contains the physical address) with name to generate a
+ * node name.
+ */
+static int __init domain_fdt_begin_node(void *fdt, const char *name,
+                                        uint64_t unit)
+{
+    /*
+     * The size of the buffer to hold the longest possible string (i.e.
+     * interrupt-controller@ + a 64-bit number + \0).
+     */
+    char buf[38];
+    int ret;
+
+    /* ePAPR 3.4 */
+    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
+
+    if ( ret >= sizeof(buf) )
+    {
+        printk(XENLOG_ERR
+               "Insufficient buffer. Minimum size required is %d\n",
+               (ret + 1));
+
+        return -FDT_ERR_TRUNCATED;
+    }
+
+    return fdt_begin_node(fdt, buf);
+}
+
 static int __init make_memory_node(const struct domain *d,
                                    void *fdt,
                                    int addrcells, int sizecells,
@@ -1296,8 +1329,6 @@ static int __init make_memory_node(const struct domain *d,
     unsigned int i;
     int res, reg_size = addrcells + sizecells;
     int nr_cells = 0;
-    /* Placeholder for memory@ + a 64-bit number + \0 */
-    char buf[24];
     __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
     __be32 *cells;
 
@@ -1314,9 +1345,7 @@ static int __init make_memory_node(const struct domain *d,
 
     dt_dprintk("Create memory node\n");
 
-    /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
-    res = fdt_begin_node(fdt, buf);
+    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
     if ( res )
         return res;
 
@@ -1375,16 +1404,13 @@ static int __init make_shm_memory_node(const struct domain *d,
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
 
@@ -2716,12 +2742,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
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
 
@@ -2771,14 +2794,10 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
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
 
@@ -2858,11 +2877,8 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
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
index f758cad545..b99806af99 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -263,7 +263,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
         pte = mapping[offsets[level]];
 
-        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
+        printk("%s[0x%03x] = 0x%"PRIx64"\n",
                level_strs[level], offsets[level], pte.bits);
 
         if ( level == 3 || !pte.walk.valid || !pte.walk.table )
-- 
2.17.1


