Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6397B86ED
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 19:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612723.952787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo5yN-0000yr-TD; Wed, 04 Oct 2023 17:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612723.952787; Wed, 04 Oct 2023 17:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo5yN-0000x9-PU; Wed, 04 Oct 2023 17:47:47 +0000
Received: by outflank-mailman (input) for mailman id 612723;
 Wed, 04 Oct 2023 17:47:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qo5yM-0000x3-B8
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 17:47:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo5yJ-0001ul-Fi; Wed, 04 Oct 2023 17:47:43 +0000
Received: from [15.248.2.150] (helo=[10.24.67.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo5yJ-00040J-A1; Wed, 04 Oct 2023 17:47:43 +0000
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
	bh=7wiNPBCydHHcLigNxTgO0bN6eU8C5J6hjNzjSRtLATo=; b=QhWKaVrOcVtyVw3UgnCgDihix0
	pQxVRaryv6f4jhmUnHruaZyelcC9mrY9wLKTgPTpalOqDQzqGgs8sjX2a4ukDz7LEkEpAZZX2W/1t
	Hu4hftwjyKfX2P/+og7HhLpNJhy6+6n2CpwX2L3vOF56sRyu2sE7/hUAzt8Eiw/UvfIU=;
Message-ID: <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
Date: Wed, 4 Oct 2023 18:47:41 +0100
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
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/10/2023 15:53, Roger Pau Monné wrote:
> On Wed, Oct 04, 2023 at 03:06:14PM +0100, Julien Grall wrote:
>>>>>> Neither of the two behaviors help the users. In fact, I think they only make
>>>>>> the experience worse because you don't know when the issue will happen.
>>>>>>
>>>>>> AFAICT, there is no way for an HVM guestto know which GFN was inuse. So in
>>>>>> all the cases, I can't think of a way for the OS to workaround properly
>>>>>> buggy firmware. Therefore, returning -EBUSY is the safest we can do for our
>>>>>> users and I don't view it as a ABI change (someone rely on the previous
>>>>>> behavior is bound to failure).
>>>>>
>>>>> I fully agree the current behavior might not be the best one, but I do
>>>>> consider this part of the ABI, specially as booting guests using edk2
>>>>> has now stopped working after this change.
>>>>
>>>> Right. If we remove the check, you may be able to boot a guest. But are we
>>>> sure that such guest would run safely?
>>>
>>> If the guest wants the hypervisor to enforce such behavior, let it
>>> use the new hypercall to explicitly request the shared_info page to
>>> not be mapped anywhere else.
>>
>> TBH, I am not convinced the new hypercall is going to help. Let say we
>> decide to modify FreeBSD/Linux to use it, The old EDK2 firmware would still
>> be buggy and this would prevent boot. So we are back the same problem...
>>
>> We could also say we don't support older firmware. But that's not very
>> different from leaving the hypercall as-is and fix EDK2
> 
> We could at least print a warning message that the firmware still had
> the shared_info page mapped, and that the system might not work as
> expected.

Are you suggesting to also fallback on the older hypercall?

> 
>>>
>>> But if you don't trust the bootloader, how do you know it hasn't poked
>>> holes elsewhere in the RAM regions?
>>
>> We don't know. But how do you know the bootloader will not want to continue
>> using the vCPU shared page?
> 
> I don't think it's feasible for two entities to concurrently use the
> shared_info page.
> 
>> For instance, the public headers doesn't seem to mention that the page can
>> only mapped once and it would unmap the previous area. In fact, for Arm,
>> until that commit shared page could be mapped N times... So technically even
>> if we remove the page, the commit already made an ABI change. Yes it is now
>> more inline with x86 but this doesn't this is still an ABI change. I would
>> be surprised if you say we should not have done that because (in particular
>> if you have XSA-379 in mind).
> 
> So we agree at least that there's an ABI change :).
> 
> It's different from 379 because the shared_info page is never freed
> for the lifetime of the domain, hence there's no risk of leak in this
> specific case.  I can see how preventing multiple mappings can be a
> safeguard for possible issues similar to 379.
> 
> Isn't it possible to map a grant at multiple gfns however?

There can be multiple mapping for the grant frame. But there can be 
*only* one mapping for the grant *table* frame.

> 
>>>
>>> Even if the shared_info page has been unmapped, can you be sure the
>>> bootloader has put a RAM page back in that gfn?
>>
>> We can't. But the same goes with the bootloader reserving the region...
>>
>>>
>>> I understand this ABI change is done to avoid bugs, but at the cost of
>>> diverging from x86, and breaking existing firmwares which might not be
>>> buggy.
>> As I pointed out above, the exact behavior of the hypercall is not fully
>> documented and the behavior has changed with some XSAs. So this is no
>> surprise if Arm and x86 behaved differently (even before that commit).
>>
>> There are plenty of behavior I considered wrong in the way x86 update the
>> P2M and I would be concerned if we don't give any leeway for the
>> architectures to tighten the update. BTW some checks have evolved over the
>> time during security event (XSA-378 for example).
> 
> ABI changes due to security issues are unavoidable.
> 
>> This is not very different here. For Arm we decided to not follow a behavior
>> that I consider incorrect and potentially more harmful than trying to
>> support bootloader not removing the shared page.
> 
> I think this is not very friendly to users, specially if edk2 wasn't
> checked.

This was forgotten because it is not yet common to use EDK2 on Xen on 
Arm (the proof is it took one year to find the obvious bug). I agree 
this is not user friendly, but it is impossible to check all the single 
projects. I will usually only look at the one that I know are used on 
Arm and/or someone remind me on the ML.

> I understand the situation is different on Arm vs x86, so if
> edk2 is not supported on arm I guess it doesn't matter much whether
> it's broken.  It would be a much worse issue on x86 where edk2 is
> supported.

AFAIK, we have CI for x86 on EDK2 but we don't on Arm.

> 
>> If we want to handle such firmware, I think it would be better if we provide
>> an hypercall that would return the GFN where it is currently mapped.
> 
> Sure, but such hypercall would be racy, as by the time the gfn is
> returned the value could be stale.  Adding a replacing and non
> replacing XENMEM_add_to_physmap variations would IMO be better.
> 
> Anyway, I don't maintain this, so it's up to you.

Bertrand/Stefano, any opinions?

> 
>>>
>>>> Also, it is not really argument, but this is not the only broken part in
>>>> EDK2 for Xen Arm guests. The other one I know is EDS makes assumption how
>>>> some Device-Tree nodes and this will break on newer Xen.
>>>>
>>>> So overall, it feels to me that EDK2 is not entirely ready to be used in
>>>> production for Xen on Arm guests.
>>>
>>> I really have no insight on this.  What are the supported way of booting
>>> guests on Arm?  (SUPPORT.md doesn't seem to list any firmware for Arm
>>> guests AFAICT).
>>
>> Some bootloaders (e.g. U-boot/EDK2) have support to be used as a fimware for
>> Xen on Arm guests. But they are not supported officially.
>>
>> Most of the setup seems to specify the kernel directly in the XL
>> configuration. We probably ought to add support for EDK2/U-boot.
> 
> I had no idea about that, I do think some kind of firmware is required
> or else OSes different than Linux can't be supported unless they
> implement the Linux entry point.

Indeed. But -ENOTIME and so far no-one else shown any interest :).

> 
> Is the entry point / CPU state for arm guests documented somewhere?

Yes. The protocol is documented in 
https://docs.kernel.org/arch/arm64/booting.html.

> 
> I wonder whether Elliot could use that for FreeBSD until the situation
> with edk2 is stable.

Unfortunately, the situation is unlikely to change if no one puts any 
effort to fix it and add testing.

While I am on the reviewer list for EDK2, I don't have the bandwith to 
rewiew, let alone working on it. In fact, I have been looking for 
someone to replace me as the reviewer for EDK2 in the past few months. 
The role is still open if someone has any interest and more time to 
allocate.

Cheers,

-- 
Julien Grall

