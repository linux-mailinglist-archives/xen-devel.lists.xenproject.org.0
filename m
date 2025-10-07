Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08014BC1EFF
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138992.1474555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69ik-0007zE-1s; Tue, 07 Oct 2025 15:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138992.1474555; Tue, 07 Oct 2025 15:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69ij-0007we-Uz; Tue, 07 Oct 2025 15:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1138992;
 Tue, 07 Oct 2025 15:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v69ij-0007wY-8h
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:35:21 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a55ed52-a393-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 17:35:18 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b50645ecfbbso80181366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:35:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a7ee4esm1407046066b.28.2025.10.07.08.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:35:17 -0700 (PDT)
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
X-Inumbo-ID: 3a55ed52-a393-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759851318; x=1760456118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i6GrCEmaiNm2zARysXA35YmhVTkBx+1kdZRk9bH5v0o=;
        b=SRpARsSI8PAhccl/2bIz/bHVUtGfc9jWTndHhpwR2SrZ5pIsg2+SJlailRjHfBvHR9
         B8kBx2bNo5RlXCr42wO/e6ZjwLtefBZBRVYM2TidvboH/WnA1XUGxD3MRha5jaVNgaM2
         Lk2c/fqy/Bq61ZYTHWMugTfAvjxnmmXLwoeTg04S523NhxJRwjfdprjFoeBKimT8cphT
         mDwalQ1QOVGWTTA9ZX+2bQdQVqtmSTlJFiG0CLwceq1bWUlvtra/wtSOvbXn9xpf2NnY
         WZoi+wVtsJjd5mwxX261v61xOFjYs/IZ+JFC2W7/ZprP+9rMO5QLMSAeESsiE1i7HEJc
         jT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851318; x=1760456118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6GrCEmaiNm2zARysXA35YmhVTkBx+1kdZRk9bH5v0o=;
        b=tWmamcbyc4EmizE/lZgnkCFC/Kh1GsVcIfnpS4T7IqzjljoO4nO37eZEHcvQ5NN13B
         YU389G7GgHHZ1IAjD4x43rglv8FDyts5ZXHvZBgsR3PlFlJboUaGosI+0fCOL99ysp3P
         GpAL8SspjuCvUYUb6kQx3BkDP8nHhyd5C67WUCgFV4BPxxKsjjCbg7KlCFqFgmY323MR
         rvRjfiunuAhnZ42QZLuHyjv+VwfmXiqtggQgMXU+OsknTiJWEwGJikHF5Xu7ciiFnSNA
         Ke9UlsSyTncXsXacab/Ur+tbxKtXis+mat3fMxQNn1YTJ42/Re/lQ3SWtpFobvm/e7M+
         FxWw==
X-Forwarded-Encrypted: i=1; AJvYcCXkGhLHYG/G2j+bzzBfBtH2qGOiI5QbWdhvyzWN3uvggqVGoNJEvnU08LPxVnb0bWN6a6lzE4AEMvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4tJ8qwOwORMbthyf2eOgVxRwQxu/ZgxdQOdWvhf2vWdt6uF+F
	Jqakc6v/SqexL5iHKJ2UjiOqcuDlIpQvYH7jNek7qENHaBgJ5FmxwNp7lt5pV7QjOA==
X-Gm-Gg: ASbGnctCtrJWr6+ABtzCrMxJAwe4GUypdBhk3VruAbMM+jCRq1ngmixO/tredDrj0nG
	Csbb+CN2WtuTbe+VANAgIGU7z17keharT09Fgd0hN5fhiXBNynJbTxwOhcLMHwC2cZxxaNsB6q4
	A6Tz73VGOaAD3cY5wMFI3bEsvGVuNC5hIt7mhCkcHSkpRvis+riTmQz5c5nImq1Jh3KUf/A3KfE
	sW7T89cl28em7/UE9BYvnOzh0CL3EtJ8qtdtX6xEL+D+5dSTizb4Gks8vy558EPiZaG/SgDmxzm
	CUjbznkt5FKDt+vNsjv8kbA0stRiqWkFk5vSZhl0ZMB6XSKufVoGQtkw+IpM7toeqWMnNjx738G
	j2rSFoBJ0qozX6AxuebTRM9QZrAHANSAqqa+TsgeAbnF5+IdySBJ/HZ0PDTYXy6nM4au0nAoiWO
	Mg3V/OIrsVsoUVnM/dcMZu3loHn0p8KgA=
X-Google-Smtp-Source: AGHT+IGrpEPIiRGS93W+g7hMjeAgNj9Yk/XkE5Uehyu5cQ+gV9gH/hpLaCyzUzyncEJtodAZ0iuXmA==
X-Received: by 2002:a17:907:934d:b0:b32:8943:7884 with SMTP id a640c23a62f3a-b50abfd6a1fmr4088966b.45.1759851317695;
        Tue, 07 Oct 2025 08:35:17 -0700 (PDT)
Message-ID: <ad2818bd-bf36-46b9-89f3-ffa8b9dd364a@suse.com>
Date: Tue, 7 Oct 2025 17:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
 <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
 <3715a68a-dc35-42f4-99e2-e1a45ebd1b16@epam.com>
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
In-Reply-To: <3715a68a-dc35-42f4-99e2-e1a45ebd1b16@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.10.2025 16:04, Grygorii Strashko wrote:
> 
> 
> On 01.10.25 18:18, Alejandro Vallejo wrote:
>> On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> The LAPIC LVTx registers have two RO bits:
>>> - all: Delivery Status (DS) bit 12
>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>
>>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
>>> and the IRQ is:
>>> - or accepted at destination and appears as pending
>>>    (vLAPIC Interrupt Request Register (IRR))
>>> - or get rejected immediately.
>>>
>>> The Remote IRR Flag (RIR) behavior emulation is not implemented for
>>> LINT0/LINT1 in Xen for now.
>>>
>>> The current vLAPIC implementations allows guest to write to these RO bits.
>>>
>>> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
>>> to implement "Write ignore" access type for RO bits by applying masks from
>>> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
>>> allows writing to RO fields.
>>>
>>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>>> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>>>
>>> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
>>> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
>>> to reserved bits should cause #GP exception), but contains no statements
>>> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
>>> now uses different masks (than vlapic_reg_write()) for checking LVTx
>>> registers values for "Reserved" bit settings, which include RO bits and
>>> do not cause #GP exception.
>>>
>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> Changes in v2:
>>> - masks fixed in vlapic_lvt_mask[]
>>> - commit msg reworded
>>>
>>> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/
>>>   xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>> index 79697487ba90..2ecba8163f48 100644
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -44,15 +44,17 @@
>>>   static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>>   {
>>>        /* LVTT */
>>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>>> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>>>        /* LVTTHMR */
>>> -     LVT_MASK | APIC_DM_MASK,
>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>        /* LVTPC */
>>> -     LVT_MASK | APIC_DM_MASK,
>>> -     /* LVT0-1 */
>>> -     LINT_MASK, LINT_MASK,
>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>> +     /* LVT0 */
>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>> +     /* LVT1 */
>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>        /* LVTERR */
>>> -     LVT_MASK
>>> +     LVT_MASK & ~APIC_SEND_PENDING,
>>>   };
>>
>> This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
>> for RO?
>>
>> That ought to simplify the logic in both the MSR and MMIO cases.
>>
>> MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
>> #GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved on
>> writes.
>>
>> Thoughts?
> 
> I've been thinking about the same and It can be done, np.
> I always trying to make "fix" with as small diff as possible
> considering back-porting.
> 
> How about "follow up" patch if there is an agreement to proceed this way on the Top level?

Doing it in two steps would be okay with me (I expected it to go that way
anyway), but then it would still be nice to limit churn some. Specifically,
taking LINT_MASK as example, can't we do

#define LINT_RO_MASK (LVT_RO_MASK | APIC_LVT_REMOTE_IRR)

#define LINT_WR_MASK \
    (LVT_WR_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY | \
    APIC_LVT_LEVEL_TRIGGER)

#define LINT_MASK (LINT_WR_MASK | LINT_RO_MASK)

or some such, and then use *_WR_MASK in the table initializer?

Jan

