Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09C415B84
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193591.344831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLRQ-0000gW-4A; Thu, 23 Sep 2021 09:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193591.344831; Thu, 23 Sep 2021 09:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLRQ-0000ej-14; Thu, 23 Sep 2021 09:54:56 +0000
Received: by outflank-mailman (input) for mailman id 193591;
 Thu, 23 Sep 2021 09:54:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTLRN-0000eZ-V2
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:54:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTLRN-0004hs-Qc; Thu, 23 Sep 2021 09:54:53 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTLRN-0004in-DI; Thu, 23 Sep 2021 09:54:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=F0GhiiQdRJLWMGAG5etNZqqaQ1QMtZlfF191vHmxTEc=; b=HoEPW2PsB9DD3OOKtRCPLHp0G9
	dqZ2egQkEQekB2RF5nWexNkKMZ3tmA2V4CL65dEB78xmEnMBnVKizyggaEQIfejIw+mrSRds3U0Yw
	0tBBmy6JEWPBfNHuHSvKQdKUBby/TR+wSbz0bLfYDoDGI3T7k5hiRwV8AcGCxPoyZ6zI=;
Subject: Re: [PATCH 01/11] xen: reserve flags for internal usage in
 xen_domctl_createdomain
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-2-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7da75d7c-5640-305d-d742-d64b8c219949@xen.org>
Date: Thu, 23 Sep 2021 14:54:48 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> We are passing an extra special boolean flag at domain creation to
> specify whether we want to the domain to be privileged (i.e. dom0) or
> not. Another flag will be introduced later in this series.
> 
> Reserve bits 16-31 from the existing flags bitfield in struct
> xen_domctl_createdomain for internal Xen usage.

I am a bit split with this approach. This feels a bit of a hack to 
reserve bits for internal purpose in external headers. But at the same 
time I can see how this is easier to deal with it over repurposing the 
last argument of domain_create().

I would suggest to add an extra sentence to explain the goal is to 
consolidate all the information for a domain in a single structure.

>  > Allocate bit 16 for XEN_DOMCTL_INTERNAL_ispriv: whether a domain is
> privileged or not.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> CC: andrew.cooper3@citrix.com
> CC: jbeulich@suse.com
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: George Dunlap <george.dunlap@eu.citrix.com>
> CC: Dario Faggioli <dfaggioli@suse.com>
> ---
>   xen/arch/arm/domain.c       |  2 +-
>   xen/arch/arm/domain_build.c |  7 ++++---
>   xen/arch/x86/setup.c        |  4 +++-
>   xen/common/domain.c         | 19 +++++++++----------
>   xen/common/domctl.c         |  3 ++-
>   xen/common/sched/core.c     |  2 +-
>   xen/include/public/domctl.h |  3 +++
>   xen/include/xen/domain.h    |  4 ++++
>   xen/include/xen/sched.h     |  3 +--
>   9 files changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d..7922249d26 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -623,7 +623,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>       unsigned int max_vcpus;
>   
>       /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
> +    if ( ((config->flags & XEN_DOMCTL_CDF_MASK) & ~XEN_DOMCTL_CDF_iommu) !=
>            (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>       {
>           dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d233d634c1..8cc4c800e9 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2679,7 +2679,7 @@ void __init create_domUs(void)
>            * very important to use the pre-increment operator to call
>            * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>            */
> -        d = domain_create(++max_init_domid, &d_cfg, false);
> +        d = domain_create(++max_init_domid, &d_cfg);
>           if ( IS_ERR(d) )
>               panic("Error creating domain %s\n", dt_node_name(node));
>   
> @@ -2752,7 +2752,8 @@ void __init create_dom0(void)
>   {
>       struct domain *dom0;
>       struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> +                 XEN_DOMCTL_INTERNAL_ispriv,
>           .max_evtchn_port = -1,
>           .max_grant_frames = gnttab_dom0_frames(),
>           .max_maptrack_frames = -1,
> @@ -2773,7 +2774,7 @@ void __init create_dom0(void)
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
> -    dom0 = domain_create(0, &dom0_cfg, true);
> +    dom0 = domain_create(0, &dom0_cfg);
>       if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>           panic("Error creating domain 0\n");
>   
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index b101565f14..6b7a1a3994 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -770,9 +770,11 @@ static struct domain *__init create_dom0(const module_t *image,
>   
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +    if ( !pv_shim )
> +        dom0_cfg.flags |= XEN_DOMCTL_INTERNAL_ispriv;
>   
>       /* Create initial domain 0. */
> -    d = domain_create(get_initial_domain_id(), &dom0_cfg, !pv_shim);
> +    d = domain_create(get_initial_domain_id(), &dom0_cfg);
>       if ( IS_ERR(d) || (alloc_dom0_vcpu0(d) == NULL) )
>           panic("Error creating domain 0\n");
>   
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6ee5d033b0..5fcca9b018 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -475,11 +475,11 @@ static void _domain_destroy(struct domain *d)
>   
>   static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>   {
> -    bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
> -    bool hap = config->flags & XEN_DOMCTL_CDF_hap;
> -    bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
> +    bool hvm = (config->flags & XEN_DOMCTL_CDF_MASK) & XEN_DOMCTL_CDF_hvm;
> +    bool hap = (config->flags & XEN_DOMCTL_CDF_MASK) & XEN_DOMCTL_CDF_hap;
> +    bool iommu = (config->flags & XEN_DOMCTL_CDF_MASK) & XEN_DOMCTL_CDF_iommu;

Adding "& XEN_DOMCTL_CDF_MASK" in the 3 lines above looks rather pointless.

>   
> -    if ( config->flags &
> +    if ( (config->flags & XEN_DOMCTL_CDF_MASK) &
>            ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>              XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>              XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> @@ -536,8 +536,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>   }
>   
>   struct domain *domain_create(domid_t domid,
> -                             struct xen_domctl_createdomain *config,
> -                             bool is_priv)
> +                             struct xen_domctl_createdomain *config)
>   {
>       struct domain *d, **pd, *old_hwdom = NULL;
>       enum { INIT_watchdog = 1u<<1,
> @@ -563,7 +562,7 @@ struct domain *domain_create(domid_t domid,
>       }
>   
>       /* Sort out our idea of is_control_domain(). */
> -    d->is_privileged = is_priv;
> +    d->is_privileged = config ? config->flags & XEN_DOMCTL_INTERNAL_ispriv : 0;

config->flags will be stored in d->options. Given there is a single 
caller for d->is_privileged, I would drop the field and replace the use 
with d->options & XEN_DOMCTL_INTERAL_ispriv?

>   
>       /* Sort out our idea of is_hardware_domain(). */
>       if ( domid == 0 || domid == hardware_domid )
> @@ -756,7 +755,7 @@ void __init setup_system_domains(void)
>        * Hidden PCI devices will also be associated with this domain
>        * (but be [partly] controlled by Dom0 nevertheless).
>        */
> -    dom_xen = domain_create(DOMID_XEN, NULL, false);
> +    dom_xen = domain_create(DOMID_XEN, NULL);
>       if ( IS_ERR(dom_xen) )
>           panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
>   
> @@ -766,7 +765,7 @@ void __init setup_system_domains(void)
>        * array. Mappings occur at the priv of the caller.
>        * Quarantined PCI devices will be associated with this domain.
>        */
> -    dom_io = domain_create(DOMID_IO, NULL, false);
> +    dom_io = domain_create(DOMID_IO, NULL);
>       if ( IS_ERR(dom_io) )
>           panic("Failed to create d[IO]: %ld\n", PTR_ERR(dom_io));
>   
> @@ -775,7 +774,7 @@ void __init setup_system_domains(void)
>        * Initialise our COW domain.
>        * This domain owns sharable pages.
>        */
> -    dom_cow = domain_create(DOMID_COW, NULL, false);
> +    dom_cow = domain_create(DOMID_COW, NULL);
>       if ( IS_ERR(dom_cow) )
>           panic("Failed to create d[COW]: %ld\n", PTR_ERR(dom_cow));
>   #endif
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 12d6144d28..2ec6d454dd 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -431,7 +431,8 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>               rover = dom;
>           }
>   
> -        d = domain_create(dom, &op->u.createdomain, false);
> +        op->u.createdomain.flags &= XEN_DOMCTL_CDF_MASK;

I think it is a bad idea to silently ignore the reserved bits for 
internal purpose. Instead, we should check and return and error if they 
are set.

> +        d = domain_create(dom, &op->u.createdomain);
>           if ( IS_ERR(d) )
>           {
>               ret = PTR_ERR(d);
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8f4b1ca10d..27d5bc2259 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3021,7 +3021,7 @@ void __init scheduler_init(void)
>           sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
>       }
>   
> -    idle_domain = domain_create(DOMID_IDLE, NULL, false);
> +    idle_domain = domain_create(DOMID_IDLE, NULL);
>       BUG_ON(IS_ERR(idle_domain));
>       BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
>       idle_domain->vcpu = idle_vcpu;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842..4d3fcd3bcb 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -74,6 +74,9 @@ struct xen_domctl_createdomain {
>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>   #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
>   
> +/* Flags from (1U<<16) to (1U<<31) are reserved for internal usage */
> +#define XEN_DOMCTL_CDF_MASK           (0xffff)

I would suggest to add U at the end to make clear this is a unsigned value.

> +
>       uint32_t flags;
>   
>   #define _XEN_DOMCTL_IOMMU_no_sharept  0
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1708c36964..7ed0b62b78 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -28,6 +28,10 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
>   void arch_get_domain_info(const struct domain *d,
>                             struct xen_domctl_getdomaininfo *info);
>   
> +/* Flags are reserved for internal usage */
> +#define _XEN_DOMCTL_INTERNAL_ispriv         16
> +#define XEN_DOMCTL_INTERNAL_ispriv          (1U<<_XEN_DOMCTL_INTERNAL_ispriv)

Coding style: space before and after <<.

> +
>   /*
>    * Arch-specifics.
>    */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 28146ee404..a659b25dea 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -664,8 +664,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
>    * (domid < DOMID_FIRST_RESERVED).
>    */
>   struct domain *domain_create(domid_t domid,
> -                             struct xen_domctl_createdomain *config,
> -                             bool is_priv);
> +                             struct xen_domctl_createdomain *config);
>   
>   /*
>    * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
> 

Cheers,

-- 
Julien Grall

