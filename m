Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71E667AF86
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 11:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484172.750720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKcso-0001EI-7J; Wed, 25 Jan 2023 10:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484172.750720; Wed, 25 Jan 2023 10:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKcso-0001C7-3I; Wed, 25 Jan 2023 10:19:58 +0000
Received: by outflank-mailman (input) for mailman id 484172;
 Wed, 25 Jan 2023 10:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prA8=5W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKcsm-0001Bt-QE
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 10:19:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce837c49-9c99-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 11:19:54 +0100 (CET)
Received: from MW4PR03CA0160.namprd03.prod.outlook.com (2603:10b6:303:8d::15)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 10:19:50 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::c5) by MW4PR03CA0160.outlook.office365.com
 (2603:10b6:303:8d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 10:19:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:19:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:19:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:19:48 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 25 Jan 2023 04:19:46 -0600
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
X-Inumbo-ID: ce837c49-9c99-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9XecRi87XlK+2UzhZO3iKfOsGNETcX1n/uw2eeC9PAuSDN+zleU37uxXc9DWVZ6a1f3t/DiDxoSYhL1GfSc2b2CWANub1NkiF4uw8MtL+xbuFHuTeIcmSpMoXkWW3i7ySg+ZUPs1Rd/+R60Quc1+qaefSlTAMVV2qRx5LNpEvWA6EpNE1/Wp51Ijgs68eyashd31+EuwWzIGprJaTAMxdjN65HqgqZxINcZ8E/eq4IShtQ5p76zVlDNyz6NdSS4qn16GHEKCbJp9lNiVdSnkV8QxUx2+ZHb5/OA7wWcowtzbIZ+OSVLQra8Qopy7UzuQ5TABLWryE/qec5bovs7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SCl2SUj9m8p+vkWTjsQjs5FnYNmwo0Z0hBBrx6zsjw=;
 b=d7qiKJjD4/snoMJP7vLtED4NkpCMK+9DJu8F6rSE0AOzjL5zE0qG2iCr62oyhve+/ti/i04t7D9l2DxvWmJoS36xWDrZ5sI59LlxeDTv/oEBHO5GdlvaDXt6s4AMTvi3yWu+CEs7BwBOkN80EfuznAxchGheRrcOyqPnqL2LH+kr70U6Q/5++mE3OG2Wqj57lsEnJrw3kD4iMIbbVIXREp0L3qKOuyxrGRrjjKZumerrQRLORBinlfqvMd+lbT9vNMY3MTVGNGyIbY9ocsa8rPcAzqb9SaFYpCOzcYEPt+XBUQTgPQWIMTs2tCy1M8P7qu1PfBLylPIiLKHK81ZHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SCl2SUj9m8p+vkWTjsQjs5FnYNmwo0Z0hBBrx6zsjw=;
 b=TYHAQEdUYIh3rTgn9OPznuVXxs7Xuu+8SQ6eCctfM0UDQNpwnlvd7E3fGWxdC6NZOWOGlQfdRwvxiVMvzZ2RfUkIp0sofGAa1pxN8AKsTgWgd3XTfKTILeNA57lb4LssiV7lM7PMSEob5GIqp7zKcH9v06zy6ZE+1QxPAeijgXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v5] xen/arm: Use the correct format specifier
Date: Wed, 25 Jan 2023 10:19:43 +0000
Message-ID: <20230125101943.1854-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|CO6PR12MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: 4624ba55-b80b-4220-6dc0-08dafebdb0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lDGFDTWZ+CXzyoue3gOjeEkSGB2gp3SucTx4D4x4aM4rBi2gb5cwuokf2iPlQmK0aRnuHPp27prZ4g1obzHpcXrTIxU+z4WdbBmDOmsgAz+CnL2IdO+Q42j96S93b1KWBb3yBVhgL5LzEXeRIZ7iWWTZL7riZpfP/uf4Uv2R+ftH5M3c4+x2yvkGqe1BvqaaGkqD6aQrT/oeV/NNwBn2Q3F0mkA9J6blZijbCkHDWZDL7VNgFml/88XXIhSrP9nYh/OUqMLUNtRSL68eVB6tFroOkURhxkkzQIK1nBt3aO+DlV2kZ/fkbmNIdNpXn3kPxee/UkbbpqvwLFQt/3zBJqi8zqpC0wTkwX9pau+K2oPPgSATzmDz+ftaJz6d8pTszIBBl0Vdr0Qqk4KNb9EGIiY/UnkDXP1qHJD1P5WnnsDCGukrEaEMbXCJy2L3+M8Y7jlx/JQVrcGeG18aH3uZaVcIGbIs50oiY3zfVi1N3jRj6W9ngPF1nTCtSurtqTQ9BR617tB6LAypwZi/ccPNjZxFRPqJlq7wDtN/FXvJJKGKNUtR2hx887fVOAWNLUYK8eBSoDbqbmGea/WeX/Y/vgNiONrDVO/EpaXDsxmP1bnDkjNp0LBH6zDSOBi++pLia9i39yXsWavJLct3gpzD4hIcZVOaEVA/bYaZIZX53W6jjupDKbhlMNIqm6Xs25S+LWYPC1QuOjxNgQRM4wxVZOImvEyOree3qBBr9BjOr9d5wW/JdrvbW9b6I8lEqFpAGoLqVzd+XIgD5iH7i/03oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(2906002)(70206006)(6916009)(70586007)(4326008)(8676002)(41300700001)(478600001)(966005)(1076003)(6666004)(186003)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(54906003)(81166007)(356005)(86362001)(103116003)(36756003)(40480700001)(40460700003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:19:49.4647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4624ba55-b80b-4220-6dc0-08dafebdb0df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491

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

v3 - 1. Added a comment on top of domain_fdt_begin_node().
2. Check for the return of snprintf() in domain_fdt_begin_node().

v4 - 1. Grammatical error fixes.

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


