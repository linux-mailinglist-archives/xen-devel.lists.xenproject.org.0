Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4841CA91
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 18:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199285.353242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcju-0007X7-At; Wed, 29 Sep 2021 16:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199285.353242; Wed, 29 Sep 2021 16:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcju-0007Tz-7b; Wed, 29 Sep 2021 16:47:26 +0000
Received: by outflank-mailman (input) for mailman id 199285;
 Wed, 29 Sep 2021 16:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVcjs-0007Tr-Qa
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 16:47:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbe2b518-59df-4d9a-8084-8f42d47091f4;
 Wed, 29 Sep 2021 16:47:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A93F36142A;
 Wed, 29 Sep 2021 16:47:22 +0000 (UTC)
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
X-Inumbo-ID: bbe2b518-59df-4d9a-8084-8f42d47091f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632934042;
	bh=ivj9hFXx7OOIFh8x2VnRKOVQNI2v8LjxZccm6gngLrw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AkWUbUNOEn4H+Vmk2KTfSPGQpN7Wn35lC3R4KsXHOf/5r74qyPoPmkodoXduJHTIT
	 CoXwq7EineTJR8+D7uduNw3jwcrU21hzMqLUufkXW4bobRv2hXSdDALl69jbBO5v5d
	 yKK7wffzPDBiPE2QdvoePgdm7Ho+S7DL3hKv/TQDTUC1xzKH8DdW7Sna9QoCjOX/wy
	 w/HTnWrJfA4ukCJLVPtDNQwQkxLS5hxv0Jt6mRis1k9cpuJywakvxDEmghdyUUedVD
	 qWVJKE5JW9p1I90uV8hhWLFv13humAuCYy8kpuW96+sRUapERVDLNPFb7pBgFHnz6J
	 fA8E5jui88Wtg==
Date: Wed, 29 Sep 2021 09:47:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 16/17] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <7f19d0802a9ac7544ddefe96f282ba7f97caefe9.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281658320.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <7f19d0802a9ac7544ddefe96f282ba7f97caefe9.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> libxl will create an emulated PCI device tree node in the device tree to
> enable the guest OS to discover the virtual PCI during guest boot.
> Emulated PCI device tree node will only be created when there is any
> device assigned to guest.
> 
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Make GUEST_VPCI_MEM_ADDR address 2MB aligned
> Change in v2:
> - enable doamin_vpci_init() when XEN_DOMCTL_CDF_vpci is set for domain.
> ---
>  tools/include/libxl.h            |   6 ++
>  tools/libs/light/libxl_arm.c     | 105 +++++++++++++++++++++++++++++++
>  tools/libs/light/libxl_create.c  |   3 +
>  tools/libs/light/libxl_types.idl |   1 +
>  tools/xl/xl_parse.c              |   2 +
>  xen/include/public/arch-arm.h    |  10 +++
>  6 files changed, 127 insertions(+)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d698..3362073b21 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -358,6 +358,12 @@
>   */
>  #define LIBXL_HAVE_BUILDINFO_ARM_VUART 1
>  
> +/*
> + * LIBXL_HAVE_BUILDINFO_ARM_VPCI indicates that the toolstack supports virtual
> + * PCI for ARM.
> + */
> +#define LIBXL_HAVE_BUILDINFO_ARM_VPCI 1
> +
>  /*
>   * LIBXL_HAVE_BUILDINFO_GRANT_LIMITS indicates that libxl_domain_build_info
>   * has the max_grant_frames and max_maptrack_frames fields.
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e00..52f1ddce48 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
>      return fdt_property(fdt, "reg", regs, sizeof(regs));
>  }
>  
> +static int fdt_property_values(libxl__gc *gc, void *fdt,
> +        const char *name, unsigned num_cells, ...)
> +{
> +    uint32_t prop[num_cells];
> +    be32 *cells = &prop[0];
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
> +    return fdt_property(fdt, name, prop, sizeof(prop));
> +}
> +
> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
> +                                    unsigned addr_cells,
> +                                    unsigned size_cells,
> +                                    unsigned num_regs, ...)
> +{
> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
> +    be32 *cells = &regs[0];
> +    int i;
> +    va_list ap;
> +    uint64_t arg;
> +
> +    va_start(ap, num_regs);
> +    for (i = 0 ; i < num_regs; i++) {
> +        /* Set the memory bit field */
> +        arg = va_arg(ap, uint32_t);
> +        set_cell(&cells, 1, arg);
> +
> +        /* Set the vpci bus address */
> +        arg = addr_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, addr_cells , arg);
> +
> +        /* Set the cpu bus address where vpci address is mapped */
> +        set_cell(&cells, addr_cells, arg);
> +
> +        /* Set the vpci size requested */
> +        arg = size_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, size_cells, arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> +}
> +
>  static int make_root_properties(libxl__gc *gc,
>                                  const libxl_version_info *vers,
>                                  void *fdt)
> @@ -668,6 +720,53 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
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
> +    res = fdt_property_values(gc, fdt, "bus-range", 2, 0, 255);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "status", "okay");
> +    if (res) return res;
> +
> +    res = fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +        GUEST_ROOT_SIZE_CELLS, 2,
> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_SIZE,
> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR,
> +        GUEST_VPCI_PREFETCH_MEM_SIZE);
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
> @@ -971,6 +1070,9 @@ next_resize:
>          if (info->tee == LIBXL_TEE_TYPE_OPTEE)
>              FDT( make_optee_node(gc, fdt) );
>  
> +        if (libxl_defbool_val(info->arch_arm.vpci))
> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> +
>          if (pfdt)
>              FDT( copy_partial_fdt(gc, fdt, pfdt) );
>  
> @@ -1189,6 +1291,9 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
>  
> +    /* VPCI is disabled by default */
> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);
> +
>      if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>          return;
>  
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e356b2106d..529e475489 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -632,6 +632,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>          if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
>              create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
>  
> +        if ( libxl_defbool_val(b_info->arch_arm.vpci) )
> +            create.flags |= XEN_DOMCTL_CDF_vpci;
> +
>          /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
>          libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
>  
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff653a..78b1ddf0b8 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                 ("vuart", libxl_vuart_type),
> +                               ("vpci", libxl_defbool),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..ffafbeffb4 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source,
>          }
>          if (d_config->num_pcidevs && c_info->type == LIBXL_DOMAIN_TYPE_PV)
>              libxl_defbool_set(&b_info->u.pv.e820_host, true);
> +        if (d_config->num_pcidevs)
> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>      }
>  
>      if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 727541a321..acd97eb327 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -431,6 +431,11 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
>  #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
>  
> +/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
> +#define GUEST_VPCI_ADDR_TYPE_MEM            xen_mk_ullong(0x02000000)
> +#define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
> +#define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
> +
>  /*
>   * 16MB == 4096 pages reserved for guest to use as a region to map its
>   * grant table in.
> @@ -446,6 +451,11 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM @ 1GB */
>  #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
>  
> +/* 4GB @ 4GB Prefetch Memory for VPCI */
> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x42000000)
> +#define GUEST_VPCI_PREFETCH_MEM_ADDR        xen_mk_ullong(0x100000000)
> +#define GUEST_VPCI_PREFETCH_MEM_SIZE        xen_mk_ullong(0x100000000)
> +
>  #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM @ 8GB */
>  #define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
>  
> -- 
> 2.17.1
> 

