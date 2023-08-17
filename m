Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904B77EE7B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585073.916108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDz-0005JX-Vr; Thu, 17 Aug 2023 00:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585073.916108; Thu, 17 Aug 2023 00:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDz-0005H6-SM; Thu, 17 Aug 2023 00:50:55 +0000
Received: by outflank-mailman (input) for mailman id 585073;
 Thu, 17 Aug 2023 00:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4I-0002YP-FG
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b73829e8-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:52 +0200 (CEST)
Received: from PH0PR07CA0069.namprd07.prod.outlook.com (2603:10b6:510:f::14)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:47 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::3e) by PH0PR07CA0069.outlook.office365.com
 (2603:10b6:510:f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Thu, 17 Aug 2023 00:40:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:46 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:45 -0500
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
X-Inumbo-ID: b73829e8-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7I85eWVrLalqd9AK2nwo3NPSi1ZA+d3gSJLayhsc5t+4r2MB1APzKmoULrOvsxItumOBVOmpOwtSGzib8uZKW6doshYaPPH6WGZnV8W43ZMsG//x4YjHU1Vu3IHosdJjTSVBD31yjio70g+ll8MK4gKqkmDaxQA2t/I6D67YlbOeVFGKMnHEGr3RYtCfR1Bw2qMcvDTybWqszqg1nSHW1aYBq8UqIX9rbnaFByqcjmFIHjYwf2/4ZUFIwXDY27UBLOJPnlPymhQPIEX2YtvNkYZkawWe3KGuUIs9vfeuG0GDlSNwcvFmYNONOYQlIUZrGC9C1mvpZU6SkHNDa35ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oazS5Pakz+arpr5BvXrP3KLf+0uUtUUB2wXc4d5nSBM=;
 b=nRJ+mjpIyKUeCc7nPCrs/9FHi2X/FqjYy5S/DVXepSaOZUMVqHbseluB5MY00JVs4K2nNZIpohYeqTQCFiLFqlpM7VpV+pf160xdg9d9oqzA7nwUfwpXsyhbDZqVVoGZ92RQQjU9VZSaDFkuQkn0Av3YfXCRX0Him2wypnVnnH7FSbCebyQ5iJsGDofzGfpwOUm5EtME0uMue+yghXmTXVYfmazjGlUQ2JN1q8LhcJ1D5whE7izgskyO6VRnjEF7qhMcLnKK7hABpQE5smS9b6eTEW6Z4Tl14fWrJEeIg4XWoA1VwYZMGoewCsZQmj2CESlISplyZloJuzUwYJWgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oazS5Pakz+arpr5BvXrP3KLf+0uUtUUB2wXc4d5nSBM=;
 b=MUhD65+GDOyvaQt0bM3+myPetKM24u0ON/W8Flww5/n9/q2oCpOUO4gInyEfXeYwvV8HI4wb+4q359Zq8gNqwaI8wlZH04GM7Jlvz9nsiWERrYZDCuuQXn05yHRhOa49k6+8omtjgH+3v+kYHL5rPNb3r0SXvQdQPhh7XDFA1nQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v8 15/19] xen/arm: Implement device tree node removal functionalities
Date: Wed, 16 Aug 2023 17:39:43 -0700
Message-ID: <20230817003947.3849-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c16b509-4682-4b20-4caa-08db9eba98c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TcFuFxZonsSeQI5slbJgbfbrW1gr6tdw8WYtCsiTnqbu7Dab1arbxCVQvucane7uKXzVHhjUOwQy5gTUqHxT6u63+98eckkhaaSGoeG89hO0Qd+PgBW26snVr6Ocu5Xqkaapc4OtOAjAP2CWSFcSXS+xgIH6GBd0MO5SeqxhwhnJk26of14ozYnF6qk8ibY3E0Hj9LVFBdWPIRtnEpEyJ66gqQmxZ68ZbaIS6xRkUEyWgEFXm5lSZvTFcSV8w6LDeJ9CJ50BmcmH6ON39q9aaU0RRtBbVceeOPCRnlJo9FtcdO6hCP1gcoKH6Ch8VgjykBbNBdlOZ0I7G6HC+9B2HNCewHzSLlp9I99p3rOyE32eTnq00kOUzF6CP0/4sCyaqp9u/Nq3ewYKIHu1v3x+JZdRSs/cUtUn55KgP8oTNWnMoQaxhdYroh5YgjL1+/HAw5bzyDedPehOr/+fW38iWFivkkvQBorcQXv/6DyZliZqfx9URRkNhkkoyKfEcuifyElzaRGPXvNsKCvaurWXv9TfM4D5vValczvPRegeF435CtyRp0cvMLGg+KNHAZEjgf4eLfazoAhzrdvhr3huGariNqIOc5KANcohp9I/JwH0NyZAYAh7IUlTr4m6z2jcRSBu3f4q6Gg9vsHLU4kSh1NzSZjS5wrp4V6lkAmRsiUdICrG5Lf6hJmGrAxqCoZZk1x5IrSFFGyRywiZjxtieF05pajg9tJoWvszkyYihOTxi8RgcZu1a9HhIqpdzfbs0/Sbh+raL/82mpKpVoTouTH+b3DM+0zLl0ID7UYDvN/dgI/GvaLRZ+Tcx8R5e1Lp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(186009)(1800799009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(2616005)(426003)(336012)(83380400001)(6916009)(54906003)(40480700001)(5660300002)(70206006)(70586007)(316002)(26005)(47076005)(36756003)(2906002)(44832011)(1076003)(30864003)(36860700001)(478600001)(82740400003)(81166007)(40460700003)(356005)(86362001)(4326008)(8676002)(8936002)(41300700001)(333604002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:46.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c16b509-4682-4b20-4caa-08db9eba98c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874

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
Also, this is an experimental feature so it is expected from user to make sure
correct device tree overlays are used when adding nodes and making sure devices
are not being used by other domain before removing them from Xen tree.
Partially added/removed i.e. failures while removing the overlay may cause other
failures and might need a system reboot.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Add dt-overlay.c in MAINTAINERS.
    Add comments for dt_overlay_remove_node.
    Rename handle_remove_irq_iommu() to remove_resources().
    Add comment regarding false mapping flag for reason behind not removing the
    mapping..
    Remove irq_access_premitted() check.
    Add error handling for remove_all_descendant_nodes
    Change read_lock with write_lock.
    Remove check_overlay_fdt() call from handle_remove_overlay_nodes().
    Re-organize dt_sysctl and reutnr -EOPNOSTSUPP for error cases. Also, renamed
        this function to dt_overlay_sysctl.
    Remove unnecessary header includes in dt-overlay.h
    Correct indentation and make func   tion inputs const wherever possible.
    Make overlay_fdt const_void inside xen_sysctl_dt_overlay{}.
    Add comment regarding why we not removing IRQ and MMIO mappings.
    Move overlay_node_count() out of this patch as it's not being used here
        anymore.
Changes from v6:
    Add explicit padding for xen_system_dt_overlay{}
    Update license.
    Rearrange xfree in dt_sysctl()
    Update overlay_track struct comment with relevant message.
    Fix missing xen/errno.h for builds without CONFIG_OVERLAY_DTB cases.
    Fix header formatting.
---
---
 MAINTAINERS                  |   1 +
 xen/arch/arm/sysctl.c        |  16 +-
 xen/common/Makefile          |   1 +
 xen/common/dt-overlay.c      | 395 +++++++++++++++++++++++++++++++++++
 xen/include/public/sysctl.h  |  24 +++
 xen/include/xen/dt-overlay.h |  58 +++++
 6 files changed, 494 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a0805d35cd..c41a7c5440 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -301,6 +301,7 @@ M:	Julien Grall <julien@xen.org>
 S:	Supported
 F:	xen/common/libfdt/
 F:	xen/common/device_tree.c
+F:	xen/common/dt-overlay.c
 F:	xen/include/xen/libfdt/
 F:	xen/include/xen/device_tree.h
 F:	xen/drivers/passthrough/device_tree.c
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index e9a0661146..5cda0dc674 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -9,6 +9,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
 #include <asm/arm64/sve.h>
@@ -25,7 +26,20 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
-    return -ENOSYS;
+    long ret;
+
+    switch ( sysctl->cmd )
+    {
+    case XEN_SYSCTL_dt_overlay:
+        ret = dt_overlay_sysctl(&sysctl->u.dt_overlay);
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
index 0000000000..ac104964b1
--- /dev/null
+++ b/xen/common/dt-overlay.c
@@ -0,0 +1,395 @@
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
+#include <xen/libfdt/libfdt.h>
+#include <xen/xmalloc.h>
+
+static LIST_HEAD(overlay_tracker);
+static DEFINE_SPINLOCK(overlay_lock);
+
+/* Find last descendants of the device_node. */
+static struct dt_device_node *
+find_last_descendants_node(const struct dt_device_node *device_node)
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
+    struct dt_device_node *last_descendant = device_node->child;
+
+    parent_node = device_node->parent;
+
+    /* Check if we are trying to remove "/" i.e. root node. */
+    if ( parent_node == NULL )
+    {
+        dt_dprintk("%s's parent node not found\n", device_node->name);
+        return -EFAULT;
+    }
+
+    /* Sanity check for linking between parent and child node. */
+    np = parent_node->child;
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
+         * removing a node, we need to remove all it's descendants too.
+         * Reason behind finding last_descendant:
+         * If device_node has multiple children, device_node->allnext will point
+         * to first_child and first_child->allnext will be a sibling. When the
+         * device_node and it's all children are removed, parent_node->allnext
+         * should point to node next to last children.
+         */
+        if ( last_descendant )
+        {
+            last_descendant = find_last_descendants_node(device_node);
+            parent_node->allnext = last_descendant->allnext;
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
+            if ( last_descendant )
+                last_descendant = find_last_descendants_node(device_node);
+
+            if ( last_descendant )
+                np->allnext = last_descendant->allnext;
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
+static int remove_resources(struct dt_device_node *device_node)
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
+    /* Remove the node if only it's assigned to hardware domain or domain io. */
+    if ( domid != hardware_domain->domain_id && domid != DOMID_IO )
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
+        /*
+         * TODO: We don't handle shared IRQs for now. So, it is assumed that
+         * the IRQs was not shared with another devices.
+         * TODO: Undo the IRQ routing.
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
+        if ( rc )
+            return rc;
+    }
+
+    naddr = dt_number_of_address(device_node);
+
+    /*
+     * Remove mmio access.
+     * TODO: Support for remove/add the mapping in P2M.
+     */
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
+static int remove_all_descendant_nodes(const struct dt_device_node *device_node)
+{
+    int rc = 0;
+    struct dt_device_node *child_node;
+
+    for ( child_node = device_node->child; child_node != NULL;
+         child_node = child_node->sibling )
+    {
+        if ( child_node->child )
+        {
+            rc = remove_all_descendant_nodes(child_node);
+            if ( rc )
+                return rc;
+        }
+
+        rc = remove_resources(child_node);
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
+        if ( rc )
+            return rc;
+
+        /* All children nodes are unmapped. Now remove the node itself. */
+        rc = remove_resources(overlay_node);
+        if ( rc )
+            return rc;
+
+        write_lock(&dt_host_lock);
+
+        rc = dt_overlay_remove_node(overlay_node);
+        if ( rc )
+        {
+            write_unlock(&dt_host_lock);
+            return rc;
+        }
+
+        write_unlock(&dt_host_lock);
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
+static long handle_remove_overlay_nodes(const void *overlay_fdt,
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
+    if ( !found_entry )
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
+ out:
+    spin_unlock(&overlay_lock);
+    return rc;
+}
+
+long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
+{
+    long ret;
+    void *overlay_fdt;
+
+    if ( op->overlay_op != XEN_SYSCTL_DT_OVERLAY_ADD &&
+         op->overlay_op != XEN_SYSCTL_DT_OVERLAY_REMOVE )
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
+    if ( op->overlay_op == XEN_SYSCTL_DT_OVERLAY_REMOVE )
+        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
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
index fa7147de47..900239133a 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1059,6 +1059,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
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
+    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
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
@@ -1089,6 +1108,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_dt_overlay                    30
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1119,6 +1139,10 @@ struct xen_sysctl {
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
index 0000000000..9cf36d7db0
--- /dev/null
+++ b/xen/include/xen/dt-overlay.h
@@ -0,0 +1,58 @@
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
+#include <xen/device_tree.h>
+#include <xen/list.h>
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
+long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
+#else
+#include <xen/errno.h>
+static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
+{
+    return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __XEN_DT_OVERLAY_H__ */
+
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


