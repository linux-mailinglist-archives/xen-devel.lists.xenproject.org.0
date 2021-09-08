Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542084041F7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182486.330079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7Ob-0008FO-14; Wed, 08 Sep 2021 23:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182486.330079; Wed, 08 Sep 2021 23:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7Oa-0008DC-RT; Wed, 08 Sep 2021 23:54:24 +0000
Received: by outflank-mailman (input) for mailman id 182486;
 Wed, 08 Sep 2021 23:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK88=N6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO7OY-0008Cm-Pc
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:54:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8adf7f8b-5cbd-4a9d-bb93-1b65e90c00c3;
 Wed, 08 Sep 2021 23:54:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E10A661059;
 Wed,  8 Sep 2021 23:54:20 +0000 (UTC)
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
X-Inumbo-ID: 8adf7f8b-5cbd-4a9d-bb93-1b65e90c00c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631145261;
	bh=vGPUkqiSUhixdY4PTm7cRj0Zcx/J+QLHfFfbGVsUer0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bneSrwGacrTy8qW9CARX3W4mF/2XOZKHJhiGfc3nQNXSBH+Iwc9R+FDwx6OGb95RV
	 I0TnpMwA0SmOr73D+juvhMHfFoHSKiPCE+KesvPrJd/pQrrCafJvgB5qwbSRIhIcRf
	 8wuiNWl28J49EuhtWA1zs5wW079h0rJEmykrWWUVk7f/7+3Pfhb9UP5/SfeHNZCfdZ
	 Kfce7cAIsJWMGNnYnrWgBuPismc1ipzJBWvXDUOvOG1moRmv2C35of+JAuNn+81Z0l
	 1JJhtYZo7LvTI5sBQP3JpO2LGw07wkbde55L3BkqRtkvV7gNohsCQA6A6FMYO1yDtf
	 nv9Xvg6oHHjTw==
Date: Wed, 8 Sep 2021 16:54:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, jbeulich@suse.com
Subject: Re: [PATCH v6 4/7] xen/arm: static memory initialization
In-Reply-To: <20210908095248.545981-5-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109081643340.10523@sstabellini-ThinkPad-T480s>
References: <20210908095248.545981-1-penny.zheng@arm.com> <20210908095248.545981-5-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Penny Zheng wrote:
> This patch introduces static memory initialization, during system boot-up.
> 
> The new function init_staticmem_pages is responsible for static memory
> initialization.
> 
> Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
> nr_mfns pages of static memory.
> 
> This commit also introduces a new CONFIG_STATIC_MEMORY option to wrap all
> static-allocation-related code.
> 
> Put asynchronously scrubbing pages of static memory in TODO list.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/setup.c    | 27 +++++++++++++++++++++++++++
>  xen/common/Kconfig      | 13 +++++++++++++
>  xen/common/page_alloc.c | 21 +++++++++++++++++++++
>  xen/include/xen/mm.h    |  6 ++++++
>  4 files changed, 67 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 63a908e325..5be7f2b0c2 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -609,6 +609,29 @@ static void __init init_pdx(void)
>      }
>  }
>  
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +#ifdef CONFIG_STATIC_MEMORY
> +    unsigned int bank;
> +
> +    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
> +    {
> +        if ( bootinfo.reserved_mem.bank[bank].xen_domain )
> +        {
> +            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
> +            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
> +            mfn_t bank_end = mfn_add(bank_start, bank_pages);
> +
> +            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
> +                return;
> +
> +            free_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
> +        }
> +    }
> +#endif
> +}
> +
>  #ifdef CONFIG_ARM_32
>  static void __init setup_mm(void)
>  {
> @@ -736,6 +759,8 @@ static void __init setup_mm(void)
>      /* Add xenheap memory that was not already added to the boot allocator. */
>      init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
>                         mfn_to_maddr(xenheap_mfn_end));
> +
> +    init_staticmem_pages();
>  }
>  #else /* CONFIG_ARM_64 */
>  static void __init setup_mm(void)
> @@ -789,6 +814,8 @@ static void __init setup_mm(void)
>  
>      setup_frametable_mappings(ram_start, ram_end);
>      max_page = PFN_DOWN(ram_end);
> +
> +    init_staticmem_pages();
>  }
>  #endif
>  
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0ddd18e11a..3558be0dbc 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -67,6 +67,19 @@ config MEM_ACCESS
>  config NEEDS_LIBELF
>  	bool
>  
> +config STATIC_MEMORY
> +	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on ARM
> +	help
> +	  Static Allocation refers to system or sub-system(domains) for
> +	  which memory areas are pre-defined by configuration using physical
> +	  address ranges.
> +
> +	  When enabled, memory can be statically allocated to a domain using
> +	  the property "xen,static-mem" defined in the domain configuration.
> +
> +	  If unsure, say N.
> +
>  menu "Speculative hardening"
>  
>  config SPECULATIVE_HARDEN_ARRAY
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index a3ee5eca9e..ba7adc80db 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2604,6 +2604,27 @@ struct domain *get_pg_owner(domid_t domid)
>      return pg_owner;
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> +void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                                 bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +    unsigned long i;
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        mark_page_free(&pg[i], mfn_add(mfn, i));
> +
> +        if ( need_scrub )
> +        {
> +            /* TODO: asynchronous scrubbing for pages of static memory. */
> +            scrub_one_page(pg);
> +        }
> +    }
> +}
> +#endif
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 667f9dac83..8e8fb5a615 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>  } while ( false )
>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/* These functions are for static memory */
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub);
> +#endif
> +
>  /* Map machine page range in Xen virtual address space. */
>  int map_pages_to_xen(
>      unsigned long virt,
> -- 
> 2.25.1
> 

