Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A445A78F3BF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 22:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594096.927297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnw6-00017Z-3T; Thu, 31 Aug 2023 20:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594096.927297; Thu, 31 Aug 2023 20:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnw5-00014B-W2; Thu, 31 Aug 2023 20:06:37 +0000
Received: by outflank-mailman (input) for mailman id 594096;
 Thu, 31 Aug 2023 20:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z9zM=EQ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qbnw4-0000xQ-AS
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 20:06:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2806126-4839-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 22:06:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 224D28285635;
 Thu, 31 Aug 2023 15:06:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8vuCxlcRiku3; Thu, 31 Aug 2023 15:06:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 60F5E82857EE;
 Thu, 31 Aug 2023 15:06:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hivbq6fxeEbL; Thu, 31 Aug 2023 15:06:32 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B0B278285635;
 Thu, 31 Aug 2023 15:06:31 -0500 (CDT)
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
X-Inumbo-ID: e2806126-4839-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 60F5E82857EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693512392; bh=W5o1eD1Q23cBACeHm76/Z842a5Ld+r9IP8MOPwKs490=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=k5OqAB4vO4n5AByuzqQ/V2oiE3DKHYhlN2t8c4YMqF6yNLtn5Mof1vfrxPUhIVG0Y
	 tZXMiTr0cV9JDNxD5x6jw7V1U3kd4g6FaWbQcDssJFYR0RdUTx8TCQR+gMRcQdIwBr
	 GuA9/OrJrb+5PUYUEOWwgFSmoLoF1pH7pAFEcwPM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <3b05ad4d-20e8-72f1-3f43-1c4e618c6ba4@raptorengineering.com>
Date: Thu, 31 Aug 2023 15:06:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/8] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <583ed0d715aa70e777e7aa62a287acafc52d5a24.1692816595.git.sanastasio@raptorengineering.com>
 <11f73889-2059-1d6d-6498-1f1907afabaa@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <11f73889-2059-1d6d-6498-1f1907afabaa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/23 8:59 AM, Jan Beulich wrote:
> On 23.08.2023 22:07, Shawn Anastasio wrote:
>> Implement bitops.h, based on Linux's implementation as of commit
>> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
>> Linux's implementation, this code diverges significantly in a number of
>> ways:
>>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>>   - PPC32-specific code paths dropped
>>   - Formatting completely re-done to more closely line up with Xen.
>>     Including 4 space indentation.
> 
> With this goal, ...
> 
>> --- a/xen/arch/ppc/include/asm/bitops.h
>> +++ b/xen/arch/ppc/include/asm/bitops.h
>> @@ -1,9 +1,335 @@
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
>> +#define __set_bit(n,p)            set_bit(n,p)
>> +#define __clear_bit(n,p)          clear_bit(n,p)
> 
> ... you want to add blanks after the commas as well. (You might also
> simply omit parameters altogether.)
> 
>> +#define BITOP_BITS_PER_WORD     32
>> +#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
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
>> +        volatile unsigned int *_p)                                             \
> 
> Nit: Style. Either
> 
> static inline void fn(unsigned long mask,                                      \
>                       volatile unsigned int *_p)                               \
> 
> or
> 
> static inline void fn(unsigned long mask,                                      \
>     volatile unsigned int *_p)                                                 \
> 
> . Also there's again an underscore-prefixed identifier here.
>

Will fix both.

>> +{                                                                              \
>> +    unsigned long old;                                                         \
>> +    unsigned int *p = (unsigned int *)_p;                                      \
>> +    asm volatile (                                                             \
>> +    prefix                                                                     \
>> +"1: lwarx %0,0,%3,0\n"                                                         \
>> +    #op "%I2 %0,%0,%2\n"                                                       \
>> +    "stwcx. %0,0,%3\n"                                                         \
>> +    "bne- 1b\n"                                                                \
>> +    : "=&r" (old), "+m" (*p)                                                   \
>> +    : "rK" (mask), "r" (p)                                                     \
>> +    : "cc", "memory");                                                         \
> 
> The asm() body wants indenting by another four blanks (more instances below).
>

If I were to match the style used in the previous patch's atomic.h, the
body should be indented to line up with the opening ( of the asm
statement, right? I'll go ahead and do that for consistency's sake
unless you think it would be better to just leave it as-is with an extra
4 spaces of indentation.

>> +}
>> +
>> +DEFINE_BITOP(set_bits, or, "")
>> +DEFINE_BITOP(change_bits, xor, "")
>> +
>> +#define DEFINE_CLROP(fn, prefix)                                               \
>> +static inline void fn(unsigned long mask, volatile unsigned int *_p)           \
>> +{                                                                              \
>> +    unsigned long old;                                                         \
>> +    unsigned int *p = (unsigned int *)_p;                                      \
>> +    asm volatile (                                                             \
>> +    prefix                                                                     \
>> +"1: lwarx %0,0,%3,0\n"                                                         \
>> +    "andc %0,%0,%2\n"                                                          \
>> +    "stwcx. %0,0,%3\n"                                                         \
>> +    "bne- 1b\n"                                                                \
>> +    : "=&r" (old), "+m" (*p)                                                   \
>> +    : "r" (mask), "r" (p)                                                      \
>> +    : "cc", "memory");                                                         \
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
>> +        const volatile unsigned long *p = (const volatile unsigned long *)addr;
>> +        return 1UL & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD-1)));
> 
> Nit: Too deep indentation. Plus blanks around - please. I also don't see
> the need for the UL suffix, when the function returns int only (and really
> means to return bool, I assume, but int is in line with x86 and Arm, I
> expect).
>

Will fix the indentation and spacing around -. I'll also drop the UL
suffix, but will keep the int return type, since as you guessed it's
what Arm/x86 do.

>> +}
>> +
>> +static inline unsigned long test_and_clear_bits(unsigned long mask, volatile void *_p)
>> +{
>> +    unsigned long old, t;
>> +    unsigned int *p = (unsigned int *)_p;
>> +
>> +    asm volatile (
>> +        PPC_ATOMIC_ENTRY_BARRIER
>> +        "1: lwarx %0,0,%3,0\n"
>> +        "andc %1,%0,%2\n"
>> +        "stwcx. %1,0,%3\n"
>> +        "bne- 1b\n"
>> +        PPC_ATOMIC_EXIT_BARRIER
>> +        : "=&r" (old), "=&r" (t)
>> +        : "r" (mask), "r" (p)
>> +        : "cc", "memory");
>> +
>> +    return (old & mask);
>> +}
>> +
>> +static inline int test_and_clear_bit(unsigned int nr,
>> +                                       volatile void *addr)
> 
> Nit: Too deep indentation again.
>

Will fix this and all subsequent occurrences.

>> +DEFINE_TESTOP(test_and_set_bits, or, 0)
>> +
>> +static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
>> +{
>> +    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
> 
> Too long line.
>

Will fix.

>> +}
>> +
>> +/**
>> + * __test_and_set_bit - Set a bit and return its old value
>> + * @nr: Bit to set
>> + * @addr: Address to count from
>> + *
>> + * This operation is non-atomic and can be reordered.
>> + * If two examples of this operation race, one can appear to succeed
>> + * but actually fail.  You must protect multiple accesses with a lock.
>> + */
>> +static inline int __test_and_set_bit(int nr, volatile void *addr)
>> +{
>> +        unsigned int mask = BITOP_MASK(nr);
>> +        volatile unsigned int *p =
>> +                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
>> +        unsigned int old = *p;
>> +
>> +        *p = old | mask;
>> +        return (old & mask) != 0;
>> +}
>> +
>> +/**
>> + * __test_and_clear_bit - Clear a bit and return its old value
>> + * @nr: Bit to clear
>> + * @addr: Address to count from
>> + *
>> + * This operation is non-atomic and can be reordered.
>> + * If two examples of this operation race, one can appear to succeed
>> + * but actually fail.  You must protect multiple accesses with a lock.
>> + */
>> +static inline int __test_and_clear_bit(int nr, volatile void *addr)
>> +{
>> +        unsigned int mask = BITOP_MASK(nr);
>> +        volatile unsigned int *p =
>> +                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
>> +        unsigned int old = *p;
>> +
>> +        *p = old & ~mask;
>> +        return (old & mask) != 0;
>> +}
>> +
>> +#define flsl(x) generic_flsl(x)
>> +#define fls(x) generic_fls(x)
>> +#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
>> +#define ffsl(x) ({ unsigned long __t = (x); flsl(__t & -__t); })
> 
> Hmm, here you even have two underscores as prefixes.
>

Another carryover from Arm, sorry. Will fix.

>> +/* Based on linux/include/asm-generic/bitops/ffz.h */
>> +/*
>> + * ffz - find first zero in word.
>> + * @word: The word to search
>> + *
>> + * Undefined if no zero exists, so code should check against ~0UL first.
>> + */
>> +#define ffz(x)  __ffs(~(x))
>> +
>> +/**
>> + * hweightN - returns the hamming weight of a N-bit word
>> + * @x: the word to weigh
>> + *
>> + * The Hamming Weight of a number is the total number of bits set in it.
>> + */
>> +#define hweight64(x) generic_hweight64(x)
>> +#define hweight32(x) generic_hweight32(x)
>> +#define hweight16(x) generic_hweight16(x)
>> +#define hweight8(x) generic_hweight8(x)
> 
> Not using popcnt{b,w,d}, e.g. via a compiler builtin?
>

Excellent point. It looks like gcc's __builtin_popcount* family of
builtins will do what we want here. I suppose the other architectures in
Xen don't do this because they target toolchains old enough to not have
these builtins?

>> +/* Based on linux/include/asm-generic/bitops/builtin-__ffs.h */
>> +/**
>> + * __ffs - find first bit in word.
>> + * @word: The word to search
>> + *
>> + * Undefined if no bit exists, so code should check against 0 first.
>> + */
>> +static /*__*/always_inline unsigned long __ffs(unsigned long word)
> 
> What's this odd comment about here?
>

(Yet another) carryover from Arm. Will fix.

>> +{
>> +        return __builtin_ctzl(word);
>> +}
>> +
>> +/**
>> + * find_first_set_bit - find the first set bit in @word
>> + * @word: the word to search
>> + *
>> + * Returns the bit-number of the first set bit (first bit being 0).
>> + * The input must *not* be zero.
>> + */
>> +#define find_first_set_bit(x) ({ ffsl(x) - 1; })
> 
> Simply
> 
> #define find_first_set_bit(x) (ffsl(x) - 1)
> 
> without use of any extensions?
>

Good point, the extension usage here is obviously unnecessary. Will
drop.

>> +/*
>> + * Find the first set bit in a memory region.
>> + */
>> +static inline unsigned long find_first_bit(const unsigned long *addr,
>> +                                           unsigned long size)
>> +{
>> +    const unsigned long *p = addr;
>> +    unsigned long result = 0;
>> +    unsigned long tmp;
>> +
>> +    while (size & ~(BITS_PER_LONG-1)) {
>> +        if ((tmp = *(p++)))
>> +            goto found;
>> +        result += BITS_PER_LONG;
>> +        size -= BITS_PER_LONG;
>> +    }
>> +    if (!size)
>> +        return result;
> 
> Just using 4-blank indentation isn't enough to make this Xen style.
> (More such elsewhere.)
>

Yes, fair enough. I'll reformat it.

>> +    tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
>> +    if (tmp == 0UL)        /* Are any bits set? */
>> +        return result + size;    /* Nope. */
>> +found:
> 
> Labels indented by at least one blank please. (More elsewhere.)

I wasn't aware of this style convention -- so a single blank before the
label would be correct? I'll add that in, then.

> Jan

Thanks,
Shawn

