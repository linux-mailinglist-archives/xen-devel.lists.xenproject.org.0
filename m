Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3988C3AD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 14:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698091.1089426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp72D-0007dC-FA; Tue, 26 Mar 2024 13:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698091.1089426; Tue, 26 Mar 2024 13:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp72D-0007bA-CG; Tue, 26 Mar 2024 13:40:13 +0000
Received: by outflank-mailman (input) for mailman id 698091;
 Tue, 26 Mar 2024 13:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp72B-0007b2-Tn
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 13:40:11 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c774a6c-eb76-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 14:40:08 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a4a387ff7acso253526266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 06:40:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k18-20020a1709060cb200b00a455d78be5bsm4231683ejh.9.2024.03.26.06.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 06:40:07 -0700 (PDT)
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
X-Inumbo-ID: 5c774a6c-eb76-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711460408; x=1712065208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tg4pmVtm0wTT/oaYBTUaW3mAFjbFCuxbtaRqrXwufLs=;
        b=eg7xzmCOZ6yVWbGswmnlu+leCZZyW0NKxSXOT/sV8g1QXQJ1l7DJoVBoYA8joyU+Gb
         r7u6Ao5MfXd+nEmAkJ6n1Vb1surt7yioWa11vwzRw4zNyAuZnExIms4iENs66wrWcQcg
         8ElDE282WA0myYJjgmAwmFErjdSW3wy412QI152kSB2BMcee9Oyd5G87REKpyj/bvzgf
         RqTdjvgmxzr8YLxRd+s00SAGF8zyAUH3YQSxZBYgMs5E5hzYfURdmDDui2l7bDWM6w/v
         fZ9ZYsElZvBVreHAMJqcZqnF8MvNJ8PxgQ855V72YToTCIv5H7k1Yv+9/DYLDqhV71d4
         94tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711460408; x=1712065208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg4pmVtm0wTT/oaYBTUaW3mAFjbFCuxbtaRqrXwufLs=;
        b=Ire/ty4EE62BGKx/7KxEHuqXDqb6WYJ+yoJx199Rw87rsmpYfLCQRbB/XgOPkIHniM
         B4BUof0vV79cuQm+O6rKO2WtBti/4oglNPFjUR6IOQill78vNUZ1er7uzwFWq4o1q3lX
         c9Kze6YSQEjwr5SUgC5XOlhPL2zt+dZ4eC1a/lbok8CBsQDzeCvV66tih2l+T97q6IcE
         ShU3+1LSU9Azbpmoun2gM5YJD6TfEuMbz2nQlj9BtKZkbbdBx57tZcjglBFESbAH6XKm
         nCHYMhpQeLkJ5H5z1CE6N0Om7HksRAzNdGRfHv2Odm4lDvZg9AXpCgstj4fB5MX5Sb8f
         opQw==
X-Forwarded-Encrypted: i=1; AJvYcCUrNu5nlJJDcQxovqzOpf+PSzd735O0Lr3FeomLN+/8deRpNsEMNjr/U6VrvGqiV1n1osRLxzNMqNL5DdYI5fXrXtbisuQTqPV2YL/yZMw=
X-Gm-Message-State: AOJu0YwI02DpRv1+X3Yxunew+9tJtZavMze7RF7SaR1MgUyza1TDO3Vi
	MA+hNkvd1Q/1W+pa/QDZU0PqTRUsRh5nrdktW/v14QTCktWu0s1UvsK6zsgGpw==
X-Google-Smtp-Source: AGHT+IGLFmztb+e5weZ9ebVyGjnGCgYS+pjJkXdwKwl9/DFPC0AXMNQybaT+3iv3XGS6ZB6LXj1jcw==
X-Received: by 2002:a17:906:a859:b0:a47:53c9:f5b with SMTP id dx25-20020a170906a85900b00a4753c90f5bmr950726ejb.65.1711460408191;
        Tue, 26 Mar 2024 06:40:08 -0700 (PDT)
Message-ID: <b2090ccf-c920-4f71-bbb3-bfca15f76a83@suse.com>
Date: Tue, 26 Mar 2024 14:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-6-jason.andryuk@amd.com>
 <770d3292-34cf-4e21-acb6-bd1f9caf5fef@suse.com>
 <efc5ea8f-d087-4fe0-a5f3-6d1b0a8b48dc@amd.com>
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
In-Reply-To: <efc5ea8f-d087-4fe0-a5f3-6d1b0a8b48dc@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 14:24, Jason Andryuk wrote:
> On 2024-03-26 03:50, Jan Beulich wrote:
>> On 25.03.2024 21:45, Jason Andryuk wrote:
>>> @@ -227,6 +239,27 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>>       case XEN_ELFNOTE_PHYS32_ENTRY:
>>>           parms->phys_entry = val;
>>>           break;
>>> +
>>> +    case XEN_ELFNOTE_PHYS32_RELOC:
>>> +        parms->phys_reloc = true;
>>> +
>>> +        if ( descsz >= 4 )
>>> +        {
>>> +            parms->phys_max = elf_note_numeric_array(elf, note, 4, 0);
>>> +            elf_msg(elf, " = max: %#"PRIx32, parms->phys_max);
>>
>> As indicated before, I consider the = here a little odd.
> 
> I retained = for consistency with other notes:
> ELF: note: PHYS32_RELOC = max: 0x40000000 min: 0x1000000 align: 0x200000
> ELF: note: PHYS32_ENTRY = 0x1000000
> ELF: note: GUEST_OS = "linux"
> 
> I guess whitespace and labels makes it clear, so I'll drop the '='.
> 
>>> +        }
>>> +        if ( descsz >= 8 )
>>> +        {
>>> +            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
>>> +            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
>>> +        }
>>> +        if ( descsz >= 12 )
>>> +        {
>>> +            parms->phys_align = elf_note_numeric_array(elf, note, 4, 2);
>>> +            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
>>> +        }
>>
>> I'd like us to reconsider this ordering: I'm inclined to say that MAX isn't
>> the most likely one a guest may find a need to use. Instead I'd expect both
>> MIN and ALIGN wanting to be given higher priority; what I'm less certain
>> about is the ordering between the two. To keep MIN and MAX adjacent, how
>> about ALIGN, MIN, MAX?
> 
> ALIGN, MIN, MAX works for me.
> 
> On the Linux side, I'm expecting them all to be set:
> ALIGN = CONFIG_PHYSICAL_ALIGN
> MIN = LOAD_PHYSICAL_ADDR
> MAX = KERNEL_IMAGE_SIZE
> 
> You need enough identity page tables to cover up to MAX. 
> LOAD_PHYSICAL_ADDR is used as a minimum, so requesting placement above 
> MIN makes sense to me.

Hmm, setting MIN like this means moving down is precluded. Why would it
not be possible to move a kernel to lower than the default of 16M, when
CONFIG_PHYSICAL_START can be as low as 0? (In fact, I doubt 0 would work
if chosen, but 2M surely does work, as I build some of my Dom0 kernels
that way.)

MAX, otoh, I guess really wants setting as you say, for KERNEL_IMAGE_SIZE
actually being commented upon as mis-named. Just that it now really wants
to be KERNEL_IMAGE_SIZE-1.

Jan

