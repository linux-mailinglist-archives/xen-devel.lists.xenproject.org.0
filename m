Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57D414804
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192631.343182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0cg-0006QL-Te; Wed, 22 Sep 2021 11:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192631.343182; Wed, 22 Sep 2021 11:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0cg-0006N8-Po; Wed, 22 Sep 2021 11:41:10 +0000
Received: by outflank-mailman (input) for mailman id 192631;
 Wed, 22 Sep 2021 11:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0ce-0005vT-MU
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:41:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1c2d6418-f2a8-4893-9eda-a6f45f565183;
 Wed, 22 Sep 2021 11:41:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 476036D;
 Wed, 22 Sep 2021 04:41:07 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E213F719;
 Wed, 22 Sep 2021 04:41:06 -0700 (PDT)
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
X-Inumbo-ID: 1c2d6418-f2a8-4893-9eda-a6f45f565183
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 17/17] xen/arm: Add linux,pci-domain property for hwdom if not available.
Date: Wed, 22 Sep 2021 12:35:03 +0100
Message-Id: <e1b8d878709dc8e93a3bb340f921a24976cebb57.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

If the property is not present in the device tree node for host bridge,
XEN while creating the dtb for hwdom will create this property and
assigns the already allocated segment to the host bridge
so that XEN and linux will have the same segment for the host bridges.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2:
- Add linux,pci-domain only when pci-passthrough command line option is enabeld
---
 xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
 xen/include/asm-arm/pci.h          |  9 +++++++++
 3 files changed, 46 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 5eb83b12a1..83ab0d52cc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -743,6 +743,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             return res;
     }
 
+    if ( pci_passthrough_enabled && dt_device_type_is_equal(node, "pci") )
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
+
     /*
      * Override the property "status" to disable the device when it's
      * marked for passthrough.
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 3bdc336268..a88f20175e 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -262,6 +262,27 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
 
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
index 9327b7488e..9edc6bc5ae 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -94,6 +94,8 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                uint32_t sbdf, uint32_t where);
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
+int pci_get_host_bridge_segment(const struct dt_device_node *node,
+                                uint16_t *segment);
 
 static always_inline bool is_pci_passthrough_enabled(void)
 {
@@ -110,5 +112,12 @@ static always_inline bool is_pci_passthrough_enabled(void)
     return false;
 }
 
+static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
+                                              uint16_t *segment)
+{
+    ASSERT_UNREACHABLE();
+    return -EINVAL;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
-- 
2.17.1


