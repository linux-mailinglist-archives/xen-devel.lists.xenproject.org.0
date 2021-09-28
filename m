Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D936D41B5F0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198272.351677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHkT-0004Dq-Lo; Tue, 28 Sep 2021 18:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198272.351677; Tue, 28 Sep 2021 18:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHkT-0004B7-Gk; Tue, 28 Sep 2021 18:22:37 +0000
Received: by outflank-mailman (input) for mailman id 198272;
 Tue, 28 Sep 2021 18:22:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHkR-00049L-Gr
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:22:35 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0c953712-2089-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:22:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9946D;
 Tue, 28 Sep 2021 11:22:33 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDD7C3F793;
 Tue, 28 Sep 2021 11:22:31 -0700 (PDT)
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
X-Inumbo-ID: 0c953712-2089-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 11/17] xen/arm: PCI host bridge discovery within XEN on ARM
Date: Tue, 28 Sep 2021 19:18:20 +0100
Message-Id: <a16e90a04ecb722e0f6c5fb8f9a9b0129b4fe96c.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XEN during boot will read the PCI device tree node “reg” property
and will map the PCI config space to the XEN memory.

As of now only "pci-host-ecam-generic" compatible board is supported.

"linux,pci-domain" device tree property assigns a fixed PCI domain
number to a host bridge, otherwise an unstable (across boots) unique
number will be assigned by Linux. XEN access the PCI devices based on
Segment:Bus:Device:Function. A Segment number in the XEN is same as a
domain number in Linux. Segment number and domain number has to be in
sync to access the correct PCI devices.

XEN will read the “linux,pci-domain” property from the device tree node
and configure the host bridge segment number accordingly. If this
property is not available XEN will allocate the unique segment number
to the host bridge.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3:
- Modify commit msg based on received comments.
- Remove added struct match_table{} struct in struct device{}
- Replace uint32_t sbdf to pci_sbdf_t sbdf to avoid typecast
- Remove bus_start,bus_end and void *sysdata from struct pci_host_bridge{}
- Move "#include <asm/pci.h>" in "xen/pci.h" after pci_sbdf_t sbdf declaration
- Add pci_host_generic_probe() function 
Change in v2:
- Add more info in commit msg
- Add callback to parse register index.
- Merge patch pci_ecam_operation into this patch to avoid confusion
- Add new struct in struct device for match table
---
 xen/arch/arm/pci/Makefile           |   4 +
 xen/arch/arm/pci/ecam.c             |  61 +++++++
 xen/arch/arm/pci/pci-access.c       |  83 ++++++++++
 xen/arch/arm/pci/pci-host-common.c  | 247 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-generic.c |  46 ++++++
 xen/include/asm-arm/pci.h           |  56 +++++++
 xen/include/xen/pci.h               |   3 +-
 7 files changed, 499 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/pci/ecam.c
 create mode 100644 xen/arch/arm/pci/pci-access.c
 create mode 100644 xen/arch/arm/pci/pci-host-common.c
 create mode 100644 xen/arch/arm/pci/pci-host-generic.c

diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index a98035df4c..6f32fbbe67 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -1 +1,5 @@
 obj-y += pci.o
+obj-y += pci-access.o
+obj-y += pci-host-generic.o
+obj-y += pci-host-common.o
+obj-y += ecam.o
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
new file mode 100644
index 0000000000..602d00799c
--- /dev/null
+++ b/xen/arch/arm/pci/ecam.c
@@ -0,0 +1,61 @@
+/*
+ * Based on Linux drivers/pci/ecam.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/pci.h>
+#include <xen/sched.h>
+
+/*
+ * Function to implement the pci_ops->map_bus method.
+ */
+void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
+                               pci_sbdf_t sbdf, uint32_t where)
+{
+    const struct pci_config_window *cfg = bridge->cfg;
+    struct pci_ecam_ops *ops =
+        container_of(bridge->ops, struct pci_ecam_ops, pci_ops);
+    unsigned int devfn_shift = ops->bus_shift - 8;
+    void __iomem *base;
+
+    unsigned int busn = PCI_BUS(sbdf.bdf);
+
+    if ( busn < cfg->busn_start || busn > cfg->busn_end )
+        return NULL;
+
+    busn -= cfg->busn_start;
+    base = cfg->win + (busn << ops->bus_shift);
+
+    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
+}
+
+/* ECAM ops */
+const struct pci_ecam_ops pci_generic_ecam_ops = {
+    .bus_shift  = 20,
+    .pci_ops    = {
+        .map_bus                = pci_ecam_map_bus,
+        .read                   = pci_generic_config_read,
+        .write                  = pci_generic_config_write,
+    }
+};
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
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
new file mode 100644
index 0000000000..3cd14a4b87
--- /dev/null
+++ b/xen/arch/arm/pci/pci-access.c
@@ -0,0 +1,83 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/pci.h>
+#include <asm/io.h>
+
+#define INVALID_VALUE (~0U)
+
+int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                            uint32_t reg, uint32_t len, uint32_t *value)
+{
+    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
+
+    if ( !addr )
+    {
+        *value = INVALID_VALUE;
+        return -ENODEV;
+    }
+
+    switch ( len )
+    {
+    case 1:
+        *value = readb(addr);
+        break;
+    case 2:
+        *value = readw(addr);
+        break;
+    case 4:
+        *value = readl(addr);
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
+
+int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                             uint32_t reg, uint32_t len, uint32_t value)
+{
+    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
+
+    if ( !addr )
+        return -ENODEV;
+
+    switch ( len )
+    {
+    case 1:
+        writeb(value, addr);
+        break;
+    case 2:
+        writew(value, addr);
+        break;
+    case 4:
+        writel(value, addr);
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
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
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
new file mode 100644
index 0000000000..a08e06cea1
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -0,0 +1,247 @@
+/*
+ * Based on Linux drivers/pci/ecam.c
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+/*
+ * List for all the pci host bridges.
+ */
+
+static LIST_HEAD(pci_host_bridges);
+
+static atomic_t domain_nr = ATOMIC_INIT(-1);
+
+static inline void __iomem *pci_remap_cfgspace(paddr_t start, size_t len)
+{
+    return ioremap_nocache(start, len);
+}
+
+static void pci_ecam_free(struct pci_config_window *cfg)
+{
+    if ( cfg->win )
+        iounmap(cfg->win);
+
+    xfree(cfg);
+}
+
+static struct pci_config_window * __init
+gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+{
+    int err, cfg_reg_idx;
+    u32 bus_range[2];
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg = xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+
+    err = dt_property_read_u32_array(dev, "bus-range", bus_range,
+                                     ARRAY_SIZE(bus_range));
+    if ( err ) {
+        cfg->busn_start = 0;
+        cfg->busn_end = 0xff;
+        printk(XENLOG_INFO "%s: No bus range found for pci controller\n",
+               dt_node_full_name(dev));
+    } else {
+        cfg->busn_start = bus_range[0];
+        cfg->busn_end = bus_range[1];
+        if ( cfg->busn_end > cfg->busn_start + 0xff )
+            cfg->busn_end = cfg->busn_start + 0xff;
+    }
+
+    if ( ops->cfg_reg_index )
+    {
+        cfg_reg_idx = ops->cfg_reg_index(dev);
+        if ( cfg_reg_idx < 0 )
+            goto err_exit;
+    }
+    else
+        cfg_reg_idx = 0;
+
+    /* Parse our PCI ecam register address */
+    err = dt_device_get_address(dev, cfg_reg_idx, &addr, &size);
+    if ( err )
+        goto err_exit;
+
+    cfg->phys_addr = addr;
+    cfg->size = size;
+
+    /*
+     * On 64-bit systems, we do a single ioremap for the whole config space
+     * since we have enough virtual address range available.  On 32-bit, we
+     * ioremap the config space for each bus individually.
+     * As of now only 64-bit is supported 32-bit is not supported.
+     *
+     * TODO: For 32-bit implement the ioremap/iounmap of config space
+     * dynamically for each read/write call.
+     */
+    cfg->win = pci_remap_cfgspace(cfg->phys_addr, cfg->size);
+    if ( !cfg->win )
+    {
+        printk(XENLOG_ERR "ECAM ioremap failed\n");
+        goto err_exit;
+    }
+    printk("ECAM at [mem 0x%"PRIpaddr"-0x%"PRIpaddr"] for [bus %x-%x] \n",
+            cfg->phys_addr, cfg->phys_addr + cfg->size - 1,
+            cfg->busn_start, cfg->busn_end);
+
+    if ( ops->init )
+    {
+        err = ops->init(cfg);
+        if ( err )
+            goto err_exit;
+    }
+
+    return cfg;
+
+err_exit:
+    pci_ecam_free(cfg);
+
+    return NULL;
+}
+
+struct pci_host_bridge *pci_alloc_host_bridge(void)
+{
+    struct pci_host_bridge *bridge = xzalloc(struct pci_host_bridge);
+
+    if ( !bridge )
+        return NULL;
+
+    INIT_LIST_HEAD(&bridge->node);
+
+    return bridge;
+}
+
+void pci_add_host_bridge(struct pci_host_bridge *bridge)
+{
+    list_add_tail(&bridge->node, &pci_host_bridges);
+}
+
+static int pci_get_new_domain_nr(void)
+{
+    return atomic_inc_return(&domain_nr);
+}
+
+static int pci_bus_find_domain_nr(struct dt_device_node *dev)
+{
+    static int use_dt_domains = -1;
+    int domain;
+
+    domain = dt_get_pci_domain_nr(dev);
+
+    /*
+     * Check DT domain and use_dt_domains values.
+     *
+     * If DT domain property is valid (domain >= 0) and
+     * use_dt_domains != 0, the DT assignment is valid since this means
+     * we have not previously allocated a domain number by using
+     * pci_get_new_domain_nr(); we should also update use_dt_domains to
+     * 1, to indicate that we have just assigned a domain number from
+     * DT.
+     *
+     * If DT domain property value is not valid (ie domain < 0), and we
+     * have not previously assigned a domain number from DT
+     * (use_dt_domains != 1) we should assign a domain number by
+     * using the:
+     *
+     * pci_get_new_domain_nr()
+     *
+     * API and update the use_dt_domains value to keep track of method we
+     * are using to assign domain numbers (use_dt_domains = 0).
+     *
+     * All other combinations imply we have a platform that is trying
+     * to mix domain numbers obtained from DT and pci_get_new_domain_nr(),
+     * which is a recipe for domain mishandling and it is prevented by
+     * invalidating the domain value (domain = -1) and printing a
+     * corresponding error.
+     */
+    if ( domain >= 0 && use_dt_domains )
+    {
+        use_dt_domains = 1;
+    }
+    else if ( domain < 0 && use_dt_domains != 1 )
+    {
+        use_dt_domains = 0;
+        domain = pci_get_new_domain_nr();
+    }
+    else
+    {
+        domain = -1;
+    }
+
+    return domain;
+}
+
+int pci_host_common_probe(struct dt_device_node *dev, const void *data)
+{
+    struct pci_host_bridge *bridge;
+    struct pci_config_window *cfg;
+    struct pci_ecam_ops *ops;
+    int err;
+
+    if ( dt_device_for_passthrough(dev) )
+        return 0;
+
+    ops = (struct pci_ecam_ops *) data;
+
+    bridge = pci_alloc_host_bridge();
+    if ( !bridge )
+        return -ENOMEM;
+
+    /* Parse and map our Configuration Space windows */
+    cfg = gen_pci_init(dev, ops);
+    if ( !cfg )
+    {
+        err = -ENOMEM;
+        goto err_exit;
+    }
+
+    bridge->dt_node = dev;
+    bridge->cfg = cfg;
+    bridge->ops = &ops->pci_ops;
+
+    bridge->segment = pci_bus_find_domain_nr(dev);
+    if ( bridge->segment < 0 )
+    {
+        printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" property in DT\n");
+        BUG();
+    }
+    pci_add_host_bridge(bridge);
+
+    return 0;
+
+err_exit:
+    xfree(bridge);
+
+    return err;
+}
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
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
new file mode 100644
index 0000000000..5e4f8f28a0
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -0,0 +1,46 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/device.h>
+#include <xen/pci.h>
+#include <asm/pci.h>
+
+static const struct dt_device_match gen_pci_dt_match[] = {
+    { .compatible = "pci-host-ecam-generic" },
+    { },
+};
+
+static int pci_host_generic_probe(struct dt_device_node *dev,
+                                  const void *data)
+{
+    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
+.dt_match = gen_pci_dt_match,
+.init = pci_host_generic_probe,
+DT_DEVICE_END
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
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 0cf849e26f..bb7eda6705 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -26,6 +26,62 @@ struct arch_pci_dev {
     struct device dev;
 };
 
+/*
+ * struct to hold the mappings of a config space window. This
+ * is expected to be used as sysdata for PCI controllers that
+ * use ECAM.
+ */
+struct pci_config_window {
+    paddr_t         phys_addr;
+    paddr_t         size;
+    uint8_t         busn_start;
+    uint8_t         busn_end;
+    void __iomem    *win;
+};
+
+/*
+ * struct to hold pci host bridge information
+ * for a PCI controller.
+ */
+struct pci_host_bridge {
+    struct dt_device_node *dt_node;  /* Pointer to the associated DT node */
+    struct list_head node;           /* Node in list of host bridges */
+    uint16_t segment;                /* Segment number */
+    struct pci_config_window* cfg;   /* Pointer to the bridge config window */
+    struct pci_ops *ops;
+};
+
+struct pci_ops {
+    void __iomem *(*map_bus)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                             uint32_t offset);
+    int (*read)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                uint32_t reg, uint32_t len, uint32_t *value);
+    int (*write)(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                 uint32_t reg, uint32_t len, uint32_t value);
+};
+
+/*
+ * struct to hold pci ops and bus shift of the config window
+ * for a PCI controller.
+ */
+struct pci_ecam_ops {
+    unsigned int            bus_shift;
+    struct pci_ops          pci_ops;
+    int (*cfg_reg_index)(struct dt_device_node *dev);
+    int (*init)(struct pci_config_window *);
+};
+
+/* Default ECAM ops */
+extern const struct pci_ecam_ops pci_generic_ecam_ops;
+
+int pci_host_common_probe(struct dt_device_node *dev, const void *data);
+int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                            uint32_t reg, uint32_t len, uint32_t *value);
+int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
+                             uint32_t reg, uint32_t len, uint32_t value);
+void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
+                               pci_sbdf_t sbdf, uint32_t where);
+
 static always_inline bool is_pci_passthrough_enabled(void)
 {
     return pci_passthrough_enabled;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 8e3d4d9454..70ac25345c 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -15,7 +15,6 @@
 #include <xen/pfn.h>
 #include <asm/device.h>
 #include <asm/numa.h>
-#include <asm/pci.h>
 
 /*
  * The PCI interface treats multi-function devices as independent
@@ -62,6 +61,8 @@ typedef union {
     };
 } pci_sbdf_t;
 
+#include <asm/pci.h>
+
 struct pci_dev_info {
     /*
      * VF's 'is_extfn' field is used to indicate whether its PF is an extended
-- 
2.17.1


