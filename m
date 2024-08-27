Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A72961365
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784229.1193628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siyXf-00043B-JQ; Tue, 27 Aug 2024 15:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784229.1193628; Tue, 27 Aug 2024 15:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siyXf-00040g-Gk; Tue, 27 Aug 2024 15:55:35 +0000
Received: by outflank-mailman (input) for mailman id 784229;
 Tue, 27 Aug 2024 15:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siyXe-00040a-C9
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:55:34 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c921a9f4-648c-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 17:55:30 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff443so6560145a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 08:55:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e594e809sm124144866b.219.2024.08.27.08.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:55:29 -0700 (PDT)
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
X-Inumbo-ID: c921a9f4-648c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724774130; x=1725378930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=niKBLfDuQyq3nbWbh5tdu7wA7idV67hA9CxZQeeYDik=;
        b=JlCyv+0R6GpzLHL6NnK34QPBsGAFAeWIP+vktmcqjLJC4VgMJkmm4qlBgVLuwEGFsP
         KmDOcmEXkqDXVIo4pFaCQ7gvUa0ku1dYXONaRmekkjrBOeb+euPHcdVIXC2VcBj3PaLI
         4wMMdwuic+0b1kbXhNKjbQ52/cZgVrYmbFswHy+7GVNGB4g6kgAvigF5vKkI+tydAaoW
         u2eCsuefh8cjynhVv784j2M9Xz3oZR1X6h4hYCJd/EbTzF3uNXjLg01l9RI4ugmzA7Sc
         9VClJy0sjNszqWoNzWdyoVdQNSZk5P6KaY+Q81NimtHlOywFkTwzvV8sTZjt34A4ScCC
         tuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724774130; x=1725378930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niKBLfDuQyq3nbWbh5tdu7wA7idV67hA9CxZQeeYDik=;
        b=o3eKDTB+5qqD9vMvexU0tfXcVvFzRzilDF/tbKkBjo7GrSNVWaRbn18oNYJqgVPI1v
         p8i3XkxKFL1VD8OsMQxXTK8v02BLxxWPlE8mmox7ZoIj40RhYcYowpjFdirVA01RgcjP
         mlgFb87x23NhaAw9EyW/XN7g9RMxj8y+QSwByIgRyVh0KjDT0TiNwkjOrAV1eQi4a863
         gOKer3BjLhgbxmkAcct+m6JC8TD3RO5fXl+poK6dUtyEx1cLXCVwSnYp4DJQ4zO40Vq1
         zSQ3hs87MDwRggOpWD03g9LbrWUqOeuZT8dAzyVHvh2DvcFKBC6Yi456L9sU3h6LHz7H
         2dmw==
X-Forwarded-Encrypted: i=1; AJvYcCXh1Mp3Vbi4cW5bSJlPTcoa7mdFKH3VRXH0h/A3bJ5L0JOtx/s3KR1qq4yjGJWYNY+3+R+pJLZbxAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4zY1+HVnZ31E4zpt/MxFOLgZl8/kh6p4PuxIUf5P3l19HcRDn
	2rQOk79b+gX4HxQxhi8oSEKZGQJ8fDcoIwRkNQEv8nKAJ0IPMy/k2WjFLyeYbA==
X-Google-Smtp-Source: AGHT+IGelQYwIc1IlBvbq9eaN+6UkAiym28qD6xcS53GW6Z6H/qyJpzZ1poLFvY/QhAKJZayVsD1vQ==
X-Received: by 2002:a17:906:f590:b0:a86:8ec7:11b2 with SMTP id a640c23a62f3a-a86a54f124cmr955737266b.59.1724774129847;
        Tue, 27 Aug 2024 08:55:29 -0700 (PDT)
Message-ID: <773b4710-46c4-4bc3-bf53-623bf666cfe8@suse.com>
Date: Tue, 27 Aug 2024 17:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com>
 <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com>
 <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
 <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
 <a3d901f9-0a74-4cef-b616-77d338dda314@suse.com>
 <CACHz=ZgCd81NV7yXZ-Lud-QP8sj05mH9N0c-1z=eBv3pz2ENAw@mail.gmail.com>
 <f5519911-6a3a-468a-98ec-3345339847cd@suse.com>
 <CACHz=ZhuFgTjbGJp-prENbPAM03SoGJ-=+8M1az_TZ3vsG2TEA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhuFgTjbGJp-prENbPAM03SoGJ-=+8M1az_TZ3vsG2TEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 16:56, Frediano Ziglio wrote:
> On Mon, Aug 19, 2024 at 4:50 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.08.2024 17:30, Frediano Ziglio wrote:
>>> On Mon, Aug 19, 2024 at 3:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 19.08.2024 16:16, Frediano Ziglio wrote:
>>>>> Could I ouput the trampoline in a code section ("ax" instead of "aw")
>>>>> and then later move it into .init.data section assuring .init.data is
>>>>> writeable but not executable?
>>>>
>>>> Could you go into a little more detail on what you mean here? At the
>>>> first glance my reaction is "yes, sure, why not", but much depends on
>>>> what exactly is meant.
>>>
>>> For instance you could put the trampoline into a
>>>     .section .init.trampoline, "awx", @progbits
>>> section (having the "x" will be disassembled by objdump -d head.o).
>>> Then in xen/arch/x86/xen.lds.S in the .init.data section having something like
>>> ...
>>>   DECL_SECTION(.init.data) {
>>>        *(.init.bss.stack_aligned)
>>>       (.init.trampoline)
>>>    ...
>>> this will put the trampoline in .init.data section of the final
>>> object. At this point the .init.data containing code will have execute
>>> permission that you would have to fix using objcopy command.
>>> The final trampoline will be in a data section not executable so to
>>> use objdump you will need the -D option, but not disassembling head.o.
>>> In theory we could keep the temporary object file before the objcopy
>>> adjustment to avoid the -D but I don't think it would save a lot of
>>> burdain.
>>
>> Part of my "want to be able to disassemble" also applies to the final
>> binaries. Since iirc one can disassemble individual sections, an option
>> may be to have .trampoline be its own section even in the final (PE)
>> binary?
>>
>> In any event, especially as long as there is no really good option, I
>> think I'd like to have input from Andrew and/or Roger as well.
> 
> what about having an extra copy in .init.data. That is, compile the
> trampoline in .init.text having it readable/executable in the final
> PE, at the beginning copying into .init.data and handle the changes
> there then when we can allocate the final memory allocate it and copy
> the temporary writable copy into final lower memory area.

I dislike such duplication, and I'd fear it may cause more confusion
than to actually help. Plus you'd need to sort the symbol name clashes.

> On a related but not too much topic, I noted there's no .init.bss.
> Maybe we could allocate .init.bss (and .init.bss.stack_aligned or
> whatever .init.bss.*) at the end of normal .bss and "cut" it while we
> remove .init.text and .init.data.

How would anything (in C) use .init.bss? __attribute__((section(...)))
doesn't make @nobits sections (last I checked), and .init.bss that's
@progbits is not really different from .init.data.

Jan

