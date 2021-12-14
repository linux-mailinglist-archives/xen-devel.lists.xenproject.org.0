Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEB474021
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 11:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246559.425210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4lO-0001Q8-D7; Tue, 14 Dec 2021 10:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246559.425210; Tue, 14 Dec 2021 10:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4lO-0001OL-9l; Tue, 14 Dec 2021 10:10:26 +0000
Received: by outflank-mailman (input) for mailman id 246559;
 Tue, 14 Dec 2021 10:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COgj=Q7=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mx4lM-0001OF-61
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 10:10:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0c568b2a-5cc6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 11:10:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA7536D;
 Tue, 14 Dec 2021 02:10:21 -0800 (PST)
Received: from [10.57.7.67] (unknown [10.57.7.67])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A218C3F5A1;
 Tue, 14 Dec 2021 02:10:20 -0800 (PST)
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
X-Inumbo-ID: 0c568b2a-5cc6-11ec-9e60-abaf8a552007
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
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
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <ca043814-3d8b-1a4e-6eca-b0078bb851ec@arm.com>
Date: Tue, 14 Dec 2021 11:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 14.12.2021 11:01, Jan Beulich wrote:
> On 14.12.2021 10:51, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 14.12.2021 10:33, Julien Grall wrote:
>>>
>>>
>>> On 14/12/2021 09:17, Michal Orzel wrote:
>>>> Hi Julien, Jan
>>>
>>> Hi,
>>>
>>>> On 08.12.2021 10:55, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 08/12/2021 07:20, Jan Beulich wrote:
>>>>>> On 07.12.2021 20:11, Julien Grall wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 07/12/2021 08:37, Michal Orzel wrote:
>>>>>>>> Hi Julien,
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>>> On 06.12.2021 16:29, Julien Grall wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>>>>>>>> to hypervisor when switching to AArch32 state.
>>>>>>>>>>
>>>>>>>> I will change to "from AArch32 state".
>>>>>>>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>>>>>>>> "If the general-purpose register was accessible from AArch32 state the
>>>>>>>>>> upper 32 bits either become zero, or hold the value that the same
>>>>>>>>>> architectural register held before any AArch32 execution.
>>>>>>>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>>>>>>>
>>>>>>>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>>>>>>>
>>>>>>>> Ok.
>>>>>>>>>>
>>>>>>>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>>>>>>>> needs to be fixed.
>>>>>>>>>
>>>>>>>>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>>>>>>>>
>>>>>>>> I would say:
>>>>>>>> "
>>>>>>>> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
>>>>>>>> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
>>>>>>>> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
>>>>>>>> if the command passed as the first argument was clobbered,
>>>>>>>> "
>>>>>>>>>>
>>>>>>>>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>>>>>>>>> entry to hypervisor when switching to AArch32 state.
>>>>>>>>>>
>>>>>>>>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>>>>>>>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>>>>>>>>> when not passed.
>>>>>>>>>
>>>>>>>>> Which error do you see otherwise? Is it a compilation error?
>>>>>>>>>
>>>>>>>> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
>>>>>>>> So basically in all the places where entry is called with hyp=1.
>>>>>>>> When taking the current patch and removing default value for compat you will get:
>>>>>>>> ```
>>>>>>>> entry.S:254: Error: ".endif" without ".if"
>>>>>>>> entry.S:258: Error: symbol `.if' is already defined
>>>>>>>> entry.S:258: Error: ".endif" without ".if"
>>>>>>>> entry.S:262: Error: symbol `.if' is already defined
>>>>>>>> entry.S:262: Error: ".endif" without ".if"
>>>>>>>> entry.S:266: Error: symbol `.if' is already defined
>>>>>>>> entry.S:266: Error: ".endif" without ".if"
>>>>>>>> entry.S:278: Error: symbol `.if' is already defined
>>>>>>>> entry.S:278: Error: ".endif" without ".if"
>>>>>>>> entry.S:292: Error: symbol `.if' is already defined
>>>>>>>> entry.S:292: Error: ".endif" without ".if"
>>>>>>>> entry.S:317: Error: symbol `.if' is already defined
>>>>>>>> entry.S:317: Error: ".endif" without ".if"
>>>>>>>> ```
>>>>>>>
>>>>>>> Thanks for input. I am concerned with your suggested approach (or using
>>>>>>> .if 0\compat as suggested by Jan) because they allow the caller to not
>>>>>>> properly specify compat when hyp=0. The risk here is we may generate the
>>>>>>> wrong entry.
>>>>>>>
>>>>>>> compat should need to be specified when hyp=1 as we will always run in
>>>>>>> aarch64 mode. So could we protect this code with hyp=0?
>>>>>>
>>>>>> Since my suggestion was only to avoid the need for specifying a default
>>>>>> for the parameter (which you didn't seem to be happy about), it would
>>>>>> then merely extend to
>>>>>>
>>>>>> .if !0\hyp && 0\compat
>>>>> Isn't it effectively the same as setting a default value?
>>>>>
>>>>> The reason we seem to get away is because other part of the macro (e.g. entry_guest) will need compat to be valid.
>>>>>
>>>>> But that seems pretty fragile to me. So I would prefer if the new code it added within a macro that is only called when hyp==0.
>>>>>
>>>> So you would like to have a macro that is called if hyp=0 (which means compat had to be passed) and inside this macro additional check if compat is 1?
>>>
>>> Yes. This is the only way I could think to avoid making 'compat'optional.
>>>
>>>>> Cheers,
>>>>>
>>>>>>
>>>>>> or something along those lines.
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>
>>>> So when it comes to zeroing the top 32bits by pushing zero to higher halves of stack slots I would do in a loop:
>>>> stp wzr, wzr, [sp #8 * 0]
>>>> stp wzr, wzr, [sp #8 * 1]
>>>> ...
>>>
>>> I don't think you can use stp here because this would store two 32-bit values consecutively. Instead, you would need to use ldr to store one 32-bit value at the time.
>>>
>> I hope you meant str and not ldr.
>> So a loop would look like that:
>> str wzr, [sp, #8 * 1]
>> str wzr, [sp, #8 * 3]
>> ...
> 
> Why "a loop" and why #8 (I'd have expected #4)?
> 
You are right. I confused it with stp. #4 is correct.

> There's another oddity which I'm noticing only now, but which also
> may look odd to me only because I lack sufficient Arm details: On
> x86, it would not be advisable to store anything below the stack
> pointer (like is done here when storing x0 and x1 early), unless
> it's absolutely certain that no further interruptions could clobber
> that part of the stack.
> 
I cannot answer this question. Sorry.

> Jan
> 
Cheers

