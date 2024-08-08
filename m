Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E989294BE12
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774071.1184569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2j1-0006JB-9F; Thu, 08 Aug 2024 12:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774071.1184569; Thu, 08 Aug 2024 12:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2j1-0006G1-6P; Thu, 08 Aug 2024 12:58:39 +0000
Received: by outflank-mailman (input) for mailman id 774071;
 Thu, 08 Aug 2024 12:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc2iz-00068P-JT
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:58:37 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed1f348c-5585-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 14:58:37 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso1082377a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 05:58:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb546sm737590966b.224.2024.08.08.05.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 05:58:35 -0700 (PDT)
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
X-Inumbo-ID: ed1f348c-5585-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723121916; x=1723726716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u5rHXwCi9oNtHjHF/8RVShXBGLMxVge/YWa5g886Jkw=;
        b=RcrdKWvA8V66TLcAuS6EKE+zrDSYUlGeHaQTE6bhgLUcYseMcezxER5VtrruuwWb3G
         Eee13+5TJhgOADQAuBSieOadB2WXVpMJeSfLa1GidO7jFKr+m4qUDLxiHHnyyd5lK+X/
         KXiJJoc/uBCN8q4tM2hUOX6YEHmAuuvltn1JZMMd3F3Q7SY6gN7/9oXok1duAGCd7CQV
         JuwMbDiO4ZAzc5vr2PtPEuqhC0Ev9HvxmXr1HiXtm2lcsUmVB5Gj60ockK2QpB2Cr1jN
         mYC13TP7WTgWk0u0tt9Nu6SVmORd+eOlHsMNynQZS6eBUGmu34NCgRaht0FYs6No74ET
         I2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723121916; x=1723726716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5rHXwCi9oNtHjHF/8RVShXBGLMxVge/YWa5g886Jkw=;
        b=hnOQ1dq/YyraCQVPYEY3gDrw3TuSc1eoCqJ7AOIDLR88zk8twcGmCsDRwDl0fdMtEX
         h9HZAu9XmhqqNYNeD10emVW/Es66oTlWe55GkMiU8IhkOxYHWm8H7QdunP0Zzv6muy4T
         B1Y9hjNYdAV9bImKHQfkAz3XDzdxyr+sUv55yj54dL2F1DebhgFv2kvXX+5kJIOT9DPN
         L6uU6v0duvQMBTZC5vO8Tu08ig6hCK3mOvo89NfEQ7dUwKWaBvIkTF+Do3X5gdrpGBRc
         xeagM9JFmf0PuNumM8ptCjbOfDNu0jDnn5bziy8ZIS4L+2TG5dLqqxTdcAEggsemU0/O
         qxgg==
X-Gm-Message-State: AOJu0YyG/yVcQh0Rv2d/qd1tp8eRhSROU4EhXNwsrQVp3HWMUWMmTpM+
	Y53vBR9RhxECnIHwrfDCLibOmu4nsYDlSFSrgsqvi+FGlApSU6PRO9kiQpMvOw==
X-Google-Smtp-Source: AGHT+IF/wJKd4hp49iEVti2Yw6ihIervu2rQeVMgT/y3TL1QjcAA7B+VPSJgJGeInPPyewbpVLDOew==
X-Received: by 2002:a17:907:7214:b0:a7d:30d2:28f8 with SMTP id a640c23a62f3a-a8090f39628mr136454266b.68.1723121916229;
        Thu, 08 Aug 2024 05:58:36 -0700 (PDT)
Message-ID: <57e01574-2e06-4dd3-bf7f-91b5a19477b1@suse.com>
Date: Thu, 8 Aug 2024 14:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86: Fix early output messages in case of EFI
To: Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-3-alejandro.vallejo@cloud.com>
 <7f1e17dd-d105-4f6c-87d3-69f3dca4ab82@suse.com>
 <CACHz=ZjYdBcB_S1tpXpuRQDKGAKY=SrgTEy8_0Wyq_q+bOBfHg@mail.gmail.com>
 <bd4c8ef5-a6bb-42ae-9b69-c3d14eeac55e@suse.com>
 <CACHz=ZgRK2DMHmiAVsBo1WJVBxbnTka3-CcpgopKB-6gWs5ZSw@mail.gmail.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <CACHz=ZgRK2DMHmiAVsBo1WJVBxbnTka3-CcpgopKB-6gWs5ZSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2024 14:50, Frediano Ziglio wrote:
> On Thu, Aug 8, 2024 at 10:29 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> (re-adding xen-devel@)

Did you notice this in my earlier reply? You dropped the list again.

>> On 08.08.2024 10:33, Frediano Ziglio wrote:
>>> On Thu, Aug 8, 2024 at 8:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> This cause offsets in x86 code generated by
>>>>> sym_offs(SYMBOL) to be relocated too (basically they won't be
>>>>> offsets from image base). In order to get real offset the
>>>>> formulae "sym_offs(SYMBOL) - sym_offs(__image_base__)" is
>>>>> used instead.
>>>>
>>>> The main calculations of %esi are, if I'm not mistaken,
>>>>
>>>>         /* Store Xen image load base address in place accessible for 32-bit code. */
>>>>         lea     __image_base__(%rip),%esi
>>>>
>>>
>>> Which is correct
>>>
>>>> and
>>>>
>>>>         /* Calculate the load base address. */
>>>>         call    1f
>>>> 1:      pop     %esi
>>>>         sub     $sym_offs(1b), %esi
>>>>
>>>> i.e. both deliberately %rip-relative to be position-independent. What's
>>>> wrong with this?
>>>>
>>>
>>> This can be wrong if sym_offs(1b) was relocated and not patched by
>>> efi_arch_relocate_image.
>>
>> Of course, if in the course of GrUB's loading of xen.efi base relocations
>> are applied (unlike when loading an ELF binary, where afaik base relocs
>> would be ignored, even if there were any), then this calculation is of
>> course going to be wrong. Can't we correct it though, to properly resemble
>> PIC code:
>>
>>         /* Calculate the load base address. */
>>         call    1f
>> 1:      pop     %esi
>>         sub     1b - start, %esi
>>
>> or (because start is in a different section):
>>
>>         /* Calculate the load base address. */
>>         call    1f
>> 1:      pop     %esi
>>         sub     $sym_offs(1b), %esi
>>         add     $sym_offs(start), %esi
>>
>> (or something along these lines)?
>>
> 
> Yes, that works. But is a bit painfull, I mean, the %esi will point to
> the correct address, but still you will use something like
> syms_esi(foo) expecting to work but it won't as there will be applied
> a relocation offset.

I find your reply contradictory in itself. You first say this works, to
then say it can't work. The underlying idea has to be to establish %esi
such that it works uniformly.

> On 32bit PIC code you could use something like
> foo@GOTOFF(%esi), assuing %esi is pointing to the global offset table.
> I was trying to use that but linker is complaining a bit as generating
> a 64bit relocation. The x64 architecture supports such relocation as
> 32bit but I didn't find a way to tell assembler to use the 32bit
> version instead of the 64bit one. Also I didn't find a way to set
> _GLOBAL_OFFSET_TABLE_ where I want it to be, it looks like that if the
> linker is not generating it is not picking up the forcedly set symbol.

Even if the toolchain permitted this: We don't have and don't want to
have any GOT. Note how the linker script actually has an assertion for
.got to be empty (plus a few more ones for other sections).

Jan

