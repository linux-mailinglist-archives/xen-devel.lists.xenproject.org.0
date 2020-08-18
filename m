Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CD248303
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ysw-0005yi-4N; Tue, 18 Aug 2020 10:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7ysu-0005yd-GM
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:30:28 +0000
X-Inumbo-ID: 71c0fa40-3762-4240-b803-51bbd5eb9d3c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71c0fa40-3762-4240-b803-51bbd5eb9d3c;
 Tue, 18 Aug 2020 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=f1pmey4EnpbKuP3+oQnc/lqjqTrrMuLbdtbG/UI6VVs=; b=3Gi4EHWdRNEfCOWITjGuogmXC4
 XUA9JEPwsa55fed849Z3ObxOA/V5g27uB0PLfWLejzmjKdAQlzyBLck8D/I2pp543xgZOtSwtTToy
 a2YVql6Zkf6kk5R5+h4qJnNmuHMEzM1DpLQmkbwhE+q1o01qCADBLZD591o74AqQbgi0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7yso-000133-L0; Tue, 18 Aug 2020 10:30:22 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7yso-0003QG-7i; Tue, 18 Aug 2020 10:30:22 +0000
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
 <alpine.DEB.2.21.2008171327020.15985@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d59e1aa8-b88b-41d9-bad1-18a42ca57cb8@xen.org>
Date: Tue, 18 Aug 2020 11:30:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008171327020.15985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Stefano,

On 17/08/2020 23:56, Stefano Stabellini wrote:
> On Sat, 15 Aug 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
>> is x86 code, but there is plan to make it common.
>>
>> To cater 32-bit arch, introduce two new helpers to deal with 64-bit
>> cmpxchg.
>>
>> The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
>> in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/include/asm-arm/arm32/cmpxchg.h | 68 +++++++++++++++++++++++++++++
>>   xen/include/asm-arm/arm64/cmpxchg.h |  5 +++
>>   xen/include/asm-arm/guest_atomics.h | 22 ++++++++++
>>   xen/include/asm-x86/guest_atomics.h |  2 +
>>   xen/include/asm-x86/x86_64/system.h |  2 +
>>   5 files changed, 99 insertions(+)
>>
>> diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
>> index 0770f272ee99..5e2fa6ee38a0 100644
>> --- a/xen/include/asm-arm/arm32/cmpxchg.h
>> +++ b/xen/include/asm-arm/arm32/cmpxchg.h
>> @@ -87,6 +87,38 @@ __CMPXCHG_CASE(b, 1)
>>   __CMPXCHG_CASE(h, 2)
>>   __CMPXCHG_CASE( , 4)
>>   
>> +static inline bool __cmpxchg_case_8(volatile uint64_t *ptr,
>> +			 	    uint64_t *old,
>> +			 	    uint64_t new,
>> +			 	    bool timeout,
>> +				    unsigned int max_try)
>> +{
>> +	uint64_t oldval;
>> +	uint64_t res;
>> +
>> +	do {
>> +		asm volatile(
>> +		"	ldrexd		%1, %H1, [%3]\n"
>> +		"	teq		%1, %4\n"
>> +		"	teqeq		%H1, %H4\n"
>> +		"	movne		%0, #0\n"
>> +		"	movne		%H0, #0\n"
>> +		"	bne		2f\n"
>> +		"	strexd		%0, %5, %H5, [%3]\n"
>> +		"	teq		%0, #0\n"
> 
> Apologies if I am misreading this code, but this last "teq" instruction
> doesn't seem to be useful?

Urgh, I forgot to remove it. The Linux version is looping in assembly 
but I had to convert to C in order to cater the timeout.

I will remove it in the next version.

> 
> 
>> +		"2:"
>> +		: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
>                                                ^ not used ?
> 
> 
>> +		: "r" (ptr), "r" (*old), "r" (new)
>> +		: "memory", "cc");
>> +		if (!res)
>> +			break;
>> +	} while (!timeout || ((--max_try) > 0));
>> +
>> +	*old = oldval;
>> +
>> +	return !res;
>> +}
>> +
>>   static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
>>   					unsigned long new, int size,
>>   					bool timeout, unsigned int max_try)
>> @@ -156,6 +188,30 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * The helper may fail to update the memory if the action takes too long.
>> + *
>> + * @old: On call the value pointed contains the expected old value. It will be
>> + * updated to the actual old value.
>> + * @max_try: Maximum number of iterations
>> + *
>> + * The helper will return true when the update has succeeded (i.e no
>> + * timeout) and false if the update has failed.
>> + */
>> +static always_inline bool __cmpxchg64_mb_timeout(volatile uint64_t *ptr,
>> +						 uint64_t *old,
>> +						 uint64_t new,
>> +						 unsigned int max_try)
>> +{
>> +	bool ret;
>> +
>> +	smp_mb();
>> +	ret = __cmpxchg_case_8(ptr, old, new, true, max_try);
>> +	smp_mb();
>> +
>> +	return ret;
>> +}
>> +
>>   #define cmpxchg(ptr,o,n)						\
>>   	((__typeof__(*(ptr)))__cmpxchg_mb((ptr),			\
>>   					  (unsigned long)(o),		\
>> @@ -167,6 +223,18 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>>   				       (unsigned long)(o),		\
>>   				       (unsigned long)(n),		\
>>   				       sizeof(*(ptr))))
>> +
>> +static inline uint64_t cmpxchg64(volatile uint64_t *ptr,
>> +				 uint64_t old,
>> +				 uint64_t new)
>> +{
>> +	smp_mb();
> 
> I was looking at the existing code I noticed that we don't have a
> corresponding smp_mb(); in this position. Is it needed here because of
> the 64bit-ness?

We have barriers also in the existing. The code can be a bit confusing 
because __cmpxchg() refers to a local cmpxchg.

In our case, the corresponding version if __cmpxchg_mb().

To be honest, the existing naming is a bit confusing. I am thinking to 
drop cmpxcgh_local() completely as this is not used. This would also 
make the cod easier to read. What do you think?


> 
> 
>> +	if (!__cmpxchg_case_8(ptr, &old, new, false, 0))
>> +		ASSERT_UNREACHABLE();

And I forgot the smp_mb() here :(.

>> +
>> +	return old;
>> +}
>> +
>>   #endif
>>   /*
>>    * Local variables:
>> diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
>> index fc5c60f0bd74..de9cd0ee2b07 100644
>> --- a/xen/include/asm-arm/arm64/cmpxchg.h
>> +++ b/xen/include/asm-arm/arm64/cmpxchg.h
>> @@ -187,6 +187,11 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>>   	__ret; \
>>   })
>>   
>> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
>> +
>> +#define __cmpxchg64_mb_timeout(ptr, old, new, max_try) \
>> +	__cmpxchg_mb_timeout(ptr, old, new, 8, max_try)
>> +
>>   #endif
>>   /*
>>    * Local variables:
>> diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/include/asm-arm/guest_atomics.h
>> index af27cc627bf3..28ce402bea79 100644
>> --- a/xen/include/asm-arm/guest_atomics.h
>> +++ b/xen/include/asm-arm/guest_atomics.h
>> @@ -115,6 +115,28 @@ static inline unsigned long __guest_cmpxchg(struct domain *d,
>>                                            (unsigned long)(n),\
>>                                            sizeof (*(ptr))))
>>   
>> +static inline uint64_t guest_cmpxchg64(struct domain *d,
>> +                                       volatile uint64_t *ptr,
>> +                                       uint64_t old,
>> +                                       uint64_t new)
>> +{
>> +    uint64_t oldval = old;
>> +
>> +    perfc_incr(atomics_guest);
>> +
>> +    if ( __cmpxchg64_mb_timeout(ptr, &oldval, new,
>> +                                this_cpu(guest_safe_atomic_max)) )
>> +        return oldval;
>> +
>> +    perfc_incr(atomics_guest_paused);
>> +
>> +    domain_pause_nosync(d);
>> +    oldval = cmpxchg64(ptr, old, new);
>> +    domain_unpause(d);
>> +
>> +    return oldval;
>> +}
>> +
>>   #endif /* _ARM_GUEST_ATOMICS_H */
>>   /*
>>    * Local variables:
>> diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
>> index 029417c8ffc1..f4de9d3631ff 100644
>> --- a/xen/include/asm-x86/guest_atomics.h
>> +++ b/xen/include/asm-x86/guest_atomics.h
>> @@ -20,6 +20,8 @@
>>       ((void)(d), test_and_change_bit(nr, p))
>>   
>>   #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
>> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
>> +
>>   
>>   #endif /* _X86_GUEST_ATOMICS_H */
>>   /*
>> diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
>> index f471859c19cc..c1b16105e9f2 100644
>> --- a/xen/include/asm-x86/x86_64/system.h
>> +++ b/xen/include/asm-x86/x86_64/system.h
>> @@ -5,6 +5,8 @@
>>       ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
>>                                      (unsigned long)(n),sizeof(*(ptr))))
>>   
>> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
>> +
>>   /*
>>    * Atomic 16 bytes compare and exchange.  Compare OLD with MEM, if
>>    * identical, store NEW in MEM.  Return the initial value in MEM.
>> -- 
>> 2.17.1
>>

Cheers,

-- 
Julien Grall

