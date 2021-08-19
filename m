Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68583F18C4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168650.307919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgpU-0006wm-Ea; Thu, 19 Aug 2021 12:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168650.307919; Thu, 19 Aug 2021 12:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgpU-0006ua-B8; Thu, 19 Aug 2021 12:07:28 +0000
Received: by outflank-mailman (input) for mailman id 168650;
 Thu, 19 Aug 2021 12:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgpS-0006rb-Vn
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:07:27 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 630f03c5-527c-4461-8eff-72b6b89ecffd;
 Thu, 19 Aug 2021 12:07:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9548B31B;
 Thu, 19 Aug 2021 05:07:25 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF093F70D;
 Thu, 19 Aug 2021 05:07:24 -0700 (PDT)
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
X-Inumbo-ID: 630f03c5-527c-4461-8eff-72b6b89ecffd
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 08/14] xen:arm: Implement pci access functions
Date: Thu, 19 Aug 2021 13:02:48 +0100
Message-Id: <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

Implement generic pci access functions to read/write the configuration
space.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/pci/pci-access.c      | 31 +++++++++++++++++++++++++++++-
 xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++++++++++
 xen/include/asm-arm/pci.h          |  2 ++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index f39f6a3a38..b94de3c3ac 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -72,12 +72,41 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
 static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
                                 unsigned int len)
 {
-    return ~0U;
+    uint32_t val = GENMASK(0, len * 8);
+
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+    {
+        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
+                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
+        return val;
+    }
+
+    if ( unlikely(!bridge->ops->read) )
+        return val;
+
+    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
+
+    return val;
 }
 
 static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
                              unsigned int len, uint32_t val)
 {
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+    {
+        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
+                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
+        return;
+    }
+
+    if ( unlikely(!bridge->ops->write) )
+        return;
+
+    bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);
 }
 
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index c582527e92..62715b4676 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -261,6 +261,25 @@ err_exit:
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
+        if ( (bus < bridge->bus_start) || (bus > bridge->bus_end) )
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
index 22866244d2..756f8637ab 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -20,6 +20,7 @@
 #ifdef CONFIG_HAS_PCI
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
+#define PRI_pci "%04x:%02x:%02x.%u"
 
 /* Arch pci dev struct */
 struct arch_pci_dev {
@@ -86,6 +87,7 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                uint32_t sbdf, uint32_t where);
 
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.17.1


