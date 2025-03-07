Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CDA55D1E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904495.1312377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMX2-0008FW-8k; Fri, 07 Mar 2025 01:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904495.1312377; Fri, 07 Mar 2025 01:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMX2-0008Ck-5F; Fri, 07 Mar 2025 01:29:44 +0000
Received: by outflank-mailman (input) for mailman id 904495;
 Fri, 07 Mar 2025 01:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqMX1-0008Ca-2x
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:29:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3c6942e-faf3-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 02:29:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E172E5C5B24;
 Fri,  7 Mar 2025 01:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91763C4CEE0;
 Fri,  7 Mar 2025 01:29:38 +0000 (UTC)
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
X-Inumbo-ID: a3c6942e-faf3-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741310979;
	bh=PB4YoNdz7p5KnPFlvfZCh1EZEPklQV2P2BDluH8E6dY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KJwE6QwJku1f/kByLLErEIkAR05VCjmNtsnwaligYJv4NJBy2SaXP+PdpABWSayPt
	 1XregOybycFP3AeAIdCCL+3fBnwsT1weOttW+ko5ZvZCdSX3WPqlw+XztEEwn8jA11
	 FNcor1rT5S/gWLudG1kBV2Ib0ZkuqJqST2sUNTuLjjCa/Rcm/tD9erVyHRd8zu0gHg
	 fFgFVe68htUQviUM1uTgn57Y5B6rMTicud26w/e4U/PkWC/epEsr4DpZiXhibOSmCM
	 S6q3eXPL48SohjQeOPlSXKVb5h8IMNmJwChzRDG0TNg/Bt7dcKg6QD7t44R3TgQD/O
	 +TXxTjrUsMWGA==
Date: Thu, 6 Mar 2025 17:29:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 02/23] xen/arm: Factor out construct_hwdom()
In-Reply-To: <20250306220343.203047-3-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503061728510.2600338@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-3-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Jason Andryuk wrote:
> Factor out construct_hwdom() from construct_dom0().  This will be
> re-used by the dom0less code when building a domain with the hardware
> capability.
> 
> iommu_hwdom_init(d) is moved into construct_hwdom() which moves it after
> kernel_probe().  kernel_probe() doesn't seem to depend on its setting.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain_build.c             | 28 ++++++++++++++++---------
>  xen/arch/arm/include/asm/domain_build.h |  1 +
>  2 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6784ee6f6d..d676422496 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2296,8 +2296,6 @@ static int __init construct_dom0(struct domain *d)
>          dom0_mem = MB(512);
>      }
>  
> -    iommu_hwdom_init(d);
> -
>      d->max_pages = dom0_mem >> PAGE_SHIFT;
>  
>      kinfo.unassigned_mem = dom0_mem;
> @@ -2307,17 +2305,27 @@ static int __init construct_dom0(struct domain *d)
>      if ( rc < 0 )
>          return rc;
>  
> +    return construct_hwdom(&kinfo);
> +}
> +
> +int __init construct_hwdom(struct kernel_info *kinfo)
> +{
> +    struct domain *d = kinfo->d;
> +    int rc;
> +
> +    iommu_hwdom_init(d);
> +
>  #ifdef CONFIG_ARM_64
>      /* type must be set before allocate_memory */
> -    d->arch.type = kinfo.type;
> +    d->arch.type = kinfo->type;
>  #endif
> -    find_gnttab_region(d, &kinfo);
> +    find_gnttab_region(d, kinfo);
>      if ( is_domain_direct_mapped(d) )
> -        allocate_memory_11(d, &kinfo);
> +        allocate_memory_11(d, kinfo);
>      else
> -        allocate_memory(d, &kinfo);
> +        allocate_memory(d, kinfo);
>  
> -    rc = process_shm_chosen(d, &kinfo);
> +    rc = process_shm_chosen(d, kinfo);
>      if ( rc < 0 )
>          return rc;
>  
> @@ -2332,7 +2340,7 @@ static int __init construct_dom0(struct domain *d)
>  
>      if ( acpi_disabled )
>      {
> -        rc = prepare_dtb_hwdom(d, &kinfo);
> +        rc = prepare_dtb_hwdom(d, kinfo);
>          if ( rc < 0 )
>              return rc;
>  #ifdef CONFIG_HAS_PCI
> @@ -2340,12 +2348,12 @@ static int __init construct_dom0(struct domain *d)
>  #endif
>      }
>      else
> -        rc = prepare_acpi(d, &kinfo);
> +        rc = prepare_acpi(d, kinfo);
>  
>      if ( rc < 0 )
>          return rc;
>  
> -    return construct_domain(d, &kinfo);
> +    return construct_domain(d, kinfo);
>  }
>  
>  void __init create_dom0(void)
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 5d77af2e8b..134290853c 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -13,6 +13,7 @@ bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>                            paddr_t tot_size);
>  void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>  int construct_domain(struct domain *d, struct kernel_info *kinfo);
> +int construct_hwdom(struct kernel_info *kinfo);
>  int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
>  int make_chosen_node(const struct kernel_info *kinfo);
>  int make_cpus_node(const struct domain *d, void *fdt);
> -- 
> 2.48.1
> 

