Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 729FEB0D8EE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052464.1421204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBl5-0003GC-B2; Tue, 22 Jul 2025 12:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052464.1421204; Tue, 22 Jul 2025 12:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBl5-0003Dg-7C; Tue, 22 Jul 2025 12:06:11 +0000
Received: by outflank-mailman (input) for mailman id 1052464;
 Tue, 22 Jul 2025 12:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueBl4-0003Da-GR
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:06:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4004f711-66f4-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:06:08 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so3235072f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:06:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6f533csm75537235ad.222.2025.07.22.05.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:06:07 -0700 (PDT)
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
X-Inumbo-ID: 4004f711-66f4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753185967; x=1753790767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BQz0kqFCHOrLPBfTYlnfXn87899eC4H9/K8zWppr19I=;
        b=BNf1n5NuUchqeUqasCOmXtKJ9QtBzV5Xa9XNomjgqKVW7J2FCInSRxiftWi6H8dzJ1
         IQHX0cwq9wc7yP/HSprSEndnEiDfQGe99oyJgE1S10LHE35yCL11EIXsEZYNsAjbIhi/
         Ai2pHiJbH9UpuY9U9IzbW9QsWfBdty/8TqEflpA3obpBxyO521H+QbSxzSv307rh/kkf
         fXkMJvOE/xISZ/clNoZWP3YFTZeUYiLwGlDRbF2xbBcLVukU3h1Ze87fU7FmZBu8/vCD
         sFsTn4r6FsrylKPgjXOTiCR2gao8nPAf62ViAkfIce10VqYhWhIBBKqU9fHU3oLdg3ro
         lPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185967; x=1753790767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQz0kqFCHOrLPBfTYlnfXn87899eC4H9/K8zWppr19I=;
        b=EuNdnFhAcNW/Bw+xh2Bo6N1ZiHRXYhDhLDMUV+cWA/DPoVykKofrPoKXJs7sBEScDY
         S5qV+huiU3by+ICmC8zgCn3wq1n/fnlz2+eSO7ijndAZMPuLsOpppHl6vk0qqIARWNZ9
         pQOYrG6FWiyWUOrpc7qh24tovDoC2j6egMPUEIphp2LGDshwnOZmicoGA8ZzJg15xlHv
         lxcTM46zJSH5y20tZ2csBS38CAdbpymfYuxsmvpVsaExBiz3LUWchRRyRULHEjNmhh6N
         hRYGpAQZqAkObGpbKklXsmIf9lJ3RXUYwTUZAD/q/1k7iYjyd9MaD8thdilwvh0+2WLN
         eHFg==
X-Forwarded-Encrypted: i=1; AJvYcCXijyXAsskPaQva6vRh3MMYS3n/MV5dhnExDV15QmyvwEVic30A06coxcivhMZAGr94M6fYV0lTl8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBklKm1EyIcWbK98g91Ya+Tlo7x4k5ZU/x2FyjP6YKvFVUrywk
	spoF1xnlmZyjBqDE7SPnHStNxrBFYOnPqH01csod0uoSUBD1te1Cy1dz2+Wli/8qNA==
X-Gm-Gg: ASbGnctgBCUVtCTP0rjr19aSCZPADO2tAJQyyLR3eEosZGK7eAHiFQ2tu+1aMoANiB1
	WXVNkyUYgbF1fx7sRWvVG4/i1U72O74B0OML2qpkpVOTyZGub4cjVG/f9JEeAt3TWT9F+INgpeY
	WJBV3Hb3yEXTK6t6XgH2bIAYOsa9iS6dZR6mJDQOzv17TIG7hJz8f7wiiLuz0DNfFy3KFw6csJp
	gqrd3FUeP4X4VA4SwVm8g3nwCd2GlFX9ipG/bWdX7WeKbSIg2yrfKU//6FgxKx21dz1J5JSbZi8
	PJeSMSD1cAZhzmZ+r7vGfJUjXSVNroItOf3ljDBk5fW4anPYDE3CTa0NmYIIpx3qcsSo20JlsjJ
	P97KdC/RSz1eJqryaahbmM3Yq3ChR+xv/ErJdt38ReOIoockPVl6O2/wBhhF5Sgwb6kvZb4iZyl
	V5lf606Cs=
X-Google-Smtp-Source: AGHT+IE2uaVZMSdEoIffJsSo0PE81x9hhuWIsfnXIFAjF35RYuCbBDs1Z9VRPexeLbAuSoyhMU6yQA==
X-Received: by 2002:a05:6000:2f87:b0:3b5:def6:4b2 with SMTP id ffacd0b85a97d-3b61b2227e0mr12212239f8f.45.1753185967515;
        Tue, 22 Jul 2025 05:06:07 -0700 (PDT)
Message-ID: <db9e161a-4eb4-4806-857a-abced7bad304@suse.com>
Date: Tue, 22 Jul 2025 14:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>
 <9dfc64b3-7dda-4620-9da6-388cecc3b9ad@gmail.com>
 <b669f089-f0a1-4d46-a508-d8be8ea28975@suse.com>
 <52accd52-a363-4545-8e5c-0a5de3ca8eeb@gmail.com>
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
In-Reply-To: <52accd52-a363-4545-8e5c-0a5de3ca8eeb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 14:03, Oleksii Kurochko wrote:
> On 7/21/25 3:39 PM, Jan Beulich wrote:
>> On 18.07.2025 16:37, Oleksii Kurochko wrote:
>>> On 7/2/25 12:28 PM, Jan Beulich wrote:
>>>> On 02.07.2025 12:09, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>>>>>    {
>>>>>>        return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>>>>    }
>>>>>> +
>>>>>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>>>>>> +{
>>>>>> +    ASSERT_UNREACHABLE();
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>>>>>> +                                                      unsigned long nr)
>>>>>> +{
>>>>>> +    unsigned long x, y = page->count_info;
>>>>>> +    struct domain *owner;
>>>>>> +
>>>>>> +    /* Restrict nr to avoid "double" overflow */
>>>>>> +    if ( nr >= PGC_count_mask )
>>>>>> +    {
>>>>>> +        ASSERT_UNREACHABLE();
>>>>>> +        return NULL;
>>>>>> +    }
>>>>> I question the validity of this, already in the Arm original: I can't spot
>>>>> how the caller guarantees to stay below that limit. Without such an
>>>>> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
>>>>> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
>>>>> any limit check.
>>>>>
>>>>>> +    do {
>>>>>> +        x = y;
>>>>>> +        /*
>>>>>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>>>>>> +         * Count == -1: Reference count would wrap, which is invalid.
>>>>>> +         */
>>>>> May I once again ask that you look carefully at comments (as much as at code)
>>>>> you copy. Clearly this comment wasn't properly updated when the bumping by 1
>>>>> was changed to bumping by nr.
>>>>>
>>>>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>>>>>> +            return NULL;
>>>>>> +    }
>>>>>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>>>>>> +
>>>>>> +    owner = page_get_owner(page);
>>>>>> +    ASSERT(owner);
>>>>>> +
>>>>>> +    return owner;
>>>>>> +}
>>>> There also looks to be a dead code concern here (towards the "nr" parameters
>>>> here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
>>>> leave out Misra rule 2.2 entirely.
>>> I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
>>> going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
>> Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
>> would be fine. And that's what "dead code" is about.
> 
> Got it.
> 
> So we don't have any SAF-x tag to mark this function as safe. What is the best one
> solution for now if nr argument will be needed in the future for STATIC_SHM=y?

Add the parameter at that point. Just like was done for Arm.

Jan

