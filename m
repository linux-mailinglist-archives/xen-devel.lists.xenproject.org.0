Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE47A2437
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 19:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603324.940295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhCEq-0007eZ-8G; Fri, 15 Sep 2023 17:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603324.940295; Fri, 15 Sep 2023 17:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhCEq-0007cf-3W; Fri, 15 Sep 2023 17:04:16 +0000
Received: by outflank-mailman (input) for mailman id 603324;
 Fri, 15 Sep 2023 17:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=At8v=E7=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qhCEo-0007bx-Eg
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 17:04:14 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4bce15a-53e9-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 19:04:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E8E9C8285128;
 Fri, 15 Sep 2023 12:04:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Y7VmE_Ku6Xok; Fri, 15 Sep 2023 12:04:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9ECFE8285141;
 Fri, 15 Sep 2023 12:04:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VChpsDdxOMcX; Fri, 15 Sep 2023 12:04:10 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 35FBD8285128;
 Fri, 15 Sep 2023 12:04:10 -0500 (CDT)
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
X-Inumbo-ID: e4bce15a-53e9-11ee-8788-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 9ECFE8285141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694797450; bh=mm2gkfQfUL8RmamizAP7u4C3HAm6DBuCTHK+YLxWRFc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=C1FAK5rxpmZ9l7y6/gmz984CJflN3xZB6GCPdTxYRhTslReMEp10RWNeuJHx7UJGM
	 Bjo88jZO3fsoBtXrMBmYBEJU7KGDC5jYN7DFDYIm79nduUyA+ElJWNZTuSd/sc/jAB
	 Y+lGH7X1+zWU7N7Zf0UNmkn2BJvE3WHa6UOesAME=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <eebaf2d8-2df1-4f22-67d4-2143f029c4b4@raptorengineering.com>
Date: Fri, 15 Sep 2023 12:04:10 -0500
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
 <fa66a2b5-1364-48cf-dfb0-cc6c2de48bbd@raptorengineering.com>
 <508b6085-50ce-4f1d-1897-a2aea6c3f9d3@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <508b6085-50ce-4f1d-1897-a2aea6c3f9d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/23 1:50 AM, Jan Beulich wrote:
> On 14.09.2023 20:15, Shawn Anastasio wrote:
>> On 9/13/23 2:29 AM, Jan Beulich wrote:
>>> On 12.09.2023 20:35, Shawn Anastasio wrote:
>>>> --- a/xen/arch/ppc/include/asm/bitops.h
>>>> +++ b/xen/arch/ppc/include/asm/bitops.h
>>>> @@ -1,9 +1,335 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * Adapted from Linux's arch/powerpc/include/asm/bitops.h.
>>>> + *
>>>> + * Merged version by David Gibson <david@gibson.dropbear.id.au>.
>>>> + * Based on ppc64 versions by: Dave Engebretsen, Todd Inglett, Don
>>>> + * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
>>>> + * originally took it from the ppc32 code.
>>>> + */
>>>>  #ifndef _ASM_PPC_BITOPS_H
>>>>  #define _ASM_PPC_BITOPS_H
>>>>
>>>> +#include <asm/memory.h>
>>>> +
>>>> +#define __set_bit(n, p)         set_bit(n, p)
>>>> +#define __clear_bit(n, p)       clear_bit(n, p)
>>>> +
>>>> +#define BITOP_BITS_PER_WORD     32
>>>> +#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
>>>> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
>>>> +#define BITS_PER_BYTE           8
>>>> +
>>>>  /* PPC bit number conversion */
>>>> -#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
>>>> -#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
>>>> -#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>>>> +#define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
>>>> +#define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
>>>> +#define PPC_BITMASK(bs, be)  ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>>>> +
>>>> +/* Macro for generating the ***_bits() functions */
>>>> +#define DEFINE_BITOP(fn, op, prefix)                                           \
>>>> +static inline void fn(unsigned int mask,                                      \
>>>> +                      volatile unsigned int *p_)                               \
>>>> +{                                                                              \
>>>> +    unsigned int old;                                                         \
>>>> +    unsigned int *p = (unsigned int *)p_;                                      \
>>>
>>> What use is this, when ...
>>>
>>>> +    asm volatile ( prefix                                                      \
>>>> +                   "1: lwarx %0,0,%3,0\n"                                      \
>>>> +                   #op "%I2 %0,%0,%2\n"                                        \
>>>> +                   "stwcx. %0,0,%3\n"                                          \
>>>> +                   "bne- 1b\n"                                                 \
>>>> +                   : "=&r" (old), "+m" (*p)                                    \
>>>
>>> ... the "+m" operand isn't used and ...
>>>
>>>> +                   : "rK" (mask), "r" (p)                                      \
>>>> +                   : "cc", "memory" );                                         \
>>>
>>> ... there's a memory clobber anyway?
>>>
>>
>> I see what you're saying, and I'm not sure why it was written this way
>> in Linux. That said, this is the kind of thing that I'm hesitant to
>> change without knowing the rationale of the original author. If you are
>> confident that the this can be dropped given that there is already a
>> memory clobber, I could drop it. Otherwise I'm inclined to leave it in a
>> state that matches Linux.
> 
> This being an arch-independent property, I am confident. Yet still you're
> the maintainer, so if you want to keep it like this initially, that'll be
> okay. If I feel bothered enough, I could always send a patch afterwards.
>

Okay, for now then I will leave it as-is.

> Jan

Thanks,
Shawn

