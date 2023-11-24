Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDD77F7062
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 10:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640333.998357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sny-0000N5-Bd; Fri, 24 Nov 2023 09:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640333.998357; Fri, 24 Nov 2023 09:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sny-0000JT-6P; Fri, 24 Nov 2023 09:48:58 +0000
Received: by outflank-mailman (input) for mailman id 640333;
 Fri, 24 Nov 2023 09:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r6Snv-0007zs-Uz
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 09:48:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ad31199b-8aae-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 10:48:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1111F143D;
 Fri, 24 Nov 2023 01:49:39 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD0A83F7A6;
 Fri, 24 Nov 2023 01:48:51 -0800 (PST)
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
X-Inumbo-ID: ad31199b-8aae-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v6 3/5] arm/dom0less: put dom0less feature code in a separate module
Date: Fri, 24 Nov 2023 09:48:39 +0000
Message-Id: <20231124094841.1475381-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124094841.1475381-1-luca.fancellu@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the dom0less feature code is mostly inside domain_build.c
and setup.c, it is a feature that may not be useful to everyone so
put the code in a different compilation module in order to make it
easier to disable the feature in the future.

Move gic_interrupt_t in domain_build.h to use it with the function
declaration, move its comment above the declaration.

The following functions are now visible externally from domain_build
because they are used also from the dom0less-build module:
 - get_allocation_size
 - set_interrupt
 - domain_fdt_begin_node
 - make_memory_node
 - make_resv_memory_node
 - make_hypervisor_node
 - make_psci_node
 - make_cpus_node
 - make_timer_node
 - handle_device_interrupts
 - construct_domain
 - process_shm
 - allocate_bank_memory

The functions allocate_static_memory and assign_static_memory_11
are now externally visible, so put their declarations into
domain_build.h and move the #else and stub definition in the header
as well.

Move is_dom0less_mode from setup.c to dom0less-build.c and make it
externally visible.

The function allocate_bank_memory is used only by dom0less code
at the moment, but it's been decided to leave it in domain_build.c
in case that in the future the dom0 code can use it.

Where spotted, fix code style issues.

No functional change is intended.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v5:
 - remove unneeded include (Michal)
 - rebase on staging
Changes from v4:
 - fixed name in inclusion macro __ASM_* instead of __ARM_*, fixed
   emacs local variable 'end:', style fix (Michal)
Changes from v3:
 - remove header in dom0less-build.c (Michal)
Changes from v2:
 - move allocate_bank_memory back in domain_build.c, remove header
   from dom0less-build.c.
---
 xen/arch/arm/Makefile                     |    1 +
 xen/arch/arm/dom0less-build.c             | 1018 +++++++++++++++++
 xen/arch/arm/domain_build.c               | 1265 +++------------------
 xen/arch/arm/include/asm/dom0less-build.h |   18 +
 xen/arch/arm/include/asm/domain_build.h   |   60 +
 xen/arch/arm/include/asm/setup.h          |    1 -
 xen/arch/arm/setup.c                      |   33 +-
 7 files changed, 1238 insertions(+), 1158 deletions(-)
 create mode 100644 xen/arch/arm/dom0less-build.c
 create mode 100644 xen/arch/arm/include/asm/dom0less-build.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index d83dc25c0d8a..d65920b0a8cf 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -16,6 +16,7 @@ obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
+obj-y += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
new file mode 100644
index 000000000000..1ca9d39043d6
--- /dev/null
+++ b/xen/arch/arm/dom0less-build.c
@@ -0,0 +1,1018 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/device_tree.h>
+#include <xen/err.h>
+#include <xen/event.h>
+#include <xen/grant_table.h>
+#include <xen/iocap.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/sched.h>
+#include <xen/serial.h>
+#include <xen/sizes.h>
+#include <xen/vmap.h>
+
+#include <asm/arm64/sve.h>
+#include <asm/dom0less-build.h>
+#include <asm/domain_build.h>
+
+bool __init is_dom0less_mode(void)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+    bool dom0found = false;
+    bool domUfound = false;
+
+    /* Look into the bootmodules */
+    for ( i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        /* Find if dom0 and domU kernels are present */
+        if ( mod->kind == BOOTMOD_KERNEL )
+        {
+            if ( mod->domU == false )
+            {
+                dom0found = true;
+                break;
+            }
+            else
+                domUfound = true;
+        }
+    }
+
+    /*
+     * If there is no dom0 kernel but at least one domU, then we are in
+     * dom0less mode
+     */
+    return ( !dom0found && domUfound );
+}
+
+static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    unsigned int i;
+    paddr_t bank_size;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    kinfo->mem.nr_banks = 0;
+    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
+    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
+                               bank_size) )
+        goto fail;
+
+    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
+    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
+                               bank_size) )
+        goto fail;
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               kinfo->mem.bank[i].start,
+               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(kinfo->mem.bank[i].size >> 20));
+    }
+
+    return;
+
+fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
+
+#ifdef CONFIG_VGICV2
+static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
+{
+    void *fdt = kinfo->fdt;
+    int res = 0;
+    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
+    __be32 *cells;
+    const struct domain *d = kinfo->d;
+
+    res = domain_fdt_begin_node(fdt, "interrupt-controller",
+                                vgic_dist_base(&d->arch.vgic));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", 3);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "arm,gic-400");
+    if ( res )
+        return res;
+
+    cells = &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
+
+    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    if (res)
+        return res;
+
+    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
+    if (res)
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
+    if (res)
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
+#ifdef CONFIG_GICV3
+static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
+{
+    void *fdt = kinfo->fdt;
+    int res = 0;
+    __be32 *reg, *cells;
+    const struct domain *d = kinfo->d;
+    unsigned int i, len = 0;
+
+    res = domain_fdt_begin_node(fdt, "interrupt-controller",
+                                vgic_dist_base(&d->arch.vgic));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", 3);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "arm,gic-v3");
+    if ( res )
+        return res;
+
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
+    cells = reg;
+
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
+
+    for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
+        dt_child_set_range(&cells,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           d->arch.vgic.rdist_regions[i].base,
+                           d->arch.vgic.rdist_regions[i].size);
+
+    res = fdt_property(fdt, "reg", reg, len);
+    xfree(reg);
+    if (res)
+        return res;
+
+    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
+    if (res)
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
+    if (res)
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
+static int __init make_gic_domU_node(struct kernel_info *kinfo)
+{
+    switch ( kinfo->d->arch.vgic.version )
+    {
+#ifdef CONFIG_GICV3
+    case GIC_V3:
+        return make_gicv3_domU_node(kinfo);
+#endif
+#ifdef CONFIG_VGICV2
+    case GIC_V2:
+        return make_gicv2_domU_node(kinfo);
+#endif
+    default:
+        panic("Unsupported GIC version\n");
+    }
+}
+
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
+{
+    void *fdt = kinfo->fdt;
+    int res;
+    gic_interrupt_t intr;
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+    struct domain *d = kinfo->d;
+
+    res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "arm,sbsa-uart");
+    if ( res )
+        return res;
+
+    cells = &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
+                       GUEST_PL011_SIZE);
+
+    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "interrupt-parent",
+                            kinfo->phandle_gic);
+    if ( res )
+        return res;
+
+    /* Use a default baud rate of 115200. */
+    fdt_property_u32(fdt, "current-speed", 115200);
+
+    res = fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    return 0;
+}
+#endif
+
+/*
+ * Scan device tree properties for passthrough specific information.
+ * Returns < 0 on error
+ *         0 on success
+ */
+static int __init handle_passthrough_prop(struct kernel_info *kinfo,
+                                          const struct fdt_property *xen_reg,
+                                          const struct fdt_property *xen_path,
+                                          bool xen_force,
+                                          uint32_t address_cells,
+                                          uint32_t size_cells)
+{
+    const __be32 *cell;
+    unsigned int i, len;
+    struct dt_device_node *node;
+    int res;
+    paddr_t mstart, size, gstart;
+
+    /* xen,reg specifies where to map the MMIO region */
+    cell = (const __be32 *)xen_reg->data;
+    len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
+                                        sizeof(uint32_t));
+
+    for ( i = 0; i < len; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells,
+                            &mstart, &size);
+        gstart = dt_next_cell(address_cells, &cell);
+
+        if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size & ~PAGE_MASK )
+        {
+            printk(XENLOG_ERR
+                   "DomU passthrough config has not page aligned addresses/sizes\n");
+            return -EINVAL;
+        }
+
+        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
+                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
+                   kinfo->d->domain_id,
+                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
+            return res;
+        }
+
+        res = map_regions_p2mt(kinfo->d,
+                               gaddr_to_gfn(gstart),
+                               PFN_DOWN(size),
+                               maddr_to_mfn(mstart),
+                               p2m_mmio_direct_dev);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR
+                   "Failed to map %"PRIpaddr" to the guest at%"PRIpaddr"\n",
+                   mstart, gstart);
+            return -EFAULT;
+        }
+    }
+
+    /*
+     * If xen_force, we let the user assign a MMIO region with no
+     * associated path.
+     */
+    if ( xen_path == NULL )
+        return xen_force ? 0 : -EINVAL;
+
+    /*
+     * xen,path specifies the corresponding node in the host DT.
+     * Both interrupt mappings and IOMMU settings are based on it,
+     * as they are done based on the corresponding host DT node.
+     */
+    node = dt_find_node_by_path(xen_path->data);
+    if ( node == NULL )
+    {
+        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
+               (char *)xen_path->data);
+        return -EINVAL;
+    }
+
+    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
+    if ( res < 0 )
+        return res;
+
+    res = iommu_add_dt_device(node);
+    if ( res < 0 )
+        return res;
+
+    /* If xen_force, we allow assignment of devices without IOMMU protection. */
+    if ( xen_force && !dt_device_is_protected(node) )
+        return 0;
+
+    return iommu_assign_dt_device(kinfo->d, node);
+}
+
+static int __init handle_prop_pfdt(struct kernel_info *kinfo,
+                                   const void *pfdt, int nodeoff,
+                                   uint32_t address_cells, uint32_t size_cells,
+                                   bool scan_passthrough_prop)
+{
+    void *fdt = kinfo->fdt;
+    int propoff, nameoff, res;
+    const struct fdt_property *prop, *xen_reg = NULL, *xen_path = NULL;
+    const char *name;
+    bool found, xen_force = false;
+
+    for ( propoff = fdt_first_property_offset(pfdt, nodeoff);
+          propoff >= 0;
+          propoff = fdt_next_property_offset(pfdt, propoff) )
+    {
+        if ( !(prop = fdt_get_property_by_offset(pfdt, propoff, NULL)) )
+            return -FDT_ERR_INTERNAL;
+
+        found = false;
+        nameoff = fdt32_to_cpu(prop->nameoff);
+        name = fdt_string(pfdt, nameoff);
+
+        if ( scan_passthrough_prop )
+        {
+            if ( dt_prop_cmp("xen,reg", name) == 0 )
+            {
+                xen_reg = prop;
+                found = true;
+            }
+            else if ( dt_prop_cmp("xen,path", name) == 0 )
+            {
+                xen_path = prop;
+                found = true;
+            }
+            else if ( dt_prop_cmp("xen,force-assign-without-iommu",
+                                  name) == 0 )
+            {
+                xen_force = true;
+                found = true;
+            }
+        }
+
+        /*
+         * Copy properties other than the ones above: xen,reg, xen,path,
+         * and xen,force-assign-without-iommu.
+         */
+        if ( !found )
+        {
+            res = fdt_property(fdt, name, prop->data, fdt32_to_cpu(prop->len));
+            if ( res )
+                return res;
+        }
+    }
+
+    /*
+     * Only handle passthrough properties if both xen,reg and xen,path
+     * are present, or if xen,force-assign-without-iommu is specified.
+     */
+    if ( xen_reg != NULL && (xen_path != NULL || xen_force) )
+    {
+        res = handle_passthrough_prop(kinfo, xen_reg, xen_path, xen_force,
+                                      address_cells, size_cells);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->d);
+            return res;
+        }
+    }
+    else if ( (xen_path && !xen_reg) || (xen_reg && !xen_path && !xen_force) )
+    {
+        printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
+               kinfo->d);
+        return -EINVAL;
+    }
+
+    /* FDT_ERR_NOTFOUND => There is no more properties for this node */
+    return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
+}
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
+                                 int nodeoff,
+                                 uint32_t address_cells, uint32_t size_cells,
+                                 bool scan_passthrough_prop)
+{
+    int rc = 0;
+    void *fdt = kinfo->fdt;
+    int node_next;
+
+    rc = fdt_begin_node(fdt, fdt_get_name(pfdt, nodeoff, NULL));
+    if ( rc )
+        return rc;
+
+    rc = handle_prop_pfdt(kinfo, pfdt, nodeoff, address_cells, size_cells,
+                          scan_passthrough_prop);
+    if ( rc )
+        return rc;
+
+    address_cells = device_tree_get_u32(pfdt, nodeoff, "#address-cells",
+                                        DT_ROOT_NODE_ADDR_CELLS_DEFAULT);
+    size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
+                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
+
+    node_next = fdt_first_subnode(pfdt, nodeoff);
+    while ( node_next > 0 )
+    {
+        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
+                            scan_passthrough_prop);
+        if ( rc )
+            return rc;
+
+        node_next = fdt_next_subnode(pfdt, node_next);
+    }
+
+    return fdt_end_node(fdt);
+}
+
+static int __init check_partial_fdt(void *pfdt, size_t size)
+{
+    int res;
+
+    if ( fdt_magic(pfdt) != FDT_MAGIC )
+    {
+        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree");
+        return -EINVAL;
+    }
+
+    res = fdt_check_header(pfdt);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed to check the partial FDT (%d)", res);
+        return -EINVAL;
+    }
+
+    if ( fdt_totalsize(pfdt) > size )
+    {
+        dprintk(XENLOG_ERR, "Partial FDT totalsize is too big");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init domain_handle_dtb_bootmodule(struct domain *d,
+                                               struct kernel_info *kinfo)
+{
+    void *pfdt;
+    int res, node_next;
+
+    pfdt = ioremap_cache(kinfo->dtb_bootmodule->start,
+                         kinfo->dtb_bootmodule->size);
+    if ( pfdt == NULL )
+        return -EFAULT;
+
+    res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
+    if ( res < 0 )
+        goto out;
+
+    for ( node_next = fdt_first_subnode(pfdt, 0);
+          node_next > 0;
+          node_next = fdt_next_subnode(pfdt, node_next) )
+    {
+        const char *name = fdt_get_name(pfdt, node_next, NULL);
+
+        if ( name == NULL )
+            continue;
+
+        /*
+         * Only scan /gic /aliases /passthrough, ignore the rest.
+         * They don't have to be parsed in order.
+         *
+         * Take the GIC phandle value from the special /gic node in the
+         * DTB fragment.
+         */
+        if ( dt_node_cmp(name, "gic") == 0 )
+        {
+            kinfo->phandle_gic = fdt_get_phandle(pfdt, node_next);
+            continue;
+        }
+
+        if ( dt_node_cmp(name, "aliases") == 0 )
+        {
+            res = scan_pfdt_node(kinfo, pfdt, node_next,
+                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
+                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
+                                 false);
+            if ( res )
+                goto out;
+            continue;
+        }
+        if ( dt_node_cmp(name, "passthrough") == 0 )
+        {
+            res = scan_pfdt_node(kinfo, pfdt, node_next,
+                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
+                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
+                                 true);
+            if ( res )
+                goto out;
+            continue;
+        }
+    }
+
+ out:
+    iounmap(pfdt);
+
+    return res;
+}
+
+/*
+ * The max size for DT is 2MB. However, the generated DT is small (not including
+ * domU passthrough DT nodes whose size we account separately), 4KB are enough
+ * for now, but we might have to increase it in the future.
+ */
+#define DOMU_DTB_SIZE 4096
+static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
+{
+    int addrcells, sizecells;
+    int ret, fdt_size = DOMU_DTB_SIZE;
+
+    kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
+
+    addrcells = GUEST_ROOT_ADDRESS_CELLS;
+    sizecells = GUEST_ROOT_SIZE_CELLS;
+
+    /* Account for domU passthrough DT size */
+    if ( kinfo->dtb_bootmodule )
+        fdt_size += kinfo->dtb_bootmodule->size;
+
+    /* Cap to max DT size if needed */
+    fdt_size = min(fdt_size, SZ_2M);
+
+    kinfo->fdt = xmalloc_bytes(fdt_size);
+    if ( kinfo->fdt == NULL )
+        return -ENOMEM;
+
+    ret = fdt_create(kinfo->fdt, fdt_size);
+    if ( ret < 0 )
+        goto err;
+
+    ret = fdt_finish_reservemap(kinfo->fdt);
+    if ( ret < 0 )
+        goto err;
+
+    ret = fdt_begin_node(kinfo->fdt, "");
+    if ( ret < 0 )
+        goto err;
+
+    ret = fdt_property_cell(kinfo->fdt, "#address-cells", addrcells);
+    if ( ret )
+        goto err;
+
+    ret = fdt_property_cell(kinfo->fdt, "#size-cells", sizecells);
+    if ( ret )
+        goto err;
+
+    ret = make_chosen_node(kinfo);
+    if ( ret )
+        goto err;
+
+    ret = make_psci_node(kinfo->fdt);
+    if ( ret )
+        goto err;
+
+    ret = make_cpus_node(d, kinfo->fdt);
+    if ( ret )
+        goto err;
+
+    ret = make_memory_node(d, kinfo->fdt, addrcells, sizecells, &kinfo->mem);
+    if ( ret )
+        goto err;
+
+    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                                &kinfo->shm_mem);
+    if ( ret )
+        goto err;
+
+    /*
+     * domain_handle_dtb_bootmodule has to be called before the rest of
+     * the device tree is generated because it depends on the value of
+     * the field phandle_gic.
+     */
+    if ( kinfo->dtb_bootmodule )
+    {
+        ret = domain_handle_dtb_bootmodule(d, kinfo);
+        if ( ret )
+            goto err;
+    }
+
+    ret = make_gic_domU_node(kinfo);
+    if ( ret )
+        goto err;
+
+    ret = make_timer_node(kinfo);
+    if ( ret )
+        goto err;
+
+    if ( kinfo->vpl011 )
+    {
+        ret = -EINVAL;
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+        ret = make_vpl011_uart_node(kinfo);
+#endif
+        if ( ret )
+            goto err;
+    }
+
+    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
+    {
+        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
+
+    ret = fdt_end_node(kinfo->fdt);
+    if ( ret < 0 )
+        goto err;
+
+    ret = fdt_finish(kinfo->fdt);
+    if ( ret < 0 )
+        goto err;
+
+    return 0;
+
+  err:
+    printk("Device tree generation failed (%d).\n", ret);
+    xfree(kinfo->fdt);
+
+    return -EINVAL;
+}
+
+static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
+                                             unsigned int smp_cpus)
+{
+    /*
+     * Keep in sync with libxl__get_required_paging_memory().
+     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
+     * plus 128 pages to cover extended regions.
+     */
+    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
+
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
+}
+
+static int __init alloc_xenstore_evtchn(struct domain *d)
+{
+    evtchn_alloc_unbound_t alloc;
+    int rc;
+
+    alloc.dom = d->domain_id;
+    alloc.remote_dom = hardware_domain->domain_id;
+    rc = evtchn_alloc_unbound(&alloc, 0);
+    if ( rc )
+    {
+        printk("Failed allocating event channel for domain\n");
+        return rc;
+    }
+
+    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
+
+    return 0;
+}
+
+static int __init construct_domU(struct domain *d,
+                                 const struct dt_device_node *node)
+{
+    struct kernel_info kinfo = {};
+    const char *dom0less_enhanced;
+    int rc;
+    u64 mem;
+    u32 p2m_mem_mb;
+    unsigned long p2m_pages;
+
+    rc = dt_property_read_u64(node, "memory", &mem);
+    if ( !rc )
+    {
+        printk("Error building DomU: cannot read \"memory\" property\n");
+        return -EINVAL;
+    }
+    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
+
+    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
+    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
+    p2m_pages = rc ?
+                p2m_mem_mb << (20 - PAGE_SHIFT) :
+                domain_p2m_pages(mem, d->max_vcpus);
+
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    spin_unlock(&d->arch.paging.lock);
+    if ( rc != 0 )
+        return rc;
+
+    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
+           d->max_vcpus, mem);
+
+    kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
+
+    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
+    if ( rc == -EILSEQ ||
+         rc == -ENODATA ||
+         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
+    {
+        if ( hardware_domain )
+            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
+        else
+            panic("At the moment, Xenstore support requires dom0 to be present\n");
+    }
+    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
+
+    if ( vcpu_create(d, 0) == NULL )
+        return -ENOMEM;
+
+    d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
+
+    kinfo.d = d;
+
+    rc = kernel_probe(&kinfo, node);
+    if ( rc < 0 )
+        return rc;
+
+#ifdef CONFIG_ARM_64
+    /* type must be set before allocate memory */
+    d->arch.type = kinfo.type;
+#endif
+    if ( !dt_find_property(node, "xen,static-mem", NULL) )
+        allocate_memory(d, &kinfo);
+    else if ( !is_domain_direct_mapped(d) )
+        allocate_static_memory(d, &kinfo, node);
+    else
+        assign_static_memory_11(d, &kinfo, node);
+
+#ifdef CONFIG_STATIC_SHM
+    rc = process_shm(d, &kinfo, node);
+    if ( rc < 0 )
+        return rc;
+#endif
+
+    /*
+     * Base address and irq number are needed when creating vpl011 device
+     * tree node in prepare_dtb_domU, so initialization on related variables
+     * shall be done first.
+     */
+    if ( kinfo.vpl011 )
+    {
+        rc = domain_vpl011_init(d, NULL);
+        if ( rc < 0 )
+            return rc;
+    }
+
+    rc = prepare_dtb_domU(d, &kinfo);
+    if ( rc < 0 )
+        return rc;
+
+    rc = construct_domain(d, &kinfo);
+    if ( rc < 0 )
+        return rc;
+
+    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
+    {
+        ASSERT(hardware_domain);
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc < 0 )
+            return rc;
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+    }
+
+    return rc;
+}
+
+void __init create_domUs(void)
+{
+    struct dt_device_node *node;
+    const struct dt_device_node *cpupool_node,
+                                *chosen = dt_find_node_by_path("/chosen");
+
+    BUG_ON(chosen == NULL);
+    dt_for_each_child_node(chosen, node)
+    {
+        struct domain *d;
+        struct xen_domctl_createdomain d_cfg = {
+            .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
+            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+            /*
+             * The default of 1023 should be sufficient for guests because
+             * on ARM we don't bind physical interrupts to event channels.
+             * The only use of the evtchn port is inter-domain communications.
+             * 1023 is also the default value used in libxl.
+             */
+            .max_evtchn_port = 1023,
+            .max_grant_frames = -1,
+            .max_maptrack_frames = -1,
+            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        };
+        unsigned int flags = 0U;
+        uint32_t val;
+        int rc;
+
+        if ( !dt_device_is_compatible(node, "xen,domain") )
+            continue;
+
+        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
+            panic("No more domain IDs available\n");
+
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+            flags |= CDF_staticmem;
+
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !(flags & CDF_staticmem) )
+                panic("direct-map is not valid for domain %s without static allocation.\n",
+                      dt_node_name(node));
+
+            flags |= CDF_directmap;
+        }
+
+        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
+            panic("Missing property 'cpus' for domain %s\n",
+                  dt_node_name(node));
+
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
+             iommu_enabled )
+            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+        if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
+        {
+            int vpl011_virq = GUEST_VPL011_SPI;
+
+            d_cfg.arch.nr_spis = gic_number_lines() - 32;
+
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+             * set, in which case it'll match the hardware.
+             *
+             * Since the domain is not yet created, we can't use
+             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
+             * be hardcoded.
+             * The logic here shall be consistent with the one in
+             * domain_vpl011_init().
+             */
+            if ( flags & CDF_directmap )
+            {
+                vpl011_virq = serial_irq(SERHND_DTUART);
+                if ( vpl011_virq < 0 )
+                    panic("Error getting IRQ number for this serial port %d\n",
+                          SERHND_DTUART);
+            }
+
+            /*
+             * vpl011 uses one emulated SPI. If vpl011 is requested, make
+             * sure that we allocate enough SPIs for it.
+             */
+            if ( dt_property_read_bool(node, "vpl011") )
+                d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
+                                         vpl011_virq - 32 + 1);
+        }
+
+        /* Get the optional property domain-cpupool */
+        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
+        if ( cpupool_node )
+        {
+            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
+            if ( pool_id < 0 )
+                panic("Error getting cpupool id from domain-cpupool (%d)\n",
+                      pool_id);
+            d_cfg.cpupool_id = pool_id;
+        }
+
+        if ( dt_property_read_u32(node, "max_grant_version", &val) )
+            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+
+        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
+        {
+            if ( val > INT32_MAX )
+                panic("max_grant_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_grant_frames = val;
+        }
+
+        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
+        {
+            if ( val > INT32_MAX )
+                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_maptrack_frames = val;
+        }
+
+        if ( dt_get_property(node, "sve", &val) )
+        {
+#ifdef CONFIG_ARM64_SVE
+            unsigned int sve_vl_bits;
+            bool ret = false;
+
+            if ( !val )
+            {
+                /* Property found with no value, means max HW VL supported */
+                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
+            }
+            else
+            {
+                if ( dt_property_read_u32(node, "sve", &val) )
+                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
+                else
+                    panic("Error reading 'sve' property\n");
+            }
+
+            if ( ret )
+                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
+            else
+                panic("SVE vector length error\n");
+#else
+            panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
+#endif
+        }
+
+        /*
+         * The variable max_init_domid is initialized with zero, so here it's
+         * very important to use the pre-increment operator to call
+         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
+         */
+        d = domain_create(++max_init_domid, &d_cfg, flags);
+        if ( IS_ERR(d) )
+            panic("Error creating domain %s (rc = %ld)\n",
+                  dt_node_name(node), PTR_ERR(d));
+
+        d->is_console = true;
+        dt_device_set_used_by(node, d->domain_id);
+
+        rc = construct_domU(d, node);
+        if ( rc )
+            panic("Could not set up domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+    }
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
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 814a41bcc502..90dba16e42c9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -29,6 +29,7 @@
 #include <asm/setup.h>
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
+#include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
 
@@ -118,7 +119,7 @@ struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
     return vcpu_create(dom0, 0);
 }
 
-static unsigned int __init get_allocation_size(paddr_t size)
+unsigned int __init get_allocation_size(paddr_t size)
 {
     /*
      * get_order_from_bytes returns the order greater than or equal to
@@ -414,10 +415,8 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-static bool __init allocate_bank_memory(struct domain *d,
-                                        struct kernel_info *kinfo,
-                                        gfn_t sgfn,
-                                        paddr_t tot_size)
+bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
+                                 gfn_t sgfn, paddr_t tot_size)
 {
     int res;
     struct page_info *pg;
@@ -478,49 +477,6 @@ static bool __init allocate_bank_memory(struct domain *d,
     return true;
 }
 
-static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    unsigned int i;
-    paddr_t bank_size;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    kinfo->mem.nr_banks = 0;
-    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
-                               bank_size) )
-        goto fail;
-
-    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
-                               bank_size) )
-        goto fail;
-
-    if ( kinfo->unassigned_mem )
-        goto fail;
-
-    for( i = 0; i < kinfo->mem.nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               kinfo->mem.bank[i].start,
-               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(kinfo->mem.bank[i].size >> 20));
-    }
-
-    return;
-
-fail:
-    panic("Failed to allocate requested domain memory."
-          /* Don't want format this as PRIpaddr (16 digit hex) */
-          " %ldKB unallocated. Fix the VMs configurations.\n",
-          (unsigned long)kinfo->unassigned_mem >> 10);
-}
-
 #ifdef CONFIG_STATIC_MEMORY
 static bool __init append_static_memory_to_bank(struct domain *d,
                                                 struct membank *bank,
@@ -600,9 +556,8 @@ static int __init parse_static_mem_prop(const struct dt_device_node *node,
 }
 
 /* Allocate memory from static memory as RAM for one specific domain d. */
-static void __init allocate_static_memory(struct domain *d,
-                                          struct kernel_info *kinfo,
-                                          const struct dt_device_node *node)
+void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
+                                   const struct dt_device_node *node)
 {
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, gbank, bank = 0;
@@ -706,9 +661,8 @@ static void __init allocate_static_memory(struct domain *d,
  * The static memory will be directly mapped in the guest(Guest Physical
  * Address == Physical Address).
  */
-static void __init assign_static_memory_11(struct domain *d,
-                                           struct kernel_info *kinfo,
-                                           const struct dt_device_node *node)
+void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
+                                    const struct dt_device_node *node)
 {
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, bank = 0;
@@ -942,8 +896,8 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
     return 0;
 }
 
-static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
-                              const struct dt_device_node *node)
+int __init process_shm(struct domain *d, struct kernel_info *kinfo,
+                       const struct dt_device_node *node)
 {
     struct dt_device_node *shm_node;
 
@@ -1048,20 +1002,6 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 #endif /* CONFIG_STATIC_SHM */
-#else
-static void __init allocate_static_memory(struct domain *d,
-                                          struct kernel_info *kinfo,
-                                          const struct dt_device_node *node)
-{
-    ASSERT_UNREACHABLE();
-}
-
-static void __init assign_static_memory_11(struct domain *d,
-                                           struct kernel_info *kinfo,
-                                           const struct dt_device_node *node)
-{
-    ASSERT_UNREACHABLE();
-}
 #endif
 
 /*
@@ -1265,17 +1205,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
-/*
- * Helper to write an interrupts with the GIC format
- * This code is assuming the irq is an PPI.
- */
-
-typedef __be32 gic_interrupt_t[3];
-
-static void __init set_interrupt(gic_interrupt_t interrupt,
-                                 unsigned int irq,
-                                 unsigned int cpumask,
-                                 unsigned int level)
+void __init set_interrupt(gic_interrupt_t interrupt,
+                          unsigned int irq,
+                          unsigned int cpumask,
+                          unsigned int level)
 {
     __be32 *cells = interrupt;
     bool is_ppi = !!(irq < 32);
@@ -1320,8 +1253,7 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
  * unit (which contains the physical address) with name to generate a
  * node name.
  */
-static int __init domain_fdt_begin_node(void *fdt, const char *name,
-                                        uint64_t unit)
+int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
 {
     /*
      * The size of the buffer to hold the longest possible string (i.e.
@@ -1345,10 +1277,10 @@ static int __init domain_fdt_begin_node(void *fdt, const char *name,
     return fdt_begin_node(fdt, buf);
 }
 
-static int __init make_memory_node(const struct domain *d,
-                                   void *fdt,
-                                   int addrcells, int sizecells,
-                                   struct meminfo *mem)
+int __init make_memory_node(const struct domain *d,
+                            void *fdt,
+                            int addrcells, int sizecells,
+                            struct meminfo *mem)
 {
     unsigned int i;
     int res, reg_size = addrcells + sizecells;
@@ -1484,10 +1416,10 @@ static int __init make_shm_memory_node(const struct domain *d,
 }
 #endif
 
-static int __init make_resv_memory_node(const struct domain *d,
-                                        void *fdt,
-                                        int addrcells, int sizecells,
-                                        const struct meminfo *mem)
+int __init make_resv_memory_node(const struct domain *d,
+                                 void *fdt,
+                                 int addrcells, int sizecells,
+                                 const struct meminfo *mem)
 {
     int res = 0;
     /* Placeholder for reserved-memory\0 */
@@ -1820,9 +1752,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     return res;
 }
 
-static int __init make_hypervisor_node(struct domain *d,
-                                       const struct kernel_info *kinfo,
-                                       int addrcells, int sizecells)
+int __init make_hypervisor_node(struct domain *d,
+                                const struct kernel_info *kinfo,
+                                int addrcells, int sizecells)
 {
     const char compat[] =
         "xen,xen-" XEN_VERSION_STRING "\0"
@@ -1939,7 +1871,7 @@ static int __init make_hypervisor_node(struct domain *d,
     return res;
 }
 
-static int __init make_psci_node(void *fdt)
+int __init make_psci_node(void *fdt)
 {
     int res;
     const char compat[] =
@@ -1975,7 +1907,7 @@ static int __init make_psci_node(void *fdt)
     return res;
 }
 
-static int __init make_cpus_node(const struct domain *d, void *fdt)
+int __init make_cpus_node(const struct domain *d, void *fdt)
 {
     int res;
     const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
@@ -2173,7 +2105,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
     return res;
 }
 
-static int __init make_timer_node(const struct kernel_info *kinfo)
+int __init make_timer_node(const struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     static const struct dt_device_match timer_ids[] __initconst =
@@ -2491,773 +2423,161 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     return res;
 }
 
-#ifdef CONFIG_VGICV2
-static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
+static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
 {
-    void *fdt = kinfo->fdt;
-    int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
-    __be32 *cells;
-    const struct domain *d = kinfo->d;
-
-    res = domain_fdt_begin_node(fdt, "interrupt-controller",
-                                vgic_dist_base(&d->arch.vgic));
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#address-cells", 0);
-    if ( res )
-        return res;
+    const p2m_type_t default_p2mt = p2m_mmio_direct_c;
+    const void *fdt;
+    int new_size;
+    int ret;
 
-    res = fdt_property_cell(fdt, "#interrupt-cells", 3);
-    if ( res )
-        return res;
+    ASSERT(dt_host && (dt_host->sibling == NULL));
 
-    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
-    if ( res )
-        return res;
+    kinfo->phandle_gic = dt_interrupt_controller->phandle;
+    fdt = device_tree_flattened;
 
-    res = fdt_property_string(fdt, "compatible", "arm,gic-400");
-    if ( res )
-        return res;
+    new_size = fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
+    kinfo->fdt = xmalloc_bytes(new_size);
+    if ( kinfo->fdt == NULL )
+        return -ENOMEM;
 
-    cells = &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
+    ret = fdt_create(kinfo->fdt, new_size);
+    if ( ret < 0 )
+        goto err;
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
-    if (res)
-        return res;
+    fdt_finish_reservemap(kinfo->fdt);
 
-    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
-    if (res)
-        return res;
+    ret = handle_node(d, kinfo, dt_host, default_p2mt);
+    if ( ret )
+        goto err;
 
-    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
-    if (res)
-        return res;
+    ret = fdt_finish(kinfo->fdt);
+    if ( ret < 0 )
+        goto err;
 
-    res = fdt_end_node(fdt);
+    return 0;
 
-    return res;
+  err:
+    printk("Device tree generation failed (%d).\n", ret);
+    xfree(kinfo->fdt);
+    return -EINVAL;
 }
-#endif
 
-#ifdef CONFIG_GICV3
-static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
+static void __init dtb_load(struct kernel_info *kinfo)
 {
-    void *fdt = kinfo->fdt;
-    int res = 0;
-    __be32 *reg, *cells;
-    const struct domain *d = kinfo->d;
-    unsigned int i, len = 0;
-
-    res = domain_fdt_begin_node(fdt, "interrupt-controller",
-                                vgic_dist_base(&d->arch.vgic));
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#address-cells", 0);
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#interrupt-cells", 3);
-    if ( res )
-        return res;
-
-    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
-    if ( res )
-        return res;
-
-    res = fdt_property_string(fdt, "compatible", "arm,gic-v3");
-    if ( res )
-        return res;
-
-    /* reg specifies all re-distributors and Distributor. */
-    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
-          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
-    reg = xmalloc_bytes(len);
-    if ( reg == NULL )
-        return -ENOMEM;
-    cells = reg;
-
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
-
-    for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
-        dt_child_set_range(&cells,
-                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                           d->arch.vgic.rdist_regions[i].base,
-                           d->arch.vgic.rdist_regions[i].size);
-
-    res = fdt_property(fdt, "reg", reg, len);
-    xfree(reg);
-    if (res)
-        return res;
-
-    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
-    if (res)
-        return res;
-
-    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
-    if (res)
-        return res;
+    unsigned long left;
 
-    res = fdt_end_node(fdt);
+    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           kinfo->d, kinfo->dtb_paddr,
+           kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
 
-    return res;
-}
-#endif
+    left = copy_to_guest_phys_flush_dcache(kinfo->d, kinfo->dtb_paddr,
+                                           kinfo->fdt,
+                                           fdt_totalsize(kinfo->fdt));
 
-static int __init make_gic_domU_node(struct kernel_info *kinfo)
-{
-    switch ( kinfo->d->arch.vgic.version )
-    {
-#ifdef CONFIG_GICV3
-    case GIC_V3:
-        return make_gicv3_domU_node(kinfo);
-#endif
-#ifdef CONFIG_VGICV2
-    case GIC_V2:
-        return make_gicv2_domU_node(kinfo);
-#endif
-    default:
-        panic("Unsupported GIC version\n");
-    }
+    if ( left != 0 )
+        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
+              kinfo->d, left);
+    xfree(kinfo->fdt);
 }
 
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
+static void __init initrd_load(struct kernel_info *kinfo)
 {
-    void *fdt = kinfo->fdt;
+    const struct bootmodule *mod = kinfo->initrd_bootmodule;
+    paddr_t load_addr = kinfo->initrd_paddr;
+    paddr_t paddr, len;
+    int node;
     int res;
-    gic_interrupt_t intr;
-    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
-    __be32 *cells;
-    struct domain *d = kinfo->d;
-
-    res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
-    if ( res )
-        return res;
+    __be32 val[2];
+    __be32 *cellp;
+    void __iomem *initrd;
 
-    res = fdt_property_string(fdt, "compatible", "arm,sbsa-uart");
-    if ( res )
-        return res;
+    if ( !mod || !mod->size )
+        return;
 
-    cells = &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
-                       GUEST_PL011_SIZE);
+    paddr = mod->start;
+    len = mod->size;
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
-    if ( res )
-        return res;
+    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           kinfo->d, paddr, load_addr, load_addr + len);
 
-    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
+    node = fdt_path_offset(kinfo->fdt, "/chosen");
+    if ( node < 0 )
+        panic("Cannot find the /chosen node\n");
 
-    res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
+    cellp = (__be32 *)val;
+    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr);
+    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-start",
+                              val, sizeof(val));
     if ( res )
-        return res;
+        panic("Cannot fix up \"linux,initrd-start\" property\n");
 
-    res = fdt_property_cell(fdt, "interrupt-parent",
-                            kinfo->phandle_gic);
+    cellp = (__be32 *)val;
+    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr + len);
+    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-end",
+                              val, sizeof(val));
     if ( res )
-        return res;
+        panic("Cannot fix up \"linux,initrd-end\" property\n");
 
-    /* Use a default baud rate of 115200. */
-    fdt_property_u32(fdt, "current-speed", 115200);
+    initrd = ioremap_wc(paddr, len);
+    if ( !initrd )
+        panic("Unable to map the hwdom initrd\n");
 
-    res = fdt_end_node(fdt);
-    if ( res )
-        return res;
+    res = copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
+                                          initrd, len);
+    if ( res != 0 )
+        panic("Unable to copy the initrd in the hwdom memory\n");
 
-    return 0;
+    iounmap(initrd);
 }
-#endif
 
 /*
- * Scan device tree properties for passthrough specific information.
- * Returns < 0 on error
- *         0 on success
+ * Allocate the event channel PPIs and setup the HVM_PARAM_CALLBACK_IRQ.
+ * The allocated IRQ will be found in d->arch.evtchn_irq.
+ *
+ * Note that this should only be called once all PPIs used by the
+ * hardware domain have been registered.
  */
-static int __init handle_passthrough_prop(struct kernel_info *kinfo,
-                                          const struct fdt_property *xen_reg,
-                                          const struct fdt_property *xen_path,
-                                          bool xen_force,
-                                          uint32_t address_cells, uint32_t size_cells)
+void __init evtchn_allocate(struct domain *d)
 {
-    const __be32 *cell;
-    unsigned int i, len;
-    struct dt_device_node *node;
     int res;
-    paddr_t mstart, size, gstart;
+    u64 val;
 
-    /* xen,reg specifies where to map the MMIO region */
-    cell = (const __be32 *)xen_reg->data;
-    len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
-                                        sizeof(uint32_t));
+    res = vgic_allocate_ppi(d);
+    if ( res < 0 )
+        panic("Unable to allocate a PPI for the event channel interrupt\n");
 
-    for ( i = 0; i < len; i++ )
-    {
-        device_tree_get_reg(&cell, address_cells, size_cells,
-                            &mstart, &size);
-        gstart = dt_next_cell(address_cells, &cell);
+    d->arch.evtchn_irq = res;
 
-        if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size & ~PAGE_MASK )
-        {
-            printk(XENLOG_ERR
-                    "DomU passthrough config has not page aligned addresses/sizes\n");
-            return -EINVAL;
-        }
+    printk("Allocating PPI %u for event channel interrupt\n",
+           d->arch.evtchn_irq);
 
-        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
-                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
-                   kinfo->d->domain_id,
-                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
-            return res;
-        }
+    /* Set the value of domain param HVM_PARAM_CALLBACK_IRQ */
+    val = MASK_INSR(HVM_PARAM_CALLBACK_TYPE_PPI,
+                    HVM_PARAM_CALLBACK_IRQ_TYPE_MASK);
+    /* Active-low level-sensitive  */
+    val |= MASK_INSR(HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_LOW_LEVEL,
+                     HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_MASK);
+    val |= d->arch.evtchn_irq;
+    d->arch.hvm.params[HVM_PARAM_CALLBACK_IRQ] = val;
+}
 
-        res = map_regions_p2mt(kinfo->d,
-                               gaddr_to_gfn(gstart),
-                               PFN_DOWN(size),
-                               maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR
-                   "Failed to map %"PRIpaddr" to the guest at%"PRIpaddr"\n",
-                   mstart, gstart);
-            return -EFAULT;
-        }
-    }
+static int __init get_evtchn_dt_property(const struct dt_device_node *np,
+                                         uint32_t *port, uint32_t *phandle)
+{
+    const __be32 *prop = NULL;
+    uint32_t len;
 
-    /*
-     * If xen_force, we let the user assign a MMIO region with no
-     * associated path.
-     */
-    if ( xen_path == NULL )
-        return xen_force ? 0 : -EINVAL;
+    prop = dt_get_property(np, "xen,evtchn", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_ERR "xen,evtchn property should not be empty.\n");
+        return -EINVAL;
+    }
 
-    /*
-     * xen,path specifies the corresponding node in the host DT.
-     * Both interrupt mappings and IOMMU settings are based on it,
-     * as they are done based on the corresponding host DT node.
-     */
-    node = dt_find_node_by_path(xen_path->data);
-    if ( node == NULL )
+    if ( !len || len < dt_cells_to_size(STATIC_EVTCHN_NODE_SIZE_CELLS) )
     {
-        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
-               (char *)xen_path->data);
-        return -EINVAL;
-    }
-
-    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
-    if ( res < 0 )
-        return res;
-
-    res = iommu_add_dt_device(node);
-    if ( res < 0 )
-        return res;
-
-    /* If xen_force, we allow assignment of devices without IOMMU protection. */
-    if ( xen_force && !dt_device_is_protected(node) )
-        return 0;
-
-    return iommu_assign_dt_device(kinfo->d, node);
-}
-
-static int __init handle_prop_pfdt(struct kernel_info *kinfo,
-                                   const void *pfdt, int nodeoff,
-                                   uint32_t address_cells, uint32_t size_cells,
-                                   bool scan_passthrough_prop)
-{
-    void *fdt = kinfo->fdt;
-    int propoff, nameoff, res;
-    const struct fdt_property *prop, *xen_reg = NULL, *xen_path = NULL;
-    const char *name;
-    bool found, xen_force = false;
-
-    for ( propoff = fdt_first_property_offset(pfdt, nodeoff);
-          propoff >= 0;
-          propoff = fdt_next_property_offset(pfdt, propoff) )
-    {
-        if ( !(prop = fdt_get_property_by_offset(pfdt, propoff, NULL)) )
-            return -FDT_ERR_INTERNAL;
-
-        found = false;
-        nameoff = fdt32_to_cpu(prop->nameoff);
-        name = fdt_string(pfdt, nameoff);
-
-        if ( scan_passthrough_prop )
-        {
-            if ( dt_prop_cmp("xen,reg", name) == 0 )
-            {
-                xen_reg = prop;
-                found = true;
-            }
-            else if ( dt_prop_cmp("xen,path", name) == 0 )
-            {
-                xen_path = prop;
-                found = true;
-            }
-            else if ( dt_prop_cmp("xen,force-assign-without-iommu",
-                                  name) == 0 )
-            {
-                xen_force = true;
-                found = true;
-            }
-        }
-
-        /*
-         * Copy properties other than the ones above: xen,reg, xen,path,
-         * and xen,force-assign-without-iommu.
-         */
-        if ( !found )
-        {
-            res = fdt_property(fdt, name, prop->data, fdt32_to_cpu(prop->len));
-            if ( res )
-                return res;
-        }
-    }
-
-    /*
-     * Only handle passthrough properties if both xen,reg and xen,path
-     * are present, or if xen,force-assign-without-iommu is specified.
-     */
-    if ( xen_reg != NULL && (xen_path != NULL || xen_force) )
-    {
-        res = handle_passthrough_prop(kinfo, xen_reg, xen_path, xen_force,
-                                      address_cells, size_cells);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->d);
-            return res;
-        }
-    }
-    else if ( (xen_path && !xen_reg) || (xen_reg && !xen_path && !xen_force) )
-    {
-        printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
-               kinfo->d);
-        return -EINVAL;
-    }
-
-    /* FDT_ERR_NOTFOUND => There is no more properties for this node */
-    return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
-}
-
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
-                                 int nodeoff,
-                                 uint32_t address_cells, uint32_t size_cells,
-                                 bool scan_passthrough_prop)
-{
-    int rc = 0;
-    void *fdt = kinfo->fdt;
-    int node_next;
-
-    rc = fdt_begin_node(fdt, fdt_get_name(pfdt, nodeoff, NULL));
-    if ( rc )
-        return rc;
-
-    rc = handle_prop_pfdt(kinfo, pfdt, nodeoff, address_cells, size_cells,
-                          scan_passthrough_prop);
-    if ( rc )
-        return rc;
-
-    address_cells = device_tree_get_u32(pfdt, nodeoff, "#address-cells",
-                                        DT_ROOT_NODE_ADDR_CELLS_DEFAULT);
-    size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
-                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
-
-    node_next = fdt_first_subnode(pfdt, nodeoff);
-    while ( node_next > 0 )
-    {
-        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
-                            scan_passthrough_prop);
-        if ( rc )
-            return rc;
-
-        node_next = fdt_next_subnode(pfdt, node_next);
-    }
-
-    return fdt_end_node(fdt);
-}
-
-static int __init check_partial_fdt(void *pfdt, size_t size)
-{
-    int res;
-
-    if ( fdt_magic(pfdt) != FDT_MAGIC )
-    {
-        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree");
-        return -EINVAL;
-    }
-
-    res = fdt_check_header(pfdt);
-    if ( res )
-    {
-        dprintk(XENLOG_ERR, "Failed to check the partial FDT (%d)", res);
-        return -EINVAL;
-    }
-
-    if ( fdt_totalsize(pfdt) > size )
-    {
-        dprintk(XENLOG_ERR, "Partial FDT totalsize is too big");
-        return -EINVAL;
-    }
-
-    return 0;
-}
-
-static int __init domain_handle_dtb_bootmodule(struct domain *d,
-                                               struct kernel_info *kinfo)
-{
-    void *pfdt;
-    int res, node_next;
-
-    pfdt = ioremap_cache(kinfo->dtb_bootmodule->start,
-                         kinfo->dtb_bootmodule->size);
-    if ( pfdt == NULL )
-        return -EFAULT;
-
-    res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
-    if ( res < 0 )
-        goto out;
-
-    for ( node_next = fdt_first_subnode(pfdt, 0); 
-          node_next > 0;
-          node_next = fdt_next_subnode(pfdt, node_next) )
-    {
-        const char *name = fdt_get_name(pfdt, node_next, NULL);
-
-        if ( name == NULL )
-            continue;
-
-        /*
-         * Only scan /gic /aliases /passthrough, ignore the rest.
-         * They don't have to be parsed in order.
-         *
-         * Take the GIC phandle value from the special /gic node in the
-         * DTB fragment.
-         */
-        if ( dt_node_cmp(name, "gic") == 0 )
-        {
-            kinfo->phandle_gic = fdt_get_phandle(pfdt, node_next);
-            continue;
-        }
-
-        if ( dt_node_cmp(name, "aliases") == 0 )
-        {
-            res = scan_pfdt_node(kinfo, pfdt, node_next,
-                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
-                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 false);
-            if ( res )
-                goto out;
-            continue;
-        }
-        if ( dt_node_cmp(name, "passthrough") == 0 )
-        {
-            res = scan_pfdt_node(kinfo, pfdt, node_next,
-                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
-                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 true);
-            if ( res )
-                goto out;
-            continue;
-        }
-    }
-
- out:
-    iounmap(pfdt);
-
-    return res;
-}
-
-/*
- * The max size for DT is 2MB. However, the generated DT is small (not including
- * domU passthrough DT nodes whose size we account separately), 4KB are enough
- * for now, but we might have to increase it in the future.
- */
-#define DOMU_DTB_SIZE 4096
-static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
-{
-    int addrcells, sizecells;
-    int ret, fdt_size = DOMU_DTB_SIZE;
-
-    kinfo->phandle_gic = GUEST_PHANDLE_GIC;
-    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
-    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
-
-    addrcells = GUEST_ROOT_ADDRESS_CELLS;
-    sizecells = GUEST_ROOT_SIZE_CELLS;
-
-    /* Account for domU passthrough DT size */
-    if ( kinfo->dtb_bootmodule )
-        fdt_size += kinfo->dtb_bootmodule->size;
-
-    /* Cap to max DT size if needed */
-    fdt_size = min(fdt_size, SZ_2M);
-
-    kinfo->fdt = xmalloc_bytes(fdt_size);
-    if ( kinfo->fdt == NULL )
-        return -ENOMEM;
-
-    ret = fdt_create(kinfo->fdt, fdt_size);
-    if ( ret < 0 )
-        goto err;
-
-    ret = fdt_finish_reservemap(kinfo->fdt);
-    if ( ret < 0 )
-        goto err;
-
-    ret = fdt_begin_node(kinfo->fdt, "");
-    if ( ret < 0 )
-        goto err;
-
-    ret = fdt_property_cell(kinfo->fdt, "#address-cells", addrcells);
-    if ( ret )
-        goto err;
-
-    ret = fdt_property_cell(kinfo->fdt, "#size-cells", sizecells);
-    if ( ret )
-        goto err;
-
-    ret = make_chosen_node(kinfo);
-    if ( ret )
-        goto err;
-
-    ret = make_psci_node(kinfo->fdt);
-    if ( ret )
-        goto err;
-
-    ret = make_cpus_node(d, kinfo->fdt);
-    if ( ret )
-        goto err;
-
-    ret = make_memory_node(d, kinfo->fdt, addrcells, sizecells, &kinfo->mem);
-    if ( ret )
-        goto err;
-
-    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                &kinfo->shm_mem);
-    if ( ret )
-        goto err;
-
-    /*
-     * domain_handle_dtb_bootmodule has to be called before the rest of
-     * the device tree is generated because it depends on the value of
-     * the field phandle_gic.
-     */
-    if ( kinfo->dtb_bootmodule )
-    {
-        ret = domain_handle_dtb_bootmodule(d, kinfo);
-        if ( ret )
-            goto err;
-    }
-
-    ret = make_gic_domU_node(kinfo);
-    if ( ret )
-        goto err;
-
-    ret = make_timer_node(kinfo);
-    if ( ret )
-        goto err;
-
-    if ( kinfo->vpl011 )
-    {
-        ret = -EINVAL;
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-        ret = make_vpl011_uart_node(kinfo);
-#endif
-        if ( ret )
-            goto err;
-    }
-
-    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
-    {
-        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
-        if ( ret )
-            goto err;
-    }
-
-    ret = fdt_end_node(kinfo->fdt);
-    if ( ret < 0 )
-        goto err;
-
-    ret = fdt_finish(kinfo->fdt);
-    if ( ret < 0 )
-        goto err;
-
-    return 0;
-
-  err:
-    printk("Device tree generation failed (%d).\n", ret);
-    xfree(kinfo->fdt);
-
-    return -EINVAL;
-}
-
-static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
-{
-    const p2m_type_t default_p2mt = p2m_mmio_direct_c;
-    const void *fdt;
-    int new_size;
-    int ret;
-
-    ASSERT(dt_host && (dt_host->sibling == NULL));
-
-    kinfo->phandle_gic = dt_interrupt_controller->phandle;
-    fdt = device_tree_flattened;
-
-    new_size = fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
-    kinfo->fdt = xmalloc_bytes(new_size);
-    if ( kinfo->fdt == NULL )
-        return -ENOMEM;
-
-    ret = fdt_create(kinfo->fdt, new_size);
-    if ( ret < 0 )
-        goto err;
-
-    fdt_finish_reservemap(kinfo->fdt);
-
-    ret = handle_node(d, kinfo, dt_host, default_p2mt);
-    if ( ret )
-        goto err;
-
-    ret = fdt_finish(kinfo->fdt);
-    if ( ret < 0 )
-        goto err;
-
-    return 0;
-
-  err:
-    printk("Device tree generation failed (%d).\n", ret);
-    xfree(kinfo->fdt);
-    return -EINVAL;
-}
-
-static void __init dtb_load(struct kernel_info *kinfo)
-{
-    unsigned long left;
-
-    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, kinfo->dtb_paddr,
-           kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
-
-    left = copy_to_guest_phys_flush_dcache(kinfo->d, kinfo->dtb_paddr,
-                                           kinfo->fdt,
-                                           fdt_totalsize(kinfo->fdt));
-
-    if ( left != 0 )
-        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
-              kinfo->d, left);
-    xfree(kinfo->fdt);
-}
-
-static void __init initrd_load(struct kernel_info *kinfo)
-{
-    const struct bootmodule *mod = kinfo->initrd_bootmodule;
-    paddr_t load_addr = kinfo->initrd_paddr;
-    paddr_t paddr, len;
-    int node;
-    int res;
-    __be32 val[2];
-    __be32 *cellp;
-    void __iomem *initrd;
-
-    if ( !mod || !mod->size )
-        return;
-
-    paddr = mod->start;
-    len = mod->size;
-
-    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, paddr, load_addr, load_addr + len);
-
-    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
-    node = fdt_path_offset(kinfo->fdt, "/chosen");
-    if ( node < 0 )
-        panic("Cannot find the /chosen node\n");
-
-    cellp = (__be32 *)val;
-    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr);
-    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-start",
-                              val, sizeof(val));
-    if ( res )
-        panic("Cannot fix up \"linux,initrd-start\" property\n");
-
-    cellp = (__be32 *)val;
-    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr + len);
-    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-end",
-                              val, sizeof(val));
-    if ( res )
-        panic("Cannot fix up \"linux,initrd-end\" property\n");
-
-    initrd = ioremap_wc(paddr, len);
-    if ( !initrd )
-        panic("Unable to map the hwdom initrd\n");
-
-    res = copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
-                                          initrd, len);
-    if ( res != 0 )
-        panic("Unable to copy the initrd in the hwdom memory\n");
-
-    iounmap(initrd);
-}
-
-/*
- * Allocate the event channel PPIs and setup the HVM_PARAM_CALLBACK_IRQ.
- * The allocated IRQ will be found in d->arch.evtchn_irq.
- *
- * Note that this should only be called once all PPIs used by the
- * hardware domain have been registered.
- */
-void __init evtchn_allocate(struct domain *d)
-{
-    int res;
-    u64 val;
-
-    res = vgic_allocate_ppi(d);
-    if ( res < 0 )
-        panic("Unable to allocate a PPI for the event channel interrupt\n");
-
-    d->arch.evtchn_irq = res;
-
-    printk("Allocating PPI %u for event channel interrupt\n",
-           d->arch.evtchn_irq);
-
-    /* Set the value of domain param HVM_PARAM_CALLBACK_IRQ */
-    val = MASK_INSR(HVM_PARAM_CALLBACK_TYPE_PPI,
-                    HVM_PARAM_CALLBACK_IRQ_TYPE_MASK);
-    /* Active-low level-sensitive  */
-    val |= MASK_INSR(HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_LOW_LEVEL,
-                     HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_MASK);
-    val |= d->arch.evtchn_irq;
-    d->arch.hvm.params[HVM_PARAM_CALLBACK_IRQ] = val;
-}
-
-static int __init get_evtchn_dt_property(const struct dt_device_node *np,
-                                         uint32_t *port, uint32_t *phandle)
-{
-    const __be32 *prop = NULL;
-    uint32_t len;
-
-    prop = dt_get_property(np, "xen,evtchn", &len);
-    if ( !prop )
-    {
-        printk(XENLOG_ERR "xen,evtchn property should not be empty.\n");
-        return -EINVAL;
-    }
-
-    if ( !len || len < dt_cells_to_size(STATIC_EVTCHN_NODE_SIZE_CELLS) )
-    {
-        printk(XENLOG_ERR "xen,evtchn property value is not valid.\n");
+        printk(XENLOG_ERR "xen,evtchn property value is not valid.\n");
         return -EINVAL;
     }
 
@@ -3413,22 +2733,7 @@ static void __init find_gnttab_region(struct domain *d,
            kinfo->gnttab_start, kinfo->gnttab_start + kinfo->gnttab_size);
 }
 
-static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
-                                             unsigned int smp_cpus)
-{
-    /*
-     * Keep in sync with libxl__get_required_paging_memory().
-     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
-     * plus 128 pages to cover extended regions.
-     */
-    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
-
-    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
-
-    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
-}
-
-static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
+int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 {
     unsigned int i;
     struct vcpu *v = d->vcpu[0];
@@ -3519,296 +2824,6 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     return 0;
 }
 
-static int __init alloc_xenstore_evtchn(struct domain *d)
-{
-    evtchn_alloc_unbound_t alloc;
-    int rc;
-
-    alloc.dom = d->domain_id;
-    alloc.remote_dom = hardware_domain->domain_id;
-    rc = evtchn_alloc_unbound(&alloc, 0);
-    if ( rc )
-    {
-        printk("Failed allocating event channel for domain\n");
-        return rc;
-    }
-
-    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
-
-    return 0;
-}
-
-static int __init construct_domU(struct domain *d,
-                                 const struct dt_device_node *node)
-{
-    struct kernel_info kinfo = {};
-    const char *dom0less_enhanced;
-    int rc;
-    u64 mem;
-    u32 p2m_mem_mb;
-    unsigned long p2m_pages;
-
-    rc = dt_property_read_u64(node, "memory", &mem);
-    if ( !rc )
-    {
-        printk("Error building DomU: cannot read \"memory\" property\n");
-        return -EINVAL;
-    }
-    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
-
-    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
-    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
-    p2m_pages = rc ?
-                p2m_mem_mb << (20 - PAGE_SHIFT) :
-                domain_p2m_pages(mem, d->max_vcpus);
-
-    spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
-    spin_unlock(&d->arch.paging.lock);
-    if ( rc != 0 )
-        return rc;
-
-    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
-           d->max_vcpus, mem);
-
-    kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
-
-    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
-    if ( rc == -EILSEQ ||
-         rc == -ENODATA ||
-         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
-    {
-        if ( hardware_domain )
-            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
-        else
-            panic("At the moment, Xenstore support requires dom0 to be present\n");
-    }
-    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
-
-    if ( vcpu_create(d, 0) == NULL )
-        return -ENOMEM;
-
-    d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
-
-    kinfo.d = d;
-
-    rc = kernel_probe(&kinfo, node);
-    if ( rc < 0 )
-        return rc;
-
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate memory */
-    d->arch.type = kinfo.type;
-#endif
-    if ( !dt_find_property(node, "xen,static-mem", NULL) )
-        allocate_memory(d, &kinfo);
-    else if ( !is_domain_direct_mapped(d) )
-        allocate_static_memory(d, &kinfo, node);
-    else
-        assign_static_memory_11(d, &kinfo, node);
-
-#ifdef CONFIG_STATIC_SHM
-    rc = process_shm(d, &kinfo, node);
-    if ( rc < 0 )
-        return rc;
-#endif
-
-    /*
-     * Base address and irq number are needed when creating vpl011 device
-     * tree node in prepare_dtb_domU, so initialization on related variables
-     * shall be done first.
-     */
-    if ( kinfo.vpl011 )
-    {
-        rc = domain_vpl011_init(d, NULL);
-        if ( rc < 0 )
-            return rc;
-    }
-
-    rc = prepare_dtb_domU(d, &kinfo);
-    if ( rc < 0 )
-        return rc;
-
-    rc = construct_domain(d, &kinfo);
-    if ( rc < 0 )
-        return rc;
-
-    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
-    {
-        ASSERT(hardware_domain);
-        rc = alloc_xenstore_evtchn(d);
-        if ( rc < 0 )
-            return rc;
-        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
-    }
-
-    return rc;
-}
-
-void __init create_domUs(void)
-{
-    struct dt_device_node *node;
-    const struct dt_device_node *cpupool_node,
-                                *chosen = dt_find_node_by_path("/chosen");
-
-    BUG_ON(chosen == NULL);
-    dt_for_each_child_node(chosen, node)
-    {
-        struct domain *d;
-        struct xen_domctl_createdomain d_cfg = {
-            .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
-            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            /*
-             * The default of 1023 should be sufficient for guests because
-             * on ARM we don't bind physical interrupts to event channels.
-             * The only use of the evtchn port is inter-domain communications.
-             * 1023 is also the default value used in libxl.
-             */
-            .max_evtchn_port = 1023,
-            .max_grant_frames = -1,
-            .max_maptrack_frames = -1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        };
-        unsigned int flags = 0U;
-        uint32_t val;
-        int rc;
-
-        if ( !dt_device_is_compatible(node, "xen,domain") )
-            continue;
-
-        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
-
-        if ( dt_find_property(node, "xen,static-mem", NULL) )
-            flags |= CDF_staticmem;
-
-        if ( dt_property_read_bool(node, "direct-map") )
-        {
-            if ( !(flags & CDF_staticmem) )
-                panic("direct-map is not valid for domain %s without static allocation.\n",
-                      dt_node_name(node));
-
-            flags |= CDF_directmap;
-        }
-
-        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
-            panic("Missing property 'cpus' for domain %s\n",
-                  dt_node_name(node));
-
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
-             iommu_enabled )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-
-        if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-        {
-            int vpl011_virq = GUEST_VPL011_SPI;
-
-            d_cfg.arch.nr_spis = gic_number_lines() - 32;
-
-            /*
-             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
-             * set, in which case it'll match the hardware.
-             *
-             * Since the domain is not yet created, we can't use
-             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
-             * be hardcoded.
-             * The logic here shall be consistent with the one in
-             * domain_vpl011_init().
-             */
-            if ( flags & CDF_directmap )
-            {
-                vpl011_virq = serial_irq(SERHND_DTUART);
-                if ( vpl011_virq < 0 )
-                    panic("Error getting IRQ number for this serial port %d\n",
-                          SERHND_DTUART);
-            }
-
-            /*
-             * vpl011 uses one emulated SPI. If vpl011 is requested, make
-             * sure that we allocate enough SPIs for it.
-             */
-            if ( dt_property_read_bool(node, "vpl011") )
-                d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         vpl011_virq - 32 + 1);
-        }
-
-        /* Get the optional property domain-cpupool */
-        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
-        if ( cpupool_node )
-        {
-            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
-            if ( pool_id < 0 )
-                panic("Error getting cpupool id from domain-cpupool (%d)\n",
-                      pool_id);
-            d_cfg.cpupool_id = pool_id;
-        }
-
-        if ( dt_property_read_u32(node, "max_grant_version", &val) )
-            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
-
-        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
-        {
-            if ( val > INT32_MAX )
-                panic("max_grant_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_grant_frames = val;
-        }
-
-        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
-        {
-            if ( val > INT32_MAX )
-                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_maptrack_frames = val;
-        }
-
-        if ( dt_get_property(node, "sve", &val) )
-        {
-#ifdef CONFIG_ARM64_SVE
-            unsigned int sve_vl_bits;
-            bool ret = false;
-
-            if ( !val )
-            {
-                /* Property found with no value, means max HW VL supported */
-                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
-            }
-            else
-            {
-                if ( dt_property_read_u32(node, "sve", &val) )
-                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
-                else
-                    panic("Error reading 'sve' property\n");
-            }
-
-            if ( ret )
-                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
-            else
-                panic("SVE vector length error\n");
-#else
-            panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
-#endif
-        }
-
-        /*
-         * The variable max_init_domid is initialized with zero, so here it's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
-         */
-        d = domain_create(++max_init_domid, &d_cfg, flags);
-        if ( IS_ERR(d) )
-            panic("Error creating domain %s (rc = %ld)\n",
-                  dt_node_name(node), PTR_ERR(d));
-
-        d->is_console = true;
-        dt_device_set_used_by(node, d->domain_id);
-
-        rc = construct_domU(d, node);
-        if ( rc )
-            panic("Could not set up domain %s (rc = %d)\n",
-                  dt_node_name(node), rc);
-    }
-}
-
 static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = {};
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
new file mode 100644
index 000000000000..c5625925d940
--- /dev/null
+++ b/xen/arch/arm/include/asm/dom0less-build.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_DOM0LESS_BUILD_H_
+#define __ASM_DOM0LESS_BUILD_H_
+
+void create_domUs(void);
+bool is_dom0less_mode(void);
+
+#endif /* __ASM_DOM0LESS_BUILD_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index b9329c9ee032..b9ae0d170c5c 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -4,9 +4,47 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
+typedef __be32 gic_interrupt_t[3];
+
+bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
+                          gfn_t sgfn, paddr_t tot_size);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
+int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
+                          int sizecells, const struct meminfo *mem);
 int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct domain *d, void *fdt, int addrcells,
+                     int sizecells, struct meminfo *mem);
+int make_psci_node(void *fdt);
+int make_timer_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
+unsigned int get_allocation_size(paddr_t size);
+
+/*
+ * handle_device_interrupts retrieves the interrupts configuration from
+ * a device tree node and maps those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
+                             bool need_mapping);
+
+/*
+ * Helper to write an interrupts with the GIC format
+ * This code is assuming the irq is an PPI.
+ */
+void set_interrupt(gic_interrupt_t interrupt, unsigned int irq,
+                   unsigned int cpumask, unsigned int level);
+
+int process_shm(struct domain *d, struct kernel_info *kinfo,
+                const struct dt_device_node *node);
+
 #ifndef CONFIG_ACPI
 static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 {
@@ -17,6 +55,28 @@ static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 #else
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 #endif
+
+#ifdef CONFIG_STATIC_MEMORY
+void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
+                            const struct dt_device_node *node);
+void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
+                             const struct dt_device_node *node);
+#else
+static inline void allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif
+
 #endif
 
 /*
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index ccb857ca2ea9..6d670d68aed3 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -135,7 +135,6 @@ void acpi_create_efi_mmap_table(struct domain *d,
 
 int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 
-void create_domUs(void);
 void create_dom0(void);
 void alloc_static_evtchn(void);
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 9b9018574919..3f1081bed2e2 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -34,6 +34,7 @@
 #include <xen/warning.h>
 #include <xen/hypercall.h>
 #include <asm/alternative.h>
+#include <asm/dom0less-build.h>
 #include <asm/page.h>
 #include <asm/current.h>
 #include <asm/setup.h>
@@ -724,38 +725,6 @@ void __init populate_boot_allocator(void)
     }
 }
 
-static bool __init is_dom0less_mode(void)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-    bool dom0found = false;
-    bool domUfound = false;
-
-    /* Look into the bootmodules */
-    for ( i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        /* Find if dom0 and domU kernels are present */
-        if ( mod->kind == BOOTMOD_KERNEL )
-        {
-            if ( mod->domU == false )
-            {
-                dom0found = true;
-                break;
-            }
-            else
-                domUfound = true;
-        }
-    }
-
-    /*
-     * If there is no dom0 kernel but at least one domU, then we are in
-     * dom0less mode
-     */
-    return ( !dom0found && domUfound );
-}
-
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
-- 
2.34.1


