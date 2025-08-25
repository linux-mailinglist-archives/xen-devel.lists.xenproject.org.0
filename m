Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8998B3405E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 15:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093158.1448716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqWvr-0003K8-Ep; Mon, 25 Aug 2025 13:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093158.1448716; Mon, 25 Aug 2025 13:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqWvr-0003Hg-BY; Mon, 25 Aug 2025 13:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1093158;
 Mon, 25 Aug 2025 13:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF0Q=3F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uqWvp-0003Ha-QN
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 13:08:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d334357-81b4-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 15:08:11 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 060CE4EEBC47;
 Mon, 25 Aug 2025 15:08:10 +0200 (CEST)
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
X-Inumbo-ID: 8d334357-81b4-11f0-a32c-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756127290;
	b=KoFYYTcftQ0p2lPjbjUJnRvSuqBwjN0jmIOiT+zbMzOLX27N4JO5ERewVTFK82N94DvK
	 GNWodJ3ag5VaMzIYtJ8seJwEu2ll42OawhPxxgC0z7Fegq9wAC9plUdRTCC1p5qa3PIzs
	 3HOwsF1AN4HNzUw7+uebkJohlivrGpNOtWwsZV/bn+zXFf6cPZYDeN3feP9oTx61zWImp
	 yValnXuMrnVz1nox4zAr/jE6kkSxRJ+v7F7ozLAk92UxdHFb+N1qrcY3Ur3skTFrb27tA
	 jHZtpSoy25JTDXROpVJZF+oO24FGza/M6UqMvvQiWdmO16sJ2l4EZi7+vERXa3AHF8RdI
	 +7YIcfseHvqNAF94P6axaRfI8B7s/WtcWJt3yCo0cYoAZFKz1Wy7AuYinGyHN3NmIdMng
	 ja/wnIJaZbe7Fdi9GY7YtUXaeYIl4Rm/JeAlGatNyIuxJLHVKqvO62OoTiu/fKekosoeb
	 IhclqXD/d67rZoDrKZ7Xl2Y3y2VbquI8XgagmI0OqvHpC0DEgB3+RReN5mUipRvupGyKm
	 wgsmFSZ4nEnQ1g2RSZKAanjlbXPjG8TLMdkMF9ivEZhKozAB5eLldi1Uqnk+Lebzezruw
	 I/iKESQa1lGebQhD8GjOUBLwWhm3NT08Oo9HOWZk9yOGpmGGav2Hve9fQLQKw4c=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756127290;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=XNdfXwJHTxh9Voyqx8P7Jkzf/DkyOueO4hluQeTx6KE=;
	b=p/W7CW6ZFvpNnzdJdLnq8m6JpP23Zwt5kvl/6Tqzl9DbtQN8hZH0Oo34gBSSmIGjuhXg
	 nzTNwCDhm3rPOulTWdfp2WwyNRBLahn10ZXLj6MmnTdUfQy3PJr9MxcJW7Z/p+EdEQ8Bp
	 E1GVMG9J8mF9qSB45jubLfWOVWRYBRB6AB9ZC5MkLi43juq3usr/vwkSidUJtsSsPnAfD
	 5/2dknhtD+q6LJ/6pOj4UxIO3XOhet5sYJL5NuiRALMaTlgVKun8xayTQK5FJ3dXyPsct
	 B2Acfeq5MoOG7ZPs4j3Uo+Mq37lfKklTReFxBl5o9f29jjUHLstjgIlDDqG2aMaV6F6KT
	 IoYa46tN8osk9p7Ee2u7fG5qY6K/7gxjYyKIkH4FnkOXqUroQ9LJ8TVsA/5G9MLBgmWpm
	 48jxdTqp7Y2SNndGyU/Kp0WfwnjuCZLNQ4WlW/5BGX7nEUGmAwbOWhQjNuAMi+aX0x/u0
	 kR/ceyNZKytPPZgj9w8GOOjMxL0Y+ldGKNSf6aqN+Xc//gid2PZCOP1D/vpCQe5pTCfzS
	 WwA5sSp2d6ZiAvlu1hexcP7evPkZMNGPcPYl0byFKIktwyu9f3ziy7/1EAhRzsyKZ8rZY
	 dBElSkerxHcNhqN/Ky+0NATHctBqlzdn4H42S4gGg62zdbq6eRD0eE8EY3tOKSU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756127290; bh=HU0bKkfhwCmUuMCLkY4a7YjEn+lGpZ+N9vx9OWsjVbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vMLa1xmwcmV0MNQxwvIHWni03mInA4sy9wpW3Y5ZMSL4aRWIWqdkpxDU93N/unW4B
	 epL+dOyiMVSxzmzvjOzZiPO9ERpnKssfwDWfrIwpLuehDZG7jekGarnUU/5yyTuKjR
	 DLoiMRXAMe2yURbD4+UdGRt6YNFfKFrouyfcZZ09II2guZReyvfq6KlHEBpX+jBOZL
	 nUdj8TjCPWnsr1Fn4MULFL2bDTUetU4vDQOS0ypeySDFw8eDlo6LNMKg6b8M08imUh
	 QziUmdWg1S/KP6O2UuDfIImNF4YxsHhmdW5wSIE05aVFlN6AZA3Aqroqz/btoxNj1X
	 YXbY0Yc6mdzjw==
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 15:08:10 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
In-Reply-To: <498f9629d2dda3f305c11512908b1325@bugseng.com>
References: <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
 <6b912698-b871-4819-ac30-14325d0be146@epam.com>
 <498f9629d2dda3f305c11512908b1325@bugseng.com>
Message-ID: <d1fd1bbc474aad5a6a9841a8c109126a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-25 14:53, Nicola Vetrini wrote:
> On 2025-08-22 18:34, Dmytro Prokopchuk1 wrote:
>> On 8/21/25 11:25, Nicola Vetrini wrote:
>>> On 2025-08-21 10:01, Jan Beulich wrote:
>>>> On 19.08.2025 20:55, Dmytro Prokopchuk1 wrote:
>>>>> Rule 11.1 states as following: "Conversions shall not be performed
>>>>> between a pointer to a function and any other type."
>>>>> 
>>>>> The conversion from unsigned long or (void *) to a function pointer
>>>>> is safe in Xen because the architectures it supports (e.g., x86 and
>>>>> ARM) guarantee compatible representations between these types.
>>>> 
>>>> I think we need to be as precise as possible here. The architectures
>>>> guarantee nothing, they only offer necessary fundamentals. In the
>>>> Windows x86 ABI, for example, you can't convert pointers to/from 
>>>> longs
>>>> without losing data. What we build upon is what respective ABIs say,
>>>> possibly in combination of implementation specifics left to 
>>>> compilers.
>>>> 
>>> 
>>> +1, a mention of the compilers and targets this deviation relies upon 
>>> is
>>> needed.
>> 
>> Maybe with this wording:
>> 
>> This deviation is based on the guarantees provided by the specific 
>> ABIs
>> (e.g., ARM AAPCS) and compilers (e.g., GCC) supported in Xen. These 
>> ABIs
> 
> s/supported in/supported by/
> 
>> guarantee compatible representations for 'void *', 'unsigned long' and
>> function pointers for the supported target platforms. This behavior is
> 
> It's not just about the guarantees of the ABIs: it's the behavior of 
> the compiler for those ABIs that makes this safe or unsafe. If present, 
> such documentation should be included
> 

In any case, provided that the wording can be adjusted:

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

>> architecture-specific and may not be portable outside of supported
>> environments.
>> 
>>> 
>>>>> --- a/docs/misra/deviations.rst
>>>>> +++ b/docs/misra/deviations.rst
>>>>> @@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
>>>>>         to store it.
>>>>>       - Tagged as `safe` for ECLAIR.
>>>>> 
>>>>> +   * - R11.1
>>>>> +     - The conversion from unsigned long or (void \*) to a 
>>>>> function
>>>>> pointer does
>>>>> +       not lose any information or violate type safety assumptions
>>>>> if unsigned
>>>>> +       long or (void \*) type is guaranteed to be the same bit 
>>>>> size
>>>>> as a
>>>>> +       function pointer. This ensures that the function pointer 
>>>>> can
>>>>> be fully
>>>>> +       represented without truncation or corruption. The macro
>>>>> BUILD_BUG_ON is
>>>>> +       integrated into xen/common/version.c to confirm conversion
>>>>> compatibility
>>>>> +       across all target platforms.
>>>>> +     - Tagged as `safe` for ECLAIR.
>>>> 
>>>> Why the escaping of * here, when ...
>>>> 
>>>>> --- a/docs/misra/rules.rst
>>>>> +++ b/docs/misra/rules.rst
>>>>> @@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
>>>>>       - All conversions to integer types are permitted if the
>>>>> destination
>>>>>         type has enough bits to hold the entire value. Conversions 
>>>>> to
>>>>> bool
>>>>>         and void* are permitted. Conversions from 'void noreturn 
>>>>> (*)
>>>>> (...)'
>>>>> -       to 'void (*)(...)' are permitted.
>>>>> +       to 'void (*)(...)' are permitted. Conversions from unsigned
>>>>> long or
>>>>> +       (void \*) to a function pointer are permitted if the source
>>>>> type has
>>>>> +       enough bits to restore function pointer without truncation 
>>>>> or
>>>>> corruption.
>>>>> +       Example::
>>>>> +
>>>>> +           unsigned long func_addr = (unsigned 
>>>>> long)&some_function;
>>>>> +           void (*restored_func)(void) = (void 
>>>>> (*)(void))func_addr;
>>>> 
>>>> ... context here suggests they work fine un-escaped, and you even 
>>>> add
>>>> some un-
>>>> escaped instances as well. Perhaps I'm simply unaware of some
>>>> peculiarity?
>>>> 
>>> 
>>> This is a literal rst block, while the other is not (* acts as a 
>>> bullet
>>> point in rst iirc)
>> 
>> This is how "sphinx-build" tool interprets this.
>> 1. * inside single quotes '' -> looks normal, e.g. ‘void (*)(…)’
>> 2. * without quotes -> warning
>> deviations.rst:369: WARNING: Inline emphasis start-string without
>> end-string. [docutils]
>> 3. \* -> looks normal, e.g. (void *)
>> 
>> Because that we need such format: \*
>> 
>> Dmytro.
>> 
>>> 
>>>> Jan
>>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

