Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78168424B60
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 02:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203242.358320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYHbO-0000hB-M5; Thu, 07 Oct 2021 00:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203242.358320; Thu, 07 Oct 2021 00:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYHbO-0000fD-Iq; Thu, 07 Oct 2021 00:49:38 +0000
Received: by outflank-mailman (input) for mailman id 203242;
 Thu, 07 Oct 2021 00:49:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYHbM-0000f7-MG
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 00:49:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70a4e2f4-2708-11ec-bfb4-12813bfff9fa;
 Thu, 07 Oct 2021 00:49:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A85F560FD7;
 Thu,  7 Oct 2021 00:49:33 +0000 (UTC)
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
X-Inumbo-ID: 70a4e2f4-2708-11ec-bfb4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633567774;
	bh=TgQCipr1/6sCn/WvsLc2KCBd3gphPXHVqBPbySotee0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sl0CWTwPKIegIx+8eBUIPF3iknW07+b+AvNaCsM6oZncY0UPhuWR0I3Kzn7HWMInF
	 V8SfW4jW4rG7y41xSLO2+xvINeZ+faTkzaAQTlKJi0nCH4ZKBz8aflXUKeOLv1mnhF
	 XJQddiMRX5tJnP0p40BJDyMQZnSbjM4E+N/KuzygSs+oQB/xT0VNE1nYWlf8jdqAfa
	 /gflfJl2DZqlw38tfRrS5RJZdX+eUMEO45Fvge7vcaJwzAYoX2v50uoCCyQ7uSGb9x
	 GQFu64Do1YPM+fhSXNBhrIohKLHucQYzITxMYW4qdzS8NL6INiYf9xnUy7YRFrk19S
	 umCmm9N4Qm5RQ==
Date: Wed, 6 Oct 2021 17:49:33 -0700 (PDT)
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
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
In-Reply-To: <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2110061743300.3209@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
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
> for all guests.
> 
> As we add new field to the structure bump the interface version.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
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
> ---
>  tools/include/libxl.h            | 5 +++++
>  tools/libs/light/libxl_arm.c     | 2 ++
>  tools/libs/light/libxl_types.idl | 1 +
>  xen/arch/arm/domain.c            | 6 ++++++
>  xen/include/public/arch-arm.h    | 5 +++++
>  xen/include/public/domctl.h      | 2 +-
>  6 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d..33b4bfb 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -279,6 +279,11 @@
>  #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
>  
>  /*
> + * libxl_domain_build_info has the gpaddr_bits field.
> + */
> +#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_GPADDR_BITS 1
> +
> +/*
>   * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>   * 'soft reset' for domains and there is 'soft_reset' shutdown reason
>   * in enum libxl_shutdown_reason.
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..45e0386 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -123,6 +123,8 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>  
>      state->clock_frequency = config->arch.clock_frequency;
>  
> +    d_config->b_info.arch_arm.gpaddr_bits = config->arch.gpaddr_bits;
> +
>      return 0;
>  }
>  
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff6..39482db 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                 ("vuart", libxl_vuart_type),
> +                               ("gpaddr_bits", uint8),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                ])),
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756a..dfecc45 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -767,6 +767,12 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>          goto fail;
>  
> +    /*
> +     * Pass maximum IPA bits to the toolstack, currently the same guest
> +     * physical address space size is used for all guests.
> +     */
> +    config->arch.gpaddr_bits = p2m_ipa_bits;

This could also be set in arch_sanitise_domain_config together with
config->arch.gic_version. I prefer if it was done in
arch_sanitise_domain_config but also here is OK I think.

Given that everything else looks fine:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>      return 0;
>  
>  fail:
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 6b5a5f8..4a01f8b 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /*
> +     * OUT
> +     * Guest physical address space size
> +     */
> +    uint8_t gpaddr_bits;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3..f37586e 100644
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
> -- 
> 2.7.4
> 

