Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A58763A5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690247.1076077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYjR-0005Kz-7M; Fri, 08 Mar 2024 11:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690247.1076077; Fri, 08 Mar 2024 11:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYjR-0005In-4R; Fri, 08 Mar 2024 11:49:45 +0000
Received: by outflank-mailman (input) for mailman id 690247;
 Fri, 08 Mar 2024 11:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riYjP-0005Ih-9s
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:49:43 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f315d342-dd41-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 12:49:41 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d3f4fef377so26282811fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 03:49:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm9032689edw.6.2024.03.08.03.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 03:49:40 -0800 (PST)
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
X-Inumbo-ID: f315d342-dd41-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709898581; x=1710503381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYSxsbfCaqJmxK/kthROoPnBXg+uGsR3Nai26hb3HRM=;
        b=HTY+1LaPp5m89fyt3lDomPChTTiPAd3DbIOADKg7M7HBICnYcWJyrsCxkhUjkHDKMw
         4Dx8zfx2NbOC7dulmiG1BlZZ9ipeSsXbyM081E7D29cM4YRQBKN2YU6JHjIrKJIsrm+y
         NvUM/01bKRg9/StLw97S4/ZR5hwFnZElXap7D+0lB1BULNEzHrJZsnl2RBCitOVM8NzF
         TAdAh/NRFfL2UZGuojb+viWf/P1XbuRfhdS3g5rQMefOL5YXEGXwTfbfHHWOGuM+Pm/n
         UAItNtGTWmJS+MdUqOz7QFYbBohVh6AVCyGpudQzQHgx+CV6VmnSqGszGfwkNZbl3QTT
         VRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709898581; x=1710503381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYSxsbfCaqJmxK/kthROoPnBXg+uGsR3Nai26hb3HRM=;
        b=pxiqlrRoEG9sfLVRNFjBzA5RGWcZZv8uQOjAPYUxHOjhq3+vba0WIQZHOy8oXRJusl
         q8KZ8Qedjy+Res/UPbn2v1bZZ4lmUuL5XSGZfA0+yNI58GQ6OCVhRLET6DlcBBwy93hN
         /4Zd8hfim1/2jN5qgAF2VdNAl9G0rxn6Y/6wZzlPcPZtDu5cSIFSBON4p7yO/WzlMO7r
         1KA/LJgzWqg12qFs7ShPrCSajt9KSbJLkSi07AKPIUpCcjlEXszuHrof5UmfbTcxZ63I
         rosxKr17NUT4zHsnyxsS15VME6/eGfV9/1Nh0K0SzXjuq0AoHjx/Gmbc8iZMKNxsNSGX
         ya9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU191OCWrnhTVCVk3QImrjXfUWXWfmvYxGje8K63btrZEK3M9H/FYTyajoZQv2+kjg6ZN1sTvi+flxSzU4QpdO07QDVXfCvKJ++O73jLZI=
X-Gm-Message-State: AOJu0YzCBqtuRdtdHaSFTl2wL9lexNFoimWf+tTbSE843xYGSVaKuGa8
	kIz3P2kptK2OAep9dXcwy54gY1HK+252gfEv5QESJUnx9JvFvQof5RFEyQO+gg==
X-Google-Smtp-Source: AGHT+IEvkEu52WdorTWlgKesCBAD/gvFoSuDDVv0RA5kXh4FtkYcdKaOMdB/CN3MGDy8tnJHcrPRNA==
X-Received: by 2002:a2e:9dd9:0:b0:2d4:874:24a0 with SMTP id x25-20020a2e9dd9000000b002d4087424a0mr3211851ljj.51.1709898581164;
        Fri, 08 Mar 2024 03:49:41 -0800 (PST)
Message-ID: <d3c8618f-133a-48ca-a648-611250a8c334@suse.com>
Date: Fri, 8 Mar 2024 12:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
 <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
 <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
 <d3eabf773211defb2f8a9a22545fca5c7cf3eca1.camel@gmail.com>
 <82375df2-f7fd-43a1-9183-f4823fe791ec@suse.com>
 <4b6c9458efc85a57c14c6b6147d47245fece1f88.camel@gmail.com>
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
In-Reply-To: <4b6c9458efc85a57c14c6b6147d47245fece1f88.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.03.2024 11:14, Oleksii wrote:
> On Fri, 2024-03-08 at 08:26 +0100, Jan Beulich wrote:
>> On 07.03.2024 21:54, Oleksii wrote:
>>> On Thu, 2024-03-07 at 21:49 +0100, Oleksii wrote:
>>>> On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
>>>>> For plain writes it should at least be "=Qo" then, yes.
>>>> Constraints Q is a machine specific constraint, and I am not sure
>>>> that
>>>> it makes sense to use "=o" only and probably it is a reason why
>>>> it is
>>>> enough only "r". Does it make sense?
>>> Probably for RISC-V can be used:
>>> RISC-V—config/riscv/constraints.md
>>>    ...
>>>    A
>>>        An address that is held in a general-purpose register.
>>>    ...
>>
>> Just from the description I would have said no, but looking at what
>> "A"
>> actually expands to it is indeed RISC-V's counterpart of Arm's "Q".
>> So
>> yes, this looks like what amo* want to use, and then as a real
>> operand,
>> not just a fake one.
> I am not sure that I know how to check correctly how "A" expands, but I
> tried to look at code which will be generated with and without
> constraints and it is the same:

As expected.

>    // static inline void __raw_writel(uint32_t val, volatile void
>    __iomem *addr)
>    // {
>    //     asm volatile ( "sw %0, 0(%1)" : : "r" (val), "r"(addr) );
>    // }
>    
>    static inline void __raw_writel(uint32_t val, volatile void __iomem
>    *addr)
>    {
>        asm volatile ( "sw %0, %1" : : "r" (val), "Ao" (*(volatile
>    uint32_t __force *)addr) );

You want just "A" here though; adding an offset (as "o" permits) would
yield an insn which the assembler would reject. Also just to remind
you: In write functions you need "=A" (and in amo ones "+A"), i.e. the
memory operand then needs to be an output, not an input.

Jan

