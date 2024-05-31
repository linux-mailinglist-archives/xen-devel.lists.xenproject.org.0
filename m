Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427FE8D5B35
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733316.1139481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwL9-0005Vr-R3; Fri, 31 May 2024 07:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733316.1139481; Fri, 31 May 2024 07:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwL9-0005Tb-O0; Fri, 31 May 2024 07:06:15 +0000
Received: by outflank-mailman (input) for mailman id 733316;
 Fri, 31 May 2024 07:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCwL7-0005TV-Ot
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:06:13 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43bbeb89-1f1c-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 09:06:12 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so194841366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 00:06:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67eab84ebcsm54252166b.150.2024.05.31.00.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 00:06:11 -0700 (PDT)
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
X-Inumbo-ID: 43bbeb89-1f1c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717139172; x=1717743972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xc35MN7Ki9JfS9cT2TThfFPfvWqpsYztpVrHRcx1pkY=;
        b=L5QPTcyDwo0LbpP0iz1783/3LPZOgSoIesqCQmBCLmAtGQ49cgIWPzrvoUaFkMU5wt
         LBKzlFlUtRpkSPN2S4m2fM9Hgq8Ooyn3bWoNkVlH5xV4QVnVOiMtHnOx98fAnSTakAYR
         9qpYMxl7ra1WcT4o1IMsI2tJ2ussxHi71xMIx9o1Czm7p6NIjxjH3VPcY/RTnn+nVLm5
         rW1lyf+Wnp3SAyMLlSyEpagozktV7NITYIrWh2oD2DEGgndnjpv4I8gfjhHOcpn56g7W
         8Q90FlSQHjzJb21o9rKUnGnHyXUjrd0dyM3sBMPGQ0+3m5YvppMwad6fMhYdt6FEqrOA
         nOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139172; x=1717743972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc35MN7Ki9JfS9cT2TThfFPfvWqpsYztpVrHRcx1pkY=;
        b=S2CWIpoNC/5G36Rc6stQ54dDxZU5eTC1k1HVkx3lYqycDP4FbZL1RYztShsGOKYCy0
         a8xAkZqfXYNeSLMMVOUE1YdjOWtvIGElqulGKsYCI5YmzMj38cF7OaJQaBw0Shlnin1k
         Cl2W27edjMELoDK8qYZlfZgwE7xTNQ7n+z/zUomaU2PsqsuFDvio3TZ44ROmz09JJQAr
         Nod0z9klquXKQBEkDG90dcjiRCoZwmJyOhOrlTPyv4BZGRBHTt4MPe5lXC3ar7FMhZ8/
         Wjm2Khy7/ZNkfqEW31jJ3AXUnIgZ2YErMFHH5qcdaTFyu6vIgkLHqxLymxFDTbFCYYMx
         EYjg==
X-Forwarded-Encrypted: i=1; AJvYcCXc+e9kQ8OjUDbfL4cXUP/CSeSq/DbIBroPtd2AC3YXAiYyl2nK66Ktumm3Ulm7UNuRTwca+d7Djwl19ajM8QjGV8wFYi6DBpcAua2MY7E=
X-Gm-Message-State: AOJu0Yzvsit9xorpFaThHTfld3yFqKjrJzVT2VDWcBZ8Jd6bK1q1MFP8
	ZwsPNXSkfqbqoK4icAykWOkufcVk2sKWaq7VKLVnFAJzUcdRFTG74Bm3TYGHwQ==
X-Google-Smtp-Source: AGHT+IGUN27DhbOrV6/mgfgehwQDzVP2rQrMhqZfXiFC5o+Y3sbDL/JZL94mkaTmP1jsrZ6wdnR5gg==
X-Received: by 2002:a17:906:d8c5:b0:a68:137b:949 with SMTP id a640c23a62f3a-a6820516e7bmr55450366b.29.1717139172056;
        Fri, 31 May 2024 00:06:12 -0700 (PDT)
Message-ID: <011d96d4-8778-430f-bb93-4a48f7ddd32c@suse.com>
Date: Fri, 31 May 2024 09:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 4/9] x86/irq: describe how the interrupt CPU
 movement works
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-5-roger.pau@citrix.com>
 <24201381-2a43-427e-a3e5-1de316d212b8@suse.com> <ZldJgwu2nDGv2HJP@macbook>
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
In-Reply-To: <ZldJgwu2nDGv2HJP@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 17:28, Roger Pau Monné wrote:
> On Wed, May 29, 2024 at 03:57:19PM +0200, Jan Beulich wrote:
>> On 29.05.2024 11:01, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/irq.h
>>> +++ b/xen/arch/x86/include/asm/irq.h
>>> @@ -28,6 +28,32 @@ typedef struct {
>>>  
>>>  struct irq_desc;
>>>  
>>> +/*
>>> + * Xen logic for moving interrupts around CPUs allows manipulating interrupts
>>> + * that target remote CPUs.  The logic to move an interrupt from CPU(s) is as
>>> + * follows:
>>> + *
>>> + * 1. cpu_mask and vector is copied to old_cpu_mask and old_vector.
>>> + * 2. New cpu_mask and vector are set, vector is setup at the new destination.
>>> + * 3. move_in_progress is set.
>>> + * 4. Interrupt source is updated to target new CPU and vector.
>>> + * 5. Interrupts arriving at old_cpu_mask are processed normally.
>>> + * 6. When an interrupt is delivered at the new destination (cpu_mask) as part
>>> + *    of acking the interrupt move_in_progress is cleared and move_cleanup_count
>>
>> Nit: A comma after "interrupt" may help reading.
>>
>>> + *    is set to the weight of online CPUs in old_cpu_mask.
>>> + *    IRQ_MOVE_CLEANUP_VECTOR is sent to all CPUs in old_cpu_mask.
>>
>> These last two steps aren't precise enough, compared to what the code does.
>> old_cpu_mask is first reduced to online CPUs therein. If the result is non-
>> empty, what you describe is done. If, however, the result is empty, the
>> vector is released right away (this code may be there just in case, but I
>> think it shouldn't be omitted here).
> 
> I've left that out because I got the impression it made the text more
> complex to follow (with the extra branch) for no real benefit, but I'm
> happy to attempt to add it.

Why "no real benefit"? Isn't the goal to accurately describe what code does
(in various places)? If the result isn't an accurate description in one
specific regard, how reliable would the rest be from a reader's perspective?

>>> + * 7. When receiving IRQ_MOVE_CLEANUP_VECTOR CPUs in old_cpu_mask clean the
>>> + *    vector entry and decrease the count in move_cleanup_count.  The CPU that
>>> + *    sets move_cleanup_count to 0 releases the vector.
>>> + *
>>> + * Note that when interrupt movement (either move_in_progress or
>>> + * move_cleanup_count set) is in progress it's not possible to move the
>>> + * interrupt to yet a different CPU.
>>> + *
>>> + * By keeping the vector in the old CPU(s) configured until the interrupt is
>>> + * acked on the new destination Xen allows draining any pending interrupts at
>>> + * the old destinations.
>>> + */
>>>  struct arch_irq_desc {
>>>          s16 vector;                  /* vector itself is only 8 bits, */
>>>          s16 old_vector;              /* but we use -1 for unassigned  */
>>
>> I take it that it is not a goal to (also) describe under what conditions
>> an IRQ move may actually be initiated (IRQ_MOVE_PENDING)? I ask not the
>> least because the 2nd from last paragraph lightly touches that area.
> 
> Right, I was mostly focused on moves (forcefully) initiated from
> fixup_irqs(), which is different from the opportunistic affinity
> changes signaled by IRQ_MOVE_PENDING.
> 
> Not sure whether I want to mention this ahead of the list in a
> paragraph, or just add it as a step.  Do you have any preference?

I think ahead might be better. But I also won't insist on it being added.
Just if you don't, perhaps mention in the description that leaving that
out is intentional.

Jan

