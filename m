Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54C7747E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 21:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580397.908586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTSFK-0003uf-8c; Tue, 08 Aug 2023 19:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580397.908586; Tue, 08 Aug 2023 19:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTSFK-0003sl-1M; Tue, 08 Aug 2023 19:19:58 +0000
Received: by outflank-mailman (input) for mailman id 580397;
 Tue, 08 Aug 2023 19:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7Oi=DZ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTSFH-0003sI-Pb
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 19:19:55 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca36bd0-3620-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 21:19:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 744CC828587A;
 Tue,  8 Aug 2023 14:19:51 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bcHlttGesGtC; Tue,  8 Aug 2023 14:19:50 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 47DC682855D5;
 Tue,  8 Aug 2023 14:19:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1bEtGMk1tYep; Tue,  8 Aug 2023 14:19:50 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D6FEF828587A;
 Tue,  8 Aug 2023 14:19:49 -0500 (CDT)
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
X-Inumbo-ID: 8ca36bd0-3620-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 47DC682855D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691522390; bh=HYGdGlNDyauIBLzupGLZafVYsfWvl2F0CI3SW+AmCnk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=u+m7SMyJIq0iBH2P0YZVpklRZif67qxmQPhJpMtYRmJYRbuMDZN0KvTe/+cjG6vhc
	 0UXr6KhtvwAzsh3iXqlksjZuE2tSG+A8x0bG+vQUYILUK/zwqCyq+PvljGHWwZXmyR
	 fDaLzJxACkeafPR8U9QDaFW1ObzEZUOxXlAbzBws=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <080f37f4-2b2a-c057-568d-6e4974eb2f8c@raptorengineering.com>
Date: Tue, 8 Aug 2023 14:19:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/9] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <8035b9659a5930c00802dd36ab52574695d6b419.1691016993.git.sanastasio@raptorengineering.com>
 <5e9380a5-7e33-ea70-6aa5-3ce1906a159c@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <5e9380a5-7e33-ea70-6aa5-3ce1906a159c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/23 11:13 AM, Jan Beulich wrote:
> On 03.08.2023 01:02, Shawn Anastasio wrote:
>> Implement atomic.h for PPC, based off of the original Xen 3.2
>> implementation.
> 
> Since likely that originally came from Linux, did you cross check that
> Linux hasn't gained any bug fixes in the meantime?

I did -- the atomic barrier instructions used by linux have changed
since this code was originally written, so I've updated them to be
inline with modern linux.

> Other than this just a couple of nits; I'm not really qualified to
> review in particular the inline assembly here, I'm afraid.
> 
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/atomic.h
>> @@ -0,0 +1,387 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * PowerPC64 atomic operations
>> + *
>> + * Copyright (C) 2001 Paul Mackerras <paulus@au.ibm.com>, IBM
>> + * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
>> + * Copyright Raptor Engineering LLC
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>> +
>> +#ifndef _ASM_PPC64_ATOMIC_H_
>> +#define _ASM_PPC64_ATOMIC_H_
> 
> To fit the name, no "64" please.

Will fix.

>> +#include <xen/atomic.h>
>> +
>> +#include <asm/memory.h>
>> +#include <asm/system.h>
>> +
>> +static inline int atomic_read(const atomic_t *v)
>> +{
>> +    return *(volatile int *)&v->counter;
>> +}
>> +
>> +static inline int _atomic_read(atomic_t v)
>> +{
>> +    return v.counter;
>> +}
>> +
>> +static inline void atomic_set(atomic_t *v, int i)
>> +{
>> +    v->counter = i;
>> +}
>> +
>> +static inline void _atomic_set(atomic_t *v, int i)
>> +{
>> +    v->counter = i;
>> +}
>> +
>> +void __bad_atomic_read(const volatile void *p, void *res);
>> +void __bad_atomic_size(void);
>> +
>> +#define build_atomic_read(name, insn, type)                                    \
>> +    static inline type name(const volatile type *addr)                         \
>> +    {                                                                          \
>> +        type ret;                                                              \
>> +        asm volatile ( insn "%U1%X1 %0,%1" : "=r"(ret) : "m<>"(*addr) );       \
> 
> As I think I had mentioned before, asm() contraints want a blank between
> closing quote and opend paren. I.e. like this
> 
>         asm volatile ( insn "%U1%X1 %0,%1" : "=r" (ret) : "m<>" (*addr) );
> 

My mistake, I went through and hand-formatted all of this code to try to
be inline with Xen's style but forgot about the constraints.

As an aside, I don't suppose there is an automatic formatter somewhere
that I've missed? I found an old clang-format fork that claims to add
support for Xen's formatting[1] but it seems to only handle a subset of
Xen's rules so I haven't found it very useful.

[1] https://github.com/NastyaVicodin/llvm-project/commits/main

>> +#define read_atomic(p)                                                         \
>> +    ({                                                                         \
>> +        union {                                                                \
>> +            typeof(*(p)) val;                                                  \
>> +            char c[0];                                                         \
>> +        } x_;                                                                  \
>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
>> +        x_.val;                                                                \
>> +    })
>> +
>> +#define write_atomic(p, x)                                                     \
>> +    do                                                                         \
>> +    {                                                                          \
>> +        typeof(*(p)) x_ = (x);                                                 \
>> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
>> +    } while ( 0 )
> 
> Up to here you use underscore-suffixed locals, but then ...
> 
>> +#define add_sized(p, x)                                                        \
>> +    ({                                                                         \
>> +        typeof(*(p)) __x = (x);                                                \
> 
> ... you have even two prefixing underscores here.
> 

The definitions of these macros were directly copied from elsewhere in
Xen (x86 and arm). I can change them all to use underscore-suffixed
local naming here, though.

>> +        switch ( sizeof(*(p)) )                                                \
>> +        {                                                                      \
>> +        case 1:                                                                \
>> +            add_u8_sized((uint8_t *) (p), __x);                                \
>> +            break;                                                             \
>> +        case 2:                                                                \
>> +            add_u16_sized((uint16_t *) (p), __x);                              \
>> +            break;                                                             \
>> +        case 4:                                                                \
>> +            add_u32_sized((uint32_t *) (p), __x);                              \
>> +            break;                                                             \
>> +        default:                                                               \
>> +            __bad_atomic_size();                                               \
>> +            break;                                                             \
>> +        }                                                                      \
>> +    })
>> +
>> +static inline void atomic_add(int a, atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( "1: lwarx %0,0,%3\n"
>> +                   "add %0,%2,%0\n"
>> +                   "stwcx. %0,0,%3\n"
>> +                   "bne- 1b"
>> +                   : "=&r"(t), "=m"(v->counter)
>> +                   : "r"(a), "r"(&v->counter), "m"(v->counter) : "cc" );
> 
> "+m" and then drop the last input?
> 

Yes, that makes sense. Not sure why it was originally written that way
but I'll change it.

>> +static inline int atomic_dec_if_positive(atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile(PPC_ATOMIC_ENTRY_BARRIER
>> +                 "1:    lwarx    %0,0,%1        # atomic_dec_if_positive\n"
>> +                 "addic.    %0,%0,-1\n"
>> +                 "blt-    2f\n"
>> +                 "stwcx.    %0,0,%1\n"
>> +                 "bne-    1b\n"
>> +                 PPC_ATOMIC_EXIT_BARRIER
>> +                 "2:" : "=&r"(t)
>> +                 : "r"(&v->counter) : "cc", "memory");
> 
> Missing blanks near the parentheses. Would also be nice if the padding
> blanks actually vertically aligned the operands.

I tried to make the spacing uniform across all asm blocks in this file,
but the convention I used was just a single space between the mnemonic
and the operands. I seemed to have missed this one though, so I'll bring
it in line with the others.

>> +    return t;
>> +}
>> +
>> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
>> +                                             atomic_t *v)
>> +{
>> +    atomic_t rc;
>> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));
>> +    return rc;
>> +}
>> +
>> +#define arch_cmpxchg(ptr, o, n)                                                \
>> +    ({                                                                         \
>> +        __typeof__(*(ptr)) _o_ = (o);                                          \
>> +        __typeof__(*(ptr)) _n_ = (n);                                          \
> 
> Problematic leading underscores again.
> 

Will fix.

>> +        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) _o_,             \
>> +                                       (unsigned long) _n_, sizeof(*(ptr)));   \
>> +    })
>> +
>> +static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
>> +{
>> +    return arch_cmpxchg(&v->counter, old, new);
>> +}
>> +
>> +#define ATOMIC_OP(op, insn, suffix, sign) \
>> +    static inline void atomic_##op(int a, atomic_t *v)                           \
>> +    {                                                                            \
>> +        int t;                                                                   \
>> +        asm volatile ( "1: lwarx %0,0,%3\n"                                      \
>> +                       insn "%I2" suffix " %0,%0,%2\n"                         \
>> +                       "stwcx. %0,0,%3 \n"                                       \
>> +                       "bne- 1b\n"                                               \
>> +                       : "=&r"(t), "+m"(v->counter)                              \
>> +                       : "r" #sign(a), "r"(&v->counter)                          \
>> +                       : "cc" );                                                 \
>> +    }
>> +
>> +ATOMIC_OP(and, "and", ".", K)
>> +
>> +static inline int atomic_sub_and_test(int i, atomic_t *v)
>> +{
>> +    return atomic_sub_return(i, v) == 0;
>> +}
>> +
>> +static inline int atomic_inc_and_test(atomic_t *v)
>> +{
>> +    return atomic_add_return(1, v) == 0;
>> +}
>> +
>> +static inline int atomic_dec_and_test(atomic_t *v)
>> +{
>> +    return atomic_sub_return(1, v) == 0;
>> +}
>> +
>> +static inline int atomic_add_negative(int i, atomic_t *v)
>> +{
>> +    return atomic_add_return(i, v) < 0;
>> +}
>> +
>> +static inline int __atomic_add_unless(atomic_t *v, int a, int u)
>> +{
>> +	int c, old;
>> +
>> +	c = atomic_read(v);
>> +	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
> 
> Btw, no real need to parenthesize v in cases like this one. Otoh a needs
> parenthesizing.

FWIW this was copied directly from arm64/atomic.h, but seeing as its a
normal function and not a macro I'm not sure I see why `a` would need
parenthesis. I'll drop the ones around `v` though.

> Jan

Thanks,
Shawn

