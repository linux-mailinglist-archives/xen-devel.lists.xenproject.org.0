Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0A9ED3CA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855181.1268191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQgs-0006mc-3j; Wed, 11 Dec 2024 17:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855181.1268191; Wed, 11 Dec 2024 17:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQgs-0006k4-0H; Wed, 11 Dec 2024 17:40:02 +0000
Received: by outflank-mailman (input) for mailman id 855181;
 Wed, 11 Dec 2024 17:40:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tLQgq-0006cD-W6
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:40:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tLQgq-00FZd6-1P;
 Wed, 11 Dec 2024 17:40:00 +0000
Received: from [15.248.2.30] (helo=[10.24.66.86])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tLQgq-00F3JH-1W;
 Wed, 11 Dec 2024 17:40:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=nhFuV5+IEdDAr0T0ihXpY3oY+VU2mzJUxzfxzT/CMiI=; b=qoIpejGKW2JPH5Ik2vjiA0ulOS
	vVqXdmblh4WV3BqM2xzHx+aEvpFXx8Q/qlxE6mXdbTRPTZv70MSQddJaF5YLAYg7KdsEOa2bm7s1V
	4jMoi6MwFlu3Y4rXqqkB0H6+jsX9xte/IM4COa/XAUhLxPTPDva3uHD+4BfFUmP1g15c=;
Message-ID: <f91699f4-1c40-44df-abd1-baa7cef7554e@xen.org>
Date: Wed, 11 Dec 2024 17:39:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/domain_build: Make find_unallocated_memory() more
 generic
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241210101001.91578-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241210101001.91578-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 10/12/2024 10:10, Michal Orzel wrote:
> At the moment, find_unallocated_memory() is only used to retrieve free
> memory ranges for direct mapped domains in order to find extended
> regions. It is not generic as it makes assumptions as for the place at
> which it's being called (domain memory already allocated, gnttab region
> already found) and hardcodes the memory banks to be excluded.
> 
> Make the function more generic, so that it can be used for other
> purposes whenever there is a need to find free host memory regions (e.g.
> upcoming LLC coloring series). Allow passing array with memory banks as a
> parameter together with a callback to populate free regions structure,
> as the logic may differ depending on the needs.
> 
> Add find_host_extended_regions() to be called from make_hypervisor_node()
> to contain the logic to find extended regions for domains using host
> memory layout that are not permitted to use IOMMU.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> This is a prerequisite patch for LLC coloring series patch 3.
> For dom0 LLC coloring, we just need to pass resmem and gnttab in mem_banks.
> ---
>   xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++----------------
>   1 file changed, 55 insertions(+), 42 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 2c30792de88b..500005079b88 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -901,31 +901,26 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>   }
>   
>   /*
> - * Find unused regions of Host address space which can be exposed to Dom0
> - * as extended regions for the special memory mappings. In order to calculate
> - * regions we exclude every region assigned to Dom0 from the Host RAM:
> - * - domain RAM
> - * - reserved-memory
> - * - static shared memory
> - * - grant table space
> + * Find unused regions of Host address space which can be exposed to domain
> + * using the host memory layout (i.e. direct mapped or hardware domain). In

NIT: I would use "e.g." rather than "i.e." because in the future we may 
want to expose the host layout to a guest without necessarily having IPA 
== PA. You could also drop the part in () because one could find the 
definition on top of domain_use_host_layout().

> + * order to calculate regions we exclude every region passed in mem_banks from
> + * the Host RAM.
>    */
>   static int __init find_unallocated_memory(const struct kernel_info *kinfo,
> -                                          struct membanks *ext_regions)
> +                                          const struct membanks *mem_banks[],
> +                                          unsigned int nr_mem_banks,
> +                                          struct membanks *free_regions,
> +                                          int (*cb)(unsigned long s_gfn,
> +                                                    unsigned long e_gfn,
> +                                                    void *data))
>   {
>       const struct membanks *mem = bootinfo_get_mem();
> -    const struct membanks *mem_banks[] = {
> -        kernel_info_get_mem_const(kinfo),
> -        bootinfo_get_reserved_mem(),
> -#ifdef CONFIG_STATIC_SHM
> -        bootinfo_get_shmem(),
> -#endif
> -    };
>       struct rangeset *unalloc_mem;
>       paddr_t start, end;
>       unsigned int i, j;
>       int res;
>   
> -    dt_dprintk("Find unallocated memory for extended regions\n");
> +    ASSERT(domain_use_host_layout(kinfo->d));
>   
>       unalloc_mem = rangeset_new(NULL, NULL, 0);
>       if ( !unalloc_mem )

Cheers,

-- 
Julien Grall


