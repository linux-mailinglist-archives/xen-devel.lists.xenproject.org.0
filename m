Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC6A78550
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 01:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934967.1336508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlIJ-0006uS-EJ; Tue, 01 Apr 2025 23:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934967.1336508; Tue, 01 Apr 2025 23:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlIJ-0006sN-BK; Tue, 01 Apr 2025 23:45:23 +0000
Received: by outflank-mailman (input) for mailman id 934967;
 Tue, 01 Apr 2025 23:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4cc=WT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzlII-0006sF-Jn
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 23:45:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e93d484-0f53-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 01:45:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E5340A407DB;
 Tue,  1 Apr 2025 23:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B59C4CEE4;
 Tue,  1 Apr 2025 23:45:17 +0000 (UTC)
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
X-Inumbo-ID: 5e93d484-0f53-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743551118;
	bh=bx2xmAHe99qpI7vjn3RgzY1hVk9yZPYcw4BBFjrMsIs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o4hkc5I1P2TXhQqXPHrVam8kemtOXNr+sTpvMavU2xUy/m6RoJ/2uiPpD108KRfnw
	 wZBkMpi5DJa5tGq7GKbEePsugv2eUia1kYhA/ZxXijOsUAghjdgzDYpu11d466TVpm
	 K+hBXaxudOGt04sTTEkL4C95CL3ahgBiTW2E2ii5DXaoU8E13hz40MwVOBFFZE6+AR
	 KkQ3rbV+ZlgoNQugKddKBXHtNW0lVy0R7RbM5CsePhYLquRzDDK7fEFFduwTaiRTly
	 NC1g60w5nF3NWd72zOLJsnfiMFluHPhF9WciBV8b/KBv87Hh1SalhPys1BCo/I9o5H
	 aYEQ2mSMz2Dkg==
Date: Tue, 1 Apr 2025 16:45:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/6] xen/arm: dom0less delay xenstore initialization
In-Reply-To: <20250331214321.205331-4-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504011644460.3098208@ubuntu-linux-20-04-desktop>
References: <20250331214321.205331-1-jason.andryuk@amd.com> <20250331214321.205331-4-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Mar 2025, Jason Andryuk wrote:
> To allocate the xenstore event channel and initialize the grant table
> entry, the xenstore domid is neeed.  A dom0 is created before the domUs,
> so it is normally available through hardware_domain.  With capabilities
> and dom0less, the xenstore domain may not be created first.
> 
> Keep the population of the page and HVM_PARAM_STORE_PFN in the normal
> domain construction, but delay event channel creation and grant seeding
> to after all domUs are created.  HVM_PARAM_STORE_PFN now serves as
> indication to setup xenstore since the device tree is no longer
> immediately available.  0 means no xenstore.  ~0ULL means legacy so only
> the event channel needs setup, and any other value means to seed the
> page.
> 
> dom0 needs to set xs_domid when it is serving as the xenstore domain.
> 
> The domain running xenstored needs to be the handler for VIRQ_DOM_EXC,
> so set that as well - it otherwise defaults to hardware domain.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2:
> Re-order ahead of seeding.
> Fix created type in commit message
> Change set_xs_domid to set_xs_domain
> Set xenstore domain as VIRQ_DOM_EXC handler
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c             | 67 +++++++++++++++++------
>  xen/arch/arm/domain_build.c               |  2 +
>  xen/arch/arm/include/asm/dom0less-build.h |  2 +
>  3 files changed, 53 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index e25d7bd468..a46f292c1f 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -20,6 +20,15 @@
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  
> +static domid_t __initdata xs_domid = DOMID_INVALID;
> +static bool __initdata need_xenstore;
> +
> +void __init set_xs_domain(struct domain *d)
> +{
> +    xs_domid = d->domain_id;
> +    set_global_virq_handler(d, VIRQ_DOM_EXC);
> +}
> +
>  bool __init is_dom0less_mode(void)
>  {
>      struct bootmodules *mods = &bootinfo.modules;
> @@ -694,7 +703,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>      int rc;
>  
>      alloc.dom = d->domain_id;
> -    alloc.remote_dom = hardware_domain->domain_id;
> +    alloc.remote_dom = xs_domid;
>      rc = evtchn_alloc_unbound(&alloc, 0);
>      if ( rc )
>      {
> @@ -760,16 +769,10 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>      struct domain *d = kinfo->d;
>      int rc = 0;
>  
> -    if ( kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
> -    {
> -        ASSERT(hardware_domain);
> -        rc = alloc_xenstore_evtchn(d);
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
> @@ -841,6 +844,30 @@ static void __init domain_vcpu_affinity(struct domain *d,
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

This should be uint64_t. With that change:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
> +    }
> +}
> +
>  static int __init construct_domU(struct domain *d,
>                                   const struct dt_device_node *node)
>  {

