Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367290D54D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 16:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743136.1150036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJZvC-0004k8-ML; Tue, 18 Jun 2024 14:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743136.1150036; Tue, 18 Jun 2024 14:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJZvC-0004hR-JC; Tue, 18 Jun 2024 14:34:54 +0000
Received: by outflank-mailman (input) for mailman id 743136;
 Tue, 18 Jun 2024 14:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJZvC-0004hL-2j
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 14:34:54 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca9e5a3-2d7f-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 16:34:52 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso702281666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 07:34:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f427b0sm620412066b.156.2024.06.18.07.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:34:52 -0700 (PDT)
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
X-Inumbo-ID: eca9e5a3-2d7f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718721292; x=1719326092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uKLUkESMTrOsQqMMfXqsg15PVib2Z0WuGw7Z25qzMog=;
        b=J0BY/IiVwusI8NKYMytM4etaR/qODUbY8ZZsNBzV2jWYB0koR19ojX5DposGp4aJ1m
         UY/ZQJjxeN2lSNvVgEBXo5AHFidO6s02cnuppStSJa4vifEgfV3V0L3GiEOwu2j28OgO
         IS7zNo0w98EgGPX1K0tb3FaNuJGgtRQmciUKWA6f4VGXPLmCMbtUbetHT6iUqh8OLARr
         QdezO7ojErHV8whuQhCeNSKtZm8+m2+8NqSME3DEOKeDDE06qePGOots6+oC+xWK43zh
         WGkDFgtQd5td3RzHjBfxuJrLkPond8HZLah/uWn1kRMPu3eqXbx1QtkY9Pa0/+3YXhAY
         fuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721292; x=1719326092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKLUkESMTrOsQqMMfXqsg15PVib2Z0WuGw7Z25qzMog=;
        b=vgQFouqhezzVPl/RNdZtKQmRTKhCR/Uz0YzFgne81lcZm/dJZcEWTPsEPi/aQY9PYn
         67EC98/XpGQpBFA/v3jeO8ZZleJRooP0GR7CwF1fwHA5WF4VrQBXA27SjvIhSRr9Yklv
         CVFBTkS4czynq2AwMvsEj3oHucKH4+4Ls3kQAzmiyL9SEh1SgJs7+usW9MeL8CBzxjL+
         jqMtVMc0QtT49kCsl+yzGEieYzXpVMLbkbjuUuA4ETO6EHFYkC5lCcKUSfYyzcFaxEa+
         p4I9Fvc5qgr3LHNvHcfo/ioGhQpjqi0hQ80WCnxxKtlEpOP30gCmA7EliaWzbHbkBOOV
         C3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk+nAtuo0Gz17qY5SHtRZnL85LiCpbPgLoPuA4TtZFc9MKuRfus0NDjdN8eFcp19JWniXhjKSrNhw80gvgsiE6JkpPNSuOhS/Za+zkhRM=
X-Gm-Message-State: AOJu0YyBO0qhJbr1GfGs+xjTM9KxP/p8pg6qnUKePNccqWzz2nrV8MAM
	k7ja/pd8rkqLw9Fo9OSw/MtKXOX8EZY5t/14vQuFmheJpuzB/jkDC9MT+vMLULZzMTYRogwp2gQ
	=
X-Google-Smtp-Source: AGHT+IE64b/WygIA61duSYkXqUQ0/f+T9xlJVymO7iOt8QFLUW2tJxGYxCXiA3BIo/chAqnT5dCF9w==
X-Received: by 2002:a17:907:11c3:b0:a6e:fe98:946c with SMTP id a640c23a62f3a-a6f60d1d1demr815192266b.23.1718721292253;
        Tue, 18 Jun 2024 07:34:52 -0700 (PDT)
Message-ID: <2f388d0a-c9b5-409a-b622-5dfeb3093e82@suse.com>
Date: Tue, 18 Jun 2024 16:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
 <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com> <ZnFv7b4YNjeRXj6-@macbook>
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
In-Reply-To: <ZnFv7b4YNjeRXj6-@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.06.2024 13:30, Roger Pau Monné wrote:
> On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
>> On 13.06.2024 18:56, Roger Pau Monne wrote:
>>> fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
>>> the CPU is to become offline, the normal migration logic used by Xen where the
>>> vector in the previous target(s) is left configured until the interrupt is
>>> received on the new destination is not suitable.
>>>
>>> Instead attempt to do as much as possible in order to prevent loosing
>>> interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
>>> currently the case)
>>
>> Except (again) for smp_send_stop().
> 
> I guess I haven't worded this properly, the point I was trying to make
> is that in the context of a CPU unplug fixup_irqs() is always called
> from the CPU that's going offline.
> 
> What about:
> 
> "If fixup_irqs() is called from the CPU to be offlined (as is
> currently the case for CPU hot unplug) ..."

Sounds good to me.

>>> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>          if ( desc->handler->disable )
>>>              desc->handler->disable(desc);
>>>  
>>> +        /*
>>> +         * If the current CPU is going offline and is (one of) the target(s) of
>>> +         * the interrupt, signal to check whether there are any pending vectors
>>> +         * to be handled in the local APIC after the interrupt has been moved.
>>> +         */
>>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
>>> +            check_irr = true;
>>> +
>>>          if ( desc->handler->set_affinity )
>>>              desc->handler->set_affinity(desc, affinity);
>>>          else if ( !(warned++) )
>>>              set_affinity = false;
>>>  
>>> +        if ( check_irr && apic_irr_read(vector) )
>>> +            /*
>>> +             * Forward pending interrupt to the new destination, this CPU is
>>> +             * going offline and otherwise the interrupt would be lost.
>>> +             */
>>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
>>> +                          desc->arch.vector);
>>
>> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
>> where new IRQs ought to be surfacing only at the new destination). Doesn't
>> this want moving ...
>>
>>>          if ( desc->handler->enable )
>>>              desc->handler->enable(desc);
>>
>> ... past the actual affinity change?
> 
> Hm, but the ->enable() hook is just unmasking the interrupt, the
> actual affinity change is done in ->set_affinity(), and hence after
> the call to ->set_affinity() no further interrupts should be delivered
> to the CPU regardless of whether the source is masked?
> 
> Or is it possible for the device/interrupt controller to not switch to
> use the new destination until the interrupt is unmasked, and hence
> could have pending masked interrupts still using the old destination?
> IIRC For MSI-X it's required that the device updates the destination
> target once the entry is unmasked.

That's all not relevant here, I think. IRR gets set when an interrupt is
signaled, no matter whether it's masked. It's its handling which the
masking would prevent, i.e. the "moving" of the set bit from IRR to ISR.
Plus we run with IRQs off here anyway if I'm not mistaken, so no
interrupt can be delivered to the local CPU. IOW whatever IRR bits it
has set (including ones becoming set between the IRR read and the actual
vector change), those would never be serviced. Hence the reading of the
bit ought to occur after the vector change: It's only then that we know
the IRR bit corresponding to the old vector can't become set anymore.

And even then we're assuming that no interrupt signals might still be
"on their way" from the IO-APIC or a posted MSI message write by a
device to the LAPIC (I have no idea how to properly fence that, or
whether there are guarantees for this to never occur).

Jan

