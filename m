Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80532AD5363
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011605.1390041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJOm-0003P5-RR; Wed, 11 Jun 2025 11:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011605.1390041; Wed, 11 Jun 2025 11:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJOm-0003MW-Oi; Wed, 11 Jun 2025 11:13:40 +0000
Received: by outflank-mailman (input) for mailman id 1011605;
 Wed, 11 Jun 2025 11:13:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPJOl-0003MQ-IP
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:13:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fb8584d-46b5-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:13:38 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-442ea341570so43246625e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:13:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236034050fasm85268415ad.146.2025.06.11.04.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 04:13:37 -0700 (PDT)
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
X-Inumbo-ID: 1fb8584d-46b5-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749640418; x=1750245218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wseSpK5KfbzeQolgYUIbSSWmLkd5z3FwjPuWNFkf9aw=;
        b=M2LmtewmOtNTpVm3sPwXvDLAAbOdlpt/B/LyKwlMGC3QSpwy8qDFfx9YtkwLHuXlQr
         0EMB/I4VFf6H3a9Ra3/44x3UDSGhU0Pvo0QofJhROkkv73OxrxKIfdqW2zhgauDpV2so
         DuhXle7pNIlhQOe5u2L6GMCrImLEm+wGWGyX4h4Myujawxf0kCEqmoRo4JElRHRD0OO1
         Dl4itANJcArIpuz8wwuWOoS98wOLlaGWxQ4bmWXP5neI0aYDV7Qr1TuyuvyYDqv3sELi
         M+g2vg54vh0PqEm/dP4SmKKn8q44l1ybqs7ta80leFTRjiUWV99MDK1KD7FfCNwuphGt
         ZeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640418; x=1750245218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wseSpK5KfbzeQolgYUIbSSWmLkd5z3FwjPuWNFkf9aw=;
        b=ddvXnppHKwM77w8zzRCukoh93OCLoo5a5Mn25Kr0/+zXgr3ofV1O5WrZHZF2+aVpPi
         btuWmWm9RsF2BinTuy+lMW4dmfDpoDs2rurBGyhj0KLLT2sCXFhuHK1xxPEI8nt8ew4U
         rIeIU5Q/tBeeFRNUawD5EDNuSBV9aKDwGajdRj2BpCOrVrmECkq/JAYXnwovCxv3u/3k
         b3hLj0DtG8L7927HYMNFAE8dde0tW5zI8QZrwEtjQPQmUiRr80abxsQtZD+bELvZvNCI
         EHnQwjothERgOJHtyCUbcJ4o8LI6qVTjWC6Xzjy67XQqE827Q5QNm4b9jKwuQtgJRE2b
         949Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEEMNYfmMIkFnsVyf2RkjsLgICDSsppwasqjUED1QSjnS6ATfIQdn8PANhWaotvceCluCRJZSUY0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCu4j+j8kHXIhdAe5yEZTPuCI5E6ssn9pSgL+hc3npiskEdLjz
	WbrLXhjbInOwoHYwKFYLEamWHl2Zv88b4xWm6hx94xvAowsovHQifF+TCwGijggcNA==
X-Gm-Gg: ASbGncvqM1YMxAl2uYviovObNINjPP3OrJ2kiYeH3DkMnBZMI5kYeKt6LJG7N6Z+bcj
	V9dFeqHrIMRYeQkWLflwalfGeSr0a+tSJRRYKM58lYtnU6/htx6tFhCgU8AEwWBoP+avDswrL5b
	OCpB8wNfLBab+Low4ditKOHB9xApcxI9IPGJ5ZSUdYjOx5j03MTLx/ma2TkiUurWzT5f0PglHFU
	GcUKx+D8Sz8ga5+VO3AtIZ6Cyp6GKybvZM+AAdPz08QwPuu9NZd8S64ijZ/UZxkVoMmGBTLJgOq
	txX2BTUzqryvfQinTg09Uwi4423vPsC6BRjqtaHmcZGPMpbmopJYvCErbqHGxVaf1/3DadZ68HC
	DMKKKDqPiOYhEa0v4f+9xfVa16GLWsbOoZ6/S4377/uaTdZ0=
X-Google-Smtp-Source: AGHT+IFgayhYv4qXtue7iIMlvR3SrL1HZ7vrQGjWH8IexfoEYsBolZOEAMGoXh1K6qMxc0FABpUZyw==
X-Received: by 2002:a5d:588c:0:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a558b09e25mr2278188f8f.56.1749640417775;
        Wed, 11 Jun 2025 04:13:37 -0700 (PDT)
Message-ID: <cd3fa87f-5dca-4d8f-b25f-a159f9b2859e@suse.com>
Date: Wed, 11 Jun 2025 13:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250610101228.24460-1-freddy77@gmail.com>
 <02162717-25de-4ffb-a9c4-bf6d580c43bc@suse.com>
 <CACHz=Zg5NDFOd5rinj-72TC82SiaQZbKErmLudLZVCE5kcvQbg@mail.gmail.com>
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
In-Reply-To: <CACHz=Zg5NDFOd5rinj-72TC82SiaQZbKErmLudLZVCE5kcvQbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 12:49, Frediano Ziglio wrote:
> On Wed, Jun 11, 2025 at 10:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.06.2025 12:12, Frediano Ziglio wrote:
>>> For xen.gz file we strip all symbols and have an additional
>>> xen-syms file version with all symbols.
>>> Make xen.efi more coherent stripping all symbols too.
>>
>> And the other difference (compressed vs not) still remains.
>>
>>> xen.efi.elf can be used for debugging.
>>
>> Hmm, that's the result of ...
>>
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -238,6 +238,7 @@ endif
>>>               > $@.map
>>>  ifeq ($(CONFIG_DEBUG_INFO),y)
>>>       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
>>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@
>>>  endif
>>>       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>>>  ifeq ($(CONFIG_XEN_IBT),y)
>>
>> ... objcopy. Having looked at the involved code in that utility, I mistrust its
>> output from such a conversion to really be an exact representation of the input.
> 
> From https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;f=xen/arch/x86/Makefile;h=f514bab30ef8d4ade77a27c926e283c9bbbf9ffd,
> 
>     Today it is not possible to analyse crash dumps of a system in
>     hypervisor mode when it had been booted via EFI, as the crash utility
>     doesn't understand the file format of xen.efi.
> 
>     This can easily be solved by creating an ELF file from xen.efi via
>     objcopy. Using that file as name list for crash enables the user to
>     analyse the dump in hypervisor mode. Note that crash isn't happy with
>     a file containing no text and data, so using --only-keep-debug is not
>     an option.
> 
> Isn't that true anymore?

That's likely as true as before - heavily depending on objcopy not screwing up.
I don't think any thorough analysis was done back when that commit was put
together.

>> IOW I'd much rather use the original file. As a possible compromise, could we
>> perhaps merely strip debug info, but retain the symbol table, matching the
>> prior default for $(efi-strip-opt)?
> 
> Not clear the compromise you are intending here, the debug file has
> all information available, why do you need an intermediate one? We
> strip everything for ELF, why not be coherent?

If I want to e.g. see the disassembly of xen.efi, I find it heavily misleading
that I then would have to disassemble xen.efi.elf instead. One can get used to
it, sure. But for xen.gz / xen-syms it just was that way from the very
beginning (plus it's kind of obvious that a *.gz file cannot directly be
disassembled anyway). And for disassembly, the loss of debug info is far less
impactful than the loss of the symbol table. (Hence also why only debug info
was being stripped during installation so far.)

Jan

