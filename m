Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7C6CA5F3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 15:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515268.797967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgmvm-0001JO-QL; Mon, 27 Mar 2023 13:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515268.797967; Mon, 27 Mar 2023 13:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgmvm-0001HD-NM; Mon, 27 Mar 2023 13:30:38 +0000
Received: by outflank-mailman (input) for mailman id 515268;
 Mon, 27 Mar 2023 13:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgmvl-0001DJ-Na
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 13:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgmvf-0004iM-7g; Mon, 27 Mar 2023 13:30:31 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.159.134]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgmvf-0001CX-0v; Mon, 27 Mar 2023 13:30:31 +0000
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
	bh=0w4eaeq9Lfd+yXEK8y0mAhZ0dwtwPsfxGDccO9Wy6Yg=; b=hNnDSSJ4bxWXec6O7wm86kMVQ+
	GcW41e7gnurGwsj7evyAEVOzEbk/O7wRzoOCB6LDptcn0PacUEaL080tFww5rDIoWy5HVyS1INLn5
	ucRYGehnS5h//RXBzZpanPzpMtVYI38zu0eDgcK8O44PE4Jt72XdEGT8b3MjoW+4hXRA=;
Message-ID: <358be266-9478-dee9-2dc7-58d54e894d1a@xen.org>
Date: Mon, 27 Mar 2023 14:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
 <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
 <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
 <205658ff-e0ac-1656-2d12-099abd891fcd@suse.com>
 <ac320354-454f-f6e6-d2b6-a470b66c7ec7@xen.org>
 <d9f3ef97-1101-ac4b-57b9-be0fa19a7310@suse.com>
 <f8146b63-5dc5-beec-613d-d842cd225aea@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f8146b63-5dc5-beec-613d-d842cd225aea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/03/2023 12:46, Ayan Kumar Halder wrote:
> On 22/03/2023 13:53, Jan Beulich wrote:
>> On 22.03.2023 14:29, Julien Grall wrote:
>>> On 22/03/2023 06:59, Jan Beulich wrote:
>>>> On 21.03.2023 19:33, Ayan Kumar Halder wrote:
>>>>> On 21/03/2023 16:53, Jan Beulich wrote:
>>>>>> On 21.03.2023 17:15, Ayan Kumar Halder wrote:
>>>>>>> On 21/03/2023 14:22, Jan Beulich wrote:
>>>>>>>> (Using "unsigned long" for a 32-bit paddr_t is of
>>>>>>>> course suspicious as well - this ought to be uint32_t.)
>>>>>>> The problem with using uint32_t for paddr_t is that there are 
>>>>>>> instances
>>>>>>> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
>>>>>>>
>>>>>>> For eg , handle_passthrough_prop()
>>>>>>>
>>>>>>>                 printk(XENLOG_ERR "Unable to permit to dom%d 
>>>>>>> access to"
>>>>>>>                        " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>>>>>                        kinfo->d->domain_id,
>>>>>>>                        mstart & PAGE_MASK, PAGE_ALIGN(mstart + 
>>>>>>> size) - 1);
>>>>>>>
>>>>>>> And in xen/include/xen/page-size.h,
>>>>>>>
>>>>>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>>>>>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>>>>>>
>>>>>>> Thus, the resulting types are unsigned long. This cannot be printed
>>>>>>> using %u for PRIpaddr.
>>>>>> Is there anything wrong with making PAGE_SIZE expand to (1 << 
>>>>>> PAGE_SHIFT)
>>>>>> when physical addresses are only 32 bits wide?
>>>>> I don't have a strong objection except that this is similar to what
>>>>> linux is doing today.
>>>>>
>>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/page.h#L12
>>>>>
>>>>>>> I remember some discussion (or comment) that the physical addresses
>>>>>>> should be represented using 'unsigned long'.
>>>>>> A reference would be helpful.
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00305.html
>>>> I see. I guess this will be okay as long as only 32-bit arches elect to
>>>> use 32-bit physical addresses. Maybe there should be a BUILD_BUG_ON()
>>>> somewhere, accompanied by a suitable comment?
>>> Hmmm... We definitely have 40-bits physical address space on Arm32. In
>>> fact, my suggestion was not to define paddr_t as unsigned long for
>>> everyone but only when PHYS_ADDR_T_32 is selected (AFAICT this is what
>>> is done in this patch).
>>>
>>> This is to avoid having to add cast everywhere we are using PAGE_* on
>>> paddr_t and print it.
>>>
>>> That said, I realize this means that for 64-bit, we would still use
>>> 64-bit integer. I view it as a less a problem (at least on Arm) because
>>> registers are always 64-bit. I am open to other suggestion.
>> It simply struck me as odd to use a 64-bit type for something that was
>> explicitly said is only going to be 32 bits wide. I would therefore
>> prefer if we could limit 32-bit paddr_t to 32-bit architectures for
>> now, as expressed before when asking for a respective BUILD_BUG_ON().
>> Especially if, as intended, the type definition moves to xen/types.h
>> (and hence isn't Arm-specific anymore).
>>
>> Jan
> 
> Please have a look at the below patch and let me know your thoughts. 
> This patch now :-
> 
> 1. Removes the config "PHYS_ADDR_T_64".  So when PHYS_ADDR_T_32 is not 
> selected, it means that physical addresses are to be denoted by 64 bits.
> 
> 2. Added a BUILD_BUG_ON() to check that paddr_t is exactly 32-bit wide 
> when CONFIG_PHYS_ADDR_T_32 is selected. As 32-bit Arm architecture 
> (Arm_32) can support 40 bits PA with LPAE, thus we cannot always use 
> 32-bit paddr_t.
> 
> 3. For Jan's concern that the changes to 
> xen/arch/arm/include/asm/types.h will complicate movement to common 
> header, I think we will need to use CONFIG_PHYS_ADDR_T_32 to define 
> types for 32-bit physical addresses.
> 
> I am open to any alternative suggestions that you propose.
> 
> 
> commit 3a61721a5169072b4aa3bbd0df38de5e69a5abc1
> Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Date:   Wed Feb 8 12:05:26 2023 +0000
> 
>      xen/arm: Introduce choice to enable 64/32 bit physical addressing
> 
>      Some Arm based hardware platforms which does not support LPAE
>      (eg Cortex-R52), uses 32 bit physical addresses.
>      Also, users may choose to use 32 bits to represent physical addresses
>      for optimization.
> 
>      To support the above use cases, we have introduced arch independent
>      configs to choose if the physical address can be represented using
>      32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
>      For now only ARM_32 provides support to enable 32 bit physical
>      addressing.
> 
>      When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
>      When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 
> 40.
>      When PHYS_ADDR_T_32 is not defined for ARM_64, PADDR_BITS is set to 
> 48.
>      The last two are same as the current configuration used today on Xen.
> 
>      PADDR_BITS is also set to 48 when ARM_64 is defined. The reason being
>      the choice to select ARM_PA_BITS_32/ARM_PA_BITS_40/ARM_PA_BITS_48 is
>      currently allowed when ARM_32 is defined.
> 
>      Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 7028f7b74f..67ba38f32f 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,9 @@
>   config 64BIT
>      bool
> 
> +config PHYS_ADDR_T_32
> +   bool
> +
>   config NR_CPUS
>      int "Maximum number of CPUs"
>      range 1 4095
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..e6dadeb8b1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,13 +19,46 @@ config ARM
>      select HAS_PMAP
>      select IOMMU_FORCE_PT_SHARE
> 
> +menu "Architecture Features"
> +
> +choice
> +   prompt "Physical address space size" if ARM_32
> +   default ARM_PA_BITS_48 if ARM_64
> +   default ARM_PA_BITS_40 if ARM_32
> +   help
> +     User can choose to represent the width of physical address. This can
> +     sometimes help in optimizing the size of image when user chooses a
> +     smaller size to represent physical address.
> +
> +config ARM_PA_BITS_32
> +   bool "32-bit"
> +   help
> +     On platforms where any physical address can be represented within 
> 32 bits
> +     , user should choose this option. This will help is reduced size 
> of the

Typo: I think it is more common to have the ',' at the end of the line 
rather than a the beginning followed by a space.

> +     binary.
> +   select PHYS_ADDR_T_32
> +   depends on ARM_32
> +
> +config ARM_PA_BITS_40
> +   bool "40-bit"
> +   depends on ARM_32
> +
> +config ARM_PA_BITS_48
> +   bool "40-bit"
> +   depends on ARM_48
> +endchoice
> +
> +config PADDR_BITS
> +   int
> +   default 32 if ARM_PA_BITS_32
> +   default 40 if ARM_PA_BITS_40
> +   default 48 if ARM_PA_BITS_48 || ARM_64
> +
>   config ARCH_DEFCONFIG
>      string
>      default "arch/arm/configs/arm32_defconfig" if ARM_32
>      default "arch/arm/configs/arm64_defconfig" if ARM_64
> 
> -menu "Architecture Features"
> -
>   source "arch/Kconfig"
> 
>   config ACPI
> diff --git a/xen/arch/arm/include/asm/page-bits.h 
> b/xen/arch/arm/include/asm/page-bits.h
> index 5d6477e599..deb381ceeb 100644
> --- a/xen/arch/arm/include/asm/page-bits.h
> +++ b/xen/arch/arm/include/asm/page-bits.h
> @@ -3,10 +3,6 @@
> 
>   #define PAGE_SHIFT              12
> 
> -#ifdef CONFIG_ARM_64
> -#define PADDR_BITS              48
> -#else
> -#define PADDR_BITS              40
> -#endif
> +#define PADDR_BITS              CONFIG_PADDR_BITS
> 
>   #endif /* __ARM_PAGE_SHIFT_H__ */
> diff --git a/xen/arch/arm/include/asm/types.h 
> b/xen/arch/arm/include/asm/types.h
> index e218ed77bd..e3cfbbb060 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -34,9 +34,15 @@ typedef signed long long s64;
>   typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
> +#if defined(CONFIG_PHYS_ADDR_T_32)
> +typedef unsigned long paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "08lx"
> +#else
>   typedef u64 paddr_t;
>   #define INVALID_PADDR (~0ULL)
>   #define PRIpaddr "016llx"
> +#endif
>   typedef u32 register_t;
>   #define PRIregister "08x"
>   #elif defined (CONFIG_ARM_64)
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b99806af99..6dc37be97e 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -690,6 +690,11 @@ void __init setup_frametable_mappings(paddr_t ps, 
> paddr_t pe)
>       const unsigned long mapping_size = frametable_size < MB(32) ? 
> MB(2) : MB(32);
>       int rc;
> 
> +   /* Check that paddr_t is exactly 32 bits when CONFIG_PHYS_ADDR_T_32 
> is defined */

This is only describing the BUILD_BUG_ON() in words but don't really say 
why. In fact...

> 
> +   #ifdef  CONFIG_PHYS_ADDR_T_32
> 
> +   BUILD_BUG_ON((sizeof(paddr_t) * 8) != 32);
> 
> +  #endif

... nothing really wrong will happen if paddr_t is bigger. The code will 
just be less optimized. So I would drop it.

If there is a desire to keep it then it should be moved in 
build_assertions() with a suitable comment (e.g. what could go wrong if 
the build assertion fail).

Cheers,

-- 
Julien Grall

