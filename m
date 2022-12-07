Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27836453E8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:18:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455857.713528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlX-0003KU-EF; Wed, 07 Dec 2022 06:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455857.713528; Wed, 07 Dec 2022 06:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlX-0003FW-8c; Wed, 07 Dec 2022 06:18:47 +0000
Received: by outflank-mailman (input) for mailman id 455857;
 Wed, 07 Dec 2022 06:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlV-0001e0-G8
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe59::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff479659-75f6-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:18:43 +0100 (CET)
Received: from MW4PR03CA0074.namprd03.prod.outlook.com (2603:10b6:303:b6::19)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:40 +0000
Received: from CO1NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::c1) by MW4PR03CA0074.outlook.office365.com
 (2603:10b6:303:b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT111.mail.protection.outlook.com (10.13.174.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 06:18:39 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 22:18:38 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:37 -0600
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
X-Inumbo-ID: ff479659-75f6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHjg41A5jbp5+CaLhktJqQGbB/zs2y3zqHDMnW5BDTLEA0THQKch2X+z2V4c54ZYspMBE3I57vBCZ9T/6fDHDurtqCf0bfogUNKU0uQhkve+CCuqk4AU1dXSkYARg2CrJevxm+Ulouh+xdoylcZqxClD/B5W/pkNz5R/rI9jwmHXBVp09krNzzTThpEXypSYjCmhSsIn5rXthuXi/yFX+NzdYNOTXHlQj1BBqcC7nNO0UUQ5iokfuUJgF03sP5RNhQxZgL8P54j3vGigboooLpm6m7CkA6YTdjuKrKt+h1N2AgrhfBTgaohJDGSKg7MuB/0zMHbra5EH9O8PS3gKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GshHSMMJR5sgvqnRBFWDW+JaPUeWwgv68C3b1I7NOss=;
 b=eXwdyU7f6elrVR0jEwglOlpYZbcsrZCQCPPW/BPvAHNFIZPjnSIYlhiDCM4vNRBaxV6i0gXkQvQwII6wpSliEoQa5Oi0hfDSVel1j0MOHospV1jBA/Ifl5lINHKSRf51L0l0MMYFArp5wD1KJlBo6zUr12fQKDjgS1aBV06WKuB/DmxtOWhWYUToAMWju2iNew0DZtIldkNssKQruBIu3zCzCqb7WWoXgHg1jAiV/bJ+6p6+ZlUrQABQt82aRON91R1Y+t4caKlmUJSQUwvXP3cFHVB7ExzCG5IJi869td1eOk5fPKlxKlPdV+WCihcyzJZPyIXlYYbMRsUmNEtYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GshHSMMJR5sgvqnRBFWDW+JaPUeWwgv68C3b1I7NOss=;
 b=ngkRp+p3Eed2Jsl+X5qWDztdyMEHjmBYIr7NVweoLlG0Dvuq093TksJKJP9/M3u1tPljqr4l2XGuNG3onLARgHHxoGk4idfLlmZCU/oYxQEr6yivoDgmFQ9sVnqdvwockB/t0j+krdaKZsPTalCr+nQr7M8TbXuICMpJiJPt++o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN][RFC PATCH v4 12/16] xen/arm: Implement device tree node removal functionalities
Date: Tue, 6 Dec 2022 22:18:11 -0800
Message-ID: <20221207061815.7404-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT111:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cfdc65-127b-439c-cafe-08dad81ae1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yLZhAjp0lEBRWb5nMY1TRjBi9e9muVFTpyR+75qqg5iX0yHm6dHxdAKPiez1qM2H7tqxUStiLTr3ssPt2ehoC1wtJ7l5UIVe69J8E48STJEhtYz+unFpd2qhsuOtcTZ+8chIR6j3lkRRMz8f01ltcmZizbWMpQEEcjePm4nsMv/XU24tejeTz4Q8zSobaBMFdN+G9o4ggnib7MMQ/RqpYtIDs24nFSgAkVdI7Ek2BXfe/9GwjLLY1KUdtW4/SfceQ5jlOeL9hXuyzpgi8XGIIKP2Q3ySc3Pu3wB3hmRd+Q+doJfVJ6yjGJd/VzhZ34hEHTdEFgnHARPs84rAE345lnO1F0auMhzKGbJpDg87E23+ygYiSh040wkVS8grUGQbA8/zaYt8hcjC11kKZ58GgVIadPbV13N8O7gniM4l4Zf+cSe2nINXraGtamwg0IlZQbOrpgSExNvBWPjejWMufvzogO/Q06XqRaLZyJKC84ZDZgqyJZ0wVah1t8k7MeWe+KU1q0b1UXKI40uH0HQjzQzBTyMP0LJZZ4dgfdmvDj5mUJJc2rTmT5fr48YvG1HqzLVq4LwR8Vzdy9zLVR5kPVw4Hn8aLN9zRwzKuwK6JIWUwjj26BgJZReec9pT8akNAe0+GMwXioUj8SO0KcAa3XvEjocsojyQKqq+ZpCSM1kvMXz/AurNuRbvj/nmaKRlUT01KePm1uuFYGTet2bEaJx9K2aDAjhjEdv9UaDX2SKDNj8jrwHvMnLRrSwNCHkYEAqki29NtvfI7ANbkny5S6tv2u5GC5AFk0cKzYN57xw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(478600001)(40460700003)(86362001)(26005)(40480700001)(426003)(81166007)(36756003)(356005)(336012)(82740400003)(82310400005)(186003)(1076003)(83380400001)(2616005)(30864003)(44832011)(41300700001)(5660300002)(8676002)(4326008)(36860700001)(70586007)(6666004)(316002)(70206006)(54906003)(6916009)(8936002)(2906002)(403724002)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:39.2477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cfdc65-127b-439c-cafe-08dad81ae1b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210

Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
device tree overlay.

xl dt_overlay remove file.dtbo:
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
 xen/common/Makefile          |   1 +
 xen/common/dt_overlay.c      | 411 +++++++++++++++++++++++++++++++++++
 xen/common/sysctl.c          |   5 +
 xen/include/public/sysctl.h  |  19 ++
 xen/include/xen/dt_overlay.h |  55 +++++
 5 files changed, 491 insertions(+)
 create mode 100644 xen/common/dt_overlay.c
 create mode 100644 xen/include/xen/dt_overlay.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..58a35f55b2 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-y += event_fifo.o
diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
new file mode 100644
index 0000000000..477341f0aa
--- /dev/null
+++ b/xen/common/dt_overlay.c
@@ -0,0 +1,411 @@
+/*
+ * xen/common/dt_overlay.c
+ *
+ * Device tree overlay support in Xen.
+ *
+ * Copyright (c) 2022 AMD Inc.
+ * Written by Vikram Garhwal <vikram.garhwal@amd.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <xen/iocap.h>
+#include <xen/xmalloc.h>
+#include <asm/domain_build.h>
+#include <xen/dt_overlay.h>
+#include <xen/guest_access.h>
+
+static LIST_HEAD(overlay_tracker);
+static DEFINE_SPINLOCK(overlay_lock);
+
+/* Find last descendants of the device_node. */
+static struct dt_device_node *find_last_descendants_node(
+                                            struct dt_device_node *device_node)
+{
+    struct dt_device_node *child_node;
+
+    for ( child_node = device_node->child; child_node->sibling != NULL;
+          child_node = child_node->sibling )
+    {
+    }
+
+    /* If last child_node also have children. */
+    if ( child_node->child )
+        child_node = find_last_descendants_node(child_node);
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
+static unsigned int overlay_node_count(void *fdto)
+{
+    unsigned int num_overlay_nodes = 0;
+    int fragment;
+
+    fdt_for_each_subnode(fragment, fdto, 0)
+    {
+        int subnode;
+        int overlay;
+
+        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+
+        /*
+         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
+         * overlay >= 0. So, no need for a overlay>=0 check here.
+         */
+        fdt_for_each_subnode(subnode, fdto, overlay)
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
+    domid_t domid = 0;
+    unsigned int naddr, len;
+    unsigned int i, nirq;
+    u64 addr, size;
+
+    domid = dt_device_used_by(device_node);
+
+    dt_dprintk("Checking if node %s is used by any domain\n",
+               device_node->full_name);
+
+    /* Remove the node iff it's assigned to domain 0 or domain io. */
+    if ( domid != 0 && domid != DOMID_IO )
+    {
+        printk(XENLOG_ERR "Device %s as it is being used by domain %d. Removing nodes failed\n",
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
+        rc = platform_get_irq(device_node, i);;
+
+        if ( irq_access_permitted(d, rc) == false )
+        {
+            printk(XENLOG_ERR "IRQ %d is not routed to domain %d\n", rc,
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
+
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
+        return -ENOMEM;
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
+    long ret = 0;
+    void *overlay_fdt;
+
+    if ( op->overlay_fdt_size <= 0 || op->overlay_fdt_size > 500000 )
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
+        break;
+    }
+
+    return ret;
+}
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 02505ab044..bb338b7c27 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/dt_overlay.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
@@ -482,6 +483,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             copyback = 1;
         break;
 
+    case XEN_SYSCTL_dt_overlay:
+        ret = dt_sysctl(&op->u.dt_overlay);
+        break;
+
     default:
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 5672906729..4bc76bbe27 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1079,6 +1079,23 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
+#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
+#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
+
+/*
+ * XEN_SYSCTL_dt_overlay
+ * Performs addition/removal of device tree nodes under parent node using dtbo.
+ * This does in three steps:
+ *  - Adds/Removes the nodes from dt_host.
+ *  - Adds/Removes IRQ permission for the nodes.
+ *  - Adds/Removes MMIO accesses.
+ */
+struct xen_sysctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(void) overlay_fdt;
+    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
+    uint8_t overlay_op; /* Add or remove. */
+};
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1109,6 +1126,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_dt_overlay                    30
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1139,6 +1157,7 @@ struct xen_sysctl {
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
+        struct xen_sysctl_dt_overlay        dt_overlay;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/dt_overlay.h b/xen/include/xen/dt_overlay.h
new file mode 100644
index 0000000000..30f4b86586
--- /dev/null
+++ b/xen/include/xen/dt_overlay.h
@@ -0,0 +1,55 @@
+/*
+ * xen/common/dt_overlay.h
+ *
+ * Device tree overlay support in Xen.
+ *
+ * Copyright (c) 2022 AMD Inc.
+ * Written by Vikram Garhwal <vikram.garhwal@amd.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef __XEN_DT_SYSCTL_H__
+#define __XEN_DT_SYSCTL_H__
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
-- 
2.17.1


