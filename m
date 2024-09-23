Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0097ED2A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802074.1212190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssk1W-0001dg-Jg; Mon, 23 Sep 2024 14:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802074.1212190; Mon, 23 Sep 2024 14:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssk1W-0001bl-F6; Mon, 23 Sep 2024 14:26:46 +0000
Received: by outflank-mailman (input) for mailman id 802074;
 Mon, 23 Sep 2024 14:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssk1V-0001bf-1M
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:26:45 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db0dd982-79b7-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 16:26:43 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so597309166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:26:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a49sm1235873866b.166.2024.09.23.07.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 07:26:42 -0700 (PDT)
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
X-Inumbo-ID: db0dd982-79b7-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727101603; x=1727706403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DLDzDQD/wYxIveHU3ko4JiSsiaffwqCRgQeNcU258GQ=;
        b=Y7LiWBiJFY7DtalxHM4MXhbF9wNJYthaFrwVg8y2Jwa2QPWmYh6tfqxKnFRlHzqlv1
         GYrsyiAPzXJ7nlN+pMm3tUBrrBedGb3ER740T8chog05mzm/3CPX9+21e+QzV/JijBd6
         XkofnY1K1yn91cRquFt61BoN7CmBBJaQrqc1KJIVpVt0MeaDtJNEMbr9+B7S0EElBBP/
         Xt9G5ynDzPIktKJqGPozDnXwNFw+l2WazcOKLLzXyeCK0dg3VwUDI4qERRn6LgdWtNBz
         ykb6L2KThB6W7ymA/jLVPDbW8dtArFW4GGXXD7T01Eec9UXooe9jk9dvIafOl7Y6I/fi
         67fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727101603; x=1727706403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLDzDQD/wYxIveHU3ko4JiSsiaffwqCRgQeNcU258GQ=;
        b=mEAbM+8nFdt2sy2xK71zbYZVeux/lYfQOGYtJ7UJzuEunJ8wGwKobygXCTLMVBLUWd
         LMLuPZG+Op+nExbh1g2tLAEZy8F7g8muhN/3svvKAw8XhpOITsPtL/RHEdz3CPTUWTby
         ErTbQhAS825iVJeh7XuGq/94T45F75QHw8WHFN9NFcLh4L7zHO1k4xqt0EQ13iy9SNdc
         CTk2R5SFzed6MtUnBvGukkMEwbQ7SSsYvOtkHudfODT5lU7+I65NlIKmk6Vsrb2OvZm3
         UNy2JXSIQJoacVBL7mojFQfO48EcDmHUXpgiDzXbGQ4un10csuFU79tJ6gQJ0KBTeONb
         3JfA==
X-Forwarded-Encrypted: i=1; AJvYcCUU2rjtgRoZYCulHYKQvSqDJ/pBaLJXosFWbLIu+ZexIeBgOFiWJgb6q0R9+pLQn5q73yst+kN4Bhc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDTVN5T5nJ97+qMjhzhbrgCun6n55oEg9T7y0fxifh5sGLDe+X
	5f0abK8IVN5ix0YXri9Bz4mZjJwcAfgXBiGtV/oYLp1rCqqoZzuis0SFrT3wcg==
X-Google-Smtp-Source: AGHT+IHIHCMdeJ6tPA+kUJI/S636npHuwgETIUQXMQ+loU2KEFUTktP+MYvMiaCEqHvGge6COnUuCg==
X-Received: by 2002:a17:906:dace:b0:a91:158f:6692 with SMTP id a640c23a62f3a-a91158f6847mr98783066b.62.1727101602928;
        Mon, 23 Sep 2024 07:26:42 -0700 (PDT)
Message-ID: <6133b856-1c02-486c-8932-b213e8b9ce0b@suse.com>
Date: Mon, 23 Sep 2024 16:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Rewrite EFI start part in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-4-frediano.ziglio@cloud.com>
 <5cf6fad1-16ce-46b4-9bed-151f936e3772@suse.com>
 <CACHz=Zifc9rKvfxh1EmH5VQQ1YtB7L-GUrBrMP734uc6Uhk_mQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zifc9rKvfxh1EmH5VQQ1YtB7L-GUrBrMP734uc6Uhk_mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 10:25, Frediano Ziglio wrote:
> On Sun, Sep 15, 2024 at 8:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.09.2024 18:16, Frediano Ziglio wrote:
>>> -.Lefi_multiboot2_proto:
>>> -        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
>>> -        xor     %esi,%esi
>>> -        xor     %edi,%edi
>>> -        xor     %edx,%edx
>>> +        /* Save Multiboot2 pointer on the stack. */
>>> +        push    %rbx
>>
>> %rbx doesn't need preserving around a C function call (which will do
>> so itself if necessary). I understand a 2nd PUSH may be necessary
>> anyway, to keep the stack aligned, yet that then would need
>> commenting differently. Plus as long as we call our own functions
>> only, we don't require such alignment.
> 
> Extended comment.
> 16-byte alignment is also in SystemV ABI, I won't remove it in this series.

Except that we build with -mpreferred-stack-boundary=3, not respecting
the ABI in this regard anyway.

>>> +    {
>>> +        if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI_BS )
>>> +            have_bs = true;
>>> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64 )
>>> +            SystemTable = _p(((const multiboot2_tag_efi64_t *)tag)->pointer);
>>> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64_IH )
>>> +            ImageHandle = _p(((const multiboot2_tag_efi64_ih_t *)tag)->pointer);
>>> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_CMDLINE )
>>> +            cmdline = ((const multiboot2_tag_string_t *)tag)->string;
>>> +    }
>>> +
>>> +    if ( !have_bs )
>>> +        return "ERR: Bootloader shutdown EFI x64 boot services!";
>>> +    if ( !SystemTable )
>>> +        return "ERR: EFI SystemTable is not provided by bootloader!";
>>> +    if ( !ImageHandle )
>>> +        return "ERR: EFI ImageHandle is not provided by bootloader!";
>>> +
>>> +    efi_multiboot2(ImageHandle, SystemTable, cmdline);
>>
>> This being invoked from here now makes me wonder about the (new)
>> function's name and whether a separate new function is actually
>> needed: Can't the new code then be integrated right into
>> efi_multiboot2(), thus eliminating the question on the naming of
>> the function?
> 
> If you are suggesting putting this parsing code inside efi_multiboot2
> in ef-boot.h that would change the behavior, which I would do in a
> different commit.
> Currently, there are 2 different efi_multiboot2 functions, one if
> ms_abi is supported, the other an empty stubs. However, some checks
> and tests are done in both cases (ms_abi supported or not). Also, both
> paths uses SystemTable, so I need to parse MBI2 in any case.

It could be slightly less parsing, but I get your point.

Then, as indicated, the function's name needs to change. The present name
simply fails to account for the important-ish fact that efi_multiboot2()
is (tail-)called.

>>> --- a/xen/arch/x86/efi/stub.c
>>> +++ b/xen/arch/x86/efi/stub.c
>>> @@ -17,7 +17,8 @@
>>>   */
>>>
>>>  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
>>> -                                    EFI_SYSTEM_TABLE *SystemTable)
>>> +                                    EFI_SYSTEM_TABLE *SystemTable,
>>> +                                    const char *cmdline)
>>>  {
>>>      static const CHAR16 __initconst err[] =
>>>          L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";
>>
>> This, if not a separate change, wants mentioning in the description.
>> It's a related observation that this wasn't properly updated, but
>> nothing that necessarily needs doing here. Question is whether the
>> declaration of the function wouldn't better go into a header now in
>> the first place.
> 
> I had the same though about a header. But currently there's no such
> header, I mean it should be able to be included by both stub.c and
> efi-boot.h which are both x86 only code so it should go in
> xen/arch/x86/ I suppose. Suggestions? Maybe a different solution would
> be to have a xen/arch/x86/efi/efi-boot-stub.h instead of
> xen/arch/x86/efi/stub.c ?

It's not quite the right place, but maybe (ab)using asm/efibind.h would
be slightly better than introducing asm/efi.h just for a single decl?

Jan

