Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A268D1AF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 09:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490934.759843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJdV-0001HA-6f; Tue, 07 Feb 2023 08:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490934.759843; Tue, 07 Feb 2023 08:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJdV-0001EZ-37; Tue, 07 Feb 2023 08:47:33 +0000
Received: by outflank-mailman (input) for mailman id 490934;
 Tue, 07 Feb 2023 08:47:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPJdU-0001ET-BZ
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 08:47:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPJdT-0003k9-WA; Tue, 07 Feb 2023 08:47:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPJdT-0007jg-R4; Tue, 07 Feb 2023 08:47:31 +0000
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
	bh=MO/N76B90w7ChXb/0G4rt7MHAvghcd+auTqIpGkNNxU=; b=isKtbCa0z2+kcB40DkO51uZntx
	cCmOTtR9tOct9lHBMkNMFIjn/D44BtB1yQztr5IDbsX7e+8yZTlVtZh686izN0MeLeIvevYsdVK15
	pXqht7sh6EitlPBPzIPNByJxJTNXlXTtGMvdAOdc//dKvOy+JKPfnPL9Wz/oago68lWM=;
Message-ID: <265b1d97-8a0b-8388-5edb-3d476ceb77ac@xen.org>
Date: Tue, 7 Feb 2023 08:47:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 20/40] xen/mpu: plump early_fdt_map in MPU systems
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-21-Penny.Zheng@arm.com>
 <78a79c41-e026-b8aa-cfbf-0482f7f5c171@xen.org>
 <AM0PR08MB453088C60654FA1D09FD1692F7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB453088C60654FA1D09FD1692F7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/2023 06:30, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Monday, February 6, 2023 6:11 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 20/40] xen/mpu: plump early_fdt_map in MPU
>> systems
>>
>> Hi,
>>
>> A few more remarks.
>>
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> In MPU system, device tree binary can be packed with Xen image through
>>> CONFIG_DTB_FILE, or provided by bootloader through x0.
>>>
>>> In MPU system, each section in xen.lds.S is PAGE_SIZE aligned.
>>> So in order to not overlap with the previous BSS section, dtb section
>>> should be made page-aligned too.
>>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it happen.
>>>
>>> In this commit, we map early FDT with a transient MPU memory region at
>>> rear with REGION_HYPERVISOR_BOOT.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/include/asm/arm64/mpu.h |  5 +++
>>>    xen/arch/arm/mm_mpu.c                | 63 +++++++++++++++++++++++++---
>>>    xen/arch/arm/xen.lds.S               |  5 ++-
>>>    3 files changed, 67 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h
>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>> index fcde6ad0db..b85e420a90 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -45,18 +45,22 @@
>>>     * [3:4] Execute Never
>>>     * [5:6] Access Permission
>>>     * [7]   Region Present
>>> + * [8]   Boot-only Region
>>>     */
>>>    #define _REGION_AI_BIT            0
>>>    #define _REGION_XN_BIT            3
>>>    #define _REGION_AP_BIT            5
>>>    #define _REGION_PRESENT_BIT       7
>>> +#define _REGION_BOOTONLY_BIT      8
>>>    #define _REGION_XN                (2U << _REGION_XN_BIT)
>>>    #define _REGION_RO                (2U << _REGION_AP_BIT)
>>>    #define _REGION_PRESENT           (1U << _REGION_PRESENT_BIT)
>>> +#define _REGION_BOOTONLY          (1U << _REGION_BOOTONLY_BIT)
>>>    #define REGION_AI_MASK(x)         (((x) >> _REGION_AI_BIT) & 0x7U)
>>>    #define REGION_XN_MASK(x)         (((x) >> _REGION_XN_BIT) & 0x3U)
>>>    #define REGION_AP_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x3U)
>>>    #define REGION_RO_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x2U)
>>> +#define REGION_BOOTONLY_MASK(x)   (((x) >> _REGION_BOOTONLY_BIT)
>> & 0x1U)
>>>
>>>    /*
>>>     * _REGION_NORMAL is convenience define. It is not meant to be used
>>> @@ -68,6 +72,7 @@
>>>    #define REGION_HYPERVISOR_RO
>> (_REGION_NORMAL|_REGION_XN|_REGION_RO)
>>>
>>>    #define REGION_HYPERVISOR         REGION_HYPERVISOR_RW
>>> +#define REGION_HYPERVISOR_BOOT
>> (REGION_HYPERVISOR_RW|_REGION_BOOTONLY)
>>>
>>>    #define INVALID_REGION            (~0UL)
>>>
>>> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c index
>>> 08720a7c19..b34dbf4515 100644
>>> --- a/xen/arch/arm/mm_mpu.c
>>> +++ b/xen/arch/arm/mm_mpu.c
>>> @@ -20,11 +20,16 @@
>>>     */
>>>
>>>    #include <xen/init.h>
>>> +#include <xen/libfdt/libfdt.h>
>>>    #include <xen/mm.h>
>>>    #include <xen/page-size.h>
>>> +#include <xen/pfn.h>
>>> +#include <xen/sizes.h>
>>>    #include <xen/spinlock.h>
>>>    #include <asm/arm64/mpu.h>
>>> +#include <asm/early_printk.h>
>>>    #include <asm/page.h>
>>> +#include <asm/setup.h>
>>>
>>>    #ifdef NDEBUG
>>>    static inline void
>>> @@ -62,6 +67,8 @@ uint64_t __ro_after_init max_xen_mpumap;
>>>
>>>    static DEFINE_SPINLOCK(xen_mpumap_lock);
>>>
>>> +static paddr_t dtb_paddr;
>>> +
>>>    /* Write a MPU protection region */
>>>    #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
>>>        uint64_t _sel = sel;                                                \
>>> @@ -403,7 +410,16 @@ static int xen_mpumap_update_entry(paddr_t
>> base,
>>> paddr_t limit,
>>>
>>>            /* During boot time, the default index is next_fixed_region_idx. */
>>>            if ( system_state <= SYS_STATE_active )
>>> -            idx = next_fixed_region_idx;
>>> +        {
>>> +            /*
>>> +             * If it is a boot-only region (i.e. region for early FDT),
>>> +             * it shall be added from the tail for late init re-organizing
>>> +             */
>>> +            if ( REGION_BOOTONLY_MASK(flags) )
>>> +                idx = next_transient_region_idx;
>>> +            else
>>> +                idx = next_fixed_region_idx;
>>> +        }
>>>
>>>            xen_mpumap[idx] = pr_of_xenaddr(base, limit - 1,
>> REGION_AI_MASK(flags));
>>>            /* Set permission */
>>> @@ -465,14 +481,51 @@ int map_pages_to_xen(unsigned long virt,
>>>                                 mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
>>>    }
>>>
>>> -/* TODO: Implementation on the first usage */ -void
>>> dump_hyp_walk(vaddr_t addr)
>>> +void * __init early_fdt_map(paddr_t fdt_paddr)
>>>    {
>>> +    void *fdt_virt;
>>> +    uint32_t size;
>>> +
>>> +    /*
>>> +     * Check whether the physical FDT address is set and meets the
>> minimum
>>> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to
>> be at
>>> +     * least 8 bytes so that we always access the magic and size fields
>>> +     * of the FDT header after mapping the first chunk, double check if
>>> +     * that is indeed the case.
>>> +     */
>>> +     BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
>>> +     if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
>>> +         return NULL;
>>> +
>>> +    dtb_paddr = fdt_paddr;
>>> +    /*
>>> +     * In MPU system, device tree binary can be packed with Xen image
>>> +     * through CONFIG_DTB_FILE, or provided by bootloader through x0.
>>
>> The behavior you describe is not specific to the MPU system. I also don't
>> quite understand how describing the method to pass the DT actually matters
>> here.
>>
>>> +     * Map FDT with a transient MPU memory region of MAX_FDT_SIZE.
>>> +     * After that, we can do some magic check.
>>> +     */
>>> +    if ( map_pages_to_xen(round_pgdown(fdt_paddr),
>>
>> I haven't looked at the rest of the series. But from here, it seems a bit strange
>> to use map_pages_to_xen() because the virt and the phys should be the
>> same.
>>
> 
> Hmm, t thought map_pages_to_xen, is to set up memory mapping for access.
> In MPU, we also need to set up a MPU memory region for the FDT, even without
> virt-to-phys conversion

I think my point was misunderstood. I agree that we need a function to 
update the MPU. Instead I was asking whether using map_pages_to_xen() 
rather than creating a new helper with an MPU specific would not be 
better so we don't have to pass a pointless parameter (virt). That's why...

> 
>> Do you plan to share some code where map_pages_to_xen() will be used?

... I was asking if you were going to share code with the MMU that may 
end up to use this function.

If yes, then I agree in common code, it would be best to use 
map_pages_to_xen(). For MPU specific code, I would consider to provide 
an helper that doesn't need the virt to reduce the amount of unnecessary 
code.

Cheers,

-- 
Julien Grall

