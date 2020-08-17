Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280222466E5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 15:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7enV-0007te-JS; Mon, 17 Aug 2020 13:03:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GDTU=B3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7enT-0007tZ-KX
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 13:03:31 +0000
X-Inumbo-ID: a2394958-2b53-46d2-a708-0650010f1bf1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2394958-2b53-46d2-a708-0650010f1bf1;
 Mon, 17 Aug 2020 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Fn3Exmpk6JIMmMB8Ejk684DO12bTDWGcaIBnOuiSa1k=; b=iaVEUHdP6OSNTTBUd7SB+d59oE
 kXlXCuIq+Ztm63Mny4QlTiR1w0yq983/Jrm9mFbCkeLSjkj2a5iWlwyCHuDfvsvVNz+2zxqK7a+S4
 0y3zgsd0HWqVl0vHD72HG51uv++BXGr78F0HsOs6zXCVb9Z9fDzzhZMtQvWL6h0xdxCU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7enO-0000FP-FY; Mon, 17 Aug 2020 13:03:26 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7enO-0001F1-1b; Mon, 17 Aug 2020 13:03:26 +0000
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
 <20200817103306.GA828@Air-de-Roger>
 <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
 <20200817114730.GB828@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
Date: Mon, 17 Aug 2020 14:03:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817114730.GB828@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/08/2020 12:50, Roger Pau Monné wrote:
> On Mon, Aug 17, 2020 at 12:05:54PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 17/08/2020 11:33, Roger Pau Monné wrote:
>>> On Mon, Aug 17, 2020 at 10:42:54AM +0100, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 17/08/2020 10:24, Roger Pau Monné wrote:
>>>>> On Sat, Aug 15, 2020 at 06:21:43PM +0100, Julien Grall wrote:
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
>>>>>> is x86 code, but there is plan to make it common.
>>>>>>
>>>>>> To cater 32-bit arch, introduce two new helpers to deal with 64-bit
>>>>>> cmpxchg.
>>>>>>
>>>>>> The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
>>>>>> in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
>>>>>>
>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>> ---
>>>>>> diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
>>>>>> index 029417c8ffc1..f4de9d3631ff 100644
>>>>>> --- a/xen/include/asm-x86/guest_atomics.h
>>>>>> +++ b/xen/include/asm-x86/guest_atomics.h
>>>>>> @@ -20,6 +20,8 @@
>>>>>>         ((void)(d), test_and_change_bit(nr, p))
>>>>>>     #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
>>>>>> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
>>>>>> +
>>>>>>     #endif /* _X86_GUEST_ATOMICS_H */
>>>>>>     /*
>>>>>> diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
>>>>>> index f471859c19cc..c1b16105e9f2 100644
>>>>>> --- a/xen/include/asm-x86/x86_64/system.h
>>>>>> +++ b/xen/include/asm-x86/x86_64/system.h
>>>>>> @@ -5,6 +5,8 @@
>>>>>>         ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
>>>>>>                                        (unsigned long)(n),sizeof(*(ptr))))
>>>>>> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
>>>>>
>>>>> Why do you need to introduce an explicitly sized version of cmpxchg
>>>>> for 64bit values?
>>>>>
>>>>> There's no cmpxchg{8,16,32}, so I would expect cmpxchg64 to just be
>>>>> handled by cmpxchg detecting the size of the parameter passed to the
>>>>> function.
>>>> That works quite well for 64-bit arches. However, for 32-bit, you would need
>>>> to take some detour so 32-bit and 64-bit can cohabit (you cannot simply
>>>> replace unsigned long with uint64_t).
>>>
>>> Oh, I see. Switching __cmpxchg on Arm 32 to use unsigned long long or
>>> uint64_t would be bad, as you would then need two registers to pass
>>> the value to the function, or push it on the stack?
>>
>> We have only 4 registers (r0 - r4) available for the arguments. With 64-bit
>> value, we will be using 2 registers, some will end up to be pushed on the
>> stack.
>>
>> This is assuming the compiler is not clever enough to see we are only using
>> the bottom 32-bit with some cmpxchg.
>>
>>>
>>> Maybe do something like:
>>>
>>> #define cmpxchg(ptr,o,n) ({						\
>>> 	typeof(*(ptr)) tmp;						\
>>> 									\
>>> 	switch ( sizeof(*(ptr)) )					\
>>> 	{								\
>>> 	case 8:								\
>>> 		tmp = __cmpxchg_mb64((ptr), (uint64_t)(o),		\
>>> 				(uint64_t)(n), sizeof(*(ptr))))		\
>>> 		break;							\
>>> 	default:							\
>>> 		tmp = __cmpxchg_mb((ptr), (unsigned long)(o),		\
>>> 				(unsigned long)(n), sizeof(*(ptr))))	\
>>> 		break;							\
>>> 	}								\
>>> 	tmp;								\
>>> })
>>
>>
>> Unfortunately this can't compile if o and n are pointers because the
>> compiler will complain about the cast to uint64_t.
> 
> Right, we would have to cast to unsigned long first and then to
> uint64_t, which is not very nice.

If you use (uint64_t)(unsigned long) in the 64-bit case, then you would 
lose the top 32-bit. So cmpxchg() wouldn't work as expected.

> 
>>
>> We would also need a cast when assigning to tmp because tmp may not be a
>> scalar type. This would lead to the same compiler issue.
> 
> Yes, we would have to do a bunch of casts.

I don't think there is a way to solve this using just cast.

> 
>> The only way I could see to make it work would be to use the same trick as
>> we do for {read, write}_atomic() (see asm-arm/atomic.h). We are using union
>> and void pointer to prevent explicit cast.
> 
> I'm mostly worried about common code having assumed that cmpxchg
> does also handle 64bit sized parameters, and thus failing to use
> cmpxchg64 when required. I assume this is not much of a deal as then
> the Arm 32 build would fail, so it should be fairly easy to catch
> those.
FWIW, this is not very different to the existing approach. If one would 
use cmpxchg() with 64-bit, then it would fail to compile.

Furthermore, there is no guarantee that a new 32-bit arch would have 
64-bit atomic operations. For instance, not all 32-bit Arm processors 
have 64-bit atomic operations. Although, the one supporting 
virtualization will have them.

So I think we will always to rely on review and build testing to catch 
error.

> 
> I don't think the union is so bad, but let's wait to see what others
> think.

I am not concerned about the code itself but the assembly generated. I 
don't want to increase the number memory access or instructions just for 
the sake of trying to get cmpxchg() to work with 64-bit.

I will have to implement it and see the code generated.

> 
> FWIW x86 already has a specific handler for 128bit values: cmpxchg16b.
> Maybe it would be better to name this cmpxchg8b? Or rename the
> existing one to cmpxchg128 for coherence.

I dislike the name cmpxchg8b(). This is much easier to match the type 
and the name with cmpxchg64().

I would be happy to rename cmpxchg16b() if the x86 folks would want it.

Cheers,

-- 
Julien Grall

