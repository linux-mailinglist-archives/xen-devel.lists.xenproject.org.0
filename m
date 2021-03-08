Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0233185D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 21:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95067.179329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJMOk-0002fu-As; Mon, 08 Mar 2021 20:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95067.179329; Mon, 08 Mar 2021 20:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJMOk-0002fS-6n; Mon, 08 Mar 2021 20:22:38 +0000
Received: by outflank-mailman (input) for mailman id 95067;
 Mon, 08 Mar 2021 20:22:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJMOi-0002fN-SF
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 20:22:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJMOh-0004Fh-Iy; Mon, 08 Mar 2021 20:22:35 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJMOh-0000Ip-7X; Mon, 08 Mar 2021 20:22:35 +0000
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
	bh=AfOwlOM+T3YGOLL/G4RnZLxwiAk3QHE9t1SipSE308M=; b=1UJQFRXkZzHoHFZmVvSqHM+K3M
	u4uutLLl8Z0EzivWyargeeCYHsNK14oSI8ui1wMzYw96HFLJ4xY/+1+47LBiFTqreqSA5tdTbMJ/o
	xBZj+L0lROdCpeQ9t1HfAKvm3kY2bCyH6YAqzx24l9t1gfjKvU9S2Wo8jUo0kDK3Q57E=;
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
 <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
 <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
 <2de5160f-8636-5cdf-a20c-acaa2640c893@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e4ea36f5-7aca-e19d-5e78-45058b13697b@xen.org>
Date: Mon, 8 Mar 2021 20:22:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2de5160f-8636-5cdf-a20c-acaa2640c893@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/03/2021 11:20, Jan Beulich wrote:
> On 08.03.2021 11:51, Julien Grall wrote:
>> On 08/03/2021 08:09, Jan Beulich wrote:
>>> On 06.03.2021 22:41, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Compilers older than 4.8 have known codegen issues which can lead to
>>>> silent miscompilation:
>>>>
>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
>>>>
>>>> Furthermore, pre-4.9 GCC have known bugs (including things like
>>>> internal compiler errors on Arm) which would require workaround (I
>>>> haven't checked if we have any in Xen).
>>>>
>>>> The minimum version of GCC to build the hypervisor is now raised to 4.9.
>>>>
>>>> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
>>>> shown to emit memory references beyond the stack pointer, resulting in
>>>> memory corruption if an interrupt is taken after the stack pointer has
>>>> been adjusted but before the reference has been executed.
>>>>
>>>> Therefore, the minimum for arm64 is raised to 5.1.
>>>
>>> I'm sure newer compiler versions also have bugs.
>>
>> I don't doubt that...
>>
>>> Therefore I'm not
>>> convinced using this as the primary reason for a bump is enough.
>> You also have to take into account the severity of the bug and possible
>> workaround. The bug in 5.1 is severe *and* has no easy (to avoid saying
>> possible) workaround.
>>
>>> Plus what if critical to us bugs get found in, say, 5.x? Are we
>>> going to bump to 6.x then (and so on, until we allow only the most
>>> recent major version to be used)?
>>
>> In the current situation we are claiming that all GCC versions from
>> ~2014 are supported.
>>
>> However, in reality, there are an high number of chance that some of the
>> version will not build Xen or worse miscompile it.
>>
>> The former kind of bug is not a big deal because the user will notice it
>> directly. However, the latter is highly critical because 1) They may
>> only happen sporadically 2) compiler related bug is difficult to root cause.
> 
> Since I realize it may not have been clear from my initial reply:
> What you want to do for Arm64 is largely up to you. I agree that
> the bug in question is really bad.

Ah, thanks for the clarification.

> I understand it was Andrew who asked you to cover x86 at the same
> time, so perhaps it should be more him than you to justify the
> choice. Yet you've submitted the patch, so (I'm sorry) there you
> go ...

As I initially wrote, I don't particularly mind the version for x86.

I can split the patch in two to avoid mixing the discussions.

> 
>>> Additionally - partly related to your own reply regarding the CI
>>> failures - imo there needs to be an analysis of what older distros
>>> will no longer build (at all or by default).
>>
>> Per the CI, this would be Ubuntu Trusty (and older), Centos 7 (and older)
>>
>> Do you have any other in mind?
> 
> Our SLE12 (latest service pack is SP5 and still has a while to go
> to at least reach LTSS state) comes with gcc 4.8 as the default
> compiler.

Thanks! That's good to know. Is it the old GCC Suse supports?

> 
>>>> ---
>>>>
>>>> I don't have a strong opinion on the minimum version for GCC on x86.
>>>> So this is following Andrew's suggestion and the minimum from Linux.
>>>>
>>>> This patch is candidate to 4.15 and backport.
>>>
>>> I think such a change needs to be proposed much earlier in a release
>>> cycle.
>>
>> Possibly... At the same time, we don't want to release 4.15 and continue
>> to say Xen on Arm64 can build fine with 4.9 and 5.0.
> 
> 4.9 could be excluded if need be. 4.8 is fine?

I am not entirely sure. The bug I pointed out in the commit message 
([1]) seems to affect any GCC version until 4.8.

> Also I don't think
> there's much point thinking about 5.0 - that's where their version
> numbering scheme changed and the first released version is 5.1.

Good point. I didn't released that 5.0 never existed.

>>>> --- a/xen/include/xen/compiler.h
>>>> +++ b/xen/include/xen/compiler.h
>>>> @@ -5,6 +5,19 @@
>>>>    #error Sorry, your compiler is too old/not recognized.
>>>>    #endif
>>>>    
>>>> +#if CONFIG_CC_IS_GCC
>>>> +# if CONFIG_GCC_VERSION < 40900
>>>> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
>>>
>>> As per the bug report, the issue was determined to not be present
>>> in e.g. 4.3. Hence while such a bug may influence our choice of
>>> minimum version, I don't think it can reasonably be named here as
>>> the apparent only reason for the choice. Personally I don't think
>>> any justification should be put here.
>>
>> Ok.
>>
>>>
>>>> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
>>>> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
>>>> +/*
>>>> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
>>>> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
>>>> + */
>>>> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
>>>
>>>   From the bug entry the fix looks to have been backported to 4.9,
>>> or at least some (important?) branches thereof.
>>
>> It is not clear what's you are trying to point out. Mind clarifying?
> 
> Some 4.9 compilers (perhaps widely used ones) may not have the bad
> issue, which puts under question their ruling out when the main
> reason for doing so is that bug.

Well... We could surely try to hunt which GCC 4.9 has been fixed. But I 
am not convinced this is useful, we would need to have an allowlist of 
GCC compiler.

 From my experience, the best way to know if someone care about a 
specific version is to bump it and see who shout. If no one shout, then 
you know that it wasn't important.

If someone shout, then we can decide how to re-enable support for GCC X.Y.

The fact Linux bumped to 5.1 on Arm64 give me some confidence that the 
move is not risky.

I know you may not be happy with my problem, so one possible mitigation 
is to allow a developer to override the check using Kconfig (maybe gated 
with UNSUPPORTED/EXPERT).


[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145

-- 
Julien Grall

