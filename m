Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603D47417E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 12:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246615.425308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx617-0006Y9-Mf; Tue, 14 Dec 2021 11:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246615.425308; Tue, 14 Dec 2021 11:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx617-0006Vl-Jl; Tue, 14 Dec 2021 11:30:45 +0000
Received: by outflank-mailman (input) for mailman id 246615;
 Tue, 14 Dec 2021 11:30:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mx616-0006Vc-Kn
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 11:30:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mx611-0006UC-6p; Tue, 14 Dec 2021 11:30:39 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mx611-00016a-0S; Tue, 14 Dec 2021 11:30:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=JgIY7zp+DbsiQhlfWN/u9itAQOCp6RXi1GyiBcC5k1M=; b=gUTCDcUGkX9kYEYEpwhz2BzEIc
	GZ6KPw2VAdCYFmOQ3iWS9obWS1irypscDHRszYbQTsmOEnPOoB3ejaXMSYfnN56GfvI9n9PHxlJqi
	AK/FwYPYMS1DEpjsyK0vv6vr1TG2Dbn684slR1rQ57AgRZGVxBqGiPgaunFIP8YHrJac=;
Message-ID: <1fcc18d4-70ce-12d1-6d54-ae82e511a4d7@xen.org>
Date: Tue, 14 Dec 2021 11:30:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
 <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
 <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
In-Reply-To: <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/12/2021 11:01, Julien Grall wrote:
> Hi,
> 
> Replying in one e-mail the comments from Jan and Michal.
> 
> On 14/12/2021 10:01, Jan Beulich wrote:
>> On 14.12.2021 10:51, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 14.12.2021 10:33, Julien Grall wrote:
>>>>
>>>>
>>>> On 14/12/2021 09:17, Michal Orzel wrote:
>>>>> Hi Julien, Jan
>>>>
>>>> Hi,
>>>>
>>>>> On 08.12.2021 10:55, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 08/12/2021 07:20, Jan Beulich wrote:
>>>>>>> On 07.12.2021 20:11, Julien Grall wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 07/12/2021 08:37, Michal Orzel wrote:
>>>>>>>>> Hi Julien,
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> On 06.12.2021 16:29, Julien Grall wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>>>>>>>>> to hypervisor when switching to AArch32 state.
>>>>>>>>>>>
>>>>>>>>> I will change to "from AArch32 state".
>>>>>>>>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>>>>>>>>> "If the general-purpose register was accessible from AArch32 
>>>>>>>>>>> state the
>>>>>>>>>>> upper 32 bits either become zero, or hold the value that the 
>>>>>>>>>>> same
>>>>>>>>>>> architectural register held before any AArch32 execution.
>>>>>>>>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>>>>>>>>
>>>>>>>>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>>>>>>>>
>>>>>>>>> Ok.
>>>>>>>>>>>
>>>>>>>>>>> Currently Xen does not ensure that the top 32 bits are zeroed 
>>>>>>>>>>> and this
>>>>>>>>>>> needs to be fixed.
>>>>>>>>>>
>>>>>>>>>> Can you outline why this is a problem and why we need to 
>>>>>>>>>> protect? IIRC, the main concern is Xen may misinterpret what 
>>>>>>>>>> the guest requested but we are not concerned about Xen using 
>>>>>>>>>> wrong value.
>>>>>>>>>>
>>>>>>>>> I would say:
>>>>>>>>> "
>>>>>>>>> The reason why this is a problem is that there are places in 
>>>>>>>>> Xen where we assume that top 32bits are zero for AArch32 guests.
>>>>>>>>> If they are not, this can lead to misinterpretation of Xen 
>>>>>>>>> regarding what the guest requested.
>>>>>>>>> For example hypercalls returning an error encoded in a signed 
>>>>>>>>> long like do_sched_op, do_hmv_op, do_memory_op would return 
>>>>>>>>> -ENOSYS
>>>>>>>>> if the command passed as the first argument was clobbered,
>>>>>>>>> "
>>>>>>>>>>>
>>>>>>>>>>> Fix this bug by zeroing the upper 32 bits of these registers 
>>>>>>>>>>> on an
>>>>>>>>>>> entry to hypervisor when switching to AArch32 state.
>>>>>>>>>>>
>>>>>>>>>>> Set default value of parameter compat of macro entry to 0 
>>>>>>>>>>> (AArch64 mode
>>>>>>>>>>> as we are on 64-bit hypervisor) to avoid checking if 
>>>>>>>>>>> parameter is blank
>>>>>>>>>>> when not passed.
>>>>>>>>>>
>>>>>>>>>> Which error do you see otherwise? Is it a compilation error?
>>>>>>>>>>
>>>>>>>>> Yes, this is a compilation error. The errors appear at each 
>>>>>>>>> line when "entry" is called without passing value for "compat".
>>>>>>>>> So basically in all the places where entry is called with hyp=1.
>>>>>>>>> When taking the current patch and removing default value for 
>>>>>>>>> compat you will get:
>>>>>>>>> ```
>>>>>>>>> entry.S:254: Error: ".endif" without ".if"
>>>>>>>>> entry.S:258: Error: symbol `.if' is already defined
>>>>>>>>> entry.S:258: Error: ".endif" without ".if"
>>>>>>>>> entry.S:262: Error: symbol `.if' is already defined
>>>>>>>>> entry.S:262: Error: ".endif" without ".if"
>>>>>>>>> entry.S:266: Error: symbol `.if' is already defined
>>>>>>>>> entry.S:266: Error: ".endif" without ".if"
>>>>>>>>> entry.S:278: Error: symbol `.if' is already defined
>>>>>>>>> entry.S:278: Error: ".endif" without ".if"
>>>>>>>>> entry.S:292: Error: symbol `.if' is already defined
>>>>>>>>> entry.S:292: Error: ".endif" without ".if"
>>>>>>>>> entry.S:317: Error: symbol `.if' is already defined
>>>>>>>>> entry.S:317: Error: ".endif" without ".if"
>>>>>>>>> ```
>>>>>>>>
>>>>>>>> Thanks for input. I am concerned with your suggested approach 
>>>>>>>> (or using
>>>>>>>> .if 0\compat as suggested by Jan) because they allow the caller 
>>>>>>>> to not
>>>>>>>> properly specify compat when hyp=0. The risk here is we may 
>>>>>>>> generate the
>>>>>>>> wrong entry.
>>>>>>>>
>>>>>>>> compat should need to be specified when hyp=1 as we will always 
>>>>>>>> run in
>>>>>>>> aarch64 mode. So could we protect this code with hyp=0?
>>>>>>>
>>>>>>> Since my suggestion was only to avoid the need for specifying a 
>>>>>>> default
>>>>>>> for the parameter (which you didn't seem to be happy about), it 
>>>>>>> would
>>>>>>> then merely extend to
>>>>>>>
>>>>>>> .if !0\hyp && 0\compat
>>>>>> Isn't it effectively the same as setting a default value?
>>>>>>
>>>>>> The reason we seem to get away is because other part of the macro 
>>>>>> (e.g. entry_guest) will need compat to be valid.
>>>>>>
>>>>>> But that seems pretty fragile to me. So I would prefer if the new 
>>>>>> code it added within a macro that is only called when hyp==0.
>>>>>>
>>>>> So you would like to have a macro that is called if hyp=0 (which 
>>>>> means compat had to be passed) and inside this macro additional 
>>>>> check if compat is 1?
>>>>
>>>> Yes. This is the only way I could think to avoid making 
>>>> 'compat'optional.
>>>>
>>>>>> Cheers,
>>>>>>
>>>>>>>
>>>>>>> or something along those lines.
>>>>>>>
>>>>>>> Jan
>>>>>>>
>>>>>>
>>>>> So when it comes to zeroing the top 32bits by pushing zero to 
>>>>> higher halves of stack slots I would do in a loop:
>>>>> stp wzr, wzr, [sp #8 * 0]
>>>>> stp wzr, wzr, [sp #8 * 1]
>>>>> ...
>>>>
>>>> I don't think you can use stp here because this would store two 
>>>> 32-bit values consecutively. Instead, you would need to use ldr to 
>>>> store one 32-bit value at the time.
>>>>
>>> I hope you meant str and not ldr.
> 
> Yes. I am not sure why I wrote ldr.
> 
>>> So a loop would look like that:
>>> str wzr, [sp, #8 * 1]
>>> str wzr, [sp, #8 * 3]
>>> ...
>>
>> Why "a loop" and why #8 (I'd have expected #4)?
>>
>> There's another oddity which I'm noticing only now, but which also
>> may look odd to me only because I lack sufficient Arm details: On
>> x86, it would not be advisable to store anything below the stack
>> pointer (like is done here when storing x0 and x1 early), unless
>> it's absolutely certain that no further interruptions could clobber
>> that part of the stack.
> 
> We are entering the hypervisor with both Interrupts and SErrors masked. 
> They will only be unmasked after the guest registers have been saved on 
> the stack.
> 
> You may still receive a Data Abort before the macro 'entry' has 
> completed. But this is going to result to an hypervisor crash because 
> they are not meant to happen in those paths.
> 
> So I believe, we are safe to modify sp before.

Hmmm... I meant to write on the stack before sp is modified.

Cheers,

-- 
Julien Grall

