Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC560AA14
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429137.679989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxWh-0008Q0-F9; Mon, 24 Oct 2022 13:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429137.679989; Mon, 24 Oct 2022 13:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxWh-0008Nu-Cb; Mon, 24 Oct 2022 13:29:59 +0000
Received: by outflank-mailman (input) for mailman id 429137;
 Mon, 24 Oct 2022 13:29:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omxWf-0008No-PO
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:29:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omxWf-0003dn-98; Mon, 24 Oct 2022 13:29:57 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omxWf-0003Ub-2V; Mon, 24 Oct 2022 13:29:57 +0000
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
	bh=aM/riF4vECwYAPhwt8ZTiViVnrX0guPpxaOLGkWHUCY=; b=rdKc/kGpGtaIZvLmv9KZPDWhic
	Gaf5Wc38FmxOrXrLttieI8ahWTC8CoNO0UhbLQJclH4h2B2D8bxP/4gxXdt5e+cHCRxXHMkliWK9U
	MbNnvjldiViuauI5/I8WnnlbmygvDqkzV+w2w38rl4pYLuFz7X1TDZTZOL9lw0NRnz4k=;
Message-ID: <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
Date: Mon, 24 Oct 2022 14:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Deadcode discussion based on Arm NS phys timer
To: Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/10/2022 12:41, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 24/10/2022 12:51, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 24/10/2022 10:07, Michal Orzel wrote:
>>> Hello,
>>
>> Hi Michal,
>>
>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly speaking, we are routing
>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use of it (as it uses the hypervisor timer CNTHP).
>>> This timer is fully emulated, which means that there is nothing that can trigger such IRQ. This code is
>>> a left over from early days, where the CNTHP was buggy on some models and we had to use the CNTP instead.
>>>
>>> As far as the problem itself is not really interesting, it raises a question of what to do with a deadcode,
>>> as there might be/are other deadcode places in Xen.
>>
>> There are multiple definition of deadcode. Depending on which one you
>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
>> would result to a lot of places impacted with the decision.
>>
>> So can you clarify what you mean by deadcode?
> In the timer example, I think we have both a deadcode and unreachable code.
> For the purpose of this discussion, let's take the MISRA definition of a deadcode which is a "code that can be executed
> but has no effect on the functional behavior of the program". This differs from the unreachable code definition that is
> a "code that cannot be executed". Setting up the IRQ for Xen is an example of a deadcode. Code within IRQ handler is an unreachable code
> (there is nothing that can trigger this IRQ).
> 
> What I mean by deadcode happens to be the sum of the two cases above i.e. the code that cannot be executed as well as the code that
> does not impact the functionality of the program.
> 
>>
>>> One may say that it is useful to keep it, because one day,
>>> someone might need it when dealing with yet another broken HW. Such person would still need to modify the other
>>> part of the code (e.g. reprogram_timer), but there would be less work required overall. Personally, I'm not in favor of
>>> such approach, because we should not really support possible scenarios with broken HW (except for erratas listing known issues).
>>
>> The difference between "broken HW" and "HW with known errata" is a bit
>> unclear to me. Can you clarify how you would make the difference here?
>>
>> In particular, at which point do you consider that the HW should not be
>> supported by Xen?
> I'm not saying that HW should not be supported. The difference for me between broken HW and
> HW with known errata is that for the former, the incorrect behavior is often due to the early support stage,
> using emulators/models instead of real HW, whereas for the latter, the HW is already released and it happens to be that it is buggy
> (the HW vendor is aware of the issue and released erratas). 

Thanks for the clarification. What I would call broken is anything that 
can't be fixed in software. For a not too fictional example, an HW where 
PCI devices are using the same stream ID. So effectively, passthrough 
can't be safely supported.

Regarding, not yet released HW, I don't think Xen should have workaround 
for them. I wouldn't even call it "broken" because they are not yet 
released and it is common to have bug in early revision.

> Do we have any example in Xen for supporting broken HW,
> whose vendor is not aware of the issue or did not release any errata?
I will not cite any HW on the ML. But from my experience, the vendors 
are not very vocal about issues in public (some don't even seem to have 
public doc). The best way to find the issues is to look at Linux commit.

> 
>>
>>> Also, as part of the certification/FUSA process, there should be no deadcode and we should have explanation for every block of code.
>>
>> See above. What are you trying to cover by deadcode? Would protecting
>> code with IS_ENABLED() (or #ifdef) ok?
> I think this would be ok from the certification point of view (this would at least means, that we are aware of the issue
> and we took some steps). Otherwise, such code is just an example of a deadcode/unreachable code.

Thanks for the clarification. So the exact approach will depend on the 
context....

> 
>>
>>>
>>> There are different ways to deal with a deadcode: > 1. Get rid of it completely
>>> 2. Leave it as it is

... this is my preference in the context of the timer. If the other 
don't like it, then 1 would be my preference.

In general, my preference would be either 3.3 or 3.2 (see below).

>>> 3. Admit that it can be useful one day and:
>>>     3.1. protect it with #if 0

#if 0 should not be used in Xen code. IMHO this is the worse of all the 
world.

>>>     3.2. protect it with a new Kconfig option (disabled by default) using #ifdef
>>>     3.3. protect it with a new Kconfig option (disabled by default) using IS_ENABLED (to make sure code always compile)

I would prefer 3.3 over 3.2. 3.2 would be used if it is too difficult to 
get the code compiled when !IS_ENABLED.

Similar to one if this is to move all the affected code in a separate 
file with using obj-$(CONFIG...). That would only work for large chunk 
of code and would be preferred over 3.2.

Cheers,

-- 
Julien Grall

