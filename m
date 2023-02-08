Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4D68EE79
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491724.761019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDK-0006x2-Ct; Wed, 08 Feb 2023 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491724.761019; Wed, 08 Feb 2023 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDK-0006t0-5s; Wed, 08 Feb 2023 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 491724;
 Wed, 08 Feb 2023 12:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDI-0006aK-7D
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:12 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f861eb80-a7a8-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 13:06:09 +0100 (CET)
Received: from MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::11)
 by DM4PR12MB5054.namprd12.prod.outlook.com (2603:10b6:5:389::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:06:05 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::b1) by MW4P223CA0006.outlook.office365.com
 (2603:10b6:303:80::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 12:06:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 04:06:03 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:06:01 -0600
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
X-Inumbo-ID: f861eb80-a7a8-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiZJa7LpqecLmIOezeCDZzej+i6EZWbKsE0YUPA3iL/dtYNBJePy9pDF1Z76JZfhF3aFYPE1dVPUZi239AdH9XvjgpfLxbEY+abUIkzLqAPASRdAWHcw9yQHPi35q4zXDvZAmOMgVrNURf890uCZc9wbNaOXSZ3CBtu+wreUj8U4KsGk/j66H/RY6rvRL1kQEqsd7sxG2ilI97HLU5mOc+a7kPDCdP8mlhDU0JbD2bSXwkO4vj/Fjv1xia8rotzIG21qPR77BTwOWPNnk5AkrroGLA6GfAR2Tgeou4vyT1aTJXOZQQQaeKMcKV8zB4pzVEEYtNyezlmhhceE8IkE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dBpjpHRrYQheiS0OUkDqg0rAHDdN+rFIGNjpdf/QF0=;
 b=MEyK+lVeqgoMbQ8dNWYD+73MfmbY2BvK/xIbSGCksHobhQDdJCg3sl2eUP5P8DlsCI03TTAKczBmiZcJoyhORKtEXatHbJi3TGpuCd4wQ+M3hgrLbNT6BiGxFgFaMJZMsjbYeEvSAOU2pyx2FdDtCBzJ+boftYapsI+eqbePVWHPMijU8QRl2/OAJZpZHzsKCCFLKSRne1RhI3XTCz6+Arl15H269X+eAUrSoDfjk2+I5n6BMMgNau9oueCdkHThgsS575d4a4C/FmFgWR1j2Cy1mGOQnlYtDXJAWOlwoI76vHQmmz6r1YORwvGFopTTZyc++qzyRQTphGDu7X3rcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dBpjpHRrYQheiS0OUkDqg0rAHDdN+rFIGNjpdf/QF0=;
 b=y9WZSfwb8EZqaiG18Ll8A49AUV0Ehgh+GLXOHpx8JoO/ECSF24Iur9E7zvyv3VfFJ1dK3htPsrwIMprSzqBNIm+JCqvalUFBkgNanMtMhLOhuX9/2nZ8aFiQy8FnpGzC1tqdfomx4qc0bU842ivk8129wDnRMQIrPrywlDV3FYg=
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
Subject: [XEN v3 4/9] xen/arm: Introduce a wrapper for dt_device_get_address() to handle paddr_t
Date: Wed, 8 Feb 2023 12:05:24 +0000
Message-ID: <20230208120529.22313-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|DM4PR12MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5b6317-4d6b-4ff8-11a8-08db09ccda88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v3ur82nZj8GjbkPI3wioY03DzfSKmdpdcIdCUxpXARofTG9Nztue5GKyKX8o5PxAlmxCEEDaUnPdoS8lBxqRdXEUirNsQX2W6hvoALS9hq8T3aLfa8exF0o6GMUSaCYiwO+VvDrDZ2pra7iV4w1NrEhkO9Mfn69R26Z6jyadPExLL9oI+Hc4rmdp5fUYHYnsnqzMsrzteCzMaNR8+BJeiXrBj9kgrMzze+Otrza8QsNbMRdzFiSSQbJ+zZK9madTAlE8uCPPCz0Oz7O4FI1tKqsw8ws3NsOgn9D64pLDodxblR3i3n7QBABA6EPUe1/lsweaoKTz7BBZPrNzvcuR49B+HirVfPAfHX9/z46GCZZpLBL+AHzlxH4tUhxYEfwbRak0Ur4PSXqW8xZvzul1Lq3f7aW3Cue50LbWEGLehqmRWCNTrz3/Omf3MPLzCIdSmCJil6djyWcCtKUq/JGYKgxNw8LEx0ZPdYxnk/Zr66yrTZdAXaYLQLvb6+GDE/0Og+IxFN0jHyPLaFyoLal28Ii6sl5YGdCChT8BOiTGFAfdeidb5Ec6XlGv/KVT78/b0OFt6mZ+oErfjn3IYWEUIo4qIzVs76kkXlaZvfVKQNUEofc/LKj3pFQTDqOvOhQvfA6VgGMk7rXCpdFcgoMrcGZfh52iqDkk5k8MYVz4Exsd5E4KeLAXrT277yU6yO21YUn/gRNkd+d3LMyfNd0zikJ+OrQd/5ES6OltYVOHDiY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(47076005)(30864003)(36756003)(7416002)(2906002)(426003)(81166007)(83380400001)(1076003)(40480700001)(2616005)(336012)(356005)(82740400003)(8676002)(36860700001)(4326008)(70206006)(70586007)(54906003)(6916009)(316002)(8936002)(103116003)(41300700001)(6666004)(186003)(82310400005)(26005)(40460700003)(478600001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:04.5823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5b6317-4d6b-4ff8-11a8-08db09ccda88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5054

dt_device_get_address() can accept u64 only for address and size.
However, the address/size denotes physical addresses. Thus, they should
be represented by 'paddr_t'.
Consequently, we introduce a wrapper for dt_device_get_address() ie
dt_device_get_paddr() which accepts address/size as paddr_t and inturn
invokes dt_device_get_address() after converting address/size to u64.

The reason for introducing doing this is that in future 'paddr_t' may
be defined as u32. Thus, we need an explicit wrapper to do the type
conversion and return an error in case of truncation.

With this, callers now invoke dt_device_get_paddr().
dt_device_get_address() is invoked by dt_device_get_paddr() only.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. New patch.

v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size"
into this patch.

2. dt_device_get_address() callers now invoke dt_device_get_paddr() instead.

3. Logged error in case of truncation.

 xen/arch/arm/domain_build.c                | 10 +++---
 xen/arch/arm/gic-v2.c                      | 10 +++---
 xen/arch/arm/gic-v3-its.c                  |  4 +--
 xen/arch/arm/gic-v3.c                      | 10 +++---
 xen/arch/arm/pci/pci-host-common.c         |  6 ++--
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
 xen/arch/arm/platforms/brcm.c              |  4 +--
 xen/arch/arm/platforms/exynos5.c           | 32 +++++++++----------
 xen/arch/arm/platforms/sunxi.c             |  2 +-
 xen/arch/arm/platforms/xgene-storm.c       |  2 +-
 xen/common/device_tree.c                   | 36 ++++++++++++++++++++--
 xen/drivers/char/cadence-uart.c            |  4 +--
 xen/drivers/char/exynos4210-uart.c         |  4 +--
 xen/drivers/char/imx-lpuart.c              |  4 +--
 xen/drivers/char/meson-uart.c              |  4 +--
 xen/drivers/char/mvebu-uart.c              |  4 +--
 xen/drivers/char/ns16550.c                 |  2 +-
 xen/drivers/char/omap-uart.c               |  4 +--
 xen/drivers/char/pl011.c                   |  6 ++--
 xen/drivers/char/scif-uart.c               |  4 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++---
 xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
 xen/drivers/passthrough/arm/smmu.c         |  8 ++---
 xen/include/xen/device_tree.h              |  6 ++--
 24 files changed, 105 insertions(+), 73 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4d7e67560f..c7e88f5011 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1692,13 +1692,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
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
@@ -2471,7 +2471,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int naddr;
     unsigned int i;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
     bool own_device = !dt_device_for_passthrough(dev);
     /*
      * We want to avoid mapping the MMIO in dom0 for the following cases:
@@ -2526,7 +2526,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     /* Give permission and map MMIOs */
     for ( i = 0; i < naddr; i++ )
     {
-        res = dt_device_get_address(dev, i, &addr, &size);
+        res = dt_device_get_paddr(dev, i, &addr, &size);
         if ( res )
         {
             printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
@@ -2957,7 +2957,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
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
index d481b2c60f..4310feee73 100644
--- a/xen/arch/arm/platforms/brcm.c
+++ b/xen/arch/arm/platforms/brcm.c
@@ -40,7 +40,7 @@ static __init int brcm_get_dt_node(char *compat_str,
                                    u32 *reg_base)
 {
     const struct dt_device_node *node;
-    u64 reg_base_64;
+    paddr_t reg_base_64;
     int rc;
 
     node = dt_find_compatible_node(NULL, NULL, compat_str);
@@ -50,7 +50,7 @@ static __init int brcm_get_dt_node(char *compat_str,
         return -ENOENT;
     }
 
-    rc = dt_device_get_address(node, 0, &reg_base_64, NULL);
+    rc = dt_device_get_paddr(node, 0, &reg_base_64, NULL);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "%s: missing \"reg\" prop\n", __func__);
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
index 6c9712ab7b..d0f19d5cfc 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -934,8 +934,9 @@ bail:
 }
 
 /* dt_device_address - Translate device tree address and return it */
-int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
-                          u64 *addr, u64 *size)
+static int dt_device_get_address(const struct dt_device_node *dev,
+                                 unsigned int index,
+                                 u64 *addr, u64 *size)
 {
     const __be32 *addrp;
     unsigned int flags;
@@ -955,6 +956,37 @@ int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
     return 0;
 }
 
+int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
+                        paddr_t *addr, paddr_t *size)
+{
+    u64 dt_addr = 0, dt_size = 0;
+    int ret;
+
+    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
+
+    if ( addr )
+    {
+        if ( (dt_addr >> (PADDR_SHIFT - 1)) > 1 )
+        {
+            printk("Error: Physical address greater than max width supported\n");
+            return -EINVAL;
+        }
+
+        *addr = dt_addr;
+    }
+
+    if ( size )
+    {
+        if ( (dt_size >> (PADDR_SHIFT - 1)) > 1 )
+        {
+            printk("Error: Physical size greater than max width supported\n");
+            return -EINVAL;
+        }
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
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2aee5642f9..9a5e26a8d2 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1769,7 +1769,7 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     uart->parity    = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
+    res = dt_device_get_paddr(dev, 0, &uart->io_base, &uart->io_size);
     if ( res )
         return res;
 
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
index d58c5cd0bf..79d20eed20 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2451,7 +2451,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 
 	/* Base address */
-	ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
+	ret = dt_device_get_paddr(dev_to_dt(pdev), 0, &ioaddr, &iosize);
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
index b61bac2931..04aa43e0ee 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -583,7 +583,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
 const struct dt_device_node *dt_get_parent(const struct dt_device_node *node);
 
 /**
- * dt_device_get_address - Resolve an address for a device
+ * dt_device_get_paddr - Resolve an address for a device
  * @device: the device whose address is to be resolved
  * @index: index of the address to resolve
  * @addr: address filled by this function
@@ -592,8 +592,8 @@ const struct dt_device_node *dt_get_parent(const struct dt_device_node *node);
  * This function resolves an address, walking the tree, for a give
  * device-tree node. It returns 0 on success.
  */
-int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
-                          u64 *addr, u64 *size);
+int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
+                        paddr_t *addr, paddr_t *size);
 
 /**
  * dt_number_of_irq - Get the number of IRQ for a device
-- 
2.17.1


