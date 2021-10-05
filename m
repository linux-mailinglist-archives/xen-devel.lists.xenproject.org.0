Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FCA4232DF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 23:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202514.357474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXs38-0000Sf-VP; Tue, 05 Oct 2021 21:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202514.357474; Tue, 05 Oct 2021 21:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXs38-0000Qs-RX; Tue, 05 Oct 2021 21:32:34 +0000
Received: by outflank-mailman (input) for mailman id 202514;
 Tue, 05 Oct 2021 21:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXs36-0000Qm-U0
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 21:32:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f991b6dd-4581-4b6a-9b77-50f808c71843;
 Tue, 05 Oct 2021 21:32:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14621615A3;
 Tue,  5 Oct 2021 21:32:30 +0000 (UTC)
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
X-Inumbo-ID: f991b6dd-4581-4b6a-9b77-50f808c71843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633469550;
	bh=YlbJnHM0xHsD+C0FOzHJtNg4oAskEUCDbj81em40Ogs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DCMEd63StdbdYATxvpl1yM4ojvZFjlvKapMP6+1lqvYVi1sphgeAI1cxVbB79yyaT
	 6y+b7OBvzBEeGqgai4pdAv7nMrebOHBrO314bS2owcuNuAoRsr8kvIn5Zd6zrek+7i
	 jcWqAc2v6eXEWOQ4UMjeCGjzBWBbipJjgunhJkIMZz+00h6F4EHF1AaXJwtERNK7M0
	 +r23rV3Pgp+Lrkyyw55UEFJeUvtP9M5d4IBhPiAyYSsPvXlGhym9ODP0DMR3ynqK+D
	 FH3Xy5bcB2ObNJmLUqhn8Ic7ebV9YMBiCwo8VvpsGsqEsKSc2JOBshawU9aDyE76y1
	 IT5Cp5UbBETjg==
Date: Tue, 5 Oct 2021 14:32:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andre Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
Message-ID: <alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
References: <cover.1633340795.git.rahul.singh@arm.com> <3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com> <alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s> <11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1025287936-1633468972=:3209"
Content-ID: <alpine.DEB.2.21.2110051423510.3209@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1025287936-1633468972=:3209
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110051423511.3209@sstabellini-ThinkPad-T480s>

On Tue, 5 Oct 2021, Rahul Singh wrote:
> > On 5 Oct 2021, at 1:38 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 4 Oct 2021, Rahul Singh wrote:
> >> libxl will create an emulated PCI device tree node in the device tree to
> >> enable the guest OS to discover the virtual PCI during guest boot.
> >> Emulated PCI device tree node will only be created when there is any
> >> device assigned to guest.
> >> 
> >> A new area has been reserved in the arm guest physical map at
> >> which the VPCI bus is declared in the device tree (reg and ranges
> >> parameters of the node).
> >> 
> >> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >> ---
> >> Change in v4:
> >> - Gate code for x86 for setting the XEN_DOMCTL_CDF_vpci for x86.
> >> Change in v3:
> >> - Make GUEST_VPCI_MEM_ADDR address 2MB aligned
> >> Change in v2:
> >> - enable doamin_vpci_init() when XEN_DOMCTL_CDF_vpci is set for domain.
> >> ---
> >> ---
> >> tools/include/libxl.h            |   6 ++
> >> tools/libs/light/libxl_arm.c     | 105 +++++++++++++++++++++++++++++++
> >> tools/libs/light/libxl_create.c  |   9 +++
> >> tools/libs/light/libxl_types.idl |   1 +
> >> tools/xl/xl_parse.c              |   8 +++
> >> xen/include/public/arch-arm.h    |  10 +++
> >> 6 files changed, 139 insertions(+)
> >> 
> >> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> >> index b9ba16d698..3362073b21 100644
> >> --- a/tools/include/libxl.h
> >> +++ b/tools/include/libxl.h
> >> @@ -358,6 +358,12 @@
> >>  */
> >> #define LIBXL_HAVE_BUILDINFO_ARM_VUART 1
> >> 
> >> +/*
> >> + * LIBXL_HAVE_BUILDINFO_ARM_VPCI indicates that the toolstack supports virtual
> >> + * PCI for ARM.
> >> + */
> >> +#define LIBXL_HAVE_BUILDINFO_ARM_VPCI 1
> >> +
> >> /*
> >>  * LIBXL_HAVE_BUILDINFO_GRANT_LIMITS indicates that libxl_domain_build_info
> >>  * has the max_grant_frames and max_maptrack_frames fields.
> >> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> >> index e3140a6e00..52f1ddce48 100644
> >> --- a/tools/libs/light/libxl_arm.c
> >> +++ b/tools/libs/light/libxl_arm.c
> >> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
> >>     return fdt_property(fdt, "reg", regs, sizeof(regs));
> >> }
> >> 
> >> +static int fdt_property_values(libxl__gc *gc, void *fdt,
> >> +        const char *name, unsigned num_cells, ...)
> >> +{
> >> +    uint32_t prop[num_cells];
> >> +    be32 *cells = &prop[0];
> >> +    int i;
> >> +    va_list ap;
> >> +    uint32_t arg;
> >> +
> >> +    va_start(ap, num_cells);
> >> +    for (i = 0 ; i < num_cells; i++) {
> >> +        arg = va_arg(ap, uint32_t);
> >> +        set_cell(&cells, 1, arg);
> >> +    }
> >> +    va_end(ap);
> >> +
> >> +    return fdt_property(fdt, name, prop, sizeof(prop));
> >> +}
> >> +
> >> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
> >> +                                    unsigned addr_cells,
> >> +                                    unsigned size_cells,
> >> +                                    unsigned num_regs, ...)
> >> +{
> >> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
> >> +    be32 *cells = &regs[0];
> >> +    int i;
> >> +    va_list ap;
> >> +    uint64_t arg;
> >> +
> >> +    va_start(ap, num_regs);
> >> +    for (i = 0 ; i < num_regs; i++) {
> >> +        /* Set the memory bit field */
> >> +        arg = va_arg(ap, uint32_t);
> >> +        set_cell(&cells, 1, arg);
> >> +
> >> +        /* Set the vpci bus address */
> >> +        arg = addr_cells ? va_arg(ap, uint64_t) : 0;
> >> +        set_cell(&cells, addr_cells , arg);
> >> +
> >> +        /* Set the cpu bus address where vpci address is mapped */
> >> +        set_cell(&cells, addr_cells, arg);
> >> +
> >> +        /* Set the vpci size requested */
> >> +        arg = size_cells ? va_arg(ap, uint64_t) : 0;
> >> +        set_cell(&cells, size_cells, arg);
> >> +    }
> >> +    va_end(ap);
> >> +
> >> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> >> +}
> >> +
> >> static int make_root_properties(libxl__gc *gc,
> >>                                 const libxl_version_info *vers,
> >>                                 void *fdt)
> >> @@ -668,6 +720,53 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
> >>     return 0;
> >> }
> >> 
> >> +static int make_vpci_node(libxl__gc *gc, void *fdt,
> >> +        const struct arch_info *ainfo,
> >> +        struct xc_dom_image *dom)
> >> +{
> >> +    int res;
> >> +    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
> >> +    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
> >> +    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
> >> +
> >> +    res = fdt_begin_node(fdt, name);
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_string(fdt, "device_type", "pci");
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> >> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_values(gc, fdt, "bus-range", 2, 0, 255);
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_string(fdt, "status", "okay");
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> >> +        GUEST_ROOT_SIZE_CELLS, 2,
> >> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_SIZE,
> >> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR,
> >> +        GUEST_VPCI_PREFETCH_MEM_SIZE);
> >> +    if (res) return res;
> >> +
> >> +    res = fdt_end_node(fdt);
> >> +    if (res) return res;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> static const struct arch_info *get_arch_info(libxl__gc *gc,
> >>                                              const struct xc_dom_image *dom)
> >> {
> >> @@ -971,6 +1070,9 @@ next_resize:
> >>         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
> >>             FDT( make_optee_node(gc, fdt) );
> >> 
> >> +        if (libxl_defbool_val(info->arch_arm.vpci))
> >> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> >> +
> >>         if (pfdt)
> >>             FDT( copy_partial_fdt(gc, fdt, pfdt) );
> >> 
> >> @@ -1189,6 +1291,9 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> >>     /* ACPI is disabled by default */
> >>     libxl_defbool_setdefault(&b_info->acpi, false);
> >> 
> >> +    /* VPCI is disabled by default */
> >> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);
> >> +
> >>     if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
> >>         return;
> >> 
> >> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> >> index e356b2106d..9408526036 100644
> >> --- a/tools/libs/light/libxl_create.c
> >> +++ b/tools/libs/light/libxl_create.c
> >> @@ -632,6 +632,15 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >>         if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
> >>             create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
> >> 
> >> +#if defined(__arm__) || defined(__aarch64__)
> >> +        /*
> >> +         * Enable VPCI support for ARM. VPCI support for DOMU guest is not
> >> +         * supported for x86.
> >> +         */
> >> +        if ( libxl_defbool_val(b_info->arch_arm.vpci) )
> >> +            create.flags |= XEN_DOMCTL_CDF_vpci;
> >> +#endif
> > 
> > I don't think the #ifdef is required, is it? The check is based on
> > b_info->arch_arm.vpci which is already ARM-specific and couldn't be
> > enabled on X86. We have another similar check in libxl_create.c for
> > d_config->b_info.arch_arm.vuart without #ifdef.
> > 
> > My suggestion would be to just keep the in-code comment, but leave the
> > libxl_defbool_val check as it was before.
> > 
> 
> I also thought the same way that "b_info->arch_arm.vpci|" is arm-specific but somehow it is getting enabled for x86 
> when we assign the PCI device to DOMU guests on x86 PV DOM0 once I remove the #ifdef for below code.
> 
> #if defined(__arm__) || defined(__aarch64__)                   
>     /*                                    
>      * Enable VPCI support for ARM. VPCI support for DOMU guests is not    
>      * supported for x86.                          
>      */                                   
>     if (d_config->num_pcidevs)                        
>       libxl_defbool_set(&b_info->arch_arm.vpci, true);           
> #endif 
> 
> Error on x86:
> Parsing config from guest.cfg
> (XEN) domain.c:667: vPCI cannot be enabled yet
> libxl: error: libxl_create.c:683:libxl__domain_make: domain creation fail: Invalid argument
> libxl: error: libxl_create.c:1237:initiate_domain_create: cannot make domain: -3
> 
> One solution is we can remove the #ifdef from the below code when checking if vpci is enabled…
> #if defined(__arm__) || defined(__aarch64__)                   
>     /*                                    
>      * Enable VPCI support for ARM. VPCI support for DOMU guests is not    
>      * supported for x86.                          
>      */                                   
>     if ( libxl_defbool_val(b_info->arch_arm.vpci) )             
>       create.flags |= XEN_DOMCTL_CDF_vpci;                 
> #endif
> 
> ..but not from here when setting the arch_arm.vpci when we assign the PCI device to the guest.
> 
> #if defined(__arm__) || defined(__aarch64__)                  
>     /*                                    
>      * Enable VPCI support for ARM. VPCI support for DOMU guests is not    
>      * supported for x86.                          
>      */                                   
>     if (d_config->num_pcidevs)                        
>       libxl_defbool_set(&b_info->arch_arm.vpci, true);           
> #endif 
> 
> 
> Also if I remove #ifdef as mention above I need to move the 
>        "libxl_defbool_setdefault(&b_info->arch_arm.vpci, false); “ 
> from 
>        libxl__arch_domain_build_info_setdefault(..) 
> to common code 
>        libxl__domain_build_info_setdefault(..) to avoid error on x86.
> 
> Error on x86:
> root@dom0:~# xl create -c guest.cfg
> Parsing config from guest.cfg
> xl: libxl.c:337: libxl_defbool_val: Assertion `!libxl_defbool_is_default(db)' failed.
> Aborted

As far as I can tell, the #ifdef in libxl_create.c can be removed by
doing:

        if ( libxl_defbool_val(b_info->arch_arm.vpci) > 0 )
            create.flags |= XEN_DOMCTL_CDF_vpci;

because we need to check for LIBXL__DEFBOOL_TRUE, which is > 0, right?
And vpci should never be set on x86. arch_arm.vpci should be initialized
to zero on x86 which is LIBXL__DEFBOOL_DEFAULT. That should work.


On the other hand you are right that the #ifdef in tools/xl/xl_parse.c
cannot just be removed because otherwise b_info->arch_arm.vpci gets set
on x86, which obviously we don't want.
--8323329-1025287936-1633468972=:3209--

