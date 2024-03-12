Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE0879447
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 13:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691802.1078182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1PH-0008Jv-B7; Tue, 12 Mar 2024 12:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691802.1078182; Tue, 12 Mar 2024 12:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1PH-0008Gl-6e; Tue, 12 Mar 2024 12:38:59 +0000
Received: by outflank-mailman (input) for mailman id 691802;
 Tue, 12 Mar 2024 12:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk1PF-0008Gf-En
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 12:38:57 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1cba2b-e06d-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 13:38:55 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso34361601fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 05:38:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e14-20020a50fb8e000000b00568554e368dsm2352494edq.3.2024.03.12.05.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 05:38:54 -0700 (PDT)
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
X-Inumbo-ID: 7d1cba2b-e06d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710247134; x=1710851934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crhzudeg+owq12jfxhAg6gd30PuK4etyoOCUD402nQg=;
        b=HKhpsphbXAgWuvFgj27FNsXKmJS2CNQmo2M0fG/CTMYEr9ziA4/DCHDcmb4VMnTEIc
         /CWJXsgp34yoLJuQm5CqWhRgr/cEEXmB8MMv9LmAmeqCI25jEmAE5dLjlit+EHOXAhH7
         bwUxpES5utHLjCqQWqYx3Z1x8bhBTMnLGrAJfPtOBUbh/dP5CEe8uiuH3n/+kvv7kKXj
         S9G4WJdu9QWHTyWz7pq8batZUPoKCpTrFY1q0hpUpsy4QICmFqVb7PGjbGU9nn8hA2HA
         9jIIvblHTsbw75uSUPSnbHo5JeDpdDLCbSjcfN6P2JuyglVTbAELnMG6RiFdrCt3UPC1
         z3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247134; x=1710851934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crhzudeg+owq12jfxhAg6gd30PuK4etyoOCUD402nQg=;
        b=qWhwDONqGpA6aB3nwsB0jp+SgKz2KEUeseavYHeVD5odXp+J71Or91XCEbEcS0W9JJ
         nAFyG8OgzM9fMAGmnHErznGntGPEc7r14Tad/8+v31sJA6MaW7XARlKdjryEGZgtE8Sh
         EdV/2soO1e7uDBKGEqtgPoE3gzBIKjmSUwf46279KQhw9psO21DDPI8M2uDR2Wn+YdcA
         LVAQxApojE3BtvuxaBw0+LUUy1nBB1n1CCz1QGTxLHRd4lYj2JkewHpXL+Otm3FCtbtE
         aXnCZeoh+sC3Gzwc4xQYuf8RVhUQUIyo2mYNVEzwtw44G9AiUr6SF9c0zuKdkhgy+G6l
         ExUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzfzwyuSwqc0dcXhepyoMae85NpJOo0QE5FxrMzm74HaKSyM3UqDFDHQg+DAV7hv/ppZDTYTigdBkp6JHo+B6UKr0Jh/ArID4x6PcLvo4=
X-Gm-Message-State: AOJu0YzVivd184AXVUDjxKg/xFURd1LTVftUMg7+tO8/7a1zZYNh3LzV
	ttqBwzp3qgLxmSy9z6DTftWjaOu1EKdaDOmXxcAxmettFkAuZph1sPo3MGB9SQ==
X-Google-Smtp-Source: AGHT+IE7CMuSKvsY6yJAOq6tRaLpQ2poDTaUNRYRebZp/PPz6PL8tqMYAKXhCcE9IDU1EF1I5bNf7w==
X-Received: by 2002:a2e:9612:0:b0:2d4:4bec:3c1b with SMTP id v18-20020a2e9612000000b002d44bec3c1bmr1272333ljh.32.1710247134513;
        Tue, 12 Mar 2024 05:38:54 -0700 (PDT)
Message-ID: <2a04315c-7bb8-4985-8aca-bece9d0d535e@suse.com>
Date: Tue, 12 Mar 2024 13:38:53 +0100
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
 <ZfBERyqQ7Ous3nGE@mail-itl>
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
In-Reply-To: <ZfBERyqQ7Ous3nGE@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 13:02, Marek Marczykowski-Górecki wrote:
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
> 
> In that case, is the approach with
> iommu_get_extra_reserved_device_memory() okay (and a comment that it
> will have a side effect...) ?

Counter question: You not having gone that route despite our talking
about it on Matrix must have a reason. When seeing this approach I
concluded something got in the way. What's the deal?

>>> but I'm
>>> unsure whether the intention is for the interface to always be used
>>> against RAM.
>>
>> I think we can work from that assumption for now.
> 
> Ok, I'll add a comment about that. I guess, if needed in the future,
> iommu_add_extra_reserved_device_memory() can gain an extra parameter to
> distinguish RAM from non-RAM mappings.
> 
> BTW should e820_change_range_type() return 1 in case of mapping already
> having the right type? Otherwise, if one wants to use
> iommu_add_extra_reserved_device_memory() on already reserved memory, the
> e820_change_range_type() would fail.

You raised that question on Matrix yesterday, iirc, and I left it
unanswered there because it takes archeology to find the answer (or at
least get closer to one). And, please don't get me wrong, you could as
well do that yourself. (My vague recollection from having dealt with
similar code in Linux is that yes, in the example given the function
ought to indeed have failed back then. Depending on present uses etc
it may well be that we could reconsider, though.)

Jan

