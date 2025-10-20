Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C9BEF60E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 07:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145973.1478476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAiqG-0001Nw-G3; Mon, 20 Oct 2025 05:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145973.1478476; Mon, 20 Oct 2025 05:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAiqG-0001Kw-9c; Mon, 20 Oct 2025 05:54:00 +0000
Received: by outflank-mailman (input) for mailman id 1145973;
 Mon, 20 Oct 2025 05:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAiqE-0001Kn-Kl
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 05:53:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 287a8863-ad79-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 07:53:53 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso27626225e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 19 Oct 2025 22:53:53 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70c:6a14:d8fb:347b:52d3:727d?
 (p200300cab70c6a14d8fb347b52d3727d.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a14:d8fb:347b:52d3:727d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47114423862sm215881545e9.1.2025.10.19.22.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 22:53:52 -0700 (PDT)
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
X-Inumbo-ID: 287a8863-ad79-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760939632; x=1761544432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SWNUGj0NiD3hC9NE4Xx5P4ljV476HfXn2ly5pkw26og=;
        b=VRIzMQfjr2hyZTbwOcAokF/Po0dPzwM9SGLU2OqFs2ZpBNt0HNxEIPFzbcOwT3mUNF
         nrjKAhoqrdsjc1lXOCYyEUSZhzCRzM0qAFSl9JxHuuP2cuI4mqSo6zdmpA/d3dyvj3So
         1JsLg3dWSDy5pRSdC18ADYpa7Sb6fTBfnHuqqlW3fBUiTiVqUCqAUobspZmffaVSqMjs
         KKv0YRPr3olpluUGYOvg8Ag9skt1GGfyE7qYerLM5mDfINooqTs2bA7Y2s+jbRHrt4EG
         8UlwaUAbQCiGEG8+1B+dCH76sILuhUEwbAq5KYfBasdZld8IhwuW6niW8XlHFsA7QqxW
         GBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760939632; x=1761544432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWNUGj0NiD3hC9NE4Xx5P4ljV476HfXn2ly5pkw26og=;
        b=RgSvxZUbHqH0/uziLNp39TijdSShHpuyAGt6X28MtWKgm+U+nuNjQq11zDRBxtDBqQ
         HNzIUWZvRLAiQVfvAHcaqZ1qg9+W16HzoC6m2YIcQpqGIrvKsvpWZKcIFMOt6RqNOHLl
         Y9fLVop+l6ad52hFqymd7xaHxTP+cS2hmls19my5q6Ms9LuAA5GpT+fM/u5t2LpE3POv
         EIhRwbMdsNILdx1S9rUtPiYlRcW4BRofXE+oUrrj5fBs45vyCGVnNaXB10tj5gxJmYl0
         lOPMA2zEoZaz5zQKpiQR0VifZ2fSVXzQ6NizXO4dafYsGFbxx6G1NSjjD7188M/HQhj5
         bFhw==
X-Gm-Message-State: AOJu0YxyK5G3Z98jS6/q9ENot6xXJCV8xLeMu2PooSi6XbOwQNqF44mv
	6X1u4YSxP/gQNSGfmGLVo+xcSpDRQZ8ljEexsrJ01hAytbtczj5P+ugUmsapEnILOg==
X-Gm-Gg: ASbGncuIwNfB35JV8SwTw3KxfthgdEHoteYjLSk5ATyIM9+KHnXNlcoTerdiOjlljE/
	iTWD2CfGairLWOSpiAub+/WLksomWdi+mIT2HkOw87w9COoVte1TkpoTt0rds9tLDNccNtrw2ar
	/eyY6rQdOjV0I0NyMxgNn6o4UAtwhtQu6dGPFODdRj6hqGvWELJX5n04ElGMJGTFU3PcrYDbchS
	+moIycws44VuTdQLL0sjC8+VsNeNyQIiIK356+VHVoYg3tpsXal05Ha3vwOZ+BEXoNURuEbcG9E
	fB7Xl/pEQfou7UYHLoVKRrPysTNSm3PvLRTduoDXYGrbBuH9k9LgJ0oIRhY/hxh+ckUmyvAShqj
	VmgKjjRB0zdlH2GVrucjB9in6Qa52Uj1FK39qCNKTMDNboy7syTQ64HCzlxjgF03R3Y5ui1ui3G
	pZO9Q/v8IduF1tsrDrNBp7M5ymVbe3FA37+a9kAXW2UX4HL0d43gOyreO/2CaMyLNyjTq4o2gw5
	bv0ISKyRuqE4/pOBxo1JiB3lQ4n1pGDgCxU5w==
X-Google-Smtp-Source: AGHT+IHzlfj6wsgPJg2MuueUtINxTxfgAo4RlUIEShzS5NfUGjP3s3uI0rFfOfo9lKJp4xI2Xpjevg==
X-Received: by 2002:a05:600c:8a16:10b0:46e:24a4:c247 with SMTP id 5b1f17b1804b1-471099254f6mr93066515e9.5.1760939632548;
        Sun, 19 Oct 2025 22:53:52 -0700 (PDT)
Message-ID: <1e14d71a-4c23-46d9-a123-475a22bdc856@suse.com>
Date: Mon, 20 Oct 2025 07:53:51 +0200
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
In-Reply-To: <aPH8Waqi5hJyCuzO@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.10.2025 10:20, Roger Pau Monné wrote:
> On Fri, Oct 17, 2025 at 09:15:08AM +0200, Jan Beulich wrote:
>> On 16.10.2025 18:27, Roger Pau Monné wrote:
>>> On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
>>>> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
>>>>      spin_lock(&desc->lock);
>>>>      hpet_msi_mask(desc);
>>>>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>>>
>>> I would set the vector table ahead of setting the affinity, in case we
>>> can drop the mask calls around this block of code.
>>
>> Isn't there a problematic window either way round? I can make the change,
>> but I don't see that addressing anything. The new comparator value will
>> be written later anyway, and interrupts up to that point aren't of any
>> interest anyway. I.e. it doesn't matter which of the CPUs gets to handle
>> them.
> 
> It's preferable to get a silent stray interrupt (if the per-cpu vector
> table is correctly setup), rather than to get a message from Xen that
> an unknown vector has been received?
> 
> If a vector is injected ahead of vector_irq being set Xen would
> complain in do_IRQ() that that's no handler for such vector.

As of now, setup_vector_irq() makes sure the field isn't uninitialized
(i.e. left at INT_MIN). With that change dropped (see below), there
would indeed be such a risk (on the first instance on each CPU).

>>>> --- a/xen/arch/x86/include/asm/irq-vectors.h
>>>> +++ b/xen/arch/x86/include/asm/irq-vectors.h
>>>> @@ -18,6 +18,15 @@
>>>>  /* IRQ0 (timer) is statically allocated but must be high priority. */
>>>>  #define IRQ0_VECTOR             0xf0
>>>>  
>>>> +/*
>>>> + * Low-priority (for now statically allocated) vectors, sharing entry
>>>> + * points with exceptions in the 0x10 ... 0x1f range, as long as the
>>>> + * respective exception has an error code.
>>>> + */
>>>> +#define FIRST_LOPRIORITY_VECTOR 0x10
>>>> +#define HPET_BROADCAST_VECTOR   X86_EXC_AC
>>>> +#define LAST_LOPRIORITY_VECTOR  0x1f
>>>
>>> I wonder if it won't be clearer to simply reserve a vector if the HPET
>>> is used, instead of hijacking the AC one.  It's one vector less, but
>>> arguably now that we unconditionally use physical destination mode our
>>> pool of vectors has expanded considerably.
>>
>> Well, I'd really like to avoid consuming an otherwise usable vector, if
>> at all possible (as per Andrew's FRED plans, that won't be possible
>> there anymore then).
> 
> If re-using the AC vector is not possible with FRED we might want to
> do this uniformly and always consume a vector then?

Right now it saves us a vector. I'd leave the FRED side for when that's
going to be implemented. Which - aiui - isn't going to be straightforward
anyway, due to (at least) requirements around IRQ_MOVE_CLEANUP_VECTOR.

>>>> --- a/xen/arch/x86/irq.c
>>>> +++ b/xen/arch/x86/irq.c
>>>> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
>>>>          if ( !irq_desc_initialized(desc) )
>>>>              continue;
>>>>          vector = irq_to_vector(irq);
>>>> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
>>>> -             vector <= LAST_HIPRIORITY_VECTOR )
>>>> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
>>>> +                        ? LAST_HIPRIORITY_VECTOR
>>>> +                        : LAST_LOPRIORITY_VECTOR) )
>>>>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);
>>>
>>> I think this is wrong.  The low priority vector used by the HPET will
>>> only target a single CPU at a time, and hence adding extra CPUs to
>>> that mask as part of AP bringup is not correct.
>>
>> I'm not sure about "wrong". It's not strictly necessary for the HPET one,
>> I expect, but it's generally what would be necessary. For the HPET one,
>> hpet_msi_set_affinity() replaces the value anyway. (I can add a sentence
>> to this effect to the description, if that helps.)
> 
> I do think it's wrong, it's just not harmful per-se apart from showing
> up in the output of dump_irqs().  The value in desc->arch.cpu_mask
> should be the CPU that's the destination of the interrupt.  In this
> case, the HPET interrupt does have a single destination at a give
> time, and adding another one will make the output of dump_irqs() show
> two destinations, when the interrupt will target a single interrupt.

Just that as soon as the interrupt is actually in use, what is done
here doesn't matter anymore.

I continue to think the change is correct for the general case: I'd
expect these special vectors to normally (just not here) be used as
"direct APIC vectors", in which case the IRQ does have multiple
destinations.

Problem is - if I don't make this change, I still expect I ought to
make _some_ change here, as the following "else if()" might be getting
in the way. Then again the vector_irq[] assignment also isn't strictly
needed this early, as set_channel_irq_affinity() deals with that
anyway.

Bottom line - I guess I'll drop this change, realizing that adding
something here later on may then be harder to understand.

> If anything you should add the CPU to the affinity set
> (desc->affinity), but that's not needed since you already init the
> affinity mask with cpumask_setall().

Indeed.

> FWIW, I'm working on tentatively getting rid of the
> desc->arch.{cpu,old_cpu,pending}_mask fields and converting them to
> plain unsigned ints after we have dropped logical interrupt delivery
> for external interrupts.

I'm aware, yes. And I realize this change - for the HPET case - would
be getting in the way (to some degree).

Jan

