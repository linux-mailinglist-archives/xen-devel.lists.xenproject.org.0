Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771FF9C75D7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 16:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835812.1251666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBF4r-00080w-BX; Wed, 13 Nov 2024 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835812.1251666; Wed, 13 Nov 2024 15:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBF4r-0007zL-7n; Wed, 13 Nov 2024 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 835812;
 Wed, 13 Nov 2024 15:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBF4p-0007zE-P4
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 15:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBF4p-003ISK-0b;
 Wed, 13 Nov 2024 15:14:39 +0000
Received: from [2a02:8012:3a1:0:2c06:4644:c8a3:2b5e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBF4p-0039aN-0Q;
 Wed, 13 Nov 2024 15:14:39 +0000
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
	bh=zn9lsV5UU1QuhWU2/07ayJVrSh3OXaaIFcqLKMhUkIU=; b=3r5iIR/PkP/Exv2jzKqJSXW1ds
	VQCX27zPbWJSffEhlbM4I4b9+g7Rw/bu9nXHgI4NGMQMExgA/vcajXe15UaMqB8qkDCVcLFhQgznd
	8UgPWC5uBQoeJfv2rKAhmF3X8AIWNeeDZsDjoItZ54WbSXiR7j2PxNy/7biieeYNbNgQ=;
Message-ID: <c7f818b8-5dc7-4b16-a5ca-050af6c36be4@xen.org>
Date: Wed, 13 Nov 2024 15:14:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <f0928350-0031-4f74-a61a-778e68a9f67b@xen.org>
 <FA425FB4-7B3D-4FF0-9C94-2E5D8ECA1502@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FA425FB4-7B3D-4FF0-9C94-2E5D8ECA1502@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/11/2024 14:33, Luca Fancellu wrote:
> Hi Julien,

Hi,

>> On 13 Nov 2024, at 14:01, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 06/11/2024 13:41, Luca Fancellu wrote:
>>> There are some cases where the device tree exposes a memory range
>>> in both /memreserve/ and reserved-memory node, in this case the
>>> current code will stop Xen to boot since it will find that the
>>> latter range is clashing with the already recorded /memreserve/
>>> ranges.
>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>> in the /memreserve/ part and even in this case this will prevent
>>> Xen to boot since it will see that the module memory range that
>>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>>> range.
>>> When Xen populate the data structure that tracks the memory ranges,
>>> it also adds a memory type described in 'enum membank_type', so
>>> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
>>> function to check for exact memory range match given a specific memory
>>> type; allowing reserved-memory node ranges and boot modules to have an
>>> exact match with ranges from /memreserve/.
>>> While there, set a type for the memory recorded during ACPI boot.
>>
>> I am a bit confused which you mention only ACPI boot. Isn't the path also used when booting using Device-Tree?
> 
> right, maybe this should be:
> 
> “While there, set a type for the memory recorded using meminfo_add_bank() from eft-boot.h."
> 
>>>
>>>   static bool __init meminfo_overlap_check(const struct membanks *mem,
>>>                                            paddr_t region_start,
>>> -                                         paddr_t region_size)
>>> +                                         paddr_t region_size,
>>> +                                         enum membank_type allow_match_type)
>>
>> Looking at the callers, you only seem to pass MEMBANK_FDT_RESVMEM or MEMBANK_NONE. So I wonder whether it actually make sense to introduce MEMBANK_NONE. Wouldn't it be better to have a boolean indicating whether we are looking for FDT_RESVMEM?
> 
> I wanted to give a more generic approach, but you are right, we could have a boolean like allow_match_memreserve.
> 
> 
>>
>>>   {
>>>       paddr_t bank_start = INVALID_PADDR, bank_end = 0;
>>>       paddr_t region_end = region_start + region_size;
>>> @@ -113,12 +114,16 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>>>           if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
>>>                region_start >= bank_end )
>>>               continue;
>>> -        else
>>> -        {
>>> -            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
>>> -                   region_start, region_end, i, bank_start, bank_end);
>>> -            return true;
>>> -        }
>>> +
>>> +        if ( (allow_match_type != MEMBANK_NONE) &&
>>> +             (region_start == bank_start) && (region_end == bank_end) &&
>>
>> Why is this only an exact match?
> 
> Apparently what we are fixing is only a case where memreserve regions matches exactly modules or reserved_mem nodes.

TBH, as I replied to Michal, I don't understand why we are just focusing 
on just one issue. It would be good to provide some rationale.

> 
>>
>>> +             (allow_match_type == mem->bank[i].type) )
>>> +            continue;
>>> +
>>> +        printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
>>> +                region_start, region_end, i, bank_start, bank_end);
>>> +        return true;
>>> +
>>>       }
>>>         return false;
>>> @@ -169,9 +174,14 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>>>    * with the existing reserved memory regions defined in bootinfo.
>>>    * Return true if the input physical address range is overlapping with any
>>>    * existing reserved memory regions, otherwise false.
>>> + * The 'allow_match_type' parameter can be used to allow exact match of a
>>> + * region with another memory region already recorded, but it needs to be used
>>> + * only on memory regions that allows a type (reserved_mem, acpi). For all the
>>> + * other cases, passing 'MEMBANK_NONE' will disable the exact match.
>>>    */
>>>   bool __init check_reserved_regions_overlap(paddr_t region_start,
>>> -                                           paddr_t region_size)
>>> +                                           paddr_t region_size,
>>> +                                           enum membank_type allow_match_type)
>>>   {
>>>       const struct membanks *mem_banks[] = {
>>>           bootinfo_get_reserved_mem(),
>>> @@ -190,8 +200,21 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>>>        * shared memory banks (when static shared memory feature is enabled)
>>>        */
>>>       for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
>>> -        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
>>> +    {
>>> +        enum membank_type type = allow_match_type;
>>> +
>>> +#ifdef CONFIG_STATIC_SHM
>>> +        /*
>>> +         * Static shared memory banks don't have a type, so for them disable
>>> +         * the exact match check.
>>> +         */
>>
>> This feels a bit of a hack. Why can't we had a default type like you did in meminfo_add_bank()?
> 
> This is the structure:
> 
> struct membank {
>      paddr_t start;
>      paddr_t size;
>      union {
>          enum membank_type type;
> #ifdef CONFIG_STATIC_SHM
>          struct shmem_membank_extra *shmem_extra;
> #endif
>      };
> };

Anonymous union are really annoying... So effectively in 
check_reserved_regions_overlap() we are hoping that the caller will not 
set allow_match_type to another value than MEMBANK_NONE for static 
memory. This is extremely fragile.

I can't think of another solution right now, but I am definitely not 
happy with this approach.

> 
> we did that in order to save space when static shared memory is not enabled, so we can’t have the
> type for these banks because we are already writing shmem_extra.
> 
> We could remove the union but in that case we would waste space when static shared memory is
> enabled.

Can you remind me how much memory this is going to save?

Cheers,

-- 
Julien Grall


