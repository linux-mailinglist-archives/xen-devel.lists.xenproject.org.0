Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF194B9B3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 11:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773800.1184233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzSf-0000O1-Mk; Thu, 08 Aug 2024 09:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773800.1184233; Thu, 08 Aug 2024 09:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzSf-0000Lw-Jd; Thu, 08 Aug 2024 09:29:33 +0000
Received: by outflank-mailman (input) for mailman id 773800;
 Thu, 08 Aug 2024 09:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbzSe-0000Lq-Pl
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 09:29:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6dfd453-5568-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 11:29:30 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5b3fff87e6bso775236a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 02:29:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2bf962dsm448854a12.15.2024.08.08.02.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 02:29:29 -0700 (PDT)
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
X-Inumbo-ID: b6dfd453-5568-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723109370; x=1723714170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=np7STbx2lMKh44IZp2I+buIAIwrFbrKnBvYJBYd/X8s=;
        b=HSIUxB9IoUp8BLrdQKb0tPZCd0Te6cavij3FCWfLEQniiYPWX9EaC4qobV73V3soSj
         X196uhuP53QZ4B4YKxW7XwvB/sfud/C6sqKsfsZZXpQZfG7lZtOgAgiQbfsDeo+6BF/V
         h6H7IE6Vh1+q+FO37ODhCt1zSL4fEtRIOeQoLrgt73pDFx9GeKU95fetZVZmxS8WJ9uB
         SmnQ/gMUMHDZ08zp+1AXuNKV+nsjMtXm7HNMbNzFRoNg6VJKykvZ+O1me83N9bvn2y/d
         ZSUYYTrRo8K7Dat1dciNGnH9WOLdplGn4dolmAqW64dlW+X8AlEklCGgr4n25Mze5L8T
         gNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723109370; x=1723714170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np7STbx2lMKh44IZp2I+buIAIwrFbrKnBvYJBYd/X8s=;
        b=DSAZAvhGle8TPUg+DoPlGGoE4JA48ThXdHEfG6ZMUmvX4v1kj8zZFiIochU2Hd39ZT
         QDGWFgVBcuaKQPuKPTtpdosHawHmjq97WYC5rJEnMbqEJXJOxBvm2BVSftGlcBQZ/ean
         3vpfi0bUBq80Lbc69BKstDb0vBeNvtGgRKgvNV2sdVuLp5JZrzOs5q11emhuyCHzzfWg
         2wgKvR50qPCcPqy0g9F4y321gV8VrtC1t6bcCDP8fppB6PMLlO2YUA73X+rHzGFct0y9
         59WSXFH/9yFOf086gpY8hLm1C+KSNxRfqJ1C5avbg33hi9jwIiM664GQbBbW2yQOH6jx
         E8Uw==
X-Gm-Message-State: AOJu0Yz76DHy0hDiIIg9H2XpPADOO3iB/JOjsymmmxfakVOZRHmI582f
	90eDWJJlDijGa+F98zs8ITF4bhkLZ1FuvSrTaFS9DflAGxnQpioMLEmF9hFDS+zq5xv9bqCqP54
	=
X-Google-Smtp-Source: AGHT+IFK9ep32stWhgWOYotxk8xMsHwkVWyrvn+Eq6X8aOgVvO838LzZanFjU5vKI6oie3Xzol8dwQ==
X-Received: by 2002:a05:6402:34cb:b0:5af:874d:1b7b with SMTP id 4fb4d7f45d1cf-5bbb218dfadmr1110563a12.1.1723109369836;
        Thu, 08 Aug 2024 02:29:29 -0700 (PDT)
Message-ID: <bd4c8ef5-a6bb-42ae-9b69-c3d14eeac55e@suse.com>
Date: Thu, 8 Aug 2024 11:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86: Fix early output messages in case of EFI
To: Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-3-alejandro.vallejo@cloud.com>
 <7f1e17dd-d105-4f6c-87d3-69f3dca4ab82@suse.com>
 <CACHz=ZjYdBcB_S1tpXpuRQDKGAKY=SrgTEy8_0Wyq_q+bOBfHg@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjYdBcB_S1tpXpuRQDKGAKY=SrgTEy8_0Wyq_q+bOBfHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(re-adding xen-devel@)

On 08.08.2024 10:33, Frediano Ziglio wrote:
> On Thu, Aug 8, 2024 at 8:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
>>> If code is loaded by EFI the loader will relocate the image
>>> under 4GB.
>>
>> This is the MB2 EFI path you're talking about? Since there are two paths,
>> I think this needs clearly separating in all descriptions.
>>
>> If it is the MB2 path, then "relocate" isn't quite correct, I think:
>> Relocations aren't applied in that case, as none are present in xen.gz.
>> I'd rather call this "put at an address below 4G". However, that isn't
>> any different from the non-EFI MB1/2 paths, is it? I feel like I'm
>> missing something here.
>>
> 
> Yes, xen.gz has no relocation, but xen.efi has them,

Of course, I know. I was the one to actually add them, after all. But:
Are you (silently) adding a 4th way of booting Xen, using xen.efi yet
not its PE-header-specified entry point? So far we had three ways only:
Non-EFI (xen.gz:start), native EFI (xen.efi:efi_start), and GrUB2+EFI
(xen.gz:__efi64_mb2_start). You effectively suggest GrUB2+EFI
(xen.efi:__efi64_mb2_start), if I'm not mistaken. Where is such a mode
even specified? When using the MB2 entry point, it's not obvious at all
whether the boot loader is even supposed to be respecting the .reloc
section of the PE binary (imo that's contrary to the original idea of
multiboot).

> Normally probably you are using xen.gz instead of xen.efi however we
> are adding multiboot with PE support and secure boot so we need to use
> PE format for signing.

Note how here is the first time that you actually mention you're adding
a new boot mode. That's quite relevant as context for the entire series,
I would say.

>>> This cause offsets in x86 code generated by
>>> sym_offs(SYMBOL) to be relocated too (basically they won't be
>>> offsets from image base). In order to get real offset the
>>> formulae "sym_offs(SYMBOL) - sym_offs(__image_base__)" is
>>> used instead.
>>
>> The main calculations of %esi are, if I'm not mistaken,
>>
>>         /* Store Xen image load base address in place accessible for 32-bit code. */
>>         lea     __image_base__(%rip),%esi
>>
> 
> Which is correct
> 
>> and
>>
>>         /* Calculate the load base address. */
>>         call    1f
>> 1:      pop     %esi
>>         sub     $sym_offs(1b), %esi
>>
>> i.e. both deliberately %rip-relative to be position-independent. What's
>> wrong with this?
>>
> 
> This can be wrong if sym_offs(1b) was relocated and not patched by
> efi_arch_relocate_image.

Of course, if in the course of GrUB's loading of xen.efi base relocations
are applied (unlike when loading an ELF binary, where afaik base relocs
would be ignored, even if there were any), then this calculation is of
course going to be wrong. Can't we correct it though, to properly resemble
PIC code:

        /* Calculate the load base address. */
        call    1f
1:      pop     %esi
        sub     1b - start, %esi

or (because start is in a different section):

        /* Calculate the load base address. */
        call    1f
1:      pop     %esi
        sub     $sym_offs(1b), %esi
        add     $sym_offs(start), %esi

(or something along these lines)?

> Consider .Lnot_multiboot label call, here we didn't set %esi and in my
> case (GRUB using PE) the EFI version was used.

How does %esi matter at .Lnot_multiboot? It starts mattering from
x86_32_switch onwards, and it is being set there.

>> There are many more uses of sym_esi(). Why is it only this single one
>> which poses a problem?
> 
> Because potentially %esi is not set (see above example, but better to
> make sure is always valid) and becase potentially for EFI code is
> relocated.
> IMO stripping relocation and calling C code (like efi_multiboot2)
> supposed to be execute at a different location is a bomb waiting to
> explode.

Yet that has been working fine for xen.gz? There definitely is a risk,
but that risk isn't new afaict.

>>> Also, in some case %esi register (that should point to
>>> __image_base__ addresss) is not set so compute in all cases.
>>
>> Which "some case" is this?
> 
> In __efi64_mb2_start path there are some. Note that we use %rsi for
> different purposes there.

All cases there where %esi would matter branch to x86_32_switch first
afaics. As mentioned, %esi is being set one of the first things after
the x86_32_switch label.

>>> Code tested forcing failures in the code.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> No Fixes: tag?
> 
> Not sure here, should I open some ticker and refer to it?

Well, now that I learned that you're trying to add a new boot mode,
there's no need for a Fixes: tag. Yet the patch title then also
shouldn't say "Fix" - that made it look like you're addressing some
problem with one of the existing boot modes we have.

Jan

