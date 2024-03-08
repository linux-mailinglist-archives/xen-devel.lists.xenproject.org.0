Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0B876494
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 13:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690284.1076148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZkB-0002qs-IX; Fri, 08 Mar 2024 12:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690284.1076148; Fri, 08 Mar 2024 12:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZkB-0002ol-Eq; Fri, 08 Mar 2024 12:54:35 +0000
Received: by outflank-mailman (input) for mailman id 690284;
 Fri, 08 Mar 2024 12:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riZkA-0002of-Ac
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 12:54:34 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c6a1c9-dd4b-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 13:54:31 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5682e8f21a7so742765a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 04:54:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ij26-20020a056402159a00b00562d908daf4sm9055092edb.84.2024.03.08.04.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 04:54:31 -0800 (PST)
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
X-Inumbo-ID: 01c6a1c9-dd4b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709902471; x=1710507271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oF2pgstCBNsuBk6SDQqwKrHQIG36P3mhLVhxcYSQ1vw=;
        b=UbZv6BNBzAm2d9uJskQpJL9PHjZt3oBSgctezLZ+HtJcfI9fLmsmN2XlDStTW/durv
         +l5Gm81jt3UkgdZCrVkt2OUFgjxUcIUaa2iZG5DPzWiz/e9oaFp+SiLnKLyd65JWsmlK
         KW6P3uSyYvK+A9Xmjw1zctmej5hQhEZXwS+LoGhKOb7kkHKWbj8e1Gz9H7nQ/Zdow9kN
         Sy1/EWHQxW7QBrdN+KpgwmhyhbxQ65paNxpdCAmPt/Fje9Zed5Pgsv50f89lcKloDxCY
         AzAU93JzW5BxbfyMsGHnY46qI7cuuzi4Deb1CWwjHg3rWrp1hSMLecMwXgO1jKPrrlUz
         IVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709902471; x=1710507271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oF2pgstCBNsuBk6SDQqwKrHQIG36P3mhLVhxcYSQ1vw=;
        b=RL3mCysssTcMOeJJNQLN9XgbQYkUc3HJA8fg4GeF02xCHapmmSNbtANaQ7L6e27rxR
         CxWiRrFYDf9RYlNC/Fk//g6EAecFuGhB40MTXIHqoJkVMEPNpFtFHeNAK0S694JrHfIt
         dhzxvlu0JCEzTDjsgLEnVvQHlVqlhYreEu0UrFgHUymmvYeVbxZXosZvRCBJdPMRyv3e
         /4cljR0li6VwFsRQPVjOXd7LZP+M5pyScDJdo2hR6PE7O7bsxoi6xjIl8bPyT2sKIuyC
         9ErbAcSlEMqpwpie5fQq/3nuEiLMmFJmG8OdWbYN0O3FQELddfMM60aLTEgGxfSWNb5W
         776w==
X-Forwarded-Encrypted: i=1; AJvYcCUdTQtEeguK1tJFY1N2HvpOoCWbBEIcXS2kmNDVFYt2FAh3lwlWvFpbgKzv0jgEgawZ3I6J0Z6TxCiEWd29hN3iK44sYZ0ewZTGcLmnTss=
X-Gm-Message-State: AOJu0Yzyrni5UIXU7lPxA/840bhv/qUmOfOkXgXqcZLJtRp6jbxMi4lU
	8QnJlMR33S8ie4xXAkPN9FsbaZyq9cA2AenDepgSulAqqB1KCLfaWWzs5bfJTw==
X-Google-Smtp-Source: AGHT+IHAwtdkWBmrPa9MjRRgw97aJwcpZ6/9VE3SZ2VvEiPLiBC5Mwd2A0Jej/wizOW+RyWv3CLBZA==
X-Received: by 2002:a50:8e4f:0:b0:568:b18:ee19 with SMTP id 15-20020a508e4f000000b005680b18ee19mr1963243edx.16.1709902471517;
        Fri, 08 Mar 2024 04:54:31 -0800 (PST)
Message-ID: <a7fb4849-7d98-498f-b32b-981d7113f993@suse.com>
Date: Fri, 8 Mar 2024 13:54:29 +0100
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
 <d3c8618f-133a-48ca-a648-611250a8c334@suse.com>
 <c64f693d-fdb2-44ca-9e24-097e34c07236@suse.com>
 <e70806679c7d03b9e5947509205be9ab0e543c51.camel@gmail.com>
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
In-Reply-To: <e70806679c7d03b9e5947509205be9ab0e543c51.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.03.2024 13:17, Oleksii wrote:
> On Fri, 2024-03-08 at 12:52 +0100, Jan Beulich wrote:
>> On 08.03.2024 12:49, Jan Beulich wrote:
>>> On 08.03.2024 11:14, Oleksii wrote:
>>>> On Fri, 2024-03-08 at 08:26 +0100, Jan Beulich wrote:
>>>>> On 07.03.2024 21:54, Oleksii wrote:
>>>>>> On Thu, 2024-03-07 at 21:49 +0100, Oleksii wrote:
>>>>>>> On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
>>>>>>>> For plain writes it should at least be "=Qo" then, yes.
>>>>>>> Constraints Q is a machine specific constraint, and I am
>>>>>>> not sure
>>>>>>> that
>>>>>>> it makes sense to use "=o" only and probably it is a reason
>>>>>>> why
>>>>>>> it is
>>>>>>> enough only "r". Does it make sense?
>>>>>> Probably for RISC-V can be used:
>>>>>> RISC-V—config/riscv/constraints.md
>>>>>>    ...
>>>>>>    A
>>>>>>        An address that is held in a general-purpose register.
>>>>>>    ...
>>>>>
>>>>> Just from the description I would have said no, but looking at
>>>>> what
>>>>> "A"
>>>>> actually expands to it is indeed RISC-V's counterpart of Arm's
>>>>> "Q".
>>>>> So
>>>>> yes, this looks like what amo* want to use, and then as a real
>>>>> operand,
>>>>> not just a fake one.
>>>> I am not sure that I know how to check correctly how "A" expands,
>>>> but I
>>>> tried to look at code which will be generated with and without
>>>> constraints and it is the same:
>>>
>>> As expected.
> But if it is epxected and generated code is the same, do we really need
> constraints then?

Yes. Again: Proper constraints are the only way for the compiler to know
everything it needs to know to generate correct code around an asm().

>>>>    // static inline void __raw_writel(uint32_t val, volatile void
>>>>    __iomem *addr)
>>>>    // {
>>>>    //     asm volatile ( "sw %0, 0(%1)" : : "r" (val), "r"(addr)
>>>> );
>>>>    // }
>>>>    
>>>>    static inline void __raw_writel(uint32_t val, volatile void
>>>> __iomem
>>>>    *addr)
>>>>    {
>>>>        asm volatile ( "sw %0, %1" : : "r" (val), "Ao" (*(volatile
>>>>    uint32_t __force *)addr) );
>>>
>>> You want just "A" here though; adding an offset (as "o" permits)
>>> would
>>> yield an insn which the assembler would reject.
>>
>> Wait - this is plain SW, so can't it even be the more generic "m"
>> then?
>> (As said, I'm uncertain about "o"; in general I think it's risky to
>> use.)
> What do you mean by "plain SW"?

The plain store instruction, i.e. not SC. That one permits wider addressing
modes iirc, which we ought to permit where possible.

> Are you suggesting changing 'm' to 'o' so that the final result will be
> "Am"? Based on the descriptions of 'A' and 'm', it seems to me that we
> can just use 'A' alone because both constraints indicate that the
> operand is in memory, and 'A' specifically denotes that an address is
> held in a register.

No, no "A" at all. Just "m", which is a superset of "A" anyway.

>>> Also just to remind
>>> you: In write functions you need "=A" (and in amo ones "+A"), i.e.
>>> the
>>> memory operand then needs to be an output, not an input.
> Could you please clarify about which one amo you are speaking? That one
> who are defined by ATOMIC_OP and ATOMIC_FETCH_OP?

All. They're all read-modify-write operations if I'm not mistaken.

> They are already
> using +A constraints:
>     __asm__ __volatile__ (                                          \
>         "   amo" #asm_op "." #asm_type " %1, %2, %0"                \
>         : "+A" (v->counter), "=r" (ret)                             \
>         : "r" (I)                                                   \
>         : "memory" );                                               \

Good. I merely thought I'd mention that aspect for completeness.

Jan

