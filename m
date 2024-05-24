Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC678CDF6E
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728987.1134111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW6-0004gR-02; Fri, 24 May 2024 02:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728987.1134111; Fri, 24 May 2024 02:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW5-0004Wz-Lt; Fri, 24 May 2024 02:18:45 +0000
Received: by outflank-mailman (input) for mailman id 728987;
 Fri, 24 May 2024 02:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW4-0004I4-8L
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef9c251e-1973-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 04:18:41 +0200 (CEST)
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 02:18:38 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::b4) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Fri, 24 May 2024 02:18:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:18:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:33 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:32 -0500
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
X-Inumbo-ID: ef9c251e-1973-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiHs1HzmOyszYoEjU5xOTYRtzcqcrgOvQv3lyrAS2kF2ddF+EBMyhi4SGPld5fX9NBqynMypFD+FoqqnerlmE6pY2Urr2sYXe++KBH5A7dyscbS+8QEQHonzZcvnWOQ40tjLRE+q+MR8fUxllHvMWxEwiBnltuQLxia746T5LTNhaqAknGmVgXTr3YmsoZ/XIU3//CunJ+MGAXJs2cuKhpVCwjn2g1cA5VWKXLX3bJDpqqQKkFjKBUyp5YJHN3Z1AWcvUuwCoLyaDSxdziodumkJ2TlijLezdKIdx4B0WXT+DMI57ZD53sdnTMrkyhqI833Dz5L0iR9mJ1yH3oqOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RAlekm6oSAtsD1z/+65lehwcriofxvGBLLV+0kmPzI=;
 b=Q1YqmJMlKiPu4Tr2tfKYtCac+6uWrH1bKBGMK6nCNKbNSiDq4wKVXp+scGj8DAmdGqykntLmtWH6yOx7rYytGUDT8jhQJR3+hM3SgjLTLBrqzXNA71I+VMWAvTB62N5zm+r/5v6oDAjAQErcq8uEZUuvic7e/23oEyh7fQie/4F+fjf/hh7Yr3x1KVqccZG1+xxKVal2VC3ilhyF1M4nH7464bZuVHfitR9aY1MyofoX1ZagX+Up+ZVC3zzTjEPzXsQt55tID7mtZWewW+BJ7Ga6UeclYYIwHdK5yPlaIeEB/89LFm4ra3anF93BCD9BVxnKaEwybYzQjt+O3ZlZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RAlekm6oSAtsD1z/+65lehwcriofxvGBLLV+0kmPzI=;
 b=AdOkzR2v7KN7omCEqZMBSj8Z0o66l7aJaYZBThUqIRVe8oZWy1L1Q4UT6zDhnSZppCyZf9lmh22d+tvqmmGKERkrPk5RD25eMgm6A/E9B32Qx1sRyGUBxMjx7NSn0cdO0pdtU/LIhLfdb/I9/sh4Ie/dy041kp2gEYKIdnWMRLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v5 5/7] xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains
Date: Thu, 23 May 2024 19:18:12 -0700
Message-ID: <20240524021814.2666257-5-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 243daead-779b-4673-ba46-08dc7b97d253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jf2NIh+QHSzWhLOFWQJGnQ9Z+seGPhGnO1JTOS03Z3WEPNElMpQYSDmxVudX?=
 =?us-ascii?Q?1c3rumi27SXYS81SPkzfuR0V7L0MuLtVmEdV8SRtTMqnzeChFQqbweHgAh9r?=
 =?us-ascii?Q?8+Xsg3TsG7FUAvwppaRP8ZulIkPpKjrJ/KC1eF2aC0zqiURfmYMFtqLX09SC?=
 =?us-ascii?Q?vJ54+XKwBaDGOuXVNdy3y8QFo5/eFInZl1Xc0IniX3etGCkU+s20oueH6UsS?=
 =?us-ascii?Q?+f2TUN2kDExJzF+Oz4sIn4HJa1DK2yL/aCJK7atDcdUaKcSL97jx47gCKWBA?=
 =?us-ascii?Q?hSL38997nUGG2IzhKvnvnW0Datej0sYbLmCDNby/O6wRYnIv51S14fK4rGGF?=
 =?us-ascii?Q?QOkL0PUXDcn72zgpybkQ6bI5L4aB1Tev7vbr1sktbcYTNsBlEV8OcochhDve?=
 =?us-ascii?Q?Av3/iLq1u2IBrGj4rRaelEkVOlKowOxbJi+gQ05ev7CwF0d6XIMlNElBEOrM?=
 =?us-ascii?Q?aRtkIq8POGhGwymlL7S9zDFmR4B+VuF+mp71Y41+rjlmJhFh50U1WFG/XerI?=
 =?us-ascii?Q?bafgSa6IhUG+unWS53iWCDUbyjRT8Ztalh6Y/hYpMbTl22F+RiaT9aecj35T?=
 =?us-ascii?Q?BDhlzTEFbr/tuOADL55K1qbQC1zcyCFFVbjQRoFXhNIahnXFJVJ+cjWBRzrH?=
 =?us-ascii?Q?P81QBATf1Dzeem+0FMaCm/2tgXgQCL5LMY7bojFa2wnQd7GHaBYFlT/yn7wm?=
 =?us-ascii?Q?r70Cb/ZbIXLiVvAxVRF0QHxsKh1UrQobR0RyFsykouArtPFXP0ZfQujS5Li7?=
 =?us-ascii?Q?CVgUKJal87hmbSVxHGhUFFc65vewmgafibHWNitQgZKLe9rms2MUP0NwB7Aq?=
 =?us-ascii?Q?F96HeNhnpW/L9UyuLodTTIdCb89N2YMeI2QGIegupVdIuxW0CNL8J0T5ONJp?=
 =?us-ascii?Q?5PdkaNib/qUT2XqdzZOHysCFu4n2iYHDF2nmGgrszIDlDFT9fglsbxu/yb6d?=
 =?us-ascii?Q?ZQsJveGA/95mQlHZBahohToDk3pKLOlbGuPYBEtLxSREvJtWpwctz52Wq2G0?=
 =?us-ascii?Q?yAAJOljCS5xuwoTJMR7EfnBuYeLL9wgLNIC9I5mxmZvNbkCUjDI0HM40T77b?=
 =?us-ascii?Q?06eJjiobD9P/h3o8i/aJmw0HNsfFRcmiQoUJPOksHHkT+G3iVR2AC0mewfAs?=
 =?us-ascii?Q?1H2QXKcs4V8NEvIUQczmJ6fSEjNhQaF5gJ+XZ5S4Rwh8Y/FCL0ySHXhWWI39?=
 =?us-ascii?Q?/Lb5ze7q9ppN9bMRxlgIZ4zJyFkyvFq641ljmfQ/vkeY6QdErqt5HaunC77U?=
 =?us-ascii?Q?acD4KcsLcBWMGWO2rGmGplOoBX5RJ+juXB+n/ZNXUlDbCgMmYadbjvmhBNZm?=
 =?us-ascii?Q?af/DnyGgClAIhc6eqyc9RGPLK6VafrCU+jRbohoa2VkGrBDrtjt23ItkGzbs?=
 =?us-ascii?Q?9EHA7qs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:37.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243daead-779b-4673-ba46-08dc7b97d253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234

From: Henry Wang <xin.wang2@amd.com>

In order to support the dynamic dtbo device assignment to a running
VM, the add/remove of the DT overlay and the attach/detach of the
device from the DT overlay should happen separately. Therefore,
repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
overlay to Xen device tree, instead of assigning the device to the
hardware domain at the same time. It is OK to change the sysctl behavior
as this feature is experimental so changing sysctl behavior and breaking
compatibility is OK.

Add the XEN_DOMCTL_dt_overlay with operations
XEN_DOMCTL_DT_OVERLAY_ATTACH to do the device assignment to the domain.

The hypervisor firstly checks the DT overlay passed from the toolstack
is valid. Then the device nodes are retrieved from the overlay tracker
based on the DT overlay. The attach of the device is implemented by
mapping the IRQ and IOMMU resources. All devices in the overlay are
assigned to a single domain.

Also take the opportunity to make one coding style fix in sysctl.h.

xen,reg is to be used to handle non-1:1 mappings but it is currently
unsupported.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/arm/domctl.c        |   3 +
 xen/common/dt-overlay.c      | 207 ++++++++++++++++++++++++++---------
 xen/include/public/domctl.h  |  16 ++-
 xen/include/public/sysctl.h  |  11 +-
 xen/include/xen/dt-overlay.h |   8 ++
 5 files changed, 186 insertions(+), 59 deletions(-)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..12a12ee781 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012, Citrix Systems
  */
 
+#include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -176,6 +177,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_dt_overlay:
+        return dt_overlay_domctl(d, &domctl->u.dt_overlay);
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 9cece79067..c2b03865a7 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -356,6 +356,42 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
     return 0;
 }
 
+/* This function should be called with the overlay_lock taken */
+static struct overlay_track *
+find_track_entry_from_tracker(const void *overlay_fdt,
+                              uint32_t overlay_fdt_size)
+{
+    struct overlay_track *entry, *temp;
+    bool found_entry = false;
+
+    ASSERT(spin_is_locked(&overlay_lock));
+
+    /*
+     * First check if dtbo is correct i.e. it should one of the dtbo which was
+     * used when dynamically adding the node.
+     * Limitation: Cases with same node names but different property are not
+     * supported currently. We are relying on user to provide the same dtbo
+     * as it was used when adding the nodes.
+     */
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
+        {
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( !found_entry )
+    {
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Operation is supported only for prior added dtbo.\n");
+        return NULL;
+    }
+
+    return entry;
+}
+
 /* Check if node itself can be removed and remove node from IOMMU. */
 static int remove_node_resources(struct dt_device_node *device_node)
 {
@@ -485,8 +521,7 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
                                         uint32_t overlay_fdt_size)
 {
     int rc;
-    struct overlay_track *entry, *temp, *track;
-    bool found_entry = false;
+    struct overlay_track *entry;
 
     rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
     if ( rc )
@@ -494,29 +529,10 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     spin_lock(&overlay_lock);
 
-    /*
-     * First check if dtbo is correct i.e. it should one of the dtbo which was
-     * used when dynamically adding the node.
-     * Limitation: Cases with same node names but different property are not
-     * supported currently. We are relying on user to provide the same dtbo
-     * as it was used when adding the nodes.
-     */
-    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
-    {
-        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
-        {
-            track = entry;
-            found_entry = true;
-            break;
-        }
-    }
-
-    if ( !found_entry )
+    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
+    if ( entry == NULL )
     {
         rc = -EINVAL;
-
-        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
-               " Removing nodes is supported only for prior added dtbo.\n");
         goto out;
 
     }
@@ -620,15 +636,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
             return -EFAULT;
         }
 
-        rc = handle_device(hardware_domain, overlay_node, p2m_mmio_direct_c,
-                           tr->iomem_ranges,
-                           tr->irq_ranges);
         write_unlock(&dt_host_lock);
-        if ( rc )
-        {
-            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
-            return rc;
-        }
 
         /* Keep overlay_node address in tracker. */
         tr->nodes_address[j] = (unsigned long)overlay_node;
@@ -638,9 +646,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
 }
 /*
  * Adds device tree nodes under target node.
- * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
- * is done to avoid the removal of device_tree generation, iomem regions mapping
- * to hardware domain done by handle_node().
+ * We use tr->dt_host_new to unflatten the updated device_tree_flattened.
  */
 static long handle_add_overlay_nodes(void *overlay_fdt,
                                      uint32_t overlay_fdt_size)
@@ -774,20 +780,6 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
         goto err;
     }
 
-    tr->irq_ranges = rangeset_new(hardware_domain, "Overlays: Interrupts", 0);
-    if (tr->irq_ranges == NULL)
-    {
-        printk(XENLOG_ERR "Creating IRQ rangeset failed");
-        goto err;
-    }
-
-    tr->iomem_ranges = rangeset_new(hardware_domain, "Overlay: I/O Memory", 0);
-    if (tr->iomem_ranges == NULL)
-    {
-        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
-        goto err;
-    }
-
     rc = add_nodes(tr, nodes_full_path);
     if ( rc )
     {
@@ -843,14 +835,89 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
     xfree(tr->nodes_address);
     xfree(tr->fdt);
 
-    rangeset_destroy(tr->irq_ranges);
-    rangeset_destroy(tr->iomem_ranges);
-
     xfree(tr);
 
     return rc;
 }
 
+static long handle_attach_overlay_nodes(struct domain *d,
+                                        const void *overlay_fdt,
+                                        uint32_t overlay_fdt_size)
+{
+    int rc;
+    unsigned int j, len;
+    struct overlay_track *entry;
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        return rc;
+
+    spin_lock(&overlay_lock);
+
+    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
+    if ( entry == NULL )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    entry->irq_ranges = rangeset_new(d, "Overlays: Interrupts", 0);
+    if (entry->irq_ranges == NULL)
+    {
+        rc = -ENOMEM;
+        printk(XENLOG_ERR "Creating IRQ rangeset failed");
+        goto out;
+    }
+
+    entry->iomem_ranges = rangeset_new(d, "Overlay: I/O Memory", 0);
+    if (entry->iomem_ranges == NULL)
+    {
+        rc = -ENOMEM;
+        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
+        goto out;
+    }
+
+    for ( j = 0; j < entry->num_nodes; j++ )
+    {
+        struct dt_device_node *overlay_node;
+
+        overlay_node = (struct dt_device_node *)entry->nodes_address[j];
+        if ( overlay_node == NULL )
+        {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        if ( dt_get_property(overlay_node, "xen,reg", &len) )
+        {
+            printk(XENLOG_ERR "xen,reg not supported yet in overlay\n");
+            rc = -EOPNOTSUPP;
+            goto out;
+        }
+        write_lock(&dt_host_lock);
+        rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
+                           entry->iomem_ranges, entry->irq_ranges);
+        write_unlock(&dt_host_lock);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
+            goto out;
+        }
+    }
+
+    spin_unlock(&overlay_lock);
+
+    return 0;
+
+ out:
+    spin_unlock(&overlay_lock);
+
+    rangeset_destroy(entry->irq_ranges);
+    rangeset_destroy(entry->iomem_ranges);
+
+    return rc;
+}
+
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -890,6 +957,44 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
     return ret;
 }
 
+long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
+{
+    long ret;
+    void *overlay_fdt;
+
+    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
+        return -EOPNOTSUPP;
+
+    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
+        return -EINVAL;
+
+    if ( op->pad[0] || op->pad[1] || op->pad[2] )
+        return -EINVAL;
+
+    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
+
+    if ( overlay_fdt == NULL )
+        return -ENOMEM;
+
+    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
+    if ( ret )
+    {
+        gprintk(XENLOG_ERR, "copy from guest failed\n");
+        xfree(overlay_fdt);
+
+        return -EFAULT;
+    }
+
+    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_ATTACH )
+        ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
+    else
+        ret = -EOPNOTSUPP;
+
+    xfree(overlay_fdt);
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..6cd39ea46d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -1190,6 +1190,16 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+#if defined(__arm__) || defined(__aarch64__)
+struct xen_domctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
+    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
+#define XEN_DOMCTL_DT_OVERLAY_ATTACH                1
+    uint8_t overlay_op;                     /* IN: Attach. */
+    uint8_t pad[3];                         /* IN: Must be zero. */
+};
+#endif
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1277,6 +1287,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_dt_overlay                    87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1350,9 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+#if defined(__arm__) || defined(__aarch64__)
+        struct xen_domctl_dt_overlay        dt_overlay;
+#endif
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index febaa4b16a..3a6e7d48f0 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1184,14 +1184,11 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
-#if defined(__arm__) || defined (__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
 /*
  * XEN_SYSCTL_dt_overlay
- * Performs addition/removal of device tree nodes under parent node using dtbo.
- * This does in three steps:
- *  - Adds/Removes the nodes from dt_host.
- *  - Adds/Removes IRQ permission for the nodes.
- *  - Adds/Removes MMIO accesses.
+ * Performs addition/removal of device tree nodes under parent node using dtbo
+ * from dt_host.
  */
 struct xen_sysctl_dt_overlay {
     XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
@@ -1265,7 +1262,7 @@ struct xen_sysctl {
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
 
-#if defined(__arm__) || defined (__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
         struct xen_sysctl_dt_overlay        dt_overlay;
 #endif
         uint8_t                             pad[128];
diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
index c0567741ee..b2cedf3f2a 100644
--- a/xen/include/xen/dt-overlay.h
+++ b/xen/include/xen/dt-overlay.h
@@ -39,15 +39,23 @@ struct overlay_track {
 };
 
 struct xen_sysctl_dt_overlay;
+struct xen_domctl_dt_overlay;
 
 #ifdef CONFIG_OVERLAY_DTB
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
+long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);
 #else
 #include <xen/errno.h>
 static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     return -EOPNOTSUPP;
 }
+
+static inline long dt_overlay_domctl(struct domain *d,
+                                     struct xen_domctl_dt_overlay *op)
+{
+    return -EOPNOTSUPP;
+}
 #endif
 
 #endif /* __XEN_DT_OVERLAY_H__ */
-- 
2.25.1


