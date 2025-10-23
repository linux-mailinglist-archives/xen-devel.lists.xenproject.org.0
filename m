Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E0C0087F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 12:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149018.1480809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBshD-0004pg-KR; Thu, 23 Oct 2025 10:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149018.1480809; Thu, 23 Oct 2025 10:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBshD-0004nR-HL; Thu, 23 Oct 2025 10:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1149018;
 Thu, 23 Oct 2025 10:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBshC-0004nL-KJ
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 10:37:26 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43bdfd4d-affc-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 12:37:25 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so389372f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 03:37:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898add8bsm3121750f8f.23.2025.10.23.03.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 03:37:24 -0700 (PDT)
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
X-Inumbo-ID: 43bdfd4d-affc-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761215845; x=1761820645; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6I3vE0DfaV1ZJBdjseuI+tY5tbGr8PllPuKgDjmX9E8=;
        b=afHmBjSYuAFX3K9pRumTJB84UG7NHU7W7kGytsLCFkMMZWVnb1+EiaYoXgWwNWjFNo
         Ck39goNUHN9yIQBZYTdZg06O2EPcYct6YeFABiTZK4kZ9z+gvYgT9CHlgJXN2zimnjsO
         TQfKJeMIAuihYp8RpwFDSYsUDFgNIKkDqxYKrCA3GKp4EhgMf5/+t7Ta+eWazybo2ELZ
         LgFRw/tfD4OmUABji20nlg93c0QVvYn7iFMc7NZ0pk84gwv+jDnSekuyQ4/EckZNOnZk
         6wJHzvJy8+VEXAcnwTZHQrFLu363zB12UOdAhzBUmBeLwOdbymzEuDfVtOk+JQ1WTdjg
         xJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215845; x=1761820645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I3vE0DfaV1ZJBdjseuI+tY5tbGr8PllPuKgDjmX9E8=;
        b=Ut597SEeOgzdkUEBXABBQVgwtkLvG0V+QVeTAd8izJlPKx3Q3aHoWCa6Zr7mVoNNSS
         iP+eEX257BbjDY35tDmbLL8pUpzYxJ3X8WQzZBEMr+/cGHV5zXZyuY10v9IvWmM5lTnC
         /BaV56bRFytSBWHmWqPQvRtaTdamZV6c/P/GES9cWe3YPLW0KV5OLmftGUWrhxwgYfeJ
         rpAbT7iBFyLmus3kuxyUbHo1hIVfiLewZTPVT/q3eBZAzlC++d3qALfGNCKv6j2TU1U1
         QlXRh9CXisRUTpJmSPpdap7eJiE8tDbRzkS8mT56NWSLc7JbHQj5fUR208rCC++3T4QD
         FSBQ==
X-Gm-Message-State: AOJu0Yy6lpKMaA2oEXw0bGQfDXAEbRRhxFgYTV2AiE3J5JYnE24xn5TN
	4pndG8c01aKIFEBd7viY9Zn8XIRG5EF6NaK9vzZjiUvVWhn2rR/oyK5c7kKNf7xBbw==
X-Gm-Gg: ASbGnctGM/NZztMVRSr88QuvRbUu+TyC+LNc0G9L1TPUjHYi3h4iRn6fKj0IRJ7gNHq
	YIX0mlqbC6iFMuTT3umbvcAE3jcE3SLC1sIddQmjfXfUBpjdK+bmfsGWZ8thnf65GlO89VzbYdW
	3mNvwcSyZTfMjjAWXhMgzqgosR3q/QN9aUPlUxEs05gHX4WzCI+wkUeeMWgwVRcdRINQ4dTaJaK
	zbn9KBe/zzrqx0R0coZwLM59Vw1iQYGsec6W3Ppn1L9vXwi88Mdg1l8Vuz3JspFfPWS7tXC4gZ3
	FGOgN/EjyXfjb9+MsYh3x8XiRAnN/W0ehNAewpBrfnHmPJvPsTfegihjIdWrTSh6wV/dlToD9sk
	YBiIkUSwGqj6LHjvxjXUnjstknWC5VY0tcBgllKMqoS0masGTfNIKSJT4oQ0HTSDzBx7xwpWsu2
	WjAKFrxFxANxwNdgjLVUxjob5FKaXFe5/+fvwy/icOaUlgizsmH2zvHla+UMH4gZCXva85fG0=
X-Google-Smtp-Source: AGHT+IFzD/HhXzJjhcOeevnQMVvIQuLiADeATMYqGpp6omX0fOF/F6TlFG+7HCH/LOoh2BrVPFngbQ==
X-Received: by 2002:a5d:5f47:0:b0:428:3ef4:9a0f with SMTP id ffacd0b85a97d-4283ef49e24mr9707845f8f.6.1761215844694;
        Thu, 23 Oct 2025 03:37:24 -0700 (PDT)
Message-ID: <47c1fb5e-abd5-40a8-b581-be8494be3861@suse.com>
Date: Thu, 23 Oct 2025 12:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com> <aPZh3Y8W4QcV_oLs@Mac.lan>
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com> <aPePepQk3t6gxMR1@Mac.lan>
 <16d62ac6-6666-4bad-be59-324cec634a20@suse.com> <aPnpvtXOoYSXXsT-@Mac.lan>
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
In-Reply-To: <aPnpvtXOoYSXXsT-@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 10:39, Roger Pau Monné wrote:
> On Wed, Oct 22, 2025 at 11:21:15AM +0200, Jan Beulich wrote:
>> On 21.10.2025 15:49, Roger Pau Monné wrote:
>>> On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
>>>> On 20.10.2025 18:22, Roger Pau Monné wrote:
>>>>> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
>>>>>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
>>>>>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>>>>>>  {
>>>>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>>>>>> +    struct msi_msg msg = ch->msi.msg;
>>>>>>  
>>>>>>      ASSERT(!local_irq_is_enabled());
>>>>>>      spin_lock(&desc->lock);
>>>>>> -    hpet_msi_mask(desc);
>>>>>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>>>>>> -    hpet_msi_unmask(desc);
>>>>>> +
>>>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
>>>>>> +     * actual update below (either of the IRTE or of [just] message address;
>>>>>> +     * with interrupt remapping message address/data don't change) now being
>>>>>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
>>>>>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
>>>>>> +     * keeps setting the new deadline only afterwards).
>>>>>> +     */
>>>>>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
>>>>>> +
>>>>>>      spin_unlock(&desc->lock);
>>>>>>  
>>>>>> -    spin_unlock(&ch->lock);
>>>>>> +    msg.dest32 = cpu_physical_id(ch->cpu);
>>>>>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>>>>>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>>>>>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>>>>>> +    {
>>>>>> +        ch->msi.msg = msg;
>>>>>> +
>>>>>> +        if ( iommu_intremap != iommu_intremap_off )
>>>>>> +        {
>>>>>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>>>>>>  
>>>>>> -    /* We may have missed an interrupt due to the temporary masking. */
>>>>>> -    if ( ch->event_handler && ch->next_event < NOW() )
>>>>>> -        ch->event_handler(ch);
>>>>>> +            ASSERT(rc <= 0);
>>>>>> +            if ( rc > 0 )
>>>>>> +            {
>>>>>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>>>>>> +                ASSERT(msg.address_lo ==
>>>>>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>>>>>> +            }
>>>>>
>>>>> The sequence of asserts seem wrong here, the asserts inside of the rc
>>>>>> 0 check will never trigger, because there's an ASSERT(rc <= 0)
>>>>> ahead of them?
>>>>
>>>> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
>>>> we ought to check (and presumably fail on) data or address having changed.
>>>
>>> Right, but the ASSERT(rc <= 0) will prevent reaching any of the
>>> followup ASSERTs if rc == 1?
>>
>> Which is no problem, as we'd be dead already anyway if the first assertion
>> triggered. Nevertheless I've switched the if() to >= 0 (which then pointed
>> out a necessary change in AMD IOMMU code).
> 
> Right, so and adjusted if condition plus an ASSERT_UNREACHABLE() at
> the end of the if code block?

That is, instead of

            ASSERT(rc <= 0);
            if ( rc >= 0 )
            {
                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
                ASSERT(msg.address_lo ==
                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
            }

you'd prefer

            if ( rc >= 0 )
            {
                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
                ASSERT(msg.address_lo ==
                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
                ASSERT_UNREACHABLE();
            }

? That's wrong though (for rc == 0), i.e. I fear I don't see what you mean.

>>>  IOW, we possibly want:
>>>
>>>             if ( rc > 0 )
>>>             {
>>>                 dprintk(XENLOG_ERR,
>>>                         "Unexpected HPET MSI setup returned: data: %#x address: %#lx expected data %#x address %#lx\n",
>>>                         msg.data, msg.address,
>>>                         ch->msi.msg.data, ch->msi.msg.address);
>>>                 ASSERT_UNREACHABLE();
>>>                 hpet_msi_mask(desc);
>>>                 hpet_write32(msg.data, HPET_Tn_ROUTE(ch->idx));
>>>                 hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
>>>                 hpet_msi_unmask(desc);
>>>             }
>>>             ASSERT(!rc);
>>
>> To be honest, for my taste this goes too far as to what follows an
>> ASSERT_UNREACHABLE().
> 
> I can understand that.  It's the best way I've come up with attempting
> to recover from a possible error in the release case, but I don't
> particularly like it either.
> 
>>> I'm unsure about attempting to propagate the returned values on release
>>> builds, I guess it's slightly better than possibly using an outdated
>>> RTE entry?  Albeit this should never happen.
>>
>> Yes to the last remark; I don't actually see what you would want to do
>> with the propagated return value.
> 
> OK, I can this this not being clear.  By propagate here I mean
> propagate to the hardware registers, not to the function caller.

I.e. you still think adding the two hpet_write32() is going to be useful?
The mask/unmask, as I did say in another reply to your comments, isn't
useful here anyway (for already not being atomic), so I wouldn't see much
sense in having them. Plus of course we'd want to avoid the writes on
release builds if the values actually match, i.e. the construct would then
rather end up as two if-mismatch-then-write-else-assert-unreachable ones.

Just to mention - apart from this I have a working v3 ready to post.

Jan

