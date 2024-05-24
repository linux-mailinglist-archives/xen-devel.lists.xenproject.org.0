Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB68CEC5B
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729889.1135223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDi-0008KK-CX; Fri, 24 May 2024 22:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729889.1135223; Fri, 24 May 2024 22:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDi-0008Gh-9N; Fri, 24 May 2024 22:17:02 +0000
Received: by outflank-mailman (input) for mailman id 729889;
 Fri, 24 May 2024 22:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDg-0007Iy-S2
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:17:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55fd81fe-1a1b-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:16:59 +0200 (CEST)
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Fri, 24 May 2024 22:16:53 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::38) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26 via Frontend
 Transport; Fri, 24 May 2024 22:16:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:51 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:51 -0500
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
X-Inumbo-ID: 55fd81fe-1a1b-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeXeaYcAhNT879ugktFaQEjg1g4Ny4UwtfkPJYFyGHHUPBiIoVj/1eGGjO4K9msD5Ugabtoku1MuSVCWyuAJnpP4BdUgZ3KkcN7opchHjnxMfDpEYEXga7XaZqckEDOvLSyWunA3+bWtSouL0psh5VXLX477W+Rfku61Ik7T7ip3SwcOv+8i70QXAV9C1YmKWqRmuiBVDABmSDy0BmgN5U4koNOfibBJ4FDMOvY5qWd5hC7Y2rBQIHONOLJaQvlPF7+qwsp+/+Bbl830bzFNfu2cQpeCEHXhklQzlnlkCxaM3nVGHZrJP06G8zfY26c760ry+mT/p6N+hjFXi8RyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRI1HqDlL5ZdxdN/WlhV5sNzuCLmoN3HyEJY9Ux8c04=;
 b=lDe0INtBJnnPmVzEUEdO//GSBkgnnZlKn/fMvZzbAqqQ/jA77GeWGMf310HhcgB02GpF+1oK/VtiaFNqQjMEccYPa2/b9ljEa8hcaBKh1A8N/4qy5Kw3IE82P4GEkcRplOha8SlgWwuqSaT185IUYLOXTIVTPT4LjgsspWfxtiVgNpNVbQXBqNtXmYtPbBsGkCjJo/BCN1I/1LUN8cCgx+AgV0OPSWPkhBaPe3h4ahQT0zidzlLy2MueiXfupGhfKGJpRBalM5eTWDn2dsTynVBkCLS8VptHBwg8PXmrdTQrLEgL2UJgNVF3fe74QYLQCVEu/13apVunV7yUNWDQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRI1HqDlL5ZdxdN/WlhV5sNzuCLmoN3HyEJY9Ux8c04=;
 b=Yio6nUeEFewAbh3RSiJLaD1gd/5ZV3efbRgmIDUtM1NtzbpzwIW6BVtx6EDlKmWa644AG9G+E3iGJe1qD+9+ENtnMhYG3mse316E6QvSlqDrM3BbnYFcsynxyS9TGUswiQdKM486EkZemrWjDezDCl0p15D4sTF4zO5XYzsQvKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v6 5/7] xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains
Date: Fri, 24 May 2024 15:16:45 -0700
Message-ID: <20240524221647.2860711-5-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afe2021-d29c-4367-48ca-08dc7c3f3768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0zS8WKN9gYe0mffDjmraAbod5ztY2uhf1w7dACwXABVzCSN+hAdwAfH0lO49?=
 =?us-ascii?Q?oafYStPymArANWC76Ti9PkC+xxSWfzLBi+2PnLzU7KPXgv0v5vTYo4pUL6RO?=
 =?us-ascii?Q?/r2QttNSQa4wWd2uTc9rs5ufEEsEx5Ttut/ZKs1w707tUtlj4A9LrKO65xqZ?=
 =?us-ascii?Q?pZYGuMwAL+EQ4fMGdb2xBBaKKeuwpYvYLengJd175roUoJevBykCbfI6TX1s?=
 =?us-ascii?Q?Ig2MPrk7lfRguGfLHEf/ijU/4MdPl4jHcAPG5gcf9HTnImdAyrHQbiHyLgsE?=
 =?us-ascii?Q?rgbkJ4xNgTN8EhYLhVqHGSn/RUGYfxR9BoZFfdwrl9pGtcKesAjpIHvEiN9B?=
 =?us-ascii?Q?8DHzsNEi+dll2UDJ7TOOZUvP0+sGtdC9bKDripMYSMag7OIjm3DSc1Ap7KUA?=
 =?us-ascii?Q?r6KuMgqcOS1RklRsbZxG9HtehIPhZDQUdpVrvJatvF1eCOTpdfysu1d4MP4T?=
 =?us-ascii?Q?b1lnk392S9GIVqIoLnmW31kqlNwIP8bK4XM3jRH31wLdwYwCgwHRZpWFpn/G?=
 =?us-ascii?Q?AkF4aBdMXs/QU7RUUEHnnCCNwA/ebl1EB2u4X0jI7PfYuTbWSki0/+kXv/l5?=
 =?us-ascii?Q?Ka1+PKazuapvLg8dMjDA+PtA/IgTpmzggro3KDHbjsJixbENgqzAzFXtn7fe?=
 =?us-ascii?Q?RSHfSLN39W62GgKONDDPApFKFPpGIb3BtzPkeIBHSHBgyj3g6ouYEK2S5Qja?=
 =?us-ascii?Q?9iD+ueIeR8hr/fZRwhG8EIZKJ6tcNDU5i49/KhV+CKPFhOp51DZHJ7PArzW3?=
 =?us-ascii?Q?B9lcner3rE9fuu4h7HDXFsfmPVgYhdTdwP4IGfMj6+F7mPzz0C7R6EdwYvcV?=
 =?us-ascii?Q?Xn7Fj0hEXFQoIYRpo0xUPLixH8Iiajgi5KxAtwzJldjZM9r6UFuCml5Mopgi?=
 =?us-ascii?Q?JiVlG0Yog0LBHnco5MqNhrUZ59iqKZ/j60gkRR8Rrf7O5S8OYSF2V36t3X3i?=
 =?us-ascii?Q?O76+ykXJQbXJKZaZHi1kAUut91rzv5xiEjoLh8NQeCA3r03RaNjO8AMzC1hD?=
 =?us-ascii?Q?lUNTZJ/WT+I2vE3w6Wf0gBrDqnc3JLGGWW5gsIal1T+D6dGS1H6XR8Fjsan4?=
 =?us-ascii?Q?HmMY00zRNjNMvcFw8w7P4CKAf3m9nw1VowL47YxCbEbxL7oq/U4rVeO1yQlf?=
 =?us-ascii?Q?tnsZYL6HxrKUe3c2TicAKNC8EqZXy8AtuhtjARxsyxI2++fP2YnJLee45bdi?=
 =?us-ascii?Q?vp20hcCZ7BUib4D1d+ZkWNMFm6IgV4N/i83ytL+ItaV+QHarLGwe4mn/rP/b?=
 =?us-ascii?Q?8wvlvfN5jIfukUJuhFGdVD6e7bBqFo5Cxn8q042xzEZXi68gIvEhyycUe6U+?=
 =?us-ascii?Q?ciBP/RamkTKvj7S8CCSo9r8z3W84fNsfkUMmXIhWMi79OjPXtwkicdZCyLYd?=
 =?us-ascii?Q?+Gg2xf4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:53.3039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afe2021-d29c-4367-48ca-08dc7c3f3768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

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
Introduce DT_OVERLAY_MAX_SIZE and use it to avoid repetitions of
KB(500).

xen,reg is to be used to handle non-1:1 mappings but it is currently
unsupported. For now return errors for not-1:1 mapped domains.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/arm/domctl.c        |   3 +
 xen/common/dt-overlay.c      | 211 ++++++++++++++++++++++++++---------
 xen/include/public/domctl.h  |  16 ++-
 xen/include/public/sysctl.h  |  11 +-
 xen/include/xen/dt-overlay.h |   8 ++
 5 files changed, 189 insertions(+), 60 deletions(-)

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
index 9cece79067..d53b4706cd 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -15,6 +15,8 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/xmalloc.h>
 
+#define DT_OVERLAY_MAX_SIZE KB(500)
+
 static LIST_HEAD(overlay_tracker);
 static DEFINE_SPINLOCK(overlay_lock);
 
@@ -356,6 +358,42 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
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
@@ -485,8 +523,7 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
                                         uint32_t overlay_fdt_size)
 {
     int rc;
-    struct overlay_track *entry, *temp, *track;
-    bool found_entry = false;
+    struct overlay_track *entry;
 
     rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
     if ( rc )
@@ -494,29 +531,10 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
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
@@ -620,15 +638,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
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
@@ -638,9 +648,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
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
@@ -774,20 +782,6 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
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
@@ -843,14 +837,83 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
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
+    unsigned int j;
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
@@ -860,7 +923,8 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
          op->overlay_op != XEN_SYSCTL_DT_OVERLAY_REMOVE )
         return -EOPNOTSUPP;
 
-    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
+    if ( op->overlay_fdt_size == 0 ||
+         op->overlay_fdt_size > DT_OVERLAY_MAX_SIZE )
         return -EINVAL;
 
     if ( op->pad[0] || op->pad[1] || op->pad[2] )
@@ -890,6 +954,49 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
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
+    if ( op->overlay_fdt_size == 0 ||
+         op->overlay_fdt_size > DT_OVERLAY_MAX_SIZE )
+        return -EINVAL;
+
+    if ( op->pad[0] || op->pad[1] || op->pad[2] )
+        return -EINVAL;
+
+    /* TODO: add support for non-1:1 domains using xen,reg */
+    if ( !is_domain_direct_mapped(d) )
+        return -EOPNOTSUPP;
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


