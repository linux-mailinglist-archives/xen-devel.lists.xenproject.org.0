Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA562D103
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 03:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444475.699732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovUKq-0004Y0-FG; Thu, 17 Nov 2022 02:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444475.699732; Thu, 17 Nov 2022 02:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovUKq-0004W4-9k; Thu, 17 Nov 2022 02:09:00 +0000
Received: by outflank-mailman (input) for mailman id 444475;
 Thu, 17 Nov 2022 02:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ovUKo-0004Vf-5d
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 02:08:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9368a22-661c-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 03:08:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75D3762056;
 Thu, 17 Nov 2022 02:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB05C433C1;
 Thu, 17 Nov 2022 02:08:51 +0000 (UTC)
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
X-Inumbo-ID: c9368a22-661c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668650932;
	bh=E5J2oCWjL5upj0kxVy125vURFslPgRDuNAy1T7C5oRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DaSUxyjuCFxtwYQ/ijAcWveF/H+lUQvJu+puOMNQbLcR8eA55WBkEU9iR4T/KJ9wR
	 LajliDDwSsA6qSTnjNANBT8k/DpKHYxdaLyZEMexYZJuoohQc/vHVxycHESzzMZok8
	 dzcPKL/YBUF4TN5C7g2etsb7Qd/7q+R109nCJDGxsuHHT/Lo+oOIe1MZS0H8dBU/UR
	 ITI4QfaEW952J1voamoDg1bZ8OwIwVVmK/gWfSz15yQ8kFnT5cQ053cLVx0+Am+/3V
	 +jh5gASC9ZKFo4TVUIspFRTH5CMnDwaYwFoR0vMlkm77yYHsZgEENJjrE5paPo9VZr
	 Kk8AdIsJGWObQ==
Date: Wed, 16 Nov 2022 18:08:49 -0800 (PST)
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
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the paging
 mempool size
In-Reply-To: <20221117010804.9384-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2211161808390.4020@ubuntu-linux-20-04-desktop>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com> <20221117010804.9384-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-872934346-1668650932=:4020"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-872934346-1668650932=:4020
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 17 Nov 2022, Andrew Cooper wrote:
> The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:
> 
>  * All set_allocation() flavours have an overflow-before-widen bug when
>    calculating "sc->mb << (20 - PAGE_SHIFT)".
>  * All flavours have a granularity of 1M.  This was tolerable when the size of
>    the pool could only be set at the same granularity, but is broken now that
>    ARM has a 16-page stopgap allocation in use.
>  * All get_allocation() flavours round up, and in particular turn 0 into 1,
>    meaning the get op returns junk before a successful set op.
>  * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
>    despite the pool size being a domain property.
>  * Even the hypercall names are long-obsolete.
> 
> Implement a better interface, which can be first used to unit test the
> behaviour, and subsequently correct a broken implementation.  The old
> interface will be retired in due course.
> 
> The unit of bytes (as opposed pages) is a deliberate API/ABI improvement to
> more easily support multiple page granularities.
> 
> This is part of XSA-409 / CVE-2022-33747.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

ARM side:

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
>  * Fix overflow-before-widen in ARM's arch_get_p2m_mempool_size()
>  * Fix overflow-before-widen in both {hap,shadow}_get_allocation_bytes()
>  * Leave a TODO about x86/PV, drop assertion.
>  * Check for long->int truncation in x86's arch_set_paging_mempool_size()
> 
> Future TODOs:
>  * x86 shadow still rounds up.  This is buggy as it's a simultaneous equation
>    with tot_pages which varies over time with ballooning.
>  * x86 PV is weird.  There are no toolstack interact with the shadow pool
>    size, but the "shadow" pool it does come into existence when logdirty (or
>    pv-l1tf) when first enabled.
>  * The shadow+hap logic is in desperate need of deduping.
> ---
>  tools/include/xenctrl.h           |  3 +++
>  tools/libs/ctrl/xc_domain.c       | 29 ++++++++++++++++++++++++++
>  xen/arch/arm/p2m.c                | 26 +++++++++++++++++++++++
>  xen/arch/x86/include/asm/hap.h    |  1 +
>  xen/arch/x86/include/asm/shadow.h |  4 ++++
>  xen/arch/x86/mm/hap/hap.c         | 11 ++++++++++
>  xen/arch/x86/mm/paging.c          | 43 +++++++++++++++++++++++++++++++++++++++
>  xen/arch/x86/mm/shadow/common.c   | 11 ++++++++++
>  xen/common/domctl.c               | 14 +++++++++++++
>  xen/include/public/domctl.h       | 24 +++++++++++++++++++++-
>  xen/include/xen/domain.h          |  3 +++
>  11 files changed, 168 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 0c8b4c3aa7a5..23037874d3d5 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -893,6 +893,9 @@ long long xc_logdirty_control(xc_interface *xch,
>                                unsigned int mode,
>                                xc_shadow_op_stats_t *stats);
>  
> +int xc_get_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t *size);
> +int xc_set_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t size);
> +
>  int xc_sched_credit_domain_set(xc_interface *xch,
>                                 uint32_t domid,
>                                 struct xen_domctl_sched_credit *sdom);
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 14c0420c35be..e939d0715739 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -706,6 +706,35 @@ long long xc_logdirty_control(xc_interface *xch,
>      return (rc == 0) ? domctl.u.shadow_op.pages : rc;
>  }
>  
> +int xc_get_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t *size)
> +{
> +    int rc;
> +    struct xen_domctl domctl = {
> +        .cmd         = XEN_DOMCTL_get_paging_mempool_size,
> +        .domain      = domid,
> +    };
> +
> +    rc = do_domctl(xch, &domctl);
> +    if ( rc )
> +        return rc;
> +
> +    *size = domctl.u.paging_mempool.size;
> +    return 0;
> +}
> +
> +int xc_set_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t size)
> +{
> +    struct xen_domctl domctl = {
> +        .cmd         = XEN_DOMCTL_set_paging_mempool_size,
> +        .domain      = domid,
> +        .u.paging_mempool = {
> +            .size = size,
> +        },
> +    };
> +
> +    return do_domctl(xch, &domctl);
> +}
> +
>  int xc_domain_setmaxmem(xc_interface *xch,
>                          uint32_t domid,
>                          uint64_t max_memkb)
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 94d3b60b1387..8c1972e58227 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -100,6 +100,13 @@ unsigned int p2m_get_allocation(struct domain *d)
>      return ROUNDUP(nr_pages, 1 << (20 - PAGE_SHIFT)) >> (20 - PAGE_SHIFT);
>  }
>  
> +/* Return the size of the pool, in bytes. */
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    *size = (uint64_t)ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;
> +    return 0;
> +}
> +
>  /*
>   * Set the pool of pages to the required number of pages.
>   * Returns 0 for success, non-zero for failure.
> @@ -157,6 +164,25 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>      return 0;
>  }
>  
> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = size >> PAGE_SHIFT;
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
> +         pages != (size >> PAGE_SHIFT) ) /* 32-bit overflow? */
> +        return -EINVAL;
> +
> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, pages, &preempted);
> +    spin_unlock(&d->arch.paging.lock);
> +
> +    ASSERT(preempted == (rc == -ERESTART));
> +
> +    return rc;
> +}
> +
>  int p2m_teardown_allocation(struct domain *d)
>  {
>      int ret = 0;
> diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
> index 90dece29deca..14d2f212dab9 100644
> --- a/xen/arch/x86/include/asm/hap.h
> +++ b/xen/arch/x86/include/asm/hap.h
> @@ -47,6 +47,7 @@ int   hap_track_dirty_vram(struct domain *d,
>  extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
>  int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
>  unsigned int hap_get_allocation(struct domain *d);
> +int hap_get_allocation_bytes(struct domain *d, uint64_t *size);
>  
>  #endif /* XEN_HAP_H */
>  
> diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
> index 1365fe480518..dad876d29499 100644
> --- a/xen/arch/x86/include/asm/shadow.h
> +++ b/xen/arch/x86/include/asm/shadow.h
> @@ -97,6 +97,8 @@ void shadow_blow_tables_per_domain(struct domain *d);
>  int shadow_set_allocation(struct domain *d, unsigned int pages,
>                            bool *preempted);
>  
> +int shadow_get_allocation_bytes(struct domain *d, uint64_t *size);
> +
>  #else /* !CONFIG_SHADOW_PAGING */
>  
>  #define shadow_vcpu_teardown(v) ASSERT(is_pv_vcpu(v))
> @@ -108,6 +110,8 @@ int shadow_set_allocation(struct domain *d, unsigned int pages,
>      ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
>  #define shadow_set_allocation(d, pages, preempted) \
>      ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
> +#define shadow_get_allocation_bytes(d, size) \
> +    ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
>  
>  static inline void sh_remove_shadows(struct domain *d, mfn_t gmfn,
>                                       int fast, int all) {}
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index f809ea9aa6ae..0fc1b1d9aced 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -345,6 +345,17 @@ unsigned int hap_get_allocation(struct domain *d)
>              + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
>  }
>  
> +int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
> +{
> +    unsigned long pages = d->arch.paging.hap.total_pages;
> +
> +    pages += d->arch.paging.hap.p2m_pages;
> +
> +    *size = pages << PAGE_SHIFT;
> +
> +    return 0;
> +}
> +
>  /* Set the pool of pages to the required number of pages.
>   * Returns 0 for success, non-zero for failure. */
>  int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> index 3a355eee9ca3..8d579fa9a3e8 100644
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -977,6 +977,49 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
>  }
>  #endif
>  
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    int rc;
> +
> +    if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
> +        return -EOPNOTSUPP;
> +
> +    if ( hap_enabled(d) )
> +        rc = hap_get_allocation_bytes(d, size);
> +    else
> +        rc = shadow_get_allocation_bytes(d, size);
> +
> +    return rc;
> +}
> +
> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = size >> PAGE_SHIFT;
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
> +        return -EOPNOTSUPP;
> +
> +    if ( size & ~PAGE_MASK ||              /* Non page-sized request? */
> +         pages != (unsigned int)pages )    /* Overflow $X_set_allocation()? */
> +        return -EINVAL;
> +
> +    paging_lock(d);
> +    if ( hap_enabled(d) )
> +        rc = hap_set_allocation(d, pages, &preempted);
> +    else
> +        rc = shadow_set_allocation(d, pages, &preempted);
> +    paging_unlock(d);
> +
> +    /*
> +     * TODO: Adjust $X_set_allocation() so this is true.
> +    ASSERT(preempted == (rc == -ERESTART));
> +     */
> +
> +    return preempted ? -ERESTART : rc;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
> index badfd53c6b23..a8404f97f668 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1427,6 +1427,17 @@ static unsigned int shadow_get_allocation(struct domain *d)
>              + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
>  }
>  
> +int shadow_get_allocation_bytes(struct domain *d, uint64_t *size)
> +{
> +    unsigned long pages = d->arch.paging.shadow.total_pages;
> +
> +    pages += d->arch.paging.shadow.p2m_pages;
> +
> +    *size = pages << PAGE_SHIFT;
> +
> +    return 0;
> +}
> +
>  /**************************************************************************/
>  /* Hash table for storing the guest->shadow mappings.
>   * The table itself is an array of pointers to shadows; the shadows are then
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 69fb9abd346f..ad71ad8a4cc5 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -874,6 +874,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          ret = iommu_do_domctl(op, d, u_domctl);
>          break;
>  
> +    case XEN_DOMCTL_get_paging_mempool_size:
> +        ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
> +        if ( !ret )
> +            copyback = 1;
> +        break;
> +
> +    case XEN_DOMCTL_set_paging_mempool_size:
> +        ret = arch_set_paging_mempool_size(d, op->u.paging_mempool.size);
> +
> +        if ( ret == -ERESTART )
> +            ret = hypercall_create_continuation(
> +                __HYPERVISOR_domctl, "h", u_domctl);
> +        break;
> +
>      default:
>          ret = arch_do_domctl(op, d, u_domctl);
>          break;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b2ae839c3632..d4072761791a 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -214,7 +214,10 @@ struct xen_domctl_getpageframeinfo3 {
>   /* Return the bitmap but do not modify internal copy. */
>  #define XEN_DOMCTL_SHADOW_OP_PEEK        12
>  
> -/* Memory allocation accessors. */
> +/*
> + * Memory allocation accessors.  These APIs are broken and will be removed.
> + * Use XEN_DOMCTL_{get,set}_paging_mempool_size instead.
> + */
>  #define XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION   30
>  #define XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION   31
>  
> @@ -946,6 +949,22 @@ struct xen_domctl_cacheflush {
>      xen_pfn_t start_pfn, nr_pfns;
>  };
>  
> +/*
> + * XEN_DOMCTL_get_paging_mempool_size / XEN_DOMCTL_set_paging_mempool_size.
> + *
> + * Get or set the paging memory pool size.  The size is in bytes.
> + *
> + * This is a dedicated pool of memory for Xen to use while managing the guest,
> + * typically containing pagetables.  As such, there is an implementation
> + * specific minimum granularity.
> + *
> + * The set operation can fail mid-way through the request (e.g. Xen running
> + * out of memory, no free memory to reclaim from the pool, etc.).
> + */
> +struct xen_domctl_paging_mempool {
> +    uint64_aligned_t size; /* IN/OUT.  Size in bytes. */
> +};
> +
>  #if defined(__i386__) || defined(__x86_64__)
>  struct xen_domctl_vcpu_msr {
>      uint32_t         index;
> @@ -1274,6 +1293,8 @@ struct xen_domctl {
>  #define XEN_DOMCTL_get_cpu_policy                82
>  #define XEN_DOMCTL_set_cpu_policy                83
>  #define XEN_DOMCTL_vmtrace_op                    84
> +#define XEN_DOMCTL_get_paging_mempool_size       85
> +#define XEN_DOMCTL_set_paging_mempool_size       86
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1335,6 +1356,7 @@ struct xen_domctl {
>          struct xen_domctl_psr_alloc         psr_alloc;
>          struct xen_domctl_vuart_op          vuart_op;
>          struct xen_domctl_vmtrace_op        vmtrace_op;
> +        struct xen_domctl_paging_mempool    paging_mempool;
>          uint8_t                             pad[128];
>      } u;
>  };
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 2c8116afba27..0de9cbc1696d 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -98,6 +98,9 @@ void arch_get_info_guest(struct vcpu *, vcpu_guest_context_u);
>  int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>  int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>  
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
> +
>  int domain_relinquish_resources(struct domain *d);
>  
>  void dump_pageframe_info(struct domain *d);
> -- 
> 2.11.0
> 
--8323329-872934346-1668650932=:4020--

