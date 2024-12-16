Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08169F30B3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857965.1270175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNANV-0005Ro-5s; Mon, 16 Dec 2024 12:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857965.1270175; Mon, 16 Dec 2024 12:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNANV-0005P3-2H; Mon, 16 Dec 2024 12:39:13 +0000
Received: by outflank-mailman (input) for mailman id 857965;
 Mon, 16 Dec 2024 12:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNANT-0005Ox-Ne
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:39:11 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf8fbc96-bbaa-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 13:39:10 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso3249484f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:39:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8015f77sm7989395f8f.26.2024.12.16.04.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 04:39:09 -0800 (PST)
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
X-Inumbo-ID: bf8fbc96-bbaa-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734352750; x=1734957550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JDGBV3lZJKS4peaTPAzvFzuXtWgbTOpf0v8IZbM4KqU=;
        b=YnqEl0xvIvkB+i3R+GoHbCy+neUhL8h/p9oTeryBq0uINkD0d/yQvTAv07quLrBis5
         cRw8hEQOJLdw9W196O8oAjOqArP9vSOnFOBsKv28ZjaSJfB4LhP7DqIJ4RR6Ns7zMghv
         z47YbcZickSiMJFA57j+SliyBOFxrCADScHxS9NOGrorrwvxeGc54M9RwGUrtcbG8Lc7
         qLGslXZGG5ljCrAdTc9bt0E6cVxFaoDe6V2B1aejUcZEnTBgzRipWgPk/AAAn/NLGxGU
         BpuwOjWN1uw0nYyW3CWk175F3EIAy7yu6GSWK4IDbD3e3l30UTFK6XdwPOMnuasXSgUO
         TwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734352750; x=1734957550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDGBV3lZJKS4peaTPAzvFzuXtWgbTOpf0v8IZbM4KqU=;
        b=MJILuU1f0e21TUzv+VStl7F4Ye3M9nBKI2jPb/W5ep+CZ+Rl2rmF7bkKM253rElXrg
         WFzeIN/MWV57fZ/VQC80c85WaMi+16iF8BnGncUdHpuloooTLOsv806F3zsUpL4FUdxf
         YS52VwKSl7gOMpgtlAtZ7CDO8AybTA+iRdspG3IliHDBOCT9eAlVxv0du6TRRAyYizG7
         PimFkPo8xV4gcfFejUirJst2l1Krz1oo55UJrdMB8ATYVQ6xEuMmya9Q3pt5kvTIuql8
         jRG5Ccn+g314Z/ryhdDwYy/VJ2pHLLYbtKml3xxAfNcPC77yTI7f7R+UCEKjCqKyvzpy
         CKhA==
X-Gm-Message-State: AOJu0Yysa5PVAYmGtsD7BkQ8kN71T+Hhox28La7oiGjhrYShH3YEv5KJ
	1l6tSp7Q6CCbxkF8jGFUCQ70dJLzPXcBC4Q8mcLVxjPWDSviYAa+OZ8Qj7GILg==
X-Gm-Gg: ASbGncsHn1gH0eIq+zU/ggyi94yYvOugSVgkooQ7pTsC/kPHLqxybr2wNq0JvkhHe15
	NcLBBMDIzYo142Vs8pTknIl7vyrrZgcew0nRsOfwuozNg0qaWJtZacJ7xpFNPtvEjZEEOHA4Beu
	4Wlfa1zxOAElJ2Hj9qZaNaZw0Nou+O3goxWO5+M1tUXQF/ksiZBysC/lDFIkhkn4qC2uKIfqMF1
	/Ss5pErjPyststXvBmZHTZbOEcrkdRjyh+xZp5kMDL/aR8vupClQ/fdFMdwhv1YyVnOV/tgujyh
	IiCXwxBtoTp8LLH5sdhrAZgbz+km7iPBzkxVfnQXEw==
X-Google-Smtp-Source: AGHT+IFsm9nrCxgZc6AyglyQ54EjDaSfFEOxLfdnFGRcdffKP+Ekhk4uN9k2k7YIUsbAWP0SvqYPYw==
X-Received: by 2002:a5d:5f8b:0:b0:386:3e3c:efd with SMTP id ffacd0b85a97d-3888e0f470bmr9546532f8f.44.1734352749930;
        Mon, 16 Dec 2024 04:39:09 -0800 (PST)
Message-ID: <7f30f105-e13e-4e41-b432-82f9c12760d9@suse.com>
Date: Mon, 16 Dec 2024 13:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libacpi: clear ASL warning about PCI0
To: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
 <2f7a85-67600280-e411-38ee5c40@258420856>
 <c484d9e6-62a4-4575-8cf1-93603533fd49@suse.com>
 <2f7a86-67600f80-8b81-26131fc0@216081513>
 <3f3e9a77-5695-4c91-9fc2-11a3c21605c5@suse.com>
 <2f7a86-67601b00-8b99-26131fc0@216117285>
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
In-Reply-To: <2f7a86-67601b00-8b99-26131fc0@216117285>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 13:19, Ariel Otilibili-Anieli wrote:
> On Monday, December 16, 2024 12:38 CET, Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 16.12.2024 12:31, Ariel Otilibili-Anieli wrote:
>>> On Monday, December 16, 2024 12:01 CET, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>>> On 16.12.2024 11:36, Ariel Otilibili-Anieli wrote:
>>>>> On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>>> On 15.12.2024 16:40, Ariel Otilibili wrote:
>>>>>>> * iasl complains _HID and _ADR cannot be used at the same time
>>>>>>>
>>>>>>> ```
>>>>>>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID
>>>>>>> tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
>>>>>>> Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
>>>>>>> ```
>>>>>>>
>>>>>>> * generally _HID devices are enumerated and have their drivers loaded by ACPI
>>>>>>> * this is from "ASL 2.0 Introduction and Overview" (page 4).
>>>>>>> * removing _ADR, the warning is cleared out.
>>>>>>
>>>>>> Okay, that's the positive aspect. Yet what about the potential fallout thereof?
>>>>>> Can you confirm that there's no risk of regressions with older guest OSes, for
>>>>>> example?
>>>>>
>>>>> OSes that were released after ACPI 2.0 should work [1]; including WinXP: 
>>>>> The 2.0 specs says either _HID or _ADR should be included [2], not both (Section 6.1, page 146).
>>>>
>>>> We must be looking at two different variants of the spec then. My copy says
>>>> "device object must contain either an _HID object or an _ADR object, but can
>>>> contain both." Also still in 2.0c. I agree that in e.g. 6.5 the wording has
>>>> changed. I also agree that the use of "either" doesn't help clarity.
>>>
>>> I looked up 2.0 (July 2000); indeed, it said "can contain both". My bad.
>>>>
>>>>> I chose WinXP because, on another patch, it came up in the discussion [3].
>>>
>>> The change should work down to WinXP: the name _HID is kept.
>>>
>>> ```
>>> $ git grep -B2 -A2 -n PNP0A03
>>> tools/libacpi/dsdt.asl-40-       Device (PCI0)
>>> tools/libacpi/dsdt.asl-41-       {
>>> tools/libacpi/dsdt.asl:42:           Name (_HID, EisaId ("PNP0A03"))
>>> tools/libacpi/dsdt.asl-43-           Name (_UID, 0x00)
>>> tools/libacpi/dsdt.asl-44-           Name (_ADR, 0x00)
>>> ```
>>>
>>> Its EISA ID is "PNP0A03"; the namespace is reserved for Microsoft. Microsoft identifies "PNP0A03" as PCI devices [1].
>>
>> You again say "should" without explaining what you derive this from. Is it
>> written down somewhere that no OS we (remotely) care about ever evaluated
>> _ADR when _HID was there? As before, along side mentioning the benefits of
>> the change, I'd like to also see a discussion of risks.
>>
> 
> I derive this knowledge only from the APCI specs. Indeed, I've not researched how every OS interprets _HID and _ADR.
> 
> From your answer, I see you would like to be sure the change will introduce no regression. I do understand you point of view; keeping the backward compatibility. 
> 
> The benefit is that the warning will be cleared. We agree on that.
> 
> The risk is that, if ever any OS relies on _ADR, and cannot read _HID; it would break.
> 
> After thinking about it, the other way is less risky: this _HID name is only recognized by Windows. Every OS should (I did say it again, should) understand _ADR.
> 
> If you think the change makes sense, I can remove _HID instead of _ADR.

But that would remove relevant information, the the PNP ID serves a purpose.

> Otherwise, I think we should end the discussion.

Well, you may decide to withdraw / abandon the patch, or you may decide to
re-submit with an extended description, clarifying why the removal is
expected to be safe. Even if - obviously - you can't inspect e.g. Windows
sources.

Jan

