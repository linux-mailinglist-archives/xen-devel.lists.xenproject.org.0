Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78938A55D68
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904540.1312417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMzZ-00005l-4n; Fri, 07 Mar 2025 01:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904540.1312417; Fri, 07 Mar 2025 01:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMzZ-0008Vi-1w; Fri, 07 Mar 2025 01:59:13 +0000
Received: by outflank-mailman (input) for mailman id 904540;
 Fri, 07 Mar 2025 01:59:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqMzX-0008Vc-Mg
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:59:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2240491-faf7-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 02:59:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 358F7A45377;
 Fri,  7 Mar 2025 01:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935F9C4CEE0;
 Fri,  7 Mar 2025 01:59:07 +0000 (UTC)
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
X-Inumbo-ID: c2240491-faf7-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741312748;
	bh=ficgeRNlg8fZMwiPXNc4eNECjNla8qgj0UYIIGaolNM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e0emeto37cuAjFB5alMJ147tgwg2GFZIXbb+hTUfs3sGra1jXftFGLC8QWV5NQTXN
	 GKzW9YOoKsPHXv2NfSzR+v5AR03wp/co8YNW0NrB6LHrDrUAW3eRfvbs4e/0uCKmZA
	 MdQnjzpkiIGtBG/u7NT/jcd/XnhC4lKJyeDeX1j+HBN4jH1Yre4milRGOlZ3ovymkN
	 Oao0zBVurkPAkkp4AZiCIVOwBpnqSXTdNScLkH5Pw9IaHnllr2GAQDbDSxPgBACzWx
	 KSxk4oRc8Zn/UtZlQzFpp3QJsBfGMjSmgXGq0gfGoYKPkfgyFCEmPkxeIvUB3Y5XZi
	 uEn1Vcpht2/TQ==
Date: Thu, 6 Mar 2025 17:59:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 10/23] xen/arm: dom0less delay xenstore initialization
In-Reply-To: <20250306220343.203047-11-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503061758220.2600338@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-11-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Jason Andryuk wrote:
> To allocate the xenstore event channel and initialize the grant table
> entry, the xenstore domid is neeed.  A dom0 is craeted before the domUs,
> so it is normally available through hardware_domain.  With capabilities
> and dom0less, the xenstore domain may not be created first.
> 
> Keep the population of the page and HVM_PARAM_STORE_PFN in the normal
> domain construction, but delay event channel and seeding to after all
> domUs are created.  HVM_PARAM_STORE_PFN now serves as indication to
> setup xenstore since the device tree is no longer immediately available.
> 0 means no xenstore.  ~0ULL means legacy so only the event channel needs
> setup, and any other value means to seed the page.
> 
> dom0 needs to set xs_domid when it is serving as the xenstore domain.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c             | 71 +++++++++++++++--------
>  xen/arch/arm/domain_build.c               |  1 +
>  xen/arch/arm/include/asm/dom0less-build.h |  2 +
>  3 files changed, 51 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index f1d5bbb097..3b8153b05e 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -22,6 +22,12 @@
>  #include <asm/static-shmem.h>
>  
>  static domid_t __initdata xs_domid = DOMID_INVALID;
> +static bool __initdata need_xenstore;
> +
> +void __init set_xs_domid(domid_t domid)
> +{
> +    xs_domid = domid;
> +}
>  
>  bool __init is_dom0less_mode(void)
>  {
> @@ -697,7 +703,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>      int rc;
>  
>      alloc.dom = d->domain_id;
> -    alloc.remote_dom = hardware_domain->domain_id;
> +    alloc.remote_dom = xs_domid;
>      rc = evtchn_alloc_unbound(&alloc, 0);
>      if ( rc )
>      {
> @@ -755,10 +761,6 @@ static int __init alloc_xenstore_page(struct domain *d)
>      interface->connection = XENSTORE_RECONNECT;
>      unmap_domain_page(interface);
>  
> -    if ( xs_domid != DOMID_INVALID )
> -        gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
> -                          gfn_x(gfn), GTF_permit_access);
> -
>      return 0;
>  }
>  
> @@ -767,16 +769,10 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>      struct domain *d = kinfo->d;
>      int rc = 0;
>  
> -    if ( kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
> -    {
> -        ASSERT(hardware_domain);
> -        rc = alloc_xenstore_evtchn(d);

This patch looks correct. However, I don't understand why you didn't
keep the call to alloc_xenstore_evtchn in alloc_xenstore_params.


> -        if ( rc < 0 )
> -            return rc;
> +    if ( (kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
> +                                 == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
>          d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> -    }
> -
> -    if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
> +    else if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
>      {
>          rc = alloc_xenstore_page(d);
>          if ( rc < 0 )
> @@ -848,6 +844,34 @@ static void __init domain_vcpu_affinity(struct domain *d,
>      }
>  }
>  
> +static void __init initialize_domU_xenstore(void)
> +{
> +    struct domain *d;
> +
> +    if ( xs_domid == DOMID_INVALID )
> +        return;
> +
> +    for_each_domain( d )
> +    {
> +        unsigned long gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
> +        int rc;
> +
> +        if ( gfn == 0 )
> +            continue;
> +
> +        if ( is_xenstore_domain(d) )
> +            continue;
> +
> +        rc = alloc_xenstore_evtchn(d);
> +        if ( rc < 0 )
> +            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> +
> +        if ( gfn != ~0ULL )
> +            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
> +                              gfn, GTF_permit_access);
> +    }
> +}
> +
>  static int __init construct_domU(struct domain *d,
>                                   const struct dt_device_node *node)
>  {
> @@ -888,17 +912,13 @@ static int __init construct_domU(struct domain *d,
>           rc == -ENODATA ||
>           (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>      {
> -        if ( hardware_domain )
> -            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
> -        else
> -            panic("At the moment, Xenstore support requires dom0 to be present\n");
> +        need_xenstore = true;
> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
>      }
>      else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
>      {
> -        if ( hardware_domain )
> -            kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
> -        else
> -            panic("At the moment, Xenstore support requires dom0 to be present\n");
> +        need_xenstore = true;
> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
>      }
>      else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>          kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
> @@ -1181,8 +1201,13 @@ void __init create_domUs(void)
>                    dt_node_name(node), rc);
>  
>          if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
> -            xs_domid = d->domain_id;
> +            set_xs_domid(d->domain_id);
>      }
> +
> +    if ( need_xenstore && xs_domid == DOMID_INVALID )
> +        panic("xenstore requested, but xenstore domain not present\n");
> +
> +    initialize_domU_xenstore();
>  }
>  
>  /*
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 00bc484642..ba6bbb95c1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2373,6 +2373,7 @@ void __init create_dom0(void)
>      unsigned int flags = CDF_privileged | CDF_hardware;
>      int rc;
>  
> +    set_xs_domid(0);
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>      dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>      /*
> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
> index 5864944bda..df879f93c8 100644
> --- a/xen/arch/arm/include/asm/dom0less-build.h
> +++ b/xen/arch/arm/include/asm/dom0less-build.h
> @@ -9,6 +9,7 @@
>  
>  void create_domUs(void);
>  bool is_dom0less_mode(void);
> +void set_xs_domid(domid_t);
>  
>  #else /* !CONFIG_DOM0LESS_BOOT */
>  
> @@ -17,6 +18,7 @@ static inline bool is_dom0less_mode(void)
>  {
>      return false;
>  }
> +static inline void set_xs_domid(domid_t) {}
>  
>  #endif /* CONFIG_DOM0LESS_BOOT */
>  
> -- 
> 2.48.1
> 
> 

