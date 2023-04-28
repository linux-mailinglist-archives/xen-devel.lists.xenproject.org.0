Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1D6F1DBA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527442.820034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSMb-0006ya-7K; Fri, 28 Apr 2023 17:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527442.820034; Fri, 28 Apr 2023 17:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSMb-0006wP-3G; Fri, 28 Apr 2023 17:58:33 +0000
Received: by outflank-mailman (input) for mailman id 527442;
 Fri, 28 Apr 2023 17:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSMY-0006fW-MZ
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:58:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe59::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a057dd-e5ee-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:58:28 +0200 (CEST)
Received: from BN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:e6::14)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Fri, 28 Apr
 2023 17:58:23 +0000
Received: from BL02EPF000145B9.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::6a) by BN0PR03CA0009.outlook.office365.com
 (2603:10b6:408:e6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:58:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000145B9.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.16 via Frontend Transport; Fri, 28 Apr 2023 17:58:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:58:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 10:58:21 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:58:19 -0500
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
X-Inumbo-ID: 46a057dd-e5ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzksMsmhk12NDR98XFTADVbPMoJB/mP6ZdDktjdF6tKgm1tnGRRCJ1tcfRmX6AbNgqAPJMoYdiFNlAc0v6SfAm2nYKRpfOds4LT5FSyomFWpFWeO5O9UVeLc3ECWiAF1aN1KCBLTxihwp8/F7WUNCqNTmW8P99t1PL09+50tPv7CeQoxqoeA82rbjKYeEORhSuud/yBjr0gcF5VdQTuYBAcFG1z7fVahJKl48/F11k56O8r4uqCNXd0gL8pDwBwy9VdAgB230Gcv58pD4LkX5wbFiLjJGw5qV+IZbqnxS8NnU/84/hLWT/dm5h2tCWswSY7v6e+aMsu8K/Cbh/yhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tVyky3bpGA94A0u00HDJgTdA9k/RVnS4Af0d6fVRvA=;
 b=fQF/x4MM5AqutneDpqI22xMKWcGdaeec3R1MlzhF8qRymZ8WEK7qEUZsmoE7afDQ6pnWM/fM2Bp4/Y8VoXH1D4KqCcmOlOWeJCuYZ393tHMn9CVFKS6UeuoyiLr7urCOENPjOiCNNgzb4ELYJQTCtk//ub+yeBC8+/TP+LbmjPIt2Ag4PSUK4oHmUDg/Y4sxA+vIbmXPebm35WveaSZe5cvIjBXNvjJMzCnajlpdMXS/cOjvMc6PLrOe2r9ywfy47Ysoh9M6zf/e9VCLY9gt3Nzv0qTNJZ2q2qOAVq5PVbaAAVBNVeFWcWC7ExA0rKTr8Cwl8E3Eq8pv0E7CUTyqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tVyky3bpGA94A0u00HDJgTdA9k/RVnS4Af0d6fVRvA=;
 b=HjiuSLGbJ49bZNsoul9rdh+i0fjawHDEHXHD1t4nP6itLrLYYDYc+6HU1qPu86vtKPZyyW6v0m8l9CNrJXnEoatnxTThlVBv6o56kiEfTNlVabQ9MmOrS7MjHGk/q+57+bCi7nt+nMR0xwiJj99YTSRoWqfe3RkD6BJKuDpK+E8=
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
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v6 03/12] xen/arm: Introduce a wrapper for dt_device_get_address() to handle paddr_t
Date: Fri, 28 Apr 2023 18:55:34 +0100
Message-ID: <20230428175543.11902-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 941913dc-7749-4620-501f-08db481227f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k+iUGGqKqrI3/EBEtagkurlopE2gDcCASom5LczhICiQef5QEsCJ5u6NhI3cCUlCEPH9oDZGu439cdVwdINf9W5hWn/6VLX1l4yUhWDt57s2vBog5/umtakUd50j2gYs1t2lAmg5cCLBCoQ5n/8oB6mbY88H0cbDCiacCx+z7KVzTeV66kOgmwi6/vR6NfjkoU/OgvlaZbUVv2Un8VAfLK3lZzaZAT1pJ38GkSX/jz7q71odhP2e180PSFy5hn6CmaMCCSofKKmg+ZxWhXJf8PoMF0a74KDLQ7LlsLTutLQ63CPNZ23pPu5HAsSuI0Pe1db3mjCzbwyHwT4koLoVf2+Sdi0sL5EJOsbg7IgPSHmMymBqBG4sSXRzLlAl7q5y1UQuwZQnzSuCn94mJnWsmuzIEOF3eIwTknzfEbpfkRN9PDXL/A3h7kXTvfqOv44pFoP9i+D2S7BWscW6UuGEa3DAGpkcS9+l+HCgl+VMz5AyZKOVm89n2lSCC1n0P426cLSSfiIxXnZB17cSnQ5pm86yq8rLq+jMK8ZkDlDY4T/1lPrIURI6QnQt05cYN455KhCNDDoY0EfTGmFoEbfQTL7f5fB2YCtREdGc9BjXrc2dfWwxP1Qxiodt6IuTpor54Vmz6jp7fREcVWv8Cs7/wlQvMpHGgdDxDkUMakPAg+9gtaTxym7NBDRsCCFOWR4xalFMICcI6LEsm7W4P0L9c+fLltkOd8ZGdv3MwmPP7EM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(1076003)(2616005)(54906003)(83380400001)(47076005)(36860700001)(478600001)(40480700001)(6666004)(966005)(26005)(356005)(82740400003)(4326008)(6916009)(81166007)(70586007)(316002)(426003)(336012)(70206006)(186003)(7416002)(8676002)(41300700001)(40460700003)(8936002)(2906002)(30864003)(103116003)(82310400005)(86362001)(5660300002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:58:21.9653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941913dc-7749-4620-501f-08db481227f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336

dt_device_get_address() can accept uint64_t only for address and size.
However, the address/size denotes physical addresses. Thus, they should
be represented by 'paddr_t'.
Consequently, we introduce a wrapper for dt_device_get_address() ie
dt_device_get_paddr() which accepts address/size as paddr_t and inturn
invokes dt_device_get_address() after converting address/size to
uint64_t.

The reason for introducing this is that in future 'paddr_t' may not
always be 64-bit. Thus, we need an explicit wrapper to do the type
conversion and return an error in case of truncation.

With this, callers can now invoke dt_device_get_paddr().

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. New patch.

v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size"
into this patch.

2. dt_device_get_address() callers now invoke dt_device_get_paddr() instead.

3. Logged error in case of truncation.

v3 - 1. Modified the truncation checks as "dt_addr != (paddr_t)dt_addr".
2. Some sanity fixes.

v4 - 1. Some sanity fixes.
2. Preserved the declaration of dt_device_get_address() in
xen/include/xen/device_tree.h. The reason being it is currently used by
ns16550.c. This driver requires some more changes as pointed by Jan in
https://lore.kernel.org/xen-devel/6196e90f-752e-e61a-45ce-37e46c22b812@suse.com/
which is to be addressed as a separate series.

v5 - 1. Removed initialization of variables.
2. In dt_device_get_paddr(), added the check
if ( !addr )
    return -EINVAL; 

 xen/arch/arm/domain_build.c                | 10 +++---
 xen/arch/arm/gic-v2.c                      | 10 +++---
 xen/arch/arm/gic-v3-its.c                  |  4 +--
 xen/arch/arm/gic-v3.c                      | 10 +++---
 xen/arch/arm/pci/pci-host-common.c         |  6 ++--
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
 xen/arch/arm/platforms/brcm.c              |  6 ++--
 xen/arch/arm/platforms/exynos5.c           | 32 +++++++++---------
 xen/arch/arm/platforms/sunxi.c             |  2 +-
 xen/arch/arm/platforms/xgene-storm.c       |  2 +-
 xen/common/device_tree.c                   | 39 ++++++++++++++++++++++
 xen/drivers/char/cadence-uart.c            |  4 +--
 xen/drivers/char/exynos4210-uart.c         |  4 +--
 xen/drivers/char/imx-lpuart.c              |  4 +--
 xen/drivers/char/meson-uart.c              |  4 +--
 xen/drivers/char/mvebu-uart.c              |  4 +--
 xen/drivers/char/omap-uart.c               |  4 +--
 xen/drivers/char/pl011.c                   |  6 ++--
 xen/drivers/char/scif-uart.c               |  4 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++---
 xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
 xen/drivers/passthrough/arm/smmu.c         |  8 ++---
 xen/include/xen/device_tree.h              | 13 ++++++++
 23 files changed, 120 insertions(+), 68 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 270fb06139..1c558fca0c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1698,13 +1698,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     dt_for_each_device_node( dt_host, np )
     {
         unsigned int naddr;
-        u64 addr, size;
+        paddr_t addr, size;
 
         naddr = dt_number_of_address(np);
 
         for ( i = 0; i < naddr; i++ )
         {
-            res = dt_device_get_address(np, i, &addr, &size);
+            res = dt_device_get_paddr(np, i, &addr, &size);
             if ( res )
             {
                 printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
@@ -2479,7 +2479,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int naddr;
     unsigned int i;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
     bool own_device = !dt_device_for_passthrough(dev);
     /*
      * We want to avoid mapping the MMIO in dom0 for the following cases:
@@ -2534,7 +2534,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     /* Give permission and map MMIOs */
     for ( i = 0; i < naddr; i++ )
     {
-        res = dt_device_get_address(dev, i, &addr, &size);
+        res = dt_device_get_paddr(dev, i, &addr, &size);
         if ( res )
         {
             printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
@@ -2965,7 +2965,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
                    kinfo->d->domain_id,
                    mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
             return res;
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 5d4d298b86..6476ff4230 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -993,7 +993,7 @@ static void gicv2_extension_dt_init(const struct dt_device_node *node)
             continue;
 
         /* Get register frame resource from DT. */
-        if ( dt_device_get_address(v2m, 0, &addr, &size) )
+        if ( dt_device_get_paddr(v2m, 0, &addr, &size) )
             panic("GICv2: Cannot find a valid v2m frame address\n");
 
         /*
@@ -1018,19 +1018,19 @@ static void __init gicv2_dt_init(void)
     paddr_t vsize;
     const struct dt_device_node *node = gicv2_info.node;
 
-    res = dt_device_get_address(node, 0, &dbase, NULL);
+    res = dt_device_get_paddr(node, 0, &dbase, NULL);
     if ( res )
         panic("GICv2: Cannot find a valid address for the distributor\n");
 
-    res = dt_device_get_address(node, 1, &cbase, &csize);
+    res = dt_device_get_paddr(node, 1, &cbase, &csize);
     if ( res )
         panic("GICv2: Cannot find a valid address for the CPU\n");
 
-    res = dt_device_get_address(node, 2, &hbase, NULL);
+    res = dt_device_get_paddr(node, 2, &hbase, NULL);
     if ( res )
         panic("GICv2: Cannot find a valid address for the hypervisor\n");
 
-    res = dt_device_get_address(node, 3, &vbase, &vsize);
+    res = dt_device_get_paddr(node, 3, &vbase, &vsize);
     if ( res )
         panic("GICv2: Cannot find a valid address for the virtual CPU\n");
 
diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 1ec9934191..3aa4edda10 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -1004,12 +1004,12 @@ static void gicv3_its_dt_init(const struct dt_device_node *node)
      */
     dt_for_each_child_node(node, its)
     {
-        uint64_t addr, size;
+        paddr_t addr, size;
 
         if ( !dt_device_is_compatible(its, "arm,gic-v3-its") )
             continue;
 
-        if ( dt_device_get_address(its, 0, &addr, &size) )
+        if ( dt_device_get_paddr(its, 0, &addr, &size) )
             panic("GICv3: Cannot find a valid ITS frame address\n");
 
         add_to_host_its_list(addr, size, its);
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bb59ea94cd..4e6c98bada 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1377,7 +1377,7 @@ static void __init gicv3_dt_init(void)
     int res, i;
     const struct dt_device_node *node = gicv3_info.node;
 
-    res = dt_device_get_address(node, 0, &dbase, NULL);
+    res = dt_device_get_paddr(node, 0, &dbase, NULL);
     if ( res )
         panic("GICv3: Cannot find a valid distributor address\n");
 
@@ -1393,9 +1393,9 @@ static void __init gicv3_dt_init(void)
 
     for ( i = 0; i < gicv3.rdist_count; i++ )
     {
-        uint64_t rdist_base, rdist_size;
+        paddr_t rdist_base, rdist_size;
 
-        res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
+        res = dt_device_get_paddr(node, 1 + i, &rdist_base, &rdist_size);
         if ( res )
             panic("GICv3: No rdist base found for region %d\n", i);
 
@@ -1417,10 +1417,10 @@ static void __init gicv3_dt_init(void)
      * For GICv3 supporting GICv2, GICC and GICV base address will be
      * provided.
      */
-    res = dt_device_get_address(node, 1 + gicv3.rdist_count,
+    res = dt_device_get_paddr(node, 1 + gicv3.rdist_count,
                                 &cbase, &csize);
     if ( !res )
-        dt_device_get_address(node, 1 + gicv3.rdist_count + 2,
+        dt_device_get_paddr(node, 1 + gicv3.rdist_count + 2,
                               &vbase, &vsize);
 }
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index a8ece94303..5550f9478d 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -93,7 +93,7 @@ gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
         cfg_reg_idx = 0;
 
     /* Parse our PCI ecam register address */
-    err = dt_device_get_address(dev, cfg_reg_idx, &addr, &size);
+    err = dt_device_get_paddr(dev, cfg_reg_idx, &addr, &size);
     if ( err )
         goto err_exit;
 
@@ -349,10 +349,10 @@ int __init pci_host_bridge_mappings(struct domain *d)
 
         for ( i = 0; i < dt_number_of_address(dev); i++ )
         {
-            uint64_t addr, size;
+            paddr_t addr, size;
             int err;
 
-            err = dt_device_get_address(dev, i, &addr, &size);
+            err = dt_device_get_paddr(dev, i, &addr, &size);
             if ( err )
             {
                 printk(XENLOG_ERR
diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
index 811b40b1a6..407ec07f63 100644
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
@@ -64,7 +64,7 @@ static void __iomem *rpi4_map_watchdog(void)
     if ( !node )
         return NULL;
 
-    ret = dt_device_get_address(node, 0, &start, &len);
+    ret = dt_device_get_paddr(node, 0, &start, &len);
     if ( ret )
     {
         printk("Cannot read watchdog register address\n");
diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
index d481b2c60f..951e4d6cc3 100644
--- a/xen/arch/arm/platforms/brcm.c
+++ b/xen/arch/arm/platforms/brcm.c
@@ -40,7 +40,7 @@ static __init int brcm_get_dt_node(char *compat_str,
                                    u32 *reg_base)
 {
     const struct dt_device_node *node;
-    u64 reg_base_64;
+    paddr_t reg_base_paddr;
     int rc;
 
     node = dt_find_compatible_node(NULL, NULL, compat_str);
@@ -50,7 +50,7 @@ static __init int brcm_get_dt_node(char *compat_str,
         return -ENOENT;
     }
 
-    rc = dt_device_get_address(node, 0, &reg_base_64, NULL);
+    rc = dt_device_get_paddr(node, 0, &reg_base_paddr, NULL);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "%s: missing \"reg\" prop\n", __func__);
@@ -61,7 +61,7 @@ static __init int brcm_get_dt_node(char *compat_str,
         *dn = node;
 
     if ( reg_base )
-        *reg_base = reg_base_64;
+        *reg_base = reg_base_paddr;
 
     return 0;
 }
diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
index 6560507092..c48093cd4f 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -42,8 +42,8 @@ static int exynos5_init_time(void)
     void __iomem *mct;
     int rc;
     struct dt_device_node *node;
-    u64 mct_base_addr;
-    u64 size;
+    paddr_t mct_base_addr;
+    paddr_t size;
 
     node = dt_find_compatible_node(NULL, NULL, "samsung,exynos4210-mct");
     if ( !node )
@@ -52,14 +52,14 @@ static int exynos5_init_time(void)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, &mct_base_addr, &size);
+    rc = dt_device_get_paddr(node, 0, &mct_base_addr, &size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in \"samsung,exynos4210-mct\"\n");
         return -ENXIO;
     }
 
-    dprintk(XENLOG_INFO, "mct_base_addr: %016llx size: %016llx\n",
+    dprintk(XENLOG_INFO, "mct_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
             mct_base_addr, size);
 
     mct = ioremap_nocache(mct_base_addr, size);
@@ -97,9 +97,9 @@ static int __init exynos5_smp_init(void)
     struct dt_device_node *node;
     void __iomem *sysram;
     char *compatible;
-    u64 sysram_addr;
-    u64 size;
-    u64 sysram_offset;
+    paddr_t sysram_addr;
+    paddr_t size;
+    paddr_t sysram_offset;
     int rc;
 
     node = dt_find_compatible_node(NULL, NULL, "samsung,secure-firmware");
@@ -125,13 +125,13 @@ static int __init exynos5_smp_init(void)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, &sysram_addr, &size);
+    rc = dt_device_get_paddr(node, 0, &sysram_addr, &size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in %s\n", compatible);
         return -ENXIO;
     }
-    dprintk(XENLOG_INFO, "sysram_addr: %016llx size: %016llx offset: %016llx\n",
+    dprintk(XENLOG_INFO,"sysram_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"offset: 0x%"PRIpaddr"\n",
             sysram_addr, size, sysram_offset);
 
     sysram = ioremap_nocache(sysram_addr, size);
@@ -189,7 +189,7 @@ static int exynos5_cpu_power_up(void __iomem *power, int cpu)
     return 0;
 }
 
-static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
+static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
 {
     struct dt_device_node *node;
     int rc;
@@ -208,14 +208,14 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, power_base_addr, size);
+    rc = dt_device_get_paddr(node, 0, power_base_addr, size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in \"samsung,exynos5XXX-pmu\"\n");
         return -ENXIO;
     }
 
-    dprintk(XENLOG_DEBUG, "power_base_addr: %016llx size: %016llx\n",
+    dprintk(XENLOG_DEBUG, "power_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
             *power_base_addr, *size);
 
     return 0;
@@ -223,8 +223,8 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
 
 static int exynos5_cpu_up(int cpu)
 {
-    u64 power_base_addr;
-    u64 size;
+    paddr_t power_base_addr;
+    paddr_t size;
     void __iomem *power;
     int rc;
 
@@ -256,8 +256,8 @@ static int exynos5_cpu_up(int cpu)
 
 static void exynos5_reset(void)
 {
-    u64 power_base_addr;
-    u64 size;
+    paddr_t power_base_addr;
+    paddr_t size;
     void __iomem *pmu;
     int rc;
 
diff --git a/xen/arch/arm/platforms/sunxi.c b/xen/arch/arm/platforms/sunxi.c
index e8e4d88bef..2b2c215f20 100644
--- a/xen/arch/arm/platforms/sunxi.c
+++ b/xen/arch/arm/platforms/sunxi.c
@@ -50,7 +50,7 @@ static void __iomem *sunxi_map_watchdog(bool *new_wdt)
         return NULL;
     }
 
-    ret = dt_device_get_address(node, 0, &wdt_start, &wdt_len);
+    ret = dt_device_get_paddr(node, 0, &wdt_start, &wdt_len);
     if ( ret )
     {
         dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
diff --git a/xen/arch/arm/platforms/xgene-storm.c b/xen/arch/arm/platforms/xgene-storm.c
index befd0c3c2d..6fc2f9679e 100644
--- a/xen/arch/arm/platforms/xgene-storm.c
+++ b/xen/arch/arm/platforms/xgene-storm.c
@@ -50,7 +50,7 @@ static void __init xgene_check_pirq_eoi(void)
     if ( !node )
         panic("%s: Can not find interrupt controller node\n", __func__);
 
-    res = dt_device_get_address(node, 0, &dbase, NULL);
+    res = dt_device_get_paddr(node, 0, &dbase, NULL);
     if ( res )
         panic("%s: Cannot find a valid address for the distributor\n", __func__);
 
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 6c9712ab7b..2163cf26d0 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -955,6 +955,45 @@ int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
     return 0;
 }
 
+int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
+                        paddr_t *addr, paddr_t *size)
+{
+    uint64_t dt_addr, dt_size;
+    int ret;
+
+    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
+    if ( ret )
+        return ret;
+
+    if ( !addr )
+        return -EINVAL;
+
+    if ( addr )
+    {
+        if ( dt_addr != (paddr_t)dt_addr )
+        {
+            printk("Error: Physical address 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
+                   dt_addr, dev->name, sizeof(paddr_t));
+            return -ERANGE;
+        }
+
+        *addr = dt_addr;
+    }
+
+    if ( size )
+    {
+        if ( dt_size != (paddr_t)dt_size )
+        {
+            printk("Error: Physical size 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
+                   dt_size, dev->name, sizeof(paddr_t));
+            return -ERANGE;
+        }
+
+        *size = dt_size;
+    }
+
+    return ret;
+}
 
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *,
diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uart.c
index 22905ba66c..c38d7ed143 100644
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -158,14 +158,14 @@ static int __init cuart_init(struct dt_device_node *dev, const void *data)
     const char *config = data;
     struct cuart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
 
     uart = &cuart_com;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("cadence: Unable to retrieve the base"
diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
index 43aaf02e18..2503392ccd 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -303,7 +303,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
     const char *config = data;
     struct exynos4210_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
@@ -316,7 +316,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
     uart->parity    = PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("exynos4210: Unable to retrieve the base"
diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index 9c1f3b71a3..77f70c2719 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -204,7 +204,7 @@ static int __init imx_lpuart_init(struct dt_device_node *dev,
     const char *config = data;
     struct imx_lpuart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
@@ -216,7 +216,7 @@ static int __init imx_lpuart_init(struct dt_device_node *dev,
     uart->parity = 0;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("imx8-lpuart: Unable to retrieve the base"
diff --git a/xen/drivers/char/meson-uart.c b/xen/drivers/char/meson-uart.c
index b1e25e0468..c627328122 100644
--- a/xen/drivers/char/meson-uart.c
+++ b/xen/drivers/char/meson-uart.c
@@ -209,14 +209,14 @@ static int __init meson_uart_init(struct dt_device_node *dev, const void *data)
     const char *config = data;
     struct meson_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
 
     uart = &meson_com;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("meson: Unable to retrieve the base address of the UART\n");
diff --git a/xen/drivers/char/mvebu-uart.c b/xen/drivers/char/mvebu-uart.c
index a00618b96f..cc55173513 100644
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -231,14 +231,14 @@ static int __init mvebu_uart_init(struct dt_device_node *dev, const void *data)
     const char *config = data;
     struct mvebu3700_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
 
     uart = &mvebu3700_com;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("mvebu3700: Unable to retrieve the base address of the UART\n");
diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index d6a5d59aa2..8e643cb039 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -324,7 +324,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     struct omap_uart *uart;
     u32 clkspec;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
@@ -344,7 +344,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     uart->parity = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("omap-uart: Unable to retrieve the base"
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index be67242bc0..052a651251 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -222,7 +222,7 @@ static struct uart_driver __read_mostly pl011_driver = {
     .vuart_info   = pl011_vuart,
 };
 
-static int __init pl011_uart_init(int irq, u64 addr, u64 size, bool sbsa)
+static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa)
 {
     struct pl011 *uart;
 
@@ -258,14 +258,14 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
 {
     const char *config = data;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
     {
         printk("WARNING: UART configuration is not supported\n");
     }
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("pl011: Unable to retrieve the base"
diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 2fccafe340..1b28ba90e9 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -311,14 +311,14 @@ static int __init scif_uart_init(struct dt_device_node *dev,
     const char *config = data;
     struct scif_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
 
     uart = &scif_com;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("scif-uart: Unable to retrieve the base"
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 091f09b217..611d9eeba5 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -794,7 +794,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 static __init bool ipmmu_stage2_supported(void)
 {
     struct dt_device_node *np;
-    uint64_t addr, size;
+    paddr_t addr, size;
     void __iomem *base;
     uint32_t product, cut;
     bool stage2_supported = false;
@@ -806,7 +806,7 @@ static __init bool ipmmu_stage2_supported(void)
         return false;
     }
 
-    if ( dt_device_get_address(np, 0, &addr, &size) )
+    if ( dt_device_get_paddr(np, 0, &addr, &size) )
     {
         printk(XENLOG_ERR "ipmmu: Failed to get PRR MMIO\n");
         return false;
@@ -884,7 +884,7 @@ static int ipmmu_probe(struct dt_device_node *node)
 {
     const struct dt_device_match *match;
     struct ipmmu_vmsa_device *mmu;
-    uint64_t addr, size;
+    paddr_t addr, size;
     uint32_t reg;
     int irq, ret;
 
@@ -905,7 +905,7 @@ static int ipmmu_probe(struct dt_device_node *node)
     bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
 
     /* Map I/O memory and request IRQ. */
-    ret = dt_device_get_address(node, 0, &addr, &size);
+    ret = dt_device_get_paddr(node, 0, &addr, &size);
     if ( ret )
     {
         dev_err(&node->dev, "Failed to get MMIO\n");
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bfdb62b395..b7fa2e90f7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2428,7 +2428,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 
 	/* Base address */
-	ret = dt_device_get_address(np, 0, &ioaddr, &iosize);
+	ret = dt_device_get_paddr(np, 0, &ioaddr, &iosize);
 	if (ret)
 		goto out_free_smmu;
 
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3..79281075ba 100644
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
 
@@ -101,7 +101,7 @@ static struct resource *platform_get_resource(struct platform_device *pdev,
 
 	switch (type) {
 	case IORESOURCE_MEM:
-		ret = dt_device_get_address(pdev, num, &res.addr, &res.size);
+		ret = dt_device_get_paddr(pdev, num, &res.addr, &res.size);
 
 		return ((ret) ? NULL : &res);
 
@@ -169,7 +169,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
 	ptr = ioremap_nocache(res->addr, res->size);
 	if (!ptr) {
 		dev_err(dev,
-			"ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
+			"ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
 			res->addr, res->size);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5f8f61aec8..ce25b89c4b 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -585,6 +585,19 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
  */
 const struct dt_device_node *dt_get_parent(const struct dt_device_node *node);
 
+/**
+ * dt_device_get_paddr - Resolve an address for a device
+ * @device: the device whose address is to be resolved
+ * @index: index of the address to resolve
+ * @addr: address filled by this function
+ * @size: size filled by this function
+ *
+ * This function resolves an address, walking the tree, for a give
+ * device-tree node. It returns 0 on success.
+ */
+int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
+                        paddr_t *addr, paddr_t *size);
+
 /**
  * dt_device_get_address - Resolve an address for a device
  * @device: the device whose address is to be resolved
-- 
2.17.1


