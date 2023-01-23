Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376A6789DD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483255.749302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4dJ-000669-Ev; Mon, 23 Jan 2023 21:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483255.749302; Mon, 23 Jan 2023 21:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4dJ-000645-Aw; Mon, 23 Jan 2023 21:45:41 +0000
Received: by outflank-mailman (input) for mailman id 483255;
 Mon, 23 Jan 2023 21:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK4dH-00063z-UO
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 21:45:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4558684d-9b67-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 22:45:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E000D61049;
 Mon, 23 Jan 2023 21:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CE1C433EF;
 Mon, 23 Jan 2023 21:45:33 +0000 (UTC)
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
X-Inumbo-ID: 4558684d-9b67-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674510335;
	bh=ZuPiGptW3KXe3Gus67y+vUCaqRxd7Br0s0k42Kd7ZFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mo5NZw06EPAsOHzp5eaIfVoYB603EpTYjqDpzsoeHiiS6N+L12qA6aG2jRctO7UXr
	 UqhT1aDL5hadel/BQnUb2MyQqG+QmCPq5B/DiMxfwmYzFegc/1bIFBy6f11Waasb1J
	 dH1o1wFMPost/zL6vhc+7UuKIE+CoDA8rLHrvkKubCfBM0E7cpiJr7BOIWwr5aB1hY
	 EMr3i3vfl62fWl4EAMFPFNn6KiL3QrOnT07dLIymx2ktKXyGgHpY9T4QAUyqDzTdri
	 LHah9VN3E5uG/ZfY1EHAY8IVG3J4OTyT43kZYfLDvs1lluZWNWjTozoL9I6ZVPlRB1
	 8rI3mSOcQeHLA==
Date: Mon, 23 Jan 2023 13:45:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
In-Reply-To: <20221216114853.8227-12-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231345010.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-12-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also add a helper function to retrieve it. Change arch_mfns_in_direct_map
> to check this option before returning.
> 
> This is added as a boot command line option, not a Kconfig to allow
> the user to experiment the feature without rebuild the hypervisor.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
>     TODO:
>         * Do we also want to provide a Kconfig option?
> 
>     Changes since Hongyan's version:
>         * Reword the commit message
>         * opt_directmap is only modified during boot so mark it as
>           __ro_after_init
> ---
>  docs/misc/xen-command-line.pandoc | 12 ++++++++++++
>  xen/arch/arm/include/asm/mm.h     |  5 +++++
>  xen/arch/x86/include/asm/mm.h     | 17 ++++++++++++++++-
>  xen/arch/x86/mm.c                 |  3 +++
>  xen/arch/x86/setup.c              |  2 ++
>  5 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index b7ee97be762e..a63e4612acac 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -760,6 +760,18 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>  additionally a trace buffer of the specified size is allocated per cpu.
>  The debug trace feature is only enabled in debugging builds of Xen.
>  
> +### directmap (x86)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Enable or disable the direct map region in Xen.
> +
> +By default, Xen creates the direct map region which maps physical memory
> +in that region. Setting this to no will remove the direct map, blocking
> +exploits that leak secrets via speculative memory access in the direct
> +map.
> +
>  ### dma_bits
>  > `= <integer>`
>  
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 68adcac9fa8d..2366928d71aa 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -406,6 +406,11 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>      } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>  }
>  
> +static inline bool arch_has_directmap(void)
> +{
> +    return true;

Shoudn't arch_has_directmap return false for arm32?



> +}
> +
>  #endif /*  __ARCH_ARM_MM__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index db29e3e2059f..cf8b20817c6c 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -464,6 +464,8 @@ static inline int get_page_and_type(struct page_info *page,
>      ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
>      ASSERT(page_get_owner(_p) == (_d))
>  
> +extern bool opt_directmap;
> +
>  /******************************************************************************
>   * With shadow pagetables, the different kinds of address start
>   * to get get confusing.
> @@ -620,13 +622,26 @@ extern const char zero_page[];
>  /* Build a 32bit PSE page table using 4MB pages. */
>  void write_32bit_pse_identmap(uint32_t *l2);
>  
> +static inline bool arch_has_directmap(void)
> +{
> +    return opt_directmap;
> +}
> +
>  /*
>   * x86 maps part of physical memory via the directmap region.
>   * Return whether the range of MFN falls in the directmap region.
> + *
> + * When boot command line sets directmap=no, we will not have a direct map at
> + * all so this will always return false.
>   */
>  static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
> -    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
> +    unsigned long eva;
> +
> +    if ( !arch_has_directmap() )
> +        return false;
> +
> +    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>  
>      return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>  }
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 041bd4cfde17..e76e135b96fc 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -157,6 +157,9 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>  l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>      l1_fixmap_x[L1_PAGETABLE_ENTRIES];
>  
> +bool __ro_after_init opt_directmap = true;
> +boolean_param("directmap", opt_directmap);
> +
>  /* Frame table size in pages. */
>  unsigned long max_page;
>  unsigned long total_pages;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 1c2e09711eb0..2cb051c6e4e7 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1423,6 +1423,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      if ( highmem_start )
>          xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
>  
> +    printk("Booting with directmap %s\n", arch_has_directmap() ? "on" : "off");
> +
>      /*
>       * Walk every RAM region and map it in its entirety (on x86/64, at least)
>       * and notify it to the boot allocator.
> -- 
> 2.38.1
> 

