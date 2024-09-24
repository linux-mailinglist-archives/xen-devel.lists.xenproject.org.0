Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A0984F2F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 01:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803389.1213933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFNL-0008NP-Qp; Tue, 24 Sep 2024 23:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803389.1213933; Tue, 24 Sep 2024 23:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFNL-0008LC-OA; Tue, 24 Sep 2024 23:55:23 +0000
Received: by outflank-mailman (input) for mailman id 803389;
 Tue, 24 Sep 2024 23:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=325E=QW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stFNK-0008Kq-LW
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 23:55:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 745e68af-7ad0-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 01:55:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECFE0A43A8D;
 Tue, 24 Sep 2024 23:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59590C4CEC7;
 Tue, 24 Sep 2024 23:55:17 +0000 (UTC)
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
X-Inumbo-ID: 745e68af-7ad0-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727222118;
	bh=Oyvtw3dffvshnGuEHkFIxVOOxtNLm16iCt2yffpzdHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rz5l4h72Wdo9tnjJc0Fh3ObghwHb2rqT+J7v7dqRAGZWNCKHeKwRpguOdWkpn3TYp
	 yHmgKD0q0AXKJdbbOHzjp7+3AR2HNMQysQR8s/4abXS4s9XQ0E0JorhfeiRJ+qFru4
	 fWz3p6scjNNgjCdciTnOPDhgvxNdchMLnJCX33Jo6NZH0L4QRDkP5tBbo8SoNLpqrl
	 YZIoysYspL/39TS+iuj3lXn3rfve/Bbkwz38EBvz7itc6Ym6IIMNoxB68tETP8VB0f
	 ciusknpSxQ6I5Ud0KKkiw6dJB7IfwYd2+QBqcbKQKTQIFNTNADjGdsY05d4Ersl+4H
	 QiutFgrJlglSA==
Date: Tue, 24 Sep 2024 16:55:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, edgar.iglesias@amd.com, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
In-Reply-To: <20240924162359.1390487-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409241641250.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, Edgar E. Iglesias wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> When virtio-pci is specified in the dom0less domU properties, create a
> virtio-pci node in the guest's device tree. Set up an mmio handler with
> a register for the guest to poll when the backend has connected and
> virtio-pci bus is ready to be probed. Grant tables may be used by
> specifying virtio-pci = "grants";.
> 
> [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
>  Make grants iommu-map cover the entire PCI bus.
>  Add virtio-pci-ranges to specify memory-map for direct-mapped guests.
>  Document virtio-pci dom0less fdt bindings.]
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  docs/misc/arm/device-tree/booting.txt |  21 +++
>  xen/arch/arm/dom0less-build.c         | 238 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/kernel.h     |  15 ++
>  3 files changed, 274 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 3a04f5c57f..82f3bd7026 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -276,6 +276,27 @@ with the following properties:
>      passed through. This option is the default if this property is missing
>      and the user does not provide the device partial device tree for the domain.
>  
> +- virtio-pci
> +
> +    A string property specifying whether virtio-pci is enabled for the
> +    domain and if grant table mappings should be used. If no value is set
> +    this property is treated as a boolean and the same way as if set to
> +    "enabled".
> +    Possible property values are:
> +
> +    - "enabled"
> +    Virtio-pci is enabled for the domain.
> +
> +    - "grants"
> +    Virtio-pci is enabled for the domain and an grants IOMMU node will be
> +    generated in the domains device-tree.
> +
> +- virtio-pci-ranges
> +
> +    An optional array of 6 u32 values specifying the 2 cells base addresses of
> +    the ECAM, Memory and Prefetchable-Memory regions for virtio-pci. This is
> +    useful to avoid memory-map collisions when using direct-mapped guests.
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 09b65e44ae..dab24fa9e2 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -586,6 +586,189 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>      return res;
>  }
>  
> +static int __init make_virtio_pci_domU_node(const struct kernel_info *kinfo)
> +{
> +    void *fdt = kinfo->fdt;
> +    /* reg is sized to be used for all the needed properties below */
> +    __be32 reg[(1 + (GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS)
> +               * 2];
> +    __be32 irq_map[4 * 4 * 8];
> +    __be32 *cells;
> +    char buf[22]; /* pcie@ + max 16 char address + '\0' */
> +    int res;
> +    int devfn, intx_pin;
> +    static const char compat[] = "pci-host-ecam-generic";
> +    static const char reg_names[] = "ecam";
> +
> +    if ( p2m_ipa_bits <= 40 ) {
> +        printk("PA bits %d is too small!\nvirtio-pci is only supported "
> +               "on platforms with PA bits > 40\n", p2m_ipa_bits);
> +        return -EINVAL;
> +    }
> +
> +    snprintf(buf, sizeof(buf), "pcie@%lx", kinfo->virtio_pci.ecam.base);
> +    dt_dprintk("Create virtio-pci node\n");
> +    res = fdt_begin_node(fdt, buf);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_string(fdt, "device_type", "pci");
> +    if ( res )
> +        return res;
> +
> +    /* Create reg property */
> +    cells = &reg[0];
> +    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                       kinfo->virtio_pci.ecam.base, GUEST_VIRTIO_PCI_ECAM_SIZE);
> +
> +    res = fdt_property(fdt, "reg", reg,
> +                       (GUEST_ROOT_ADDRESS_CELLS +
> +                        GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "reg-names", reg_names, sizeof(reg_names));
> +    if ( res )
> +        return res;
> +
> +    /* Create bus-range property */
> +    cells = &reg[0];
> +    dt_set_cell(&cells, 1, 0);
> +    dt_set_cell(&cells, 1, 0xff);
> +    res = fdt_property(fdt, "bus-range", reg, 2 * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_string(fdt, "status", "okay");
> +    if ( res )
> +        return res;
> +
> +    /*
> +     * Create ranges property as:
> +     * <(PCI bitfield) (PCI address) (CPU address) (Size)>
> +     */
> +    cells = &reg[0];
> +    dt_set_cell(&cells, 1, GUEST_VIRTIO_PCI_MEM_TYPE);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, GUEST_VIRTIO_PCI_MEM_SIZE);
> +    dt_set_cell(&cells, 1, GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.pf_mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.pf_mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE);
> +    res = fdt_property(fdt, "ranges", reg, 14 * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "dma-coherent", "", 0);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#interrupt-cells", 1);
> +    if ( res )
> +        return res;
> +
> +    /*
> +     * PCI-to-PCI bridge specification
> +     * 9.1: Interrupt routing. Table 9-1
> +     *
> +     * the PCI Express Base Specification, Revision 2.1
> +     * 2.2.8.1: INTx interrupt signaling - Rules
> +     *          the Implementation Note
> +     *          Table 2-20
> +     */
> +    cells = &irq_map[0];
> +    for (devfn = 0; devfn <= 0x18; devfn += 8) {
> +        for (intx_pin = 0; intx_pin < 4; intx_pin++) {
> +            int irq = GUEST_VIRTIO_PCI_SPI_FIRST - 32;
> +            irq += ((intx_pin + PCI_SLOT(devfn)) % 4);
> +
> +            dt_set_cell(&cells, 1, devfn << 8);
> +            dt_set_cell(&cells, 1, 0);
> +            dt_set_cell(&cells, 1, 0);
> +            dt_set_cell(&cells, 1, intx_pin + 1);
> +            dt_set_cell(&cells, 1, kinfo->phandle_gic);
> +            /* 3 GIC cells.  */
> +            dt_set_cell(&cells, 1, 0);
> +            dt_set_cell(&cells, 1, irq);
> +            dt_set_cell(&cells, 1, DT_IRQ_TYPE_LEVEL_HIGH);
> +        }
> +    }
> +
> +    /* Assert we've sized irq_map correctly.  */
> +    BUG_ON(cells - &irq_map[0] != ARRAY_SIZE(irq_map));
> +
> +    res = fdt_property(fdt, "interrupt-map", irq_map, sizeof(irq_map));
> +    if ( res )
> +        return res;
> +
> +    cells = &reg[0];
> +    dt_set_cell(&cells, 1, cpu_to_be16(PCI_DEVFN(3, 0)));

Hi Edgar, what is this PCI_DEVFN(3, 0)  device?


> +    dt_set_cell(&cells, 1, 0x0);
> +    dt_set_cell(&cells, 1, 0x0);
> +    dt_set_cell(&cells, 1, 0x7);
> +    res = fdt_property(fdt, "interrupt-map-mask", reg, 4 * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    if ( kinfo->virtio_pci.mode == VIRTIO_PCI_GRANTS )
> +    {
> +        cells = &reg[0];
> +        dt_set_cell(&cells, 1, 0x0);
> +        dt_set_cell(&cells, 1, GUEST_PHANDLE_IOMMU);
> +        dt_set_cell(&cells, 1, 0x0);
> +        dt_set_cell(&cells, 1, 0x10000);
> +        res = fdt_property(fdt, "iommu-map", reg, 4 * sizeof(*reg));
> +        if ( res )
> +            return res;
> +    }
> +
> +    res = fdt_property_cell(fdt, "linux,pci-domain", 1);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_end_node(fdt);
> +    if ( res )
> +        return res;
> +
> +    if ( kinfo->virtio_pci.mode == VIRTIO_PCI_GRANTS )
> +    {
> +        snprintf(buf, sizeof(buf), "xen_iommu");

I don't think underscores are allowed in device tree node names



> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "compatible", "xen,grant-dma");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_cell(fdt, "#iommu-cells", 1);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_end_node(fdt);
> +    }
> +
> +    return res;
> +}
> +
>  /*
>   * The max size for DT is 2MB. However, the generated DT is small (not including
>   * domU passthrough DT nodes whose size we account separately), 4KB are enough
> @@ -693,6 +876,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>              goto err;
>      }
>  
> +    if ( kinfo->virtio_pci.mode )
> +    {
> +        ret = make_virtio_pci_domU_node(kinfo);
> +        if ( ret )
> +            goto err;
> +    }
> +
>      ret = fdt_end_node(kinfo->fdt);
>      if ( ret < 0 )
>          goto err;
> @@ -744,11 +934,24 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>      return 0;
>  }
>  
> +static u64 combine_u64(u32 v[2])

Let's make this a static inline or a macro. I can't believe we don't
have one already.


> +{
> +    u64 v64;
> +
> +    v64 = v[0];
> +    v64 <<= 32;
> +    v64 |= v[1];
> +    return v64;
> +}
> +
>  static int __init construct_domU(struct domain *d,
>                                   const struct dt_device_node *node)
>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
>      const char *dom0less_enhanced;
> +    const char *virtio_pci;
> +    /* virtio-pci ECAM, MEM, PF-MEM each carrying 2 x Address cells.  */
> +    u32 virtio_pci_ranges[3 * 2];
>      int rc;
>      u64 mem;
>      u32 p2m_mem_mb;
> @@ -779,6 +982,41 @@ static int __init construct_domU(struct domain *d,
>  
>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>  
> +    rc = dt_property_read_string(node, "virtio-pci", &virtio_pci);
> +    if ( !rc )
> +    {
> +        if ( !strcmp(virtio_pci, "enabled") )
> +            kinfo.virtio_pci.mode = VIRTIO_PCI;
> +        else if ( !strcmp(virtio_pci, "grants") )
> +            kinfo.virtio_pci.mode = VIRTIO_PCI_GRANTS;
> +        else
> +        {
> +            printk("Invalid \"virtio-pci\" property value (%s)\n", virtio_pci);
> +            return -EINVAL;
> +        }
> +    }
> +    else if ( rc == -ENODATA )
> +    {
> +        /* Handle missing property value */
> +        kinfo.virtio_pci.mode = dt_property_read_bool(node, "virtio-pci");
> +    }
> +
> +    if ( kinfo.virtio_pci.mode != VIRTIO_PCI_NONE )
> +    {
> +        rc = dt_property_read_u32_array(node, "virtio-pci-ranges",
> +                                        virtio_pci_ranges,
> +                                        ARRAY_SIZE(virtio_pci_ranges));
> +        if ( rc == 0 ) {
> +            kinfo.virtio_pci.ecam.base = combine_u64(&virtio_pci_ranges[0]);
> +            kinfo.virtio_pci.mem.base = combine_u64(&virtio_pci_ranges[2]);
> +            kinfo.virtio_pci.pf_mem.base = combine_u64(&virtio_pci_ranges[4]);
> +        } else {
> +            kinfo.virtio_pci.ecam.base = GUEST_VIRTIO_PCI_ECAM_BASE;
> +            kinfo.virtio_pci.mem.base = GUEST_VIRTIO_PCI_MEM_BASE;
> +            kinfo.virtio_pci.pf_mem.base = GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE;
> +        }
> +    }
> +
>      rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
>      if ( rc == -EILSEQ ||
>           rc == -ENODATA ||
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 7e6e3c82a4..2dab2ac88f 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -29,6 +29,13 @@
>  #define DOM0LESS_XENSTORE        BIT(1, U)
>  #define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
>  
> +/* virtio-pci types */
> +enum virtio_pci_type {
> +    VIRTIO_PCI_NONE,
> +    VIRTIO_PCI,
> +    VIRTIO_PCI_GRANTS,
> +};
> +
>  struct kernel_info {
>  #ifdef CONFIG_ARM_64
>      enum domain_type type;
> @@ -62,6 +69,14 @@ struct kernel_info {
>      /* Enable/Disable PV drivers interfaces */
>      uint16_t dom0less_feature;
>  
> +    struct {
> +        enum virtio_pci_type mode;
> +        struct {
> +            u64 base;
> +        } ecam, mem, pf_mem;
> +        u32 pci_intx_irq_base;
> +    } virtio_pci;
> +
>      /* GIC phandle */
>      uint32_t phandle_gic;
>  
> -- 
> 2.43.0
> 

