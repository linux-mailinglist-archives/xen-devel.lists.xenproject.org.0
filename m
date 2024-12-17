Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C89F4CFA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859173.1271314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNY5o-0007Wy-R5; Tue, 17 Dec 2024 13:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859173.1271314; Tue, 17 Dec 2024 13:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNY5o-0007Ut-Nn; Tue, 17 Dec 2024 13:58:32 +0000
Received: by outflank-mailman (input) for mailman id 859173;
 Tue, 17 Dec 2024 13:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNY5n-0007Un-3Q
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:58:31 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd7768a9-bc7e-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 14:58:27 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso2624743f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 05:58:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388e2780bcesm245530f8f.82.2024.12.17.05.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:58:26 -0800 (PST)
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
X-Inumbo-ID: fd7768a9-bc7e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734443907; x=1735048707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1FR/WHpi2MiU1+58BZ3C0sdX2xQgkgGBaIv3V2Ft7b8=;
        b=MJTKJCj7iEE27C2PsazBGswwjNVpPE/SvLd4f4fyw8Y2OjrerbzLJL4ixn40SZpPFp
         AfqAMEb733t0uy5ANVCKCcXkQwWdONTvotZtYbFjDItNrEzyHOI2gUArMKiQt9qRYMUd
         WLz6h7yAAm2JGMccJ4FOWSw7SqwWHQZMIlVruCdYl2ODD/5Cszm3EAcYEA56H/p+NREE
         aZkieIOC4KqTKXvPNNOMx09uSIWtPQm4mG4S8+5GOVc7gA3lSH+wFbF9yVirq5RuNjp1
         PRw44vc54LDIQB8jYqD6Qe6as5+MAw3KDr0LxdxR2QYTTUp8PV3emnAM9i3K42EvY1MU
         6ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443907; x=1735048707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FR/WHpi2MiU1+58BZ3C0sdX2xQgkgGBaIv3V2Ft7b8=;
        b=Keqt50wMtkZwInjhp0MH38bHg2dnUQ0dRneq453ZABwbvqlapR007vht0JKWsxyu0m
         Q0x8LjgG2sN4lNJ8DoZ2JEHAeegrFpEx+2nbeHlt8y1Q8aZ/Dsfa+Vk9hn+xStYi+JH+
         9kAJZKH1z3rKER16B3IRHXvvFjDk7xIasecVLikRgO2Dh24/exQiygqNllLEpuEzRC2E
         Y9gLP+jA67+1T5cHMlkPtTffJD1ZvvIhF/ZGWI45hUoUFMKPL3euEszPtgl6NyEt97uv
         ta1THGKw9KTw3ivhQteDaFBapUAMCUtVr0kDkFUMESiqybA8ogxqupEo36mcdP7Bas7E
         tIqw==
X-Forwarded-Encrypted: i=1; AJvYcCV9k5o9JbP4TDRzR8Xeo7ttpmRofdzwVeVsloivgXZSgCBYJqlVu/7iWsBHp/67DT9RhklR5RYR6oY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi4bY+1ekclmh0Y7J+/OS4Wg8YoPeFNAb1TBI95cvBBWWUvzKK
	87c3XzziuwxkQnUYxtzt+h9o5zHYjIWFmaN4BfZPZiVCvFLi2epMI2h29h5gIA==
X-Gm-Gg: ASbGncvjJSBJG6T3vmxc6TqNF0fNgd73+D9aCvT6FT09luZpCmVOa39HQJIfc0T7f35
	1T5aEjYsUJxbILjmgdg8IGQZ/6cxDUyFGdMZ8U9YOshGVkYVUQ7jEYTgC/y525iDAGtFFOAognb
	1tcyY6913mCVe++hSweNTo8d8mFyyo6y7PBTUSSwr43veO5MRioUY0QaiUzJcOGOsmH8LLRc4AR
	9EPPWKJZ+7+3QcTbO6lTBvurXR5xAP4XmFwKAeYPglGoTPZWPSquXE7ne3j4X3KKqNjGLnTqaGi
	2wn9xlvhe3VJZf0YxXmEfGPiFE3hp0ZQy36cBD8kBQ==
X-Google-Smtp-Source: AGHT+IEKS6f5Y1Mgn3yb8LM04A5/dX7nqt9qxyDl1Wm649CUPrIbqtB9P+AwZxpgpFP71gEZXBp76g==
X-Received: by 2002:a05:6000:470a:b0:385:e22e:288b with SMTP id ffacd0b85a97d-3888e0c08dfmr13774990f8f.59.1734443907064;
        Tue, 17 Dec 2024 05:58:27 -0800 (PST)
Message-ID: <29640ca8-60eb-492e-9350-4fbc607bca63@suse.com>
Date: Tue, 17 Dec 2024 14:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/libacpi: clear ASL warning about PCI0
To: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <cf8d3ff6-b72d-468e-a14f-1dfbc741f376@suse.com>
 <2f7a89-67617b80-bf75-70827e80@196856502>
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
In-Reply-To: <2f7a89-67617b80-bf75-70827e80@196856502>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 14:24, Ariel Otilibili-Anieli wrote:
> On Tuesday, December 17, 2024 10:29 CET, Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 17.12.2024 00:50, Ariel Otilibili wrote:
>>> iasl complains _HID and _ADR cannot be used at the same time:
>>>
>>> ```
>>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID
>>>
>>> tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
>>> Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
>>> ```
>>>
>>> Per ACPI 2.0 (Jul. 27, 2000; Section 6.1, page 146), the configuration was legit:
>>>
>>> "A device object must contain either an _HID object or an _ADR object,
>>> but can contain both." [1]
>>>
>>> But, per ACPI 6.5 (Aug. 2022), this is no more legit:
>>>
>>> "A device object must contain either an _HID object or an _ADR object,
>>> but must not contain both." [2]
>>>
>>> Generally _HID devices are enumerated and have their drivers loaded
>>> by ACPI ("ASL 2.0 Introduction and Overview", page 4).
>>>
>>> Removing _ADR, the warning is cleared out.
>>>
>>> The change should be compatible down to OSes released after ACPI 2.0,
>>> including Windows XP:
>>
>> So my earlier hint apparently wasn't clear enough. I really would have
>> expected you to determine in what version the wording changed. Even 5.1
>> still has the old wording, and that's more than 10 years newer than 2.0.
>> And then in 6.0 the wording first changed to "but should not contain
>> both."
> 
> I can do that, Jan; I'll research from where did the wording changed.

Well, if you want to double check what I've done, feel free. As per above
I did already identify when the wording changed.

>> I'm further afraid that ...
>>
>>> 1. The _HID kept in the DSDT files is the EISA ID "PNP0A03",
>>> Microsoft recognizes it as PCI bus:
>>>
>>> ```
>>> $ curl -k -s https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/devids.txt | grep PNP0A
>>>
>>> PNP0A00         ISA Bus
>>> PNP0A01         EISA Bus
>>> PNP0A02         MCA Bus
>>> PNP0A03         PCI Bus
>>> PNP0A04         VESA/VL Bus
>>> PNP0A05         Generic ACPI Bus
>>> PNP0A06         Generic ACPI Extended-IO Bus (EIO bus)
>>> ```
>>>
>>> 2. Linux 6.12 uses also _HID for identifying PCI devices [3]:
>>
>> ... this fact alone means very little here. The more important question is
>> whether there are / were OSes which use(d) _ADR for any purpose even when
>> _HID is there. With just looking at the surface of just Linux, I find e.g.
>> a library-like function acpi_get_local_u64_address(), all users of which
>> would need auditing. Plus, once done, we'd then still only know the state
>> of things in one specific Linux version.
>>
>> Bottom line: I wonder whether iasl has an option to suppress that warning.
>> Sadly I can't find a new enough iasl anywhere on the systems I have easy
>> access to, so I can't check myself. If there was no way to suppress this
>> warning, I'd wonder whether this wasn't a shortcoming of the tool, as the
>> warning is clearly inappropriate when dealing with tables for pre-v6
>> configurations.
> 
> There are flags to remove warnings:
> 
> ```
> $ iasl -h | grep -i warn
> Errors, Warnings, and Remarks:
>   -va                 Disable all errors/warnings/remarks
>   -ve                 Report only errors (ignore warnings and remarks)
>   -vi                 Less verbose errors and warnings for use with IDEs
>   -vw <messageid>     Ignore specific error, warning or remark
>   -vx <messageid>     Expect a specific warning, remark, or error
>   -w <1|2|3>          Set warning reporting level
>   -we                 Report warnings as errors
>   -ww <messageid>     Report specific warning or remark as error
> 
> $ iasl -v 
> 
> Intel ACPI Component Architecture
> ASL+ Optimizing Compiler/Disassembler version 20240927
> Copyright (c) 2000 - 2023 Intel Corporation
> ```
> 
> I am keeping you posted; I am compiling with warnings disabled.

Disabling warnings altogether is unlikely to be what we want. And the help
output above also doesn't suggest there's a control to suppress specifically
what we may want to suppress. Even suppressing warnings by <messageid> is
likely going to be too broad.

Jan

