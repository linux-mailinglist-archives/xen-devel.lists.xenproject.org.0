Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549C2CA24C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 13:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41896.75404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4X3-00059j-Od; Tue, 01 Dec 2020 12:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41896.75404; Tue, 01 Dec 2020 12:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4X3-00059L-LG; Tue, 01 Dec 2020 12:13:21 +0000
Received: by outflank-mailman (input) for mailman id 41896;
 Tue, 01 Dec 2020 12:13:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kk4X2-00059G-Dx
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 12:13:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk4X0-0002yS-Nh; Tue, 01 Dec 2020 12:13:18 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk4X0-0002CL-DP; Tue, 01 Dec 2020 12:13:18 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ef7qC0uAHcI2Y0FkRg9bQl35p9Ox/+EmcfDWLzISWWA=; b=nvgdgIxDjsk3G2RrcN1rNolgCJ
	B4/+MrWFttzgzlZVSmT0e3pam6SyeReHh1V8ssx03TmxwVpktyl8FoJ0YBv70swIWdLPCgoVsxYhN
	MrGWnZYh0T7DWABBCrKOZ3J0afmjdzlK45yZ0g/VH3xhrKHA/2YSkrWHeMPq7v09FXOw=;
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Oleksandr <olekstysh@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
 <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
 <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
 <932d7826-7e48-aaee-d566-44c384f84e1c@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a7e9a898-c096-2506-c944-b465f60d153c@xen.org>
Date: Tue, 1 Dec 2020 12:13:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <932d7826-7e48-aaee-d566-44c384f84e1c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 01/12/2020 10:42, Oleksandr wrote:
> 
> On 01.12.20 12:30, Julien Grall wrote:
> 
> Hi Julien
> 
>> Hi Jan,
>>
>> On 01/12/2020 07:55, Jan Beulich wrote:
>>> On 01.12.2020 00:27, Oleksandr wrote:
>>>> On 30.11.20 23:03, Volodymyr Babchuk wrote:
>>>>> Oleksandr Tyshchenko writes:
>>>>>> --- a/xen/include/asm-arm/traps.h
>>>>>> +++ b/xen/include/asm-arm/traps.h
>>>>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const 
>>>>>> struct cpu_user_regs *regs)
>>>>>>            (unsigned long)abort_guest_exit_end == regs->pc;
>>>>>>    }
>>>>>>    +/* Check whether the sign extension is required and perform it */
>>>>>> +static inline register_t sign_extend(const struct hsr_dabt dabt, 
>>>>>> register_t r)
>>>>>> +{
>>>>>> +    uint8_t size = (1 << dabt.size) * 8;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Sign extend if required.
>>>>>> +     * Note that we expect the read handler to have zeroed the bits
>>>>>> +     * outside the requested access size.
>>>>>> +     */
>>>>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * We are relying on register_t using the same as
>>>>>> +         * an unsigned long in order to keep the 32-bit assembly
>>>>>> +         * code smaller.
>>>>>> +         */
>>>>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>>>>> +        r |= (~0UL) << size;
>>>>> If `size` is 64, you will get undefined behavior there.
>>>> I think, we don't need to worry about undefined behavior here. Having
>>>> size=64 would be possible with doubleword (dabt.size=3). But if "r"
>>>> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
>>>> we deal with byte, halfword or word operations (dabt.size<3). Or I
>>>> missed something?
>>>
>>> At which point please put in a respective ASSERT(), possibly amended
>>> by a brief comment.
>>
>> ASSERT()s are only meant to catch programatic error. However, in this 
>> case, the bigger risk is an hardware bug such as advertising a sign 
>> extension for either 64-bit (or 32-bit) on Arm64 (resp. Arm32).
>>
>> Actually the Armv8 spec is a bit more blurry when running in AArch32 
>> state because they suggest that the sign extension can be set even for 
>> 32-bit access. I think this is a spelling mistake, but it is probably 
>> better to be cautious here.
>>
>> Therefore, I would recommend to rework the code so it is only called 
>> when len < sizeof(register_t).
> 
> I am not sure I understand the recommendation, could you please clarify 
> (also I don't see 'len' being used here).

Sorry I meant 'size'. I think something like:

if ( dabt.sign && (size < sizeof(register_t)) &&
      (r & (1UL << (size - 1)) )
{
}

Another posibility would be:

if ( dabt.sign && (size < sizeof(register_t)) )
{
    /* find whether the sign bit is set and propagate it */
}

I have a slight preference for the latter as the "if" is easier to read.

In any case, I think this change should be done in a separate patch (I 
don't mint whether this is done after or before this one).

Cheers,

-- 
Julien Grall

