Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC82A8ACFC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 02:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954748.1348724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qx1-0003m7-M5; Wed, 16 Apr 2025 00:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954748.1348724; Wed, 16 Apr 2025 00:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qx1-0003kf-J2; Wed, 16 Apr 2025 00:48:27 +0000
Received: by outflank-mailman (input) for mailman id 954748;
 Wed, 16 Apr 2025 00:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4qwz-0003kZ-MJ
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 00:48:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce96a6c-1a5c-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 02:48:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D6D53A4A80C;
 Wed, 16 Apr 2025 00:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD77C4CEE7;
 Wed, 16 Apr 2025 00:48:16 +0000 (UTC)
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
X-Inumbo-ID: 7ce96a6c-1a5c-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744764497;
	bh=a0O26c4Cj43kfU98RbiNOvDMT8WLwKSSrfD6HelEqls=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wf6m9jddKI4FfVDUeopWEOGA3aDD0eXASunU/lIVbWZkzE1KZtHd/Fc5i1yvwaZ2x
	 MOl4ye6FIzRdm3glmaSAJFWDYeGOuZy4tyFDkIlLh8DQ5RSRwl0A0pxHjyXER5sjSf
	 frNDnrQ+EFM5ApTEYjJWYk9xtUXIGvUm+iQFW7Cul2TgSKf0JxGs6gsiOTITWpqfzq
	 wXANs/cHOjQCRaGmrT55BRhN04FAmVYaQA8wg5zckc2SL1gKvn763Z8YDBERqtBwlA
	 S2XpxSZy3Wj+hW5hTs8u5UsRiRvDiPgK6dcXa68PU0YuG3hM4tp6gjZgtBVPIDsM7e
	 8IEOy5avpaeZA==
Date: Tue, 15 Apr 2025 17:48:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 2/7] xen/arm: dom0less hwdom construction
In-Reply-To: <20250407194038.83860-3-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504151748070.8008@ubuntu-linux-20-04-desktop>
References: <20250407194038.83860-1-jason.andryuk@amd.com> <20250407194038.83860-3-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Jason Andryuk wrote:
> When creating a hardware domain, have the dom0less code call
> construct_hwdom() which is shared with the dom0 code.  The hardware
> domain requires building that best matches the dom0 build path.  Re-use
> it to keep them in sync.
> 
> The device tree node of the dom0less config is now passed into
> construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
> use the value from its dom0less device tree node.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3:
> Rebase on process_shm_chosen() removal
> ---
>  xen/arch/arm/dom0less-build.c           | 57 ++++++++++++++-----------
>  xen/arch/arm/domain_build.c             |  7 +--
>  xen/arch/arm/include/asm/domain_build.h |  3 +-
>  3 files changed, 39 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index bd15563750..7bc6a6c4d7 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -929,36 +929,45 @@ static int __init construct_domU(struct domain *d,
>      /* type must be set before allocate memory */
>      d->arch.type = kinfo.type;
>  #endif
> -    if ( !dt_find_property(node, "xen,static-mem", NULL) )
> -        allocate_memory(d, &kinfo);
> -    else if ( !is_domain_direct_mapped(d) )
> -        allocate_static_memory(d, &kinfo, node);
> -    else
> -        assign_static_memory_11(d, &kinfo, node);
> -
> -    rc = process_shm(d, &kinfo, node);
> -    if ( rc < 0 )
> -        return rc;
> -
> -    /*
> -     * Base address and irq number are needed when creating vpl011 device
> -     * tree node in prepare_dtb_domU, so initialization on related variables
> -     * shall be done first.
> -     */
> -    if ( kinfo.vpl011 )
> +    if ( is_hardware_domain(d) )
>      {
> -        rc = domain_vpl011_init(d, NULL);
> +        rc = construct_hwdom(&kinfo, node);
>          if ( rc < 0 )
>              return rc;
>      }
> +    else
> +    {
> +        if ( !dt_find_property(node, "xen,static-mem", NULL) )
> +            allocate_memory(d, &kinfo);
> +        else if ( !is_domain_direct_mapped(d) )
> +            allocate_static_memory(d, &kinfo, node);
> +        else
> +            assign_static_memory_11(d, &kinfo, node);
>  
> -    rc = prepare_dtb_domU(d, &kinfo);
> -    if ( rc < 0 )
> -        return rc;
> +        rc = process_shm(d, &kinfo, node);
> +        if ( rc < 0 )
> +            return rc;
>  
> -    rc = construct_domain(d, &kinfo);
> -    if ( rc < 0 )
> -        return rc;
> +        /*
> +         * Base address and irq number are needed when creating vpl011 device
> +         * tree node in prepare_dtb_domU, so initialization on related variables
> +         * shall be done first.
> +         */
> +        if ( kinfo.vpl011 )
> +        {
> +            rc = domain_vpl011_init(d, NULL);
> +            if ( rc < 0 )
> +                return rc;
> +        }
> +
> +        rc = prepare_dtb_domU(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +
> +        rc = construct_domain(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +    }
>  
>      domain_vcpu_affinity(d, node);
>  
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b8f282ff10..0a329f9f5e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2305,10 +2305,11 @@ static int __init construct_dom0(struct domain *d)
>      if ( rc < 0 )
>          return rc;
>  
> -    return construct_hwdom(&kinfo);
> +    return construct_hwdom(&kinfo, NULL);
>  }
>  
> -int __init construct_hwdom(struct kernel_info *kinfo)
> +int __init construct_hwdom(struct kernel_info *kinfo,
> +                           const struct dt_device_node *node)
>  {
>      struct domain *d = kinfo->d;
>      int rc;
> @@ -2327,7 +2328,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
>  
>      if ( acpi_disabled )
>      {
> -        rc = process_shm(d, kinfo, NULL);
> +        rc = process_shm(d, kinfo, node);
>          if ( rc < 0 )
>              return rc;
>      }
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 134290853c..17619c875d 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -13,7 +13,8 @@ bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>                            paddr_t tot_size);
>  void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>  int construct_domain(struct domain *d, struct kernel_info *kinfo);
> -int construct_hwdom(struct kernel_info *kinfo);
> +int construct_hwdom(struct kernel_info *kinfo,
> +                    const struct dt_device_node *node);
>  int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
>  int make_chosen_node(const struct kernel_info *kinfo);
>  int make_cpus_node(const struct domain *d, void *fdt);
> -- 
> 2.49.0
> 

