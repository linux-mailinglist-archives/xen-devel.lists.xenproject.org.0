Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F034244FA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202997.358099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvd-0007L1-Kp; Wed, 06 Oct 2021 17:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202997.358099; Wed, 06 Oct 2021 17:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvd-0007Fk-Cv; Wed, 06 Oct 2021 17:42:05 +0000
Received: by outflank-mailman (input) for mailman id 202997;
 Wed, 06 Oct 2021 17:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAvb-0004uL-8Q
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:42:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6d7f437f-a58a-45a2-bef9-8925afe7acd5;
 Wed, 06 Oct 2021 17:41:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D4B76D;
 Wed,  6 Oct 2021 10:41:50 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CB783F70D;
 Wed,  6 Oct 2021 10:41:48 -0700 (PDT)
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
X-Inumbo-ID: 6d7f437f-a58a-45a2-bef9-8925afe7acd5
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 06/11] xen/arm: Implement pci access functions
Date: Wed,  6 Oct 2021 18:40:32 +0100
Message-Id: <b3fd5516dca0bc82b018d75bd85e09b6484888d7.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement generic pci access functions to read/write the configuration
space.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Change in v5: none
Change in v4:
- Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change in v3:
- Remove PRI_pci as not used.
- Replace uint32_t sbdf to pci_sbdf_t sbdf to avoid typecast
Change in v2: Fixed comments
---
---
 xen/arch/arm/pci/pci-access.c      | 57 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
 xen/include/asm-arm/pci.h          |  1 +
 3 files changed, 77 insertions(+)

diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 3cd14a4b87..9f9aac43d7 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -16,6 +16,7 @@
 #include <asm/io.h>
 
 #define INVALID_VALUE (~0U)
+#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
 
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
                             uint32_t reg, uint32_t len, uint32_t *value)
@@ -72,6 +73,62 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
     return 0;
 }
 
+static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
+                                unsigned int len)
+{
+    uint32_t val = PCI_ERR_VALUE(len);
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+        return val;
+
+    if ( unlikely(!bridge->ops->read) )
+        return val;
+
+    bridge->ops->read(bridge, sbdf, reg, len, &val);
+
+    return val;
+}
+
+static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
+                             unsigned int len, uint32_t val)
+{
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+        return;
+
+    if ( unlikely(!bridge->ops->write) )
+        return;
+
+    bridge->ops->write(bridge, sbdf, reg, len, val);
+}
+
+/*
+ * Wrappers for all PCI configuration access functions.
+ */
+
+#define PCI_OP_WRITE(size, type)                            \
+    void pci_conf_write##size(pci_sbdf_t sbdf,              \
+                              unsigned int reg, type val)   \
+{                                                           \
+    pci_config_write(sbdf, reg, size / 8, val);             \
+}
+
+#define PCI_OP_READ(size, type)                             \
+    type pci_conf_read##size(pci_sbdf_t sbdf,               \
+                              unsigned int reg)             \
+{                                                           \
+    return pci_config_read(sbdf, reg, size / 8);            \
+}
+
+PCI_OP_READ(8, uint8_t)
+PCI_OP_READ(16, uint16_t)
+PCI_OP_READ(32, uint32_t)
+PCI_OP_WRITE(8, uint8_t)
+PCI_OP_WRITE(16, uint16_t)
+PCI_OP_WRITE(32, uint32_t)
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index a08e06cea1..c5941b10e9 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -236,6 +236,25 @@ err_exit:
     return err;
 }
 
+/*
+ * This function will lookup an hostbridge based on the segment and bus
+ * number.
+ */
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
+{
+    struct pci_host_bridge *bridge;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        if ( bridge->segment != segment )
+            continue;
+        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_end) )
+            continue;
+        return bridge;
+    }
+
+    return NULL;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index bb7eda6705..49c9622902 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -81,6 +81,7 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
                              uint32_t reg, uint32_t len, uint32_t value);
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where);
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 
 static always_inline bool is_pci_passthrough_enabled(void)
 {
-- 
2.25.1


