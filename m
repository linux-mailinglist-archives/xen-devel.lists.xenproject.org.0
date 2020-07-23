Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93222BA3F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 01:40:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jykog-0000Dp-FM; Thu, 23 Jul 2020 23:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jykof-0000De-Ab
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 23:39:57 +0000
X-Inumbo-ID: d0790ea6-cd3d-11ea-a33b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0790ea6-cd3d-11ea-a33b-12813bfff9fa;
 Thu, 23 Jul 2020 23:39:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 950BC20792;
 Thu, 23 Jul 2020 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595547596;
 bh=6tkuzd/fjE4rkfP55cgq1G31SwOvw0pZNn+D7K/FYu8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CWQwP5GhYLm4j9gqFpZzSEXnmbXfNfFKtfZG+F2Ia4ZRu8FezWsYHSQgVOZwa19tl
 CViPyp0o6j1gXF9lFtViLAFEK6g9uVb6TFYfNM5C0hGsU9PqZvobsOhRjqXVf959/G
 oBP6ZzaDzAMpbkpN7xQzn1ta5j/FPGgApA7AEI+g=
Date: Thu, 23 Jul 2020 16:39:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
Subject: Re: [RFC PATCH v1 4/4] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <23346b24762467bd246b91b05f7b0fc1719282f6.1595511416.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2007231505170.17562@sstabellini-ThinkPad-T480s>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <23346b24762467bd246b91b05f7b0fc1719282f6.1595511416.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 23 Jul 2020, Rahul Singh wrote:
> libxl will create an emulated PCI device tree node in the
> device tree to enable the guest OS to discover the virtual
> PCI during guest boot.
> 
> We introduced the new config option [vpci="ecam"] for guests.
> When this config option is enabled in a guest configuration,
> a PCI device tree node will be created in the guest device tree.
> 
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).
> 
> Change-Id: I47d39cbe8184de2226f174644df9790ecc610ccd

Same question


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  tools/libxl/libxl_arm.c       | 200 ++++++++++++++++++++++++++++++++++
>  tools/libxl/libxl_types.idl   |   6 +
>  tools/xl/xl_parse.c           |   7 ++
>  xen/include/public/arch-arm.h |  28 +++++
>  4 files changed, 241 insertions(+)
> 
> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
> index 34f8a29056..84568e9dc9 100644
> --- a/tools/libxl/libxl_arm.c
> +++ b/tools/libxl/libxl_arm.c
> @@ -268,6 +268,130 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
>      return fdt_property(fdt, "reg", regs, sizeof(regs));
>  }
>  
> +static int fdt_property_vpci_bus_range(libxl__gc *gc, void *fdt,
> +        unsigned num_cells, ...)
> +{
> +    uint32_t bus_range[num_cells];
> +    be32 *cells = &bus_range[0];
> +    int i;
> +    va_list ap;
> +    uint32_t arg;
> +
> +    va_start(ap, num_cells);
> +    for (i = 0 ; i < num_cells; i++) {
> +        arg = va_arg(ap, uint32_t);
> +        set_cell(&cells, 1, arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "bus-range", bus_range, sizeof(bus_range));
> +}
> +
> +static int fdt_property_vpci_interrupt_map_mask(libxl__gc *gc, void *fdt,
> +        unsigned num_cells, ...)
> +{
> +    uint32_t interrupt_map_mask[num_cells];
> +    be32 *cells = &interrupt_map_mask[0];
> +    int i;
> +    va_list ap;
> +    uint32_t arg;
> +
> +    va_start(ap, num_cells);
> +    for (i = 0 ; i < num_cells; i++) {
> +        arg = va_arg(ap, uint32_t);
> +        set_cell(&cells, 1, arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "interrupt-map-mask", interrupt_map_mask,
> +                                sizeof(interrupt_map_mask));
> +}
> +
> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
> +        unsigned vpci_addr_cells,
> +        unsigned cpu_addr_cells,
> +        unsigned vpci_size_cells,
> +        unsigned num_regs, ...)
> +{
> +    uint32_t regs[num_regs*(vpci_addr_cells+cpu_addr_cells+vpci_size_cells)];
> +    be32 *cells = &regs[0];
> +    int i;
> +    va_list ap;
> +    uint64_t arg;
> +
> +    va_start(ap, num_regs);
> +    for (i = 0 ; i < num_regs; i++) {
> +        /* Set the memory bit field */
> +        arg = va_arg(ap, uint64_t);
> +        set_cell(&cells, 1, arg);
> +
> +        /* Set the vpci bus address */
> +        arg = vpci_addr_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, 2 , arg);
> +
> +        /* Set the cpu bus address where vpci address is mapped */
> +        arg = cpu_addr_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, cpu_addr_cells, arg);
> +
> +        /* Set the vpci size requested */
> +        arg = vpci_size_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, vpci_size_cells,arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> +}
> +
> +static int fdt_property_vpci_interrupt_map(libxl__gc *gc, void *fdt,
> +        unsigned child_unit_addr_cells,
> +        unsigned child_interrupt_specifier_cells,
> +        unsigned parent_unit_addr_cells,
> +        unsigned parent_interrupt_specifier_cells,
> +        unsigned num_regs, ...)
> +{
> +    uint32_t interrupt_map[num_regs * (child_unit_addr_cells +
> +            child_interrupt_specifier_cells + parent_unit_addr_cells
> +            + parent_interrupt_specifier_cells + 1)];
> +    be32 *cells = &interrupt_map[0];
> +    int i,j;
> +    va_list ap;
> +    uint64_t arg;
> +
> +    va_start(ap, num_regs);
> +    for (i = 0 ; i < num_regs; i++) {
> +        /* Set the child unit address*/
> +        for (j = 0 ; j < child_unit_addr_cells; j++) {
> +            arg = va_arg(ap, uint32_t);
> +            set_cell(&cells, 1 , arg);
> +        }
> +
> +        /* Set the child interrupt specifier*/
> +        for (j = 0 ; j < child_interrupt_specifier_cells ; j++) {
> +            arg = va_arg(ap, uint32_t);
> +            set_cell(&cells, 1 , arg);
> +        }
> +
> +        /* Set the interrupt-parent*/
> +        set_cell(&cells, 1 , GUEST_PHANDLE_GIC);
> +
> +        /* Set the parent unit address*/
> +        for (j = 0 ; j < parent_unit_addr_cells; j++) {
> +            arg = va_arg(ap, uint32_t);
> +            set_cell(&cells, 1 , arg);
> +        }
> +
> +        /* Set the parent interrupt specifier*/
> +        for (j = 0 ; j < parent_interrupt_specifier_cells; j++) {
> +            arg = va_arg(ap, uint32_t);
> +            set_cell(&cells, 1 , arg);
> +        }
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "interrupt-map", interrupt_map,
> +                                sizeof(interrupt_map));
> +}
> +
>  static int make_root_properties(libxl__gc *gc,
>                                  const libxl_version_info *vers,
>                                  void *fdt)
> @@ -659,6 +783,79 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +static int make_vpci_node(libxl__gc *gc, void *fdt,
> +        const struct arch_info *ainfo,
> +        struct xc_dom_image *dom)
> +{
> +    int res;
> +    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
> +    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
> +    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
> +
> +    res = fdt_begin_node(fdt, name);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "device_type", "pci");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
> +    if (res) return res;
> +
> +    res = fdt_property_vpci_bus_range(gc, fdt, 2, 0,255);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "linux,pci-domain", 0);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#interrupt-cells", 1);
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "status", "okay");
> +    if (res) return res;
> +
> +    res = fdt_property_vpci_ranges(gc, fdt, GUEST_PCI_ADDRESS_CELLS,
> +        GUEST_ROOT_ADDRESS_CELLS, GUEST_PCI_SIZE_CELLS,
> +        3,
> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_PCI_ADDR,
> +        GUEST_VPCI_MEM_CPU_ADDR, GUEST_VPCI_MEM_SIZE,
> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_PCI_ADDR,
> +        GUEST_VPCI_PREFETCH_MEM_CPU_ADDR, GUEST_VPCI_PREFETCH_MEM_SIZE,
> +        GUEST_VPCI_ADDR_TYPE_IO, GUEST_VPCI_IO_PCI_ADDR,
> +        GUEST_VPCI_IO_CPU_ADDR, GUEST_VPCI_IO_SIZE);
> +    if (res) return res;
> +
> +    res = fdt_property_vpci_interrupt_map_mask(gc, fdt, 4, 0, 0, 0, 7);

it would make sense to separate out child_unit_addr_cells and
child_interrupt_specifier_cells here like we do below with
fdt_property_vpci_interrupt_map


> +    if (res) return res;
> +
> +    /*
> +     * Legacy interrupt is forced and assigned to the guest.
> +     * This will be removed once we have implementation for MSI support.
> +     *
> +     */
> +    res = fdt_property_vpci_interrupt_map(gc, fdt, 3, 1, 0, 3,
> +            4,
> +            0, 0, 0, 1, 0, 136, DT_IRQ_TYPE_LEVEL_HIGH,
> +            0, 0, 0, 2, 0, 137, DT_IRQ_TYPE_LEVEL_HIGH,
> +            0, 0, 0, 3, 0, 138, DT_IRQ_TYPE_LEVEL_HIGH,
> +            0, 0, 0, 4, 0, 139, DT_IRQ_TYPE_LEVEL_HIGH);

The 4 interrupt allocated for this need to be defined in
xen/include/public/arch-arm.h as well. Also, why would we want to get
rid of the legacy interrupts completely? It would be possible to still
find device or software that rely on them.


> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>  static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                               const struct xc_dom_image *dom)
>  {

[...]


> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 7364a07362..4e19c62948 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -426,6 +426,34 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>  #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>  
> +#define GUEST_PCI_ADDRESS_CELLS 3
> +#define GUEST_PCI_SIZE_CELLS 2
> +
> +/* PCI-PCIe memory space types */
> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
> +#define GUEST_VPCI_ADDR_TYPE_IO           xen_mk_ullong(0x01000000)
> +
> +/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
> +#define GUEST_VPCI_PREFETCH_MEM_CPU_ADDR  xen_mk_ullong(0x4000000000)

It looks like it could conflict with GUEST_RAM1_BASE+GUEST_RAM1_SIZE?


> +#define GUEST_VPCI_MEM_CPU_ADDR           xen_mk_ullong(0x04020000)
> +#define GUEST_VPCI_IO_CPU_ADDR            xen_mk_ullong(0xC0200800)

0xC0200800 looks like it could conflict with
GUEST_RAM0_BASE+GUEST_RAM0_SIZE?


> +/*
> + * This is hardcoded values for the real PCI physical addresses.
> + * This will be removed once we read the real PCI-PCIe physical
> + * addresses form the config space and map to the guest memory map
> + * when assigning the device to guest via VPCI.
> + *
> + */
> +#define GUEST_VPCI_PREFETCH_MEM_PCI_ADDR  xen_mk_ullong(0x4000000000)
> +#define GUEST_VPCI_MEM_PCI_ADDR           xen_mk_ullong(0x50000000)
> +#define GUEST_VPCI_IO_PCI_ADDR            xen_mk_ullong(0x00000000)
> +
> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x100000000)
> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x08000000)

How did you chose these sizes? GUEST_VPCI_MEM_SIZE and/or
GUEST_VPCI_PREFETCH_MEM_SIZE are supposed to potentially cover all the
PCI BARs, including potential future hotplug devices, right?

If so, maybe we need to increase GUEST_VPCI_MEM_SIZE to a couple of GB
and GUEST_VPCI_PREFETCH_MEM_SIZE to even more?




> +#define GUEST_VPCI_IO_SIZE                xen_mk_ullong(0x00800000)
> +
>  /*
>   * 16MB == 4096 pages reserved for guest to use as a region to map its
>   * grant table in.

