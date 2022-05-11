Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C10523108
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 12:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326696.549290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nok0b-00084B-NJ; Wed, 11 May 2022 10:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326696.549290; Wed, 11 May 2022 10:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nok0b-00082M-K5; Wed, 11 May 2022 10:55:57 +0000
Received: by outflank-mailman (input) for mailman id 326696;
 Wed, 11 May 2022 10:55:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nok0a-00082G-Cx
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 10:55:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nok0Z-0004e0-Vy; Wed, 11 May 2022 10:55:55 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nok0Z-0004FK-PX; Wed, 11 May 2022 10:55:55 +0000
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
	bh=EU7J/mSeOBr7HR2Mpi7MB3nxiM04V/F7TspNkBmDrL0=; b=MqQGHecEeQyjUG1qZX7N3e9ydS
	7FYyhvRrZSM2ND2pjmjY2nPPShD/rMyOVXQoswyLX+dgRukWg3fU4sbJ1xOHril2ut1a1vhbwTuqh
	qErl+smctPMbn9wGu4wqaYLUSFLfLs8Ac/ZFABTWHNbji6H1+uhgA7ilW0Op51/l6jFc=;
Message-ID: <a39a5a61-76ee-8b06-bfa4-3674513738d0@xen.org>
Date: Wed, 11 May 2022 11:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
 <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
 <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
 <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
 <a33f8fba-fa7a-91fa-9179-22973d680b08@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a33f8fba-fa7a-91fa-9179-22973d680b08@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/05/2022 10:56, Andrew Cooper wrote:
> On 10/05/2022 12:47, Julien Grall wrote:
>> Hi,
>>
>> On 10/05/2022 12:34, Andrew Cooper wrote:
>>> On 10/05/2022 12:17, Julien Grall wrote:
>>>>>
>>>>>>
>>>>>>> diff --git a/xen/include/xen/unaligned.h
>>>>>>> b/xen/include/xen/unaligned.h
>>>>>>> index 0a2b16d05d..16b2e6f5f0 100644
>>>>>>> --- a/xen/include/xen/unaligned.h
>>>>>>> +++ b/xen/include/xen/unaligned.h
>>>>>>> @@ -20,62 +20,62 @@
>>>>>>>        static inline uint16_t get_unaligned_be16(const void *p)
>>>>>>>      {
>>>>>>> -    return be16_to_cpup(p);
>>>>>>> +    return be16_to_cpu(*(const uint16_t *)p)
>>>>>>
>>>>>> I haven't checked the existing implementation of be16_to_cpup().
>>>>>
>>>>> It's a plain dereference, just like this.  AFAICT, it wasn't unaligned
>>>>> safe before, either.
>>>>
>>>> Well, technically an architecture could provide an override for the
>>>> copy. I agree that arm32 is already bogus but...
>>>>
>>>>>
>>>>> It should be reasonably easy to fix in a followup patch.  Just
>>>>> memcpy()
>>>>> to/from the void pointer to a stack variable of the appropriate type.
>>>> ... I disagree that it should be fixed in a follow-up patch. It should
>>>> be fixed now as this is where the badness is spread to any
>>>> architecture.
>>>
>>> No.  That is an inappropriate request to make.
>>>
>>> Lin's patch does not alter the broken-ness of unaligned on arm32, and
>>> does improve the aspect of the hypervisor that it pertains to.  It
>>> therefore stands on its own merit.
>> I am not sure sure why switching from *cpup* improves things... and as
>> usual you haven't answered to the clarification questions.
> 
> Adjust your tone back to something appropriate to the conversation.

It was indeed harsh. Sorry for that.

> 
> The p helpers hide a unsafe typecast&dereference which will erroneously
> compile both of these:
> 
> void foo(void *ptr)
> {
>      blah_p(ptr);
> }
> 
> void bar(baz *ptr)
> {
>      blah_p(ptr);
> }

I am assuming that blah would expect a (blah *).

> 
> and potentially malfunction as a consequence, not to mention that it's
> sufficient obfuscation to trick a maintainer into believe an unrelated
> area of code was safe when it wasn't.

I looked at the helpers, they are static inline and use a proper type. 
Therefore, I am not sure why bar would compile in this situation.

In fact, to me it seems this is an inherent issue to C: any void pointer 
can be casted to anything. You are removing one here, but there are 
hundreds of other potential "unsafe" place in Xen.

> 
> Deleting the p helpers is a specific objective of the work, because it
> forces the author to resolve to an integral type, and have the deference
> chain visible in a single location which improves code clarity.

See above, I think dropping p helpers is not solving the underlying 
problem (we are not going to be able to remove pointers in Xen).

What would solve the problem is forbidding cast from void pointer to any 
pointer. At which point, keeping *cpup* is not going to be problem.

> 
> On a hunch, I checked the MISRA spec, and it turns out there is a rule
> against the p helpers (specifically the type safety aspect), so this
> series is removing a whole load of DIR 4.9 violations from the codebase.

I read through DIR 4.9., AFAIU it is about using function rather than 
macro. The current implementation of *cpup* are using function so I 
don't understand how removing *cpup* would help.

So I am afraid, I still see no justifications to drop *cpup* here and I 
actually prefer them the open-code version. I will not Nack it, but I 
will not support.

In any case, the commit message should contain some information why they 
are dropped.

Cheers,

-- 
Julien Grall

