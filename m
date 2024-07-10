Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33892D4BF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 17:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757012.1165742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRZ0U-000592-M8; Wed, 10 Jul 2024 15:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757012.1165742; Wed, 10 Jul 2024 15:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRZ0U-00056v-JC; Wed, 10 Jul 2024 15:13:22 +0000
Received: by outflank-mailman (input) for mailman id 757012;
 Wed, 10 Jul 2024 15:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRZ0T-00056p-4f
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 15:13:21 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f1f86b-3ece-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 17:13:19 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eebc76119aso16673451fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 08:13:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a0fbf0sm34939385ad.21.2024.07.10.08.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 08:13:18 -0700 (PDT)
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
X-Inumbo-ID: f0f1f86b-3ece-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720624399; x=1721229199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8lF4I8AEIBLB9fVR0igxdz+B4B6pV1taLWWHmMDXPeI=;
        b=g5vc8HRJQGbJdzzIO+dBY/eOgGgxpvbae4UYW8rb5cl+e5U2ZGvMCQgx+KB4wAZ5By
         fcpqo3qzUnTVMEEAzbiSi9CqeukxwCCiqifwT1Q/4a2RUyjChenRbR73gpo8yKsTQR32
         FFmRP7I7RlE/yeCrkHu9LHoDljSgAvJXfVWxdlB8arZJvuXiXxXVBL3ae6PWSRZ7iLbW
         WkPRUQ4ir+LXCGA4AiWLPiuOrqoHR0FzNkzFSLFhLx8Cj6MwXUA1Dc37pNuvCBuwvSwU
         i/wGgERDnPkq0DSej5FP+eibMvH2gkhOdrshsabHXT5QFSOtMCrhnrXZ0YWnQDeJ73mk
         VB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720624399; x=1721229199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lF4I8AEIBLB9fVR0igxdz+B4B6pV1taLWWHmMDXPeI=;
        b=JYPck6cZ/JODd/coJPVkZAJizLJjcobFkSP2TeJar3wnJqWYKrLHLbn3JgpvrfuCBb
         FtkyLa9aoR1g/GgGf+OcxGQKdHOtdJpFi7gMTT3shyt+bbnZkUSN9nueik527Msq+keA
         Sc1Zird+FwNRiBrFZQUqUdGuuLp+qhzeCV6I10wJKWxK2XSFjzGv22Y4SwwmFN5A8vKW
         1T50FIc1kmeAR8ASjvPKMqejHH7cxInv7fAkAyxmt65cf2UvHIaSbkkG9g0Dwdnn/dMe
         QmBV6jnm1jnx2hGNqu2tuAM3N82CEl4TjZ0xFUCFVjbAzQbCZSKC/Zz9v4R3kDw0hwUM
         IdJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdzdR01wej2OYm/LQyDZak/RSDSiZu305Am+xvOhQOghY9aZhbAJU/h02NGKtdtw2kFAcG9jqyQR56j3IlBq6xazxlIH7/TdcNloMq1V8=
X-Gm-Message-State: AOJu0YzVngNrr96IjfCciwBULy3QerOVKyIhjJx52bqiIpyPE41APD/x
	ZGhOr+0SfB36DObI2Xj7/+0PKmbSW/FEsYuib9lpaxplAQo3hhJeKKIIwJMXjA==
X-Google-Smtp-Source: AGHT+IGMCvgqqsl5Un+jkFgnMc/6zBQfyBhLEiVoyhgSFYlUuMctc0npyTjRDjGmXywNuYe0Slc8vQ==
X-Received: by 2002:a05:651c:d4:b0:2ee:7dfe:d99c with SMTP id 38308e7fff4ca-2eeb3103d25mr40898501fa.31.1720624399288;
        Wed, 10 Jul 2024 08:13:19 -0700 (PDT)
Message-ID: <8b41f1c5-a828-44d3-87f5-1d130cc23636@suse.com>
Date: Wed, 10 Jul 2024 17:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: PE/COFF image header for RISC-V target
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: milan.djokic@rt-rk.com, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Nikola Jelic <nikola.jelic@rt-rk.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
 <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
 <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
 <CAKp59VHkEpKMNpA18xjHp4n_XxA4Fbo121v5ApoTseyhirkM+g@mail.gmail.com>
 <f8cc1555-7689-49ff-9114-13354f1553cd@suse.com>
 <CAKp59VHJQYHA2G=AzoXUeQjjVfQfyqqPWqocrr_k9L_r=wHY3w@mail.gmail.com>
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
In-Reply-To: <CAKp59VHJQYHA2G=AzoXUeQjjVfQfyqqPWqocrr_k9L_r=wHY3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.07.2024 16:44, Milan Đokić wrote:
> On Mon, Jul 8, 2024 at 11:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.07.2024 19:21, Milan Đokić wrote:
>>> On Wed, Jul 3, 2024 at 5:55 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 03.07.2024 02:04, Milan Djokic wrote:
>>>>> +#ifdef CONFIG_RISCV_EFI
>>>>> +        /*
>>>>> +         * This instruction decodes to "MZ" ASCII required by UEFI.
>>>>> +         */
>>>>> +        c.li s4,-13
>>>>> +        c.j xen_start
>>>>> +#else
>>>>> +        /* jump to start kernel */
>>>>> +        jal xen_start
>>>>
>>>> JAL, not J? Why?
>>>>
>>> We use jal explicitly here to highlight that we want to occupy 32 bits
>>> in order to align with header format (and EFI case where we use two
>>> 16-bits instructions). Although it will also work by using "j"
>>> directly, it could be implicitly compressed to 16 bits (if C extension
>>> is available) which would make header layout less obvious imo.
>>
>> According to e.g. ...
>>
>>>>> +#endif
>>>>> +        .balign 8
>>>>
>>>> This won't do what you want unless "start" itself is also suitably aligned.
>>>> It'll be as long as it's first in the section, but better make such explicit.
>>>>
>>> I understand, we'll also explicitly align "start"
>>>
>>>>> +#ifdef CONFIG_RISCV_64
>>>>> +        /* Image load offset(2MB) from start of RAM */
>>>>> +        .quad 0x200000
>>>>> +#else
>>>>> +        /* Image load offset(4MB) from start of RAM */
>>>>> +        .quad 0x400000
>>>>> +#endif
>>
>> ... the #ifdef here, you aim at having code be suitable for RV32, too.
>> However, JAL has a compressed form there, so its use would make things
>> "less obvious" there as well. I'm inclined to say that since the
>> subsequent ".balign 8" adds padding NOPs anyway, there's no real
>> difference whether that adds 32 bits worth of NOPs or 48 bits. If you
>> really wanted to "hide" the difference, imo ".balign 4" would be the
>> way to go.
>>
>> In any event, if there would still be a reason to stick to JAL, you'd
>> want to name the reason(s) in a code comment.
>>
> No specific reason to use jal from a functional point of view, just
> aesthetic reasons as I mentioned in a previous comment. Also jal is
> used across head.S file, so we also keep some consistency in that
> manner. I just don't get the reason why "j" is more suitable as a
> pseudo instruction since it also comes down to jal as a base
> instruction.
> Of course, we can easily switch to "j" here, just want to know why we
> are doing so.

Consistency with the other path, which uses C.J. Plus avoiding questions
along the lines of mine: Why JAL when this isn't a function call, but a
plaing branch?

>>>>> --- /dev/null
>>>>> +++ b/xen/include/efi/pe.h
>>>>> [...]
>>> Regarding pe.h file content, we wanted to keep it as generic as
>>> possible (structures definition according to PE format which can be
>>> used for multiple architectures). Specifically for RISC-V as you
>>> noticed, we are not using lots of structures (data directories,
>>> relocation structures, certificates, etc.). Therefore, we can reduce
>>> it to only those used atm, but in that case we won't have a generic PE
>>> header definition anymore. Regarding structures which are already
>>> defined in common/efi/pe.c, meaning that with our change we have two
>>> versions of same structures, we can remove those, but in that case it
>>> could be confusing for someone who is trying to map fields from pe.h
>>> to actual image header in assembly code. Summary I would keep this
>>> header with its original content, but if you think that it contains
>>> too much overhead we can reduce it to relevant structures only.
>>
>> Actually I not only don't mind this header, but would consider it
>> superior to the present state of things. Just that then imo it would
>> want introducing in a separate commit, with suitable description /
>> justification. That could (should) then be followed by a patch using
>> this header's struct-s / definitions in pre-existing code, purging
>> any duplication from there.
>>
> So we should have one commit for pe.h only, a subsequent commit where
> x86 implementation is modified to use structures from pe.h and a third
> commit where we add EFI stub for RISC-V?

That's (in my view) the minimum level of splitting, yes.

> And we can submit the first two commits separately from the RISC-V EFI
> stub for which we'll wait on @Oleksii opinion on whether EFI
> application format is needed upstream?

Yes. I also wouldn't insist on the conversion part to be done right
away, just as long as it gets done not too far in the future.

However, since you say "whether": Imo the question isn't whether we need
that (the answer there is Yes as long as EFI exists for RISC-V), but
what form it should take. If we can properly link an EFI binary, I'd
generally consider this preferable over any hand crafting. Yet of course
there may be reasons why using the tool chain has to be ruled out.

Jan

