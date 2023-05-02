Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5776F4DA9
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528872.822645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ9-00014v-9P; Tue, 02 May 2023 23:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528872.822645; Tue, 02 May 2023 23:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ8-0000ql-Lz; Tue, 02 May 2023 23:37:50 +0000
Received: by outflank-mailman (input) for mailman id 528872;
 Tue, 02 May 2023 23:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ5-0005Si-IX
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553c6b0d-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:44 +0200 (CEST)
Received: from BN9PR03CA0742.namprd03.prod.outlook.com (2603:10b6:408:110::27)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 23:37:40 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::24) by BN9PR03CA0742.outlook.office365.com
 (2603:10b6:408:110::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.32 via Frontend
 Transport; Tue, 2 May 2023 23:37:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.22 via Frontend Transport; Tue, 2 May 2023 23:37:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:39 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:38 -0500
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
X-Inumbo-ID: 553c6b0d-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf+Pl77K6re/uAAOe5J4d4QO0tluyAQnYENz1B5K2kLmkfK2zC954matqkxE/DTpmsorFJIonpoTDzx7fOFWprJ9S7Bvqll8TlSBiH4BnemvzvPeyso+0rpNmy7MGyKe9KPnttUlKYLAVY/2z3e+s6elSp2vRTD3rB8t2rKpgXyLwAO0SUN8+5T1AjE6mtISgWvX1r6pQ6RuqfvZv2DAmJkAlqlM4YY0cf9Tk9FoYwTlozNsKDQs6j9tM6mYER2uQfX0AebVFv5gdx6amuzpHtDwMbuArX3JLSIkG1n6SLSdKfzjjzU7bJ3iXCm8iSc3RTRVKXJQ+0+aFAH/H26Zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lA6+5GWeGyVJ/eIdTxBUhZWKw1xIAoedVb14517C6o=;
 b=R6TNLe8+2RrL5HKo7lQY9ChtM6wPoQjqI8QVsU8yacg70PslIwv7gsqU7yDzeNGVO1WSXiUFFloIUrWWvnMlYozfoc8SN5SfQA0GwUFJ5BDkYb1Twasrbq0iNx3vOf7QE7rKjuK3+8jUJEnBaJ5oU3w0i9ZiUE3HRoZ47JfaXOTkDQdhjJMEcpKmY2Sdwgz9BgbM37J63dDvfPx+YoeoIRPYoYjQH5CHPyaQPk8E4aTG1bdELaS2K3smzybPrlYqZOBA4VMScnkxL95NYvLkofVWX5+lHA2D1dkU+gwfYt5e923k9TK46aNuqqBW7vzxT5JbER2Z3W1Y/qhI7QUEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lA6+5GWeGyVJ/eIdTxBUhZWKw1xIAoedVb14517C6o=;
 b=Qpbpu8+IF1xpezD7wZX6vbBwY7w0HXK28rUpruhu9xKRMEx7yreFz58Lf2T5UN2N+v0m5Horm7pVGooqFKqAXF7r991YNQbfOlfKUIZnUigIKJ+FwxKz9CJyPxMPkOXvR7mfmvE8FrKnYtmjopNVAfQXEAD1uGNQGY3XumDNZmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN][PATCH v6 15/19] xen/arm: Implement device tree node removal functionalities
Date: Tue, 2 May 2023 16:36:46 -0700
Message-ID: <20230502233650.20121-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d8e0b7-d6c2-42a9-5f77-08db4b66380b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ObIVh6nvqFLs+CfF0txS2yj8MSGrx3IkESWWOS7Xihpa/omLs9Z9DE8hsoMksIvtKx0wYkWBMOeby0wVb1AaD2Nxasd/fA4vpgtHlVtsZMIDKnhMRYN5huYQf+vZF6zHJ3uxhxbXhVVcC7wlIavLfsBYoteJ3fgYy1m8lwwt3T7gCyFMT1WAT2VHCzEXFVrX4u/ohnQVHcTDD/yI2MZ+ve9Bj+itFG+yWdtj2FhWLTfpfOQ5K1AwmF5egPx9yHffC7IpiW7dDyrntp34WUZn5zUzu8ivEYK4VMWd4zRsG3198PLBcyIB3k9/WPRIFiV4N5EuHGmIcdcVJlNoREsELzT6iociJr01r+kj6SyCNRoesUFHIQCKD+d3Gz3PEWNGi7Lj1s8OnEvXlIRE1VVfWGRe8sslB4bOswgD8hOkJc029sFq1Ma+flo/M/PmvdF6zyMf5zfmL3+ORytITDp5xsVGsy3bYncKMVn8GbuTXjFxkWFUrpiIhfDNu46TtPkNzBZE1jsQnwGHC+qQgeaCAffvndxLlY54DegzisCl7N2oKgmmxdM/A+oS1PndxHWIwxUFpULO7HJvqEtKkd4ycf5Mp8DbL1rGea1tPF5Obu34rEn0hqKDeOBlbzLC4UaXM9rhs8ZxpQ7WhrJT7sKCUZYjS1ivbWQqzeJTapEjNWsjVuQodkj7QzUZ75wLFgspkTSIxMXmzirTDOlWSN7dA1tprGom/4NNEou1nBB6mWQqv+eqIjDx4j+2DHuZSC3r6RKTLITpQQL6MLc7a52+9g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(478600001)(36860700001)(36756003)(316002)(5660300002)(2906002)(30864003)(40460700003)(8936002)(8676002)(70206006)(40480700001)(86362001)(4326008)(82310400005)(70586007)(81166007)(6916009)(336012)(356005)(44832011)(41300700001)(82740400003)(83380400001)(426003)(47076005)(54906003)(1076003)(186003)(26005)(2616005)(6666004)(403724002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:40.1605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d8e0b7-d6c2-42a9-5f77-08db4b66380b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714

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
 xen/arch/arm/sysctl.c        |  16 +-
 xen/common/Makefile          |   1 +
 xen/common/dt-overlay.c      | 419 +++++++++++++++++++++++++++++++++++
 xen/include/public/sysctl.h  |  23 ++
 xen/include/xen/dt-overlay.h |  58 +++++
 5 files changed, 516 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index b0a78a8b10..456358166c 100644
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
+    long ret = 0;
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
index 0000000000..b89cceab84
--- /dev/null
+++ b/xen/common/dt-overlay.c
@@ -0,0 +1,419 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+    int rc = 0;
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
+               " Removing nodes is supported for only prior added dtbo. Please"
+               " provide a valid dtbo which was used to add the nodes.\n");
+        goto out;
+
+    }
+
+    rc = remove_nodes(entry);
+
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
+        xfree(overlay_fdt);
+
+        break;
+
+    default:
+        xfree(overlay_fdt);
+        break;
+    }
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
index 2b24d6bfd0..28f7fba98b 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1057,6 +1057,24 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
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
+};
+#endif
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1087,6 +1105,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_dt_overlay                    30
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1117,6 +1136,10 @@ struct xen_sysctl {
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
index 0000000000..5b369f8eb7
--- /dev/null
+++ b/xen/include/xen/dt-overlay.h
@@ -0,0 +1,58 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
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
+ * overlay_node_track describes information about added nodes through dtbo.
+ * @entry: List pointer.
+ * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
+ * @fdt: Stores the fdt.
+ * @nodes_fullname: Stores the full name of nodes.
+ * @nodes_irq: Stores the IRQ added from overlay dtb.
+ * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
+ * @num_nodes: Stores total number of nodes in overlay dtb.
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
+static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
+{
+    return -ENOSYS;
+}
+#endif
+#endif
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


