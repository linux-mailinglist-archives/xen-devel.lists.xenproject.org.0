Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D36A7B544
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937677.1338591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VTI-0005TJ-8D; Fri, 04 Apr 2025 01:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937677.1338591; Fri, 04 Apr 2025 01:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VTI-0005RN-4y; Fri, 04 Apr 2025 01:03:48 +0000
Received: by outflank-mailman (input) for mailman id 937677;
 Fri, 04 Apr 2025 01:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VTH-0005RF-Ax
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:03:47 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7698795-10f0-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 03:03:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3346544EF5;
 Fri,  4 Apr 2025 01:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB68BC4CEE7;
 Fri,  4 Apr 2025 01:03:40 +0000 (UTC)
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
X-Inumbo-ID: a7698795-10f0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743728622;
	bh=uvT5lNwICIHPRBHCKd7L5EoQdJl1nI1jEp+f1HmtzII=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fa9+W9aUza05pY82cFOHghXb07tBEOYLun7kcFutNgg6fluqOvvJry9qO+h7eBOj+
	 93oAgKkKEx70CHxwbnH1YfySknjzZnTOlEN0xMuXyDUJTMyQKXtn5hO6OT3sKa28uA
	 qofvB+H4t7qSoTtUT3quO/QNm+evQ7ztFBJTHzlMujachbwolR7vBZR2jAbZaRviDy
	 mHYJ3u8+CXCbABFvi9aBbo2dN54aFlmhO9nqzJDfjwb1sZs5MFyxqlfKU31GHx7UG8
	 jG2DtO/Zrbm2+Wj0ndfDLKwrkyswzFIzbcBGZ1PM8Ux1UtjGO4Uz6MNBAWT8kMMdhi
	 9lXc5wFuqmLOw==
Date: Thu, 3 Apr 2025 18:03:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/7] xen: introduce hardware domain create flag
In-Reply-To: <20250403214608.152954-2-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504031802590.3529306@ubuntu-linux-20-04-desktop>
References: <20250403214608.152954-1-jason.andryuk@amd.com> <20250403214608.152954-2-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Jason Andryuk wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add and use a new internal create domain flag to specify the hardware
> domain.  This removes the hardcoding of domid 0 as the hardware domain.
> 
> This allows more flexibility with domain creation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

ARM:
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3:
> Or-in CDF_hardware for late hwdom case
> Add Jan's R-b
> 
> v2:
> () around binary &
> Only allow late_hwdom for dom0
> ---
>  xen/arch/arm/domain_build.c | 2 +-
>  xen/arch/x86/setup.c        | 3 ++-
>  xen/common/domain.c         | 7 ++++++-
>  xen/include/xen/domain.h    | 2 ++
>  4 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 634333cdde..b8f282ff10 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2369,7 +2369,7 @@ void __init create_dom0(void)
>          .max_maptrack_frames = -1,
>          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>      };
> -    unsigned int flags = CDF_privileged;
> +    unsigned int flags = CDF_privileged | CDF_hardware;
>      int rc;
>  
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d70abb7e0c..67d399c469 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1018,7 +1018,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>  
>      /* Create initial domain.  Not d0 for pvshim. */
>      domid = get_initial_domain_id();
> -    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
> +    d = domain_create(domid, &dom0_cfg,
> +                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
>  
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 585fd726a9..da74f815f4 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -820,13 +820,18 @@ struct domain *domain_create(domid_t domid,
>      d->is_privileged = flags & CDF_privileged;
>  
>      /* Sort out our idea of is_hardware_domain(). */
> -    if ( domid == 0 || domid == hardware_domid )
> +    if ( (flags & CDF_hardware) || domid == hardware_domid )
>      {
>          if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>              panic("The value of hardware_dom must be a valid domain ID\n");
>  
> +        /* late_hwdom is only allowed for dom0. */
> +        if ( hardware_domain && hardware_domain->domain_id )
> +            return ERR_PTR(-EINVAL);
> +
>          old_hwdom = hardware_domain;
>          hardware_domain = d;
> +        flags |= CDF_hardware;
>      }
>  
>      TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index a34daa7d10..e10baf2615 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -53,6 +53,8 @@ domid_t get_initial_domain_id(void);
>  #else
>  #define CDF_staticmem            0
>  #endif
> +/* This is the hardware domain.  Only 1 allowed. */
> +#define CDF_hardware             (1U << 3)
>  
>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> -- 
> 2.49.0
> 

