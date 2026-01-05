Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E07CF4E5B
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 18:06:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195687.1513610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vco2P-0002AC-SB; Mon, 05 Jan 2026 17:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195687.1513610; Mon, 05 Jan 2026 17:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vco2P-00027u-PA; Mon, 05 Jan 2026 17:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1195687;
 Mon, 05 Jan 2026 17:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vco2O-00027o-I2
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 17:06:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34e8e68-ea58-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 18:06:34 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477632d9326so912105e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 09:06:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7ee5bc57sm3511595e9.11.2026.01.05.09.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 09:06:33 -0800 (PST)
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
X-Inumbo-ID: e34e8e68-ea58-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767632793; x=1768237593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6w8+OXGrdIqZSTdZ3i5+/35ScU4yn1oGqDHkJQmcbMk=;
        b=PqrHVKYpdO2GnXHqtGHFx7L3n+Eyw58T6s9RoOnmz8owBZI6tXeeW3jsZojM9lWKtH
         ZlmtfdJJAP4Kong1fiDLMpP4g0cEqFSBO+vB7SYYa3r0KRMAbTz/hrR4YQbBFloLYbbc
         6WweN9h6pI6s8PqLzwHTzMd2/owCy3JuiZoXLoWUXsFfFJFHncBnTKdqOCLbIuE2DwsF
         KNoQxzEVY2cabJU2LldSaz1rfId42ocZBTu09FXOGkQ4+1fe4HyzlilHUv6+7+6pze1J
         ghnO7giFPj1awQz3UOMyK2F6ixcCWotBq2BNeFtCNDD9ye3xfkLcDUFqOr1b4UkpXjdE
         JBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632793; x=1768237593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w8+OXGrdIqZSTdZ3i5+/35ScU4yn1oGqDHkJQmcbMk=;
        b=jDGuzUiIIooFWtwlDnByOVfNGe5D1yHh8mOyKc0rpQejrhFpoKRrmE8xof2FURkcvS
         Z43dVOLNFL0Q9RNK4ZUPYj0mPnJKnNmJrCH6cG+LU4fOuIQ2ki4Q4XKanek649Njz59O
         8jfj1F/oB+jtxlJkeJRjwRaDyXIM2dlpwyXS+qq+WDzwLl6lsDgZcFz9XwV5ZEBSeWiE
         b/Jbj0IEk3z0MDLHbZ6jJrSi4Aj4qERegGs0kxKvJPtZeWju6wRgAz5b4CQln6lMJ0K8
         u+RDQTLjLfxgCFkBDvv4g7XKx5DmOnGKyZs4Klkr/cIY30pU8ll/pBKeW9pSavWyTr7W
         TiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKjr+Q2ZNS5aOLCPFnf6HBeaZI1Bts2IXz/17WH2KCt2PC83YBZ2f3z6JfF1SR6XpS2q8taHOAyEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHY2gogN3kq5yW83BA7awlwEhnf6FMyYf7K84fU3WEbAyxrr0p
	tBK+EL+j1lFTmP54vY4BwcFRmlpe2Wg91X9s9i047uBbHIqPId6SRok3U1H1tYmL+A==
X-Gm-Gg: AY/fxX5YuJnlJn/6EBsHYkP5N/a1jvDu8G01rtaVOA1LZJQVPFZd435Av04frOHZb2U
	7thqbdttaFjQdfGsYNJMf7O5t6Gw9VfcrkCoS6EeaDMPFGDlPl2opuLc5GQ/sXcyc3bWZZgLxd5
	glHk4BaGv5xP0athKlZyD0ycw52khunxuNrXL2j/CI4KjQMP236SgW7L5Td10UqNaBkL0LEGoHf
	niSXZDy2LvOfiaYoGO0J+YJbFzI9Liak6zD9DOVhkTK6TQK/8s5NTff8N6O1vofqarTlO5j2cPx
	Av1pHFWvsGYXN6u8b+yLmdaIp2BR9uRxCDOKNWx1/Y+4UVk5RN1rBAr/oZ7C2isBztpAtKWKU+7
	dceiKXAx6VRTaqwfjkipwyH2TgQZRwCbCM3EL2Ds24PKKyC5seCl+yzHmo/RZ/GdOjlC0y56Tdh
	r4eXMGFBLtEq3107SXPjSZPLH1c+rPiQvWBoiwXc6rfscRUiW+7kr7JYhKK4Bxi4khZ0W+OcllL
	Go=
X-Google-Smtp-Source: AGHT+IEPPcwO0JpH30zpEMZ3VzKx2THUDTdo20mc49baiG96elxUOAZjnYVT3TzTyM6tyIg/PVWatA==
X-Received: by 2002:a05:600c:1d1d:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47d7f09da9emr38325e9.27.1767632793398;
        Mon, 05 Jan 2026 09:06:33 -0800 (PST)
Message-ID: <1c13180b-29f5-4e7f-a05b-baac70737cc6@suse.com>
Date: Mon, 5 Jan 2026 18:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <5b49e965-7e1a-4b04-baa9-c14e2de2e247@citrix.com>
 <7bd2372a-6687-47c5-94df-2366866f53ea@suse.com>
 <2a22afe1-7b85-4671-a534-00306b97ec21@citrix.com>
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
In-Reply-To: <2a22afe1-7b85-4671-a534-00306b97ec21@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.01.2026 17:55, Andrew Cooper wrote:
> On 05/01/2026 3:16 pm, Jan Beulich wrote:
>> On 02.01.2026 17:01, Andrew Cooper wrote:
>>> On 30/12/2025 1:54 pm, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/xstate.c
>>>> +++ b/xen/arch/x86/xstate.c
>>>> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>>>>      uint32_t hmask = mask >> 32;
>>>>      uint32_t lmask = mask;
>>>>      unsigned int fip_width = v->domain->arch.x87_fip_width;
>>>> -#define XSAVE(pfx) \
>>>> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
>>>> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
>>>> -                           : "=m" (*ptr) \
>>>> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
>>>> -        else \
>>>> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
>>>> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
>>>> -                           X86_FEATURE_XSAVEOPT, \
>>>> -                           "=m" (*ptr), \
>>>> -                           "a" (lmask), "d" (hmask), "D" (ptr))
>>>> +
>>>> +#define XSAVE(pfx)                                                      \
>>>> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
>>>> +        asm volatile ( "xsaves %0"                                      \
>>>> +                       : "=m" (*ptr)                                    \
>>>> +                       : "a" (lmask), "d" (hmask) );                    \
>>>> +    else                                                                \
>>>> +        alternative_io("xsave %0",                                      \
>>>> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
>>>> +                       "=m" (*ptr),                                     \
>>>> +                       "a" (lmask), "d" (hmask))
>>> This loses the pfx.  I've fixed up locally and double checked the
>>> disassembly.
>> Question being: Do we want to stick to using the prefix form, when gas
>> specifically has been offering a kind-of-suffix form instead from the
>> very beginning (xsaves and xsaves64)?
>>
>> If we wanted to stick to the prefixes, I'd favor a form where the use
>> sites don't need to supply the separating blank (i.e. the macro itself
>> would insert it, as doing do with an empty prefix results in merely
>> an indentation "issue" in the generated assembly). Thoughts?
> 
> I don't expect this macro to survive the fixes to use the compressed
> format.  From that point of view, "closest to the original" is least churn.
> 
> One problem with using a suffix form is that you could feed in "opt"
> instead of "64" and break things in rather more subtle ways.

Except that there's no XSAVESOPT nor XSAVEOPTOPT.

> I'll adjust the position of the space, but I think this can keep on
> using prefixes in the short term.

Okay, I wanted the alternative to at least be considered.

Jan

