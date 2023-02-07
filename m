Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F044A68D64F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491054.760001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPMvl-0005IX-TH; Tue, 07 Feb 2023 12:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491054.760001; Tue, 07 Feb 2023 12:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPMvl-0005Go-QX; Tue, 07 Feb 2023 12:18:37 +0000
Received: by outflank-mailman (input) for mailman id 491054;
 Tue, 07 Feb 2023 12:18:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPMvk-0005Gi-PV
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:18:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPMvk-0000Xg-DT; Tue, 07 Feb 2023 12:18:36 +0000
Received: from [54.239.6.184] (helo=[192.168.19.254])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPMvk-0007kx-6C; Tue, 07 Feb 2023 12:18:36 +0000
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
	bh=rg2h/+YWNrBolKrfXz3DTEOR7mU2DhPRWAjUp61Kjmo=; b=06MlHl9gvfYq9URfQkb9qVJAns
	uIqB4KmPdncAGPcUC+6mTdDadKBdU+P8d5Mz1bUPZLEAc+MLV12OX1CN4ugriwlhFbur1hWFAiTSz
	BeUKacRwuP/mRv+C9EZcB4FzDS4rNdSRyiBPblxGf14gWUBLOQiJ5gYPUkvoQm4uHms8=;
Message-ID: <c4cff350-03c0-9ecc-4d6c-d4f4fc0a1129@xen.org>
Date: Tue, 7 Feb 2023 12:18:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191522170.731018@ubuntu-linux-20-04-desktop>
 <8144403d-0899-5b25-f1b0-f798d4b371a6@amd.com>
 <4f98390c-1cf3-99f3-5131-a42a7ed4387a@xen.org>
 <a741c812-0161-e6a2-8057-7e22d36ea5d9@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a741c812-0161-e6a2-8057-7e22d36ea5d9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 07/02/2023 10:59, Ayan Kumar Halder wrote:
> On 07/02/2023 09:03, Julien Grall wrote:
>>
>>
>> On 06/02/2023 19:21, Ayan Kumar Halder wrote:
>>> Hi Stefano,
>>>
>>> On 19/01/2023 23:24, Stefano Stabellini wrote:
>>>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>>>> One should now be able to use 'paddr_t' to represent address and size.
>>>>> Consequently, one should use 'PRIpaddr' as a format specifier for 
>>>>> paddr_t.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>>
>>>>> Changes from -
>>>>>
>>>>> v1 - 1. Rebased the patch.
>>>>>
>>>>>   xen/arch/arm/domain_build.c        |  9 +++++----
>>>>>   xen/arch/arm/gic-v3.c              |  2 +-
>>>>>   xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>>>>>   xen/drivers/char/exynos4210-uart.c |  2 +-
>>>>>   xen/drivers/char/ns16550.c         |  8 ++++----
>>>>>   xen/drivers/char/omap-uart.c       |  2 +-
>>>>>   xen/drivers/char/pl011.c           |  4 ++--
>>>>>   xen/drivers/char/scif-uart.c       |  2 +-
>>>>>   xen/drivers/passthrough/arm/smmu.c |  6 +++---
>>>>>   9 files changed, 31 insertions(+), 30 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>> index 72b9afbb4c..cf8ae37a14 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -1666,7 +1666,7 @@ static int __init find_memory_holes(const 
>>>>> struct kernel_info *kinfo,
>>>>>       dt_for_each_device_node( dt_host, np )
>>>>>       {
>>>>>           unsigned int naddr;
>>>>> -        u64 addr, size;
>>>>> +        paddr_t addr, size;
>>>>>           naddr = dt_number_of_address(np);
>>>>> @@ -2445,7 +2445,7 @@ static int __init handle_device(struct domain 
>>>>> *d, struct dt_device_node *dev,
>>>>>       unsigned int naddr;
>>>>>       unsigned int i;
>>>>>       int res;
>>>>> -    u64 addr, size;
>>>>> +    paddr_t addr, size;
>>>>>       bool own_device = !dt_device_for_passthrough(dev);
>>>>>       /*
>>>>>        * We want to avoid mapping the MMIO in dom0 for the 
>>>>> following cases:
>>>>> @@ -2941,9 +2941,10 @@ static int __init 
>>>>> handle_passthrough_prop(struct kernel_info *kinfo,
>>>>>           if ( res )
>>>>>           {
>>>>>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>>>> -                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
>>>>> +                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>>>                      kinfo->d->domain_id,
>>>>> -                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 
>>>>> 1);
>>>>> +                   (paddr_t) (mstart & PAGE_MASK),
>>>>> +                   (paddr_t) (PAGE_ALIGN(mstart + size) - 1));
>>>> Why do you need the casts here? mstart is already defined as paddr_t
>>>
>>> Actually, this is because the PAGE_MASK is defined as 'long'. See 
>>> xen/include/xen/page-size.h :-
>>>
>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>>
>>> So, the resultant type inferred is 'long unsigned int'. Thus, we need 
>>> to add an explicit cast.
>>
>> Hmmm... I am a bit confused with this statement. If the resultant type 
>> inferred is actually 'long unsigned int', then why was the current 
>> specifier worked before ('long unsigned int' is 32-bit on Arm32)?
> 
> Before this change, mstart was of type paddr_t (ie u64 ie unsigned long 
> long on Arm_32). When 'unsigned long long' was operated with 'long' (ie 
> PAGE_SIZE), then the resultant type is 'unsigned long long'. The rule 
> from 'C Standard 2011' 
> (https://web.cs.dal.ca/~vlado/pl/C_Standard_2011-n1570.pdf) , page 53 
> (Section 6.3.1.8 Usual arithmetic conversions) is :-
> 
> "Otherwise, if the operand that has unsigned integer type has rank 
> greater or equal to the rank of the type of the other operand, then the 
> operand with signed integer type is converted to the type of the operand 
> with unsigned integer type."
> 
> And from 6.3.1.1
> 
> "The rank of long long int shall be greater than the rank of long int, 
> which shall be greater than the rank of int, which shall be greater than 
> the rank of short int, which shall be greater than the rank of signed char.
> 
> The rank of any unsigned integer type shall equal the rank of the 
> corresponding signed integer type, if any."
> 
> And using 'PRIx64' to print 'unsigned long long' will not require any cast.
> 
> Now with the change,
> mstart is of paddr_t (ie 'unsigned int'). 'unsigned int' operated with 
> 'long', then  the result is 'unsigned long int'. As the rank of 
> 'unsigned long int' > 'int', thus it cannot be printed using PRIx32 
> (integer format specifier) without an explicit cast.
> 
> Please let me know if this makes sense.

Thanks for the explanation. I would expect that there will be several 
places in Xen where we would need such cast.

So it sounds like we want to define paddr_t as ``unsigned long`` and 
update PRIpaddr accordingly.

Cheers,

-- 
Julien Grall

