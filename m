Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0323F18CD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168685.307985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgr1-0001vv-BP; Thu, 19 Aug 2021 12:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168685.307985; Thu, 19 Aug 2021 12:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgr1-0001tW-7P; Thu, 19 Aug 2021 12:09:03 +0000
Received: by outflank-mailman (input) for mailman id 168685;
 Thu, 19 Aug 2021 12:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgqz-0001cS-MD
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:09:01 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d601c046-67f9-4157-93be-4ba20d430c33;
 Thu, 19 Aug 2021 12:09:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E29F31B;
 Thu, 19 Aug 2021 05:09:00 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 892853F70D;
 Thu, 19 Aug 2021 05:08:59 -0700 (PDT)
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
X-Inumbo-ID: d601c046-67f9-4157-93be-4ba20d430c33
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 14/14] xen/arm: Add linux,pci-domain property for hwdom if not available.
Date: Thu, 19 Aug 2021 13:02:54 +0100
Message-Id: <0b979ccab6a4c9b2070748709f737f41fa108a42.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

If the property is not present in the device tree node for host bridge,
XEN while creating the dtb for hwdom will create this property and
assigns the already allocated segment to the host bridge
so that XEN and linux will have the same segment for the host bridges.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c        | 18 ++++++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
 xen/include/asm-arm/pci.h          |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c86d52781..e0cf2ff19d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -581,6 +581,24 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             return res;
     }
 
+#ifdef CONFIG_HAS_PCI
+    if ( dt_device_type_is_equal(node, "pci") )
+    {
+        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
+        {
+            uint16_t segment;
+
+            res = pci_get_host_bridge_segment(node, &segment);
+            if ( res < 0 )
+                return res;
+
+            res = fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
+            if ( res )
+                return res;
+        }
+    }
+#endif
+
     /*
      * Override the property "status" to disable the device when it's
      * marked for passthrough.
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 62715b4676..5e34252deb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -280,6 +280,27 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
 
     return NULL;
 }
+
+/*
+ * This function will lookup an hostbridge based on config space address.
+ */
+int pci_get_host_bridge_segment(const struct dt_device_node *node,
+                                uint16_t *segment)
+{
+    struct pci_host_bridge *bridge;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        if ( bridge->dt_node != node )
+            continue;
+
+        *segment = bridge->segment;
+        return 0;
+    }
+
+    return -EINVAL;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index c58152de80..2d4610a23a 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -96,6 +96,9 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                uint32_t sbdf, uint32_t where);
 
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
+int pci_get_host_bridge_segment(const struct dt_device_node *node,
+                                uint16_t *segment);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.17.1


