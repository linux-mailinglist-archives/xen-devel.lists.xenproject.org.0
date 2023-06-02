Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784271F755
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542801.847189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syd-0004DC-2K; Fri, 02 Jun 2023 00:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542801.847189; Fri, 02 Jun 2023 00:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syc-0003xM-0G; Fri, 02 Jun 2023 00:49:10 +0000
Received: by outflank-mailman (input) for mailman id 542801;
 Fri, 02 Jun 2023 00:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syW-0000if-K3
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:04 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44930436-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:49:03 +0200 (CEST)
Received: from MW2PR2101CA0010.namprd21.prod.outlook.com (2603:10b6:302:1::23)
 by PH0PR12MB5433.namprd12.prod.outlook.com (2603:10b6:510:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 00:48:59 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::93) by MW2PR2101CA0010.outlook.office365.com
 (2603:10b6:302:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.9 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:58 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:57 -0500
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
X-Inumbo-ID: 44930436-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5tDJtalXFdupYiYrMBWweqUS9scpUpkFpMuYVhJcslL6NEbaxL5pqj2/u9voM3sfM4gL3dOcih9uKlbL6hHoFPw7WJXMEMGqR+uwwZoIS5IYvHqZTln7GckWG/TB8juc/daOkt9EWUf6kIUR6jOmJJwTf/FRNS0QiQksxUQoOfK21I14Yz2J1hOY/X5WVUasVF0dAVGiPrJG3Ixx1SEfOCMk6yOAVRWEWoNtukiFNlhk9YKk3Y8SLUDO32QJ3vxSKSezAc7S3G4pQ9kd9OqqjgN+PMZb/xJ1FulJcFFImYDw8VDorub0e3lhMDsVxqPPXAcQ+5NKJJsRHO10z74vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZACCJSYeVg7JvgHrjij92Ypwo4mpte2CHes014k364Q=;
 b=iosJ7SXAHnjgSJb33btxlHwqyBRzGUjEI8yniwfnrbz1IR5ZWMck9CcbWR4EigCcuQALeZDcZOe362uDQJLAfv5bqmO9eDLhIizyL+EZ2FIjBKdGePDJ13SuV+mejATRFgXGf6GxA7lErfhnMvC9IDRObNWYJq2cI7eKUDPaa/j2Gwt1XP0RwXdqlbG2x9lPVr8L3hHa2L8AYAs0OgIUnmIK89ZWhLRaadBXy8540MBqKtnZcwBTJ57+gTpZAe09+bztu4Yq1zzX+UqVOis4Qu5d7AUk5urkS45nDm8NB/cRz9X6SaRlxlCBKIlZ7QvZnRusOHWLZV7R8Jg6127FdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZACCJSYeVg7JvgHrjij92Ypwo4mpte2CHes014k364Q=;
 b=5ROhODmnHeX6JV9CZLRkiff9I8EFy+PWEJPuhYvuyrofT3JfGCDXcCCkN/bkMvYt2R7J4kvMwU55PaeYOcmSg4tMI2Z1WQmjT2K6agYYyFFVamJ1DXiD+9UA7NmJEC+JBrUjjDkqA9gFifdeTd1FnGe5AXfzVrXrQ2D7GtjuCQo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v7 15/19] xen/arm: Implement device tree node removal functionalities
Date: Thu, 1 Jun 2023 17:48:20 -0700
Message-ID: <20230602004824.20731-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|PH0PR12MB5433:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8cf8c8-b245-4d92-51d3-08db63032705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QN5LlC3kSI0d5+U3zWOKZke362Z+VGzIyUl6YXHNnO23MOkQcOMYEeBLZCKMgAGquC5fDdXnGQj3aitoVZzLtIbiY9aRkZg9JL9a/FO4oCcZOB3N+8gP+Jd5h9eC2mK59tkt5SFaVyvTTdJxN0nJvyW1+W+vnwkmH4ANrJO1Xf4YbrBp+0etdZr1sIaMTeXq4lqedqLGAJdKrNUe+26ytJIgOIToxpucXANEpF8s/jfRfSQwSqOwc+vaDVGczLfPpobpfMXqWjrxdZw/2NPfv4A6f1do/s6o02NyQf30jAmYe14L38SekIbXa6x3KFDy4L1dKVCdfTIy0g3qyxJp8FLY6IigwnNJGnqGULWWdea3VbFXc/ByOrAWMwoy2kNQzIfMEJlxW5zAWCarOCuKcK02Df/yyclM8VFWTs8d3zFFj5ae4RJVKNg/oe7DucFCXATjXPfhhNaylR6VUY7snTO2wN55Mr3NTfJFVroBUUqCoT9woVnNo/oqzBZkMdi4SiT0gmn9dsJYeRtYqXdnfy8D0D8ofjSFvWWnWVYL+Ig2iiAaksGhqz+nkbYLXYG5Cno1L0ohBxwGtKXrkaYNhe9mfb0B3MzoqPWWxkOFeGJjNMdUgMumaa9uY5MgHKKKUCx7dauPzRez4YTZJhj6n9N1pUsy3WJPCi47D6wJfI/XsPDOKsXyCY2m1RcVvjyDCHHfLyC7CRciDe1EnvnN2uv2Kk6qI6DlNzFcVkEtk2YaPIHElWOz1DiSF11kpmceukKLn5YNO2+F5u4P7ri0YA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(336012)(426003)(47076005)(83380400001)(30864003)(2616005)(186003)(36860700001)(6916009)(4326008)(70206006)(70586007)(316002)(54906003)(478600001)(6666004)(8676002)(2906002)(1076003)(44832011)(5660300002)(26005)(41300700001)(8936002)(40480700001)(356005)(81166007)(36756003)(82740400003)(82310400005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:59.2362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8cf8c8-b245-4d92-51d3-08db63032705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5433

Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
device tree overlay.

xl dt-overlay remove file.dtbo:
    Removes all the nodes in a given dtbo.
    First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
    in dt_host and delete the device node entries from dt_host.

    The nodes get removed only if it is not used by any of dom0 or domio.

Also, added overlay_track struct to keep the track of added node through device
tree overlay. overlay_track has dt_host_new which is unflattened form of updated
fdt and name of overlay nodes. When a node is removed, we also free the memory
used by overlay_track for the particular overlay node.

Nested overlay removal is supported in sequential manner only i.e. if
overlay_child nests under overlay_parent, it is assumed that user first removes
overlay_child and then removes overlay_parent.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v6:
    Add explicit padding for xen_system_dt_overlay{}
    Update license.
    Rearrange xfree in dt_sysctl()
    Update overlay_track struct comment with relevant message.
    Fix missing xen/errno.h for builds without CONFIG_OVERLAY_DTB cases.
    Fix header formatting.
---
 xen/arch/arm/sysctl.c        |  16 +-
 xen/common/Makefile          |   1 +
 xen/common/dt-overlay.c      | 420 +++++++++++++++++++++++++++++++++++
 xen/include/public/sysctl.h  |  24 ++
 xen/include/xen/dt-overlay.h |  59 +++++
 5 files changed, 519 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index b0a78a8b10..8b813c970f 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -9,6 +9,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
 #include <public/sysctl.h>
@@ -21,7 +22,20 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
-    return -ENOSYS;
+    long ret;
+
+    switch ( sysctl->cmd )
+    {
+    case XEN_SYSCTL_dt_overlay:
+        ret = dt_sysctl(&sysctl->u.dt_overlay);
+        break;
+
+    default:
+        ret = -ENOSYS;
+        break;
+    }
+
+    return ret;
 }
 
 /*
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 46049eac35..e7e96b1087 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-y += event_fifo.o
diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
new file mode 100644
index 0000000000..b2a7e441df
--- /dev/null
+++ b/xen/common/dt-overlay.c
@@ -0,0 +1,420 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/common/dt-overlay.c
+ *
+ * Device tree overlay support in Xen.
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ * Written by Vikram Garhwal <vikram.garhwal@amd.com>
+ *
+ */
+#include <asm/domain_build.h>
+#include <xen/dt-overlay.h>
+#include <xen/guest_access.h>
+#include <xen/iocap.h>
+#include <xen/xmalloc.h>
+
+static LIST_HEAD(overlay_tracker);
+static DEFINE_SPINLOCK(overlay_lock);
+
+/* Find last descendants of the device_node. */
+static struct dt_device_node *
+                find_last_descendants_node(struct dt_device_node *device_node)
+{
+    struct dt_device_node *child_node;
+
+    for ( child_node = device_node->child; child_node->sibling != NULL;
+          child_node = child_node->sibling );
+
+    /* If last child_node also have children. */
+    if ( child_node->child )
+        child_node = find_last_descendants_node(child_node);
+
+    return child_node;
+}
+
+static int dt_overlay_remove_node(struct dt_device_node *device_node)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *parent_node;
+    struct dt_device_node *device_node_last_descendant = device_node->child;
+
+    parent_node = device_node->parent;
+
+    if ( parent_node == NULL )
+    {
+        dt_dprintk("%s's parent node not found\n", device_node->name);
+        return -EFAULT;
+    }
+
+    np = parent_node->child;
+
+    if ( np == NULL )
+    {
+        dt_dprintk("parent node %s's not found\n", parent_node->name);
+        return -EFAULT;
+    }
+
+    /* If node to be removed is only child node or first child. */
+    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
+    {
+        parent_node->child = np->sibling;
+
+        /*
+         * Iterate over all child nodes of device_node. Given that we are
+         * removing parent node, we need to remove all it's descendants too.
+         */
+        if ( device_node_last_descendant )
+        {
+            device_node_last_descendant =
+                                        find_last_descendants_node(device_node);
+            parent_node->allnext = device_node_last_descendant->allnext;
+        }
+        else
+            parent_node->allnext = np->allnext;
+
+        return 0;
+    }
+
+    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+    {
+        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
+        {
+            /* Found the node. Now we remove it. */
+            np->sibling = np->sibling->sibling;
+
+            if ( np->child )
+                np = find_last_descendants_node(np);
+
+            /*
+             * Iterate over all child nodes of device_node. Given that we are
+             * removing parent node, we need to remove all it's descendants too.
+             */
+            if ( device_node_last_descendant )
+                device_node_last_descendant =
+                                        find_last_descendants_node(device_node);
+
+            if ( device_node_last_descendant )
+                np->allnext = device_node_last_descendant->allnext;
+            else
+                np->allnext = np->allnext->allnext;
+
+            break;
+        }
+    }
+
+    return 0;
+}
+
+/* Basic sanity check for the dtbo tool stack provided to Xen. */
+static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
+{
+    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
+          fdt_check_header(overlay_fdt) )
+    {
+        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device Tree\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+/* Count number of nodes till one level of __overlay__ tag. */
+static unsigned int overlay_node_count(const void *overlay_fdt)
+{
+    unsigned int num_overlay_nodes = 0;
+    int fragment;
+
+    fdt_for_each_subnode(fragment, overlay_fdt, 0)
+    {
+        int subnode;
+        int overlay;
+
+        overlay = fdt_subnode_offset(overlay_fdt, fragment, "__overlay__");
+
+        /*
+         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
+         * overlay >= 0. So, no need for a overlay>=0 check here.
+         */
+        fdt_for_each_subnode(subnode, overlay_fdt, overlay)
+        {
+            num_overlay_nodes++;
+        }
+    }
+
+    return num_overlay_nodes;
+}
+
+static int handle_remove_irq_iommu(struct dt_device_node *device_node)
+{
+    int rc = 0;
+    struct domain *d = hardware_domain;
+    domid_t domid;
+    unsigned int naddr, len;
+    unsigned int i, nirq;
+
+    domid = dt_device_used_by(device_node);
+
+    dt_dprintk("Checking if node %s is used by any domain\n",
+               device_node->full_name);
+
+    /* Remove the node if only it's assigned to domain 0 or domain io. */
+    if ( domid != 0 && domid != DOMID_IO )
+    {
+        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
+               device_node->full_name, domid);
+        return -EINVAL;
+    }
+
+    dt_dprintk("Removing node: %s\n", device_node->full_name);
+
+    nirq = dt_number_of_irq(device_node);
+
+    /* Remove IRQ permission */
+    for ( i = 0; i < nirq; i++ )
+    {
+        rc = platform_get_irq(device_node, i);
+        if ( rc < 0 )
+        {
+            printk(XENLOG_ERR "Failed to get IRQ num for device node %s\n",
+                   device_node->full_name);
+            return -EINVAL;
+        }
+
+        if ( irq_access_permitted(d, rc) == false )
+        {
+            printk(XENLOG_ERR "IRQ %d is not routed to domain %u\n", rc,
+                   domid);
+            return -EINVAL;
+        }
+        /*
+         * TODO: We don't handle shared IRQs for now. So, it is assumed that
+         * the IRQs was not shared with another devices.
+         */
+        rc = irq_deny_access(d, rc);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
+                   i, device_node->full_name);
+            return rc;
+        }
+    }
+
+    /* Check if iommu property exists. */
+    if ( dt_get_property(device_node, "iommus", &len) )
+    {
+        rc = iommu_remove_dt_device(device_node);
+        if ( rc != 0 && rc != -ENXIO )
+            return rc;
+    }
+
+    naddr = dt_number_of_address(device_node);
+
+    /* Remove mmio access. */
+    for ( i = 0; i < naddr; i++ )
+    {
+        uint64_t addr, size;
+
+        rc = dt_device_get_address(device_node, i, &addr, &size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                   i, dt_node_full_name(device_node));
+            return rc;
+        }
+
+        rc = iomem_deny_access(d, paddr_to_pfn(addr),
+                               paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to remove dom%d access to"
+                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                   d->domain_id,
+                   addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
+            return rc;
+        }
+
+    }
+
+    return rc;
+}
+
+/* Removes all descendants of the given node. */
+static int remove_all_descendant_nodes(struct dt_device_node *device_node)
+{
+    int rc = 0;
+    struct dt_device_node *child_node;
+
+    for ( child_node = device_node->child; child_node != NULL;
+         child_node = child_node->sibling )
+    {
+        if ( child_node->child )
+            remove_all_descendant_nodes(child_node);
+
+        rc = handle_remove_irq_iommu(child_node);
+        if ( rc )
+            return rc;
+    }
+
+    return rc;
+}
+
+/* Remove nodes from dt_host. */
+static int remove_nodes(const struct overlay_track *tracker)
+{
+    int rc = 0;
+    struct dt_device_node *overlay_node;
+    unsigned int j;
+
+    for ( j = 0; j < tracker->num_nodes; j++ )
+    {
+        overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
+        if ( overlay_node == NULL )
+        {
+            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
+                   overlay_node->full_name);
+            return -EINVAL;
+        }
+
+        rc = remove_all_descendant_nodes(overlay_node);
+
+        /* All children nodes are unmapped. Now remove the node itself. */
+        rc = handle_remove_irq_iommu(overlay_node);
+        if ( rc )
+            return rc;
+
+        read_lock(&dt_host->lock);
+
+        rc = dt_overlay_remove_node(overlay_node);
+        if ( rc )
+        {
+            read_unlock(&dt_host->lock);
+
+            return rc;
+        }
+
+        read_unlock(&dt_host->lock);
+    }
+
+    return rc;
+}
+
+/*
+ * First finds the device node to remove. Check if the device is being used by
+ * any dom and finally remove it from dt_host. IOMMU is already being taken care
+ * while destroying the domain.
+ */
+static long handle_remove_overlay_nodes(void *overlay_fdt,
+                                        uint32_t overlay_fdt_size)
+{
+    int rc;
+    struct overlay_track *entry, *temp, *track;
+    bool found_entry = false;
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        return rc;
+
+    if ( overlay_node_count(overlay_fdt) == 0 )
+        return -EINVAL;
+
+    spin_lock(&overlay_lock);
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
+            track = entry;
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( found_entry == false )
+    {
+        rc = -EINVAL;
+
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Removing nodes is supported only for prior added dtbo.\n");
+        goto out;
+
+    }
+
+    rc = remove_nodes(entry);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Removing node failed\n");
+        goto out;
+    }
+
+    list_del(&entry->entry);
+
+    xfree(entry->dt_host_new);
+    xfree(entry->fdt);
+    xfree(entry->overlay_fdt);
+
+    xfree(entry->nodes_address);
+
+    xfree(entry);
+
+out:
+    spin_unlock(&overlay_lock);
+    return rc;
+}
+
+long dt_sysctl(struct xen_sysctl_dt_overlay *op)
+{
+    long ret;
+    void *overlay_fdt;
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
+    switch ( op->overlay_op )
+    {
+    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
+        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+
+        break;
+
+    default:
+        break;
+    }
+
+    xfree(overlay_fdt);
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 2b24d6bfd0..ff54607617 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1057,6 +1057,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
+#if defined(__arm__) || defined (__aarch64__)
+/*
+ * XEN_SYSCTL_dt_overlay
+ * Performs addition/removal of device tree nodes under parent node using dtbo.
+ * This does in three steps:
+ *  - Adds/Removes the nodes from dt_host.
+ *  - Adds/Removes IRQ permission for the nodes.
+ *  - Adds/Removes MMIO accesses.
+ */
+struct xen_sysctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(void) overlay_fdt;  /* IN: overlay fdt. */
+    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
+#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
+#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
+    uint8_t overlay_op;                     /* IN: Add or remove. */
+    uint8_t pad[3];                         /* IN: Must be zero. */
+};
+#endif
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1087,6 +1106,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_dt_overlay                    30
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1117,6 +1137,10 @@ struct xen_sysctl {
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
+
+#if defined(__arm__) || defined (__aarch64__)
+        struct xen_sysctl_dt_overlay        dt_overlay;
+#endif
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
new file mode 100644
index 0000000000..43fa5a02a0
--- /dev/null
+++ b/xen/include/xen/dt-overlay.h
@@ -0,0 +1,59 @@
+ /* SPDX-License-Identifier: GPL-2.0-only */
+ /*
+ * xen/dt-overlay.h
+ *
+ * Device tree overlay support in Xen.
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ * Written by Vikram Garhwal <vikram.garhwal@amd.com>
+ *
+ */
+#ifndef __XEN_DT_OVERLAY_H__
+#define __XEN_DT_OVERLAY_H__
+
+#include <xen/list.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/device_tree.h>
+#include <xen/rangeset.h>
+
+/*
+ * overlay_track describes information about added nodes through dtbo.
+ * @entry: List pointer.
+ * @dt_host_new: Pointer to the updated dt_host_new which is unflattened from
+    the 'updated fdt'.
+ * @fdt: Stores the fdt.
+ * @overlay_fdt: Stores a copy of input overlay_fdt.
+ * @nodes_address: Stores each overlay_node's address.
+ * @num_nodes: Total number of nodes in overlay dtb.
+ */
+struct overlay_track {
+    struct list_head entry;
+    struct dt_device_node *dt_host_new;
+    void *fdt;
+    void *overlay_fdt;
+    unsigned long *nodes_address;
+    unsigned int num_nodes;
+};
+
+struct xen_sysctl_dt_overlay;
+
+#ifdef CONFIG_OVERLAY_DTB
+long dt_sysctl(struct xen_sysctl_dt_overlay *op);
+#else
+#include <xen/errno.h>
+static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
+{
+    return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __XEN_DT_OVERLAY_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


