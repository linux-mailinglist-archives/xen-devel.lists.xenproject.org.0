Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEB273393
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 22:30:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKSRh-0000YT-Nr; Mon, 21 Sep 2020 20:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIeE=C6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKSRg-0000YM-F7
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 20:29:56 +0000
X-Inumbo-ID: 8adc7d87-e57b-4f60-8d64-1034d2e573fb
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8adc7d87-e57b-4f60-8d64-1034d2e573fb;
 Mon, 21 Sep 2020 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600720194;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VfAoYJdKDVPyMnxiFpqSXVbDKz4unbvaMjk+VPP/pUA=;
 b=TI2oahUoz8I//hQbturQ/NI1cVC/puv1DpRS4j/E0FqQ39vfwOPbvzvO
 xNnUczz+wJABZw1U6IwKLmO6nzDt84FDIboiDSwgcBEsz/WcUy60M7rrA
 iK8zuPbCcpyZWBN7o8zSSz4vAbCkK+U/n2Yg/zRKVKH1m095WYwbntUMl g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OEGjAEL1R480FK+XVGGPj/ihGIr3FwIlGKaMI7bUCXEUPddXN0+Qp7yl6bBfCHxIhLJeWz0w9l
 ms8OQMr9OWQ2spWRxhbzb/KOkIYX/2eljYr8tjVAqQBf2fsUp84N5F8F8wqnI2a9vjsr3Pkd6V
 vqQ1Zl3WFUpqs2RREZaSgP+xBzOZsdX6hhlwz/Y2SHjGHcKSTrbDUQXwRT4wKokC+m/0GebPyc
 IA3KPnn9dXcGepbAg2Od35V785BaJDZznPnu4smDzCZK8tggig1ehrGX5js7Ng7pL1hqWjAroM
 YxE=
X-SBRS: 2.7
X-MesageID: 27206989
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,287,1596513600"; d="scan'208";a="27206989"
Subject: Re: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-3-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a2e1773d-cb01-fa02-334a-a642f9316b57@citrix.com>
Date: Mon, 21 Sep 2020 21:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921180214.4842-3-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/09/2020 19:02, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
>
> While Arm never had a M2P, the implementation of mfn_to_gmfn is pretty
> bogus as we directly return the MFN passed in parameter.
>
> Thankfully, the use of mfn_to_gmfn is pretty limited on Arm today. There
> are only 2 callers in the common code:
>     - memory_exchange: Arm cannot not use it because steal_page is not
>     implemented. Note this is already protected by !CONFIG_PV.
>     - getdomaininfo: Toolstack may map the shared page. It looks like
>     this is mostly used for mapping the P2M of PV guest. Therefore the
>     issue might be minor.
>
> Implementing the M2P on Arm is not planned. The M2P would require significant
> amount of VA address (very tough on 32-bit) that can hardly be justified with
> the current use of mfn_to_gmfn.

If anyone cares, access to the shared info page should be wired up
through acquire_resource, not through this foreign mapping bodge,
because ...

>     - memory_exchange: This does not work and I haven't seen any
>     request for it so far.
>     - getdomaininfo: The structure on Arm does not seem to contain a lot
>     of useful information on Arm. It is unclear whether we want to
>     allow the toolstack mapping it on Arm.
>
> This patch introduces a config option HAS_M2P to tell whether an
> architecture implements the M2P.
>     - memory_exchange: This is PV only (not supported on Arm) but take
>     the opportunity to gate with HAS_M2P as well in case someone decide
>     to implement PV without M2P.
>     - getdomaininfo: A new helper is introduced to wrap the call to
>     mfn_to_gfn/mfn_to_gmfn. For Arm, a fixed value will be provided that will
>     fail on mapping if used.
>
> Signed-off-by Julien Grall <julien.grall@arm.com>

... possibly the single best reason for returning -1 on ARM is that this
is already the behaviour for x86 HVM guests, until the guest has mapped
the shared info frame for the first time.

(XEN) *** d0v6 getdomaininfo(d1) d->shared_info ffff83007cffe000,
shared_info_frame 0x7cffe
(XEN) *** d0v6 getdomaininfo(d2) d->shared_info ffff83007a401000,
shared_info_frame 0xffffffffffffffff

(d1 is PV, d2 is HVM.  This is the result of creating domains at the
python shell, then querying them for their info, without any further
construction or execution).

Furthermore, both PV and HVM guests can invalidate the M2P mappings for
their shared_info page, which in the HVM case would cause -1 to be
returned again.

> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 5ac6e9c5cafa..2bf3e6659018 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -68,6 +68,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>      u64 cpu_time = 0;
>      int flags = XEN_DOMINF_blocked;
>      struct vcpu_runstate_info runstate;
> +    gfn_t shared_info_frame;
>  
>      info->domain = d->domain_id;
>      info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
> @@ -111,8 +112,12 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>      info->outstanding_pages = d->outstanding_pages;
>      info->shr_pages         = atomic_read(&d->shr_pages);
>      info->paged_pages       = atomic_read(&d->paged_pages);
> -    info->shared_info_frame = mfn_to_gmfn(d, virt_to_mfn(d->shared_info));
> -    BUG_ON(SHARED_M2P(info->shared_info_frame));
> +
> +    shared_info_frame = domain_shared_info_gfn(d);
> +    if ( gfn_eq(shared_info_frame, INVALID_GFN) )
> +        info->shared_info_frame = XEN_INVALID_SHARED_INFO_FRAME;
> +    else
> +        info->shared_info_frame = gfn_x(shared_info_frame);

This can be simplified to just  info->shared_info_frame =
gfn_x(arch_shared_info_gfn(d)) based on the suggestion at the bottom.

>  
>      info->cpupool = cpupool_get_id(d);
>  
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 9300104943b0..c698e6872596 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -504,7 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
>  
>  static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>  {
> -#ifdef CONFIG_PV
> +#if defined(CONFIG_PV) && defined(CONFIG_M2P)

There is no such thing as PV && !M2P.  The M2P table is part of the PV
ABI with guests.

These two hunks should be dropped.

>      struct xen_memory_exchange exch;
>      PAGE_LIST_HEAD(in_chunk_list);
>      PAGE_LIST_HEAD(out_chunk_list);
> @@ -801,7 +801,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>      if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>          rc = -EFAULT;
>      return rc;
> -#else /* !CONFIG_PV */
> +#else /* !(CONFIG_PV && CONFIG_M2P) */
>      return -EOPNOTSUPP;
>  #endif
>  }
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 6819a3bf382f..90161dd079a1 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -262,6 +262,11 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>  
> +static inline gfn_t domain_shared_info_gfn(struct domain *d)
> +{
> +    return INVALID_GFN;
> +}

We don't want every every architecture to provide a stub.  Instead, ...
(bottom reply)

> +
>  #endif /* __ASM_DOMAIN_H__ */
>  
>  /*
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 5c5e55ebcb76..7564df5e8374 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -136,6 +136,12 @@ struct xen_domctl_getdomaininfo {
>      uint64_aligned_t outstanding_pages;
>      uint64_aligned_t shr_pages;
>      uint64_aligned_t paged_pages;
> +#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)

We've already got INVALID_GFN as a constant used in the interface.  Lets
not proliferate more.

> +    /*
> +     * GFN of shared_info struct. Some architectures (e.g Arm) may not
> +     * provide a mappable address in the field. In that case, the field
> +     * will be set to XEN_INVALID_SHARED_INFO_FRAME.
> +     */
>      uint64_aligned_t shared_info_frame; /* GMFN of shared_info struct */

Delete this comment, especially as it is using obsolete naming terminology.

>      uint64_aligned_t cpu_time;
>      uint32_t nr_online_vcpus;    /* Number of VCPUs currently online. */
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index cde0d9c7fe63..7281eb7b36c7 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -131,4 +131,16 @@ void vnuma_destroy(struct vnuma_info *vnuma);
>  static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
>  #endif
>  
> +#ifdef CONFIG_HAS_M2P
> +#define domain_shared_info_gfn(d) ({                            \
> +    const struct domain *d_ = (d);                              \
> +    gfn_t gfn_;                                                 \
> +                                                                \
> +    gfn_ = mfn_to_gfn(d_, _mfn(__virt_to_mfn(d_->shared_info)));\
> +    BUG_ON(SHARED_M2P(gfn_x(gfn_)));                            \
> +                                                                \
> +    gfn_;                                                       \
> +})

... this wants to be

#ifndef arch_shared_info_gfn
static inline gfn_t arch_shared_info_gfn(const struct domain *d) {
return INVALID_GFN; }
#endif

with

gfn_t arch_shared_info_gfn(const struct domain *d);
#define arch_shared_info_gfn arch_shared_info_gfn

in asm-x86/domain.h

and the actual implementation in arch/x86/domain.c

~Andrew

