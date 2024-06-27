Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC491A108
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 09:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749788.1158037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMk2c-0003Fw-2i; Thu, 27 Jun 2024 07:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749788.1158037; Thu, 27 Jun 2024 07:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMk2b-0003Cj-W0; Thu, 27 Jun 2024 07:59:37 +0000
Received: by outflank-mailman (input) for mailman id 749788;
 Thu, 27 Jun 2024 07:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMk2a-0003CJ-4U
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 07:59:36 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31a829d6-345b-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 09:59:35 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so85922581fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 00:59:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac9c6141sm7194195ad.306.2024.06.27.00.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 00:59:34 -0700 (PDT)
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
X-Inumbo-ID: 31a829d6-345b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719475175; x=1720079975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8vIo1QuIyyZtc4lMpkM2bWEpnBjFiSmZakRUank75F0=;
        b=L2n5wnoBHyXVTaNlWfW15GCiExnCSaYRh3NOpSlxINAGshGmBJLtUs5uDogEWjf1Ro
         c9XvzVZ0+sXsTs4M20maxKtC8sNOB5EsUKR9rxLLxtZVGESOe1prGIp8j3gIYIXdmwMJ
         Hic8pssQ1qFWukbUP1zH3/l42HlPWj3v4pZWQ+3N5rT8+huqvji3mOx6srzVke/Wfcm6
         iwCa1/RepG8XTw5s0j4kPZiA6sJNShmzDMQDEO4N/FpCVg8gNSCjgR+gA2KInF0dnFuo
         r3BGpIyAKb3nM2ZGbx9u0b/lGM7y6rNY9wRqnik6OWsoUKqtSdsAo/ptYGM2p4xqFCrx
         nERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475175; x=1720079975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vIo1QuIyyZtc4lMpkM2bWEpnBjFiSmZakRUank75F0=;
        b=bdsy0A5sgw+G0so/jgS0Es73GVtXJor2YQ0MOU9OsKY/q5EmSyw0gueW0JzjyoWH8k
         xsuGJK+YPkrzeQYdmUrfO/ubi+XUaJ+LoDQO3Ww1EHJyROjtI4f6/tnujKv3wBWW1wM7
         g7t3BjT4wi6bWXAGJsihXTe5Lwy/LV3ifT6AII7ALDYUg95n83meWNV9zfjwOac3hrpF
         0F4j4XuDPXMSMGmAYY6IyTVNLGCZSe70KsoSjuXGubb+FIjRU6yr11m8EQrfvaGYoe09
         8zciFnzIC7O5bpJ9Y+hTKLfNLq/Y3c4z3d0CeK6AMyL1X+5E0PCVgiS6HGhmAbBUDbrQ
         cm8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5HTwlAC4iXr03xFEE4gNDiY0JiZFv3BOh8yyjolXq3aMlzYQi34o1LDFom6Nc3NPj6i9bt/PbxETnKo0Hj6zkARwTQNb1qIjFO8lGy9Q=
X-Gm-Message-State: AOJu0Yxpri+wSdap4xucWGdRlRh4RK6SP1PlXMW3NHDRL2+5H5au5kM0
	xxxNzCe9uLVqfoVBMV3x198oQhse06v0QMc7CoeBqf/rMCC+LomeT+aV0yVE/A==
X-Google-Smtp-Source: AGHT+IH0kNNTY1OvtCYzPUFGVMj7oiDvu2sE2zScju4oAuMm1L+epDJa7KWbg+NrLLeyu4gqQEEPDw==
X-Received: by 2002:a2e:9c88:0:b0:2ec:5364:c790 with SMTP id 38308e7fff4ca-2ec5931d8cemr106390271fa.22.1719475174625;
        Thu, 27 Jun 2024 00:59:34 -0700 (PDT)
Message-ID: <e2d82c37-da44-4a8f-a1f8-76d5ff05b104@suse.com>
Date: Thu, 27 Jun 2024 09:59:25 +0200
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
In-Reply-To: <4c15dd072f08b1161d170608a096dc0851ced588.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2024 19:27, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-06-26 at 10:31 +0200, Jan Beulich wrote:
>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>> @@ -0,0 +1,137 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/* Copyright (C) 2012 Regents of the University of California */
>>> +
>>> +#ifndef _ASM_RISCV_BITOPS_H
>>> +#define _ASM_RISCV_BITOPS_H
>>> +
>>> +#include <asm/system.h>
>>> +
>>> +#if BITOP_BITS_PER_WORD == 64
>>> +#define __AMO(op)   "amo" #op ".d"
>>> +#elif BITOP_BITS_PER_WORD == 32
>>> +#define __AMO(op)   "amo" #op ".w"
>>> +#else
>>> +#error "Unexpected BITOP_BITS_PER_WORD"
>>> +#endif
>>> +
>>> +/* Based on linux/arch/include/asm/bitops.h */
>>> +
>>> +/*
>>> + * Non-atomic bit manipulation.
>>> + *
>>> + * Implemented using atomics to be interrupt safe. Could
>>> alternatively
>>> + * implement with local interrupt masking.
>>> + */
>>> +#define __set_bit(n, p)      set_bit(n, p)
>>> +#define __clear_bit(n, p)    clear_bit(n, p)
>>> +
>>> +#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
>>> +({                                                      \
>>> +    bitop_uint_t res, mask;                             \
>>> +    mask = BITOP_MASK(nr);                              \
>>> +    asm volatile (                                      \
>>> +        __AMO(op) #ord " %0, %2, %1"                    \
>>> +        : "=r" (res), "+A" (addr[BITOP_WORD(nr)])       \
>>> +        : "r" (mod(mask))                               \
>>> +        : "memory");                                    \
>>> +    ((res & mask) != 0);                                \
>>> +})
>>> +
>>> +#define op_bit_ord(op, mod, nr, addr, ord)      \
>>> +    asm volatile (                              \
>>> +        __AMO(op) #ord " zero, %1, %0"          \
>>> +        : "+A" (addr[BITOP_WORD(nr)])           \
>>> +        : "r" (mod(BITOP_MASK(nr)))             \
>>> +        : "memory");
>>> +
>>> +#define test_and_op_bit(op, mod, nr, addr)    \
>>> +    test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
>>> +#define op_bit(op, mod, nr, addr) \
>>> +    op_bit_ord(op, mod, nr, addr, )
>>> +
>>> +/* Bitmask modifiers */
>>> +#define NOP(x)    (x)
>>> +#define NOT(x)    (~(x))
>>
>> Since elsewhere you said we would use Zbb in bitops, I wanted to come
>> back
>> on that: Up to here all we use is AMO.
>>
>> And further down there's no asm() anymore. What were you referring
>> to?
> RISC-V doesn't have a CLZ instruction in the base
> ISA.  As a consequence, __builtin_ffs() emits a library call to ffs()
> on GCC,

Oh, so we'd need to implement that libgcc function, along the lines of
Arm32 implementing quite a few of them to support shifts on 64-bit
quantities as well as division and modulo.

Jan

> or a de Bruijn sequence on Clang.
> 
> The optional Zbb extension adds a CLZ instruction, after which
> __builtin_ffs() emits a very simple sequence.
> 
> ~ Oleksii


