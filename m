Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190984F246
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678590.1056003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYN87-0001fJ-Us; Fri, 09 Feb 2024 09:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678590.1056003; Fri, 09 Feb 2024 09:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYN87-0001dT-RY; Fri, 09 Feb 2024 09:25:07 +0000
Received: by outflank-mailman (input) for mailman id 678590;
 Fri, 09 Feb 2024 09:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z5rg=JS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rYN86-0001dJ-Ml
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:25:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba4439d-c72d-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 10:25:04 +0100 (CET)
Received: from [192.168.1.9] (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id B06324EE0739;
 Fri,  9 Feb 2024 10:25:03 +0100 (CET)
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
X-Inumbo-ID: 1ba4439d-c72d-11ee-8a4b-1f161083a0e0
Message-ID: <a3586ea2-5ad7-4c64-8e05-00ea0f83518f@bugseng.com>
Date: Fri, 9 Feb 2024 10:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/4] xen: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com>
 <09869431-ed00-4102-93fd-84c697a5c950@suse.com>
 <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
 <41474fe7-c65f-4244-a455-0aaa0e4315e3@suse.com>
 <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com>
 <c6199a60-ecd2-4f8a-b742-199b90e62bac@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <c6199a60-ecd2-4f8a-b742-199b90e62bac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/24 13:40, Jan Beulich wrote:
> On 07.02.2024 13:21, Simone Ballarin wrote:
>> On 07/02/24 11:24, Jan Beulich wrote:
>>> On 07.02.2024 11:03, Simone Ballarin wrote:
>>>> On 06/02/24 13:04, Jan Beulich wrote:
>>>>> On 02.02.2024 16:16, Simone Ballarin wrote:
>>>>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>>>>
>>>>>> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
>>>>>> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
>>>>>> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
>>>>>> of logging effects is always safe.
>>>>>
>>>>> I thought I said so before: When talking of just logging, evaluation order
>>>>> may very well have a impact on correctness. Therefore we shouldn't mix
>>>>> debugging and logging.
>>>>
>>>> My general feeling was that changes like the following one are not supported by
>>>> the community:
>>>>
>>>> - x = { .field1 = function_with_logs_effects() /*other eventual code*/ };
>>>> + int field1 = function_with_logs_effects();
>>>> + x = { .field1 = field1 /*other eventual code*/};
>>>>
>>>> so I tried to deviate as much as possible.
>>>>
>>>> If having log effects is a good reason to do changes like the above, I can
>>>> propose a patch in that sense.
>>>
>>> Just to avoid misunderstandings: I'm not advocating for changes like the
>>> one you outline above. I simply consider the rule too strict: There's
>>> nothing at risk when there's just a single operation with side effects
>>> in an initializer.
>>
>> I agree for the safe cases such as single item list initializers (independently
>> by the number of effect contained in io_apic_read).
>> In fact, I was about to propose in another patch to deviate cases like:
>>
>> union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
>> union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
>>
>>> Even when there are multiple such operations, whether
>>> there's anything at risk depends on whether any of the side effects
>>> actually collide. In a number of cases the compiler would actually warn
>>> (and thus, due to -Werror, the build would fail).
>>>
>>
>> I don't completely agree on that, this requires an in-depth comprehension
>> of the code especially when complex call chains are involved. Moreover
>> these deviations need to be maintained when one of the function involved changes.
> 
> Right, and I didn't really mean multiple function calls here, but e.g.
> multiple ++ or --.
> 
>>>>>> --- a/xen/arch/arm/guestcopy.c
>>>>>> +++ b/xen/arch/arm/guestcopy.c
>>>>>> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>>>>     unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>>>>     {
>>>>>>         return copy_guest((void *)from, (vaddr_t)to, len,
>>>>>> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
>>>>>> +                      /* SAF-4-safe No persistent side effects */
>>>>>> +                      GVA_INFO(current),
>>>>>
>>>>> I _still_ think this leaves ambiguity. The more that you need to look
>>>>> up GVA_INFO() to recognize what this is about.
>>>>
>>>>
>>>> Just to recap: here the point is that current reads a register with a volatile asm, so the
>>>> violation is in the expansion of GVA_INFO(current). Both GVA_INFO and current taken alone
>>>> are completely fine, so this is the only place where a SAF comment can be placed.
>>>>
>>>> The exapansion is:
>>>> ((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&
>>>>      per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({ uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
>>>>      (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));
>>>>
>>>> My proposals are:
>>>> 1) address the violation moving the current expansion outside (extra variable);
>>>> 2) put a more detailed comment to avoid the ambiguity;
>>>> 3) use an ECL deviation for GVA_INFO(current).
>>>>
>>>> Do you have any preference or proposal?
>>>
>>> Imo 3 is not an option at all. Probably 1 wouldn't be too bad here, but
>>> I still wouldn't like it (as matching a general pattern I try to avoid:
>>> introducing local variables that are used just once and don't meaningfully
>>> improve e.g. readability). Therefore out of what you list, 2 would remain.
>>> But I'm not happy with a comment here either - as per above, there's
>>> nothing that can go wrong here as long as there's only a single construct
>>> with side effect(s).
>>>
>> So, would be changing the SAF in:
>> /* SAF-<new_id>-safe single item initializer */
>>
>> OK for you?
> 
> A comment, as said, is only the least bad of what you did enumerate. But
> for this code in particular I'm not a maintainer anyway, so it's not me
> you need to convince. I'm taking this only as an example for discussing
> underlying aspects.
> 
> Jan
> 

I was generally thinking about the comments of this series, and I've
just realised that many of them can be summarized by the following sentence:

"We do not want changes to address violations of R13.1 that are not also violations
of R13.2"

MC3R1.R13.2	rule	The value of an expression and its persistent side effects shall be the same under all permitted evaluation orders
MC3R1.R13.1	rule	Initializer lists shall not contain persistent side effects

At this point, my proposal is to remove R13.1 from the coding standard and add
R13.2 (eventually limiting its scope to initializer lists).
Maybe it is better to re-discuss the rule adoption during the next meeting?


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


