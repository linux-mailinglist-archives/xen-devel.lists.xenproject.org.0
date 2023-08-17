Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E977EE65
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584987.915947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3p-0003MV-Gy; Thu, 17 Aug 2023 00:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584987.915947; Thu, 17 Aug 2023 00:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3p-0003Ig-DX; Thu, 17 Aug 2023 00:40:25 +0000
Received: by outflank-mailman (input) for mailman id 584987;
 Thu, 17 Aug 2023 00:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR3o-0002YP-0Q
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe59::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a633f20d-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:22 +0200 (CEST)
Received: from SN7P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::14)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 00:40:19 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::19) by SN7P222CA0002.outlook.office365.com
 (2603:10b6:806:124::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Thu, 17 Aug 2023 00:40:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:08 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:08 -0500
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
X-Inumbo-ID: a633f20d-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhVdhPWGizSjESHFtxIaD9mxnfSYVUkDNrR2cvHZ73ZCPl8M+xqHdzm67dXjj3ckJAGyHeZ6/raf1A/rV1pf8I0KbYHcxjj6o4g0zvY8ngid7jNqJ47kgvrZQD5N+CBvqNNCcWYB7rjbkXtujTLBkKWyozEGW0+j0wTyrrfaxktEAmkPs38pns85CP5+X3RhxttUApDvVYFKvQMFXxCRXMfFPnVE7PhnVZM7KREW15jGIN70wfX4GGjMtiGwUYkY/U+U77rWp5W8uMmlI/L9V89mUoQ8E1BdmP1oStXt1yuZqjki3mVXiqez6gzgkMYkv5mYtc/O8oZXj62NgmHh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueRoAwRMX84PvKHly0/7xJCC6WZWwr2cF/eTQww9BPQ=;
 b=NJBJlKa/o429G8xBXSxPi33yaXupFKdXJ0JI6q/bnRadAK4+A25Nm/UteCnsLsdWgnewZXs1hNg0EAWb+OAeIUYc4ufEpAGNSV6tWH4thAR/1de5N6Vrxt90QpcEAQGvIbBeTD+oDQ4tRGZMEroexV5oJiDeKNidhAF2psOYukLpU9r+Obq0bHZBnMJr3cSq1CuHqvEs6v4RAeBiMFxcGGvRnSnmghwfuy4f9i1b8TytHFLW1V5GErbi2gV5m0VvZ7ONqpz4AHqvTwoNZ8OjG1eiU7IfMKdVIoHPhfriDyjxXsCROGkdDwlBBnASfXXsI8elzM+Zm0hzIQjYDAq+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueRoAwRMX84PvKHly0/7xJCC6WZWwr2cF/eTQww9BPQ=;
 b=teu6M/leebTn/d5lTHlN3T47BF3DDQXwH0gCS3LGJKtQk/LiWldAoUFSO7XmdCEf0R76iR22QYVPA1V/0k5ytMKhzgDNYNj8yuFrDhrzOBASQB2QBWHOEqqex6PJIqk6xZ1IO5kQPk8Im/vnWyE4gfZ98kMPjrn+uk1Nfw6Ovg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v8 03/19] xen/arm/device: Remove __init from function type
Date: Wed, 16 Aug 2023 17:39:31 -0700
Message-ID: <20230817003947.3849-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e7184c-9096-4785-6dc0-08db9eba87e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f4yyjVBXLaTvlSMoY90dCB7JGZGeZjZTugWuw2GMz2mPDZmC19GlXXZWaPfwGjeIUpS7+mxoziPZDHr1myoBvaod041UpjVJo5qe1Xs9tLrWNMFL9tgRKCyutXGpMbDFOjnN9UPS8ys/XPEhrG+bU49Mc9kanOaD1UKmmVouPf1iQhd4qJ66eLQI30EUyKRmdE7FVwyEqii/fqFX/DrR8YV7IDIwBJ3bQTQmFcSXvjaIyiMSeGafzhETOvyj05xX1Rl2/6MYGMzSKWWaMOPl73MI3wlw2p2u+CtwBtd6qE+3LLENsx1PFmmmeato1YbwUGEUS5oom58KFBJtHKxk1t3tJ8H6g69cxfWaw3fuFt3vQM77NMN8haYN/AP1QenDGixbrJzSH9rHDPIAdqadZJFtt64C8mk5xjFQMxFfdeiTIctQCwqTP7K3W05wustZjj8vW591JgwarzUql7Rlq0x+/rmtAq9kpekcMi3L9naA6bpCDj01m39nk2gOBPeoBGQkuCy3vk07I7aBLxtNeqPGQpcfGiATX8LKZ4eDVrkLOG+gfflEzfijsSCGt0qMWW8ThvhAt6Ya6u5T4gBWoJsecKK7wJ6wgkQiJMJTvMVWqc+aTUl2oKNSC7lWsoAwBB2xo2nEaXnZlyCRiSY1Kkb5u5Ldtft/fhBAUUHJ+jeoBcu4+A7g3smKvIMyAkrD+7JKU0JltUkSfUe2M5rCwRgniSmZlsTgREgpq50rntlcrzb4SR1f86cA4r5vtiebD8qt/ScNjibOrcQ60s9T1Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(30864003)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:18.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e7184c-9096-4785-6dc0-08db9eba87e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

Remove __init from following function to access during runtime:
    1. map_irq_to_domain()
    2. handle_device_interrupts()
    3. map_range_to_domain()
    4. unflatten_dt_node()

Move map_irq_to_domain() prototype from domain_build.h to setup.h.

To avoid breaking the build, following changes are also done:
1. Move map_irq_to_domain(), handle_device_interrupts() and map_range_to_domain()
    to device.c. After removing __init type,  these functions are not specific
    to domain building, so moving them out of domain_build.c to device.c.
2. Remove static type from handle_device_interrupt().

Overall, these changes are done to support the dynamic programming of a nodes
where an overlay node will be added to fdt and unflattened node will be added to
dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/device.c                   | 149 ++++++++++++++++++++++++
 xen/arch/arm/domain_build.c             | 147 -----------------------
 xen/arch/arm/include/asm/domain_build.h |   2 -
 xen/arch/arm/include/asm/setup.h        |   6 +
 xen/common/device_tree.c                |  12 +-
 5 files changed, 161 insertions(+), 155 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index ca8539dee5..1652d765bd 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -9,8 +9,10 @@
  */
 
 #include <asm/device.h>
+#include <asm/setup.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
 #include <xen/lib.h>
 
 extern const struct device_desc _sdevice[], _edevice[];
@@ -75,6 +77,153 @@ enum device_class device_get_class(const struct dt_device_node *dev)
     return DEVICE_UNKNOWN;
 }
 
+int map_irq_to_domain(struct domain *d, unsigned int irq,
+                      bool need_mapping, const char *devname)
+{
+    int res;
+
+    res = irq_permit_access(d, irq);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
+        return res;
+    }
+
+    if ( need_mapping )
+    {
+        /*
+         * Checking the return of vgic_reserve_virq is not
+         * necessary. It should not fail except when we try to map
+         * the IRQ twice. This can legitimately happen if the IRQ is shared
+         */
+        vgic_reserve_virq(d, irq);
+
+        res = route_irq_to_guest(d, irq, irq, devname);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+    return 0;
+}
+
+int map_range_to_domain(const struct dt_device_node *dev,
+                        uint64_t addr, uint64_t len, void *data)
+{
+    struct map_range_data *mr_data = data;
+    struct domain *d = mr_data->d;
+    int res;
+
+    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
+    {
+        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
+               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
+        return -ERANGE;
+    }
+
+    /*
+     * reserved-memory regions are RAM carved out for a special purpose.
+     * They are not MMIO and therefore a domain should not be able to
+     * manage them via the IOMEM interface.
+     */
+    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
+                     strlen("/reserved-memory/")) != 0 )
+    {
+        res = iomem_permit_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                    d->domain_id,
+                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
+            return res;
+        }
+    }
+
+    if ( !mr_data->skip_mapping )
+    {
+        res = map_regions_p2mt(d,
+                               gaddr_to_gfn(addr),
+                               PFN_UP(len),
+                               maddr_to_mfn(addr),
+                               mr_data->p2mt);
+
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
+                   " - 0x%"PRIx64" in domain %d\n",
+                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
+                   d->domain_id);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
+               addr, addr + len, mr_data->p2mt);
+
+    return 0;
+}
+
+/*
+ * handle_device_interrupts retrieves the interrupts configuration from
+ * a device tree node and maps those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int handle_device_interrupts(struct domain *d,
+                             struct dt_device_node *dev,
+                             bool need_mapping)
+{
+    unsigned int i, nirq;
+    int res;
+    struct dt_raw_irq rirq;
+
+    nirq = dt_number_of_irq(dev);
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQ that have no physical meaning
+         * ie: IRQ whose controller is not the GIC
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
+                      i, dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        res = platform_get_irq(dev, i);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
+        if ( res )
+            return res;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 39b4ee03a5..57b6a43314 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2293,39 +2293,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
-int __init map_irq_to_domain(struct domain *d, unsigned int irq,
-                             bool need_mapping, const char *devname)
-{
-    int res;
-
-    res = irq_permit_access(d, irq);
-    if ( res )
-    {
-        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
-        return res;
-    }
-
-    if ( need_mapping )
-    {
-        /*
-         * Checking the return of vgic_reserve_virq is not
-         * necessary. It should not fail except when we try to map
-         * the IRQ twice. This can legitimately happen if the IRQ is shared
-         */
-        vgic_reserve_virq(d, irq);
-
-        res = route_irq_to_guest(d, irq, irq, devname);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - IRQ: %u\n", irq);
-    return 0;
-}
-
 static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
                                        const struct dt_irq *dt_irq,
                                        void *data)
@@ -2355,64 +2322,6 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
     return res;
 }
 
-int __init map_range_to_domain(const struct dt_device_node *dev,
-                               uint64_t addr, uint64_t len, void *data)
-{
-    struct map_range_data *mr_data = data;
-    struct domain *d = mr_data->d;
-    int res;
-
-    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
-    {
-        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
-               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
-        return -ERANGE;
-    }
-
-    /*
-     * reserved-memory regions are RAM carved out for a special purpose.
-     * They are not MMIO and therefore a domain should not be able to
-     * manage them via the IOMEM interface.
-     */
-    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
-                     strlen("/reserved-memory/")) != 0 )
-    {
-        res = iomem_permit_access(d, paddr_to_pfn(addr),
-                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
-                    d->domain_id,
-                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
-            return res;
-        }
-    }
-
-    if ( !mr_data->skip_mapping )
-    {
-        res = map_regions_p2mt(d,
-                               gaddr_to_gfn(addr),
-                               PFN_UP(len),
-                               maddr_to_mfn(addr),
-                               mr_data->p2mt);
-
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
-                   " - 0x%"PRIx64" in domain %d\n",
-                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
-                   d->domain_id);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
-               addr, addr + len, mr_data->p2mt);
-
-    return 0;
-}
-
 /*
  * For a node which describes a discoverable bus (such as a PCI bus)
  * then we may need to perform additional mappings in order to make
@@ -2440,62 +2349,6 @@ static int __init map_device_children(const struct dt_device_node *dev,
     return 0;
 }
 
-/*
- * handle_device_interrupts retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
-static int __init handle_device_interrupts(struct domain *d,
-                                           struct dt_device_node *dev,
-                                           bool need_mapping)
-{
-    unsigned int i, nirq;
-    int res;
-    struct dt_raw_irq rirq;
-
-    nirq = dt_number_of_irq(dev);
-
-    /* Give permission and map IRQs */
-    for ( i = 0; i < nirq; i++ )
-    {
-        res = dt_device_get_raw_irq(dev, i, &rirq);
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        /*
-         * Don't map IRQ that have no physical meaning
-         * ie: IRQ whose controller is not the GIC
-         */
-        if ( rirq.controller != dt_interrupt_controller )
-        {
-            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
-                      i, dt_node_full_name(rirq.controller));
-            continue;
-        }
-
-        res = platform_get_irq(dev, i);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
-        if ( res )
-            return res;
-    }
-
-    return 0;
-}
-
 /*
  * For a given device node:
  *  - Give permission to the guest to manage IRQ and MMIO range
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 34ceddc995..b9329c9ee0 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -4,8 +4,6 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
-int map_irq_to_domain(struct domain *d, unsigned int irq,
-                      bool need_mapping, const char *devname);
 int make_chosen_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 19dc637d55..f532332d6c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -165,9 +165,15 @@ void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
+int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
+                             bool need_mapping);
+
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);
 
+int map_irq_to_domain(struct domain *d, unsigned int irq,
+                      bool need_mapping, const char *devname);
+
 extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
 
 #ifdef CONFIG_ARM_64
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index cd9a6a5c93..d70b6a7ac9 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1847,12 +1847,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  * @allnextpp: pointer to ->allnext from last allocated device_node
  * @fpsize: Size of the node path up at the current depth.
  */
-static unsigned long __init unflatten_dt_node(const void *fdt,
-                                              unsigned long mem,
-                                              unsigned long *p,
-                                              struct dt_device_node *dad,
-                                              struct dt_device_node ***allnextpp,
-                                              unsigned long fpsize)
+static unsigned long unflatten_dt_node(const void *fdt,
+                                       unsigned long mem,
+                                       unsigned long *p,
+                                       struct dt_device_node *dad,
+                                       struct dt_device_node ***allnextpp,
+                                       unsigned long fpsize)
 {
     struct dt_device_node *np;
     struct dt_property *pp, **prev_pp = NULL;
-- 
2.17.1


