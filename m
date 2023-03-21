Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E46C3399
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512663.792740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecb8-0004jg-U1; Tue, 21 Mar 2023 14:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512663.792740; Tue, 21 Mar 2023 14:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecb8-0004gv-QK; Tue, 21 Mar 2023 14:04:22 +0000
Received: by outflank-mailman (input) for mailman id 512663;
 Tue, 21 Mar 2023 14:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pecb7-0004P0-IZ
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:04:21 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45306cc1-c7f1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:04:19 +0100 (CET)
Received: from DM6PR03CA0087.namprd03.prod.outlook.com (2603:10b6:5:333::20)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:04:15 +0000
Received: from DS1PEPF0000E652.namprd02.prod.outlook.com
 (2603:10b6:5:333:cafe::62) by DM6PR03CA0087.outlook.office365.com
 (2603:10b6:5:333::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:04:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E652.mail.protection.outlook.com (10.167.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:04:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:04:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:04:14 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:04:12 -0500
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
X-Inumbo-ID: 45306cc1-c7f1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mnk4f/IW8Apude2W2BgkqppFMEIWVbLHxT9H+FTDn7wKFlfB4MBD7dtOKn6O4ZNHCBQE0fuqaWuCOhZrbd/PxPtBiUqKVMQ6tHil1xlyy5d5uqiV/3quPCdgTpDk4WA0vIONcREMN82AB8wuxT7p/gORdtKRe6iBysoTRTkBk0CNaJgAdaLPlXZpzaWMNuzo9vmaVCIOyo3pyh6m5NU6hFlc607/pKffI8FO5c8StzNzF8wXEp6nkmq+pMSnUV79gmg33pPs941CgXsurO7Oa1Z8g2iSSZJe4JEFcAHNLGNY2O9sefOf743apH3Jbwv95PHAKI04BhhUc9UpfozpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncBJO/RfbUAwIX/h96U5Kf0lRRN5OSYULrCFIOtrXKk=;
 b=PJ3VXoh1dQy4ckWVhLLcnN+tfFdWct9kFCJNgr9ggpKG/I56cU3ZOO9AghLk54CDLuH1DqDacokUrNbICSreBXjLiRA1Slc8z+P34JzMYtrtMNw7U2IOwRLYFs5WtM5ixzQ7YjhUdp7GxX/Z2EGIJyQeeTdFxy5kFZoaZgb2hk5bCQdn71PCKv8jE9P4iS0fnOB3ef35oD+3lnmbsrfrKDrZb2wlYt3BhSSx1Zfh2z58tjrWapOOVeZE4zTnEMhhtB+jBwsMZT3ty77QZedHAFgB8uQJFXgdn9qt4S6n23TrRavgVag2ab5BxQ8kfjyiXT2bOs9Dt1Vvi7l7FwLdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncBJO/RfbUAwIX/h96U5Kf0lRRN5OSYULrCFIOtrXKk=;
 b=C/Ok2fW1Agsvvu7apxko/FuRZSHuG2mGm/pTN9HEx4Iep8aPQiFXBdBA1AXSzcrxGOh9U0FldEoMUysR+3+PfSKrDEAbgoPxTb8fb+C5leqytrZDgDXCWYcrxLkg2mvdocnATMaYNUr7/PcKdvclPcNUGwSPtNyxoqgMAJOCZDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 01/11] xen/arm: Use the correct format specifier
Date: Tue, 21 Mar 2023 14:03:47 +0000
Message-ID: <20230321140357.24094-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E652:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd21dab-a0d9-4a55-3ed1-08db2a1527a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	16Bam4HOJdKdD2t+DXbG6+5Qv+pSPmM0DnY4bjy+daVlzR0Z7u7S2Xf4VKvIrqQMXWtl9teTrqvR0z4xihLHm6jfl/cYUZS6WEXPG/UiiN2ifrV66rJVzEh08/V4BzKvA7AqvWAdnJFBql66favQweXHKG/874WQAXy//CIx1FVfUdNSIt7ro0xFbPetfGQrKC1U2chNt+65abmPsRVS3zeFxMNGe0q8LmXHNBBqs+IvMUC6tjpr2P3y0vGRmdlO+pGrojAgaDN1+LgXXqLUSYuo/CZqn0LshyiaNYJpM1oqDoGRNFj0k3kPysjaOQGumtfaXAXYvdlQj9rAF4HHGhg/7Smvc7pCt2wbmaP27H4VASm83mCr/IUM1nHJ9pgE5aEKmlAPKcprwzHlXG0RQHpomRt3n25iKHvHXHUyS8ayNFRMuPLSUUoMpGMHKF8c9zyFfhJ8Or8iIuty81/YP4QSLCRAJ6NAoWBECvVkADIZelgCyDweTIm7pt6LfunX1lrN7hYMjM6Z0ujLBUCBaioqvfx8oVtaR/VML0AsuQC2LGkEwpNfvOWEz3rEvz5f6sJoka0bB2zrpN3I/YfhB6uQrC2DyfiH0Wqi7DLTt8gRy2skX6LO8ygR5gM5443ibFUm+xtDstRKH8x8VLdSVD/ZN6a5fCLmzsBmbS/bYSG1qsvxkf2iRP0dBfLw5tTWPWzVDFzBKn5MoukDVxnXRYWPvOUcuPlofpcPqHeFYI8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(40460700003)(36756003)(40480700001)(103116003)(4326008)(83380400001)(8676002)(6916009)(478600001)(70206006)(316002)(70586007)(54906003)(1076003)(336012)(2616005)(966005)(6666004)(47076005)(426003)(186003)(26005)(356005)(82740400003)(8936002)(5660300002)(7416002)(36860700001)(41300700001)(81166007)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:04:15.0162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd21dab-a0d9-4a55-3ed1-08db2a1527a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E652.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

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

v3 - 1. Extracted the patch from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00655.html
and added to this series.
2. No changes done.

 xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
 xen/arch/arm/gic-v2.c       |  6 ++--
 xen/arch/arm/mm.c           |  2 +-
 3 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9707eb7b1b..15fa88e977 100644
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


