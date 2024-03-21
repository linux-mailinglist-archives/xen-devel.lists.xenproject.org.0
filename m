Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F11885772
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696308.1087136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFf0-0007ze-EX; Thu, 21 Mar 2024 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696308.1087136; Thu, 21 Mar 2024 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFf0-0007y4-Br; Thu, 21 Mar 2024 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 696308;
 Thu, 21 Mar 2024 10:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnFey-0007v6-CS
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:28:32 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c357be32-e76d-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 11:28:31 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-568a19fcc4eso434006a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 03:28:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v17-20020a056402175100b005651ae4ac91sm7877339edx.41.2024.03.21.03.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 03:28:30 -0700 (PDT)
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
X-Inumbo-ID: c357be32-e76d-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711016910; x=1711621710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4/qTjYH1DcwTd8nnRm9/64Pym/nMZHZd2o2KLS/ULM=;
        b=KT++fGrhVVmyaZdDthcgZHRPnxm2Mv0u2Wa9nSB00BJOe7NkuB4bx9o81oGvnfLYOb
         cRM8PMpMd2fI8fRIdrPtC1qFrP+nwrI8V0dboP5DLwG92CrCCG4OhvDIJfZA/5uRtfD2
         rjja/bmuZ0WKmRTH2vBKKc/HcrvwIpQ2XqTUtW09h0uS8dH72rjQTFwZL+YNbQMqL/hF
         OQjyY3hustY+rbPL4DPt5A+C9/2je5ZZbheWDZ6cuMr7zaVapufqSqVb6Rrw4R0yWx5U
         0ZoqYrCHU0p4HygxMUkbX3tSRsDYDolk4rFkPc1//Lj3vn82wPxEui9bSjJYbDLdXdAU
         SXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016910; x=1711621710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4/qTjYH1DcwTd8nnRm9/64Pym/nMZHZd2o2KLS/ULM=;
        b=KaJV8fETT7P7p1yisoi7e5Oz/ii6kVSy4NAWDOjZEg8W+j6waOqt8aNqmg97UfOpQi
         s29hwqz8ZG07CIkIAbecdptVrA4B40Qlzna+m8N/1BsLKhB14kVxn2B/qVc+X6QTB3OD
         yF2hwmUL0UII8kKabWa2SS8NKidDDcgVpe72OFcv55ce5JQaM6RZm4AbwfpyCgDj8NQM
         a2yGTbqyIagpjKM/YVdTIE+57xyjfUrAsZV4GqxeSVjevuGp/RCGRmzTL5gKzG5k/yIK
         9UYTizWVkPOL0GvdewzAhAFqYxdQtj06LWlFHR1jYUTQS3+X8CkyarlCevsJaeVxGTdU
         VCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWADzJPGqR094X1KBdsGka6uyv5h+u4iRn6Ti1Z2gpOST1UvFlo7vBuXd/cTYYP2CdiJ/1qn7JIOLPdZtUrrHkjZZ3HUXMH8HMjwJizJw=
X-Gm-Message-State: AOJu0YxF0Nkd+41mzkK5VN8vPnBc99jfIm7HcZHUgQWI0Wsie2zSUF3z
	reh5iPCs3hePNpWr6QjyYLe39VnZhr/QD/BQ+Tk3PMBwQrF4WERwhGjWspafVg==
X-Google-Smtp-Source: AGHT+IE7XIzxMCsswS2aaOtbzCWPCCLvruC4rCngVjiIw6Zethxd4ob9oUolE4PZ8GGnkPtuqqBekg==
X-Received: by 2002:a50:d75d:0:b0:568:d7fe:a768 with SMTP id i29-20020a50d75d000000b00568d7fea768mr1507405edj.25.1711016910561;
        Thu, 21 Mar 2024 03:28:30 -0700 (PDT)
Message-ID: <3fe788d3-3c49-4298-bd81-66fbb805bf91@suse.com>
Date: Thu, 21 Mar 2024 11:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/20] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <14c91e2ba2aeb6e49f9f7e549232244719fa6959.1710517542.git.oleksii.kurochko@gmail.com>
 <9724aa80-106d-45ea-bad0-f0f2b83632eb@suse.com>
 <6f9811f714d9f207409260851f2fef1f62f9cba8.camel@gmail.com>
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
In-Reply-To: <6f9811f714d9f207409260851f2fef1f62f9cba8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 11:07, Oleksii wrote:
> On Wed, 2024-03-20 at 17:03 +0100, Jan Beulich wrote:
>> On 15.03.2024 19:06, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>> @@ -0,0 +1,144 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/* Copyright (C) 2012 Regents of the University of California */
>>> +
>>> +#ifndef _ASM_RISCV_BITOPS_H
>>> +#define _ASM_RISCV_BITOPS_H
>>> +
>>> +#include <asm/system.h>
>>> +
>>> +#define BITOP_BITS_PER_WORD BITS_PER_LONG
>>> +
>>> +#define BITOP_TYPE
>>> +typedef uint64_t bitops_uint_t;
>>> +
>>> +#include <asm-generic/bitops/bitops-bits.h>
>>> +
>>> +#define __set_bit(n, p)      set_bit(n, p)
>>> +#define __clear_bit(n, p)    clear_bit(n, p)
>>
>> If these cam with a TODO, I wouldn't say anything. But without I take
>> it
>> they're meant to remain that way, at which point I'd like to ask
>> about
>> the performance aspect: Surely the AMO insns are more expensive than
>> whatever more basic insns could be used instead? I'd even go as far
>> as
>> wondering whether
>>
>> #define __set_bit(n, p)      ((void)__test_and_set_bit(n, p))
>> #define __clear_bit(n, p)    ((void)__test_and_clear_bit(n, p))
>>
>> wouldn't be cheaper (the compiler would recognize the unused result
>> and eliminate its calculation, I'm pretty sure).
> It was implemented using atomic ops because of Arm:
> /*
>  * Non-atomic bit manipulation.
>  *
>  * Implemented using atomics to be interrupt safe. Could alternatively
>  * implement with local interrupt masking.
>  */
> #define __set_bit(n,p)            set_bit(n,p)
> #define __clear_bit(n,p)          clear_bit(n,p)
> 
> I though that the same comment is true for x86, but after your comment
> I checked x86 implementation, I realized that x86 uses non-atomic
> operations.
> 
> In this case, it seems to me there is a sense to use non-atomic for
> RISC-V too.

Hmm, wait: There's an important difference between x86 on one side and
Arm/RISC-V/PPC and various other more or less RISC-like ones on the other.
x86 has read-modify-write (memory) insns. Therefore even without using
their atomic (LOCKed) forms, they do the update atomically as far as the
local CPU is concerned. That's not the case when you need to use a three
(or more) step load-op-store sequence.

Had you retained Arm's comment, I probably wouldn't even have asked.
Please add such a comment while sticking to this aliasing you have.

Jan

