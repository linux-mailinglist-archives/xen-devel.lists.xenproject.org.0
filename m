Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B5BF24DB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146645.1479100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsNh-0005oy-Gv; Mon, 20 Oct 2025 16:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146645.1479100; Mon, 20 Oct 2025 16:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsNh-0005mx-EH; Mon, 20 Oct 2025 16:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1146645;
 Mon, 20 Oct 2025 16:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAsNf-0005mo-7R
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 16:05:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1909bf-adce-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 18:05:06 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso53568835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 09:05:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47154d382fesm145879025e9.10.2025.10.20.09.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 09:05:04 -0700 (PDT)
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
X-Inumbo-ID: 8b1909bf-adce-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760976305; x=1761581105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dKag40OVoDNWqRWhb5GZkDvtD2/NO5tIHkNU8RCgCIU=;
        b=duw5DKppFtl8yMej4tPHLOmdR500hS6m1Yg5gDxQKvbE/2lvbMMelQRogLd1ISjz/E
         v3AWhBHFSZ1HUIsPmKinrSAHHpoemPWxzKKHM5QBlEDXmQeeQPFIJvVxib/bQhGp8Gse
         CV/N94jjOg7N51qpOJGyGvi194Xq6IewtmDShjXAgucP6lbgRCbgzXhY+IqzfcvFa5c4
         V5ZuMuqg1inAkKHeAlIl0bwMVHDTRdHLNA15kGVfGhNk8ZtY+o9I4l4RgJ09gF5VvZFA
         atKsdPEXuYdXmQydV+WAAzQhblJCGIfT/nypHAE0dmsvhN54Z2QU2bI5sI2FdA22e1Pp
         ZIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760976305; x=1761581105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKag40OVoDNWqRWhb5GZkDvtD2/NO5tIHkNU8RCgCIU=;
        b=M+ticmrBGQGlcLRQluF0juteqg6LWbdRcnyM+tZdOZsKB+0QslXw/4zT8zxRmTQDdA
         6zYt4X6RXAfCrhvX7Rg3iCG5Hf6sZcfYyrbMUZX+EivERSmePHxY2gPzsjhE2lGd4Sn5
         icM132OLCsvsxJEQhTbCEQoGuwqJ/xIvQt0ZBLVWdRWav9ZjzwyG5koU0G39SKJhkFgt
         +LM3CplkK4wJe+opcdzfCJqtHQap2PJt5PsNJyZ3x0Pj32WGr9fTZI9dht96rO0m3ObE
         hKTnKY8sA+kK71MIfFsg5Y7ID3Ciz/yEGZoeKWSscRCACI6M6NnMZRILcUSW2yKBV8zx
         GBRA==
X-Gm-Message-State: AOJu0YxOqdpyrQmKKrj2alSJWSOWOM4TdpFdgxXCA3zsMGFf90cfRRrJ
	+RJ4+BdX8muOHEn+Y5FkYp9T9zzUwXZhN0lJfHbcvdRxLbPHO80XI4msmEmuV+srXg==
X-Gm-Gg: ASbGncuze1lRKv7eNCnv9SkPLWCYLAA/rhBMl8Z5HainYdScJX0EjXEXxbXQs+IDTLO
	cAJLJvZSK4K7HyfJd45yrMs73lp2Ril9pU9ZpJn4/QxkrFZ3vke1XCvxvxyaIPtEh/7GX0yJ0/t
	5EEr/tTwHwp8AQLcFSQDnYaGh6YpeIuSnpMdehLTllbtBm4//ff92UErZW8rxn4KAPsN6M2j1/Y
	hvCyDXWRsNjRMuk3GwbM27wpDTwtqty0OGru6QAXFgb1SDbQiVprESosBSh/aOffZDlwjyaTo1b
	1LHAGXD+lDUzx+meH/FfX3icZY5IUdY3sfVCWb3+A/TJFzUewyEwvwQXTP+ja7DC9J9WI/oKx2J
	Z+Y7LY1wrboprYLC61ES7UwQxv5X5+FWeUie0aybugI9XlnngFA++mWdUpD8c7Rl5BFzif0xPU8
	x8taI3tD8QtAkhp0upsx/8bYxllYZT5aeVdgPveeQtndw9sQkBlepf1Xx4fM6I
X-Google-Smtp-Source: AGHT+IHNPnDzvutlaOJXL76wlWDFSvHX+7milEieDb9/3bx+KPX7qAXpYTroCVa7QrnoGTLRpRaBlQ==
X-Received: by 2002:a05:600c:3f08:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-4711791f738mr110028225e9.37.1760976305028;
        Mon, 20 Oct 2025 09:05:05 -0700 (PDT)
Message-ID: <c27a671f-0001-4c32-9fb5-41b19a3f0a49@suse.com>
Date: Mon, 20 Oct 2025 18:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com> <aPEc3VWLI0ofq22f@Mac.lan>
 <39f00b12-a3f7-4185-a8fa-2c99c43695d9@suse.com> <aPH8Waqi5hJyCuzO@Mac.lan>
 <1e14d71a-4c23-46d9-a123-475a22bdc856@suse.com> <aPZaDJZiPsOazcHN@Mac.lan>
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
In-Reply-To: <aPZaDJZiPsOazcHN@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 17:49, Roger Pau Monné wrote:
> On Mon, Oct 20, 2025 at 07:53:51AM +0200, Jan Beulich wrote:
>> On 17.10.2025 10:20, Roger Pau Monné wrote:
>>> On Fri, Oct 17, 2025 at 09:15:08AM +0200, Jan Beulich wrote:
>>>> On 16.10.2025 18:27, Roger Pau Monné wrote:
>>>>> On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
>>>>>> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
>>>>>>      spin_lock(&desc->lock);
>>>>>>      hpet_msi_mask(desc);
>>>>>>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>>>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>>>>>
>>>>> I would set the vector table ahead of setting the affinity, in case we
>>>>> can drop the mask calls around this block of code.
>>>>
>>>> Isn't there a problematic window either way round? I can make the change,
>>>> but I don't see that addressing anything. The new comparator value will
>>>> be written later anyway, and interrupts up to that point aren't of any
>>>> interest anyway. I.e. it doesn't matter which of the CPUs gets to handle
>>>> them.
>>>
>>> It's preferable to get a silent stray interrupt (if the per-cpu vector
>>> table is correctly setup), rather than to get a message from Xen that
>>> an unknown vector has been received?
>>>
>>> If a vector is injected ahead of vector_irq being set Xen would
>>> complain in do_IRQ() that that's no handler for such vector.
>>
>> As of now, setup_vector_irq() makes sure the field isn't uninitialized
>> (i.e. left at INT_MIN). With that change dropped (see below), there
>> would indeed be such a risk (on the first instance on each CPU).
>>
>>>>>> --- a/xen/arch/x86/irq.c
>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
>>>>>>          if ( !irq_desc_initialized(desc) )
>>>>>>              continue;
>>>>>>          vector = irq_to_vector(irq);
>>>>>> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
>>>>>> -             vector <= LAST_HIPRIORITY_VECTOR )
>>>>>> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
>>>>>> +                        ? LAST_HIPRIORITY_VECTOR
>>>>>> +                        : LAST_LOPRIORITY_VECTOR) )
>>>>>>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);
>>>>>
>>>>> I think this is wrong.  The low priority vector used by the HPET will
>>>>> only target a single CPU at a time, and hence adding extra CPUs to
>>>>> that mask as part of AP bringup is not correct.
>>>>
>>>> I'm not sure about "wrong". It's not strictly necessary for the HPET one,
>>>> I expect, but it's generally what would be necessary. For the HPET one,
>>>> hpet_msi_set_affinity() replaces the value anyway. (I can add a sentence
>>>> to this effect to the description, if that helps.)
>>>
>>> I do think it's wrong, it's just not harmful per-se apart from showing
>>> up in the output of dump_irqs().  The value in desc->arch.cpu_mask
>>> should be the CPU that's the destination of the interrupt.  In this
>>> case, the HPET interrupt does have a single destination at a give
>>> time, and adding another one will make the output of dump_irqs() show
>>> two destinations, when the interrupt will target a single interrupt.
>>
>> Just that as soon as the interrupt is actually in use, what is done
>> here doesn't matter anymore.
>>
>> I continue to think the change is correct for the general case: I'd
>> expect these special vectors to normally (just not here) be used as
>> "direct APIC vectors", in which case the IRQ does have multiple
>> destinations.
> 
> I think it depends on the usage of the vector.  There are indeed
> vectors that are active on all CPUs at the same time (like the current
> hi priority ones).  However in the case of the HPET vector that's not
> the case, it targets a single CPU specifically.
> 
> I think it would be best if vectors that are used on all CPUs at the
> same time are initialized using cpumask_all or cpumask_setall(), and
> avoid having to add a new bit every time a CPU is started.  It's fine
> for cpu_mask to contain offline CPUs.

I don't think so. There may be less dependencies now, but look at e.g.
the check in _bind_irq_vector(). Or this loop

            for_each_cpu(cpu, desc->arch.cpu_mask)
                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;

in _assign_irq_vector() (that may be fine because of how the mask is
set just before the loop, but the loop itself very much assumes no
offline CPUs in there). The most problematic example may be in
fixup_irqs(), where cpumask_any(desc->arch.cpu_mask) is used.

Jan

