Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80469F2F9E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857828.1270035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Qh-0005oh-6G; Mon, 16 Dec 2024 11:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857828.1270035; Mon, 16 Dec 2024 11:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Qh-0005oF-2A; Mon, 16 Dec 2024 11:38:27 +0000
Received: by outflank-mailman (input) for mailman id 857828;
 Mon, 16 Dec 2024 11:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN9Qf-0005mm-7V
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:38:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 425a2174-bba2-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 12:38:24 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso27122585e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:38:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436360147desm82200205e9.9.2024.12.16.03.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:38:23 -0800 (PST)
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
X-Inumbo-ID: 425a2174-bba2-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734349104; x=1734953904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I3+dyRajkcNzGgdPoCJrlBLi/zuPpVioGU77W2JhwdQ=;
        b=d2sTaS/ngBPlbifigiJwFJUnOYh8S+Q1iurawaoFXOJU2KTXBKWX6HLLd1AoJkraiK
         EuOPZNhe2gBn90cDHpr3+PdvTzy/JNru/L0ZhramiqfA5OZ7QvEYQHmgX5NGOCtqhnLk
         bDrSLxFAONNEIxQPxLdW521LAk7gUq6AZcjkCvSbiVMTxV4Bc6awKXqrfKYZlPLk2vH/
         4z+wnW378mmJ+POfYAS1PbcFUAi6Tkl7PBiD7HenaJfM9hK9B1i9ZV0D97fuDVAFRwW8
         bcBl7RPgyE5L01NHEzCbWHXg/ba3yT49PNWGJICR8tTY3vqaFa+ZUQKOoJg29vMjizWH
         wf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734349104; x=1734953904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3+dyRajkcNzGgdPoCJrlBLi/zuPpVioGU77W2JhwdQ=;
        b=fzFEbV8j6t7d3fkDUXJM4ZFbP0y86rFxbuH90iA2soSIc4gZD70Md05W0HoUpo6H8N
         75gS4YXazanu/WfsU1X5moyrEv6hIyDJSE6tnXWq0th2s3WWBi+LpjfWC8/v9Q8Tv6Yu
         6rMIITd/FeiAhmUDOQmoRzOlMWqZCOIGah797xpQ7HMLykeCB52B6L0yuLptvBr138hs
         Tgho5nh2+1wWclVob70NpFCiFFiKqIQ1MPzO25dwoo/W5Qg0FmW9Bts7zq0+ZGD/7ooG
         yIY82A/3GIZfVAg7dPG1kc7WH5P+6FlEsFtbFpdzKykUFZuvHqJ9EYczi27r8EBVlC6T
         oOsQ==
X-Gm-Message-State: AOJu0YzOB5qVHHU72A7gVBTgrljdnO6uK6PvLQnDZSPn1kcvgW2fSC9z
	oSnFydWTX0Op/4qciysSPCOYi3/dImNEANYgaI6g2VWWpf7UK8OMgBTvZ6oicQ==
X-Gm-Gg: ASbGncuOrfJEHkga0URUC354p3uQ18AdGFDDqW586D9MaZnn/S90Z2fkbyPWsAEOGb2
	a5kPjLcXjdIF/8exaqAQRq3LZbl4yujuIQh+LYR9AxypVesGTz5CXHeIfNl5PfnMFU/rwSyGULk
	DXXg9bTxha+QxsEmovJBO5HzznJWMwR4d12aF2oT3R9Ca735aYch3p/5juwYJJnlVmiCk7Z/S57
	hHziFubtGqYwTH5/6uh69LC+vc/ozGszP0vzihbL0w+yvVEvPvzy2bSycBddV7QIxCq+8hxCGqo
	PBWhNl73Bo4Pl04zHlSaWBfCP1I33GAbCaRxg/yA0A==
X-Google-Smtp-Source: AGHT+IFQXxH1Rdpo/0yV5jGJ/DRA801yzUFaKj6qUiKBw8BHoSD/qgpMdYNsLROlpedYBEByWcDavw==
X-Received: by 2002:a05:600c:3b9c:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-4362aa2deaemr100624655e9.7.1734349103952;
        Mon, 16 Dec 2024 03:38:23 -0800 (PST)
Message-ID: <3f3e9a77-5695-4c91-9fc2-11a3c21605c5@suse.com>
Date: Mon, 16 Dec 2024 12:38:22 +0100
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
In-Reply-To: <2f7a86-67600f80-8b81-26131fc0@216081513>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 12:31, Ariel Otilibili-Anieli wrote:
> On Monday, December 16, 2024 12:01 CET, Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 16.12.2024 11:36, Ariel Otilibili-Anieli wrote:
>>> On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>>> On 15.12.2024 16:40, Ariel Otilibili wrote:
>>>>> * iasl complains _HID and _ADR cannot be used at the same time
>>>>>
>>>>> ```
>>>>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID
>>>>> tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
>>>>> Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
>>>>> ```
>>>>>
>>>>> * generally _HID devices are enumerated and have their drivers loaded by ACPI
>>>>> * this is from "ASL 2.0 Introduction and Overview" (page 4).
>>>>> * removing _ADR, the warning is cleared out.
>>>>
>>>> Okay, that's the positive aspect. Yet what about the potential fallout thereof?
>>>> Can you confirm that there's no risk of regressions with older guest OSes, for
>>>> example?
>>>
>>> OSes that were released after ACPI 2.0 should work [1]; including WinXP: 
>>> The 2.0 specs says either _HID or _ADR should be included [2], not both (Section 6.1, page 146).
>>
>> We must be looking at two different variants of the spec then. My copy says
>> "device object must contain either an _HID object or an _ADR object, but can
>> contain both." Also still in 2.0c. I agree that in e.g. 6.5 the wording has
>> changed. I also agree that the use of "either" doesn't help clarity.
> 
> I looked up 2.0 (July 2000); indeed, it said "can contain both". My bad.
>>
>>> I chose WinXP because, on another patch, it came up in the discussion [3].
> 
> The change should work down to WinXP: the name _HID is kept.
> 
> ```
> $ git grep -B2 -A2 -n PNP0A03
> tools/libacpi/dsdt.asl-40-       Device (PCI0)
> tools/libacpi/dsdt.asl-41-       {
> tools/libacpi/dsdt.asl:42:           Name (_HID, EisaId ("PNP0A03"))
> tools/libacpi/dsdt.asl-43-           Name (_UID, 0x00)
> tools/libacpi/dsdt.asl-44-           Name (_ADR, 0x00)
> ```
> 
> Its EISA ID is "PNP0A03"; the namespace is reserved for Microsoft. Microsoft identifies "PNP0A03" as PCI devices [1].

You again say "should" without explaining what you derive this from. Is it
written down somewhere that no OS we (remotely) care about ever evaluated
_ADR when _HID was there? As before, along side mentioning the benefits of
the change, I'd like to also see a discussion of risks.

Jan

