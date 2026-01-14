Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64AD1DB98
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202822.1518263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxYt-00006T-Lr; Wed, 14 Jan 2026 09:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202822.1518263; Wed, 14 Jan 2026 09:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxYt-0008WJ-II; Wed, 14 Jan 2026 09:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1202822;
 Wed, 14 Jan 2026 09:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfxYr-0008VT-BD
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:53:09 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d37c3c2c-f12e-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:53:06 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so46747965e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:53:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee544387fsm19498685e9.0.2026.01.14.01.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:53:06 -0800 (PST)
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
X-Inumbo-ID: d37c3c2c-f12e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768384386; x=1768989186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bhY8qbSgd8DG8MqPWifeFMg6ub2ZmYQ2IL9+5P7hsO0=;
        b=RF1uCHh/ZqA0FTtBE5FL1Hr7mAeM1MuWA8tScoAcrfgvna3M34cIfgLp+hBsUkFKaU
         DZaWNPwz0hpDzi5NtuFkvmMI6l6HudSaAU4SGzoe+yE8GNNUzERxcZGObGbSz9Bc0M6/
         GQ5mTQG65lKrvOn3GkZrkHswqdIJFHB0oja06A1ZmnrkQQm/dG54QPTYilLABdHijAh6
         8hQlpg0dxU3CQQyrUVThT3JTb7iu8tCHZXlIbjq/U4oqwlXdx5uuJ7lW0uHQwGW70Ft1
         aM4co5nSJDqn8ncqzzQSOWGG0Sb6JwrPtgo83oqO7q8z32b82idRSdGczyQPE5K2qIiG
         rRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384386; x=1768989186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhY8qbSgd8DG8MqPWifeFMg6ub2ZmYQ2IL9+5P7hsO0=;
        b=qE+0DUsw5jz/w0gWqTk5+XffeZb8/Tkob6g87Y3Z1D68KGEJMRDkfxCEDudMMonT5f
         Pkaxf13IimaSOcBjIxNFzj5wB1uwREkWgj5X+Jj51bAhPAaltz5fgS8MqRUMjp+sUPjg
         u0Y0VuxoqNfcFx8a997POwpvGCci3eMgHczltDlJCopgC+WTfEMjGcn2qFc3d+0Kw1Tz
         aI9G9C2KuSPl1JN8D6gHlI0TbDLWynG9AO8+2llXvlBhAuw7OVEZnx9exKV/EkUXuwhy
         GIKlGq1+4G7TM8bAEVUxuQ5m2R+Pq5Pww+8fn3FswAq8eKxvNtCR6hzy9FVNm0bx7Ohp
         BMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK5K9O56mXGfIm6eQ27JgSedSLRzLe1MBPHbtv29vNkP7o6ljGqoDlmwdrIzhvrfsZz1RX35ED/4s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlOOOX6gxgFVjA5dGhbu3w4uyJw/BcbG0yZfFNubdUO3rvgBXa
	cIuM4kgj19+Vw98i8KrXJ1D2J8CQIKj6M8fC6D2+C8+DHXPUYcRlujShdLIHPv6+tA==
X-Gm-Gg: AY/fxX47LivFgh+rRcQ2Mms/F7HnclH4sgyeWdXt7Udt5ixhe5v/pIlEoKekE8Cv8ky
	l+vtduDkSQN2w3boZUvO2xn68Wm8cEOEObddaySg3j4DKbeK5A8aN3WCbxW7TaV+MyeFmQiOWZM
	UHnerp8YQSaL93WWDlJeSyZKKJrEe5ZA4gV+Lx/MVaELNE2G77KAMMH3IxwVqTeBOaMGh/MvJSI
	LlAOWNl2Ib/8hvG+mutgjklsrJo84RmvfqFc+VJyZPslcw74LqYY9pMtW3/BSjOYfswcLxzKtWC
	catvWlb/2JJ5V0u4KAKe4xvsjfuGXFW+9+iM0fSks6zgHKaL4B7KHX6FW/R0qyQbGEbT2P9EPw/
	5PRrIDluTRz8bumPZGlnY2C2xUxt2yJeAKTZ9fGqiYw+yexNWe7dWHzhvN0U7NKL1r3CWXGOHHm
	rM5FCz+/tUDUq0pPOzyJ/iO5qhdLrOezBK4miRkqXa3DqOaqJSf+p9peFO/cyje/9yBAG/eMDkv
	xU=
X-Received: by 2002:a05:600c:3e8d:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-47ee33a1907mr21822815e9.29.1768384386303;
        Wed, 14 Jan 2026 01:53:06 -0800 (PST)
Message-ID: <c6b2f360-5ec5-4299-9eb0-de88bf9f9ad9@suse.com>
Date: Wed, 14 Jan 2026 10:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
 <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
 <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
 <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
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
In-Reply-To: <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 10:41, Oleksii Kurochko wrote:
> 
> On 1/14/26 10:13 AM, Jan Beulich wrote:
>> On 13.01.2026 17:50, Oleksii Kurochko wrote:
>>> On 1/12/26 4:24 PM, Jan Beulich wrote:
>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>> @@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
>>>>>        cpu_khz = rate / 1000;
>>>>>    }
>>>>>    
>>>>> +int reprogram_timer(s_time_t timeout)
>>>>> +{
>>>>> +    uint64_t deadline, now;
>>>>> +    int rc;
>>>>> +
>>>>> +    if ( timeout == 0 )
>>>>> +    {
>>>>> +        /* Disable timers */
>>>>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>> +
>>>>> +        return 1;
>>>>> +    }
>>>>> +
>>>>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>>>>> +    now = get_cycles();
>>>>> +    if ( deadline <= now )
>>>>> +        return 0;
>>>>> +
>>>>> +    /* Enable timer */
>>>>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>> Still learning RISC-V, so question for my understanding: Even if the timeout
>>>> is short enough to expire before the one SIE bit will be set, the interrupt
>>>> will still occur (effectively immediately)? (Else the bit may need setting
>>>> first.)
>>> The interrupt will become pending first (when mtime >= mtimecmp or
>>> mtime >= CSR_STIMECMP in case of SSTC) and then fire immediately once
>>> |SIE.STIE |(and global|SIE|) are enabled.
>>>
>>>>> +    if ( (rc = sbi_set_timer(deadline)) )
>>>>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>>> Hmm, if this function ends up being used from any guest accessible path (e.g.
>>>> a hypercall), such panic()-ing better shouldn't be there.
>>> I don't have such use cases now and I don't expect that guest should use
>>> this function.
>> How do you envision supporting e.g. VCPUOP_set_singleshot_timer without
>> involving this function?
> 
> Looking at what is in common code for VCPUOP_set_singleshot_timer, it doesn't
> use reprogram_timer(), it is just activate/deactivate timer.

And how would that work without, eventually, using reprogram_timer()? While not
directly on a hypercall path, the use can still be guest-induced.

Jan

