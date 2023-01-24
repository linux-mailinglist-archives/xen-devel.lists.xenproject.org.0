Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07926797DF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483526.749722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILk-0004ac-Gp; Tue, 24 Jan 2023 12:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483526.749722; Tue, 24 Jan 2023 12:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILk-0004XG-Dk; Tue, 24 Jan 2023 12:24:28 +0000
Received: by outflank-mailman (input) for mailman id 483526;
 Tue, 24 Jan 2023 12:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMs4=5V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKILi-0004Vt-8S
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:24:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c7df3c-9be2-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 13:24:24 +0100 (CET)
Received: from DS7PR05CA0046.namprd05.prod.outlook.com (2603:10b6:8:2f::14) by
 PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:24:21 +0000
Received: from CY4PEPF0000C96C.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::86) by DS7PR05CA0046.outlook.office365.com
 (2603:10b6:8:2f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Tue, 24 Jan 2023 12:24:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C96C.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.16 via Frontend Transport; Tue, 24 Jan 2023 12:24:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:24:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:24:19 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 24 Jan 2023 06:24:17 -0600
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
X-Inumbo-ID: 09c7df3c-9be2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdbK5XxRQ+EMtHOJ1LsgpJTQUawO1BShYPxYdlsEi/dV021E8dfDopG4NEV8MvFODuoRv0RdrC8J1qHmSXsdMKDahc3pQrZ3kUPxIUhslyzEqoQgkCuIaAQaBYCDYr4KsYiInEdbbrKHU3mAVWKzeBji3eYf8IdRZ2AbfLwuD5s5tnuCYGgCNCyfy5LIvCvEPoDz932RvaKogumZyAp90R1DJQIpNHMtJbiThw5JYBGLvSwMPlHiDekjZkHcYuxVQgEpqAEvevUd1PO/LooJqkwYmJPZhTL8WYGCy1bEdatmXwQThPv60DqeJQiEInTbwGIsuECljhYbKFIO3BL25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLtHfVA9rWIdMrCEiLYIoSk9YFT/fvnUoYzthA+TwGE=;
 b=Ivmbq/5AnURA25XAoMW5roUrn7TcBu7Mp2fwf6syxQIHOF17i7FaFuMkqZI3IC0c7vZLehBydluR9+CSJgAVMo47SZwSs8Bv4TtOZXieHoCHhf+nG2R0VSr0Q5aWX6xbqnhTe1euYkG55EwTG9YrqKELoTogK3uMRQKzQmqdEeIuCJmKt5pLYbdjlOOAkKhfp7C+qpANwq5guf6rt+ErjVHgCSNz8/B8kHJrNBboaKc5WXqr167Nt7bxw+5fTB05aecTchEHnd/h1b98LkL5Lf6m6ynf11rECDd0G8XUSomxH5gEIqEhMGK3gKs3s2w1RzWE2woUGLKiU6JI6IZ4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLtHfVA9rWIdMrCEiLYIoSk9YFT/fvnUoYzthA+TwGE=;
 b=3bhXEmcHit2wiXD102CubgJkRclTmvxYenlQlDVQxu36ZhJUKhqb/SzPwLXB+25mcPIpcIckrcmVtJG4I0CDpPodSAXPS/Jd3FJzhCiurY6VHPckCn+UhmVaOxrD+Y34GK3vbOaA9x88kM7ceCSK8AKGiHuMWFu1hLz1wQOEua0=
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
Subject: [XEN v4 1/3] xen/arm: Use the correct format specifier
Date: Tue, 24 Jan 2023 12:23:34 +0000
Message-ID: <20230124122336.40993-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
References: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96C:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 0564bf77-ed2e-4463-de66-08dafe05eb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D8M8eEf3G61sjvtgaWcF8iBsvvH+pUI5Mi5wXBUFTaUqZa2s0ybz9NaNgWyoqEyJfFMjYYG3s3AUPBL//9Dd36x24F/TycjW1WWYq61RleIC6LpvRdEsn3TQUsLQ+dwFq5OqL82JkS7FeczUXg47jYQkvlK3ncrWfkEjUhcmETKgMY8uUkIgwv3uLauW1iSZ4H8/mU7xcRUXmqmSAEsNatitX1VfnOdcIfdflSoFlBqWbJaF/R9oJWKZ37ioROhd0GQj2tmTXTFbOkgnsR6QfmKlCJbuMcrKknNqVOYvLphN7MEcFPZZgBYhyHv/4F5BzzaLJtEh4XXdI0BPnhmO1sT976J23EI+awIGkYslwW4CvbNSLQ48WdtPeYXPPsKA1lCpyY1Wdi3RXZWlsb7BqzFtgTMUjR62nksw3eR/VuTOZ+M166Mq9Ga/cpv119pprz/5DlwzGZDnoVGi58V2JsUAH71LF8lIazXTXxfOGPAyOOe1JKr4F7mpDcSPeemJ5MmzFx2tQ2kFexSbjZtTIep/MSQDuh+k1rTMpE38sCb2JLoiHpOJRZSJLIZt9IZS2u1iuZrS7VxhQS95+e0R7CRHoPv3M6lnLw8R12xigs3HQcq+rzqVDwzgKc1Rnq/NWwE4u82oCXCePk3rNlK2B/WLUMDDnK8zADZfaAJbXJG/F6C/uoQSzIUvZsitPfruQWX4Y+t9/ajYm0NrHGg8QtTmyMRoWMYLoBArlBTpFXyEgw7KczUmVb9f7ChLd0ePHNGnLRKbQN3aOfQ5uL3DXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(83380400001)(103116003)(81166007)(82740400003)(7416002)(41300700001)(86362001)(356005)(2906002)(82310400005)(8936002)(5660300002)(4326008)(40460700003)(316002)(40480700001)(26005)(6916009)(8676002)(186003)(6666004)(47076005)(336012)(426003)(70586007)(70206006)(54906003)(2616005)(1076003)(478600001)(966005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:24:20.0047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0564bf77-ed2e-4463-de66-08dafe05eb3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C96C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538

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

 xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
 xen/arch/arm/gic-v2.c       |  6 ++--
 xen/arch/arm/mm.c           |  2 +-
 3 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f35f4d2456..81a213cf9a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1288,6 +1288,39 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
+/*
+ * Wrapper to convert physical address from paddr_t to uint64_t and
+ * invoke fdt_begin_node(). This is required as the physical address
+ * provided as a part of node name should not contain any leading
+ * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
+ * unit (which contains the physical address) with name to generate a
+ * node name.
+ */
+static int __init domain_fdt_begin_node(void *fdt, const char *name,
+                                        uint64_t unit)
+{
+    /*
+     * The size of the buffer to hold the longest possible string ie
+     * interrupt-controller@ + a 64-bit number + \0
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
+               ( ret + 1 ));
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


