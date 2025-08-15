Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDAEB27BA1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083056.1442719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umq7e-0002Q2-3U; Fri, 15 Aug 2025 08:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083056.1442719; Fri, 15 Aug 2025 08:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umq7e-0002Nn-0G; Fri, 15 Aug 2025 08:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1083056;
 Fri, 15 Aug 2025 08:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umq7c-0002Nh-Kd
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:49:12 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65ae3aa-79b4-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:49:11 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so289069566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:49:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72db0sm95083366b.38.2025.08.15.01.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:49:10 -0700 (PDT)
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
X-Inumbo-ID: b65ae3aa-79b4-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755247750; x=1755852550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NDKn85YhVQuiGAXpeIem42zh5VYz9mxqsRhW3y92ScM=;
        b=OfwWenzxNPmqesHLg8jHV9wHKW5iPBRVE42hj1d+wz24lROefWN/63O9QLxyPs9vnS
         +rHxfIJd60vn39CNPGz6jLcFW1jhy3wXSIu8IYzTtA4RSm2i2+ArezefptVhLqAWIkr7
         7X4xAwOebLB+ngavANf4MoUT+p5G1kiYHQmqAep5RTx/mllB+dxggCCSr/70J7mCBTkh
         9mDNnPMvl5+pETsHpqnF6PCzoVDbCuvEHB8cdMBpVlS6smdJlvY/zyn2mBdPdAE9KjHB
         VcadajTwAHlT359jAlVhdONzIvwO6IcOxrTdImxtb3e/bauwP0582lZnFR7+cvE5j3zp
         aOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755247750; x=1755852550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDKn85YhVQuiGAXpeIem42zh5VYz9mxqsRhW3y92ScM=;
        b=VVOCnhjFxFcLgiHOJvTeY9DE4y+dDU4JhOUgaN0ES3dXw804iur3S7fpnMRMd9PY3Q
         eHs9i4kvpi+T/i6nqXluHmQGrAuDgv3jHhDXqytaebsRCO3HwuTXm097MPQ9PJKYETr4
         Lebwm9y3NEIAvqhwb3Y4q8NujL660W/ny/PAR4DCJdR8dTD1R4IBNLWn/Dt9kgbIsujP
         yAtZF0eeN8RfKapORprmWlRbpqMxsdUwluooyLggOAxkahLbBLWU/K5UHm9dQtNkjNhK
         vV5Ayhh4xm3wTnbTcFT/PoY4tnuQu7+cWtgQtiP9wh9IgSMkPdqGF1RhBfI23+2TfNnP
         UFkw==
X-Forwarded-Encrypted: i=1; AJvYcCW9sot7yaP3gA6AR0BFsNbPRNeKZT0TKD3VwSapw1fTP1cGAf3qgvCEYVnvd2h9cHJwTGmp3HtfSXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRfhYZaGl4ZAbwxqI68nvf+AWSOIQM95eDNVL0qOd/n5IeN9oy
	lJ8E7hoUnUGmIOKMSWZ7bykANUo/8mnp4wRDWtaZTx7lD1qngLTC1l3SbNcT3qbiNg==
X-Gm-Gg: ASbGnctN9bjU72GjI0b4F5s/fVVtFs5YKOvJZC7V0XlM59npOeManmVKXVzOipuol5j
	061xqMdkxUDTOoZjFf9oQOv9aqxo2OCCq2Ojj2btCdzki953AyXP4yNoopRduMHqzxnkuv1UW+q
	/FamlADQ5ZT+a/uDQFs4KVWu9pExsFPnKftp9c2orZnkyek7jEB2jfkbG4F2htteBfM9N+WuBF+
	RuEAmrY4COTO8ebD/kOAozXcL8AivZjR4QyL8LoTyMAzuvKKqDpf37H6tBkwpmimfHSk+CJ87bl
	AvCp9BmMkTvOj4NqwFP3gqm2NTk3p+pRrUY0whM1b5uz6wGJdlmkKk1NREWSySjq+G5v99qWKi1
	skOuUkMIoGg5udTfJxl8t1ejE/NhXx80O8QIYuzpxum3l/dX2/lOrmqxbJZAzIIU9zN7PjDqiGy
	Hu26DplK8=
X-Google-Smtp-Source: AGHT+IHeKjanxpUaltsw27FVqlgNaD492Y7MtGoNdHs4hW9D2TDx9y9MywM8iH1XM2Ye16C52YFVlQ==
X-Received: by 2002:a17:907:3c95:b0:afc:b61a:df8 with SMTP id a640c23a62f3a-afcdc32a5aemr100033666b.34.1755247750502;
        Fri, 15 Aug 2025 01:49:10 -0700 (PDT)
Message-ID: <d04ff22a-59e6-47f4-817e-c26ff2a98505@suse.com>
Date: Fri, 15 Aug 2025 10:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
 <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
 <aab37ec2-33bf-403b-978a-dc3c4bc282f7@suse.com>
 <0af415c5-df96-4715-a7e6-0d645e2e3a96@citrix.com>
 <75886e26-29b3-4aab-9780-7301330b4bb1@suse.com>
 <219ecea713dd9dac4c788d91c727f401@bugseng.com>
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
In-Reply-To: <219ecea713dd9dac4c788d91c727f401@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 10:40, Nicola Vetrini wrote:
> On 2025-08-15 10:30, Jan Beulich wrote:
>> On 14.08.2025 20:20, Andrew Cooper wrote:
>>> On 14/08/2025 8:26 am, Jan Beulich wrote:
>>>> On 13.08.2025 13:36, Andrew Cooper wrote:
>>>>> On 12/08/2025 10:43 am, Nicola Vetrini wrote:
>>>>>> On 2025-08-08 22:23, Andrew Cooper wrote:
>>>>>>> diff --git a/xen/arch/x86/traps-setup.c 
>>>>>>> b/xen/arch/x86/traps-setup.c
>>>>>>> index 8ca379c9e4cb..13b8fcf0ba51 100644
>>>>>>> --- a/xen/arch/x86/traps-setup.c
>>>>>>> +++ b/xen/arch/x86/traps-setup.c
>>>>>>> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
>>>>>>>
>>>>>>>  void nocall entry_PF(void);
>>>>>>>
>>>>>>> +/*
>>>>>>> + * Sets up system tables and descriptors for IDT devliery.
>>>>>>> + *
>>>>>>> + * - Sets up TSS with stack pointers, including ISTs
>>>>>>> + * - Inserts TSS selector into regular and compat GDTs
>>>>>>> + * - Loads GDT, IDT, TR then null LDT
>>>>>>> + * - Sets up IST references in the IDT
>>>>>>> + */
>>>>>>> +static void load_system_tables(void)
>>>>>>> +{
>>>>>>> +    unsigned int i, cpu = smp_processor_id();
>>>>>>> +    unsigned long stack_bottom = get_stack_bottom(),
>>>>>>> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
>>>>>>> +    /*
>>>>>>> +     * NB: define tss_page as a local variable because clang 3.5
>>>>>>> doesn't
>>>>>>> +     * support using ARRAY_SIZE against per-cpu variables.
>>>>>>> +     */
>>>>>>> +    struct tss_page *tss_page = &this_cpu(tss_page);
>>>>>>> +    idt_entry_t *idt = this_cpu(idt);
>>>>>>> +
>>>>>> Given the clang baseline this might not be needed anymore?
>>>>> Hmm.  While true, looking at 51461114e26, the code is definitely 
>>>>> better
>>>>> written with the tss_page variable and we wouldn't want to go back 
>>>>> to
>>>>> the old form.
>>>>>
>>>>> I think that I'll simply drop the comment.
>>>>>
>>>>> ~Andrew
>>>>>
>>>>> P.S.
>>>>>
>>>>> Generally speaking, because of the RELOC_HIDE() in this_cpu(), any 
>>>>> time
>>>>> you ever want two accesses to a variable, it's better (code gen 
>>>>> wise) to
>>>>> construct a pointer to it and use the point multiple times.
>>>>>
>>>>> I don't understand why there's a RELOC_HIDE() in this_cpu().  The
>>>>> justification doesn't make sense, but I've not had time to explore 
>>>>> what
>>>>> happens if we take it out.
>>>> There's no justification in xen/percpu.h?
>>>
>>> Well, it's given in compiler.h by RELOC_HIDE().
>>>
>>> /* This macro obfuscates arithmetic on a variable address so that gcc
>>>    shouldn't recognize the original var, and make assumptions about it 
>>> */
>>>
>>>
>>> But this is far from convincing.
>>>
>>>>
>>>> My understanding is that we simply may not expose any accesses to 
>>>> per_cpu_*
>>>> variables directly to the compiler, or there's a risk that it might 
>>>> access
>>>> the "master" variable (i.e. CPU0's on at least x86).
>>>
>>> RELOC_HIDE() doesn't do anything about the correctness of the pointer
>>> arithmetic expression to make the access work.
>>>
>>> I don't see how a correct expression can ever access CPU0's data by
>>> accident.
>>
>> Hmm, upon another look I agree. I wonder whether we inherited this from
>> Linux, where in turn it may have been merely a workaround to deal with
>> preemptible code not correctly accessing per-CPU data (i.e. not
>> accounting for get_per_cpu_offset() not being stable across 
>> preemption).
>> Yet then per_cpu() would have been of similar concern when "cpu" isn't
>> properly re-fetched after any possible preemption point ...
> 
> Probably inherited with a stripped-down comment on top of RELOC_HIDE, 
> see [1]. In a way it does make sense that the compiler may decide to 
> optimize based on this assumption, though I don't know whether wrapping 
> is meant to happen with per-CPU variables.

I wouldn't call it "meant to", but wrapping certainly is possible. This
is arch-independent code, and hence whether any wrapping would occur
depends on the VA layout of the individual architectures.

Jan

