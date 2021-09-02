Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70CD3FF595
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 23:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177664.323248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLuBZ-0005Yx-JE; Thu, 02 Sep 2021 21:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177664.323248; Thu, 02 Sep 2021 21:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLuBZ-0005Wz-Fu; Thu, 02 Sep 2021 21:23:49 +0000
Received: by outflank-mailman (input) for mailman id 177664;
 Thu, 02 Sep 2021 21:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wyV=NY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLuBY-0005Wt-95
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 21:23:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ea52c56-0c34-11ec-aecd-12813bfff9fa;
 Thu, 02 Sep 2021 21:23:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F27E061074;
 Thu,  2 Sep 2021 21:23:45 +0000 (UTC)
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
X-Inumbo-ID: 0ea52c56-0c34-11ec-aecd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630617826;
	bh=R33NS/1KqtwH0usN9pB4gLg6GNUdRpCt3mNX/jS3mZM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MEZ7nPh1YPE7bCire3PR2zog3wSb2lf6ddATIHdxyB2iVOvpOx44Z9ZFp/7EroCgC
	 9ZB/0fnsZPWOa5ZKLNElEoix/w5sJJ/zi59pArg6PtjVZQA1gGzV3d9dOjuvYs5gwn
	 hbtnggg5kB1g4WAneYP1eHdKA0YVtOw1seGp7pSE0xVYN9GSjltypXLq2vPd9IgCaw
	 Yuxii+rZkCFfyVh87Uj0dr429n2YdlVPp5+dZrr5/yHDyurFz3ie3DoP0hxN0zQpdD
	 cG87q2eadWrsYx48OaJZUje5aLmLMPX2f+rxAn4XBrtMHsolRTiHQXpOaMg+WCeE09
	 LUoGVzi9Z/ibw==
Date: Thu, 2 Sep 2021 14:23:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
Subject: Re: [PATCH v5 4/7] xen/arm: static memory initialization
In-Reply-To: <20210824095045.2281500-5-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109021324590.26072@sstabellini-ThinkPad-T480s>
References: <20210824095045.2281500-1-penny.zheng@arm.com> <20210824095045.2281500-5-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Aug 2021, Penny Zheng wrote:
> This patch introduces static memory initialization, during system boot up.
> 
> The new function init_staticmem_pages is responsible for static memory
> initialization.
> 
> Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
> nr_mfns pages of static memory.
> 
> This commit also introduces new CONFIG_STATIC_MEMORY to wrap all
                              ^ a                     ^ option

> static-allocation-related codes.
                            ^ code

> Put asynchronous scrubbing for pages of static memory in TODO list.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v5 change:
> - make CONFIG_STATIC_MEMORY user selectable and gated by UNSUPPORTED.
> - wrap all static-allocation-related codes with CONFIG_STATIC_MEMORY
> even in arm-specific file.
> - make bank_start/bank_end type of mfn_t, and rename bank_size to
> bank_pages.
> ---
>  xen/arch/arm/setup.c    | 31 +++++++++++++++++++++++++++++++
>  xen/common/Kconfig      | 17 +++++++++++++++++
>  xen/common/page_alloc.c | 22 +++++++++++++++++++++-
>  xen/include/xen/mm.h    |  6 ++++++
>  4 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 63a908e325..44aca9f1b9 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -609,6 +609,29 @@ static void __init init_pdx(void)
>      }
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
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
> +}
> +#endif
> +
>  #ifdef CONFIG_ARM_32
>  static void __init setup_mm(void)
>  {
> @@ -736,6 +759,10 @@ static void __init setup_mm(void)
>      /* Add xenheap memory that was not already added to the boot allocator. */
>      init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
>                         mfn_to_maddr(xenheap_mfn_end));
> +
> +#ifdef CONFIG_STATIC_MEMORY
> +    init_staticmem_pages();
> +#endif
>  }
>  #else /* CONFIG_ARM_64 */
>  static void __init setup_mm(void)
> @@ -789,6 +816,10 @@ static void __init setup_mm(void)
>  
>      setup_frametable_mappings(ram_start, ram_end);
>      max_page = PFN_DOWN(ram_end);
> +
> +#ifdef CONFIG_STATIC_MEMORY
> +    init_staticmem_pages();
> +#endif
>  }
>  #endif
>  
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0ddd18e11a..514a2c9022 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -67,6 +67,23 @@ config MEM_ACCESS
>  config NEEDS_LIBELF
>  	bool
>  
> +config STATIC_MEMORY
> +        bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on ARM
> +	---help---
> +	  Static Allocation refers to system or sub-system(domains) for
> +	  which memory areas are pre-defined by configuration using physical
> +          address ranges.
> +
> +	  Those pre-defined memory, -- Static Memory, as parts of RAM reserved
> +	  during system boot-up, shall never go to heap allocator or boot
> +	  allocator for any use.
> +
> +	  When enabled, memory can be statically allocated to a domain using
> +	  the property "xen,static-mem" defined in the domain configuration.
> +
> +	  If unsure, say Y.

I share Jan's comment about indentation, the kconfig message and the
little spurious change below. Aside from those, this patch looks fine to
me.

