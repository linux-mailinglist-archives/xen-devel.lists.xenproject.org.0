Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69E4B6FD6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273339.468488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzsj-0003zY-0Z; Tue, 15 Feb 2022 15:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273339.468488; Tue, 15 Feb 2022 15:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzsi-0003xe-Ty; Tue, 15 Feb 2022 15:36:44 +0000
Received: by outflank-mailman (input) for mailman id 273339;
 Tue, 15 Feb 2022 15:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ8a=S6=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nJzsh-0003xY-Kt
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:36:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 128d41e4-8e75-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:36:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 133091396;
 Tue, 15 Feb 2022 07:36:41 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 365B33F66F;
 Tue, 15 Feb 2022 07:36:40 -0800 (PST)
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
X-Inumbo-ID: 128d41e4-8e75-11ec-b215-9bbe72dcb22c
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: vpci: remove PCI I/O ranges property value
Date: Tue, 15 Feb 2022 15:36:32 +0000
Message-Id: <8ea25f00c8641bfd95a4d8444b82ca2ac3ee5ce0.1644939115.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI I/O space are not mapped to dom0 when PCI passthrough is enabled,
also there is no vpci trap handler register for IO bar.

Remove PCI I/O ranges property value from dom0 device tree node so that
dom0 linux will not allocate I/O space for PCI devices if
pci-passthrough is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c   | 29 +++++++++++++++
 xen/common/device_tree.c      | 69 +++++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h | 10 +++++
 3 files changed, 108 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6931c022a2..7cfe64fe97 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -648,6 +648,31 @@ static void __init allocate_static_memory(struct domain *d,
 }
 #endif
 
+/*
+ * PCI IO bar are not mapped to dom0 when PCI passthrough is enabled, also
+ * there is no trap handler registered for IO bar, therefore remove the IO
+ * range property from the device tree node for dom0.
+ */
+static int handle_linux_pci_io_ranges(struct kernel_info *kinfo,
+                                      const struct dt_device_node *node)
+{
+    if ( !is_pci_passthrough_enabled() )
+        return 0;
+
+    if ( !dt_device_type_is_equal(node, "pci") )
+        return 0;
+
+    /*
+     * The current heuristic assumes that a device is a host bridge
+     * if the type is "pci" and then parent type is not "pci".
+     */
+    if ( node->parent && dt_device_type_is_equal(node->parent, "pci") )
+        return 0;
+
+    return dt_pci_remove_io_ranges(kinfo->fdt, node);
+}
+
+
 /*
  * When PCI passthrough is available we want to keep the
  * "linux,pci-domain" in sync for every host bridge.
@@ -723,6 +748,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
     if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
         iommu_node = NULL;
 
+    res = handle_linux_pci_io_ranges(kinfo, node);
+    if ( res )
+        return res;
+
     dt_for_each_property_node (node, prop)
     {
         const void *prop_data = prop->value;
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..55a883e0f6 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2195,6 +2195,75 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
     return (u16)domain;
 }
 
+int dt_pci_remove_io_ranges(void *fdt, const struct dt_device_node *dev)
+{
+    const struct dt_device_node *parent = NULL;
+    const struct dt_bus *bus, *pbus;
+    unsigned int rlen;
+    int na, ns, pna, pns, rone;
+    const __be32 *ranges;
+    __be32 regs[((GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS + 1)
+               * 2];
+    __be32 *addr = &regs[0];
+
+    bus = dt_match_bus(dev);
+    if ( !bus )
+        return 0; /* device is not a bus */
+
+    parent = dt_get_parent(dev);
+    if ( !parent )
+        return -EINVAL;
+
+    ranges = dt_get_property(dev, "ranges", &rlen);
+    if ( !ranges )
+    {
+        printk(XENLOG_ERR "DT: no ranges; cannot enumerate %s\n",
+               dev->full_name);
+        return -EINVAL;
+    }
+    if ( !rlen ) /* Nothing to do */
+        return 0;
+
+    bus->count_cells(dev, &na, &ns);
+    if ( !DT_CHECK_COUNTS(na, ns) )
+    {
+        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
+               dev->full_name);
+        return -EINVAL;
+    }
+
+    pbus = dt_match_bus(parent);
+    if ( !pbus )
+    {
+        printk(XENLOG_ERR "DT: %s is not a valid bus\n", parent->full_name);
+        return -EINVAL;
+    }
+
+    pbus->count_cells(dev, &pna, &pns);
+    if ( !DT_CHECK_COUNTS(pna, pns) )
+    {
+        printk(XENLOG_ERR "dt_parse: Bad cell count for parent %s\n",
+               dev->full_name);
+        return -EINVAL;
+    }
+
+    /* Now walk through the ranges */
+    rlen /= 4;
+    rone = na + pna + ns;
+    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
+    {
+        unsigned int flags = bus->get_flags(ranges);
+        if ( flags & IORESOURCE_IO )
+            continue;
+
+        memcpy(addr, ranges, 4 * rone);
+
+        addr += rone;
+    }
+
+    return fdt_property(fdt, "ranges", regs, sizeof(regs));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index fd6cd00b43..580231f872 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -849,6 +849,16 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
 
+/**
+ * dt_pci_remove_io_range - Remove the PCI I/O range property value.
+ * @fdt: Pointer to the file descriptor tree.
+ * @node: Device tree node.
+ *
+ * This function will remove the PCI IO range property from the PCI device tree
+ * node.
+ */
+int dt_pci_remove_io_ranges(void *fdt, const struct dt_device_node *node);
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
 #ifdef CONFIG_DEVICE_TREE_DEBUG
-- 
2.25.1


