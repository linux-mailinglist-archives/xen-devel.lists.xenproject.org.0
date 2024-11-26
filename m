Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED09D987F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 14:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843723.1259335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvZl-0007Sf-Dk; Tue, 26 Nov 2024 13:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843723.1259335; Tue, 26 Nov 2024 13:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvZl-0007QP-B5; Tue, 26 Nov 2024 13:25:57 +0000
Received: by outflank-mailman (input) for mailman id 843723;
 Tue, 26 Nov 2024 13:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFvZj-0007QJ-SE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 13:25:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50782bf-abf9-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 14:25:51 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cfa9979cd1so9491667a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 05:25:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3b0b1fsm5078579a12.32.2024.11.26.05.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 05:25:50 -0800 (PST)
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
X-Inumbo-ID: f50782bf-abf9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY1MDc4MmJmLWFiZjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjI3NTUxLjk2MTY0Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732627551; x=1733232351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o8kYuxFNQRDbiz+DaCgINnkyhg1GQ5TJaB7QWhGD2bQ=;
        b=NS4hDZkTyyqPUPFbggdSfspyJd2BzZlHXNLu1cwirdkzJMDZseezlrtAqg+aNnWzrW
         68yAApXHCwD93Ku6oWy+uzUqH8G6VDQ6zPKJLaDTMrCF7E0bLCZ7mg6wnELMR0/eG56S
         y7cdgsQvXNevVeaDqGlTibr0KokJXzaZu4n0oro81u8OVkq9RfwLwKAO3tqzjOvWf3Ra
         d6mXhXDuMuY3yAVZm0982f67PCvFkDgPmfrJIDTHnIIUHmdx39iLXtFMmnUWvE0vQ4NE
         MP0xR8b/tMJcOyrHji42n9AD8XFvyUgF064ex0OM5IqpINudri/OX1sG7SCI6HGIAKjI
         bgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732627551; x=1733232351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8kYuxFNQRDbiz+DaCgINnkyhg1GQ5TJaB7QWhGD2bQ=;
        b=PPwypvZYOJzfbbxUVkI15FLBSOnUVF2Iaj8akVcX2kImxf0hGNB6mppJ5Cdf4rb7Kw
         OEUdim9TM6fkkuzJZfwSyYWL/rus8mWV8fn6G3NgCvHgkSP4yV1J5Qvs8fHPGhbjmZrT
         +9eKrzN9oTNpLpQcANYg0qlgogeF0vt2061FcZF+yRG8cWNMlJuFXjSj4laXavJRx3aG
         4UcdMCjrtgbLGG5zvDtMszO34YCgTwkjMB2UcjGp77wz5wUtkbMJv6UPUNPkkITD8HpW
         hJuu/3yXGMOKYMEAIuqw24P/DLc3PBzjhKztS5CN9vAvKKar9MeQvRWT5drehJuVeNq+
         0FJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxZh/JCbOX90KIC7DwRnnCoODcGahg66Isr8ug0UD1FwjBwq1rmIpDO2Z4Cjux8s7KF06Cotx22VM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6P+IVgOyTiR8WqTJLt7lvG4b1n9UPJ44d15OsrFZT34hh3Jl9
	u4FAZFJiVVT+uWzlHPoE2KhYXtyvTiqtlvlko8bRAY+Ag2PdAXBwfO0wVtvufA==
X-Gm-Gg: ASbGncs6XioSNjsN1DhJGGWec7zyi3BIvcCfXtIiy49Y2jiyIEEaCbMP+EQfe7YvT30
	ywsrB8UePnZxMPdfACJhRi9QM4sA0c9sgD9hkflVZr8zU6ixKKJGqDIGvwHRj9RXPiKB14zDnme
	oySBxdPPQFjNhPFTnhxYZfS6JdqlaJVaWYirOJ1No11h2gkEJ+Zi/1dShsveIbTQdUvOfJ1yOZS
	pnOZco1f2HSBVbwc+2wPhwyF3QG9jwaMfr44CbbkiOI6hzx+HrGGvglEAQXxzGz4qgfJ4hI4WsR
	bFEii9ddamFkm2dHSlJ8qsEHOUzbduLtF9k=
X-Google-Smtp-Source: AGHT+IHhK1G7vMQoUisVqIxXycGTu2Kq7vWdHHvrOososG5qWcOL1a78DEHwJB81pLHC6GicitiQzw==
X-Received: by 2002:a05:6402:2355:b0:5d0:771e:36de with SMTP id 4fb4d7f45d1cf-5d0771e3794mr1414635a12.7.1732627551313;
        Tue, 26 Nov 2024 05:25:51 -0800 (PST)
Message-ID: <fe4d16ad-a0e4-4948-b268-c48071cbf971@suse.com>
Date: Tue, 26 Nov 2024 14:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731672668.git.oleksii.kurochko@gmail.com>
 <1ebb209f191e3e2323840acfe3714a597aa7be6c.1731672668.git.oleksii.kurochko@gmail.com>
 <fb5c12b0-5bc1-4129-a4e9-9716ffd4685c@suse.com>
 <360ce2bf4c418cf8f5c4318435ca3308477a07b6.camel@gmail.com>
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
In-Reply-To: <360ce2bf4c418cf8f5c4318435ca3308477a07b6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 12:57, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-11-25 at 16:49 +0100, Jan Beulich wrote:
>> On 15.11.2024 13:47, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -90,6 +90,7 @@
>>>  #define DIRECTMAP_SLOT_START    200
>>>  #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
>>>  #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) -
>>> SLOTN(DIRECTMAP_SLOT_START))
>>> +#define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START +
>>> DIRECTMAP_SIZE - 1)
>>
>> While it is of course okay to have this value be inclusive (matching
>> FRAMETABLE_VIRT_END), I'd like to point out that
>> - on x86 *_END are exclusive (i.e. there's some risk of confusion),
>> - RISC-V's DIRECTMAP_SIZE appears to assume DIRECTMAP_SLOT_END is
>>   exclusive, when from all I can tell (in particular the table in the
>>   earlier comment) it's inclusive.
> Agree, overlooked that DIRECTMAP_SIZE is exclusive,  the value should
> correspond to the table thereby DIRECTMAP_SIZE should be inclusive and
> defined as:
> #define DIRECTMAP_SIZE (SLOTN(DIRECTMAP_SLOT_END + 1) -
> SLOTN(DIRECTMAP_SLOT_START))
> 
> and then DIRECTMAP_VIRT_END could be left as it is defined now:
>    #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE
>    - 1)
> 
> Regarding the first one point. Do you think it would be better to
> follow x86 approach and have *_END to be exclusive? Then
> FRAMETABLE_VIRT_END should be updated too?

I think it would be better if all ports agreed in this regard. That agreement
may also mean that x86 needs changing. Arm's mmu/layout.h also specifies
DIRECTMAP_VIRT_END as inclusive, for example (and, because of aliasing, also
HYPERVISOR_VIRT_END).

>>> @@ -25,8 +27,12 @@
>>>  
>>>  static inline void *maddr_to_virt(paddr_t ma)
>>>  {
>>> -    BUG_ON("unimplemented");
>>> -    return NULL;
>>> +    unsigned long va_offset = maddr_to_directmapoff(ma);
>>> +
>>> +    ASSERT(va_offset >= DIRECTMAP_VIRT_START -
>>> directmap_virt_start);
>>> +    ASSERT(va_offset <= DIRECTMAP_VIRT_END -
>>> directmap_virt_start);
>>> +
>>> +    return (void *)(directmap_virt_start + va_offset);
>>>  }
>>
>> If you added in directmap_virt_start right when setting the variable,
>> you'd simplify the assertions. The unsigned long arithmetic is going
>> to
>> be okay either way. (The variable may want renaming if doing so,
>> perhaps
>> simply to "va".)
> 
> Just to be sure that I understand your point correct. Do you mean the
> following:
>     static inline void *maddr_to_virt(paddr_t ma)
>     {
>    -    unsigned long va_offset = maddr_to_directmapoff(ma);
>    +    unsigned long va = maddr_to_directmapoff(ma) +
>    directmap_virt_start;
>     
>    -    ASSERT(va_offset >= DIRECTMAP_VIRT_START -
>    directmap_virt_start);
>    -    ASSERT(va_offset <= DIRECTMAP_VIRT_END - directmap_virt_start);
>    +    ASSERT(va >= DIRECTMAP_VIRT_START);
>    +    ASSERT(va <= DIRECTMAP_VIRT_END);
>     
>    -    return (void *)(directmap_virt_start + va_offset);
>    +    return (void *)va;
>     }

Yes (and at this point you could even fold the two assertions).

Jan

