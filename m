Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A07A0C4F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 20:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602622.939298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqrv-0003va-HB; Thu, 14 Sep 2023 18:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602622.939298; Thu, 14 Sep 2023 18:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqrv-0003sU-EL; Thu, 14 Sep 2023 18:15:11 +0000
Received: by outflank-mailman (input) for mailman id 602622;
 Thu, 14 Sep 2023 18:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYVF=E6=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qgqru-0003sO-4I
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 18:15:10 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1adb6b6-532a-11ee-8788-cb3800f73035;
 Thu, 14 Sep 2023 20:15:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7A3AB828466D;
 Thu, 14 Sep 2023 13:15:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZFfhI0jYldlf; Thu, 14 Sep 2023 13:15:03 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6C4A2828523D;
 Thu, 14 Sep 2023 13:15:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1uGiVYrOHPkR; Thu, 14 Sep 2023 13:15:03 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id CF591828466D;
 Thu, 14 Sep 2023 13:15:02 -0500 (CDT)
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
X-Inumbo-ID: a1adb6b6-532a-11ee-8788-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6C4A2828523D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694715303; bh=mPAItHYRl8UMAZSTKpDYep7P0nN+PGOSiVF4tphkwqY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=e5PcGEd29D2scMIPbep5YCAFy4kuoJ7+Cn8sCymXsZ4WjjdaSXQuTLQXz3qyjY52Z
	 6QuJWa+D3J1UlrCaGnKKqehFrcspGKj5B/SU2p7ToEMo44EIdL35JFnGeky6K6r1QE
	 n9dlEAf6IEQAlQbzisfIw7c0IyLgi4c3+H4Nmonk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <fa66a2b5-1364-48cf-dfb0-cc6c2de48bbd@raptorengineering.com>
Date: Thu, 14 Sep 2023 13:15:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694543103.git.sanastasio@raptorengineering.com>
 <06892692342540b6dc1af4d530fe3c2c25cf4a2e.1694543103.git.sanastasio@raptorengineering.com>
 <60d5d841-29da-519b-057c-18c5796c8f1e@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <60d5d841-29da-519b-057c-18c5796c8f1e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/13/23 2:29 AM, Jan Beulich wrote:
> On 12.09.2023 20:35, Shawn Anastasio wrote:
>> Implement bitops.h, based on Linux's implementation as of commit
>> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
>> Linux's implementation, this code diverges significantly in a number of
>> ways:
>>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>>   - PPC32-specific code paths dropped
>>   - Formatting completely re-done to more closely line up with Xen.
>>     Including 4 space indentation.
>>   - Use GCC's __builtin_popcount* for hweight* implementation
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v5:
>>   - Switch lingering ulong bitop parameters/return values to uint.
>>
>> v4:
>>   - Mention __builtin_popcount impelmentation of hweight* in message
>>   - Change type of BITOP_MASK expression from unsigned long to unsigned
>>     int
>>   - Fix remaining underscore-prefixed macro params/vars
>>   - Fix line wrapping in test_and_clear_bit{,s}
>>   - Change type of test_and_clear_bits' pointer parameter from void *
>>     to unsigned int *. This was already done for other functions but
>>     missed here.
>>   - De-macroize test_and_set_bits.
>>   - Fix formatting of ffs{,l} macro's unary operators
>>   - Drop extra blank in ffz() macro definition
>>
>> v3:
>>   - Fix style of inline asm blocks.
>>   - Fix underscore-prefixed macro parameters/variables
>>   - Use __builtin_popcount for hweight* implementation
>>   - Update C functions to use proper Xen coding style
>>
>> v2:
>>   - Clarify changes from Linux implementation in commit message
>>   - Use PPC_ATOMIC_{ENTRY,EXIT}_BARRIER macros from <asm/memory.h> instead
>>     of hardcoded "sync" instructions in inline assembly blocks.
>>   - Fix macro line-continuing backslash spacing
>>   - Fix hard-tab usage in find_*_bit C functions.
>>
>>  xen/arch/ppc/include/asm/bitops.h | 332 +++++++++++++++++++++++++++++-
>>  1 file changed, 329 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
>> index 548e97b414..0f75ff3f9d 100644
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
>> +#define __set_bit(n, p)         set_bit(n, p)
>> +#define __clear_bit(n, p)       clear_bit(n, p)
>> +
>> +#define BITOP_BITS_PER_WORD     32
>> +#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
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
>> +static inline void fn(unsigned int mask,                                      \
>> +                      volatile unsigned int *p_)                               \
>> +{                                                                              \
>> +    unsigned int old;                                                         \
>> +    unsigned int *p = (unsigned int *)p_;                                      \
> 
> What use is this, when ...
> 
>> +    asm volatile ( prefix                                                      \
>> +                   "1: lwarx %0,0,%3,0\n"                                      \
>> +                   #op "%I2 %0,%0,%2\n"                                        \
>> +                   "stwcx. %0,0,%3\n"                                          \
>> +                   "bne- 1b\n"                                                 \
>> +                   : "=&r" (old), "+m" (*p)                                    \
> 
> ... the "+m" operand isn't used and ...
> 
>> +                   : "rK" (mask), "r" (p)                                      \
>> +                   : "cc", "memory" );                                         \
> 
> ... there's a memory clobber anyway?
>

I see what you're saying, and I'm not sure why it was written this way
in Linux. That said, this is the kind of thing that I'm hesitant to
change without knowing the rationale of the original author. If you are
confident that the this can be dropped given that there is already a
memory clobber, I could drop it. Otherwise I'm inclined to leave it in a
state that matches Linux.

> Also (nit) note that the long -> int change has caused some of the
> backslashes to no longer align.
>

Will fix the backslash alignment.

>> +}
>> +
>> +DEFINE_BITOP(set_bits, or, "")
>> +DEFINE_BITOP(change_bits, xor, "")
> 
> Are there further plans to add uses of DEFINE_BITOP() with the last argument
> not an empty string? If not, how about simplifying things by dropping the
> macro parameter?
>

Sure, I can drop the last parameter.

>> +#define DEFINE_CLROP(fn, prefix)                                               \
>> +static inline void fn(unsigned int mask, volatile unsigned int *p_)           \
>> +{                                                                              \
>> +    unsigned int old;                                                         \
>> +    unsigned int *p = (unsigned int *)p_;                                      \
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
> 
> Same question here.
>

Ditto.

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
>> +    const volatile unsigned int *p = addr;
>> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
>> +}
>> +
>> +static inline unsigned int test_and_clear_bits(
>> +    unsigned int mask,
>> +    volatile unsigned int *p)
>> +{
>> +    unsigned int old, t;
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
>> +
>> +    return (old & mask);
>> +}
>> +
>> +static inline int test_and_clear_bit(unsigned int nr,
>> +                                     volatile void *addr)
>> +{
>> +    return test_and_clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
>> +                               BITOP_WORD(nr)) != 0;
> 
> Didn't you indicate you'd adjust the odd wrapping?
>

Apologies, will fix.

>> +}
>> +
>> +static inline unsigned int test_and_set_bits(
>> +    unsigned int mask,
>> +    volatile unsigned int *p)
>> +{
>> +    unsigned int old, t;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%3,0\n"
>> +                   "or%I2 %1,%0,%2\n"
>> +                   "stwcx. %1,0,%3\n"
>> +                   "bne- 1b\n"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (old), "=&r" (t)
>> +                   : "rK" (mask), "r" (p)
>> +                   : "cc", "memory" );
>> +
>> +    return (old & mask);
>> +}
>> +
>> +static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
>> +{
>> +    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
>> +                                             BITOP_WORD(nr)) != 0;
> 
> Same here then.
>

Ditto.

> Jan

Thanks,
Shawn

