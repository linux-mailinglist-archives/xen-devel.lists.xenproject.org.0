Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BE9336D9A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 09:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96383.182262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGWA-0006b2-Kk; Thu, 11 Mar 2021 08:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96383.182262; Thu, 11 Mar 2021 08:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGWA-0006ad-HM; Thu, 11 Mar 2021 08:18:02 +0000
Received: by outflank-mailman (input) for mailman id 96383;
 Thu, 11 Mar 2021 08:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKGW8-0006aW-Hq
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 08:18:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c311390-9ac6-4011-bb0f-bfbed8b020d6;
 Thu, 11 Mar 2021 08:17:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A435CAC16;
 Thu, 11 Mar 2021 08:17:58 +0000 (UTC)
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
X-Inumbo-ID: 5c311390-9ac6-4011-bb0f-bfbed8b020d6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615450678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpixSMGVIw+5F7WyNe2N5wSzzZOriV1Vf/ISr/6LqTA=;
	b=Uh265zkSW0W9nFgml3FrvU8/LzBZSEQzCAwzm8poZs0KrDQyarRjMRdmLdNIpSqV6FDGCr
	it4YlNL9CV6wx8pSuYrzD/aQxj8cxUW4FmOeOiF/E2y6p9msw9XKQMKTlWVAxCjKBljWSX
	iaLl+3lQU6vs/IQ0Kz7sTO36QfS5/6E=
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
 <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
 <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
 <2de5160f-8636-5cdf-a20c-acaa2640c893@suse.com>
 <e4ea36f5-7aca-e19d-5e78-45058b13697b@xen.org>
 <e1176ad2-0a66-3a6d-c053-f0da9d4ae35f@suse.com>
 <7ab87cab-8836-e8a0-993e-0cdeca3c45e3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bc2ad13-8636-e5d4-3a4a-722c75e3b92a@suse.com>
Date: Thu, 11 Mar 2021 09:17:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7ab87cab-8836-e8a0-993e-0cdeca3c45e3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.03.2021 19:05, Julien Grall wrote:
> On 09/03/2021 11:20, Jan Beulich wrote:
>> On 08.03.2021 21:22, Julien Grall wrote:
>>> On 08/03/2021 11:20, Jan Beulich wrote:
>>>> On 08.03.2021 11:51, Julien Grall wrote:
>>>>> On 08/03/2021 08:09, Jan Beulich wrote:
>>>>>> Additionally - partly related to your own reply regarding the CI
>>>>>> failures - imo there needs to be an analysis of what older distros
>>>>>> will no longer build (at all or by default).
>>>>>
>>>>> Per the CI, this would be Ubuntu Trusty (and older), Centos 7 (and older)
>>>>>
>>>>> Do you have any other in mind?
>>>>
>>>> Our SLE12 (latest service pack is SP5 and still has a while to go
>>>> to at least reach LTSS state) comes with gcc 4.8 as the default
>>>> compiler.
>>>
>>> Thanks! That's good to know. Is it the old GCC Suse supports?
>>
>> Not sure I understand the question: The default compiler of this or
>> any distro is of course (expected to be) supported by the vendor
>> for the lifetime of the OS.
> 
> Sorry for the wording. I was asking whether Suse also supports compiler 
> older than GCC 4.8.

Oh, I see. SLES11 has another year to go for LTSS to end, and it's 4.3
which is used there.

>>>>>>> --- a/xen/include/xen/compiler.h
>>>>>>> +++ b/xen/include/xen/compiler.h
>>>>>>> @@ -5,6 +5,19 @@
>>>>>>>     #error Sorry, your compiler is too old/not recognized.
>>>>>>>     #endif
>>>>>>>     
>>>>>>> +#if CONFIG_CC_IS_GCC
>>>>>>> +# if CONFIG_GCC_VERSION < 40900
>>>>>>> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
>>>>>>
>>>>>> As per the bug report, the issue was determined to not be present
>>>>>> in e.g. 4.3. Hence while such a bug may influence our choice of
>>>>>> minimum version, I don't think it can reasonably be named here as
>>>>>> the apparent only reason for the choice. Personally I don't think
>>>>>> any justification should be put here.
>>>>>
>>>>> Ok.
>>>>>
>>>>>>
>>>>>>> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
>>>>>>> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
>>>>>>> +/*
>>>>>>> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
>>>>>>> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
>>>>>>> + */
>>>>>>> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
>>>>>>
>>>>>>    From the bug entry the fix looks to have been backported to 4.9,
>>>>>> or at least some (important?) branches thereof.
>>>>>
>>>>> It is not clear what's you are trying to point out. Mind clarifying?
>>>>
>>>> Some 4.9 compilers (perhaps widely used ones) may not have the bad
>>>> issue, which puts under question their ruling out when the main
>>>> reason for doing so is that bug.
>>>
>>> Well... We could surely try to hunt which GCC 4.9 has been fixed. But I
>>> am not convinced this is useful, we would need to have an allowlist of
>>> GCC compiler.
>>
>> Or probe the compiler for the bug in question.
> 
> I thought about it but it is not clear to me whether the reproducer 
> would work on every GCC version and how to detect that this was miscompiled.
> 
> Do you have any suggestion?

To have one I'd have to study the problem in quite a bit more detail.
But I did say that what you do for Arm is largely up to you (and
Stefano did meanwhile ack the Arm side), so I'm not sure I want to
invest the time that would be needed.

Jan

