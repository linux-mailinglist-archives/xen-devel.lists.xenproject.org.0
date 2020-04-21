Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE01B33A3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 01:48:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jR2cI-0006gr-CP; Tue, 21 Apr 2020 23:47:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jR2cG-0006gm-K3
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 23:47:48 +0000
X-Inumbo-ID: 80ccce8b-842a-11ea-91e7-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ccce8b-842a-11ea-91e7-12813bfff9fa;
 Tue, 21 Apr 2020 23:47:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DCFC2068F;
 Tue, 21 Apr 2020 23:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587512867;
 bh=ozv1hgN/Sf+MmTuer++0IDoXPh3jGO16JZYGMTkRSGw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MJxELsGnGWw2NXrmnuybCTEBs+RAgjJSB4oYdGdEESBhI3Mxr/zjBc5/mBc3eAK+T
 5sBNp745QfOAExOOZ5HbMFUCatERpHpCaCL02MTysOKRbSCBDjbQ8Wf9xKTzI5k3/r
 tMtw19UOKko3jVpmZe3XJfCBzaaWOl2wL/QunlzE=
Date: Tue, 21 Apr 2020 16:47:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: Avoid to open-code the relinquish state machine
In-Reply-To: <20200419095030.2081-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2004211640450.24585@sstabellini-ThinkPad-T480s>
References: <20200419095030.2081-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 19 Apr 2020, Julien Grall wrote:
> In commit 0dfffe01d5 "x86: Improve the efficiency of
> domain_relinquish_resources()", the x86 version of the function has been
> reworked to avoid open-coding the state machine and also add more
> documentation.
> 
> Bring the Arm version on part with x86 by introducing a documented
> PROGRESS() macro to avoid latent bugs and make the new PROG_* states
> private to domain_relinquish_resources().
> 
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain.c        | 60 ++++++++++++++++++++++--------------
>  xen/include/asm-arm/domain.h |  9 +-----
>  2 files changed, 38 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 6627be2922..31169326b2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -674,7 +674,6 @@ int arch_domain_create(struct domain *d,
>      int rc, count = 0;
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
> -    d->arch.relmem = RELMEM_not_started;
>  
>      /* Idle domains do not need this setup */
>      if ( is_idle_domain(d) )
> @@ -950,13 +949,41 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>      return ret;
>  }
>  
> +/*
> + * Record the current progress. Subsequent hypercall continuations will
> + * logically restart work from this point.
> + *
> + * PROGRESS() markers must not be in the middle of loops. The loop
> + * variable isn't preserved accross a continuation.
> + *
> + * To avoid redundant work, there should be a marker before each
> + * function which may return -ERESTART.
> + */
> +enum {
> +    PROG_tee = 1,
> +    PROG_xen,
> +    PROG_page,
> +    PROG_mapping,
> +    PROG_done,
> +};
> +
> +#define PROGRESS(x)                         \
> +    d->arch.rel_priv = PROG_ ## x;          \
> +    /* Fallthrough */                       \
> +    case PROG_ ## x
> +
>  int domain_relinquish_resources(struct domain *d)
>  {
>      int ret = 0;
>  
> -    switch ( d->arch.relmem )
> +    /*
> +     * This hypercall can take minutes of wallclock time to complete.  This
> +     * logic implements a co-routine, stashing state in struct domain across
> +     * hypercall continuation boundaries.
> +     */
> +    switch ( d->arch.rel_priv )
>      {
> -    case RELMEM_not_started:
> +    case 0:
>          ret = iommu_release_dt_devices(d);
>          if ( ret )
>              return ret;
> @@ -967,42 +994,27 @@ int domain_relinquish_resources(struct domain *d)
>           */
>          domain_vpl011_deinit(d);
>  
> -        d->arch.relmem = RELMEM_tee;
> -        /* Fallthrough */
> -
> -    case RELMEM_tee:
> +    PROGRESS(tee):
>          ret = tee_relinquish_resources(d);
>          if (ret )
>              return ret;
>  
> -        d->arch.relmem = RELMEM_xen;
> -        /* Fallthrough */
> -
> -    case RELMEM_xen:
> +    PROGRESS(xen):
>          ret = relinquish_memory(d, &d->xenpage_list);
>          if ( ret )
>              return ret;
>  
> -        d->arch.relmem = RELMEM_page;
> -        /* Fallthrough */
> -
> -    case RELMEM_page:
> +    PROGRESS(page):
>          ret = relinquish_memory(d, &d->page_list);
>          if ( ret )
>              return ret;
>  
> -        d->arch.relmem = RELMEM_mapping;
> -        /* Fallthrough */
> -
> -    case RELMEM_mapping:
> +    PROGRESS(mapping):
>          ret = relinquish_p2m_mapping(d);
>          if ( ret )
>              return ret;
>  
> -        d->arch.relmem = RELMEM_done;
> -        /* Fallthrough */
> -
> -    case RELMEM_done:
> +    PROGRESS(done):
>          break;
>  
>      default:
> @@ -1012,6 +1024,8 @@ int domain_relinquish_resources(struct domain *d)
>      return 0;
>  }
>  
> +#undef PROGRESS
> +
>  void arch_dump_domain_info(struct domain *d)
>  {
>      p2m_dump_info(d);
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index d39477a939..d2142c6707 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -56,14 +56,7 @@ struct arch_domain
>      struct vmmio vmmio;
>  
>      /* Continuable domain_relinquish_resources(). */
> -    enum {
> -        RELMEM_not_started,
> -        RELMEM_tee,
> -        RELMEM_xen,
> -        RELMEM_page,
> -        RELMEM_mapping,
> -        RELMEM_done,
> -    } relmem;
> +    unsigned int rel_priv;
>  
>      struct {
>          uint64_t offset;
> -- 
> 2.17.1
> 

