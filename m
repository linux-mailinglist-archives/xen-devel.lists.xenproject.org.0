Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086CCA6D920
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 12:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925384.1328248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfwI-0007su-L4; Mon, 24 Mar 2025 11:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925384.1328248; Mon, 24 Mar 2025 11:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfwI-0007qY-IJ; Mon, 24 Mar 2025 11:25:54 +0000
Received: by outflank-mailman (input) for mailman id 925384;
 Mon, 24 Mar 2025 11:25:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1twfwG-0007qS-B2
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 11:25:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1twfwG-005XB5-0i;
 Mon, 24 Mar 2025 11:25:51 +0000
Received: from [2a02:8012:3a1:0:c427:8b54:5bca:1d39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1twfwF-00BA6H-2H;
 Mon, 24 Mar 2025 11:25:51 +0000
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
	bh=M8ObZlBiiodlTZMN7j15ifaTDduw5QtJVVLX+572fEM=; b=pKpxLoP3NWEdf2JSaVMApT4Pii
	dZ1Lrsg/eLODzUr1sjNMINidrxBb7QtD5uzJRIb87KfKhzWpdNeCbexq+7xoeIl/1CnD8Alyri+hg
	x5kCfaIUuYE59/VOsQGT3RfUg80swlphfcQlUOdKe0M1TF7rwCW9PYCQ3EQRB8sdYsaY=;
Message-ID: <d7469d5a-080f-44b3-81c8-9d79cab58c7a@xen.org>
Date: Mon, 24 Mar 2025 11:25:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm/efi: merge neighboring banks
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.22.394.2503211403040.2325679@ubuntu-linux-20-04-desktop>
 <85ac456a-ae11-4a04-8d73-dfafba04de98@xen.org>
 <alpine.DEB.2.22.394.2503211534080.2325679@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2503211534080.2325679@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/03/2025 23:11, Stefano Stabellini wrote:
> On Fri, 21 Mar 2025, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 21/03/2025 21:14, Stefano Stabellini wrote:
>>> When booting from U-Boot bootefi, there can be a high number of
>>> neighboring RAM banks. See for example:
>>>
>>> (XEN) RAM: 0000000000000000 - 0000000000bfffff
>>> (XEN) RAM: 0000000000c00000 - 0000000000c00fff
>>> (XEN) RAM: 0000000000c01000 - 0000000000dfffff
>>> (XEN) RAM: 0000000000e00000 - 000000000279dfff
>>> (XEN) RAM: 000000000279e000 - 00000000029fffff
>>> (XEN) RAM: 0000000002a00000 - 0000000008379fff
>>> (XEN) RAM: 000000000837a000 - 00000000083fffff
>>> (XEN) RAM: 0000000008400000 - 0000000008518fff
>>> (XEN) RAM: 0000000008519000 - 00000000085fffff
>>> (XEN) RAM: 0000000008600000 - 0000000008613fff
>>> (XEN) RAM: 0000000008614000 - 00000000097fffff
>>> (XEN) RAM: 0000000009800000 - 00000000098a7fff
>>> (XEN) RAM: 00000000098a8000 - 0000000009dfffff
>>> (XEN) RAM: 0000000009e00000 - 0000000009ea7fff
>>> (XEN) RAM: 0000000009ea8000 - 000000001fffffff
>>> (XEN) RAM: 0000000020000000 - 000000002007ffff
>>> (XEN) RAM: 0000000020080000 - 0000000077b17fff
>>> (XEN) RAM: 0000000077b19000 - 0000000077b2bfff
>>> (XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
>>> (XEN) RAM: 0000000077c8e000 - 0000000077c91fff
>>> (XEN) RAM: 0000000077ca7000 - 0000000077caafff
>>> (XEN) RAM: 0000000077cac000 - 0000000077caefff
>>> (XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
>>> (XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
>>> (XEN) RAM: 0000000077cd8000 - 000000007bd07fff
>>> (XEN) RAM: 000000007bd09000 - 000000007fd5ffff
>>> (XEN) RAM: 000000007fd70000 - 000000007fefffff
>>> (XEN) RAM: 0000000800000000 - 000000087fffffff
>>>
>>> It is undesirable to keep them separate, as this approach consumes more
>>> resources.
>>
>> What resources? This is pre-allocated static array in the binary. They are
>> also dropped after init. The more interesting argument is...
>>
>>>
>>> Additionally, Xen does not currently support boot modules that span
>>> multiple banks: at least one of the regions get freed twice. The first
>>> time from setup_mm->populate_boot_allocator, then again from
>>> discard_initial_modules->fw_unreserved_regions. With a high number of
>>> banks, it can be difficult to arrange the boot modules in a way that
>>> avoids spanning across multiple banks.
>>
>> ... this one. Although, I find weird that U-boot would create tons of banks.
>> Have you considered to ask them what's going on?
>>
>> Also, what about the cases where U-boot is not booting Xen without UEFI? Why
>> is this not a problem? Asking just in case the merge should happen in code
>> common rather than in UEFI.
> 
> I was also curious so I printed all the Types (desc->Type) for each EFI
> region, see below the results.
> 
> DEBUG start=0x0 type=0x7
> DEBUG start=0xc00000 type=0x4
> DEBUG start=0xc01000 type=0x7
> DEBUG start=0xe00000 type=0x4
> DEBUG start=0x279e000 type=0x7
> DEBUG start=0x2a00000 type=0x4
> DEBUG start=0x837a000 type=0x7
> DEBUG start=0x8400000 type=0x4
> DEBUG start=0x8519000 type=0x7
> DEBUG start=0x8600000 type=0x4
> DEBUG start=0x8614000 type=0x7
> DEBUG start=0x9800000 type=0x4
> DEBUG start=0x98a8000 type=0x7
> DEBUG start=0x9e00000 type=0x4
> DEBUG start=0x9ea8000 type=0x7
> DEBUG start=0x20000000 type=0x4
> DEBUG start=0x20080000 type=0x7
> DEBUG start=0x77b19000 type=0x2
> DEBUG start=0x77b2c000 type=0x1
> DEBUG start=0x77c8e000 type=0x4
> DEBUG start=0x77ca7000 type=0x4
> DEBUG start=0x77cac000 type=0x4
> DEBUG start=0x77cd0000 type=0x4
> DEBUG start=0x77cd4000 type=0x4
> DEBUG start=0x77cd8000 type=0x3
> DEBUG start=0x7bd09000 type=0x3
> DEBUG start=0x7fd70000 type=0x3
> DEBUG start=0x800000000 type=0x4
> 
> Looking at EFI_MEMORY_TYPE, 0x4 should be EfiBootServicesData and 0x7
> should be EfiConventionalMemory. So the reason why there are so many
> neighboring regions is that they are of different EFI types. There are
> very many EfiBootServicesData regions, and by the time interesting Xen
> code runs, BootServices are not available anymore, so they can be
> reused. But they are still counted separately from the EFI point of
> view. This cannot happen with the non-EFI boot as there are no
> EfiBootServicesData regions.

Thnks for checking. In which case, I am fine with the current placement 
of the check.

> 
>   
>>> This small patch merges neighboring regions, to make dealing with them
>>> more efficient, and to make it easier to load boot modules.
>>
>> While I understand the value for this, I ...
>>
>>> The patch
>>> also takes the opportunity to check and discard duplicates.
>>
>> don't understand why we need to check for duplicates. This also doesn't
>> properly work for a few reasons:
>>    * This doesn't cover partial overlap
>>    * This would not work if an entry was merged with another previously
>>
>> So I think the code to check duplicates should be removed. If you are
>> concerned about overlap, then it would be better to enable check_reserved
>> just drop the code. If you are concerned about to detect and warn/panic.
> 
> Thanks Julien. No, I am not concerned about duplicates, I thought I
> would add check since I was at it. I am totally fine removing it.
> 
>   
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>>> index a80a5a7ab3..f6f23ed5b2 100644
>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -163,6 +163,20 @@ static bool __init meminfo_add_bank(struct membanks
>>> *mem,
>>>        struct membank *bank;
>>>        paddr_t start = desc->PhysicalStart;
>>>        paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
>>> +    int j;
>>
>> nr_banks is an "unsigned int". So this should be the same type.
> 
> Thank you, good point
> 
>>> +
>>> +    for ( j = 0; j < mem->nr_banks; j++ )
>>> +    {
>>> +        if ( mem->bank[j].start == start && mem->bank[j].size == size )
>>> +        {
>>> +            return true;
>>> +        }
>>> +        else if ( mem->bank[j].start + mem->bank[j].size == start )
>>
>> Please add some parentheses to make it more obvious that you checking (a + b)
>> == size.
> 
> Sure I can do that
> 
> 
>>> +        {
>>> +            mem->bank[j].size += size;
>>> +            return true;
>>> +        }
>>> +    }
>>>          if ( mem->nr_banks >= mem->max_banks )
>>>            return false;
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
>>

Cheers,

-- 
Julien Grall


