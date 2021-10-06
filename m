Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6926B424500
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203019.358132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAw1-0001Yi-Or; Wed, 06 Oct 2021 17:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203019.358132; Wed, 06 Oct 2021 17:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAw1-0001Vg-K6; Wed, 06 Oct 2021 17:42:29 +0000
Received: by outflank-mailman (input) for mailman id 203019;
 Wed, 06 Oct 2021 17:42:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAw0-0004uL-9M
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:42:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e47cf43d-5ce7-423c-bf74-968a84f4339a;
 Wed, 06 Oct 2021 17:41:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5596211B3;
 Wed,  6 Oct 2021 10:41:58 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5107A3F70D;
 Wed,  6 Oct 2021 10:41:57 -0700 (PDT)
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
X-Inumbo-ID: e47cf43d-5ce7-423c-bf74-968a84f4339a
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 11/11] xen/arm: Add linux,pci-domain property for hwdom if not available.
Date: Wed,  6 Oct 2021 18:40:37 +0100
Message-Id: <dcf40709a3397c07c769a4fd0e55bbe3557730ec.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the property is not present in the device tree node for host bridge,
XEN while creating the dtb for hwdom will create this property and
assigns the already allocated segment to the host bridge
so that XEN and linux will have the same segment for the host bridges.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Change in v5: none
Change in v4:
- Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change in v3:
- Use is_pci_passthrough_enabled()
Change in v2:
- Add linux,pci-domain only when pci-passthrough command line option is enabeld
---
---
 xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
 xen/include/asm-arm/pci.h          |  9 +++++++++
 3 files changed, 46 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f4c89bde8c..8739e3285e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -747,6 +747,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             return res;
     }
 
+    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") )
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
index c5941b10e9..593beeb48c 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -255,6 +255,27 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
 
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
index 5532ce3977..7cb2e2f1ed 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -90,6 +90,8 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where);
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
+int pci_get_host_bridge_segment(const struct dt_device_node *node,
+                                uint16_t *segment);
 
 static always_inline bool is_pci_passthrough_enabled(void)
 {
@@ -104,5 +106,12 @@ static always_inline bool is_pci_passthrough_enabled(void)
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
2.25.1


