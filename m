Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCA797F1D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 01:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597662.931904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeOAx-0007nb-GI; Thu, 07 Sep 2023 23:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597662.931904; Thu, 07 Sep 2023 23:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeOAx-0007lf-DA; Thu, 07 Sep 2023 23:12:39 +0000
Received: by outflank-mailman (input) for mailman id 597662;
 Thu, 07 Sep 2023 23:12:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qeOAw-0007lZ-Kl
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 23:12:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07fb3724-4dd4-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 01:12:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2EF968285564;
 Thu,  7 Sep 2023 18:12:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id r5v2iUt8Xvrv; Thu,  7 Sep 2023 18:12:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 468DB8285A39;
 Thu,  7 Sep 2023 18:12:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6jPOcKuFtz8I; Thu,  7 Sep 2023 18:12:33 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E63978285564;
 Thu,  7 Sep 2023 18:12:32 -0500 (CDT)
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
X-Inumbo-ID: 07fb3724-4dd4-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 468DB8285A39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694128353; bh=XIuqWwrRxWUn6c/54htO2uK/ZIZSHA4Ps79G85L7VqA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=iX7VP/7KGbYoamnjpS+ocoEgzghuhzLmJuN0QkUYTqkRQxWhh5zDoj7kUTjI854ED
	 TtPVTGc4/IJxZF+KkQXK/gFDGxY95ubkx99XhJHsCvJZZiH9o5GQHFbRPFMCHzq74c
	 MyanoUQ5sKBRIcZecTSyJIQCQUZYytir2orUP+D0=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <09e0f475-627c-1a8a-6175-b8d32f744053@raptorengineering.com>
Date: Thu, 7 Sep 2023 18:12:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693591462.git.sanastasio@raptorengineering.com>
 <63e66eed26da8f957315cb1db05693b1799ee7ad.1693591462.git.sanastasio@raptorengineering.com>
 <003690cf-e34b-2e61-1166-86bcfd9da3b7@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <003690cf-e34b-2e61-1166-86bcfd9da3b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/23 10:19 AM, Jan Beulich wrote:
> On 01.09.2023 20:25, Shawn Anastasio wrote:
>> Implement bitops.h, based on Linux's implementation as of commit
>> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
>> Linux's implementation, this code diverges significantly in a number of
>> ways:
>>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>>   - PPC32-specific code paths dropped
>>   - Formatting completely re-done to more closely line up with Xen.
>>     Including 4 space indentation.
> 
> Isn't ...
> 
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>> v3:
>>   - Fix style of inline asm blocks.
>>   - Fix underscore-prefixed macro parameters/variables
>>   - Use __builtin_popcount for hweight* implementation
> 
> ... this also a divergence worth calling out?
>

Sure, I could mention that. But the hweight implementation from the
earlier patch diverged from linux's implementation too, for what it's
worth.

>> --- a/xen/arch/ppc/include/asm/bitops.h
>> +++ b/xen/arch/ppc/include/asm/bitops.h
>> @@ -1,9 +1,333 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Adapted from Linux's arch/powerpc/include/asm/bitops.h.
>> + *
>> + * Merged version by David Gibson <david@gibson.dropbear.id.au>.
>> + * Based on ppc64 versions by: Dave Engebretsen, Todd Inglett, Don
>> + * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
>> + * originally took it from the ppc32 code.
>> + */
>>  #ifndef _ASM_PPC_BITOPS_H
>>  #define _ASM_PPC_BITOPS_H
>>
>> +#include <asm/memory.h>
>> +
>> +#define __set_bit(n, p)         set_bit(n, p)
>> +#define __clear_bit(n, p)       clear_bit(n, p)
>> +
>> +#define BITOP_BITS_PER_WORD     32
>> +#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
> 
> With the switch to 32-bit operations, doesn't this want to be 1U?
>

Sure, I'll make that change.

>> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
>> +#define BITS_PER_BYTE           8
>> +
>>  /* PPC bit number conversion */
>> -#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
>> -#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
>> -#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>> +#define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
>> +#define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
>> +#define PPC_BITMASK(bs, be)  ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>> +
>> +/* Macro for generating the ***_bits() functions */
>> +#define DEFINE_BITOP(fn, op, prefix)                                           \
>> +static inline void fn(unsigned long mask,                                      \
>> +                      volatile unsigned int *p_)                               \
>> +{                                                                              \
>> +    unsigned long old;                                                         \
>> +    unsigned int *p = (unsigned int *)p_;                                      \
>> +    asm volatile ( prefix                                                      \
>> +                   "1: lwarx %0,0,%3,0\n"                                      \
>> +                   #op "%I2 %0,%0,%2\n"                                        \
>> +                   "stwcx. %0,0,%3\n"                                          \
>> +                   "bne- 1b\n"                                                 \
>> +                   : "=&r" (old), "+m" (*p)                                    \
>> +                   : "rK" (mask), "r" (p)                                      \
>> +                   : "cc", "memory" );                                         \
>> +}
>> +
>> +DEFINE_BITOP(set_bits, or, "")
>> +DEFINE_BITOP(change_bits, xor, "")
>> +
>> +#define DEFINE_CLROP(fn, prefix)                                               \
>> +static inline void fn(unsigned long mask, volatile unsigned int *_p)           \
> 
> Leftover leading underscore.
>

Good catch. Will fix.

>> +{                                                                              \
>> +    unsigned long old;                                                         \
>> +    unsigned int *p = (unsigned int *)_p;                                      \
>> +    asm volatile ( prefix                                                      \
>> +                   "1: lwarx %0,0,%3,0\n"                                      \
>> +                   "andc %0,%0,%2\n"                                           \
>> +                   "stwcx. %0,0,%3\n"                                          \
>> +                   "bne- 1b\n"                                                 \
>> +                   : "=&r" (old), "+m" (*p)                                    \
>> +                   : "r" (mask), "r" (p)                                       \
>> +                   : "cc", "memory" );                                         \
>> +}
>> +
>> +DEFINE_CLROP(clear_bits, "")
>> +
>> +static inline void set_bit(int nr, volatile void *addr)
>> +{
>> +    set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
>> +}
>> +static inline void clear_bit(int nr, volatile void *addr)
>> +{
>> +    clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
>> +}
>> +
>> +/**
>> + * test_bit - Determine whether a bit is set
>> + * @nr: bit number to test
>> + * @addr: Address to start counting from
>> + */
>> +static inline int test_bit(int nr, const volatile void *addr)
>> +{
>> +    const volatile unsigned long *p = (const volatile unsigned long *)addr;
>> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
>> +}
>> +
>> +static inline unsigned long test_and_clear_bits(unsigned long mask, volatile void *_p)
> 
> Again. And there are more. Yet here (and below) ...
>

Will fix all occurrences in this file.

>> +{
>> +    unsigned long old, t;
>> +    unsigned int *p = (unsigned int *)_p;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%3,0\n"
>> +                   "andc %1,%0,%2\n"
>> +                   "stwcx. %1,0,%3\n"
>> +                   "bne- 1b\n"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (old), "=&r" (t)
>> +                   : "r" (mask), "r" (p)
>> +                   : "cc", "memory" );
> 
> ... do you actually need the helper variable, when there's no "+m"
> constraint operand?
>

Good point, I'm not sure why the original Linux implementation had it
this way. This also would apply to the DEFINE_TESTOP macro below.

>> +    return (old & mask);
>> +}
>> +
>> +static inline int test_and_clear_bit(unsigned int nr,
>> +                                     volatile void *addr)
>> +{
>> +    return test_and_clear_bits(BITOP_MASK(nr), addr + BITOP_WORD(nr)) != 0;
>> +}
>> +
>> +#define DEFINE_TESTOP(fn, op, eh)                                              \
>> +static inline unsigned long fn(unsigned long mask, volatile unsigned int *_p)  \
>> +{                                                                              \
>> +    unsigned long old, t;                                                      \
>> +    unsigned int *p = (unsigned int *)_p;                                      \
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER                                    \
>> +                   "1: lwarx %0,0,%3,%4\n"                                     \
>> +                   #op "%I2 %1,%0,%2\n"                                        \
>> +                   "stwcx. %1,0,%3\n"                                          \
>> +                   "bne- 1b\n"                                                 \
>> +                   PPC_ATOMIC_EXIT_BARRIER                                     \
>> +                   : "=&r" (old), "=&r" (t)                                    \
>> +                   : "rK" (mask), "r" (p), "n" (eh)                            \
>> +                   : "cc", "memory" );                                         \
>> +    return (old & mask);                                                       \
>> +}
>> +
>> +DEFINE_TESTOP(test_and_set_bits, or, 0)
> 
> Why can't test_and_clear_bits() not use this macro-ization? And if it
> can't and hence there's only this single use, wouldn't it make sense
> to avoid going through a macro here, too?
>

I've just tried this, but unfortunately the "rK" constraint on the mask
operand only works when instructions have both a reg/reg/reg as well as
a reg/reg/imm16 form. This is the case for `or` but not `andc`. I guess
it would be better to keep the two separate implementations rather than
try to accomodate both cases in the macro somehow (e.g, by making the
constraint's type a macro parameter as well).

I can also change the macro template into a standard function for just
test_and_set_bits, given that it's the only user as you pointed out.

As for your previous observation about the superfluous `p` variable, it
would seem the same applies to the macro here. Other than casting away
the volatile qualifier on `p_` it doesn't seem to be doing much, so I'm
inclined to remove it.

>> +static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
>> +{
>> +    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
>> +                                             BITOP_WORD(nr)) != 0;
> 
> This wants wrapping differently, e.g.
> 
> static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
> {
>     return test_and_set_bits(BITOP_MASK(nr),
>                              (volatile unsigned int *)addr +
>                              BITOP_WORD(nr)) != 0;
> }
> 
> or
> 
> static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
> {
>     return test_and_set_bits(
>                BITOP_MASK(nr),
>                (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
> }
> 

Will fix to use the former style.

>> +#define flsl(x) generic_flsl(x)
>> +#define fls(x) generic_fls(x)
>> +#define ffs(x) ({ unsigned int t_ = (x); fls(t_ & - t_); })
>> +#define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & - t_); })
> 
> Nit: No blanks after unary operators, please.
>

Will fix.

>> +/* Based on linux/include/asm-generic/bitops/ffz.h */
>> +/*
>> + * ffz - find first zero in word.
>> + * @word: The word to search
>> + *
>> + * Undefined if no zero exists, so code should check against ~0UL first.
>> + */
>> +#define ffz(x)  __ffs(~(x))
> 
> Nit: Stray double padding blank?
>

Will fix.

> Jan

Thanks,
Shawn

