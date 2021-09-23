Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99F4168A2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 01:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194641.346767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYZ8-0006qQ-KA; Thu, 23 Sep 2021 23:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194641.346767; Thu, 23 Sep 2021 23:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYZ8-0006nc-Gc; Thu, 23 Sep 2021 23:55:46 +0000
Received: by outflank-mailman (input) for mailman id 194641;
 Thu, 23 Sep 2021 23:55:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTYZ6-0006nD-4D
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 23:55:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c25fec72-1cc9-11ec-ba94-12813bfff9fa;
 Thu, 23 Sep 2021 23:55:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E0A561042;
 Thu, 23 Sep 2021 23:55:41 +0000 (UTC)
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
X-Inumbo-ID: c25fec72-1cc9-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632441341;
	bh=g1d6plp9n6z37Cp90XkrvmZhdlPUWQ9JIkXZG3vlcYI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sx8JoZhUxXXZtzSfvbzx3o7mmUY2oov2Vh33uRK8HGepEZERxaNekkGehEaWklz8U
	 v76PnrV0MKS9JNyiiUJYmVMUxw3AaZxa3Zv8OY16T3n7CPrzqiZbk5NGundWVI9nx3
	 h4TDIJC9AeDLRvSsrdVC7g38f2qR36nqaxV2CctXTrmMGJAmHRUVWvsoIqc1C5X8i2
	 ABN72Vmns9t7s6141hDVdIAq248azPbHVlvg55r2sq1EuYn75IafJhVWvD3hSlrKNF
	 NRB6nZcZm5+cYBNbuRT64UHU4IOIcViNktFP16cjZdFn9uxl6DP6owqVjtc4uc/aDq
	 SW//apUH7mvAw==
Date: Thu, 23 Sep 2021 16:55:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
In-Reply-To: <20210923120236.3692135-5-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231652340.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-5-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> In current code, when Xen is running in a multiple nodes NUMA
> system, it will set dma_bitsize in end_boot_allocator to reserve
> some low address memory for DMA.
> 
> There are some x86 implications in current implementation. Becuase
                                    ^ the                    ^Because

> on x86, memory starts from 0. On a multiple nodes NUMA system, if
> a single node contains the majority or all of the DMA memory. x86
                                                              ^,

> prefer to give out memory from non-local allocations rather than
> exhausting the DMA memory ranges. Hence x86 use dma_bitsize to set
> aside some largely arbitrary amount memory for DMA memory ranges.
                                     ^ of memory

> The allocations from these memory ranges would happen only after
> exhausting all other nodes' memory.
> 
> But the implications are not shared across all architectures. For
> example, Arm doesn't have these implications. So in this patch, we
> introduce an arch_have_default_dmazone helper for arch to determine
> that it need to set dma_bitsize for reserve DMA allocations or not.
          ^ needs

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c        | 5 +++++
>  xen/common/page_alloc.c    | 2 +-
>  xen/include/asm-arm/numa.h | 5 +++++
>  xen/include/asm-x86/numa.h | 1 +
>  4 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index ce79ee44ce..1fabbe8281 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -371,6 +371,11 @@ unsigned int __init arch_get_dma_bitsize(void)
>                   + PAGE_SHIFT, 32);
>  }
>  
> +unsigned int arch_have_default_dmazone(void)

Can this function return bool?
Also, can it be a static inline?


> +{
> +    return ( num_online_nodes() > 1 ) ? 1 : 0;
> +}
> +
>  static void dump_numa(unsigned char key)
>  {
>      s_time_t now = NOW();
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 5801358b4b..80916205e5 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
>      }
>      nr_bootmem_regions = 0;
>  
> -    if ( !dma_bitsize && (num_online_nodes() > 1) )
> +    if ( !dma_bitsize && arch_have_default_dmazone() )
>          dma_bitsize = arch_get_dma_bitsize();
>  
>      printk("Domain heap initialised");
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 31a6de4e23..9d5739542d 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -25,6 +25,11 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +static inline unsigned int arch_have_default_dmazone(void)
> +{
> +    return 0;
> +}
> +
>  #endif /* __ARCH_ARM_NUMA_H */
>  /*
>   * Local variables:
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 3cf26c2def..8060cbf3f4 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -78,5 +78,6 @@ extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
>  void srat_parse_regions(u64 addr);
>  extern u8 __node_distance(nodeid_t a, nodeid_t b);
>  unsigned int arch_get_dma_bitsize(void);
> +unsigned int arch_have_default_dmazone(void);
>  
>  #endif
> -- 
> 2.25.1
> 

