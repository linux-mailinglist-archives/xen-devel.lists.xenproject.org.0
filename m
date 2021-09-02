Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614523FE97D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176928.322147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYv-00067v-G1; Thu, 02 Sep 2021 06:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176928.322147; Thu, 02 Sep 2021 06:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYu-0005sp-J1; Thu, 02 Sep 2021 06:51:00 +0000
Received: by outflank-mailman (input) for mailman id 176928;
 Thu, 02 Sep 2021 06:07:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsz-0004hL-EG
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13554a0e-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:07:38 +0000 (UTC)
Received: from SN4PR0501CA0080.namprd05.prod.outlook.com
 (2603:10b6:803:22::18) by CY4PR02MB2181.namprd02.prod.outlook.com
 (2603:10b6:903:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 06:07:35 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::39) by SN4PR0501CA0080.outlook.office365.com
 (2603:10b6:803:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:14 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:14 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsY-000F6q-R6; Wed, 01 Sep 2021 23:07:14 -0700
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
X-Inumbo-ID: 13554a0e-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqkxgLDre73op25XKcR7jwvLLzEuiKnjoIesQcZcYYRcePW/Wczl6JfiC9Uir3gQK8nM3zNoTtErqKygYvEy1dkmH4H9s4dfeAcxub7lv7x/8yGC94r71oG++PKDB7197eywaey815bCUl1WDPiL8AKZgQForTwgwTew6DltJlL/GvTk59TdUROA7meHHXL0d3lvAienNWYmBxeeNvKJEwzNCesJMfJkCd0wPd22bYrW0rpilKaP9Dp0YrOpwS27MpaU4WA3ZWmtN2KLkmXp00ruvPiNHODynhRfxIUs5VHSzlRewe7EzZa2eajXfdcANqW+hcYQsQEiO2yS8zjMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bk58T2PdmP0MpUXqDTQL+WHaYdm6dJQvCtJfKGAwTtY=;
 b=Gr3IkqVkZ3nbcF2g6AmzHCrwhD7TpaUL/J623YInRRQQwNuMt0oEvfHv5RSjQtxp3YhARmZ3vE0TTPOP7MKObZb4/07WxGKA915Kle7tovwA9WvaGcIFyFQvFp9h1oKBBd6PbzfsfeI5r+XzZjGW8aPlErba6h9U94tvttjLgmLyrV3+26LieVWrzMbj6GESn/dMMgvM3MLMeCxsanApdfTAgNQVUrVt8r8O+4U0He9qiA7a0XfqalW14nCi+lmvZ/Bf53OgWkHqnfDfsAGh5qEsg6TmhfOoJaiV9vHZzNYkARYxCAWTRmSj2JRtpbVSVKNX/B5QhCDefVSLvqeucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bk58T2PdmP0MpUXqDTQL+WHaYdm6dJQvCtJfKGAwTtY=;
 b=mUirYEvbfTT77RlG81HQUzD6LadetmXz6xk4ERMiEy5FuyPHTdnz0h7q3CYy64U9pEAsjH9zCIHJfLSN+Tf/FuyXJKY8tprwYgxI8skLWFuHgbteNYu+lx/BMF59auKMGQqsEbFfG7K76I6T6OL/axyftPGhkQgq2eKeJDyjlQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN][RFC PATCH 09/13] xen/arm: Implement device tree node removal functionalities
Date: Wed, 1 Sep 2021 23:05:59 -0700
Message-ID: <1630562763-390068-10-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dce2cf17-de68-461f-9cf7-08d96dd7f531
X-MS-TrafficTypeDiagnostic: CY4PR02MB2181:
X-Microsoft-Antispam-PRVS:
	<CY4PR02MB2181A55F46C21721B0AB6A5DBCCE9@CY4PR02MB2181.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IO8yxi2Y5dHAysq/2g414+Sg8E//eFoQU44RCwtQOiZRJ45iK2Z11EfoBqD38MwB5c6tln/ETy+B1062kNw8CAcMX+uISjGSF9J6aqN8Q/cchBpHfbvaiMQe+2zh8wDXcMXvcZDymRr3GnCkTFw1RcMAr0kR6mVqN9hz14BV3TVHAI+FJzjJTKlgWUYcVxBGecl7a+V/yWwBFEr9nJOqmRQpsPDbQGPhekageHEsJnBOKmMP181lmd1EPdHnk4E9L4ewggaOV2RbyoAkdh7Ke0nGgc6Ry+Fdle8lS2aAI1jzykBKyt0lctPLi/rRbw9VawYyEPmcLZ6/CnAEYbOTSZMboVV/lyGXSInFazTxOO4TV5O6PABU5BSj77jglhKQ7y+xZWgUk/qDeb2ReM/fEsUPW14IqA54VxYG0y+Ur+5phrSPCwu5bZEi997EHmThvGM9xWqK3lYZ/PCO4tqWn3dZaFobHt0jjwLGAEV3X0fkLc0thkUcT0YLmdw1fD2GWrMGdKSWxwH34Mziy2AlrtAba1hCoK5PJJ/sTwprTIld2ergybfXEc7IG+jdTrQiTpLrG51Ubu+yT54ov+p3J0K6RtBGfIN48j1wEXmCgtegRnQvPMf3b0i//posj6G+nNCMIVLT9wLAbDnITeaR+Z2AeRiE4sgemxCKg/m4LF0AVj8Jc5ecC/2IUqfyZXVjzYjGnk2fPxxEvohGqPshaojBjpLFjTKVIorgzprAnXjDGnZ/GSCPLlnDmOssbvQO4Q2+d2Uc5oZOPOHV6l5Ntw==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(82740400003)(36860700001)(36756003)(4326008)(6916009)(316002)(2616005)(36906005)(83380400001)(7636003)(8676002)(54906003)(47076005)(2906002)(70206006)(70586007)(6666004)(9786002)(5660300002)(7696005)(186003)(82310400003)(356005)(8936002)(26005)(478600001)(426003)(336012)(102446001)(403724002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:34.7861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce2cf17-de68-461f-9cf7-08d96dd7f531
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2181

Introduce domctl XEN_DOMCTL_delfpga to remove a device-tree node added through
device tree overlay. Currently, this supports removing one node at a time.

DT node removal works with the following steps:
    1. finds a node with given path.
    2. Check if the node is used by any of dom0 or domus. It removes the node
only when it's not used by any domain.
    3. Removes IRQ permissions.
    4. Remove MMIO access.
    5. Find the node in dt_host and delete the device node entry from dt_host.
    6. Free the overlay_tracker node.

Also, added overlay_track struct to keep the track of added node through device
tree overlay. overlay_track has dt_host_new which is unflattened form of updated
fdt and name of overlay node.

When a node is removed, we also free the memory used by overlay_track for the
particular overlay node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/domctl.c         | 183 ++++++++++++++++++++++++++++++++++++++++++
 xen/common/device_tree.c      |  51 ++++++++++++
 xen/include/public/domctl.h   |   9 +++
 xen/include/xen/device_tree.h |   1 +
 4 files changed, 244 insertions(+)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index b7d27f3..5986934 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -9,11 +9,34 @@
 #include <xen/hypercall.h>
 #include <xen/iocap.h>
 #include <xen/lib.h>
+#include <xen/list.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/types.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
+#include <xen/xmalloc.h>
+#include <xen/device_tree.h>
+#include <asm/domain_build.h>
+
+/*
+ * overlay_node_track describes information about added nodes through dtbo.
+ * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
+ * @node_fullname: Store the name of nodes.
+ * @entry: List pointer.
+ */
+struct overlay_track {
+    struct list_head entry;
+    struct dt_device_node *dt_host_new;
+    /*
+     * TODO: We keep max nodes to 10 in an overlay. But for now we will be
+     * adding one node only.
+     */
+    char *node_fullname;
+};
+
+static LIST_HEAD(overlay_tracker);
+static DEFINE_SPINLOCK(overlay_lock);
 
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info)
@@ -45,6 +68,132 @@ static int handle_vuart_init(struct domain *d,
     return rc;
 }
 
+/*
+ * First finds the device node to remove. Check if the device is being used by
+ * any dom and finally remove it from dt_host. IOMMU is already being taken care
+ * while destroying the domain.
+ */
+static long handle_del_fpga_nodes(char *full_dt_node_path)
+{
+    struct domain *d = hardware_domain;
+    int rc = 0;
+    uint32_t ret = 0;
+    struct dt_device_node *fpga_device;
+    struct overlay_track *entry, *temp;
+    unsigned int naddr;
+    unsigned int i, nirq;
+    struct dt_raw_irq rirq;
+    u64 addr, size;
+
+    fpga_device = dt_find_node_by_path(full_dt_node_path);
+
+    if ( fpga_device == NULL )
+    {
+        printk(XENLOG_G_ERR "Device %s is not present in the tree\n",
+               full_dt_node_path);
+        return -EINVAL;
+    }
+
+    ret = dt_device_used_by(fpga_device);
+
+    if ( ret != 0 && ret != DOMID_IO )
+    {
+        printk(XENLOG_G_ERR "Cannot remove the device as it is being used by"
+               "domain %d\n", ret);
+        return -EPERM;
+    }
+
+    spin_lock(&overlay_lock);
+
+    nirq = dt_number_of_irq(fpga_device);
+
+    /* Remove IRQ permission */
+    for ( i = 0; i < nirq; i++ )
+    {
+        rc = dt_device_get_raw_irq(fpga_device, i, &rirq);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(fpga_device));
+            goto out;
+        }
+
+        rc = platform_get_irq(fpga_device, i);
+        if ( rc < 0 )
+        {
+            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
+                   i, dt_node_full_name(fpga_device));
+            goto out;
+        }
+
+        rc = irq_deny_access(d, rc);
+
+        if ( rc )
+        {
+            printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
+                   i, dt_node_full_name(fpga_device));
+            goto out;
+        }
+    }
+
+    rc = iommu_remove_dt_device(fpga_device);
+
+    if ( rc )
+        goto out;
+
+    naddr = dt_number_of_address(fpga_device);
+
+    /* Remove mmio access. */
+    for ( i = 0; i < naddr; i++ )
+    {
+        rc = dt_device_get_address(fpga_device, i, &addr, &size);
+
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                   i, dt_node_full_name(fpga_device));
+            goto out;
+        }
+
+        rc = iomem_deny_access(d, paddr_to_pfn(addr),
+                               paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
+
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to remove dom%d access to"
+                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                    d->domain_id,
+                    addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
+            goto out;
+        }
+    }
+
+    rc = fpga_del_node(fpga_device);
+
+    if ( rc )
+        goto out;
+
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        if ( (strcmp(full_dt_node_path, entry->node_fullname) == 0) )
+        {
+            list_del(&entry->entry);
+            xfree(entry->node_fullname);
+            xfree(entry->dt_host_new);
+            xfree(entry);
+            goto out;
+        }
+    }
+
+    printk(XENLOG_G_ERR "Cannot find the node in tracker. Memory will not"
+           "be freed\n");
+    rc = -ENOENT;
+
+out:
+    spin_unlock(&overlay_lock);
+    return rc;
+}
+
 long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -173,6 +322,40 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+
+    case XEN_DOMCTL_delfpga:
+    {
+        char *full_dt_node_path;
+        int rc;
+
+        if ( domctl->u.fpga_del_dt.size > 0 )
+            full_dt_node_path = xmalloc_bytes(domctl->u.fpga_del_dt.size);
+        else
+            return -EINVAL;
+
+        if ( full_dt_node_path == NULL )
+            return -ENOMEM;
+
+        rc = copy_from_guest(full_dt_node_path,
+                             domctl->u.fpga_del_dt.full_dt_node_path,
+                             domctl->u.fpga_del_dt.size);
+        if ( rc )
+        {
+            gprintk(XENLOG_ERR, "copy from guest failed\n");
+            xfree(full_dt_node_path);
+
+            return -EFAULT;
+        }
+
+        full_dt_node_path[domctl->u.fpga_del_dt.size - 1] = '\0';
+
+        rc = handle_del_fpga_nodes(full_dt_node_path);
+
+        xfree(full_dt_node_path);
+
+        return rc;
+    }
+
     default:
     {
         int rc;
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4946e83..04f2578 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -324,6 +324,57 @@ void dt_print_node_names(struct dt_device_node *dt)
     return;
 }
 
+int fpga_del_node(struct dt_device_node *device_node)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *parent_node;
+    struct dt_device_node *current_node;
+
+    parent_node = device_node->parent;
+
+    current_node = parent_node;
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
+    if ( np->name == device_node->name )
+    {
+        current_node->allnext = np->next;
+        return 0;
+    }
+
+    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+    {
+        current_node = np;
+        if ( np->sibling->name == device_node->name )
+        {
+            /* Found the node. Now we remove it. */
+            current_node->allnext = np->allnext->allnext;
+
+            if ( np->sibling->sibling )
+                current_node->sibling = np->sibling->sibling;
+            else
+                current_node->sibling = NULL;
+
+            break;
+        }
+    }
+
+    return 0;
+}
+
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node)
 {
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3..b1b8efd 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1169,6 +1169,13 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+/* XEN_DOMCTL_fpga_del. */
+struct xen_domctl_fpga_del_dt {
+    XEN_GUEST_HANDLE_64(char) full_dt_node_path;
+    uint32_t size;
+};
+
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1254,6 +1261,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
 #define XEN_DOMCTL_vmtrace_op                    84
+#define XEN_DOMCTL_delfpga                      86
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1315,6 +1323,7 @@ struct xen_domctl {
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
+        struct xen_domctl_fpga_del_dt       fpga_del_dt;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 7cc6093..eb7f645 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -496,6 +496,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
  * Prints all node names.
  */
 void dt_print_node_names(struct dt_device_node *dt);
+int fpga_del_node(struct dt_device_node *device_node);
 
 /**
  * dt_get_parent - Get a node's parent if any
-- 
2.7.4


