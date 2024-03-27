Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D788E53F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698580.1090431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpU7i-0007tN-Va; Wed, 27 Mar 2024 14:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698580.1090431; Wed, 27 Mar 2024 14:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpU7i-0007rP-SK; Wed, 27 Mar 2024 14:19:26 +0000
Received: by outflank-mailman (input) for mailman id 698580;
 Wed, 27 Mar 2024 14:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpU7h-0007rF-KG
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:19:25 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02894f77-ec45-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 15:19:23 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso926208966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 07:19:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w2-20020a1709067c8200b00a4720ce2e75sm5453491ejo.129.2024.03.27.07.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 07:19:22 -0700 (PDT)
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
X-Inumbo-ID: 02894f77-ec45-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711549163; x=1712153963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzySVz8jHI3rWBmAmd7slHPi22PNQrHAEXn3r2NXpDQ=;
        b=GB2BZyYQ7vfxrulcwrT3fQ9Ile8oK/iWRMElLTw423YlkJPw6DdgMsm09Rn/1sc7+t
         5MH/VSqqBeoOwk4SonORI4msNPqFSPbCQgvMsI021y70O4JDmpn/zSDDUud+XYUfL1BE
         VsiV/ki16onv2Ukakb95taIiXYOgnwdulmtkxSndRMrxHed2PBSPjkgA4+VKJG7QAIlW
         1jGaGkD4juoMZMUrVzEZgc9JteAfZ4CedpD99Su/7/fD7Nsp8nJYMRYq2FfkfFMIlRRg
         j+Zx3BJ7jZvCmx3e5bNh61UHazehtxL3Pq7TflXu0rEh71AbQJNMbhxQxJxKgN6BUeWV
         H0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549163; x=1712153963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzySVz8jHI3rWBmAmd7slHPi22PNQrHAEXn3r2NXpDQ=;
        b=Jtzq+9uEbelT0nACtCf0/myyHR4zY6NJWBPsr6vS2arOH69fHEaCYKDaPxWIyY/gfH
         uNfyk8xaxiTpdIHX8+1SLLCbMevu9rA211z1xcc6YEvBR/ykgCN1W27LAdVDZMS6d5qH
         J2MrwyVU5DJWFrEz+qAGuySi8UIpRgRFU5rg8DFBeP5NSaTcXs8SBvJT3ZcRGxJabG+t
         4ivxYbnRj2Dh7B/G6IhpXCLLnMBzcKpMSZqPG8Tu6gZsB3I/sJs4TRcv727bMIhoocxw
         Eo075MLRXa4bHUFN/a2s2dsnpFBeZxF+X8PjBNxaSKBocUi+0it9LdWzsphlUjkcsujr
         Ossg==
X-Forwarded-Encrypted: i=1; AJvYcCVDGmvEnrQZczrOOq1jYI4GuKyTNZychmEI7pXe3IU61O2XYVp5/QpRGEIvZK+FO6K03L88R9xvrmy8Cihh9gFphhlWGtT7A/91kdd3vD8=
X-Gm-Message-State: AOJu0YxMLczsStVNEhur6lg1GPYBQ4E0HcqWp3shSmRyKbxdOatWXPGi
	bP9nKkkrQWUaWU2kvsQlTM/+f13EsB0GQ7gExsleIjdCXrca8tRz3G3ETm2qnA==
X-Google-Smtp-Source: AGHT+IETV6LlyH64QTtctYTBAnJxPxxa0VhxGCRMOVDYxwqO88orE7/mQ7EeZmsP5brbItOGhkzGUQ==
X-Received: by 2002:a17:907:31ce:b0:a4d:fe8f:bb93 with SMTP id xf14-20020a17090731ce00b00a4dfe8fbb93mr2391989ejb.30.1711549163038;
        Wed, 27 Mar 2024 07:19:23 -0700 (PDT)
Message-ID: <92754a17-fe02-4050-9ca5-5a1ded3483dc@suse.com>
Date: Wed, 27 Mar 2024 15:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] Revert "xen/x86: bzImage parse kernel_alignment"
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-2-jason.andryuk@amd.com>
 <f1940242-0259-4b4c-baff-2fa73435d1b9@suse.com> <ZgPf_I2CJ7358jbZ@macbook>
 <09c73d19-dda8-44a3-be4f-1644a2bd1a4c@amd.com>
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
In-Reply-To: <09c73d19-dda8-44a3-be4f-1644a2bd1a4c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2024 15:08, Jason Andryuk wrote:
> On 2024-03-27 04:59, Roger Pau Monné wrote:
>> On Wed, Mar 27, 2024 at 08:22:41AM +0100, Jan Beulich wrote:
>>> On 26.03.2024 22:38, Jason Andryuk wrote:
>>>> A new ELF note will specify the alignment for a relocatable PVH kernel.
>>>> ELF notes are suitable for vmlinux and other ELF files, so this
>>>> Linux-specific bzImage parsing in unnecessary.
>>>>
>>>> This reverts commit c44cac229067faeec8f49247d1cf281723ac2d40.
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> Since you keep re-sending this: In private discussion Roger has indicated
>>> that, like me, he too would prefer falling back to the ELF data, before
>>> falling back to the arch default (Roger, please correct me if I got it
>>> wrong). That would make it necessary that the change you're proposing to
>>> revert here is actually kept.
>>
>> Sorry, was meaning to reply yesterday but Jason is very fast at
>> sending new version so I'm always one version behind.
> 
> :)
> 
> I was hoping to finish this up and get it in...
> 
>> IMO the order: ELF note, PHDR alignment, arch default should be the
>> preferred one.
>>
>>> Or wait - what you're reverting is taking the alignment out of the
>>> bzImage header. I don't expect the BSDs to use that protocol; aiui that's
>>> entirely Linux-specific.
>>
>> Yeah, I don't have strong opinions in keeping this, we already do
>> bzImage parsing, so we might as well attempt to fetch the alignment
>> from there if correct:
>>
>> ELF note, bzImage kernel_alignment, ELF PHDR alignment, arch default
> 
> I'm not sure how to handle ELF PHDR vs. arch default.  ELF PHDR will 
> always be set, AFAIU.  Should that always be respected, which means we 
> don't need an arch default?

A value of 0 (and 1) is specifically permitted, to indicate no alignment.
We may take 0 to mean default, but what you suggest below is another
plausible approach. Yet another might be to take anything below PAGE_SIZE
as "use default".

> To include arch default, it would be something like this:
> 
>      if ( parms->phys_align != UNSET_ADDR )
>          align = parms->phys_align;
>      else if ( bz_align )
>          align = bz_align;

Why do you include bz again here? Didn't you previously indicate the
header field can't be relied upon? Which is also why, finally, I committed
this revert earlier today.

Jan

>      else if ( elf->palign > PHYS32_RELOC_ALIGN_DEFAULT )
>          align = elf->palign;
>      else
>          align = PHYS32_RELOC_ALIGN_DEFAULT;
> 
> 
>>> I further meanwhile realized that consulting the ELF phdrs may also be
>>> ambiguous, as there may be more than one. I guess it would need to be the
>>> maximum of all of them then.
>>
>> My suggestion (not sure if I mentioned this before) was to use the
>> alignment of the first LOAD PHDR, which is the one that defines the
>> value of the dest_base field used as the image load start address.
>>
>> Using the maximum of all load PHDRs might be safer.
> 
> I'll find the maximum.
> 
> Thanks,
> Jason


