Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176791AA08
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 16:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750173.1158419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqYb-0001fd-R9; Thu, 27 Jun 2024 14:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750173.1158419; Thu, 27 Jun 2024 14:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqYb-0001e5-OC; Thu, 27 Jun 2024 14:57:05 +0000
Received: by outflank-mailman (input) for mailman id 750173;
 Thu, 27 Jun 2024 14:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMqYa-0001dd-Fb
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 14:57:04 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8329fb30-3495-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 16:57:02 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso98446781fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 07:57:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a58ebfsm1442999b3a.196.2024.06.27.07.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 07:57:01 -0700 (PDT)
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
X-Inumbo-ID: 8329fb30-3495-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719500222; x=1720105022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gn7wnWRU/TzvR/QPwwZ9drO1pbD5OcGHdq1Z/b5IrPg=;
        b=Nf2BDms+DJM9+Dqwp9eUqByl3HKDNEQpZKSMqLoWLwP1/boY1g0rSA39LSe5bdsWfQ
         zxIN7B+arzLjroo9LuwPaLS4+jWS9RZYkTR+t53cipWwUh9pjmNaWsTXCPI9DubGExTc
         DhLqFoGuzz7jJXASuBI5p0PjztdVYccPBaIpW7ShOdI/dRgrCGMsUH1R2NgoyCLTQl/P
         P4J9BmlRg1VD/PsBOA7cW+1nqdpyjQ/l2C6m+QzRE1tYzD/G4++CInFeDq87BgDNwN+F
         WDIqe6pQPPst+GG+6aLNa+JE0hNG72s4U7dt3unLiCbALPyyJ7agCvJiYMUIM33JrsMk
         REhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500222; x=1720105022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn7wnWRU/TzvR/QPwwZ9drO1pbD5OcGHdq1Z/b5IrPg=;
        b=A8NOKj5kyKne6O6q79ZXhCbt3n8/vl+xDTiu27QCsCNmhOJrJGG38yfQnrYvAzKzri
         /x2HSBORm/WWeQEjtI7IP+68ZQHE5H80ZirXsvLTPHNB8bMxLyXC27evNGbKzsAWrMMq
         Wlqd4Yx/6PRw4WjTRxlwk0QzbRFWUcYyTHoFx7WMTX/yNmZuEVxJpCkVe1pxAtqHw5gh
         IlSNVi/nFDovkHWM6719yPZtPbv9VXIQyCwFc/aBwiuZ8Xb4bLL6xoQekhKNXSkYzv+a
         NHMWybkP4lR/Hp4fMMuQ2VIByQ+3K23d3ljssBEaFyHqYOyQCIyc/XNh84538s3adDEv
         O/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf2uy0WTX41bNK94EEBN9w6/K49TDIHVqCEjFSL1UaBbrOa9UojoASvSGKe7dwxKP6HUdMm/ImEgC2wIV+yWwFKxjV55bNvth4QpD/Xes=
X-Gm-Message-State: AOJu0Yw6q6Y7zTGl8ZfHersc/vvXqeNvw/g7WiZn9NeQTKhBbmPXs8uC
	sI1X97zTTh+dhzgcHV2jPv02xntD4KxsfOYPv8L3RLcYNSgRuVshNlE4HRQVNw==
X-Google-Smtp-Source: AGHT+IEiGkgfPLc6jOnhqUCejSIhj0sGP6Z0LDuUUhzqpaeCIqKGZOWcXLXUJAGFnEXO0KQLuDJLKg==
X-Received: by 2002:a2e:9cc8:0:b0:2ec:3fb8:6a91 with SMTP id 38308e7fff4ca-2ec5797a562mr96373991fa.19.1719500222205;
        Thu, 27 Jun 2024 07:57:02 -0700 (PDT)
Message-ID: <ac245978-e21e-4df7-a071-8b63793f6c8b@suse.com>
Date: Thu, 27 Jun 2024 16:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 02/10] xen/riscv: introduce bitops.h
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <0e4441eee82b0545e59099e2f62e3a01fa198d08.1719319093.git.oleksii.kurochko@gmail.com>
 <bb103587-546d-4613-bcb8-df10f5d05388@suse.com>
 <4c15dd072f08b1161d170608a096dc0851ced588.camel@gmail.com>
 <e2d82c37-da44-4a8f-a1f8-76d5ff05b104@suse.com>
 <f4f3a1550b4809a3cb8b27eb5e7248abf27b3944.camel@gmail.com>
 <4c71db0d-60a4-4347-b706-a2e06fc9cd63@suse.com>
 <7bd44b8615eb545b4956008d02c158d5c85e2345.camel@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <7bd44b8615eb545b4956008d02c158d5c85e2345.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.06.2024 14:01, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-06-27 at 12:10 +0200, Jan Beulich wrote:
>> On 27.06.2024 11:58, oleksii.kurochko@gmail.com wrote:
>>> On Thu, 2024-06-27 at 09:59 +0200, Jan Beulich wrote:
>>>> On 26.06.2024 19:27, oleksii.kurochko@gmail.com wrote:
>>>>> On Wed, 2024-06-26 at 10:31 +0200, Jan Beulich wrote:
>>>>>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>>>>>> @@ -0,0 +1,137 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>> +/* Copyright (C) 2012 Regents of the University of
>>>>>>> California
>>>>>>> */
>>>>>>> +
>>>>>>> +#ifndef _ASM_RISCV_BITOPS_H
>>>>>>> +#define _ASM_RISCV_BITOPS_H
>>>>>>> +
>>>>>>> +#include <asm/system.h>
>>>>>>> +
>>>>>>> +#if BITOP_BITS_PER_WORD == 64
>>>>>>> +#define __AMO(op)   "amo" #op ".d"
>>>>>>> +#elif BITOP_BITS_PER_WORD == 32
>>>>>>> +#define __AMO(op)   "amo" #op ".w"
>>>>>>> +#else
>>>>>>> +#error "Unexpected BITOP_BITS_PER_WORD"
>>>>>>> +#endif
>>>>>>> +
>>>>>>> +/* Based on linux/arch/include/asm/bitops.h */
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * Non-atomic bit manipulation.
>>>>>>> + *
>>>>>>> + * Implemented using atomics to be interrupt safe. Could
>>>>>>> alternatively
>>>>>>> + * implement with local interrupt masking.
>>>>>>> + */
>>>>>>> +#define __set_bit(n, p)      set_bit(n, p)
>>>>>>> +#define __clear_bit(n, p)    clear_bit(n, p)
>>>>>>> +
>>>>>>> +#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
>>>>>>> +({                                                      \
>>>>>>> +    bitop_uint_t res, mask;                             \
>>>>>>> +    mask = BITOP_MASK(nr);                              \
>>>>>>> +    asm volatile (                                      \
>>>>>>> +        __AMO(op) #ord " %0, %2, %1"                    \
>>>>>>> +        : "=r" (res), "+A" (addr[BITOP_WORD(nr)])       \
>>>>>>> +        : "r" (mod(mask))                               \
>>>>>>> +        : "memory");                                    \
>>>>>>> +    ((res & mask) != 0);                                \
>>>>>>> +})
>>>>>>> +
>>>>>>> +#define op_bit_ord(op, mod, nr, addr, ord)      \
>>>>>>> +    asm volatile (                              \
>>>>>>> +        __AMO(op) #ord " zero, %1, %0"          \
>>>>>>> +        : "+A" (addr[BITOP_WORD(nr)])           \
>>>>>>> +        : "r" (mod(BITOP_MASK(nr)))             \
>>>>>>> +        : "memory");
>>>>>>> +
>>>>>>> +#define test_and_op_bit(op, mod, nr, addr)    \
>>>>>>> +    test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
>>>>>>> +#define op_bit(op, mod, nr, addr) \
>>>>>>> +    op_bit_ord(op, mod, nr, addr, )
>>>>>>> +
>>>>>>> +/* Bitmask modifiers */
>>>>>>> +#define NOP(x)    (x)
>>>>>>> +#define NOT(x)    (~(x))
>>>>>>
>>>>>> Since elsewhere you said we would use Zbb in bitops, I wanted
>>>>>> to
>>>>>> come
>>>>>> back
>>>>>> on that: Up to here all we use is AMO.
>>>>>>
>>>>>> And further down there's no asm() anymore. What were you
>>>>>> referring
>>>>>> to?
>>>>> RISC-V doesn't have a CLZ instruction in the base
>>>>> ISA.  As a consequence, __builtin_ffs() emits a library call to
>>>>> ffs()
>>>>> on GCC,
>>>>
>>>> Oh, so we'd need to implement that libgcc function, along the
>>>> lines
>>>> of
>>>> Arm32 implementing quite a few of them to support shifts on 64-
>>>> bit
>>>> quantities as well as division and modulo.
>>> Why we can't just live with Zbb extension? Zbb extension is
>>> presented
>>> on every platform I have in access with hypervisor extension
>>> support.
>>
>> I'd be fine that way, but then you don't need to break up ANDN into
>> NOT
>> and AND. It is my understanding that Andrew has concerns here, even
>> if
>> - iirc - it was him to originally suggest to build upon that
>> extension
>> being available. If these concerns are solely about being able to
>> build
>> with Zbb-unaware tool chains, then what to do about the build issues
>> there has already been said.
> Not much we can do except probably using .insn, as you suggested for
> the "pause" instruction in cpu_relax(), for every instruction ( at the
> moment it is only ANDB but who knows which instruction will be used in
> the future ) from the Zbb extension.
> 
> But then we will need to do the same for each possible extension we are
> going to use, as there is still a small chance that we might encounter
> an extension-unaware toolchain.
> 
> I am a little bit confused about what we should do.
> 
> In my opinion, the best approach at the moment is to use .insn for the
> ANDN and PAUSE instructions

This would be my preference, but please also consult with Andrew.

> and add an explanation to
> docs/misc/riscv/booting.txt or create a separate document where such
> issues are documented (I am not sure that README is the correct place
> for this).
> 
> I am also okay to go with ANDN break up int NOT and AND, but it is
> needed to come up  with concept which instruction/extenstion should be
> used and how consistently to deal with such situations.
> 
> Furthermore, I don't think these changes should block the merging (
> doesn't matter in 4.19 or in 4.20 Xen release ) of PATCHes v13 01-07 of
> this patch series.

This can be looked at different ways. The splitting into NOT+AND was a
rather late change.

Jan

