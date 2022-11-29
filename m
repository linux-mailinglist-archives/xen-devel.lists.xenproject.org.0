Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD563C432
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 16:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449509.706304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02uX-0004G9-7v; Tue, 29 Nov 2022 15:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449509.706304; Tue, 29 Nov 2022 15:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02uX-0004Db-5E; Tue, 29 Nov 2022 15:52:41 +0000
Received: by outflank-mailman (input) for mailman id 449509;
 Tue, 29 Nov 2022 15:52:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p02uV-0004DV-V4
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 15:52:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p02uV-0001ce-Dk; Tue, 29 Nov 2022 15:52:39 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.9.110]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p02uV-0008Gk-4j; Tue, 29 Nov 2022 15:52:39 +0000
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
	bh=X+aui+FkEB8UVyBrf67Ons0+Mula1suZc8wR5AreFx4=; b=xYYaGpWK9aqHo7+IvHmEVWZ4WD
	Wy0Kk1WWwvQIl5ORr6DyWlfrsGsB8VtFC4yJVV/pDIpwORWKU3mWzPnrFGtep9Ivzb6FzR+RgoWvJ
	Etq/Ct5aqVtGxx4LlVlAmhcrw5ob/lgjc8qCvEsNoJgGTdaqrcGXVWaEnJS8S12QVT9A=;
Message-ID: <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
Date: Tue, 29 Nov 2022 15:52:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/11/2022 16:23, Ayan Kumar Halder wrote:
> 
> On 29/11/2022 14:52, Julien Grall wrote:
>>
>>
>> On 29/11/2022 14:57, Ayan Kumar Halder wrote:
>>> Hi All,
>>
>> Hi,
> 
> Hi Julien,
> 
> Many thanks for your inputs.
> 
>>
>>> I am trying to gather opinions on how to support 32 bit physical 
>>> addresses to enable Xen running on R52.
>>>
>>> Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"
>>>
>>> "...This is because the physical address is always the same as the 
>>> virtual address...The virtual and physical address can be treated as 
>>> synonyms for Cortex-R52."
>>>
>>> Thus, I understand that R52 supports 32 bit physical address only. 
>>> This is a bit different from Armv7 systems which supports Large 
>>> Physical Address Extension (LPAE) ie 40 bit physical addresses. >
>>> Please correct me if I misunderstand something. >
>>> So currently, Xen supports 64 bit physical address for Arm_32 (ie 
>>> Armv7) based system.
>>
>> Xen supports *up to* 64-bit physical address. This may be lower in the 
>> HW (not all the Armv7 HW supports 40-bit address).
>>
>>> My aim is to enable support for 32 bit physical address.
>>
>> Technically this is already supported because this is a subset of 
>> 64-bit. I can see a use case (even on non R* HW) where you may want to 
>> use 32-bit paddr_t to reduce the code size (and registers used).
>>
>> But I think that's more an optimization that rather than been necessary.
>>
>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>> index 6014c0f852..4f8b5fc4be 100644
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/arch/arm/bootfdt.c
>>> @@ -56,10 +56,10 @@ static bool __init 
>>> device_tree_node_compatible(const void *fdt, int node,
>>>   }
>>>
>>>   void __init device_tree_get_reg(const __be32 **cell, u32 
>>> address_cells,
>>> -                                u32 size_cells, u64 *start, u64 *size)
>>> +                                u32 size_cells, paddr_t *start, 
>>> paddr_t *size)
>>
>> This needs to stay uint64_t because the Device-Tree may contain 64-bit 
>> values and you...
> 
> Are you saying that the device tree may contain 64 bit addresses even 
> though the platform is 32 bit ?

There should not be any 32-bit address but you don't know what the 
device-tree is containing because this is user input.

This is not the business of the Device-Tree parser to decide whether the 
value should be downcasted or rejected. That's the goal of the callers.

> 
> I think then this approach (ie "typedef u32 paddr_t" for 32 bit system) 
> is incorrect.
I am a bit surprised you came to this conclusion just based on the 
above. As I said before, there are benefits to allow Xen to be built 
with 32-bit (e.g. smaller code size and better use of the register).

> 
> Then, the other option would be to downcast 64 bit physical addresses to 
> 32 bits, when we need to translate pa to va.
> 
> Do you think this approach looks better ?

Some of the changes you propose are questionable (see below).

> Or any better suggestions ?

Rework you previous approach by not touching the Device-Tree code.

> diff --git a/xen/arch/arm/include/asm/mm_mpu.h 
> b/xen/arch/arm/include/asm/mm_mpu.h
> index 306a4c497c..f4f5ae1488 100644
> --- a/xen/arch/arm/include/asm/mm_mpu.h
> +++ b/xen/arch/arm/include/asm/mm_mpu.h
> @@ -89,7 +89,18 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
>   static inline void *maddr_to_virt(paddr_t ma)
>   {
>       /* In MPU system, VA == PA. */
> +#ifdef CONFIG_AARCH32_V8R
> +    /*
> +     * 64 bit physical addresses are not supported.
> +     * Raise a bug if one encounters 64 bit address.
> +     */
> +    if (ma >> BITOP_BITS_PER_WORD)
> +        BUG();
I don't particularly like the runtime check when you should be able to 
sanitize the values before hand.

> +
> +    return (void *) ((uint32_t)(ma & GENMASK(31,0)));

& GENMASK (...) is a bit pointless here given that you above confirmed 
the top 32-bit are zeroed.

> +#else
>       return (void *)ma;
> +#endif
>   }
> 
>   /*
> diff --git a/xen/arch/arm/include/asm/setup.h 
> b/xen/arch/arm/include/asm/setup.h
> index b3330cd584..3f4ac7f475 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -119,7 +119,11 @@ extern struct bootinfo bootinfo;
> 
>   extern domid_t max_init_domid;
> 
> +#ifdef CONFIG_AARCH32_V8R
> +void copy_from_paddr(void *dst, uint32_t paddr, unsigned long len);
> +#else
>   void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> +#endif

I don't understand why the probably needs to be changed here...

> 
>   size_t estimate_efi_size(unsigned int mem_nr_banks);
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 04c05d7a05..7a7386f33a 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -46,7 +46,11 @@ struct minimal_dtb_header {
>    * @paddr: source physical address
>    * @len: length to copy
>    */
> +#ifdef CONFIG_AARCH32_V8R
> +void __init copy_from_paddr(void *dst, uint32_t paddr, unsigned long len)
> +#else
>   void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
> +#endif
>   {
>       void *src = (void *)(unsigned long)paddr;

... because the code should compile without any issue. If you were 
really concern about ignore the top 32-bit, then you could add a 
BUG_ON() (This is OK because this is init code).

> 
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index df43621ee7..62774aebc6 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -29,7 +29,7 @@
>   #include <asm/arm64/fw_shareinfo.h>
>   #endif
> 
> -#ifdef CONFIG_AARCH32_ARMV8_R
> +#ifdef CONFIG_AARCH32_V8R
>   #include <asm/arm32/armv8r/sysregs.h>
>   #endif
> 
> @@ -414,7 +414,18 @@ void *ioremap_attr(paddr_t pa, size_t len, unsigned 
> int attributes)
>           return NULL;
>       }
> 
> +#ifdef CONFIG_AARCH32_V8R
> +    /*
> +     * 64 bit physical addresses are not supported.
> +     * Raise a bug if one encounters 64 bit address.
> +     */
> +    if (pa >> BITOP_BITS_PER_WORD)
> +        BUG();

Why not returning NULL?

> +
> +    return (void *) ((uint32_t)(pa & GENMASK(31,0)));
> +#else
>       return (void *)pa;
> +#endif
>   }
> 
>   static void clear_boot_mpumap(void)
> @@ -1007,7 +1018,19 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>       nr_xen_mpumap++;
> 
>       /* VA == PA */
> +#ifdef CONFIG_AARCH32_V8R
> +
> +    /*
> +     * 64 bit physical addresses are not supported.
> +     * Raise a bug if one encounters 64 bit address.
> +     */
> +    if (fdt_paddr >> BITOP_BITS_PER_WORD)
> +        BUG();

Same here question here.

> +
> +    fdt_virt = (void *) ((uint32_t)(fdt_paddr & GENMASK(31,0)));
> +#else
>       fdt_virt = (void *)fdt_paddr;
> +#endif
> 
>       if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>           return NULL;
> @@ -1165,13 +1188,13 @@ void __init setup_protection_regions()
>           {
>               pr_t region;
>               access_protection_region(true, &region, NULL, i);
> -#ifdef CONFIG_AARCH32_ARMV8_R
> +#ifdef CONFIG_AARCH32_V8R
>               printk("Boot-time Xen MPU memory configuration. #%u : 
> 0x%"PRIx32" - 0x%"PRIx32".\n",
>                      i, pr_get_base(&region), pr_get_limit(&region));
> -#else /* CONFIG_AARCH32_ARMV8_R */
> +#else
>               printk("Boot-time Xen MPU memory configuration. #%u : 
> 0x%"PRIx64" - 0x%"PRIx64".\n",
>                      i, pr_get_base(&region), pr_get_limit(&region));
> -#endif /* CONFIG_AARCH32_ARMV8_R */
> +#endif
>           }
>   }
> 
> @@ -1262,8 +1285,13 @@ static int __init relocate_xen_mpumap(void)
>       if ( !xen_mpumap )
>           return -EINVAL;
> 
> +#ifdef CONFIG_AARCH32_V8R
> +    copy_from_paddr(xen_mpumap, (uint32_t)(pr_t *)boot_mpumap,
> +                    sizeof(pr_t) * next_xen_mpumap_index);
> +#else
>       copy_from_paddr(xen_mpumap, (paddr_t)(pr_t *)boot_mpumap,
>                       sizeof(pr_t) * next_xen_mpumap_index);
> +#endif
> 
>       clear_boot_mpumap();
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 62afb07bc6..a73bf7de01 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
>   {
>       ASSERT(!first_node_initialised);
>       ASSERT(!xenheap_bits);
> +#ifndef CONFIG_AARCH32_V8R
>       BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
> +#endif

BUILD_BUG_ON() are used to indicate that the code would fall over the 
check pass. I can't find the justification for this change in the commit 
message.

It is also not clear why you are modifying this path because so far on 
Arm32 the xenheap and domheap are separated for good reason (i.e. lack 
of address space). Is this going to change with Armv8-R?

Cheers,

-- 
Julien Grall

