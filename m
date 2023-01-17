Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B839066E525
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479667.743702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1T-0002MM-DJ; Tue, 17 Jan 2023 17:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479667.743702; Tue, 17 Jan 2023 17:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1T-0002IX-8f; Tue, 17 Jan 2023 17:45:23 +0000
Received: by outflank-mailman (input) for mailman id 479667;
 Tue, 17 Jan 2023 17:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1R-0000oY-W5
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b46846a6-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:18 +0100 (CET)
Received: from BL1PR13CA0277.namprd13.prod.outlook.com (2603:10b6:208:2bc::12)
 by SN7PR12MB7107.namprd12.prod.outlook.com (2603:10b6:806:2a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:15 +0000
Received: from BL02EPF000108EA.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::fa) by BL1PR13CA0277.outlook.office365.com
 (2603:10b6:208:2bc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EA.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 17:45:15 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 09:45:13 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:12 -0600
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
X-Inumbo-ID: b46846a6-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+YeYCmWnBOMz1r9xna95frcNYtzt4zO5fgVXIAxZj76i+iPNBcKSttu19SCglq65s94lBFsiAXdaTtWY+xiUQV0K7c2j4RL3jaLkFtC6r2AsmfTVgnNJJqATbSLekYL9zGRvAP2mwGjEApOnfkPmB4fjSoCWbpzXoPuLpApKwy+v2DlL82aSTLcOOs/wHe1jzhPESv9iy8kTXJEHs8mHxhOpTfJcSa9fXOAF36vaV4qgltMXKrKJWXgMDEmMsK8nAQDoR9vTScpOB/og7R/ih2rFEtgl2CKuGURC6xGVP8N9QoPwbt2TkJdjXMSC9J+Gt97U7f2G0G4Df7w6LseuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBI9VqrGtClHg+8xIqkrnP/L1ZKhG2r8i7jBnpGNVWI=;
 b=Tzwkw7hAYezD1JYhWU8eeib+jhsM+S931DXn53tD1EiWl67Amu4DsE8R4x91L1TD31uUKKmPQ7uzO+lekrHi31bUsX1rhK6kQa+LH3Zn2zLa7BeeJ+Zr8B7JWIbhEmFHOeeLVDS592VGmmnH3ZX0CrwrfKJUjwDnIHotnHINZGXm9orEKGEjZORJ3Hj9Oxm0uBqeMSbZ6Mjdd44YUGRyz2EiDATWiCZr8kuGCxTPv9R2xjTyyqvIO3r5qR+qc7hb17Xqgt/4IT7Zhggd3G6sGe0V7e+0mBo6g8JQt7PmuJ+kME0j7pLwv1SHMyblJoLn6oxRAkRL9BQZOjsblSGWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBI9VqrGtClHg+8xIqkrnP/L1ZKhG2r8i7jBnpGNVWI=;
 b=3U+5t0MTlHq86NY2G1CMdGAubzCrZzk4zEoa6FRjFwnxXrB+LcLU7bZAXnhTBqVkd+rdJ+TjiXMIxy4F/H/iwqAqKN8f8wQIsmdrOLLq7Fc9/W0qtU18h63nFwEsyrcYCEdd/yll2Vyr29bj7qgy7wYZf90lIZTiLuhqT41iKks=
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
Subject: [XEN v2 06/11] xen/arm: Introduce a wrapper for dt_device_get_address() to handle paddr_t
Date: Tue, 17 Jan 2023 17:43:53 +0000
Message-ID: <20230117174358.15344-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EA:EE_|SN7PR12MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c086d7-5878-4187-a977-08daf8b2975e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ymqwr5OM+7RMJq9utx3jNzXuxw/yFww7g1GiF7wbr/JNxfMjcn/Jmrw7GnxhrvGHAoh0GCfG+upNToxQM18ZQMc6J//KylTvK4aGm4ZYlxKfBBlGkm3t9jEWfxMNr9fEA+61MShVUbUba8k+dZjU6M+Y4Ugn9gF0l5tc24ezMTcFPBQgasNqaK5spR/vj9/r0Yt51bkhpr9/rQSWVeDcXHzRXjRuNXOF0P36sWEzrWReTUD/NfgZ/i9u6XzOTuDTJXFig3ceKd3GD6F2Ymmpg3d+EIN1/kfrcDcXN3NPShBDg4+Wqgd6BccjTwRJvhixcBZBs73vbpNxUxqrpfYA944sOKC/9QFOgMccBMy6dx8gVaXxogKSBmO3vpM28epbVCHI7RLyqfEOHazYpnDHQ74Jjwc1llTeFMyUYoenc+XqoVv3+lj0RBzTJHOgS+3evoFgKu7ehtbWVGdH4BVX2XzKGu0fYa9SIMyeX7NkIjXoHmt4bm8ra2l5l93RmUmUMfOhol1c2roVPryTY1MA8yfNeUFpebDk3nh9/T0yYOZrApcRq1cGeauh7mKXcGUCTU8QW/gqQ2vdLMO7/ho0KE+l36rPrvQk+zt4GzaVAe4apKAlHGxQqsXAWOtSp+UACOvRmif5VHFz3rPE1ARHeLebEmUeFM3By+Rc32/M4qhkLBTHAdXnIV72a50btFTfms/SFngmGOgEUjpSKS/biIS/dLN4FjLbnKO99clJV4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(86362001)(356005)(8676002)(70206006)(2906002)(4326008)(70586007)(5660300002)(30864003)(6916009)(8936002)(82740400003)(36860700001)(81166007)(83380400001)(103116003)(478600001)(54906003)(316002)(6666004)(40460700003)(40480700001)(82310400005)(41300700001)(2616005)(1076003)(47076005)(26005)(186003)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:15.3308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c086d7-5878-4187-a977-08daf8b2975e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7107

dt_device_get_address() can accept u64 only for address and size. The
various callers will use 'paddr_t' datatype for address and size.
'paddr_t' is currently defined as u64, but we may support u32 as well.
Thus, we need an appropriate wrapper which can handle this type
conversion.

The callers will now invoke dt_device_get_paddr(). This inturn invokes
dt_device_get_address() with u64 address/size. And then it typecasts
the u64 address/size to paddr_t address/size.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - 1. New patch introduced.

 xen/arch/arm/domain_build.c            |  5 +++--
 xen/arch/arm/gic-v2.c                  | 11 ++++++-----
 xen/arch/arm/gic-v3.c                  |  9 +++++----
 xen/arch/arm/include/asm/device_tree.h | 19 +++++++++++++++++++
 xen/arch/arm/platforms/exynos5.c       |  7 ++++---
 xen/arch/arm/platforms/sunxi.c         |  3 ++-
 xen/drivers/char/exynos4210-uart.c     |  3 ++-
 xen/drivers/char/ns16550.c             |  3 ++-
 xen/drivers/char/omap-uart.c           |  3 ++-
 xen/drivers/char/pl011.c               |  3 ++-
 xen/drivers/char/scif-uart.c           |  3 ++-
 xen/drivers/passthrough/arm/smmu.c     |  3 ++-
 12 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index cf8ae37a14..21199b624b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -7,6 +7,7 @@
 #include <xen/domain_page.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
+#include <asm/device_tree.h>
 #include <asm/irq.h>
 #include <asm/regs.h>
 #include <xen/errno.h>
@@ -1672,7 +1673,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
 
         for ( i = 0; i < naddr; i++ )
         {
-            res = dt_device_get_address(np, i, &addr, &size);
+            res = dt_device_get_paddr(np, i, &addr, &size);
             if ( res )
             {
                 printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
@@ -2500,7 +2501,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     /* Give permission and map MMIOs */
     for ( i = 0; i < naddr; i++ )
     {
-        res = dt_device_get_address(dev, i, &addr, &size);
+        res = dt_device_get_paddr(dev, i, &addr, &size);
         if ( res )
         {
             printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 5d4d298b86..5230c4ebaf 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -24,6 +24,7 @@
 #include <xen/acpi.h>
 #include <acpi/actables.h>
 #include <asm/p2m.h>
+#include <asm/device_tree.h>
 #include <asm/domain.h>
 #include <asm/platform.h>
 #include <asm/device.h>
@@ -993,7 +994,7 @@ static void gicv2_extension_dt_init(const struct dt_device_node *node)
             continue;
 
         /* Get register frame resource from DT. */
-        if ( dt_device_get_address(v2m, 0, &addr, &size) )
+        if ( dt_device_get_paddr(v2m, 0, &addr, &size) )
             panic("GICv2: Cannot find a valid v2m frame address\n");
 
         /*
@@ -1018,19 +1019,19 @@ static void __init gicv2_dt_init(void)
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
 
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 391dfa53d7..58d2eb0690 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -29,6 +29,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/device.h>
+#include <asm/device_tree.h>
 #include <asm/gic.h>
 #include <asm/gic_v3_defs.h>
 #include <asm/gic_v3_its.h>
@@ -1377,7 +1378,7 @@ static void __init gicv3_dt_init(void)
     int res, i;
     const struct dt_device_node *node = gicv3_info.node;
 
-    res = dt_device_get_address(node, 0, &dbase, NULL);
+    res = dt_device_get_paddr(node, 0, &dbase, NULL);
     if ( res )
         panic("GICv3: Cannot find a valid distributor address\n");
 
@@ -1395,7 +1396,7 @@ static void __init gicv3_dt_init(void)
     {
         paddr_t rdist_base, rdist_size;
 
-        res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
+        res = dt_device_get_paddr(node, 1 + i, &rdist_base, &rdist_size);
         if ( res )
             panic("GICv3: No rdist base found for region %d\n", i);
 
@@ -1417,10 +1418,10 @@ static void __init gicv3_dt_init(void)
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
 
diff --git a/xen/arch/arm/include/asm/device_tree.h b/xen/arch/arm/include/asm/device_tree.h
index 51e0f0ae20..7f58f1f278 100644
--- a/xen/arch/arm/include/asm/device_tree.h
+++ b/xen/arch/arm/include/asm/device_tree.h
@@ -11,6 +11,7 @@
 #ifndef __ARCH_ARM_DEVICE_TREE__
 #define __ARCH_ARM_DEVICE_TREE__
 
+#include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 
 inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
@@ -29,6 +30,24 @@ inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
     return ret;
 }
 
+inline int dt_device_get_paddr(const struct dt_device_node *dev,
+                               unsigned int index, paddr_t *addr,
+                               paddr_t *size)
+{
+    u64 dt_addr, dt_size;
+    int ret;
+
+    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
+
+    if ( addr )
+        *addr = dt_addr;
+
+    if ( size )
+        *size = dt_size;
+
+    return ret;
+}
+
 #endif /* __ARCH_ARM_DEVICE_TREE__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
index f79fad9957..55b6ac1e7e 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -22,6 +22,7 @@
 #include <xen/mm.h>
 #include <xen/vmap.h>
 #include <xen/delay.h>
+#include <asm/device_tree.h>
 #include <asm/platforms/exynos5.h>
 #include <asm/platform.h>
 #include <asm/io.h>
@@ -52,7 +53,7 @@ static int exynos5_init_time(void)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, &mct_base_addr, &size);
+    rc = dt_device_get_paddr(node, 0, &mct_base_addr, &size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in \"samsung,exynos4210-mct\"\n");
@@ -125,7 +126,7 @@ static int __init exynos5_smp_init(void)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, &sysram_addr, &size);
+    rc = dt_device_get_paddr(node, 0, &sysram_addr, &size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in %s\n", compatible);
@@ -208,7 +209,7 @@ static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
         return -ENXIO;
     }
 
-    rc = dt_device_get_address(node, 0, power_base_addr, size);
+    rc = dt_device_get_paddr(node, 0, power_base_addr, size);
     if ( rc )
     {
         dprintk(XENLOG_ERR, "Error in \"samsung,exynos5XXX-pmu\"\n");
diff --git a/xen/arch/arm/platforms/sunxi.c b/xen/arch/arm/platforms/sunxi.c
index e8e4d88bef..ce47f97507 100644
--- a/xen/arch/arm/platforms/sunxi.c
+++ b/xen/arch/arm/platforms/sunxi.c
@@ -18,6 +18,7 @@
 
 #include <xen/mm.h>
 #include <xen/vmap.h>
+#include <asm/device_tree.h>
 #include <asm/platform.h>
 #include <asm/io.h>
 
@@ -50,7 +51,7 @@ static void __iomem *sunxi_map_watchdog(bool *new_wdt)
         return NULL;
     }
 
-    ret = dt_device_get_address(node, 0, &wdt_start, &wdt_len);
+    ret = dt_device_get_paddr(node, 0, &wdt_start, &wdt_len);
     if ( ret )
     {
         dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
index 32cc8c78b5..6d2008c44f 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -24,6 +24,7 @@
 #include <xen/irq.h>
 #include <xen/mm.h>
 #include <asm/device.h>
+#include <asm/device_tree.h>
 #include <asm/exynos4210-uart.h>
 #include <asm/io.h>
 
@@ -316,7 +317,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
     uart->parity    = PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("exynos4210: Unable to retrieve the base"
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 8ef895a2bb..7226f3c2f7 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -35,6 +35,7 @@
 #include <asm/io.h>
 #ifdef CONFIG_HAS_DEVICE_TREE
 #include <asm/device.h>
+#include <asm/device_tree.h>
 #endif
 #ifdef CONFIG_X86
 #include <asm/fixmap.h>
@@ -1757,7 +1758,7 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     uart->parity    = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
+    res = dt_device_get_paddr(dev, 0, &uart->io_base, &uart->io_size);
     if ( res )
         return res;
 
diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index 3b53e1909a..06200bc9f1 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -15,6 +15,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/device_tree.h>
+#include <asm/device_tree.h>
 #include <asm/device.h>
 #include <xen/errno.h>
 #include <xen/mm.h>
@@ -344,7 +345,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     uart->parity = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("omap-uart: Unable to retrieve the base"
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 256ec11e3f..b4c1d9d592 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -26,6 +26,7 @@
 #include <asm/device.h>
 #include <xen/mm.h>
 #include <xen/vmap.h>
+#include <asm/device_tree.h>
 #include <asm/pl011-uart.h>
 #include <asm/io.h>
 
@@ -265,7 +266,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
         printk("WARNING: UART configuration is not supported\n");
     }
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("pl011: Unable to retrieve the base"
diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index b425881d06..af14388f70 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -26,6 +26,7 @@
 #include <xen/mm.h>
 #include <xen/delay.h>
 #include <asm/device.h>
+#include <asm/device_tree.h>
 #include <asm/scif-uart.h>
 #include <asm/io.h>
 
@@ -318,7 +319,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
 
     uart = &scif_com;
 
-    res = dt_device_get_address(dev, 0, &addr, &size);
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
         printk("scif-uart: Unable to retrieve the base"
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 490d253d44..0c89cb644e 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -51,6 +51,7 @@
 #include <xen/sizes.h>
 #include <asm/atomic.h>
 #include <asm/device.h>
+#include <asm/device_tree.h>
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
@@ -101,7 +102,7 @@ static struct resource *platform_get_resource(struct platform_device *pdev,
 
 	switch (type) {
 	case IORESOURCE_MEM:
-		ret = dt_device_get_address(pdev, num, &res.addr, &res.size);
+		ret = dt_device_get_paddr(pdev, num, &res.addr, &res.size);
 
 		return ((ret) ? NULL : &res);
 
-- 
2.17.1


