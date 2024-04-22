Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EC88ACC55
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 13:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709929.1108972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rysCi-0001dV-Ka; Mon, 22 Apr 2024 11:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709929.1108972; Mon, 22 Apr 2024 11:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rysCi-0001af-HT; Mon, 22 Apr 2024 11:51:24 +0000
Received: by outflank-mailman (input) for mailman id 709929;
 Mon, 22 Apr 2024 11:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rysCh-0001aZ-6x
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 11:51:23 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2afd154-009e-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 13:51:20 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41a523e27e0so6310705e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 04:51:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m5-20020a7bca45000000b0041a68d4fe76sm1751947wml.0.2024.04.22.04.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 04:51:19 -0700 (PDT)
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
X-Inumbo-ID: a2afd154-009e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713786680; x=1714391480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rpk1U5c9hiffqJKPxnrT1DTjloMV6qn45nXzimC4icY=;
        b=EkiZhfraaqgEJAeK/QYpoC0XGnkutK4VPqBa3p1syG/r0R4inbIEvFWvKV+zmShu/V
         jEyq99X1f7wi7nS4fXG1k81Pvdrlx+TZnUfDWEQdswJ2mBjYjkHDiLmoe0R+4fwiuP8W
         m62SI/nqablnXCaKQ1+I5/2COJD6ra8UY0IIIQDLETS6mmDBJqCyI1x5YuaHHRDoz2TC
         DijLfx7SYSwwhp7bPf1vLo6MC02bRCZGpZPievQZK9G2DH1k87HOvtkq6uCiExeLHimQ
         iBpmkgl4uGm0aHgMtaw9LseFMN8IU0ju37Uya8XAZriwxOF2qJklkcECkwi1cE2ZgLcE
         PEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713786680; x=1714391480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpk1U5c9hiffqJKPxnrT1DTjloMV6qn45nXzimC4icY=;
        b=en+CQ4ynn+yTyGO1QHMUrFKCFQ4STlk9mrPgvk5xlO7wX+enWy6tns9VK+MKqBEuAr
         MbvNEa6H6nBVUKcJsESq427quB+AcuICPYSwlvkXihyV1gDc1cQ9T4Atcve4AB0F5IYC
         89PRdTVpIAPnlzn113VdTpq8ruymn1HOu1ua68uQ/CYaJOrJ9b/S5lffXlKxQop5nWGU
         x21rPtC7QWqaw8RlnHz3NtP06nkIAixvbjuR7W/mbhY0LRbRFLecNm5sZABppM+cmHog
         cmX6b9AF6RS5j88WkVg1TZiFaCXWR1Do5bT2wLJYl9KxXKNbL1/OskvqAjxnuNcsOXcb
         o5vw==
X-Forwarded-Encrypted: i=1; AJvYcCXSQs8QpuH5oiZpnTT3fE85ZgPzGcEW0agmTms+GBCC0kOoenhveh6uKO6pqMDmgIwjOeZLV5AuW+hWDI2ynY/rGwCkCA5VBcDzYtIXKR8=
X-Gm-Message-State: AOJu0Yyo4muVvA5X1SGNOY28fEnYqYHgs2h6pWvhNzuSpBPEyr4d/kwH
	ow1oO2vJUH0gzwMk/0gyU9fBNVmoT8tGHV+HOSLDspizQXhYWhrGhvIaMcvtEQ==
X-Google-Smtp-Source: AGHT+IEKHix+Xi218VfIXNj4m/0BcUvnJgvk5Ds7HvgPnFyAhexhDq3HmDcin2kLXukVH+MMIED1Bg==
X-Received: by 2002:a05:600c:1d05:b0:41a:4a8c:8a3d with SMTP id l5-20020a05600c1d0500b0041a4a8c8a3dmr2787246wms.28.1713786680174;
        Mon, 22 Apr 2024 04:51:20 -0700 (PDT)
Message-ID: <83a9837b-dfec-41f4-ae7d-d81d800b45aa@suse.com>
Date: Mon, 22 Apr 2024 13:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com> <ZiJMj00By3X8FskL@macbook>
 <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com> <ZiYXtJcefv-iMpAj@macbook>
 <f00e0b8b-0e45-45b1-9151-6c16c5a70d76@suse.com> <ZiZA0-n6vbOgu-_1@macbook>
 <e5763200-fa87-46ec-8746-c7b4215a28ff@suse.com> <ZiZLX15vpPT_uDJ_@macbook>
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
In-Reply-To: <ZiZLX15vpPT_uDJ_@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2024 13:34, Roger Pau Monné wrote:
> On Mon, Apr 22, 2024 at 12:57:55PM +0200, Jan Beulich wrote:
>> On 22.04.2024 12:49, Roger Pau Monné wrote:
>>> On Mon, Apr 22, 2024 at 10:25:40AM +0200, Jan Beulich wrote:
>>>> On 22.04.2024 09:54, Roger Pau Monné wrote:
>>>>> On Fri, Apr 19, 2024 at 04:34:41PM +0200, Jan Beulich wrote:
>>>>>> On 19.04.2024 12:50, Roger Pau Monné wrote:
>>>>>>> On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
>>>>>>>> On 19.04.2024 12:02, Roger Pau Monne wrote:
>>>>>>>>> Livepatch payloads containing symbols that belong to init sections can only
>>>>>>>>> lead to page faults later on, as by the time the livepatch is loaded init
>>>>>>>>> sections have already been freed.
>>>>>>>>>
>>>>>>>>> Refuse to resolve such symbols and return an error instead.
>>>>>>>>>
>>>>>>>>> Note such resolutions are only relevant for symbols that point to undefined
>>>>>>>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
>>>>>>>>> and hence must either be a Xen or a different livepatch payload symbol.
>>>>>>>>>
>>>>>>>>> Do not allow to resolve symbols that point to __init_begin, as that address is
>>>>>>>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
>>>>>>>>> resolutions against it.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>>> ---
>>>>>>>>> Changes since v1:
>>>>>>>>>  - Fix off-by-one in range checking.
>>>>>>>>
>>>>>>>> Which means you addressed Andrew's comment while at the same time extending
>>>>>>>> the scope of ...
>>>>>>>>
>>>>>>>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>>>>>>>>                      break;
>>>>>>>>>                  }
>>>>>>>>>              }
>>>>>>>>> +
>>>>>>>>> +            /*
>>>>>>>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>>>>>>>>> +             * livepatch payloads don't have init sections or equivalent.
>>>>>>>>> +             */
>>>>>>>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>>>>>>>>> +                      st_value < (uintptr_t)&__init_end )
>>>>>>>>> +            {
>>>>>>>>> +                printk(XENLOG_ERR LIVEPATCH
>>>>>>>>> +                       "%s: symbol %s is in init section, not resolving\n",
>>>>>>>>> +                       elf->name, elf->sym[i].name);
>>>>>>>>
>>>>>>>> ... what I raised concern about (and I had not seen any verbal reply to that,
>>>>>>>> I don't think).
>>>>>>>
>>>>>>> I've extended the commit message to explicitly mention the handling of
>>>>>>> bounds for __init_{begin,end} checks.  Let me know if you are not fine
>>>>>>> with it (or maybe you expected something else?).
>>>>>>
>>>>>> Well, you mention the two symbols you care about, but you don't mention
>>>>>> at all that these two may alias other symbols which might be legal to
>>>>>> reference from a livepatch.
>>>>>
>>>>> I'm having a hard time understanding why a livepatch would want to
>>>>> reference those, or any symbol in the .init sections for that matter.
>>>>> __init_{begin,end} are exclusively used to unmap the init region after
>>>>> boot.  What's the point in livepatch referencing data that's no
>>>>> longer there?  The only application I would think of is to calculate
>>>>> some kind of offsets, but that would better be done using other
>>>>> symbols instead.
>>>>>
>>>>> Please bear with me, it would be easier for me to understand if you
>>>>> could provide a concrete example.
>>>>
>>>> The issue is that you do comparison by address, not by name. Let's assume
>>>> that .rodata ends exactly where .init.* starts. Then &__init_begin ==
>>>> &_erodata == &__2M_rodata_end. Access to the latter two symbols wants to
>>>> be permitted; only __init_begin and whatever ends up being the very first
>>>> symbol in .init.* ought to not be referenced.
>>>
>>> Hm, I guess I could add comparison by name additionally, but it looks
>>> fragile to me.
>>
>> It looks fragile, yes. Thing is that you're trying to deal with this when
>> crucial information was lost already. Or wait - isn't the section number
>> still available in ->st_shndx?
> 
> But that's the section number of the to be resolved symbol?  In the
> livepatch payload it would for example appear as:
> 
> 0000000000000000       F *UND*	0000000000000000 .hidden setup_boot_APIC_clock
> 
> With undefined section.
> 
> It's possible I'm not following, is there a way to get the section
> number of the current Xen symbols, and then correlate it with the
> .init section?

Hmm, yes, looks like I was forgetting that livepatch resolves symbols
using kallsyms data, not Xen's ELF symbol table.

Jan

