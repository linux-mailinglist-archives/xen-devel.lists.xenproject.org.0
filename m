Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050787967F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691886.1078413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3Fo-00030n-33; Tue, 12 Mar 2024 14:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691886.1078413; Tue, 12 Mar 2024 14:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3Fo-0002z6-0M; Tue, 12 Mar 2024 14:37:20 +0000
Received: by outflank-mailman (input) for mailman id 691886;
 Tue, 12 Mar 2024 14:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk3Fm-0002yy-Ve
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:37:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062a580f-e07e-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 15:37:17 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a4645485da6so101287366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 07:37:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 kk28-20020a170907767c00b00a4547925e3asm3986100ejc.141.2024.03.12.07.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:37:16 -0700 (PDT)
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
X-Inumbo-ID: 062a580f-e07e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710254236; x=1710859036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWaDcU0FZBzF9S4NRN/c7rzjyNYyjHXBflnxtbvx+Ac=;
        b=GXLBoLl8mkAqwA9NfAadGizFBMKE+On4hL/qU+UEUcqL5B4IygK2fLHJRSVecsxtbl
         NHo2uLULoYsV4pi3LXcXDDxamd8DtjpCgVmR1B1UXhcEvUJLpPthnAAPC+028InaMrot
         5yqOFB1UvR+12sxD1vEjWeR3IdYfLPfJQIUvjOjeFXrNzLOJFq2JinT0QkLXrZ4arWme
         ErFzyLGMfrFVcQxWk1qVKLnJxn1fVRjhLp/wofhMSERvlz3hiuHTGySZBvTVWmx02CGE
         ZWH5TFOsfuTaz4LJfefAL5Seexf+jRMKxt0t1sN8pCZZSRuehbDvJ+sgcEMWyD9MTAIR
         uPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710254236; x=1710859036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWaDcU0FZBzF9S4NRN/c7rzjyNYyjHXBflnxtbvx+Ac=;
        b=ExKnnWCyjX0WI7JbALMhJ/PRH/hTuXJn24wX3AknCELzWFRnCdK3RDSvmUDOnX+3eU
         zlIcDgtG3ba6NlrV+3hXZxUVCd3igK8A3N6+MZDNkBDtm+T7IEC1JzCA/c8Sk3OR1bzc
         2ULzE+k4iRktxNU5M3WEPwNU+5o0M29zWcuXwr/YJuxRCmF+4u2Hsjjymc/5SBHd6InA
         7B2oHVlaH1wJfNT2kt1J+G/ESV1+Xw1MGirUo6Ah9dEU6A3vlnIHVfKOprbiAtuBwxbW
         CfZk36gL1o586THLcttECJUwxSQSUGFZlzPeqa98w8vn7v53y2uHACdchbYW5bl4vonq
         ODyw==
X-Forwarded-Encrypted: i=1; AJvYcCVKTpijQCbWMy0BTr/dXbaas4W6evSuIy1sBjG4N2wn8u3yMHB0o0yWYsNhHMneoL/eXjLp+gogyQafVMotyzGS61mx6s6hd5KQCLqihMM=
X-Gm-Message-State: AOJu0Yy3zlzFGzFYsJ/vuhgNXIOxVkoULppQCRqolVstDiMqa9BruD4E
	F4pCSuj65Zy3enZTQT/kr9UHWLeYyaaUNSgpAu91R7GtZpT+HfvnpTL0Y+RHDw==
X-Google-Smtp-Source: AGHT+IGyT1N1ArT6wfbi4oBxSpAokhc2hzaioChczY5/FHl8YM7G9M2aFWMiBDCYmWBmklMKlqqHDA==
X-Received: by 2002:a17:907:d30b:b0:a3e:b523:90b with SMTP id vg11-20020a170907d30b00b00a3eb523090bmr7594933ejc.14.1710254236414;
        Tue, 12 Mar 2024 07:37:16 -0700 (PDT)
Message-ID: <6286d582-ef92-47c3-8bb1-b8f2d3270a4f@suse.com>
Date: Tue, 12 Mar 2024 15:37:15 +0100
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
 <ZfBlklSndB3djVJ2@mail-itl>
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
In-Reply-To: <ZfBlklSndB3djVJ2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 15:24, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 12, 2024 at 11:53:46AM +0100, Jan Beulich wrote:
>> On 12.03.2024 11:24, Roger Pau Monné wrote:
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>>>                                    RANGESETF_prettyprint_hex);
>>>>  
>>>> +    /* Needs to happen after E820 processing but before IOMMU init */
>>>> +    xhci_dbc_uart_reserve_ram();
>>>
>>> Overall it might be better if some generic solution for all users of
>>> iommu_add_extra_reserved_device_memory() could be implemented,
>>
>> +1
>>
>>> but I'm
>>> unsure whether the intention is for the interface to always be used
>>> against RAM.
>>
>> I think we can work from that assumption for now.
> 
> One more question - what should be the error handling in this case?

My first reaction here is - please first propose something that's
sensible from your perspective, and then we can go from there. That's
generally easier that discussion without seeing involved code.
However, ...

> At
> this stage, if reserving fails, I can still skip giving this range to
> the IOMMU driver, which (most likely) will result in IOMMU faults and
> in-operational device (xhci console). Since I don't know (theoretically)
> what driver requested the range, the error message can only contain an
> address and device, so will be a bit less actionable for the user
> (although it should be quite easy to notice the BDF being the XHCI one).
> 
> Panic surely is safer option, but less user friendly, especially since
> (due to the above) I cannot give explicit hint to disable XHCI console.

... reading this I was meaning to ...

> And kinda independently - I'm tempted to add another field to `struct
> extra_reserved_range` (and an argument to
> `iommu_add_extra_reserved_device_memory()`) - textual description, for
> the error reporting purpose.

... suggest minimally this. We may want to go farther, though: The party
registering the range could also supply a callback, to be invoked in
case registration fails. That callback could then undo whatever is
necessary in order to not use the memory range in question.

That said - isn't all of this over-engineering, as the allocated memory
range must have come from a valid RAM region? In which case a simple
BUG_ON() may be all that's needed (and will never trigger in practice,
unless we truly screwed up somewhere)?

Jan

