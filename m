Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43B87970C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691899.1078454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3eb-0001A0-OE; Tue, 12 Mar 2024 15:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691899.1078454; Tue, 12 Mar 2024 15:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3eb-00017B-Kl; Tue, 12 Mar 2024 15:02:57 +0000
Received: by outflank-mailman (input) for mailman id 691899;
 Tue, 12 Mar 2024 15:02:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk3ea-000173-4U
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:02:56 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5ee11d-e081-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 16:02:54 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a4627a7233aso8620466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:02:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e27-20020a170906315b00b00a46220c3c39sm2426599eje.39.2024.03.12.08.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:02:53 -0700 (PDT)
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
X-Inumbo-ID: 9a5ee11d-e081-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710255773; x=1710860573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3gCzu8ARyqrSY7VwQNo7wczR4eVQYg4J0ukImiGafs=;
        b=EGlVi4h3ruiNi8WlEGuQEEQsT9nJMHQ2cLMc8sK44Qmmyjyq3DpIVNR9yjge10KkPy
         mdHHULqmJeOLy51pdNtmLdflSSWx/srh/u75+qUQbP3Ne8SvOfUqD/WtBVwASe5Fyndd
         kUuRTS1GhOmgwBHSyQtx1KP8krFgn/0vQTm2RvqvHEXDdwAwK7Fz+LzhC5+e81r5v9mo
         La9YJwq60uYPmH7Lr4YHuFV+KC+aBeoAhiel8EHhSpHgDvl0ww6UyUyETjbzr5rOYRdj
         5ognTSuYfagXMOkkdRuIxooS7t4SKFVFbohGLzAalUXzOBdnLHGhCK5NgrktHnLoWMCe
         MTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710255773; x=1710860573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3gCzu8ARyqrSY7VwQNo7wczR4eVQYg4J0ukImiGafs=;
        b=fr/Ud69GwgIpKAHsorn7+oUjpMxeg2AR46PfV/i5C0dljyqxYw5eX2ZUU5ExizfXmO
         VLRe5ca7nhwU7VtJtI///Q0MkaLVrAlJaqOj/9Kami2NaIsV+WJ8rRk375oiz9sVYj12
         XX/ea0DBx0GnYO9UjMv+9UqyDbx/SlT+3k9GuRdh3fwzZBT4+fb6x0hxaMjBMr41lrbr
         TeZeBQdamSSbrbIcgX70cpXePCBvDBlz9PkhovqRzgbdjFNkTrsRWAtsIGN6Ml1ifNNu
         /2aK1d7KpnKKyqt6kVRXHZ24vxsfoww0NFsDljEQ5XVIbYqJhTk2dV6WQ+cxWFpieLvJ
         bLUw==
X-Forwarded-Encrypted: i=1; AJvYcCWXEHUee8aIWLqlsLB8FXVtgUQWaW/bby9aKQSOSwn+v4reDDooBE10GXHsXpBWxbmkaCUl79ZrrgjyAfBAi3L1AIxP9kpHUo9F/YIB5FE=
X-Gm-Message-State: AOJu0Yy/ilnykSVVRGp7puzdWdKcgfvab0H9Kg2WgjjwMNkkgyZWR3w7
	uMlZTgoPYlJO9g0XObW02g9ZD94LLwLiCieb5Fzxq+9OjKSAiN2A/8LEcY3+Kg==
X-Google-Smtp-Source: AGHT+IFHePa92tGkLK3FNGG1AH8RJXDMwqEqsyI1z1ia3ohmOSDqPivvlBtSEXG3YS4TG8zYtOwzmQ==
X-Received: by 2002:a17:906:3e0c:b0:a43:cbed:950d with SMTP id k12-20020a1709063e0c00b00a43cbed950dmr7213635eji.38.1710255773609;
        Tue, 12 Mar 2024 08:02:53 -0700 (PDT)
Message-ID: <6a3f66a7-bd5c-4355-8847-47bfc9033ab3@suse.com>
Date: Tue, 12 Mar 2024 16:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook> <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
 <ZfBlklSndB3djVJ2@mail-itl> <6286d582-ef92-47c3-8bb1-b8f2d3270a4f@suse.com>
 <ZfBrXqn_Sr_g4Hnr@mail-itl>
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
In-Reply-To: <ZfBrXqn_Sr_g4Hnr@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 15:49, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 12, 2024 at 03:37:15PM +0100, Jan Beulich wrote:
>> On 12.03.2024 15:24, Marek Marczykowski-Górecki wrote:
>>> On Tue, Mar 12, 2024 at 11:53:46AM +0100, Jan Beulich wrote:
>>>> On 12.03.2024 11:24, Roger Pau Monné wrote:
>>>>>> --- a/xen/arch/x86/setup.c
>>>>>> +++ b/xen/arch/x86/setup.c
>>>>>> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>>>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>>>>>                                    RANGESETF_prettyprint_hex);
>>>>>>  
>>>>>> +    /* Needs to happen after E820 processing but before IOMMU init */
>>>>>> +    xhci_dbc_uart_reserve_ram();
>>>>>
>>>>> Overall it might be better if some generic solution for all users of
>>>>> iommu_add_extra_reserved_device_memory() could be implemented,
>>>>
>>>> +1
>>>>
>>>>> but I'm
>>>>> unsure whether the intention is for the interface to always be used
>>>>> against RAM.
>>>>
>>>> I think we can work from that assumption for now.
>>>
>>> One more question - what should be the error handling in this case?
>>
>> My first reaction here is - please first propose something that's
>> sensible from your perspective, and then we can go from there. That's
>> generally easier that discussion without seeing involved code.
>> However, ...
>>
>>> At
>>> this stage, if reserving fails, I can still skip giving this range to
>>> the IOMMU driver, which (most likely) will result in IOMMU faults and
>>> in-operational device (xhci console). Since I don't know (theoretically)
>>> what driver requested the range, the error message can only contain an
>>> address and device, so will be a bit less actionable for the user
>>> (although it should be quite easy to notice the BDF being the XHCI one).
>>>
>>> Panic surely is safer option, but less user friendly, especially since
>>> (due to the above) I cannot give explicit hint to disable XHCI console.
>>
>> ... reading this I was meaning to ...
>>
>>> And kinda independently - I'm tempted to add another field to `struct
>>> extra_reserved_range` (and an argument to
>>> `iommu_add_extra_reserved_device_memory()`) - textual description, for
>>> the error reporting purpose.
>>
>> ... suggest minimally this. We may want to go farther, though: The party
>> registering the range could also supply a callback, to be invoked in
>> case registration fails. That callback could then undo whatever is
>> necessary in order to not use the memory range in question.
>>
>> That said - isn't all of this over-engineering, as the allocated memory
>> range must have come from a valid RAM region? In which case a simple
>> BUG_ON() may be all that's needed (and will never trigger in practice,
>> unless we truly screwed up somewhere)?
> 
> In this case (with a single use of
> iommu_add_extra_reserved_device_memory()), it will be valid RAM. But
> reserving may fail for other reasons too, for example overflow of the
> E820 map.
> 
> Undoing things certainly is possible, but quite complicated (none of the
> involved serial console APIs support disabling/unregistering a console).

True. I was rather thinking of disabling the actual I/O paths.

Jan

> Given the simplicity of the workaround user can do (not enabling xhci
> console), I don't think it's worth going this route.
> 
> Anyway, I'll post v2 with some version of the above and we can continue
> discussion there.
> 


