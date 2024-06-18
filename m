Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78490D947
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 18:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743239.1150133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJbj3-0003SN-Ok; Tue, 18 Jun 2024 16:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743239.1150133; Tue, 18 Jun 2024 16:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJbj3-0003PD-LN; Tue, 18 Jun 2024 16:30:29 +0000
Received: by outflank-mailman (input) for mailman id 743239;
 Tue, 18 Jun 2024 16:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJbj2-0003P7-5v
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 16:30:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c1aed5-2d90-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 18:30:25 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so674700566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 09:30:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed379esm638596466b.139.2024.06.18.09.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 09:30:24 -0700 (PDT)
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
X-Inumbo-ID: 10c1aed5-2d90-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718728225; x=1719333025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8D4675Yda6h51MngzOhKZL5G8jAVqgVVqWF7KX4GrlE=;
        b=EAWVoJO5V/3GPzbTlLsBj2EA/s/m5gFm+xiMdb4FbrouOo+AHzbqViJbTz7Di2HUma
         mB/ifmvzfdWWKM2PEbtQmRM7B2jM2SjTGKw0jQbvOb4K+j+WC76zTOr8dipTA1TfTDEc
         w2pTtFNTBN2U7g3HOqEE0IJgDbSxm09Gm3X7dTLo6g20aHLXbSJy2yW/R4m2QbcR0obQ
         LyLSQ8rcKAPFsxvuny4zJ/Z3YSSLKcR6gYpxRLOgOq4mpReiyWpHzcGDmECBfgFk1TS8
         rqbkRqqfcf2Q1cFFZPOLhu3BY0sDW8nO/6TSk4B16HEZKNv4H44yjDHnA1ByagFl5dxa
         IHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728225; x=1719333025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D4675Yda6h51MngzOhKZL5G8jAVqgVVqWF7KX4GrlE=;
        b=TkeXdiBLdfy0x2zheMSUVdFXZBHHCtkoje6DA7e54JYZCHgl0j0XxVZcLJ0rSfPHKp
         97GEabqkRIhoO5u3JDqGo9OIuWePfdhthjEX0cqV4oht34atqTV7rWlx8Pnf+da4zk5u
         i2jdVltxtNvbXxFTcgYZMSYkiRZ+8lZBjL9TMHKCSyawsXzL2X+kY61HuDcq+ht9L8oE
         FQEd6cBgi43tiRwM8Mfbx4i6DiELgPeiKoBu7FmXv1Zcsfag8H38s/pAureuDuD0ufCp
         yuOYI4iHY91u+pLsKqHNhtVAHvVzCEFxpWYd6LHviHrMFeqSbhWBHSi5MEnqkvqw3J5p
         +EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUefVhoAx4whek/jbysAJ01l3zhVsce9zJjR36P2aDPbfGEjUeH5RK3JU/tfg76DyF0/1hot9e0dfzyfSGnpvS3bduM3juUFvzFzMVIXXk=
X-Gm-Message-State: AOJu0Yzrsd39nx4ExSMDbzd/XDhoM33UBU9Hf2CaBSEUYXk45SqjopcZ
	RANAxb4t7ymyDaqDpIEM7CKisc0wGH006i/LdUm2tByMR8SEFG3jWVVe5JoRqHgX/WUkTIv/6Jk
	=
X-Google-Smtp-Source: AGHT+IG/6Z3mn/HqpO8HF/xrAvsJsBP+shInRSSpHlhRWCpB/4TGkIbUzimaT5T5aS8YAOFsNsodnA==
X-Received: by 2002:a17:907:d30d:b0:a6f:5202:3dad with SMTP id a640c23a62f3a-a6fab77a1afmr625866b.55.1718728224634;
        Tue, 18 Jun 2024 09:30:24 -0700 (PDT)
Message-ID: <ba89126f-715d-498e-81e1-2ed105ac2d1c@suse.com>
Date: Tue, 18 Jun 2024 18:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
 <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com> <ZnFv7b4YNjeRXj6-@macbook>
 <2f388d0a-c9b5-409a-b622-5dfeb3093e82@suse.com> <ZnGerbiI7P9PHPmK@macbook>
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
In-Reply-To: <ZnGerbiI7P9PHPmK@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.06.2024 16:50, Roger Pau Monné wrote:
> On Tue, Jun 18, 2024 at 04:34:50PM +0200, Jan Beulich wrote:
>> On 18.06.2024 13:30, Roger Pau Monné wrote:
>>> On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
>>>> On 13.06.2024 18:56, Roger Pau Monne wrote:
>>>>> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>>>          if ( desc->handler->disable )
>>>>>              desc->handler->disable(desc);
>>>>>  
>>>>> +        /*
>>>>> +         * If the current CPU is going offline and is (one of) the target(s) of
>>>>> +         * the interrupt, signal to check whether there are any pending vectors
>>>>> +         * to be handled in the local APIC after the interrupt has been moved.
>>>>> +         */
>>>>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
>>>>> +            check_irr = true;
>>>>> +
>>>>>          if ( desc->handler->set_affinity )
>>>>>              desc->handler->set_affinity(desc, affinity);
>>>>>          else if ( !(warned++) )
>>>>>              set_affinity = false;
>>>>>  
>>>>> +        if ( check_irr && apic_irr_read(vector) )
>>>>> +            /*
>>>>> +             * Forward pending interrupt to the new destination, this CPU is
>>>>> +             * going offline and otherwise the interrupt would be lost.
>>>>> +             */
>>>>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
>>>>> +                          desc->arch.vector);
>>>>
>>>> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
>>>> where new IRQs ought to be surfacing only at the new destination). Doesn't
>>>> this want moving ...
>>>>
>>>>>          if ( desc->handler->enable )
>>>>>              desc->handler->enable(desc);
>>>>
>>>> ... past the actual affinity change?
>>>
>>> Hm, but the ->enable() hook is just unmasking the interrupt, the
>>> actual affinity change is done in ->set_affinity(), and hence after
>>> the call to ->set_affinity() no further interrupts should be delivered
>>> to the CPU regardless of whether the source is masked?
>>>
>>> Or is it possible for the device/interrupt controller to not switch to
>>> use the new destination until the interrupt is unmasked, and hence
>>> could have pending masked interrupts still using the old destination?
>>> IIRC For MSI-X it's required that the device updates the destination
>>> target once the entry is unmasked.
>>
>> That's all not relevant here, I think. IRR gets set when an interrupt is
>> signaled, no matter whether it's masked.
> 
> I'm kind of lost here, what does signaling mean in this context?
> 
> I would expect the interrupt vector to not get set in IRR if the MSI-X
> entry is masked, as at that point the state of the address/data fields
> might not be consistent (that's the whole point of masking it right?)
> 
>> It's its handling which the
>> masking would prevent, i.e. the "moving" of the set bit from IRR to ISR.
> 
> My understanding was that the masking would prevent the message write to
> the APIC from happening, and hence no vector should get set in IRR.

Hmm, yes, looks like I was confused. The masking is at the source side
(IO-APIC RTE, MSI-X entry, or - if supported - in the MSI capability).
So the sole case to worry about is MSI without mask-bit support then.

>> Plus we run with IRQs off here anyway if I'm not mistaken, so no
>> interrupt can be delivered to the local CPU. IOW whatever IRR bits it
>> has set (including ones becoming set between the IRR read and the actual
>> vector change), those would never be serviced. Hence the reading of the
>> bit ought to occur after the vector change: It's only then that we know
>> the IRR bit corresponding to the old vector can't become set anymore.
> 
> Right, and the vector change happens in ->set_affinity(), not
> ->enable().  See for example set_msi_affinity() and the
> write_msi_msg(), that's where the vector gets changed.
> 
>> And even then we're assuming that no interrupt signals might still be
>> "on their way" from the IO-APIC or a posted MSI message write by a
>> device to the LAPIC (I have no idea how to properly fence that, or
>> whether there are guarantees for this to never occur).
> 
> Yeah, those I expect would be completed in the window between the
> write of the new vector/destination and the reading of IRR.

Except we have no idea on the latencies.

Jan

