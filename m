Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F5A05967
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867144.1278648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU09-0003h7-G4; Wed, 08 Jan 2025 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867144.1278648; Wed, 08 Jan 2025 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU09-0003bz-7e; Wed, 08 Jan 2025 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 867144;
 Wed, 08 Jan 2025 11:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVU07-0001rx-10
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:27 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94216569-cdb1-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 12:13:25 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30229d5b229so172492851fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:22 -0800 (PST)
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
X-Inumbo-ID: 94216569-cdb1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334804; x=1736939604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MTqGiPQ/jA03tCZq1CRsGrbRyrze3+bn/uXhnqO+fM=;
        b=OAe50i/Q/20TEGkopy1PIop/MxRAJVFee7LBczppGtEX3RxJ8Q3j7WQ9bNXsp0MMl1
         qdMk5gQrNHl15E/VxU6qWho/lwcU9PnjWLLafQIU+R65LwoeM5nCthqPKXizs9ys/aM1
         7pQVQ6iyeKqwPCw8NqxRR27EpJenYmc+rAgTjs4fx2+6J5zf1oBGSPU4XbQjNtGxNmuf
         2UBuDfOW7obTguJ8fgRuSx4jpWaC5CjUyQdDlX8mYpfJcn3+EjFU/p6oHbX6tUBFjEFK
         GVxrYC6kHpe8HgoQBZ+Bu2QNdrwEXBbLLJlrZQ7/tgHF0PYzNds8SrA4H5jVQfj5Rr/B
         89jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334804; x=1736939604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MTqGiPQ/jA03tCZq1CRsGrbRyrze3+bn/uXhnqO+fM=;
        b=clav0JC1QfXVE1w1WyVodVJoPmAiwx5AgN9rolsz5iKlupqrOWSciaNvuD/YY+0Mzm
         VjegiC7oF/XqhyGgC4N+LHLk1qdBTbNauEzbf59m4xCsjJvrwQHkaBkCa24CEucfF6Ke
         FclW4aK4Si3cXmFY5tgZ3s/cz7epsmlcqptyEcd09WD90GJStAaGie8SxuO9wQun3ZWF
         MkTBydq2jYbxMNeuOqFhLdPum5BqYfpSpFUU1jww2udt+tl9gbMM7+vWs+bR/9SwjVvN
         5e9bauJg+v/vIIXvcMEfjvnxTPqbpO2qAvNhlgHKgZ27aHowBbt2GF7ASp5glCD4wAx5
         t6kg==
X-Gm-Message-State: AOJu0YzfU7ba2w6l5uBt6lWddXCFbK7mxdbnUXT2lG2YK4axTIAG5uB2
	53s716WWklMDvqU15yKz1NQyHP9ttfQ11/AymoOqj1fHmjO7zKOjjAMm0IFj
X-Gm-Gg: ASbGncvl8dZphYJRN09kc//qaz5ct8RUa6Gm5tQJQC8zfGDF3Ly4v9d994xnjOyJStM
	3+5teguAuwzCtxs/pc0lzckMeFpwIP95AIBf7bFSHH9Fr0lK7Qqys7KEkIo5KDBQsZFeMpmvPM0
	bNe2cg1dS+RoNLtfrtSxu5B8lcMFYrJnjGqZZgGoMGaAhKzpwh6HAU2t7l6n1rG0gapuPDOfOtg
	N/pI1wZepBFSCE2+WSvJViudsZ2DzRHzEvFyw9tpWWai0o62FPBXpduNw==
X-Google-Smtp-Source: AGHT+IH6AWgeaLtK63AplG5laI6gBLt4hdb4gnLEWD21Ye6lpR+jTdy1iSbPx8iVl6a2e4fLs1B4Ag==
X-Received: by 2002:a05:651c:b0c:b0:2ff:d83d:9155 with SMTP id 38308e7fff4ca-305f4626539mr6587071fa.27.1736334803490;
        Wed, 08 Jan 2025 03:13:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 9/9] xen/common: dom0less: introduce common dom0less-build.c
Date: Wed,  8 Jan 2025 12:13:11 +0100
Message-ID: <007095f12bfd803df504f10249b5b497bd0529a1.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of Arm's dom0less-build.c could be common between architectures which are
using device tree files to create guest domains. Thereby move some parts of
Arm's dom0less-build.c to common code with minor changes.

As a part of theses changes the following changes are introduced:
- Introduce make_arch_nodes() to cover arch-specific nodes. For example, in
  case of Arm, it is PSCI and vpl011 nodes.
- Introduce set_domain_type() to abstract a way how setting of domain type
  happens. For example, RISC-V won't have this member of arch_domain structure
  as vCPUs will always have the same bitness as hypervisor. In case of Arm, it
  is possible that Arm64 could create 32-bit and 64-bit domains.
- Introduce init_vuart() to cover details of virtual uart initialization.
- Introduce init_intc_phandle() to cover some details of interrupt controller
  phandle initialization. As an example, RISC-V could have different name for
  interrupt controller node ( APLIC, PLIC, IMSIC, etc ) but the code in
  domain_handle_dtb_bootmodule() could handle only one interrupt controller
  node name.
- s/make_gic_domU_node/make_intc_domU_node as GIC is Arm specific naming and
  add prototype of make_intc_domU_node() to dom0less-build.h

The following functions are moved to xen/common/device-tree:
- Functions which are moved as is:
  - domain_p2m_pages().
  - handle_passthrough_prop().
  - handle_prop_pfdt().
  - scan_pfdt_node().
  - check_partial_fdt().
- Functions which are moved with some minor changes:
  - alloc_xenstore_evtchn():
    - ifdef-ing by CONFIG_HVM accesses to hvm.params.
  - prepare_dtb_domU():
    - ifdef-ing access to gnttab_{start,size} by CONFIG_GRANT_TABLE.
    - s/make_gic_domU_node/make_intc_domU_node.
    - Add call of make_arch_nodes().
- domain_handle_dtb_bootmodule():
  - hide details of interrupt controller phandle initialization by calling
    init_intc_phandle().
  - Update the comment above init_intc_phandle(): s/gic/interrupt controller.
- construct_domU():
  - ifdef-ing by CONFIG_HVM accesses to hvm.params.
  - Call init_vuart() to hide Arm's vpl011_init() details there.
  - Add call of set_domain_type() instead of setting kinfo->arch.type explicitly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/dom0less-build.c            | 569 ++---------------------
 xen/common/device-tree/dom0less-build.c  | 559 ++++++++++++++++++++++
 xen/include/asm-generic/dom0less-build.h |  14 +
 3 files changed, 608 insertions(+), 534 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 259285ddda..872a9437da 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -143,7 +143,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 }
 #endif
 
-static int __init make_gic_domU_node(struct kernel_info *kinfo)
+int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     switch ( kinfo->d->arch.vgic.version )
     {
@@ -209,577 +209,62 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 }
 #endif
 
-/*
- * Scan device tree properties for passthrough specific information.
- * Returns < 0 on error
- *         0 on success
- */
-static int __init handle_passthrough_prop(struct kernel_info *kinfo,
-                                          const struct fdt_property *xen_reg,
-                                          const struct fdt_property *xen_path,
-                                          bool xen_force,
-                                          uint32_t address_cells,
-                                          uint32_t size_cells)
-{
-    const __be32 *cell;
-    unsigned int i, len;
-    struct dt_device_node *node;
-    int res;
-    paddr_t mstart, size, gstart;
-
-    /* xen,reg specifies where to map the MMIO region */
-    cell = (const __be32 *)xen_reg->data;
-    len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
-                                        sizeof(uint32_t));
-
-    for ( i = 0; i < len; i++ )
-    {
-        device_tree_get_reg(&cell, address_cells, size_cells,
-                            &mstart, &size);
-        gstart = dt_next_cell(address_cells, &cell);
-
-        if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size & ~PAGE_MASK )
-        {
-            printk(XENLOG_ERR
-                   "DomU passthrough config has not page aligned addresses/sizes\n");
-            return -EINVAL;
-        }
-
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
-
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
-
-    /*
-     * If xen_force, we let the user assign a MMIO region with no
-     * associated path.
-     */
-    if ( xen_path == NULL )
-        return xen_force ? 0 : -EINVAL;
-
-    /*
-     * xen,path specifies the corresponding node in the host DT.
-     * Both interrupt mappings and IOMMU settings are based on it,
-     * as they are done based on the corresponding host DT node.
-     */
-    node = dt_find_node_by_path(xen_path->data);
-    if ( node == NULL )
-    {
-        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
-               xen_path->data);
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
+int __init make_arch_nodes(struct kernel_info *kinfo)
 {
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
-            uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
-
-            if ( phandle_intc != 0 )
-                kinfo->phandle_intc = phandle_intc;
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
-    kinfo->phandle_intc = GUEST_PHANDLE_GIC;
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
+    int ret;
 
     ret = make_psci_node(kinfo->fdt);
     if ( ret )
-        goto err;
-
-    ret = make_cpus_node(d, kinfo->fdt);
-    if ( ret )
-        goto err;
-
-    ret = make_memory_node(kinfo, addrcells, sizecells,
-                           kernel_info_get_mem(kinfo));
-    if ( ret )
-        goto err;
-
-    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
-    if ( ret )
-        goto err;
-
-    /*
-     * domain_handle_dtb_bootmodule has to be called before the rest of
-     * the device tree is generated because it depends on the value of
-     * the field phandle_intc.
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
+        return -EINVAL;
 
     if ( kinfo->vuart )
     {
-        ret = -EINVAL;
 #ifdef CONFIG_SBSA_VUART_CONSOLE
         ret = make_vpl011_uart_node(kinfo);
 #endif
         if ( ret )
-            goto err;
-    }
-
-    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
-    {
-        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
-        if ( ret )
-            goto err;
+            return -EINVAL;
     }
 
-    ret = fdt_end_node(kinfo->fdt);
-    if ( ret < 0 )
-        goto err;
-
-    ret = fdt_finish(kinfo->fdt);
-    if ( ret < 0 )
-        goto err;
-
     return 0;
-
-  err:
-    printk("Device tree generation failed (%d).\n", ret);
-    xfree(kinfo->fdt);
-
-    return -EINVAL;
 }
 
-static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
-                                             unsigned int smp_cpus)
+/* TODO: make arch.type generic ? */
+#ifdef CONFIG_ARM_64
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
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
+    /* type must be set before allocate memory */
+    d->arch.type = kinfo->arch.type;
 }
-
-static int __init alloc_xenstore_evtchn(struct domain *d)
+#else
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
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
+    /* Nothing to do */
 }
+#endif
 
-int __init construct_domU(struct domain *d,
-                          const struct dt_device_node *node)
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
 {
-    struct kernel_info kinfo = KERNEL_INFO_INIT;
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
-    kinfo.vuart = dt_property_read_bool(node, "vpl011");
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
-    d->arch.type = kinfo.arch.type;
-#endif
-    if ( !dt_find_property(node, "xen,static-mem", NULL) )
-        allocate_memory(d, &kinfo);
-    else if ( !is_domain_direct_mapped(d) )
-        allocate_static_memory(d, &kinfo, node);
-    else
-        assign_static_memory_11(d, &kinfo, node);
+    int rc = 0;
 
-    rc = process_shm(d, &kinfo, node);
-    if ( rc < 0 )
-        return rc;
+    kinfo->vuart = dt_property_read_bool(node, "vpl011");
 
     /*
      * Base address and irq number are needed when creating vpl011 device
      * tree node in prepare_dtb_domU, so initialization on related variables
      * shall be done first.
      */
-    if ( kinfo.vuart )
+    if ( kinfo->vuart )
     {
         rc = domain_vpl011_init(d, NULL);
         if ( rc < 0 )
             return rc;
     }
 
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
     return rc;
 }
 
-
 struct xen_domctl_createdomain __init arch_xen_domctl_createdomain(void)
 {
     struct xen_domctl_createdomain d_cfg = {
@@ -868,6 +353,22 @@ void __init arch_create_domus(struct dt_device_node *node,
     }
 }
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "gic") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo->phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 19bfa5e005..509f825ce6 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -3,17 +3,26 @@
 #include <xen/device_tree.h>
 #include <xen/domain.h>
 #include <xen/err.h>
+#include <xen/event.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
 #include <xen/iommu.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/llc-coloring.h>
+#include <xen/sizes.h>
 #include <xen/sched.h>
 #include <xen/stdbool.h>
 #include <xen/types.h>
+#include <xen/vmap.h>
 
 #include <public/domctl.h>
 
+#include <asm/domain-build.h>
 #include <asm/dom0less-build.h>
+#include <asm/kernel.h>
 #include <asm/setup.h>
+#include <asm/static-memory.h>
+#include <asm/static-shmem.h>
 
 bool __init is_dom0less_mode(void)
 {
@@ -159,3 +168,553 @@ void __init create_domUs(void)
                   dt_node_name(node), rc);
     }
 }
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
+               xen_path->data);
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
+         * Only scan /$(interrupt_controller) /aliases /passthrough,
+         * ignore the rest.
+         * They don't have to be parsed in order.
+         *
+         * Take the interrupt controller phandle value from the special
+         * interrupt controller node in the DTB fragment.
+         */
+        if ( init_intc_phandle(kinfo, name, node_next, pfdt) == 0 )
+            continue;
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
+    kinfo->phandle_intc = GUEST_PHANDLE_GIC;
+
+#ifdef CONFIG_GRANT_TABLE
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
+#endif
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
+    ret = make_cpus_node(d, kinfo->fdt);
+    if ( ret )
+        goto err;
+
+    ret = make_memory_node(kinfo, addrcells, sizecells,
+                           kernel_info_get_mem(kinfo));
+    if ( ret )
+        goto err;
+
+    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
+    if ( ret )
+        goto err;
+
+    /*
+     * domain_handle_dtb_bootmodule has to be called before the rest of
+     * the device tree is generated because it depends on the value of
+     * the field phandle_intc.
+     */
+    if ( kinfo->dtb_bootmodule )
+    {
+        ret = domain_handle_dtb_bootmodule(d, kinfo);
+        if ( ret )
+            goto err;
+    }
+
+    ret = make_intc_domU_node(kinfo);
+    if ( ret )
+        goto err;
+
+    ret = make_timer_node(kinfo);
+    if ( ret )
+        goto err;
+
+    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
+    {
+        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
+
+    ret = make_arch_nodes(kinfo);
+    if ( ret )
+        goto err;
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
+#ifdef CONFIG_HVM
+    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
+#endif
+
+    return 0;
+}
+
+int __init construct_domU(struct domain *d,
+                          const struct dt_device_node *node)
+{
+    struct kernel_info kinfo = KERNEL_INFO_INIT;
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
+    set_domain_type(d, &kinfo);
+
+    if ( !dt_find_property(node, "xen,static-mem", NULL) )
+        allocate_memory(d, &kinfo);
+    else if ( !is_domain_direct_mapped(d) )
+        allocate_static_memory(d, &kinfo, node);
+    else
+        assign_static_memory_11(d, &kinfo, node);
+
+    rc = process_shm(d, &kinfo, node);
+    if ( rc < 0 )
+        return rc;
+
+    rc = init_vuart(d, &kinfo, node);
+    if ( rc < 0 )
+        return rc;
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
+#ifdef CONFIG_HVM
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+#endif
+    }
+
+    return rc;
+}
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
index a6985bc20a..3e4af9dcce 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -8,6 +8,9 @@
 
 #include <public/domctl.h>
 
+struct kernel_info;
+struct dt_device_node;
+
 void create_domUs(void);
 bool is_dom0less_mode(void);
 
@@ -18,6 +21,17 @@ void arch_create_domus(struct dt_device_node *node,
                        struct xen_domctl_createdomain *d_cfg,
                        unsigned int flags);
 
+int init_vuart(struct domain *d, struct kernel_info *kinfo,
+               const struct dt_device_node *node);
+
+int make_intc_domU_node(struct kernel_info *kinfo);
+int make_arch_nodes(struct kernel_info *kinfo);
+
+void set_domain_type(struct domain *d, struct kernel_info *kinfo);
+
+int init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                      const int node_next, const void *pfdt);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
 
 static inline void create_domUs(void) {}
-- 
2.47.1


