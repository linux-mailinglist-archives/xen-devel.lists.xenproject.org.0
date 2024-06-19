Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B090E458
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743471.1150381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpga-0003tM-FY; Wed, 19 Jun 2024 07:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743471.1150381; Wed, 19 Jun 2024 07:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpga-0003qX-C6; Wed, 19 Jun 2024 07:24:52 +0000
Received: by outflank-mailman (input) for mailman id 743471;
 Wed, 19 Jun 2024 07:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJpgY-0003qR-PQ
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:24:50 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03394b3b-2e0d-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 09:24:49 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso73619531fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 00:24:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb8d734sm10072805b3a.195.2024.06.19.00.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 00:24:48 -0700 (PDT)
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
X-Inumbo-ID: 03394b3b-2e0d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718781889; x=1719386689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6zDjIrT0SU8j7+7y3dFEFIMxWNOStvLUqcMxBC2QJ2k=;
        b=Q9/ryTIFiEBuvuNpSshSwLXkr7SI0k67LNHvIbToJq0VAmmAee4R1RSjAx1M8Aft3w
         X2RRgY00bYiz3KqlZy5WEBPivcVfXke1E5aITloRvj4sL6awTgxLCVxdWl5MbLev3xhV
         6ByXViwGE5EqjHYIqZQ7nShjGfqfSyhrViGYv8X/SjqLZtyKv81ZWGmIYrZc0duDa6gM
         khGO527uDd8+KWpYmp1RUyQHo+tOvycCJpJcGzbTw4Vk+ILojfOpB14F3RQZqKX8q864
         wUBgtLFF1qNTYhR1es0UVtpwuZAZfTJ1dgbOuML2imw5ziN7tcQYsdY1Ox44E44mKOcK
         JDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718781889; x=1719386689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zDjIrT0SU8j7+7y3dFEFIMxWNOStvLUqcMxBC2QJ2k=;
        b=GoetwOjc3IGLmruZL/McGRzIUodGKhDjwAxB7Kw6h1eIaos8SZ6s9X1oWIrnPvIroO
         Tg4IpPM0uNzSclp23Gpy2l2y1uQLndrCo3mxhSG66IoQvvACG50CiUj7YpFtQpLJXk0B
         PxWhchvYDTqT3M7crThmZJtb8QuC2Ln1KJyEn3JennC875p+Wbxvgz+EP7x68RGu+vq0
         36mvHaWVhFwSpwWtlOBNLmsPVL8CAJvBVLFTdNG5d/sev1alGWweLpItqdueZKneLCkv
         gqdnCtgHAGe3JoD7sRMGyFjK3bw07Pz/S74DWWF/LffDf5NqzaY8Q2cPdcY8suPH+ayp
         TUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnr/LJmB4rY5tVyzmCWoZhlctZj3vVmPscm4th8QwHj59XPhUiTvicun40940k4KSD4RHpwOtrIJwsCy710La2LqIIdc6khO6Hk9X1wqI=
X-Gm-Message-State: AOJu0YySbKbRPsGHuFBpj2kAYLZLvhvokypStI8tSeqyZljVhIK0cwTu
	eeagOVgsdLlhWgqaWD724lfM0OUCWfPoVsyLkOavm+q/cOfjx75UqQk0BCX/Fw==
X-Google-Smtp-Source: AGHT+IG0Y/3LPmJ6WA8smahMRub1s6Y9hLNtskhW2zaHslxVeoTSk/so7z0gAnHp4IU4r6EmNRhAbQ==
X-Received: by 2002:a2e:97ca:0:b0:2ec:41a6:9ee with SMTP id 38308e7fff4ca-2ec41a60f70mr1611261fa.30.1718781888929;
        Wed, 19 Jun 2024 00:24:48 -0700 (PDT)
Message-ID: <541885b6-fd09-4531-8ae9-8e57e504c1b3@suse.com>
Date: Wed, 19 Jun 2024 09:24:41 +0200
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
 <ba89126f-715d-498e-81e1-2ed105ac2d1c@suse.com> <ZnKDTEX_eGz2sS4K@macbook>
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
In-Reply-To: <ZnKDTEX_eGz2sS4K@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2024 09:05, Roger Pau Monné wrote:
> On Tue, Jun 18, 2024 at 06:30:22PM +0200, Jan Beulich wrote:
>> On 18.06.2024 16:50, Roger Pau Monné wrote:
>>> On Tue, Jun 18, 2024 at 04:34:50PM +0200, Jan Beulich wrote:
>>>> On 18.06.2024 13:30, Roger Pau Monné wrote:
>>>>> On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
>>>>>> On 13.06.2024 18:56, Roger Pau Monne wrote:
>>>>>>> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>>>>>          if ( desc->handler->disable )
>>>>>>>              desc->handler->disable(desc);
>>>>>>>  
>>>>>>> +        /*
>>>>>>> +         * If the current CPU is going offline and is (one of) the target(s) of
>>>>>>> +         * the interrupt, signal to check whether there are any pending vectors
>>>>>>> +         * to be handled in the local APIC after the interrupt has been moved.
>>>>>>> +         */
>>>>>>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
>>>>>>> +            check_irr = true;
>>>>>>> +
>>>>>>>          if ( desc->handler->set_affinity )
>>>>>>>              desc->handler->set_affinity(desc, affinity);
>>>>>>>          else if ( !(warned++) )
>>>>>>>              set_affinity = false;
>>>>>>>  
>>>>>>> +        if ( check_irr && apic_irr_read(vector) )
>>>>>>> +            /*
>>>>>>> +             * Forward pending interrupt to the new destination, this CPU is
>>>>>>> +             * going offline and otherwise the interrupt would be lost.
>>>>>>> +             */
>>>>>>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
>>>>>>> +                          desc->arch.vector);
>>>>>>
>>>>>> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
>>>>>> where new IRQs ought to be surfacing only at the new destination). Doesn't
>>>>>> this want moving ...
>>>>>>
>>>>>>>          if ( desc->handler->enable )
>>>>>>>              desc->handler->enable(desc);
>>>>>>
>>>>>> ... past the actual affinity change?
>>>>>
>>>>> Hm, but the ->enable() hook is just unmasking the interrupt, the
>>>>> actual affinity change is done in ->set_affinity(), and hence after
>>>>> the call to ->set_affinity() no further interrupts should be delivered
>>>>> to the CPU regardless of whether the source is masked?
>>>>>
>>>>> Or is it possible for the device/interrupt controller to not switch to
>>>>> use the new destination until the interrupt is unmasked, and hence
>>>>> could have pending masked interrupts still using the old destination?
>>>>> IIRC For MSI-X it's required that the device updates the destination
>>>>> target once the entry is unmasked.
>>>>
>>>> That's all not relevant here, I think. IRR gets set when an interrupt is
>>>> signaled, no matter whether it's masked.
>>>
>>> I'm kind of lost here, what does signaling mean in this context?
>>>
>>> I would expect the interrupt vector to not get set in IRR if the MSI-X
>>> entry is masked, as at that point the state of the address/data fields
>>> might not be consistent (that's the whole point of masking it right?)
>>>
>>>> It's its handling which the
>>>> masking would prevent, i.e. the "moving" of the set bit from IRR to ISR.
>>>
>>> My understanding was that the masking would prevent the message write to
>>> the APIC from happening, and hence no vector should get set in IRR.
>>
>> Hmm, yes, looks like I was confused. The masking is at the source side
>> (IO-APIC RTE, MSI-X entry, or - if supported - in the MSI capability).
>> So the sole case to worry about is MSI without mask-bit support then.
> 
> Yeah, and for MSI without masking bit support we don't care doing the
> IRR check before or after the ->enable() hook, as that's a no-op in
> that case.  The write to the MSI address/data fields has already been
> done, and hence the issue would be exclusively with draining any
> in-flight writes to the APIC doorbell (what you mention below).

Except that both here ...

>>>> Plus we run with IRQs off here anyway if I'm not mistaken, so no
>>>> interrupt can be delivered to the local CPU. IOW whatever IRR bits it
>>>> has set (including ones becoming set between the IRR read and the actual
>>>> vector change), those would never be serviced. Hence the reading of the
>>>> bit ought to occur after the vector change: It's only then that we know
>>>> the IRR bit corresponding to the old vector can't become set anymore.
>>>
>>> Right, and the vector change happens in ->set_affinity(), not
>>> ->enable().  See for example set_msi_affinity() and the
>>> write_msi_msg(), that's where the vector gets changed.
>>>
>>>> And even then we're assuming that no interrupt signals might still be
>>>> "on their way" from the IO-APIC or a posted MSI message write by a
>>>> device to the LAPIC (I have no idea how to properly fence that, or
>>>> whether there are guarantees for this to never occur).
>>>
>>> Yeah, those I expect would be completed in the window between the
>>> write of the new vector/destination and the reading of IRR.
>>
>> Except we have no idea on the latencies.
> 
> There isn't much else we can do? Even the current case where we add
> the 1ms window at the end of the shuffling could still suffer from
> this issue because we don't know the latencies.  IOW: I don't think
> this is any worse than the current approach.

... and here, the later we read IRR, the better the chances we don't miss
anything. Even the no-op ->enable() isn't a no-op execution-wise. In fact
it (quite pointlessly[1]) is an indirect call to irq_enable_none(). I'm
actually inclined to suggest that we try to even further delay the IRR
read, certainly past the cpumask_copy(), maybe even past the spin_unlock()
(latching CPU and vector into local variables, along with the latching of
->affinity that's already there).

Jan

[1] While back when that was written the main goal probably was to avoid
conditionals on what may be deemed fast paths, I wonder whether nowadays
the main goal wouldn't be to avoid indirect calls when we (pretty) easily
can.

