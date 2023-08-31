Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E378F229
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 19:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594032.927207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbllv-0005hs-2T; Thu, 31 Aug 2023 17:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594032.927207; Thu, 31 Aug 2023 17:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbllu-0005gB-U2; Thu, 31 Aug 2023 17:47:58 +0000
Received: by outflank-mailman (input) for mailman id 594032;
 Thu, 31 Aug 2023 17:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z9zM=EQ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qbllu-0005fK-1Q
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 17:47:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8347395e-4826-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 19:47:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F35988285183;
 Thu, 31 Aug 2023 12:47:53 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Wy0MrPEhccYC; Thu, 31 Aug 2023 12:47:52 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 832C3828538A;
 Thu, 31 Aug 2023 12:47:52 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qfbLZ-aUquAX; Thu, 31 Aug 2023 12:47:52 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 158798285183;
 Thu, 31 Aug 2023 12:47:52 -0500 (CDT)
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
X-Inumbo-ID: 8347395e-4826-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 832C3828538A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693504072; bh=PbyX2jOG3+u8jIViCmJyyd7ppkGx1yZXtgJiDh0EKAg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=aN3r4yK6DpDp4tYafq5pmr/Fm+msZpdgk0j/MSsASIpYiRRbq92G59R6ArmGlfoVC
	 JjySpqUiDgW/6RdRCan4lcIN96WNcFrWgfEryFmIiCXS1CGznZrjy0iF+PWUE4wO2M
	 j3Qp1lt4V/GVPPNBjK7vHXTzhtC+T+wz71ibQnPc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <80aa376b-137d-b799-cc3e-4e080abc2500@raptorengineering.com>
Date: Thu, 31 Aug 2023 12:47:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/8] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <6d97bdeb1c114026105e72c6ee6e1b024565bf95.1692816595.git.sanastasio@raptorengineering.com>
 <257cd320-fe81-f1be-f3e5-ef43e539660a@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <257cd320-fe81-f1be-f3e5-ef43e539660a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/23 8:43 AM, Jan Beulich wrote:
> On 23.08.2023 22:07, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/atomic.h
>> @@ -0,0 +1,390 @@
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
> 
> License text again despite the SPDX header?
>

Will fix.

>> +#ifndef _ASM_PPC64_ATOMIC_H_
>> +#define _ASM_PPC64_ATOMIC_H_
>> +
>> +#include <xen/atomic.h>
>> +
>> +#include <asm/memory.h>
>> +#include <asm/system.h>
> 
> I can see that you need memory.h, but I can't spot a need for system.h.
>

Just confirmed, you're correct. I'll drop it.

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
>> +        asm volatile ( insn "%U1%X1 %0,%1" : "=r" (ret) : "m<>" (*addr) );     \
>> +        return ret;                                                            \
>> +    }
>> +
>> +#define build_atomic_write(name, insn, type)                                   \
>> +    static inline void name(volatile type *addr, type val)                     \
>> +    {                                                                          \
>> +        asm volatile ( insn "%U0%X0 %1,%0" : "=m<>" (*addr) : "r" (val) );     \
>> +    }
>> +
>> +#define build_add_sized(name, ldinsn, stinsn, type)                            \
>> +    static inline void name(volatile type *addr, type val)                     \
>> +    {                                                                          \
>> +        type t;                                                                \
>> +        asm volatile ( "1: " ldinsn " %0,0,%3\n"                               \
>> +                       "add%I2 %0,%0,%2\n"                                     \
>> +                       stinsn " %0,0,%3 \n"                                    \
>> +                       "bne- 1b\n"                                             \
>> +                       : "=&r" (t), "+m" (*addr)                               \
>> +                       : "r" (val), "r" (addr)                                 \
>> +                       : "cc" );                                               \
>> +    }
>> +
>> +build_atomic_read(read_u8_atomic, "lbz", uint8_t)
>> +build_atomic_read(read_u16_atomic, "lhz", uint16_t)
>> +build_atomic_read(read_u32_atomic, "lwz", uint32_t)
>> +build_atomic_read(read_u64_atomic, "ldz", uint64_t)
>> +
>> +build_atomic_write(write_u8_atomic, "stb", uint8_t)
>> +build_atomic_write(write_u16_atomic, "sth", uint16_t)
>> +build_atomic_write(write_u32_atomic, "stw", uint32_t)
>> +build_atomic_write(write_u64_atomic, "std", uint64_t)
>> +
>> +build_add_sized(add_u8_sized, "lbarx", "stbcx.",uint8_t)
>> +build_add_sized(add_u16_sized, "lharx", "sthcx.", uint16_t)
>> +build_add_sized(add_u32_sized, "lwarx", "stwcx.", uint32_t)
>> +
>> +#undef build_atomic_read
>> +#undef build_atomic_write
>> +#undef build_add_sized
>> +
>> +static always_inline void read_atomic_size(const volatile void *p, void *res,
>> +                                           unsigned int size)
>> +{
>> +    ASSERT(IS_ALIGNED((vaddr_t) p, size));
> 
> Nit: Stray blank before p (several more below).
>

Will fix.

>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        *(uint8_t *)res = read_u8_atomic(p);
>> +        break;
>> +    case 2:
>> +        *(uint16_t *)res = read_u16_atomic(p);
>> +        break;
>> +    case 4:
>> +        *(uint32_t *)res = read_u32_atomic(p);
>> +        break;
>> +    case 8:
>> +        *(uint64_t *)res = read_u64_atomic(p);
>> +        break;
>> +    default:
>> +        __bad_atomic_read(p, res);
>> +        break;
>> +    }
>> +}
>> +
>> +static always_inline void write_atomic_size(volatile void *p, void *val,
> 
> const void *val? (But then below also don't cast away constness.)
>

Sure, that's reasonable. Will fix.

>> +                                            unsigned int size)
>> +{
>> +    ASSERT(IS_ALIGNED((vaddr_t) p, size));
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        write_u8_atomic(p, *(uint8_t *)val);
>> +        break;
>> +    case 2:
>> +        write_u16_atomic(p, *(uint16_t *)val);
>> +        break;
>> +    case 4:
>> +        write_u32_atomic(p, *(uint32_t *)val);
>> +        break;
>> +    case 8:
>> +        write_u64_atomic(p, *(uint64_t *)val);
>> +        break;
>> +    default:
>> +        __bad_atomic_size();
>> +        break;
>> +    }
>> +}
>> +
>> +#define read_atomic(p)                                                         \
>> +    ({                                                                         \
>> +        union {                                                                \
>> +            typeof(*(p)) val;                                                  \
>> +            char c[0];                                                         \
> 
> Using [0] here is likely to set us up for compiler complaints ...
>

AIUI zero-length members are explicitly permitted as a GNU extension,
but their usage here wasn't an explicit choice on my part as this macro
was inherited from arm's atomic.h. See below.

>> +        } x_;                                                                  \
>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
> 
> ... here. Can't this simply be c[sizeof(*(val))]? And do you need
> a union here in the first place, when read_atomic() takes void* as
> its 2nd parameter?
>

Yes, I should have taken a closer look at this before importing it from
arm. The type punning does seem entirely redundant given that
read_atomic_size takes a void* -- I'm not sure why it was written this
way to begin with.

In any case, I'll do away with the unnecessary union.

>> +        x_.val;                                                                \
>> +    })
>> +
>> +#define write_atomic(p, x)                                                     \
>> +    do                                                                         \
>> +    {                                                                          \
>> +        typeof(*(p)) x_ = (x);                                                 \
>> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
>> +    } while ( 0 )
>> +
>> +#define add_sized(p, x)                                                        \
>> +    ({                                                                         \
>> +        typeof(*(p)) x_ = (x);                                                \
>> +        switch ( sizeof(*(p)) )                                                \
>> +        {                                                                      \
>> +        case 1:                                                                \
>> +            add_u8_sized((uint8_t *) (p), x_);                                \
>> +            break;                                                             \
>> +        case 2:                                                                \
>> +            add_u16_sized((uint16_t *) (p), x_);                              \
>> +            break;                                                             \
>> +        case 4:                                                                \
>> +            add_u32_sized((uint32_t *) (p), x_);                              \
>> +            break;                                                             \
>> +        default:                                                               \
>> +            __bad_atomic_size();                                               \
>> +            break;                                                             \
>> +        }                                                                      \
>> +    })
> 
> Nit: Padding wants to align the backslashes.
>

Will fix.

>> +static inline void atomic_add(int a, atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( "1: lwarx %0,0,%3\n"
>> +                   "add %0,%2,%0\n"
>> +                   "stwcx. %0,0,%3\n"
>> +                   "bne- 1b"
>> +                   : "=&r" (t), "+m" (v->counter)
> 
> I notice you use "+m" here, but ...
> 
>> +                   : "r" (a), "r" (&v->counter)
>> +                   : "cc" );
>> +}
>> +
>> +static inline int atomic_add_return(int a, atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%2\n"
>> +                   "add %0,%1,%0\n"
>> +                   "stwcx. %0,0,%2\n"
>> +                   "bne- 1b"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (t)
>> +                   : "r" (a), "r" (&v->counter)
>> +                   : "cc", "memory" );
>> +
>> +    return t;
>> +}
>> +
>> +static inline void atomic_sub(int a, atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( "1: lwarx %0,0,%3\n"
>> +                   "subf %0,%2,%0\n"
>> +                   "stwcx. %0,0,%3\n"
>> +                   "bne- 1b"
>> +                   : "=&r" (t), "=m" (v->counter)
>> +                   : "r" (a), "r" (&v->counter), "m" (v->counter)
> 
> ... why not here (and again below)?
>

This has to do with the origin of these functions. The functions taken
from the original Xen ppc implementation seem to not use +m (as we've
seen in a few other instances before from the same port). I'll go
through and update all of these functions to use +m instead.

>> +                   : "cc" );
>> +}
>> +
>> +static inline int atomic_sub_return(int a, atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%2\n"
>> +                   "subf %0,%1,%0\n"
>> +                   "stwcx. %0,0,%2\n"
>> +                   "bne- 1b"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (t)
>> +                   : "r" (a), "r" (&v->counter)
>> +                   : "cc", "memory" );
>> +
>> +    return t;
>> +}
>> +
>> +static inline void atomic_inc(atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( "1: lwarx %0,0,%2\n"
>> +                   "addic %0,%0,1\n"
>> +                   "stwcx. %0,0,%2\n"
>> +                   "bne- 1b"
>> +                   : "=&r" (t), "=m" (v->counter)
>> +                   : "r" (&v->counter), "m" (v->counter)
>> +                   : "cc" );
>> +}
>> +
>> +static inline int atomic_inc_return(atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%1\n"
>> +                   "addic %0,%0,1\n"
>> +                   "stwcx. %0,0,%1\n"
>> +                   "bne- 1b"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (t)
>> +                   : "r" (&v->counter)
>> +                   : "cc", "memory" );
>> +
>> +    return t;
>> +}
>> +
>> +static inline void atomic_dec(atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( "1: lwarx %0,0,%2\n"
>> +                   "addic %0,%0,-1\n"
>> +                   "stwcx. %0,0,%2\n"
>> +                   "bne- 1b"
>> +                   : "=&r" (t), "=m" (v->counter)
>> +                   : "r" (&v->counter), "m" (v->counter)
>> +                   : "cc" );
>> +}
>> +
>> +static inline int atomic_dec_return(atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%1\n"
>> +                   "addic %0,%0,-1\n"
>> +                   "stwcx. %0,0,%1\n"
>> +                   "bne- 1b"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (t)
>> +                   : "r" (&v->counter)
>> +                   : "cc", "memory" );
>> +
>> +    return t;
>> +}
>> +
>> +/*
>> + * Atomically test *v and decrement if it is greater than 0.
>> + * The function returns the old value of *v minus 1.
>> + */
>> +static inline int atomic_dec_if_positive(atomic_t *v)
>> +{
>> +    int t;
>> +
>> +    asm volatile( PPC_ATOMIC_ENTRY_BARRIER
>> +                  "1: lwarx %0,0,%1 # atomic_dec_if_positive\n"
>> +                  "addic. %0,%0,-1\n"
>> +                  "blt- 2f\n"
>> +                  "stwcx. %0,0,%1\n"
>> +                  "bne- 1b\n"
>> +                  PPC_ATOMIC_EXIT_BARRIER
>> +                  "2:"
>> +                  : "=&r" (t)
>> +                  : "r" (&v->counter)
>> +                  : "cc", "memory" );
>> +
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
>> +        __typeof__(*(ptr)) o_ = (o);                                          \
>> +        __typeof__(*(ptr)) n_ = (n);                                          \
>> +        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) o_,             \
>> +                                       (unsigned long) n_, sizeof(*(ptr)));   \
>> +    })
> 
> Nit: Padding again.

Will fix.

> Jan

Thanks,
Shawn

