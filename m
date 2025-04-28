Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA8A9EB37
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 10:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970304.1359031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KGC-0006tJ-4a; Mon, 28 Apr 2025 08:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970304.1359031; Mon, 28 Apr 2025 08:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KGC-0006ri-1b; Mon, 28 Apr 2025 08:54:44 +0000
Received: by outflank-mailman (input) for mailman id 970304;
 Mon, 28 Apr 2025 08:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9KGA-0006iy-Ns
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:54:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bcd63f5-240e-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 10:54:40 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso35740045e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 01:54:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5310a1csm116105405e9.20.2025.04.28.01.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 01:54:39 -0700 (PDT)
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
X-Inumbo-ID: 6bcd63f5-240e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745830480; x=1746435280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iFZANYcCynztpdGLETVzDg3VnC5RXmNyXfGXwWR5kGU=;
        b=POpR/YrLtl180oGcnLvtuiZqt0nnWvQFxsUC/hk6+6tzFZ9NfS83MHQlHbrwbYOtEA
         Cp1RdiC4ODTCw0BKxriJzx8k5EmFJGdO04dopEuToZi+mDlzWFYG4seGmwvfjNm64ZLv
         IxFEwvaDQTd0IwWpM3eu58oodlqcBEKKUy8NLVBbRHzzFjczfvMePSQbiK5k/CkEJWmG
         H/T29ByXT79ata8SNHZE6Dc1qm2KQt341U8G3JDdnYt/KUDcIQMA5hOLRiccJwlBmbio
         gS8HeRvInhDRRW6oV3e6VG9pEweI80xxbzi2mb++ebxsVnBLEQ+SPl2I2Z/79/iz/f+L
         08Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745830480; x=1746435280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFZANYcCynztpdGLETVzDg3VnC5RXmNyXfGXwWR5kGU=;
        b=PLhJzmnUNft54hcSYxcQSN+VAbVECx6GHVqUMogJ3Dxg/s7JxanwBJtjdMgf3uDXh2
         t/kuKw74Pf9ds2PezWjqHSdp+33NtGdVh0bGVOToKaSjaaCqSQFrtlORm/PMjTdneIGu
         fmOhTS/UxcQtfFd7J4vTvGwoFz+D2Re3E05+OsAMH9NlkSzNYj1QZCb62M3VNtakPz17
         ZKxqKSaRTGYkbaTB5Xow+KkZt5yvkL6z3lKwTaP6zl9Q/9l5phDGXG5hcN4D+RF1Fo98
         7O38iG3r1H32qqJMIgc6lRBLG/0gA7pmvmPGizoSU+SiurrgabM+MuV9Bo2Tti6xBvSn
         Dvqg==
X-Forwarded-Encrypted: i=1; AJvYcCVgncCNWajViTtEgiuJkbxv81BmklhkKlmVQBKgyN1j0DtBUXNZe1nlwUe0exivD1uxyj9KrsSJaI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1JBDhXLOal8rfi9gCzpyi/N52vKdZceaH4maHEwy7ArX1jMgL
	a+UBzItbV4icsTtsSLH3RmsZ9hfh1EKnAIE1/t/TtiIhBytm9qZIqaTGc6biSg==
X-Gm-Gg: ASbGnctJlK85YX61jfzQnhAFXpDdztRLmgRSgpteFu8TaAHMuPaRjfR0ZJJ4wOn4A/p
	67AJvB2i7xuBoBgv7U5j1Y8jEaZOihOoCzl0w9e3UWqVqPlZqDd1LVv1usK4If2BdeLoKgA3SlU
	sFNhwR3o+Qo3uZCbLUM9JNwcJBvoiAzA05U9mRSjFz/hueEWqm4iASnb35l9KKRCRGUZ6zNUoVO
	V+JsEluKtpUjTyf5SuHCBlBRlBnAY4iBgd9Aa9zPW/KIOAnaBx1tw9plQMNgMQC5pMxKNUUfI98
	nOT17omh/Fmr90VP91W6gfcpv9S8RnoT36zSjFkD/vWtiV63o6aSq5If53HmF3aicdjx3CZ5I5Z
	9kcRhh9RVw9T9dEe9zgX5ArR8Dg==
X-Google-Smtp-Source: AGHT+IH0Y5QzbBPFYtOKLSmq7Ej0MzPHjCLw36xeBRHYZB8yDhIBuY+W2UPXsN2OgVVAbV6P6entVA==
X-Received: by 2002:a05:600c:1d0e:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-440a65e4994mr97102795e9.14.1745830480153;
        Mon, 28 Apr 2025 01:54:40 -0700 (PDT)
Message-ID: <d00fca13-617b-4687-9a15-131bba352ea1@suse.com>
Date: Mon, 28 Apr 2025 10:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
 <35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com>
 <9bee5d4e-cad1-4fc1-8b4c-b4a4bab4b76c@gmail.com>
 <c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com>
 <231e9f4e-a044-49b7-b3a5-26ff2f7f9612@gmail.com>
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
In-Reply-To: <231e9f4e-a044-49b7-b3a5-26ff2f7f9612@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 10:12, Oleksii Kurochko wrote:
> On 4/17/25 8:25 AM, Jan Beulich wrote:
>> On 16.04.2025 21:05, Oleksii Kurochko wrote:
>>> On 4/15/25 2:46 PM, Jan Beulich wrote:
>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>> Introduce interrupt controller descriptor for host APLIC to describe
>>>>> the low-lovel hardare. It includes implementation of the following functions:
>>>>>    - aplic_irq_startup()
>>>>>    - aplic_irq_shutdown()
>>>>>    - aplic_irq_enable()
>>>>>    - aplic_irq_disable()
>>>>>    - aplic_irq_ack()
>>>>>    - aplic_host_irq_end()
>>>>>    - aplic_set_irq_affinity()
>>>>>
>>>>> As APLIC is used in MSI mode it requires to enable/disable interrupts not
>>>>> only for APLIC but also for IMSIC. Thereby for the purpose of
>>>>> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
>>>>>
>>>>> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
>>>>> introduced to get hart id.
>>>>>
>>>>> Also, introduce additional interrupt controller h/w operations and
>>>>> host_irq_type for APLIC:
>>>>>    - aplic_host_irq_type
>>>>>    - aplic_set_irq_priority()
>>>>>    - aplic_set_irq_type()
>>>> Yet these two functions nor the hooks they're used to populate are entirely
>>>> unused here. Since they're also outside of the common IRQ handling machinery,
>>>> it's unclear how one would sanely ack such a change.
>>> They will be called by intc_route_irq_to_xen() from setup_irq() during firt time
>>> the IRQ is setup.
>> Perhaps move their introduction to there then? We don't do any Misra checking
>> yet lon RISC-V, but imo it's still good practice to avoid introducing new
>> violations, even if only temporarily.
> 
> Okay, I will move their introduction to there.
> 
> Btw, what is needed to add Misra checking for RISC-V? I started to think that, probably,
> it will make sense to do that from the start.

Best I can do is point you at what is done for Arm and x86. You may want to
ask people more familiar with the CI aspects involved here.

>>>>> +static void aplic_set_irq_priority(struct irq_desc *desc,
>>>>> +                                   unsigned int priority)
>>>>> +{
>>>>> +    /* No priority, do nothing */
>>>>> +}
>>>> Since the function dopes nothing, wouldn't it be better to omit it and have
>>>> the (future) caller check for a NULL pointer ahead of making the (indirect)
>>>> call? Same remark for other handlers (below) which also do nothing.
>>> I thought about that too, but it could be some cases when the stub is introduced
>>> with temporary BUG_ON("unimplemented") inside just to not miss to implement it
>>> when it will be necessary.
>>> If we will have only the caller check then we could miss to implement such stubs.
>> I guess I don't understand the concern.
> 
> for example, if we will have the following code:
>    void some_caller(struct irq_desc *desc)
>    {
>        if ( desc->handler->set_affinity )
>            desc->handler->set_affinity(desc, cpu_mask);
>    }
> 
> Then we will skip the call of handler->set_affinity() (if it was just initialized with
> .set_affinity = NULL) without any notification. And it is fine specifically in this
> case as aplic_set_irq_priority() does nothing.
> 
> But what about the cases if it is a function which will have some implementation in the
> future but doesn't have implementation for now. Then without notification that this
> function is unimplemented we could skip something what really matters.
> 
> But I think that your initial comment was just about the function which basically
> does nothing. Am i right?

Since indirect calls are not only more expensive (often; not sure about
RISC-V) but also pose speculative concerns, having such just to do nothing
simply seems like moving in the wrong direction.

>>>>> +    ASSERT(spin_is_locked(&desc->lock));
>>>> If this lock (which is an IRQ-safe one) is necessarily held, ...
>>>>
>>>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>>> ... you can use just spin_lock() here.
>>>>
>>>>> +    clear_bit(_IRQ_DISABLED, &desc->status);
>>>> Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
>>>> question on Arm code also doing so.)
>>> I haven't thought about that. Likely non-atomic bitop could be used here.
>> And then - does it need to be a bitop? Aiui that's what Arm uses, while x86
>> doesn't. And I see no reason to use other than plain C operators here. If
>> Arm was switched, presumably all the redundant (and misnamed) _IRQ_*
>> constants could go away, with just the IRQ_* ones left.
> 
> The reason for a bitop in Arm is explained in this commithttps://gitlab.com/xen-project/xen/-/commit/50d8fe8fcbab2440cfeeb65c4765868398652473
> but all the places where plain C operators were changed to bitops are actually executed under|spin_lock_irqsave(&desc->lock, flags). By quick look I found only two 
> places one in __setup_irq() but it is called by the functions which do ||spin_lock_irqsave(&desc->lock, flags) and in vgic_v2_fold_lr_state(). 
> Maybe, I'm missing something.|
> |RISC-V won't have something similar to ||vgic_v2_fold_lr_state|(), but __setup_irq() is used in a similar way. It can be added ASSERT(spin_is_lock(&desc->lock))
> and then it will also safe to use non-bitop function.
> Probably, it is a little bit safer to use always bitops for desc->status.
> ||

I question that. If any accesses outside of locked regions were needed (as the
description of that commit suggests), then the situation would be different.

Btw, you not wrapping lines and you adding strange | instances doesn't help
readability of your replies.

>>>> I'm uncertain about this bit setting anyway - on x86 we would only fiddle
>>>> with it for IRQs not in use, not while enabling/disabling one.
>> What about this part?
> 
> As I understand, based on Arm, code then Xen enables interrupts corresponding to devices assigned
> to dom0/domU before booting dom0/domU, resulting in the possibility of receiving an interrupt
> and not knowing what to do with it. So it is needed for enablement of IRQs when the guest
> requests it and not unconditionally at boot time.

I fear I don't understand this. The way we do things on x86 doesn't leave us
in such a situation.

Jan

