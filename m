Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACD82BEE8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666827.1037725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFNI-0006c5-NQ; Fri, 12 Jan 2024 11:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666827.1037725; Fri, 12 Jan 2024 11:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFNI-0006a8-KX; Fri, 12 Jan 2024 11:06:56 +0000
Received: by outflank-mailman (input) for mailman id 666827;
 Fri, 12 Jan 2024 11:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOFNH-0006WZ-OW
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:06:55 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23a1bdb-b13a-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 12:06:55 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50eabd1c701so7724963e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 03:06:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f12-20020a02cacc000000b0046e61d0c894sm251302jap.161.2024.01.12.03.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 03:06:54 -0800 (PST)
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
X-Inumbo-ID: b23a1bdb-b13a-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705057615; x=1705662415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OjQ+fqyf18UHDjgD2Tw6o+ti9mI3oLbjkww6S/7H7Q=;
        b=eC+1btOfNTAYSC0hH0YQknhWV2YbU6+gdrkAfUP/Ksj7/n5WCBXZnpNz6dwr381NLg
         5/pHfKQrCR2f2IAOGSAa0dpkv3v0qhwbJjTaU1qED4aIpsYK0h7I3gEcPSo7YjTL8uNa
         218L2R/H11Hytk117exqvZLc/6PLOVVB/sdl6ezAepB3KKUsf8TRopGgjOjXsqahRZFw
         zQgu9ylWhyHnGJSdPxfqlE/ZMBRqQr5hU+V3z36R4AgCZq/9/NLyGhiYevdatDL+bOdZ
         aoKzCt44qL+qiQ6q6RY7eosZp2kkGacDfFYFGneX2ZbTCYgPjbsZoumHSjPBFvAPEIeu
         ie1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705057615; x=1705662415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OjQ+fqyf18UHDjgD2Tw6o+ti9mI3oLbjkww6S/7H7Q=;
        b=t/38Q3WFlneh+b7JY619iVIFe50j3xYf6mouYkx4z648X60hT0cyAPOs4pNKo64GRr
         ufgYxnLXn15qPD39VvuC/Tptq5vh5KvJU4InYu/ruKMtBDr4SxScr6He0uriVLA0NGrW
         M/7egGMhbKbwWrSiqQYvOvc9jSNwU8Djcv6vqzqzBZbuPajitX86sH3sfhbRaMllAUrs
         ZdZ+YiDCEIU3jJ7ZQI+v9rdKsfajh6Ta3l/g65KvhkYSS7UlZcTDoIshwZJ/ftqmB/1c
         GZlIigFoT962VdvyJpghsYY9adlNzypQ+DFxaD0vULPu/sk6dyNYrZu5dk5E/BVca+rV
         efsg==
X-Gm-Message-State: AOJu0YwfP8BWMLGq/9hkdjyrMgs0bhrD9wrG3Z6elm4UG9ft+m2Oi2sc
	viDvNkf8cNHXOPYRDcvZMyEwr0SZuWfc
X-Google-Smtp-Source: AGHT+IFOH0hNpGp9R5af2ewsCa3thZ5k3KRU83thmDsLWbyjdMa2xHn9gvuPnlbm9hXgoYIC4+6hoA==
X-Received: by 2002:a19:ca16:0:b0:50e:769b:7163 with SMTP id a22-20020a19ca16000000b0050e769b7163mr454744lfg.138.1705057614815;
        Fri, 12 Jan 2024 03:06:54 -0800 (PST)
Message-ID: <05589cba-6779-4794-9684-470589fe2383@suse.com>
Date: Fri, 12 Jan 2024 12:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
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
In-Reply-To: <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2024 11:39, Julien Grall wrote:
> On 22/12/2023 15:13, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in V3:
>>   - add SPDX
>>   - drop unneeded for now p2m types.
>>   - return false in all functions implemented with BUG() inside.
>>   - update the commit message
>> ---
>> Changes in V2:
>>   - Nothing changed. Only rebase.
>> ---
>>   xen/arch/ppc/include/asm/p2m.h   |   3 +-
>>   xen/arch/riscv/include/asm/p2m.h | 102 +++++++++++++++++++++++++++++++
>>   2 files changed, 103 insertions(+), 2 deletions(-)
>>   create mode 100644 xen/arch/riscv/include/asm/p2m.h
>>
>> diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
>> index 25ba054668..3bc05b7c05 100644
>> --- a/xen/arch/ppc/include/asm/p2m.h
>> +++ b/xen/arch/ppc/include/asm/p2m.h
>> @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct domain *d)
>>   static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
>>                                                           unsigned int order)
>>   {
>> -    BUG_ON("unimplemented");
>> -    return 1;
>> +    return -EOPNOTSUPP;
>>   }
>>   
>>   static inline int guest_physmap_add_entry(struct domain *d,
>> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
>> new file mode 100644
>> index 0000000000..d270ef6635
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -0,0 +1,102 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_RISCV_P2M_H__
>> +#define __ASM_RISCV_P2M_H__
>> +
>> +#include <asm/page-bits.h>
>> +
>> +#define paddr_bits PADDR_BITS
>> +
>> +/*
>> + * List of possible type for each page in the p2m entry.
>> + * The number of available bit per page in the pte for this purpose is 4 bits.
>> + * So it's possible to only have 16 fields. If we run out of value in the
>> + * future, it's possible to use higher value for pseudo-type and don't store
>> + * them in the p2m entry.
>> + */
> 
> This looks like a verbatim copy from Arm. Did you actually check RISC-V 
> has 4 bits available in the PTE to store this value?
> 
>> +typedef enum {
>> +    p2m_invalid = 0,    /* Nothing mapped here */
>> +    p2m_ram_rw,         /* Normal read/write guest RAM */
> 
> s/guest/domain/ as this also applies for dom0.
> 
>> +} p2m_type_t;
>> +
>> +#include <xen/p2m-common.h>
>> +
>> +static inline int get_page_and_type(struct page_info *page,
>> +                                    struct domain *domain,
>> +                                    unsigned long type)
>> +{
>> +    BUG();
> 
> I understand your goal with the BUG() but I find it risky. This is not a 
> problem right now, it is more when we will decide to have RISC-V 
> supported. You will have to go through all the BUG() to figure out which 
> one are warrant or not.
> 
> To reduce the load, I would recommend to switch to ASSERT_UNREACHABLE() 
> (or maybe introduced a different macro) that would lead to a crash on 
> debug build but propagate the error normally on production build.

Elsewhere BUG_ON("unimplemented") is used to indicate such cases.
Can't this be used here (and then uniformly elsewhere) as well?

Jan

