Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E6B34488
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093320.1448847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYWK-0005tZ-7b; Mon, 25 Aug 2025 14:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093320.1448847; Mon, 25 Aug 2025 14:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYWK-0005pc-4f; Mon, 25 Aug 2025 14:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1093320;
 Mon, 25 Aug 2025 14:50:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uqYWI-0005Xu-JK
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:50:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqYWG-005uli-21;
 Mon, 25 Aug 2025 14:50:00 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqYWG-000YQB-1g;
 Mon, 25 Aug 2025 14:50:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=IlVgVg9zvVUT9P78FdSg38eNH35hJkSfA6k/JPyPStM=; b=p92bwDFEnG3udS8n5hJe0wt2ft
	VZ/c5WiYC9X8S3C967fjNkJ1yqmI+1ixF9Av15vhatTU64p99AsAn5P383/rys2uNBdwHhgTxpVwW
	HFsprgr603XV+/l1qBd1zz6+yMFKVtpAaNJGqi9vGDZdGGQLlNpbIu8y8o4HFgO5Yxa4=;
Date: Mon, 25 Aug 2025 16:49:58 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
Message-ID: <aKx4FtlhAbXxtZlB@l14>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731192130.3948419-7-dmukhin@ford.com>

On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 5362fb0e9a6f..e1d012274eaf 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3032,14 +3032,17 @@ the domain was created.
>  This requires hardware compatibility with the requested version, either
>  natively or via hardware backwards compatibility support.
>  
> -=item B<vuart="uart">
> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>

This syntax here would inditace that `vuart` takes a list of items. You
could write instead:

    vuart="UART"

which seems more in line with the rest of the man page. Then you can add
some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
possible to also have a sublist, like the `tee` option have.


>  To enable vuart console, user must specify the following option in the
> -VM config file:
> +VM config file, e.g:
>  
> +```

This file isn't in markdown, it's in perlpod.

>  vuart = "sbsa_uart"
> +```
>  
> -Currently, only the "sbsa_uart" model is supported for ARM.
> +Currently, "sbsa_uart" (ARM) and "ns16550" (x86) are the only supported
> +UART models.
>  
>  =back
>  
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 4a19a8d22bdf..f4721b24763c 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -92,14 +92,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
>      int rc;
>  
> -    /*
> -     * If pl011 vuart is enabled then increment the nr_spis to allow allocation
> -     * of SPI VIRQ for pl011.
> -     */
> -    if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
> +    switch ( d_config->b_info.vuart )
> +    {
> +    case LIBXL_VUART_TYPE_SBSA_UART:
> +        /*
> +         * If pl011 vuart is enabled then increment the nr_spis to allow
> +         * allocation of SPI VIRQ for pl011.
> +         */
>          nr_spis += (GUEST_VPL011_SPI - 32) + 1;
>          vuart_irq = GUEST_VPL011_SPI;
>          vuart_enabled = true;
> +        break;
> +
> +    case LIBXL_VUART_TYPE_NS16550:
> +        LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuart);

This seems too late in libxl.  I think checking if the config value is
correct could be done in one of the *_setdefault() like many other
config check are done. There's
libxl__arch_domain_build_info_setdefault() that could be used.

> +        abort();
> +        break;
> +
> +    case LIBXL_VUART_TYPE_UNKNOWN:
> +    default:
> +        break;
>      }
>  
>      for (i = 0; i < d_config->num_disks; i++) {
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index fe251649f346..fd60c2b26764 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -276,6 +276,7 @@ libxl_checkpointed_stream = Enumeration("checkpointed_stream", [
>  libxl_vuart_type = Enumeration("vuart_type", [
>      (0, "unknown"),
>      (1, "sbsa_uart"),
> +    (2, "ns16550"),
>      ])
>  
>  libxl_vkb_backend = Enumeration("vkb_backend", [
> @@ -722,7 +723,6 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>  
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> -                               ("vuart", libxl_vuart_type),

arch_arm.vuart is part of libxl's API, it can't be removed. There's some
explanation about "libxl API compatibility" at the top of "libxl.h".
But for this change, you could add `vuart` to `arch_x86`, or if you want
to add `vuart` at the root like you did, you'll need to check that both
`arch_arm.vuart` and `vuart` aren't set at the same time, and have one
of the *_setdefault() function do the work of migrating the option.

You'll need also a LIBXL_HAVE_* macro in libxl.h, probably named
LIBXL_HAVE_VUART_NS16550.

>                                 ("sve_vl", libxl_sve_type),
>                                 ("nr_spis", uint32, {'init_val': 'LIBXL_NR_SPIS_DEFAULT'}),
>                                ])),
> @@ -739,6 +739,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>      ("vpmu", libxl_defbool),
>      ("trap_unmapped_accesses", libxl_defbool),
> +    ("vuart", libxl_vuart_type),
>  
>      ], dir=DIR_IN,
>         copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60d4e8661c93..0f039ca65a88 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -2,6 +2,45 @@
>  #include "libxl_arch.h"
>  #include <xen/arch-x86/cpuid.h>
>  
> +static void libxl__arch_domain_vuart_assert(
> +    libxl__gc *gc,
> +    libxl_domain_config *d_config,
> +    struct xen_domctl_createdomain *config)
> +{
> +    LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuart);
> +    abort();

The name of the function is wrong. It doens't assert anything, and just
abort...
I don't think this function is useful.

Also, don't abort() for configuration error, you need to return an error
instead.

> +}
> +
> +static void libxl__arch_domain_vuart_unsupported(
> +    libxl__gc *gc,
> +    libxl_domain_config *d_config,
> +    struct xen_domctl_createdomain *config)
> +{
> +    if ( d_config->b_info.vuart != LIBXL_VUART_TYPE_UNKNOWN )
> +        libxl__arch_domain_vuart_assert(gc, d_config, config);

This function have also a bad name, it doesn't check if a uart is
unsupported.

> +}
> +
> +static void libxl__arch_domain_vuart_enable(
> +    libxl__gc *gc,
> +    libxl_domain_config *d_config,
> +    struct xen_domctl_createdomain *config)
> +{
> +    switch ( d_config->b_info.vuart )
> +    {
> +    case LIBXL_VUART_TYPE_SBSA_UART:
> +        libxl__arch_domain_vuart_assert(gc, d_config, config);
> +        break;
> +
> +    case LIBXL_VUART_TYPE_NS16550:
> +        config->arch.emulation_flags |= XEN_X86_EMU_NS16550;
> +        break;
> +
> +    case LIBXL_VUART_TYPE_UNKNOWN:
> +    default:
> +        break;
> +    }
> +}
> +
>  int libxl__arch_domain_prepare_config(libxl__gc *gc,
>                                        libxl_domain_config *d_config,
>                                        struct xen_domctl_createdomain *config)
> @@ -9,14 +48,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
>          config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +        libxl__arch_domain_vuart_enable(gc, d_config, config);
>          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
>              config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
>          break;
>      case LIBXL_DOMAIN_TYPE_PVH:
>          config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
> +        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
>          break;
>      case LIBXL_DOMAIN_TYPE_PV:
>          config->arch.emulation_flags = 0;
> +        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
>          break;
>      default:
>          abort();

Thanks,

-- 
Anthony PERARD

