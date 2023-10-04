Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA17B802D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612556.952507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1XY-0003fg-69; Wed, 04 Oct 2023 13:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612556.952507; Wed, 04 Oct 2023 13:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1XY-0003cN-2B; Wed, 04 Oct 2023 13:03:48 +0000
Received: by outflank-mailman (input) for mailman id 612556;
 Wed, 04 Oct 2023 13:03:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qo1XX-0003ax-3H
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 13:03:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo1XV-0002oA-BV; Wed, 04 Oct 2023 13:03:45 +0000
Received: from [15.248.2.150] (helo=[10.24.67.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo1XV-00039M-4p; Wed, 04 Oct 2023 13:03:45 +0000
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
	bh=GezROckf41SmgRoYqLfbpSt1XOaYxpsGbTBuSaNieog=; b=1eNEuqZe6ZQFLYuu9jz9kUx4+u
	XRe81mp0Z5TA1oTvYFgtKDOwYXESbjraSmH3RyXe0Kx2+hQMqmOMYrHaXlUEZLqNro9mL3JuV5lLG
	bWKrxzMa76jlFVoO6aZOT3dSL7iztBMxA10ge0cSRaoIVp6tQgy7sFNhSIT/XsqA3Ufk=;
Message-ID: <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
Date: Wed, 4 Oct 2023 14:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger> <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 04/10/2023 13:53, Roger Pau Monné wrote:
> On Wed, Oct 04, 2023 at 11:55:05AM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 04/10/2023 09:13, Roger Pau Monné wrote:
>>> On Tue, Oct 03, 2023 at 12:18:35PM -0700, Elliott Mitchell wrote:
>>>> On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
>>>>> On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
>>>>>> I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
>>>>>> the changes with the handling of the shared information page appear to
>>>>>> have broken things for me.
>>>>>>
>>>>>> With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
>>>>>> of the 4.17 release, mapping the shared information page doesn't work.
>>>>>
>>>>> This is due to 71320946d5edf AFAICT.
>>>>
>>>> Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
>>>> This seems a fairly reasonable change, so I had no intention of asking
>>>> for a revert (which likely would have been rejected).  There is also a
>>>> real possibility the -EBUSY comes from elsewhere.  Could also be
>>>> 71320946d5edf caused a bug elsewhere to be exposed.
>>>
>>> A good way to know would be to attempt to revert 71320946d5edf and see
>>> if that fixes your issue.
>>>
>>> Alternatively you can try (or similar):
>>>
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index 6ccffeaea57d..105ef3faecfd 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -1424,6 +1424,8 @@ int xenmem_add_to_physmap_one(
>>>                    page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
>>>            }
>>>            else
>>> +        {
>>> +            printk("%u already mapped\n", space);
>>>                /*
>>>                 * Mandate the caller to first unmap the page before mapping it
>>>                 * again. This is to prevent Xen creating an unwanted hole in
>>> @@ -1432,6 +1434,7 @@ int xenmem_add_to_physmap_one(
>>>                 * to unmap it afterwards.
>>>                 */
>>>                rc = -EBUSY;
>>> +        }
>>>            p2m_write_unlock(p2m);
>>>        }
>>>
>>>>>> I'm using Tianocore as the first stage loader.  This continues to work
>>>>>> fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
>>>>>> While Tianocore does map the shared information page, my reading of their
>>>>>> source is that it properly unmaps the page and therefore shouldn't cause
>>>>>> trouble.
>>>>>>
>>>>>> Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
>>>>>> the recommended address range, but my understanding is this is supposed
>>>>>> to be okay.
>>>>>>
>>>>>> The return code is -16, which is EBUSY.
>>>>>>
>>>>>> Ideas?
>>>>>
>>>>> I think the issue is that you are mapping the shared info page over a
>>>>> guest RAM page, and in order to do that you would fist need to create
>>>>> a hole and then map the shared info page.  IOW: the issue is not with
>>>>> edk2 not having unmapped the page, but with FreeBSD trying to map the
>>>>> shared_info over a RAM page instead of a hole in the p2m.  x86
>>>>> behavior is different here, and does allow mapping the shared_info
>>>>> page over a RAM gfn (by first removing the backing RAM page on the
>>>>> gfn).
>>>>
>>>> An interesting thought.  I thought I'd tried this, but since I didn't see
>>>> such in my experiments list.  What I had tried was removing all the pages
>>>> in the suggested mapping range.  Yet this failed.
>>>
>>> Yeah, I went too fast and didn't read the code correctly, it is not
>>> checking that the provided gfn is already populated, but whether the
>>> mfn intended to be mapped is already mapped at a different location.
>>>
>>>> Since this seemed reasonable, I've now tried and found it fails.  The
>>>> XENMEM_remove_from_physmap call returns 0.
>>>
>>> XENMEM_remove_from_physmap returning 0 is fine, but it seems to me
>>> like edk2 hasn't unmapped the shared_info page.  The OS has no idea
>>> at which position the shared_info page is currently mapped, and hence
>>> can't do anything to attempt to unmap it in order to cover up for
>>> buggy firmware.
>>>
>>> edk2 should be the entity to issue the XENMEM_remove_from_physmap
>>> against the gfn where it has the shared_info page mapped.  Likely
>>> needs to be done as part of ExitBootServices() method.
>>>
>>> FWIW, 71320946d5edf is an ABI change, and as desirable as such
>>> behavior might be, a new hypercall should have introduced that had the
>>> behavior that the change intended to retrofit into
>>> XENMEM_add_to_physmap.
>> I can see how you think this is an ABI change but the previous behavior was
>> incorrect. Before this patch, on Arm, we would allow the shared page to be
>> mapped twice. As we don't know where the firmware had mapped it this could
>> result to random corruption.
>>
>> Now, we could surely decide to remove the page as x86 did. But this could
>> leave a hole in the RAM. As the OS would not know where the hole is, this
>> could lead to page fault randomly during runtime.
> 
> I would say it's the job of the firmware to notify the OS where the
> hole is, by modifying the memory map handled to the OS.  Or else
> mapping the shared_info page in an unpopulated p2m hole.

I agree but I am not convinced that they are all doing it. At least 
U-boot didn't do it before we fixed it.

> 
> When using UEFI there's RAM that will always be in-use by the
> firmware, as runtime services cannot be shut down, and hence the
> firmware must already have a way to remove/reserve such region(s) on
> the memory map.

Can either you or Elliott confirm if EDK2 reserve the region?

> 
>> Neither of the two behaviors help the users. In fact, I think they only make
>> the experience worse because you don't know when the issue will happen.
>>
>> AFAICT, there is no way for an HVM guestto know which GFN was inuse. So in
>> all the cases, I can't think of a way for the OS to workaround properly
>> buggy firmware. Therefore, returning -EBUSY is the safest we can do for our
>> users and I don't view it as a ABI change (someone rely on the previous
>> behavior is bound to failure).
> 
> I fully agree the current behavior might not be the best one, but I do
> consider this part of the ABI, specially as booting guests using edk2
> has now stopped working after this change.

Right. If we remove the check, you may be able to boot a guest. But are 
we sure that such guest would run safely?

Also, it is not really argument, but this is not the only broken part in 
EDK2 for Xen Arm guests. The other one I know is EDS makes assumption 
how some Device-Tree nodes and this will break on newer Xen.

So overall, it feels to me that EDK2 is not entirely ready to be used in 
production for Xen on Arm guests.

Cheers,

-- 
Julien Grall

