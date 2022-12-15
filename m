Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B167C64E1D6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463759.722065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tym-00083M-7d; Thu, 15 Dec 2022 19:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463759.722065; Thu, 15 Dec 2022 19:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyl-0007w9-RI; Thu, 15 Dec 2022 19:33:15 +0000
Received: by outflank-mailman (input) for mailman id 463759;
 Thu, 15 Dec 2022 19:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyj-0006TA-B8
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f119a06-7caf-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 20:33:11 +0100 (CET)
Received: from DS7PR07CA0002.namprd07.prod.outlook.com (2603:10b6:5:3af::8) by
 PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 19:33:03 +0000
Received: from DS1PEPF0000E643.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::47) by DS7PR07CA0002.outlook.office365.com
 (2603:10b6:5:3af::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E643.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.9 via Frontend Transport; Thu, 15 Dec 2022 19:33:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:02 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:33:00 -0600
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
X-Inumbo-ID: 4f119a06-7caf-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPdZ4UkMmYS5sUcEaqXlQcnWyo/WJ+0ZzaN0WO9gqEGPKO0y3QBuwME47DRLbl9JAbVnRUaPTpCsnIQUhOgd6x+uUw1NT4Iclh7oNJhn7Vm4LO++XnFtls8ur3ReFGLI5Z1clP6Rmc1t9eWP4UtDg3cRV6GbUZmG9d86lKNyA5pzPCpEEWYXos1bT5fC9r74WbWNHhgghPMeI0DZkerhJNwA6h7bR0N6F4yQo1nzU6iMOFbD4w22zlN4Xkv4UbFh2gAzodtBih3cxSA15W9/5DlPORQ13iUlcBiB60WBSM9k06c4UAQJE1Wi9gN7AujIj0Ccu5pAy9iuVTJmMpXGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaXeNokVYikPWQ+48atbArgrq9FL4V+lmPnnn5AbXy4=;
 b=EpspYiZ+6ozUYdzav38A6pEuDR29mAaZ1Ft0Vw+62jidCSxW9vwDcXkO4g0Y27YTv3wUsHu3St4pNzsjfGYo05tb8HspZZuPsCxxirGSWh2hw1xBjjzU/dkn2QKulaZOYr5Arn0QGr8W6lwsGJWNER6Kbyw6vx3wXLmXl1VNqXHIb6oD6NT/oKjAybn5pb+VhDXzKilLneR7/AGULBfyyIditfT52+tlZRjDdsEJ04YXsClL9pwbnYHeDL0cU2jOUbS4DGsz18VoRKMiO3/jjBEJP3yfMx27aMmGCpeqvltaJr8SIubrwz72zsC5SFiV8+nqMeyFYjhBbRnb2zpPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaXeNokVYikPWQ+48atbArgrq9FL4V+lmPnnn5AbXy4=;
 b=xIZniVUfXSF8680cz9rS6cN6UrBNK40EZgsgUNAb3+PAw5gxMOuqyl44z9h4ALnwC5eTHbLTyfP2N8MHqtEKpShknjAtuAlf4//Ap4oZb6muYuPt42WX1C65Wgf7mZPAkiXvTlo9hILHDlGXNqT0n+R4ncvbIMPyoNVJ3bwPt20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t
Date: Thu, 15 Dec 2022 19:32:40 +0000
Message-ID: <20221215193245.48314-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E643:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8fdf33-8414-48f0-6447-08daded32eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+F+nbp6sTV/fr5/bbqSHB4CnBXdsMrXrUG3FtwoOiicVx5FIG/ro5XJAhQxE1YEB5vnOFB82UgB0rUniKuPVoBVQwiiJ9WyPNRplNKylPkKgkfDvWQw59uEjfqb1/9DtbMtcRV1yJVeOb5phUoPUH80RjzR9YZz9YbOrQaxYSKJraAfVKhAyjVuAdw0prmNXKkdof91jjGg4sTIZuY3JU4eB0VA1+5Vq1h+1hIcD0THJ2C99Kumwgrr7fySgHpkD+qS2e4qzarVqIEVGui5nTk+9U7NiYM+3ifs+1laMNiRaxiV0+QwtZwMCrhzqG/Qif/Ra8zByCAk86CVBbOh6XHM9qLLjezoKj+kVd6vfKIwOePUNU80mXT54fOChpGyHvCahh5DeapwTTWXtJKLqcnMKjOkEnJv+c3lRhT3UA4XuOjRtVuzvd3aZ6hC6eMRGM5sjE2ls9l54uDubCJG7i+tOhnk/QsxaAqpegclIaiGaDa6BLuMcihXO20SwjfLpKKvcCDeL1rUhGjTjZyhgmNfzKbTq7/Xoy4GHeW0c4fXwk+pWsDY4xVCTrBWDq3E+YgcDT4gF1JVcJMSzO4SpMElnxi/ZD7cGBDHrnnf+pW0qT8lvHt0A44RLUZ35vYyWFjtWMhpdEfTK8v1OHnpd/ijC4RzZeJq9OSnK1suR5pwlzUm6UVin3VcojbS0FyiCl28WoT1ObbvxEvoV66dYD0TJiUeylbtHHzZLwfRzo2o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(478600001)(8936002)(30864003)(2616005)(83380400001)(81166007)(41300700001)(70206006)(8676002)(86362001)(70586007)(1076003)(26005)(426003)(5660300002)(36756003)(47076005)(82740400003)(4326008)(356005)(186003)(40460700003)(336012)(36860700001)(6666004)(40480700001)(6916009)(316002)(103116003)(2906002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:02.8605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8fdf33-8414-48f0-6447-08daded32eb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E643.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114

dt_device_get_address() will return address and size which are always 'u64'.
One should use translate_dt_address_size() to translate address and size to
'paddr_t'.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/domain_build.c        | 53 +++++++++++++++++++++++-------
 xen/arch/arm/gic-v2.c              | 39 +++++++++++++++++-----
 xen/arch/arm/gic-v3.c              | 33 ++++++++++++++++---
 xen/arch/arm/platforms/brcm.c      |  9 +++--
 xen/arch/arm/platforms/exynos5.c   | 48 ++++++++++++++++++---------
 xen/arch/arm/platforms/sunxi.c     | 11 ++++++-
 xen/arch/arm/setup.c               | 18 ++++++++--
 xen/drivers/char/exynos4210-uart.c | 10 ++++--
 xen/drivers/char/ns16550.c         | 13 ++++++--
 xen/drivers/char/omap-uart.c       | 10 ++++--
 xen/drivers/char/pl011.c           | 10 ++++--
 xen/drivers/char/scif-uart.c       | 10 ++++--
 xen/drivers/passthrough/arm/smmu.c | 13 +++++---
 xen/include/xen/serial.h           |  2 +-
 14 files changed, 218 insertions(+), 61 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bef5e905a7..1bb97cd337 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -537,8 +537,11 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
 {
     mfn_t smfn;
     int res;
+    u64 dt_pbase, dt_psize;
+
+    device_tree_get_reg(cell, addr_cells, size_cells, &dt_pbase, &dt_psize);
+    res = translate_dt_address_size(&dt_pbase, &dt_psize, pbase, psize);
 
-    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
     ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
     if ( PFN_DOWN(*psize) > UINT_MAX )
     {
@@ -929,7 +932,8 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         const struct dt_property *prop;
         const __be32 *cells;
         uint32_t addr_cells, size_cells;
-        paddr_t gbase, pbase, psize;
+        u64 dt_gbase = 0, dt_pbase = 0, dt_psize = 0;
+        paddr_t gbase = 0, pbase = 0, psize = 0;
         int ret = 0;
         unsigned int i;
         const char *role_str;
@@ -948,8 +952,14 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
         BUG_ON(!prop);
         cells = (const __be32 *)prop->value;
-        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_number(cells, size_cells);
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &dt_pbase, &dt_gbase);
+        ret = translate_dt_address_size(&dt_pbase, &dt_gbase, &pbase, &gbase);
+        if ( ret )
+            return ret;
+
+        dt_psize = dt_read_number(cells, size_cells);
+        ret = translate_dt_address_size(NULL, &dt_psize, NULL, &psize);
+
         if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
         {
             printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
@@ -1666,13 +1676,14 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     dt_for_each_device_node( dt_host, np )
     {
         unsigned int naddr;
-        u64 addr, size;
+        paddr_t addr, size;
+        u64 dt_addr, dt_size;
 
         naddr = dt_number_of_address(np);
 
         for ( i = 0; i < naddr; i++ )
         {
-            res = dt_device_get_address(np, i, &addr, &size);
+            res = dt_device_get_address(np, i, &dt_addr, &dt_size);
             if ( res )
             {
                 printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
@@ -1680,6 +1691,10 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
                 goto out;
             }
 
+            res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+            if ( res )
+                return res;
+
             start = addr & PAGE_MASK;
             end = PAGE_ALIGN(addr + size);
             res = rangeset_remove_range(mem_holes, start, end - 1);
@@ -2445,7 +2460,8 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int naddr;
     unsigned int i;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
+    u64 dt_addr, dt_size;
     bool own_device = !dt_device_for_passthrough(dev);
     /*
      * We want to avoid mapping the MMIO in dom0 for the following cases:
@@ -2500,7 +2516,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     /* Give permission and map MMIOs */
     for ( i = 0; i < naddr; i++ )
     {
-        res = dt_device_get_address(dev, i, &addr, &size);
+        res = dt_device_get_address(dev, i, &dt_addr, &dt_size);
         if ( res )
         {
             printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
@@ -2508,6 +2524,10 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
             return res;
         }
 
+        res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+        if ( res )
+            return res;
+
         res = map_range_to_domain(dev, addr, size, &mr_data);
         if ( res )
             return res;
@@ -2917,6 +2937,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     struct dt_device_node *node;
     int res;
     paddr_t mstart, size, gstart;
+    u64 dt_mstart, dt_size, dt_gstart;
 
     /* xen,reg specifies where to map the MMIO region */
     cell = (const __be32 *)xen_reg->data;
@@ -2926,8 +2947,15 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     for ( i = 0; i < len; i++ )
     {
         device_tree_get_reg(&cell, address_cells, size_cells,
-                            &mstart, &size);
-        gstart = dt_next_cell(address_cells, &cell);
+                            &dt_mstart, &dt_size);
+        res = translate_dt_address_size(&dt_mstart, &dt_size, &mstart, &size);
+        if ( res )
+            return res;
+
+        dt_gstart = dt_next_cell(address_cells, &cell);
+        res = translate_dt_address_size(&dt_gstart, NULL, &gstart, NULL);
+        if ( res )
+            return res;
 
         if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size & ~PAGE_MASK )
         {
@@ -2941,9 +2969,10 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
                    kinfo->d->domain_id,
-                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
+                   (paddr_t) (mstart & PAGE_MASK),
+                   (paddr_t) (PAGE_ALIGN(mstart + size) - 1));
             return res;
         }
 
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 61802839cb..72de0707ed 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -979,6 +979,7 @@ static void gicv2_add_v2m_frame_to_list(paddr_t addr, paddr_t size,
 static void gicv2_extension_dt_init(const struct dt_device_node *node)
 {
     const struct dt_device_node *v2m = NULL;
+    int res;
 
     /*
      * Check whether this GIC implements the v2m extension. If so,
@@ -987,13 +988,18 @@ static void gicv2_extension_dt_init(const struct dt_device_node *node)
     dt_for_each_child_node(node, v2m)
     {
         u32 spi_start = 0, nr_spis = 0;
+        u64 dt_addr, dt_size;
         paddr_t addr, size;
 
         if ( !dt_device_is_compatible(v2m, "arm,gic-v2m-frame") )
             continue;
 
         /* Get register frame resource from DT. */
-        if ( dt_device_get_address(v2m, 0, &addr, &size) )
+        if ( dt_device_get_address(v2m, 0, &dt_addr, &dt_size) )
+            panic("GICv2: Cannot find a valid v2m frame address\n");
+
+        res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+        if ( res )
             panic("GICv2: Cannot find a valid v2m frame address\n");
 
         /*
@@ -1017,20 +1023,37 @@ static void __init gicv2_dt_init(void)
     int res;
     paddr_t vsize;
     const struct dt_device_node *node = gicv2_info.node;
+    u64 dt_hbase, dt_dbase, dt_cbase, dt_csize, dt_vbase, dt_vsize;
 
-    res = dt_device_get_address(node, 0, &dbase, NULL);
+    res = dt_device_get_address(node, 0, &dt_dbase, NULL);
     if ( res )
         panic("GICv2: Cannot find a valid address for the distributor\n");
 
-    res = dt_device_get_address(node, 1, &cbase, &csize);
+    res = translate_dt_address_size(&dt_dbase, NULL, &dbase, NULL);
+    if ( res )
+        panic("GICv2: Cannot find a valid address for the distributor\n");
+
+    res = dt_device_get_address(node, 1, &dt_cbase, &dt_csize);
+    if ( res )
+        panic("GICv2: Cannot find a valid address for the CPU\n");
+
+    res = translate_dt_address_size(&dt_cbase, &dt_csize, &cbase, &csize);
     if ( res )
         panic("GICv2: Cannot find a valid address for the CPU\n");
 
-    res = dt_device_get_address(node, 2, &hbase, NULL);
+    res = dt_device_get_address(node, 2, &dt_hbase, NULL);
+    if ( res )
+        panic("GICv2: Cannot find a valid address for the hypervisor\n");
+
+    res = translate_dt_address_size(&dt_hbase, NULL, &hbase, NULL);
     if ( res )
         panic("GICv2: Cannot find a valid address for the hypervisor\n");
 
-    res = dt_device_get_address(node, 3, &vbase, &vsize);
+    res = dt_device_get_address(node, 3, &dt_vbase, &dt_vsize);
+    if ( res )
+        panic("GICv2: Cannot find a valid address for the virtual CPU\n");
+
+    res = translate_dt_address_size(&dt_vbase, &dt_vsize, &vbase, &vsize);
     if ( res )
         panic("GICv2: Cannot find a valid address for the virtual CPU\n");
 
@@ -1049,7 +1072,7 @@ static void __init gicv2_dt_init(void)
     if ( csize < SZ_8K )
     {
         printk(XENLOG_WARNING "GICv2: WARNING: "
-               "The GICC size is too small: %#"PRIx64" expected %#x\n",
+               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
                csize, SZ_8K);
         if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
         {
@@ -1280,11 +1303,11 @@ static int __init gicv2_init(void)
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
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bb59ea94cd..db64009483 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -33,6 +33,7 @@
 #include <asm/gic_v3_defs.h>
 #include <asm/gic_v3_its.h>
 #include <asm/io.h>
+#include <asm/platform.h>
 #include <asm/sysregs.h>
 
 /* Global state */
@@ -1376,8 +1377,14 @@ static void __init gicv3_dt_init(void)
     struct rdist_region *rdist_regs;
     int res, i;
     const struct dt_device_node *node = gicv3_info.node;
+    u64 dt_dbase, dt_rdist_base, dt_rdist_size, dt_cbase, dt_csize, dt_vbase,
+    dt_vsize;
 
-    res = dt_device_get_address(node, 0, &dbase, NULL);
+    res = dt_device_get_address(node, 0, &dt_dbase, NULL);
+    if ( res )
+        panic("GICv3: Cannot find a valid distributor address\n");
+
+    res = translate_dt_address_size(&dt_dbase, NULL, &dbase, NULL);
     if ( res )
         panic("GICv3: Cannot find a valid distributor address\n");
 
@@ -1393,9 +1400,15 @@ static void __init gicv3_dt_init(void)
 
     for ( i = 0; i < gicv3.rdist_count; i++ )
     {
-        uint64_t rdist_base, rdist_size;
+        paddr_t rdist_base, rdist_size;
+
+        res = dt_device_get_address(node, 1 + i, &dt_rdist_base,
+                                    &dt_rdist_size);
+        if ( res )
+            panic("GICv3: No rdist base found for region %d\n", i);
 
-        res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
+        res = translate_dt_address_size(&dt_rdist_base, &dt_rdist_size,
+                                        &rdist_base, &rdist_size);
         if ( res )
             panic("GICv3: No rdist base found for region %d\n", i);
 
@@ -1418,10 +1431,20 @@ static void __init gicv3_dt_init(void)
      * provided.
      */
     res = dt_device_get_address(node, 1 + gicv3.rdist_count,
-                                &cbase, &csize);
+                                &dt_cbase, &dt_csize);
     if ( !res )
+    {
         dt_device_get_address(node, 1 + gicv3.rdist_count + 2,
-                              &vbase, &vsize);
+                              &dt_vbase, &dt_vsize);
+
+        res = translate_dt_address_size(&dt_vbase, &dt_vsize, &vbase, &vsize);
+        if ( res )
+            panic("GICv3: Invalid vbase/vsize provided\n");
+    }
+
+    res = translate_dt_address_size(&dt_cbase, &dt_csize, &cbase, &csize);
+    if ( res )
+        panic("GICv3: Invalid cbase / csize provided\n");
 }
 
 static int gicv3_iomem_deny_access(struct domain *d)
diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
index d481b2c60f..3e208a060d 100644
--- a/xen/arch/arm/platforms/brcm.c
+++ b/xen/arch/arm/platforms/brcm.c
@@ -40,7 +40,8 @@ static __init int brcm_get_dt_node(char *compat_str,
                                    u32 *reg_base)
 {
     const struct dt_device_node *node;
-    u64 reg_base_64;
+    paddr_t reg_base_64;
+    u64 dt_reg_base_64;
     int rc;
 
     node = dt_find_compatible_node(NULL, NULL, compat_str);
@@ -50,13 +51,17 @@ static __init int brcm_get_dt_node(char *compat_str,
         return -ENOENT;
     }
 
-    rc = dt_device_get_address(node, 0, &reg_base_64, NULL);
+    rc = dt_device_get_address(node, 0, &dt_reg_base_64, NULL);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "%s: missing \"reg\" prop\n", __func__);
         return rc;
     }
 
+    rc = translate_dt_address_size(&dt_reg_base_64, NULL, &reg_base_64, NULL);
+    if ( rc )
+        return rc;
+
     if ( dn )
         *dn = node;
 
diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
index 6560507092..a3fcab92ac 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -42,8 +42,9 @@ static int exynos5_init_time(void)
     void __iomem *mct;
     int rc;
     struct dt_device_node *node;
-    u64 mct_base_addr;
-    u64 size;
+    paddr_t mct_base_addr;
+    paddr_t size;
+    u64 dt_mct_base_addr, dt_size;
 
     node = dt_find_compatible_node(NULL, NULL, "samsung,exynos4210-mct");
     if ( !node )
@@ -52,14 +53,19 @@ static int exynos5_init_time(void)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, &mct_base_addr, &size);
+    rc = dt_device_get_address(node, 0, &dt_mct_base_addr, &dt_size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in \"samsung,exynos4210-mct\"\n");
         return -ENXIO;
     }
 
-    dprintk(XENLOG_INFO, "mct_base_addr: %016llx size: %016llx\n",
+    rc = translate_dt_address_size(&dt_mct_base_addr, &dt_size, &mct_base_addr,
+                                   &size);
+    if ( rc )
+        return rc;
+
+    dprintk(XENLOG_INFO, "mct_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
             mct_base_addr, size);
 
     mct = ioremap_nocache(mct_base_addr, size);
@@ -97,8 +103,9 @@ static int __init exynos5_smp_init(void)
     struct dt_device_node *node;
     void __iomem *sysram;
     char *compatible;
-    u64 sysram_addr;
-    u64 size;
+    u64 dt_sysram_addr, dt_size;
+    paddr_t sysram_addr;
+    paddr_t size;
     u64 sysram_offset;
     int rc;
 
@@ -125,13 +132,18 @@ static int __init exynos5_smp_init(void)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, &sysram_addr, &size);
+    rc = dt_device_get_address(node, 0, &dt_sysram_addr, &dt_size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in %s\n", compatible);
         return -ENXIO;
     }
-    dprintk(XENLOG_INFO, "sysram_addr: %016llx size: %016llx offset: %016llx\n",
+
+    rc = translate_dt_address_size(&dt_sysram_addr, &dt_size, &sysram_addr, &size);
+    if ( rc )
+        return rc;
+
+    dprintk(XENLOG_INFO, "sysram_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr" offset: %016llx\n",
             sysram_addr, size, sysram_offset);
 
     sysram = ioremap_nocache(sysram_addr, size);
@@ -189,10 +201,11 @@ static int exynos5_cpu_power_up(void __iomem *power, int cpu)
     return 0;
 }
 
-static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
+static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
 {
     struct dt_device_node *node;
     int rc;
+    u64 dt_power_base_addr, dt_size;
     static const struct dt_device_match exynos_dt_pmu_matches[] =
     {
         DT_MATCH_COMPATIBLE("samsung,exynos5250-pmu"),
@@ -208,14 +221,19 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, power_base_addr, size);
+    rc = dt_device_get_address(node, 0, &dt_power_base_addr, &dt_size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in \"samsung,exynos5XXX-pmu\"\n");
         return -ENXIO;
     }
 
-    dprintk(XENLOG_DEBUG, "power_base_addr: %016llx size: %016llx\n",
+    rc = translate_dt_address_size(&dt_power_base_addr, &dt_size,
+                                   power_base_addr, size);
+    if ( rc )
+        return rc;
+
+    dprintk(XENLOG_DEBUG, "power_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
             *power_base_addr, *size);
 
     return 0;
@@ -223,8 +241,8 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
 
 static int exynos5_cpu_up(int cpu)
 {
-    u64 power_base_addr;
-    u64 size;
+    paddr_t power_base_addr;
+    paddr_t size;
     void __iomem *power;
     int rc;
 
@@ -256,8 +274,8 @@ static int exynos5_cpu_up(int cpu)
 
 static void exynos5_reset(void)
 {
-    u64 power_base_addr;
-    u64 size;
+    paddr_t power_base_addr;
+    paddr_t size;
     void __iomem *pmu;
     int rc;
 
diff --git a/xen/arch/arm/platforms/sunxi.c b/xen/arch/arm/platforms/sunxi.c
index e8e4d88bef..7027170b68 100644
--- a/xen/arch/arm/platforms/sunxi.c
+++ b/xen/arch/arm/platforms/sunxi.c
@@ -34,6 +34,7 @@ static void __iomem *sunxi_map_watchdog(bool *new_wdt)
 {
     void __iomem *wdt;
     struct dt_device_node *node;
+    u64 dt_wdt_start, dt_wdt_len;
     paddr_t wdt_start, wdt_len;
     bool _new_wdt = false;
     int ret;
@@ -50,7 +51,15 @@ static void __iomem *sunxi_map_watchdog(bool *new_wdt)
         return NULL;
     }
 
-    ret = dt_device_get_address(node, 0, &wdt_start, &wdt_len);
+    ret = dt_device_get_address(node, 0, &dt_wdt_start, &dt_wdt_len);
+    if ( ret )
+    {
+        dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
+        return NULL;
+    }
+
+    ret = translate_dt_address_size(&dt_wdt_start, &dt_wdt_len, &wdt_start,
+                                    &wdt_len);
     if ( ret )
     {
         dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90..da64aeec88 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -220,12 +220,19 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
 
     for ( i = first; i < nr ; i++ )
     {
+        u64 dt_r_s, dt_r_e;
         paddr_t r_s, r_e;
 
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
+        if ( fdt_get_mem_rsv(device_tree_flattened, i, &dt_r_s, &dt_r_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
+        else
+        {
+            if ( translate_dt_address_size(&dt_r_s, &dt_r_e, &r_s, &r_e) )
+                panic("Invalid address or size provided\n");
+        }
+
         r_e += r_s; /* fdt_get_mem_rsv returns length */
 
         if ( s < r_e && r_s < e )
@@ -500,14 +507,21 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
 
     for ( ; i < mi->nr_mods + nr; i++ )
     {
+        u64 dt_mod_s, dt_mod_e;
         paddr_t mod_s, mod_e;
 
         if ( fdt_get_mem_rsv(device_tree_flattened,
                              i - mi->nr_mods,
-                             &mod_s, &mod_e ) < 0 )
+                             &dt_mod_s, &dt_mod_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
+        else
+        {
+            if ( translate_dt_address_size(&dt_mod_s, &dt_mod_e, &mod_s, &mod_e) )
+                panic("Invalid address or size provided\n");
+        }
+
         /* fdt_get_mem_rsv returns length */
         mod_e += mod_s;
 
diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
index 43aaf02e18..38cc19410f 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -26,6 +26,7 @@
 #include <asm/device.h>
 #include <asm/exynos4210-uart.h>
 #include <asm/io.h>
+#include <asm/platform.h>
 
 static struct exynos4210_uart {
     unsigned int baud, clock_hz, data_bits, parity, stop_bits;
@@ -303,7 +304,8 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
     const char *config = data;
     struct exynos4210_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
+    u64 dt_addr, dt_size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
@@ -316,7 +318,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
     uart->parity    = PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_address(dev, 0, &dt_addr, &dt_size);
     if ( res )
     {
         printk("exynos4210: Unable to retrieve the base"
@@ -324,6 +326,10 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
         return res;
     }
 
+    res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+    if ( res )
+        return res;
+
     res = platform_get_irq(dev, 0);
     if ( res < 0 )
     {
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 58d0ccd889..e62362db2f 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -35,6 +35,7 @@
 #include <asm/io.h>
 #ifdef CONFIG_HAS_DEVICE_TREE
 #include <asm/device.h>
+#include <asm/platform.h>
 #endif
 #ifdef CONFIG_X86
 #include <asm/fixmap.h>
@@ -42,8 +43,8 @@
 
 static struct ns16550 {
     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
-    u64 io_base;   /* I/O port or memory-mapped I/O address. */
-    u64 io_size;
+    paddr_t io_base;   /* I/O port or memory-mapped I/O address. */
+    paddr_t io_size;
     int reg_shift; /* Bits to shift register offset by */
     int reg_width; /* Size of access to use, the registers
                     * themselves are still bytes */
@@ -1747,6 +1748,7 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     struct ns16550 *uart;
     int res;
     u32 reg_shift, reg_width;
+    u64 dt_io_base, dt_io_size;
 
     uart = &ns16550_com[0];
 
@@ -1757,7 +1759,12 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     uart->parity    = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
+    res = dt_device_get_address(dev, 0, &dt_io_base, &dt_io_size);
+    if ( res )
+        return res;
+
+    res = translate_dt_address_size(&dt_io_base, &dt_io_size, &uart->io_base,
+                                    &uart->io_size);
     if ( res )
         return res;
 
diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index d6a5d59aa2..e606c3ef1e 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -16,6 +16,7 @@
 #include <xen/irq.h>
 #include <xen/device_tree.h>
 #include <asm/device.h>
+#include <asm/platform.h>
 #include <xen/errno.h>
 #include <xen/mm.h>
 #include <xen/vmap.h>
@@ -324,7 +325,8 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     struct omap_uart *uart;
     u32 clkspec;
     int res;
-    u64 addr, size;
+    u64 dt_addr, dt_size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
@@ -344,7 +346,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     uart->parity = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_address(dev, 0, &dt_addr, &dt_size);
     if ( res )
     {
         printk("omap-uart: Unable to retrieve the base"
@@ -352,6 +354,10 @@ static int __init omap_uart_init(struct dt_device_node *dev,
         return res;
     }
 
+    res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+    if ( res )
+        return res;
+
     res = platform_get_irq(dev, 0);
     if ( res < 0 )
     {
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index be67242bc0..23037405e1 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -24,6 +24,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <asm/device.h>
+#include <asm/platform.h>
 #include <xen/mm.h>
 #include <xen/vmap.h>
 #include <asm/pl011-uart.h>
@@ -258,14 +259,15 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
 {
     const char *config = data;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
+    u64 dt_addr, dt_size;
 
     if ( strcmp(config, "") )
     {
         printk("WARNING: UART configuration is not supported\n");
     }
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_address(dev, 0, &dt_addr, &dt_size);
     if ( res )
     {
         printk("pl011: Unable to retrieve the base"
@@ -273,6 +275,10 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
         return res;
     }
 
+    res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+    if ( res )
+        return res;
+
     res = platform_get_irq(dev, 0);
     if ( res < 0 )
     {
diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 2fccafe340..c16cac836a 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -28,6 +28,7 @@
 #include <asm/device.h>
 #include <asm/scif-uart.h>
 #include <asm/io.h>
+#include <asm/platform.h>
 
 #define scif_readb(uart, off)          readb((uart)->regs + (off))
 #define scif_writeb(uart, off, val)    writeb((val), (uart)->regs + (off))
@@ -311,14 +312,15 @@ static int __init scif_uart_init(struct dt_device_node *dev,
     const char *config = data;
     struct scif_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
+    u64 dt_addr, dt_size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
 
     uart = &scif_com;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_address(dev, 0, &dt_addr, &dt_size);
     if ( res )
     {
         printk("scif-uart: Unable to retrieve the base"
@@ -326,6 +328,10 @@ static int __init scif_uart_init(struct dt_device_node *dev,
         return res;
     }
 
+    res = translate_dt_address_size(&dt_addr, &dt_size, &addr, &size);
+    if ( res )
+        return res;
+
     res = platform_get_irq(dev, 0);
     if ( res < 0 )
     {
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3..5ae180a4cc 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -73,8 +73,8 @@
 /* Xen: Helpers to get device MMIO and IRQs */
 struct resource
 {
-	u64 addr;
-	u64 size;
+	paddr_t addr;
+	paddr_t size;
 	unsigned int type;
 };
 
@@ -96,12 +96,17 @@ static struct resource *platform_get_resource(struct platform_device *pdev,
 	 */
 	static struct resource res;
 	int ret = 0;
+	u64 dt_addr, dt_size;
 
 	res.type = type;
 
 	switch (type) {
 	case IORESOURCE_MEM:
-		ret = dt_device_get_address(pdev, num, &res.addr, &res.size);
+		ret = dt_device_get_address(pdev, num, &dt_addr, &dt_size);
+
+        if ( !ret )
+            ret = translate_dt_address_size(&dt_addr, &dt_size, &res.addr,
+                                            &res.size);
 
 		return ((ret) ? NULL : &res);
 
@@ -169,7 +174,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
 	ptr = ioremap_nocache(res->addr, res->size);
 	if (!ptr) {
 		dev_err(dev,
-			"ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
+			"ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
 			res->addr, res->size);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index f0aff7ea76..0b326e22fd 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -34,7 +34,7 @@ enum serial_port_state {
 
 struct vuart_info {
     paddr_t base_addr;          /* Base address of the UART */
-    unsigned long size;         /* Size of the memory region */
+    paddr_t size;               /* Size of the memory region */
     unsigned long data_off;     /* Data register offset */
     unsigned long status_off;   /* Status register offset */
     unsigned long status;       /* Ready status value */
-- 
2.17.1


