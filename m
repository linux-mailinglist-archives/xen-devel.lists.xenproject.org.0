Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9282D7FA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667294.1038413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKiS-00019o-F4; Mon, 15 Jan 2024 11:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667294.1038413; Mon, 15 Jan 2024 11:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKiS-000170-Bp; Mon, 15 Jan 2024 11:01:16 +0000
Received: by outflank-mailman (input) for mailman id 667294;
 Mon, 15 Jan 2024 11:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPKiQ-00016u-91
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:01:14 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c2da33-b395-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 12:01:11 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so103259711fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 03:01:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z15-20020a6bc90f000000b007bf05f618f3sm2414781iof.55.2024.01.15.03.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 03:01:10 -0800 (PST)
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
X-Inumbo-ID: 64c2da33-b395-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705316471; x=1705921271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuAsbI4N3KCf8fOkgguZHZdTspuwvGCauC8OkwkHco4=;
        b=GIelxCSgSmmtZK+vk2ws6CtXdgBiLhWInFu0EjE14b4o71wedRR86DHZpYYKlGtPUe
         AczLjI0EKnsrCUEa2LgdZXrFu83GHkMRgzqbm5QQ3qEsQENcUAINT0GApz6seLEP83OG
         t9aogXtRrbe1GnGh6I8ME6UNZY1Vm4/39wgk+kGANcA04cG0/TqjQx3X80glFQvUPYqz
         SOKi96S3dMixyZ3ozUAeoRnHlP8LNBCIp0/wZ18YPVR/QNwXYUEL5AusfJs8WPukd7cl
         D7ZieXN6dQVb+gSdX6p5e9nWCWCYBZARt8O3PzoSbvA1v4Yb+iBJMWQTBAHHCmzaz5Eb
         I98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705316471; x=1705921271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuAsbI4N3KCf8fOkgguZHZdTspuwvGCauC8OkwkHco4=;
        b=pkmoFnXTMNuZRMecoVC1QfP92I85S4FOGR/k9yYcrKdttlJRGB7cZwbeh9+twAthkv
         7CpwasIyeWE0TyqwN5UiA7I4tYyfv3m17S9MPwhCqIQ+9PwnSA/7nxBIJA4scQ5oE4qk
         Ixoa9JqsR5tkKLl2UUBAjjRXma4ytDPnTO540uFRaUAWp/+uK65rIT0H7SLR4R5RAwqS
         wExQn5+WQrqyMzd/dtoFNiATsp8BfChAW2x7vxD48rA2DqirTVaaYpMjoE/dSvPUOFVS
         mVQFvZF3amTHE2dZ5bBbcHW04fLDfmyyuzL4frx4Imak0bhdDm6LnnqJv7CxXnODRKum
         7Vyg==
X-Gm-Message-State: AOJu0Yz5tIyFV2K4u+gQHTv1j61HqQT996x56Y8bTMRPiVQTkB5Z1ntY
	CZngB/Zfy8wt4/PFoBGp5B7qveurk1w1
X-Google-Smtp-Source: AGHT+IGNqy1aJbZFFzXiNoqAuNAqdIqFFehe5qiQF01GtBb1MYv1/QXZtSdJRxWIrU7cFvABYwyxMg==
X-Received: by 2002:a2e:a23b:0:b0:2cc:f135:8d60 with SMTP id i27-20020a2ea23b000000b002ccf1358d60mr2159211ljm.91.1705316471280;
        Mon, 15 Jan 2024 03:01:11 -0800 (PST)
Message-ID: <c1abf4ca-d69a-4a17-b23c-18f06b8fddda@suse.com>
Date: Mon, 15 Jan 2024 12:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
 <abef4701c3f2292e672679f1a18c826d699e1af2.camel@gmail.com>
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
In-Reply-To: <abef4701c3f2292e672679f1a18c826d699e1af2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2024 11:35, Oleksii wrote:
> Hi Julien,
> 
> On Fri, 2024-01-12 at 10:39 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 22/12/2023 15:13, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V3:
>>>   - add SPDX
>>>   - drop unneeded for now p2m types.
>>>   - return false in all functions implemented with BUG() inside.
>>>   - update the commit message
>>> ---
>>> Changes in V2:
>>>   - Nothing changed. Only rebase.
>>> ---
>>>   xen/arch/ppc/include/asm/p2m.h   |   3 +-
>>>   xen/arch/riscv/include/asm/p2m.h | 102
>>> +++++++++++++++++++++++++++++++
>>>   2 files changed, 103 insertions(+), 2 deletions(-)
>>>   create mode 100644 xen/arch/riscv/include/asm/p2m.h
>>>
>>> diff --git a/xen/arch/ppc/include/asm/p2m.h
>>> b/xen/arch/ppc/include/asm/p2m.h
>>> index 25ba054668..3bc05b7c05 100644
>>> --- a/xen/arch/ppc/include/asm/p2m.h
>>> +++ b/xen/arch/ppc/include/asm/p2m.h
>>> @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct
>>> domain *d)
>>>   static inline int guest_physmap_mark_populate_on_demand(struct
>>> domain *d, unsigned long gfn,
>>>                                                           unsigned
>>> int order)
>>>   {
>>> -    BUG_ON("unimplemented");
>>> -    return 1;
>>> +    return -EOPNOTSUPP;
>>>   }
>>>   
>>>   static inline int guest_physmap_add_entry(struct domain *d,
>>> diff --git a/xen/arch/riscv/include/asm/p2m.h
>>> b/xen/arch/riscv/include/asm/p2m.h
>>> new file mode 100644
>>> index 0000000000..d270ef6635
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -0,0 +1,102 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_RISCV_P2M_H__
>>> +#define __ASM_RISCV_P2M_H__
>>> +
>>> +#include <asm/page-bits.h>
>>> +
>>> +#define paddr_bits PADDR_BITS
>>> +
>>> +/*
>>> + * List of possible type for each page in the p2m entry.
>>> + * The number of available bit per page in the pte for this
>>> purpose is 4 bits.
>>> + * So it's possible to only have 16 fields. If we run out of value
>>> in the
>>> + * future, it's possible to use higher value for pseudo-type and
>>> don't store
>>> + * them in the p2m entry.
>>> + */
>>
>> This looks like a verbatim copy from Arm. Did you actually check
>> RISC-V 
>> has 4 bits available in the PTE to store this value?
> Thanks for noticing that, in RISC-V it is available only 2 bits ( bits
> 8 and 9), so I'll update the comment:
> 53                   10 9    8 7 6 5 4 3 2 1 0
>  Physical Page Number     RSV  D A G U X W R V

It's RSW (Reserved for Supervisor softWare use), not RSV, which is pretty
important in this context.

> It seems that I missed something in the Arm code/architecture.As far as I recall, in Arm, bits 5-8 are ignored by the MMU, and they
> are expected
> to be used by the hypervisor for its purpose.
> However, in the code, I notice that these bits are utilized for storing
> a reference counter.

Why "however"? Hardware still is going to ignore these bits.

Jan

