Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E945B613
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230148.397919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC6-00076k-C5; Wed, 24 Nov 2021 07:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230148.397919; Wed, 24 Nov 2021 07:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC6-000715-07; Wed, 24 Nov 2021 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 230148;
 Wed, 24 Nov 2021 07:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnC4-000641-CN
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:52 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 805dce8a-4cfc-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:59:51 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id t26so4895732lfk.9
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:51 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:50 -0800 (PST)
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
X-Inumbo-ID: 805dce8a-4cfc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UTFAcfDVj5boS18sBATp/O7+L/F9qrCvn3jbQ1Onsrg=;
        b=hbTmKJcmSNf2UsvgYlzNV1mjKdhPBVzXW1CrogUsjsWBMICC7Fi/4mQYdZOS3JTPG/
         XE4TRnyWh4FSvLxJfVXVsWPdP96vCCnUfKrAVq09yr0hj2vZmw5nifMTUZkyoqcBly66
         qurp2dcHVvM90bDKkC3498zBqG52cmJyzZ0rOBZTkcg9znwq4zfETr1gw/aaeb0KdCHw
         0tMJKd64qPIqD0vLizHamJ937jMh3ISQdN1AJsk+KaERJsJyZ0BOceSl6gPO0d1KQJ/F
         zUSWVmdZB8o393VlXOw/DsWxr9zirsLuMSPkUEj5woVW+ymGBC7Pxpg1OErytHTIaD06
         tQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UTFAcfDVj5boS18sBATp/O7+L/F9qrCvn3jbQ1Onsrg=;
        b=IO9So4/WXDiXT/e56lSwgrU2m96IZ+tWtv4ph50nkXpCVGCNSZv9kSKP5Sli5cy2g+
         YtHNhydxwJDsJHo3ks/aEgCXqz9LPKnXQW8rZa4LzYESBHSRkog/NOHWDIRB5RDwaYZY
         sn8V1xNXwzNBavMuitAoqEQeXDCmzU5HyPk8BGM6IQ+SwbFDfJp2vB4y1oTTzEEyb1n3
         ptY3afqsVv6+Yi0JUiBkY9nz6Rm1NtLCMAJLcFzE/Aj5tbZoMmpRm0A9Gcmh/wqCBkIp
         KfQY33iJsGVE1SBpl5mfYGJqZ2y79Z0s+Euejw/hgyHdeSHplJYIDw1Blu+j53bLeMCH
         fGzg==
X-Gm-Message-State: AOAM5325iUJFTk8SV2UTHkrwt304krYV3uoojymy1GrMOFnWDRNjksEy
	DhnUZFifjHKhMlpymuyR3evesnO9ZpLgeQ==
X-Google-Smtp-Source: ABdhPJzeqEo/7ODLalZpn/uWhQuf+BtXcg5hOYe6wx3UTVLwqgqziXEf+6k13p0TWzdhk0aoZkvNeg==
X-Received: by 2002:a05:6512:2101:: with SMTP id q1mr12118307lfr.663.1637740790512;
        Tue, 23 Nov 2021 23:59:50 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v7 5/7] xen/arm: do not map PCI ECAM and MMIO space to Domain-0's p2m
Date: Wed, 24 Nov 2021 09:59:40 +0200
Message-Id: <20211124075942.2645445-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

PCI host bridges are special devices in terms of implementing PCI
passthrough. According to [1] the current implementation depends on
Domain-0 to perform the initialization of the relevant PCI host
bridge hardware and perform PCI device enumeration. In order to
achieve that one of the required changes is to not map all the memory
ranges in map_range_to_domain as we traverse the device tree on startup
and perform some additional checks if the range needs to be mapped to
Domain-0.

The generic PCI host controller device tree binding says [2]:
- ranges: As described in IEEE Std 1275-1994, but must provide
          at least a definition of non-prefetchable memory. One
          or both of prefetchable Memory and IO Space may also
          be provided.

- reg   : The Configuration Space base address and size, as accessed
          from the parent bus.  The base address corresponds to
          the first bus in the "bus-range" property.  If no
          "bus-range" is specified, this will be bus 0 (the default).

From the above none of the memory ranges from the "ranges" property
needs to be mapped to Domain-0 at startup as MMIO mapping is going to
be handled dynamically by vPCI as we assign PCI devices, e.g. each
device assigned to Domain-0/guest will have its MMIOs mapped/unmapped
as needed by Xen.

The "reg" property covers not only ECAM space, but may also have other
then the configuration memory ranges described, for example [3]:
- reg: Should contain rc_dbi, config registers location and length.
- reg-names: Must include the following entries:
   "rc_dbi": controller configuration registers;
   "config": PCIe configuration space registers.

This patch makes it possible to not map all the ranges from the
"ranges" property and also ECAM from the "reg". All the rest from the
"reg" property still needs to be mapped to Domain-0, so the PCI
host bridge remains functional in Domain-0. This is done by first
skipping the mappings while traversing the device tree as it is done for
usual devices and then by calling a dedicated pci_host_bridge_mappings
function which only maps MMIOs required by the host bridges leaving the
regions, needed for vPCI traps, unmapped.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777.html
[2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.txt
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v7:
- updates in comments and commit message
Since v5:
- remove some need_mapping local variables
- use own_device in handle_device
- add __init for pci_ecam_need_p2m_hwdom_mapping
- make pci_host_bridge_mappings use p2m_mmio_direct_dev directly
Since v4:
- update skip_mapping comment
- add comment why we need to map interrupts to Dom0
Since v3:
 - pass struct map_range_data to map_dt_irq_to_domain
 - remove redundant check from map_range_to_domain
 - fix handle_device's .skip_mapping
Since v2:
 - removed check in map_range_to_domain for PCI_DEV
   and moved it to handle_device, so the code is
   simpler
 - s/map_pci_bridge/skip_mapping
 - extended comment in pci_host_bridge_mappings
 - minor code restructure in construct_dom0
 - s/.need_p2m_mapping/.need_p2m_hwdom_mapping and related
   callbacks
 - unsigned int i; in pci_host_bridge_mappings
Since v1:
 - Added better description of why and what needs to be mapped into
   Domain-0's p2m and what doesn't
 - Do not do any mappings for PCI devices while traversing the DT
 - Walk all the bridges and make required mappings in one go
---
 xen/arch/arm/domain_build.c        | 66 +++++++++++++++++-------------
 xen/arch/arm/pci/ecam.c            | 14 +++++++
 xen/arch/arm/pci/pci-host-common.c | 50 ++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
 xen/include/asm-arm/pci.h          | 10 +++++
 xen/include/asm-arm/setup.h        | 13 ++++++
 6 files changed, 126 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c83c02ab8ac6..47c884cca2c3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -51,12 +51,6 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
-struct map_range_data
-{
-    struct domain *d;
-    p2m_type_t p2mt;
-};
-
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
@@ -1720,10 +1714,10 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
                                        const struct dt_irq *dt_irq,
                                        void *data)
 {
-    struct domain *d = data;
+    struct map_range_data *mr_data = data;
+    struct domain *d = mr_data->d;
     unsigned int irq = dt_irq->irq;
     int res;
-    bool need_mapping = !dt_device_for_passthrough(dev);
 
     if ( irq < NR_LOCAL_IRQS )
     {
@@ -1742,18 +1736,16 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
         return res;
     }
 
-    res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
+    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
 
     return 0;
 }
 
-static int __init map_range_to_domain(const struct dt_device_node *dev,
-                                      u64 addr, u64 len,
-                                      void *data)
+int __init map_range_to_domain(const struct dt_device_node *dev,
+                               u64 addr, u64 len, void *data)
 {
     struct map_range_data *mr_data = data;
     struct domain *d = mr_data->d;
-    bool need_mapping = !dt_device_for_passthrough(dev);
     int res;
 
     res = iomem_permit_access(d, paddr_to_pfn(addr),
@@ -1767,7 +1759,7 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
         return res;
     }
 
-    if ( need_mapping )
+    if ( !mr_data->skip_mapping )
     {
         res = map_regions_p2mt(d,
                                gaddr_to_gfn(addr),
@@ -1796,23 +1788,21 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
  * then we may need to perform additional mappings in order to make
  * the child resources available to domain 0.
  */
-static int __init map_device_children(struct domain *d,
-                                      const struct dt_device_node *dev,
-                                      p2m_type_t p2mt)
+static int __init map_device_children(const struct dt_device_node *dev,
+                                      struct map_range_data *mr_data)
 {
-    struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
-    int ret;
-
     if ( dt_device_type_is_equal(dev, "pci") )
     {
+        int ret;
+
         dt_dprintk("Mapping children of %s to guest\n",
                    dt_node_full_name(dev));
 
-        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, d);
+        ret = dt_for_each_irq_map(dev, &map_dt_irq_to_domain, mr_data);
         if ( ret < 0 )
             return ret;
 
-        ret = dt_for_each_range(dev, &map_range_to_domain, &mr_data);
+        ret = dt_for_each_range(dev, &map_range_to_domain, mr_data);
         if ( ret < 0 )
             return ret;
     }
@@ -1892,14 +1882,28 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int i;
     int res;
     u64 addr, size;
-    bool need_mapping = !dt_device_for_passthrough(dev);
+    bool own_device = !dt_device_for_passthrough(dev);
+    /*
+     * We want to avoid mapping the MMIO in dom0 for the following cases:
+     *   - The device is owned by dom0 (i.e. it has been flagged for
+     *     passthrough).
+     *   - PCI host bridges with driver in Xen. They will later be mapped by
+     *     pci_host_bridge_mappings().
+     */
+    struct map_range_data mr_data = {
+        .d = d,
+        .p2mt = p2mt,
+        .skip_mapping = !own_device ||
+                        (is_pci_passthrough_enabled() &&
+                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
+    };
 
     naddr = dt_number_of_address(dev);
 
     dt_dprintk("%s passthrough = %d naddr = %u\n",
-               dt_node_full_name(dev), need_mapping, naddr);
+               dt_node_full_name(dev), own_device, naddr);
 
-    if ( need_mapping )
+    if ( own_device )
     {
         dt_dprintk("Check if %s is behind the IOMMU and add it\n",
                    dt_node_full_name(dev));
@@ -1925,14 +1929,13 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
         }
     }
 
-    res = handle_device_interrupts(d, dev, need_mapping);
+    res = handle_device_interrupts(d, dev, own_device);
     if ( res < 0 )
         return res;
 
     /* Give permission and map MMIOs */
     for ( i = 0; i < naddr; i++ )
     {
-        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
         res = dt_device_get_address(dev, i, &addr, &size);
         if ( res )
         {
@@ -1946,7 +1949,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
             return res;
     }
 
-    res = map_device_children(d, dev, p2mt);
+    res = map_device_children(dev, &mr_data);
     if ( res )
         return res;
 
@@ -3105,7 +3108,14 @@ static int __init construct_dom0(struct domain *d)
         return rc;
 
     if ( acpi_disabled )
+    {
         rc = prepare_dtb_hwdom(d, &kinfo);
+        if ( rc < 0 )
+            return rc;
+#ifdef CONFIG_HAS_PCI
+        rc = pci_host_bridge_mappings(d);
+#endif
+    }
     else
         rc = prepare_acpi(d, &kinfo);
 
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 602d00799c8d..4f71b11c3057 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -40,6 +40,19 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
     return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
 }
 
+bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
+                                            struct pci_host_bridge *bridge,
+                                            uint64_t addr)
+{
+    struct pci_config_window *cfg = bridge->cfg;
+
+    /*
+     * We do not want ECAM address space to be mapped in Domain-0's p2m,
+     * so we can trap access to it.
+     */
+    return cfg->phys_addr != addr;
+}
+
 /* ECAM ops */
 const struct pci_ecam_ops pci_generic_ecam_ops = {
     .bus_shift  = 20,
@@ -47,6 +60,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
         .map_bus                = pci_ecam_map_bus,
         .read                   = pci_generic_config_read,
         .write                  = pci_generic_config_write,
+        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
     }
 };
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 18b09d5e6f10..1b18480adf02 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -22,6 +22,8 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/setup.h>
+
 /*
  * List for all the pci host bridges.
  */
@@ -313,6 +315,54 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
     return count;
 }
 
+/*
+ * For each PCI host bridge we need to only map those ranges
+ * which are used by Domain-0 to properly initialize the bridge,
+ * e.g. we do not want to map ECAM configuration space which lives in
+ * "reg" device tree property, but we want to map other regions of
+ * the host bridge. The PCI aperture defined by the "ranges" device
+ * tree property should also be skipped.
+ */
+int __init pci_host_bridge_mappings(struct domain *d)
+{
+    struct pci_host_bridge *bridge;
+    struct map_range_data mr_data = {
+        .d = d,
+        .p2mt = p2m_mmio_direct_dev,
+        .skip_mapping = false
+    };
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        const struct dt_device_node *dev = bridge->dt_node;
+        unsigned int i;
+
+        for ( i = 0; i < dt_number_of_address(dev); i++ )
+        {
+            uint64_t addr, size;
+            int err;
+
+            err = dt_device_get_address(dev, i, &addr, &size);
+            if ( err )
+            {
+                printk(XENLOG_ERR
+                       "Unable to retrieve address range index=%u for %s\n",
+                       i, dt_node_full_name(dev));
+                return err;
+            }
+
+            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            {
+                err = map_range_to_domain(dev, addr, size, &mr_data);
+                if ( err )
+                    return err;
+            }
+        }
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
index 516982bca833..101edb8593c1 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -34,6 +34,7 @@ const struct pci_ecam_ops nwl_pcie_ops = {
         .map_bus                = pci_ecam_map_bus,
         .read                   = pci_generic_config_read,
         .write                  = pci_generic_config_write,
+        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
     }
 };
 
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 4278d66e5eb9..679fc83f713b 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -17,6 +17,8 @@
 
 #ifdef CONFIG_HAS_PCI
 
+#include <asm/p2m.h>
+
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
 
 extern bool pci_passthrough_enabled;
@@ -73,6 +75,9 @@ struct pci_ops {
                 uint32_t reg, uint32_t len, uint32_t *value);
     int (*write)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
                  uint32_t reg, uint32_t len, uint32_t value);
+    bool (*need_p2m_hwdom_mapping)(struct domain *d,
+                                   struct pci_host_bridge *bridge,
+                                   uint64_t addr);
 };
 
 /*
@@ -96,6 +101,9 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
                              uint32_t reg, uint32_t len, uint32_t value);
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where);
+bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
+                                     struct pci_host_bridge *bridge,
+                                     uint64_t addr);
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
@@ -114,6 +122,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
                                        int (*cb)(struct domain *d,
                                                  struct pci_host_bridge *bridge));
 
+int pci_host_bridge_mappings(struct domain *d);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 95da0b7ab9cd..88d9673db817 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -2,6 +2,8 @@
 #define __ARM_SETUP_H_
 
 #include <public/version.h>
+#include <asm/p2m.h>
+#include <xen/device_tree.h>
 
 #define MIN_FDT_ALIGN 8
 #define MAX_FDT_SIZE SZ_2M
@@ -77,6 +79,14 @@ struct bootinfo {
 #endif
 };
 
+struct map_range_data
+{
+    struct domain *d;
+    p2m_type_t p2mt;
+    /* Set if mapping of the memory ranges must be skipped. */
+    bool skip_mapping;
+};
+
 extern struct bootinfo bootinfo;
 
 extern domid_t max_init_domid;
@@ -124,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
+int map_range_to_domain(const struct dt_device_node *dev,
+                        u64 addr, u64 len, void *data);
+
 #endif
 /*
  * Local variables:
-- 
2.25.1


