Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10DCB0764
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181913.1504887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzyB-0005Xb-KA; Tue, 09 Dec 2025 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181913.1504887; Tue, 09 Dec 2025 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzyB-0005VC-Gp; Tue, 09 Dec 2025 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1181913;
 Tue, 09 Dec 2025 15:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSzyA-0005V1-EJ
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:49:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac78e770-d516-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:49:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so45804775e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 07:49:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d6fa121sm43692625e9.5.2025.12.09.07.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 07:49:39 -0800 (PST)
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
X-Inumbo-ID: ac78e770-d516-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765295380; x=1765900180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1k1tCwDEKeusbWJ/Qraje1/PRVirkxyeUgNtyTxxKEg=;
        b=aUhrUC+PTkQguV80zTTO1YPkoHrpYtN0OD3og77gjSuAKf73wKrUr8PJ+0kF8fVyj5
         DY8uzdfU26GjXfLQjbxgctSTDUzLH7gbItYY4qCUIkIn+YEhqQURg9lX1hv4wL2p46WA
         7dMNg4S/GvWaFPFmnjUFIJDCkOqQLE/YH8ZBt1/UwbxYejmnsxWGxrwNL7xFyQbhWvf7
         QHkWDA5OE/KXvZbTW3cqpVseRg10zmAFUyyk0euWQUM+GGlc1OiEx2OBGVnXOn92bdkB
         3fwWVfVkTgxI6LZngXC6se6vfBVJjrF+naL11bj3h7GjtCprzII3phf3DiPTFURuiXWM
         pZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295380; x=1765900180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k1tCwDEKeusbWJ/Qraje1/PRVirkxyeUgNtyTxxKEg=;
        b=Cs92YNaB1OZOr+Dfs1UzDf/Vl2Zz0TPQilqRclJmTQfgHgoOhpRHATHrFs+Kn9TeaI
         4Y67Cs8A+kDbxKb6taGNy58cuFu68Wco9d1tFl/mFbEZ3Rx/miNh7I5lcIIqnApgYYTM
         +J1c33X5c3jV23/GCGxajXl9iUHtwILvCZK8FueO3vOmMxl+UUUNlB/5SFnewFBWDpz3
         D/qMRGB+YQzNAI+64x30q8EdGOHuwzW7qN/Z6WAtgsQsvO1oFFZhROF9J0twGAsXlaz0
         T2pAOn7tyAwXyOw2hAmgwsAIGz3TMQCzL4xj6UCJ5cCm0G1x8f/BZJLdo6ZVm73Y4CsN
         n4/A==
X-Forwarded-Encrypted: i=1; AJvYcCU6BmvbTKD1RB/IVC0yibSOEcTvHn1N4T1ytsaArjNXZYG30vAXl9KUNJymhldT4UINoldsMrPUyzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWAK+l6Q7hWt2i0GKk60rT6wC5kP+rBydCnstN0NPn1NkuJR/g
	WDOwQC92YZdogpVkbGllSeRCBar8sbs/3R/gjJ2gt8y3rRLIwB0s7PeCJPM28SMOsQ==
X-Gm-Gg: ASbGncuxcAvlEUol1sce8BEDV/pkNCt2rgUs0frNV5Z98zB444yN/VTsNru3+xV8AJ7
	HhyM6b90ZLd7P6wUywffOTar1M/F7cw18DTTiTJ9rDlT9FRIw+0fHkz+3s2SAQaJQ5IdDP0CFQV
	5hh6nYAHbrK11yuMrZ2zc5U1jGIiy6M4JadMneYuZpiKKKletNWsefej10tozhv/q7/uxS0o6eK
	/+bcpHQIHw2jOUK9Rh62dxM50wmmqwzF5zU4pKfzd5DLXzRS6zT8vHWo21nZcDCdcQIfEpnImG3
	xZh8bpLqn2R64H8FI6cBFLJCNJv3p/uwa+YHzpOkMFZuMVRr7+eZhX8iLpBScfnszcTejsVU266
	nXdp3tAytrGfAWOuRb66V/TJGXrB2tHJOQ84cFFyc0mDjznKGtJNRcioKIDq0111CwdGk1Oz7LR
	IQBjrbFERg5ZrchY8x2Rfno1jx/UCwVlVEMGPDhSkImHN+o6xzHR5lx1YLMHvMYx9hyVJg5EaAL
	NU=
X-Google-Smtp-Source: AGHT+IHonfI2r/x96fzKS0/fDxyxbpfdIe2xhzJatbCEVZKiRAvsuJc3kLkXoSnnbVjIBPD5csHspQ==
X-Received: by 2002:a05:600c:2313:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47a179c27e9mr77672645e9.20.1765295380286;
        Tue, 09 Dec 2025 07:49:40 -0800 (PST)
Message-ID: <5fd516ed-c6db-4e7f-beea-a87c89faa6c0@suse.com>
Date: Tue, 9 Dec 2025 16:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/19] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <48a58cde3de6a459885465c6d29d00d046ae4a37.1763986955.git.oleksii.kurochko@gmail.com>
 <69dce344-4dee-4778-99c2-0621c4e17cfc@suse.com>
 <86a87823-8b15-4897-9a97-ade444e2830d@gmail.com>
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
In-Reply-To: <86a87823-8b15-4897-9a97-ade444e2830d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 16:41, Oleksii Kurochko wrote:
> On 12/9/25 12:38 PM, Jan Beulich wrote:
>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
>>>   
>>>       return rc;
>>>   }
>>> +
>>> +/*
>>> + * p2m_get_entry() should always return the correct order value, even if an
>>> + * entry is not present (i.e. the GFN is outside the range):
>>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>>> + *
>>> + * This ensures that callers of p2m_get_entry() can determine what range of
>>> + * address space would be altered by a corresponding p2m_set_entry().
>>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>>> + *
>>> + * Therefore, this function returns true for GFNs outside range (1), and in
>>> + * that case the corresponding level is returned via the level_out argument.
>>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>>> + * find the proper entry.
>>> + */
>>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>>> +                                   gfn_t boundary, bool is_lower,
>>> +                                   unsigned int *level_out)
>>> +{
>>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>>> +    bool ret = false;
>>> +
>>> +    ASSERT(p2m);
>>> +
>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>> +    {
>>> +        unsigned long mask = 0;
>>> +
>>> +        for ( ; level; level-- )
>>> +        {
>>> +            unsigned long masked_gfn;
>>> +
>>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>> +            masked_gfn = gfn_x(gfn) & mask;
>>> +            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
>> I fear I still don't fully understand this. I would have expected the same mask to
>> be used for setting / clearing bits (once inverted, obviously). Why would you clear
>> only some of the lower bits in one case but set all of them in the other?
> 
> Only when is_lower == true do we need to set the lower bits; in all other cases
> this is not required, if i am not confusing something.

That wasn't my point though. I don't follow the !is_lower case: Why would you
clear only the bits for the given level, not all further down as well? Or am
I reading P2M_LEVEL_MASK() incorrectly?

> The idea is that if boundary = 0x1000 and gfn = 0x800, and is_lower == true,
> then to return the correct level value we must set all lower bits of gfn to 1.
> Otherwise, we would get level = root instead of level = 0 in this case.
> 
> I decided not to reuse mask to set the lower bits when is_lower == true, because
> doing something like:
> 
>      mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>      masked_gfn = gfn_x(gfn) & mask;
>      masked_gfn |= (is_lower * ~mask);
> 
> would allow ~mask to introduce 1s into the upper bits, which is not what we want.

If you set "mask" such that it has suitably many of its low bits set then you
should be able to simply do

      if ( is_lower )
          masked_gfn = gfn_x(gfn) | mask;
      else
          masked_gfn = gfn_x(gfn) & ~mask;

>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>> +                           p2m_type_t *t,
>>> +                           unsigned int *page_order)
>>> +{
>>> +    unsigned int level = 0;
>>> +    pte_t entry, *table;
>>> +    int rc;
>>> +    mfn_t mfn = INVALID_MFN;
>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>> +
>>> +    ASSERT(p2m_is_locked(p2m));
>>> +
>>> +    if ( t )
>>> +        *t = p2m_invalid;
>> The sole caller passes non-NULL right now. Are you having patches pending
>> where NULL would be passed? Else, this being a static helper, I'd suggest
>> to drop the check here (and the other one further down).
> 
> I don’t have any such call in pending patches. I saw that Arm has a case
> where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
> so I decided to keep the check.
> 
> What you wrote makes sense to me, and given that the mem_access code is
> Arm-specific, RISC-V will probably never have the same situation.
> However, it still seems reasonable to keep this check for flexibility,
> so that we don’t risk a NULL-pointer dereference in the future or end up
> needing to reintroduce the check (or providing an unused variable for a type)
> later. Does that make sense?

To a degree. The other perspective is that the check is dead code right now,
and dead code is often disliked (e.g. by Misra). Introducing the check when
it becomes necessary is pretty simple.

Jan

