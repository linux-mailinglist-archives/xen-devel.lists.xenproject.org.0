Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D322A40640F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 02:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183804.332146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUlv-0005bu-J6; Fri, 10 Sep 2021 00:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183804.332146; Fri, 10 Sep 2021 00:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUlv-0005Yz-F0; Fri, 10 Sep 2021 00:52:03 +0000
Received: by outflank-mailman (input) for mailman id 183804;
 Fri, 10 Sep 2021 00:52:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOUlu-0005Yt-2e
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 00:52:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d43fae8-11d1-11ec-b205-12813bfff9fa;
 Fri, 10 Sep 2021 00:52:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FDBD6105A;
 Fri, 10 Sep 2021 00:51:59 +0000 (UTC)
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
X-Inumbo-ID: 4d43fae8-11d1-11ec-b205-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631235119;
	bh=xs7DuKIsDRL4I4JKDAcKjHSGgLUEZ3zDFut0cG4XkZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Jg4Hq3ebU2YqIekLRE76/Ax23ohR5LCnK7CaV8fXaGrMWMW7Ovm7e97ROHFOfYwUh
	 +967EdY4lI6gxx2MMsO1RHFFn9yXtGhKzVNKtBT1i8Bk+uFNrew20YgVXI/QYfBXvH
	 pQdA87gxBXp679l4zf/16/M7e7LcWP8kGPdzPEF1Tj7bFCiRT0H7fEsnDn9IVA2X++
	 QTAXncX8ZEKSrvdd7I4LGEhrLzD/4dgnu80G+mwP+9JllBEOSsG8Im8vNNgDibuyvT
	 fIWidvTMueZS1xYP5DbEo5aSKyoqh//a+EbACGxPxoK6FTyuS1str6fGZmSwLaFKBr
	 h0Iwm5OhFnHBw==
Date: Thu, 9 Sep 2021 17:51:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109091742210.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Aug 2021, Rahul Singh wrote:
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
> ---
>  tools/libs/light/libxl_arm.c          | 109 ++++++++++++++++++++++++++
>  tools/libs/light/libxl_types.idl      |   1 +
>  tools/xl/xl_parse.c                   |   2 +
>  xen/include/public/arch-arm.h         |  11 +++
>  xen/include/public/device_tree_defs.h |   1 +
>  5 files changed, 124 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e00..a091e97e76 100644
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
> +        arg = va_arg(ap, uint64_t);
> +        set_cell(&cells, 1, arg);

Shouldn't this be uint32_t given that it is 1 cell exactly?


> +        /* Set the vpci bus address */
> +        arg = addr_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, addr_cells , arg);
> +
> +        /* Set the cpu bus address where vpci address is mapped */
> +        set_cell(&cells, addr_cells, arg);
> +
> +        /* Set the vpci size requested */
> +        arg = size_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, size_cells,arg);
                                       ^ space


> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> +}
> +
>  static int make_root_properties(libxl__gc *gc,
>                                  const libxl_version_info *vers,
>                                  void *fdt)
> @@ -668,6 +720,57 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
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
> +    res = fdt_property_values(gc, fdt, "bus-range", 2, 0,17);
                                                            ^ space


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
> +    res = fdt_property_values(gc, fdt, "msi-map", 4, 0, GUEST_PHANDLE_ITS,
> +                              0, 0x10000);
> +    if (res) return res;

I agree with Julien that we shouldn't add it now if it is not working.

One question: what about legacy interrupts? If they are supported,
shouldn't we have interrupts and interrupt-parent properties?


> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>  static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                               const struct xc_dom_image *dom)
>  {
> @@ -971,6 +1074,9 @@ next_resize:
>          if (info->tee == LIBXL_TEE_TYPE_OPTEE)
>              FDT( make_optee_node(gc, fdt) );
>  
> +        if (libxl_defbool_val(info->arch_arm.vpci))
> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> +
>          if (pfdt)
>              FDT( copy_partial_fdt(gc, fdt, pfdt) );
>  
> @@ -1189,6 +1295,9 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
>  
> +    /* VPCI is disabled by default */
> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);
> +
>      if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>          return;
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
> index 0a9749e768..01d13e669e 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -426,6 +426,17 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>  #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>  
> +/* PCI-PCIe memory space types */
> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
> +
> +/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
> +#define GUEST_VPCI_PREFETCH_MEM_ADDR  xen_mk_ullong(0x900000000)
> +#define GUEST_VPCI_MEM_ADDR           xen_mk_ullong(0x20000000)
> +
> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x2000000000)
> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x04000000)

Now I get it: GUEST_VPCI_ECAM_BASE was just for the config space, not
the aperture. The apertures are starting at 0x20000000 and 0x900000000.

Speaking of which, isn't GUEST_VPCI_MEM_SIZE a bit too small? There
could be PCI devices with a <4GB requirement. Maybe 256MB?

