Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41C62D107
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 03:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444479.699744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovUOb-0006IT-28; Thu, 17 Nov 2022 02:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444479.699744; Thu, 17 Nov 2022 02:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovUOa-0006FC-V5; Thu, 17 Nov 2022 02:12:52 +0000
Received: by outflank-mailman (input) for mailman id 444479;
 Thu, 17 Nov 2022 02:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ovUOZ-0006F6-TR
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 02:12:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5515d5be-661d-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 03:12:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 38CC8CE1D30;
 Thu, 17 Nov 2022 02:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F689C433D7;
 Thu, 17 Nov 2022 02:12:44 +0000 (UTC)
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
X-Inumbo-ID: 5515d5be-661d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668651165;
	bh=hBdHoivtfVVeSZj8hyq3nxHJX6wKOCcBqdQ9kS6B7ug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vOtOjgcmBr7VHnpnTOiLhJZUwSkO7xKHdtaperUewh6IGcYrEGa18YHx8C1lgGlcu
	 dsCNpqgVk72PiyzEO/DgYQeTaBjKGoPqTPBi2BJXdVWxhbv5+JSh2jQB9SQ98MAwrv
	 Npf9PlqXBJTBJgf+K6dwFr2XKfpTwF3UEvQW2WwL2+hQfk1OHRfKM3MT8iVr4hVuJV
	 npSWYtIFnBsRDT6imnU7HEQOKG9c5TvS28o24J8/YSIkgvGPk8fdhJ0z/HAZw+dYjH
	 vTDwd/3pFwgYSm7lNF7YzU8aceWFHFfNklixkkEoZgIJ3HAsV2Gcodb0fdR3egNd6g
	 fM33pwnwHhEgg==
Date: Wed, 16 Nov 2022 18:12:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use
 p2m mempool hypercalls
In-Reply-To: <20221117010804.9384-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2211161812350.4020@ubuntu-linux-20-04-desktop>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com> <20221117010804.9384-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1008032645-1668651165=:4020"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1008032645-1668651165=:4020
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 17 Nov 2022, Andrew Cooper wrote:
> This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
> of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
> 
> First of all, with ARM borrowing x86's implementation, the logic to set the
> pool size should have been common, not duplicated.  Introduce
> libxl__domain_set_p2m_pool_size() as a shared implementation, and use it from
> the ARM and x86 paths.  It is left as an exercise to the reader to judge how
> libxl/xl can reasonably function without the ability to query the pool size...
> 
> Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
> replaced with a working and unit tested interface.
> 
> This is part of XSA-409 / CVE-2022-33747.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> 
> v2:
>  * s/p2m/paging/
>  * Fix get/set typo in libxl__domain_set_p2m_pool_size()
> ---
>  tools/libs/light/libxl_arm.c      | 14 +----------
>  tools/libs/light/libxl_dom.c      | 19 ++++++++++++++
>  tools/libs/light/libxl_internal.h |  3 +++
>  tools/libs/light/libxl_x86.c      | 15 ++---------
>  xen/arch/arm/domctl.c             | 53 ---------------------------------------
>  xen/arch/arm/include/asm/p2m.h    |  1 -
>  xen/arch/arm/p2m.c                |  8 ------
>  7 files changed, 25 insertions(+), 88 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 2a5e93c28403..2f5615263543 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -209,19 +209,7 @@ int libxl__arch_domain_create(libxl__gc *gc,
>                                libxl__domain_build_state *state,
>                                uint32_t domid)
>  {
> -    libxl_ctx *ctx = libxl__gc_owner(gc);
> -    unsigned int shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb, 1024);
> -
> -    int r = xc_shadow_control(ctx->xch, domid,
> -                              XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> -                              &shadow_mb, 0);
> -    if (r) {
> -        LOGED(ERROR, domid,
> -              "Failed to set %u MiB shadow allocation", shadow_mb);
> -        return ERROR_FAIL;
> -    }
> -
> -    return 0;
> +    return libxl__domain_set_p2m_pool_size(gc, d_config, domid);
>  }
>  
>  int libxl__arch_extra_memory(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c4f..f8f7b7e81837 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -1448,6 +1448,25 @@ int libxl_userdata_unlink(libxl_ctx *ctx, uint32_t domid,
>      return rc;
>  }
>  
> +int libxl__domain_set_p2m_pool_size(
> +    libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid)
> +{
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +    uint64_t shadow_mem;
> +
> +    shadow_mem = d_config->b_info.shadow_memkb;
> +    shadow_mem <<= 10;
> +
> +    int r = xc_set_paging_mempool_size(ctx->xch, domid, shadow_mem);
> +    if (r) {
> +        LOGED(ERROR, domid,
> +              "Failed to set paging mempool size to %"PRIu64"kB", shadow_mem);
> +        return ERROR_FAIL;
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index cb9e8b3b8b5a..f31164bc6c0d 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -4864,6 +4864,9 @@ int libxl__is_domid_recent(libxl__gc *gc, uint32_t domid, bool *recent);
>  /* os-specific implementation of setresuid() */
>  int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
>  
> +_hidden int libxl__domain_set_p2m_pool_size(
> +    libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid);
> +
>  #endif
>  
>  /*
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 7c5ee74443e5..99aba51d05df 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -538,20 +538,9 @@ int libxl__arch_domain_create(libxl__gc *gc,
>          xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
>  
>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
> -        unsigned int shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
> -                                             1024);
> -        int r = xc_shadow_control(ctx->xch, domid,
> -                                  XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> -                                  &shadow_mb, 0);
> -
> -        if (r) {
> -            LOGED(ERROR, domid,
> -                  "Failed to set %u MiB %s allocation",
> -                  shadow_mb,
> -                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow");
> -            ret = ERROR_FAIL;
> +        ret = libxl__domain_set_p2m_pool_size(gc, d_config, domid);
> +        if (ret)
>              goto out;
> -        }
>      }
>  
>      if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_PV &&
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index c8fdeb124084..1baf25c3d98b 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -47,64 +47,11 @@ static int handle_vuart_init(struct domain *d,
>      return rc;
>  }
>  
> -static long p2m_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
> -                       XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> -{
> -    long rc;
> -    bool preempted = false;
> -
> -    if ( unlikely(d == current->domain) )
> -    {
> -        printk(XENLOG_ERR "Tried to do a p2m domctl op on itself.\n");
> -        return -EINVAL;
> -    }
> -
> -    if ( unlikely(d->is_dying) )
> -    {
> -        printk(XENLOG_ERR "Tried to do a p2m domctl op on dying domain %u\n",
> -               d->domain_id);
> -        return -EINVAL;
> -    }
> -
> -    switch ( sc->op )
> -    {
> -    case XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION:
> -    {
> -        /* Allow and handle preemption */
> -        spin_lock(&d->arch.paging.lock);
> -        rc = p2m_set_allocation(d, sc->mb << (20 - PAGE_SHIFT), &preempted);
> -        spin_unlock(&d->arch.paging.lock);
> -
> -        if ( preempted )
> -            /* Not finished. Set up to re-run the call. */
> -            rc = hypercall_create_continuation(__HYPERVISOR_domctl, "h",
> -                                               u_domctl);
> -        else
> -            /* Finished. Return the new allocation. */
> -            sc->mb = p2m_get_allocation(d);
> -
> -        return rc;
> -    }
> -    case XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION:
> -    {
> -        sc->mb = p2m_get_allocation(d);
> -        return 0;
> -    }
> -    default:
> -    {
> -        printk(XENLOG_ERR "Bad p2m domctl op %u\n", sc->op);
> -        return -EINVAL;
> -    }
> -    }
> -}
> -
>  long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>                      XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  {
>      switch ( domctl->cmd )
>      {
> -    case XEN_DOMCTL_shadow_op:
> -        return p2m_domctl(d, &domctl->u.shadow_op, u_domctl);
>      case XEN_DOMCTL_cacheflush:
>      {
>          gfn_t s = _gfn(domctl->u.cacheflush.start_pfn);
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index c8f14d13c2c5..91df922e1c9f 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -222,7 +222,6 @@ void p2m_restore_state(struct vcpu *n);
>  /* Print debugging/statistial info about a domain's p2m */
>  void p2m_dump_info(struct domain *d);
>  
> -unsigned int p2m_get_allocation(struct domain *d);
>  int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
>  int p2m_teardown_allocation(struct domain *d);
>  
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 8c1972e58227..b2f7e8d804aa 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -92,14 +92,6 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
>      spin_unlock(&d->arch.paging.lock);
>  }
>  
> -/* Return the size of the pool, rounded up to the nearest MB */
> -unsigned int p2m_get_allocation(struct domain *d)
> -{
> -    unsigned long nr_pages = ACCESS_ONCE(d->arch.paging.p2m_total_pages);
> -
> -    return ROUNDUP(nr_pages, 1 << (20 - PAGE_SHIFT)) >> (20 - PAGE_SHIFT);
> -}
> -
>  /* Return the size of the pool, in bytes. */
>  int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>  {
> -- 
> 2.11.0
> 
--8323329-1008032645-1668651165=:4020--

