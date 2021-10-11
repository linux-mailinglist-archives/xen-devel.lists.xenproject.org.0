Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D44297E6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 22:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206549.362155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1U2-0006QS-92; Mon, 11 Oct 2021 20:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206549.362155; Mon, 11 Oct 2021 20:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1U2-0006OM-4u; Mon, 11 Oct 2021 20:01:14 +0000
Received: by outflank-mailman (input) for mailman id 206549;
 Mon, 11 Oct 2021 20:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma1U0-0006OC-MB
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 20:01:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fad2822e-2acd-11ec-80f4-12813bfff9fa;
 Mon, 11 Oct 2021 20:01:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF41960C40;
 Mon, 11 Oct 2021 20:01:09 +0000 (UTC)
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
X-Inumbo-ID: fad2822e-2acd-11ec-80f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633982470;
	bh=z8EHoqVn2Sjd6bgr7U+pfFNBL09N8RkT9cd6vV2089A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ie68kSqA5hsAGO08Jd7+GwzW11lICJ5VZmQy+m3b5HQAL719dTJJzrc0oKxB5XF1a
	 Waz0WKKk8VDez1fEJtGsiCOqL450s7R3eiLITtiyCipepFgF7LxNE9V7gSR4cecRHl
	 V9xy6kWwoSpU96tBAp0+lH8tkTlR1MqbMKOE59Rl/zMgZGjOr0xU/zPjO1OAf4F7EG
	 O/eYrPaecVBJCza52QLP+FSaBB1ogTXl+aIzb/xj/9bhRS3YPAk4dRNjYorlzMmzXB
	 p4dZxotfv+JN/JS8vRZ115PqVnhN2o0Gs/CsIDgs659XK4hrx6cSV8ha18sSEpeKr/
	 m58Eoa313km+A==
Date: Mon, 11 Oct 2021 13:01:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
In-Reply-To: <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2110111300160.25528@sstabellini-ThinkPad-T480s>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com> <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need to pass info about maximum supported guest physical
> address space size to the toolstack on Arm in order to properly
> calculate the base and size of the extended region (safe range)
> for the guest. The extended region is unused address space which
> could be safely used by domain for foreign/grant mappings on Arm.
> The extended region itself will be handled by the subsequent
> patch.
> 
> Currently the same guest physical address space size is used
> for all guests (p2m_ipa_bits variable on Arm, the x86 equivalent
> is hap_paddr_bits).
> 
> As we add new field to the structure bump the interface version.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

I couldn't spot any errors in this patch


> ---
> Changes RFC -> V2:
>    - update patch subject/description
>    - replace arch-specific sub-struct with common gpaddr_bits
>      field and update code to reflect that
> 
> Changes V2 -> V3:
>    - make the field uint8_t and add uint8_t pad[7] after
>    - remove leading blanks in libxl.h
> 
> Changes V3 -> V4:
>    - also print gpaddr_bits from output_physinfo()
>    - add Michal's R-b
> 
> Changes V4 -> V5:
>    - update patch subject and description
>    - drop Michal's R-b
>    - pass gpaddr_bits via createdomain domctl
>      (struct xen_arch_domainconfig)
> 
> Changes V5 -> V6:
>    - update patch subject and description
>    - pass gpaddr_bits via getdomaininfo domctl
>      (struct xen_domctl_getdomaininfo)
> ---
>  tools/include/libxl.h            | 8 ++++++++
>  tools/include/xenctrl.h          | 1 +
>  tools/libs/ctrl/xc_domain.c      | 1 +
>  tools/libs/light/libxl_domain.c  | 1 +
>  tools/libs/light/libxl_types.idl | 1 +
>  xen/arch/arm/domctl.c            | 2 ++
>  xen/arch/x86/domctl.c            | 1 +
>  xen/include/public/domctl.h      | 3 ++-
>  8 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d..deb5022 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -874,6 +874,14 @@ typedef struct libxl__ctx libxl_ctx;
>  #define LIBXL_HAVE_DOMINFO_NEVER_STOP 1
>  
>  /*
> + * LIBXL_HAVE_DOMINFO_GPADDR_BITS
> + *
> + * If this is defined, libxl_dominfo will contain an uint8 field called
> + * gpaddr_bits, containing the guest physical address space size.
> + */
> +#define LIBXL_HAVE_DOMINFO_GPADDR_BITS 1
> +
> +/*
>   * LIBXL_HAVE_QXL
>   *
>   * If defined, then the libxl_vga_interface_type will contain another value:
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index a306399..07b96e6 100644
> --- a/tools/include/xenctrl.h
> +++ b/ tools/include/xenctrl.h
> @@ -462,6 +462,7 @@ typedef struct xc_dominfo {
>      unsigned int  max_vcpu_id;
>      xen_domain_handle_t handle;
>      unsigned int  cpupool;
> +    uint8_t       gpaddr_bits;
>      struct xen_arch_domainconfig arch_config;
>  } xc_dominfo_t;
>  
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 23322b7..b155d6a 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -396,6 +396,7 @@ int xc_domain_getinfo(xc_interface *xch,
>          info->nr_online_vcpus = domctl.u.getdomaininfo.nr_online_vcpus;
>          info->max_vcpu_id = domctl.u.getdomaininfo.max_vcpu_id;
>          info->cpupool = domctl.u.getdomaininfo.cpupool;
> +        info->gpaddr_bits = domctl.u.getdomaininfo.gpaddr_bits;
>          info->arch_config = domctl.u.getdomaininfo.arch_config;
>  
>          memcpy(info->handle, domctl.u.getdomaininfo.handle,
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 51a6127..544a9bf 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -306,6 +306,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
>      xlinfo->vcpu_max_id = xcinfo->max_vcpu_id;
>      xlinfo->vcpu_online = xcinfo->nr_online_vcpus;
>      xlinfo->cpupool = xcinfo->cpupool;
> +    xlinfo->gpaddr_bits = xcinfo->gpaddr_bits;
>      xlinfo->domain_type = (xcinfo->flags & XEN_DOMINF_hvm_guest) ?
>          LIBXL_DOMAIN_TYPE_HVM : LIBXL_DOMAIN_TYPE_PV;
>  }
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff6..2df7258 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -357,6 +357,7 @@ libxl_dominfo = Struct("dominfo",[
>      ("vcpu_max_id", uint32),
>      ("vcpu_online", uint32),
>      ("cpupool",     uint32),
> +    ("gpaddr_bits", uint8),
>      ("domain_type", libxl_domain_type),
>      ], dir=DIR_OUT)
>  
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index b7d27f3..6245af6 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -20,6 +20,8 @@ void arch_get_domain_info(const struct domain *d,
>  {
>      /* All ARM domains use hardware assisted paging. */
>      info->flags |= XEN_DOMINF_hap;
> +
> +    info->gpaddr_bits = p2m_ipa_bits;
>  }
>  
>  static int handle_vuart_init(struct domain *d, 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 26a76d2..7d102e0 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -151,6 +151,7 @@ void arch_get_domain_info(const struct domain *d,
>          info->flags |= XEN_DOMINF_hap;
>  
>      info->arch_config.emulation_flags = d->arch.emulation_flags;
> +    info->gpaddr_bits = hap_paddr_bits;
>  }
>  
>  static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 4cb3f66..b93f776 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
>  
>  /*
>   * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> @@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
>      uint32_t ssidref;
>      xen_domain_handle_t handle;
>      uint32_t cpupool;
> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
>      struct xen_arch_domainconfig arch_config;
>  };
>  typedef struct xen_domctl_getdomaininfo xen_domctl_getdomaininfo_t;
> -- 
> 2.7.4
> 

