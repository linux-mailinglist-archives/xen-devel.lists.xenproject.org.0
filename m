Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DB8C498E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 00:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721086.1124225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6dyM-0000Xa-Ca; Mon, 13 May 2024 22:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721086.1124225; Mon, 13 May 2024 22:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6dyM-0000Vp-9g; Mon, 13 May 2024 22:16:42 +0000
Received: by outflank-mailman (input) for mailman id 721086;
 Mon, 13 May 2024 22:16:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6dyK-0000Vj-PP
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 22:16:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6dyK-0006oP-Ds; Mon, 13 May 2024 22:16:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6dyK-0004rY-7T; Mon, 13 May 2024 22:16:40 +0000
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
	bh=yJGxVBwvFv0P4HkwqjY3DR40Wmm6BCZQc3wHbEFDdJ4=; b=lZsNgEQ2jxhqD0QmK680gSAev9
	bDhs4OQZq4U9r6hqIeNJNjbBXJsiFKIDinKlzv3U1mKJLDQQgQwSCe8vCv0ZuSwKznrB9W+Jtsr22
	Tu16Otd9KUa7WbLGkoI8dqq5k85vo1x/A3v+BWFhP6wuY2Me7RIhETp4XbrQqj/qUYjY=;
Message-ID: <d295c7ea-d3e4-40c2-8704-6f3cc8a6a651@xen.org>
Date: Mon, 13 May 2024 23:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] xen/arm: Rework dt_unreserved_regions to avoid
 recursion
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240425131119.2299629-1-luca.fancellu@arm.com>
 <20240425131119.2299629-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240425131119.2299629-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 25/04/2024 14:11, Luca Fancellu wrote:
> The function dt_unreserved_regions is currently using recursion
> to compute the non overlapping ranges of a passed region against
> the reserved memory banks, in the spirit of removing the recursion
> to improve safety and also improve the scalability of the function,
> rework its code to use an iterative algorithm with the same result.
> 
> The function was taking an additional parameter 'first', but given
> the rework and given that the function was always initially called
> with this parameter as zero, remove the parameter and update the
> codebase to reflect the change.

In general, I am in favor to remove the recursion. I have some 
questions/remarks below though.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/setup.h        |   8 +-
>   xen/arch/arm/include/asm/static-shmem.h |   7 +-
>   xen/arch/arm/kernel.c                   |   2 +-
>   xen/arch/arm/setup.c                    | 133 ++++++++++++++++--------
>   4 files changed, 96 insertions(+), 54 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index fc6967f9a435..24519b9ed969 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -9,7 +9,12 @@
>   #define MAX_FDT_SIZE SZ_2M
>   
>   #define NR_MEM_BANKS 256
> +
> +#ifdef CONFIG_STATIC_SHM
>   #define NR_SHMEM_BANKS 32
> +#else
> +#define NR_SHMEM_BANKS 0
> +#endif
>   
>   #define MAX_MODULES 32 /* Current maximum useful modules */
>   
> @@ -215,8 +220,7 @@ void create_dom0(void);
>   
>   void discard_initial_modules(void);
>   void fw_unreserved_regions(paddr_t s, paddr_t e,
> -                           void (*cb)(paddr_t ps, paddr_t pe),
> -                           unsigned int first);
> +                           void (*cb)(paddr_t ps, paddr_t pe));
>   
>   size_t boot_fdt_info(const void *fdt, paddr_t paddr);
>   const char *boot_fdt_cmdline(const void *fdt);
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 3b6569e5703f..1b7c7ea0e17d 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -7,11 +7,11 @@
>   #include <asm/kernel.h>
>   #include <asm/setup.h>
>   
> -#ifdef CONFIG_STATIC_SHM
> -
>   /* Worst case /memory node reg element: (addrcells + sizecells) */
>   #define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
>   
> +#ifdef CONFIG_STATIC_SHM
> +
>   int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>                             int sizecells);
>   
> @@ -47,9 +47,6 @@ void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo, __be32 *reg,
>   
>   #else /* !CONFIG_STATIC_SHM */
>   
> -/* Worst case /memory node reg element: (addrcells + sizecells) */
> -#define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
> -

I don't understand how this is related to the rest patch. Can you clarify?

>   static inline int make_resv_memory_node(const struct kernel_info *kinfo,
>                                           int addrcells, int sizecells)
>   {
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 674388fa11a2..ecbeec518754 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -247,7 +247,7 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
>        * Free the original kernel, update the pointers to the
>        * decompressed kernel
>        */
> -    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> +    fw_unreserved_regions(addr, addr + size, init_domheap_pages);
>   
>       return 0;
>   }
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index c4e5c19b11d6..d737fe56e539 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -204,55 +204,97 @@ static void __init processor_id(void)
>   }
>   
>   static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> -                                         void (*cb)(paddr_t ps, paddr_t pe),
> -                                         unsigned int first)
> +                                         void (*cb)(paddr_t ps, paddr_t pe))
>   {
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> -#ifdef CONFIG_STATIC_SHM
> -    const struct membanks *shmem = bootinfo_get_shmem();
> -    unsigned int offset;
> -#endif
> -    unsigned int i;
> -
>       /*
> -     * i is the current bootmodule we are evaluating across all possible
> -     * kinds.
> +     * The worst case scenario is to have N reserved region ovelapping the
> +     * passed one, so having N+1 regions in the stack
>        */
> -    for ( i = first; i < reserved_mem->nr_banks; i++ )
> -    {
> -        paddr_t r_s = reserved_mem->bank[i].start;
> -        paddr_t r_e = r_s + reserved_mem->bank[i].size;
> -
> -        if ( s < r_e && r_s < e )
> -        {
> -            dt_unreserved_regions(r_e, e, cb, i + 1);
> -            dt_unreserved_regions(s, r_s, cb, i + 1);
> -            return;
> -        }
> -    }
> -
> +    struct {
> +        paddr_t s;
> +        paddr_t e;
> +        unsigned int dict;
> +        unsigned int bank;
> +    } stack[NR_MEM_BANKS + NR_SHMEM_BANKS + 1];

If I am not mistaken, the variable could take up to 7KB of the stack. 
This is quite a bit (Xen stack is 32KB on Arm).

AFAIK, the function is not expected to be called concurrently. So it 
would be best to move to .initdata (by adding static __inidata).

Even with that in mind, do we actually need such a large stack?

> +    const struct membanks *mem_banks[] = {
> +        bootinfo_get_reserved_mem(),
>   #ifdef CONFIG_STATIC_SHM
> -    /*
> -     * When retrieving the corresponding shared memory addresses
> -     * below, we need to index the shmem->bank starting from 0, hence
> -     * we need to use i - reserved_mem->nr_banks.
> -    */
> -    offset = reserved_mem->nr_banks;
> -    for ( ; i - offset < shmem->nr_banks; i++ )
> +        bootinfo_get_shmem(),
> +#endif
> +    };
> +    unsigned int count = 0;
> +    unsigned int i, j;

i and j only seemed to be used within the loop. So can this be only be 
declared within it?

> +
> +    /* Push the initial region into the stack */
> +    stack[count].s = s;
> +    stack[count].e = e;
> +    stack[count].dict = 0;
> +    stack[count].bank = 0;
> +    count++;

You are repeating the 5 lines quite a bit. Can we add a wrapper for it? 
This would make the code a bit easier to read.

> +    while ( count > 0 )
>       {
> -        paddr_t r_s = shmem->bank[i - offset].start;
> -        paddr_t r_e = r_s + shmem->bank[i - offset].size;
> -
> -        if ( s < r_e && r_s < e )
> +        paddr_t b_s, b_e;

Coding style: Please add a newline.

> +        /* Take out last element of the stack */
> +        count--;
> +        i = stack[count].dict;
> +        j = stack[count].bank;
> +        b_s = stack[count].s;
> +        b_e = stack[count].e;
> +        /* Start checking for overlapping banks */
> +        for ( ; i < ARRAY_SIZE(mem_banks); i++ )
>           {
> -            dt_unreserved_regions(r_e, e, cb, i + 1);
> -            dt_unreserved_regions(s, r_s, cb, i + 1);
> -            return;
> +            for ( ; j < mem_banks[i]->nr_banks; j++ )
> +            {
> +                paddr_t r_s = mem_banks[i]->bank[j].start;
> +                paddr_t r_e = r_s + mem_banks[i]->bank[j].size;

As you are reworking the code, I would like us to avoid using 'start + 
size' because it could overflow.

I would prefer if we use either start, size or using 'start + size - 1'.

Also coding style: Newlinen missing


> +
> +                if ( b_s < r_e && r_s < b_e )
> +                {
> +                    /*

The line seems to be misindented compare to the other. Or maybe the rest is?

> +                    * Region is overlapping, push the two non overlap ranges in
> +                    * the stack
> +                    */
> +                    if ( (count + 2) < ARRAY_SIZE(stack) )
> +                    {
> +                        /*
> +                         * Push initial non overlapping part of the region into
> +                         * the stack
> +                         */
> +                        stack[count].s = b_s;
> +                        stack[count].e = r_s;
> +                        stack[count].dict = i;
> +                        stack[count].bank = j + 1;
> +                        count++;
> +                        /*
> +                         * Push last non overlapping part of the region into
> +                         * the stack
> +                         */
> +                        stack[count].s = r_e;
> +                        stack[count].e = b_e;
> +                        stack[count].dict = i;
> +                        stack[count].bank = j + 1;
> +                        count++;
> +                    }
> +                    else
> +                        panic("dt_unreserved_regions: stack space exausted");

Can you document in which circumstances this can happen?

> +
> +                    /*
> +                     * Retrieve the last region pushed to check against other
> +                     * banks, so break the loop through the banks and pop
> +                     * a new region from the stack
> +                     */
> +                    goto regions_pushed;
> +                }
> +            }
> +            j = 0;
>           }
> +        /*
> +         * This point is reached when the region doesn't overlap with any other
> +         * region, so call the callback on it.
> +         */
> +        cb(b_s, b_e);
> + regions_pushed:
>       }
> -#endif
> -
> -    cb(s, e);
>   }
>   
>   /*
> @@ -316,11 +358,10 @@ static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
>   }
>   
>   void __init fw_unreserved_regions(paddr_t s, paddr_t e,
> -                                  void (*cb)(paddr_t ps, paddr_t pe),
> -                                  unsigned int first)
> +                                  void (*cb)(paddr_t ps, paddr_t pe))
>   {
>       if ( acpi_disabled )
> -        dt_unreserved_regions(s, e, cb, first);
> +        dt_unreserved_regions(s, e, cb);
>       else
>           cb(s, e);
>   }
> @@ -527,7 +568,7 @@ void __init discard_initial_modules(void)
>                !mfn_valid(maddr_to_mfn(e)) )
>               continue;
>   
> -        fw_unreserved_regions(s, e, init_domheap_pages, 0);
> +        fw_unreserved_regions(s, e, init_domheap_pages);
>       }
>   
>       mi->nr_mods = 0;
> @@ -702,7 +743,7 @@ void __init populate_boot_allocator(void)
>               }
>   #endif
>   
> -            fw_unreserved_regions(s, e, init_boot_pages, 0);
> +            fw_unreserved_regions(s, e, init_boot_pages);
>               s = n;
>           }
>       }

Cheers,

-- 
Julien Grall

