Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D787CE94
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 15:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693880.1082534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8MB-0007TR-4j; Fri, 15 Mar 2024 14:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693880.1082534; Fri, 15 Mar 2024 14:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8MB-0007R2-27; Fri, 15 Mar 2024 14:16:23 +0000
Received: by outflank-mailman (input) for mailman id 693880;
 Fri, 15 Mar 2024 14:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl8M9-0007Qw-P4
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 14:16:21 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98760556-e2d6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 15:16:20 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso2928153a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 07:16:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f19-20020a170906085300b00a45a72fadfcsm1744066ejd.23.2024.03.15.07.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 07:16:19 -0700 (PDT)
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
X-Inumbo-ID: 98760556-e2d6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710512180; x=1711116980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux6YLkUzuGMO9KL0ahBLZ7FHL+CpXBtBJEPOPKwtP9w=;
        b=ZDfYWn6Qj56HC1m/QCMrEXfX04zWddz64B0LkkBJekmf5s9fqJOYm5s4bJOg7P73sk
         VO+jMtqFdog/KJj4qqchLA6jv1UUrrpMJ9O960wNuTCSb1pjXpjshhjcwOJe7WPHjAt8
         LFmfn7es+X1uf/Wn++f9j9Id27DOYG75jRllak3UCPhNoPHmYcnFC5SxqlTghzq2Hc7h
         +eYPyTdb7zK4tCZnF0J+F3tpMjNh6hksPA6I5Rf1v7t7AkALnfN7mqypdoerdeL7Fjvk
         5Zrlpmh1Yr2vNJFN3hFKmfAyAvjdZrU7Hkf9rHIVUSfsTGR93Q8yRuDlb92bgrJytJ6/
         3xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710512180; x=1711116980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ux6YLkUzuGMO9KL0ahBLZ7FHL+CpXBtBJEPOPKwtP9w=;
        b=GQsKpYGcvaTcwiKbElEHfoilEKgMk6i7kItSwR2IKeBARmxt7Bpj213erJD32smZ1O
         ubwF6Kq2YIgioR8wUHPDqVd+iCas8nmVDQKGYnUv1CEo4RihQ7yQbqttpBc8vhLOX+aQ
         Ypy/EoyAZswbUCnm7FiO1mTo/yIflGVAMbnyWfogIzri/hWVxVdf7QX1C74azkSpns/L
         bCU5LbdmiYx2BUJUWJTQrP5e6LeFf8a7sjg9AbvB3AJIPRLQ1VWlQuyJZNhFzZPHNa4P
         FDG2Xlp4mofFm6fWxgRLBTub+qBNhk+Qi+X9im7x0OF6c16OghAGOYPbbpmhBE9oQHZf
         ATyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIkTgLwgVVjtx/Eyo9J3+MgSXTSudzTRATLNn0yt01fQXfLpHeIVVC7NkIWAVKBNJOhgRU1yHosv/xY8mRPc8yT/jb/ZPH9Pssw0fsNbs=
X-Gm-Message-State: AOJu0YwNap8ZKLv7DhR8lQ+WocBydC+jvvNv2kKJsQmeKKDRR/b/FdPF
	X54m2Nt37ms/jrJR7Mh5my3TyAzb1BEF2tQKDoqL/hCc/jo3nmfY+R5x45TgmA==
X-Google-Smtp-Source: AGHT+IGd3EvBovu9+rdIOoqYtmnQVVHquQCxnZDmHTNo9nWvOILw3OaO+zpn5cVCXZtqsL/wUWUg6Q==
X-Received: by 2002:a17:907:a095:b0:a46:2445:632a with SMTP id hu21-20020a170907a09500b00a462445632amr4093696ejc.16.1710512180144;
        Fri, 15 Mar 2024 07:16:20 -0700 (PDT)
Message-ID: <bb7b9ff2-0a40-4287-aeb7-f798562cb63a@suse.com>
Date: Fri, 15 Mar 2024 15:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] xen/bitops: Delete find_first_set_bit()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-8-andrew.cooper3@citrix.com>
 <926895a0-f777-4e17-951f-6df0cc24b0f2@suse.com>
 <c2b62892-e534-4674-9869-523403c5fcc1@citrix.com>
 <33ed3c99-65e2-4ba9-9ff8-7934ecdf26f6@citrix.com>
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
In-Reply-To: <33ed3c99-65e2-4ba9-9ff8-7934ecdf26f6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.03.2024 14:48, Andrew Cooper wrote:
> On 14/03/2024 5:14 pm, Andrew Cooper wrote:
>> On 14/03/2024 3:59 pm, Jan Beulich wrote:
>>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/include/asm/bitops.h
>>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>>> @@ -401,18 +401,6 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
>>>>      r__;                                                                    \
>>>>  })
>>>>  
>>>> -/**
>>>> - * find_first_set_bit - find the first set bit in @word
>>>> - * @word: the word to search
>>>> - * 
>>>> - * Returns the bit-number of the first set bit. The input must *not* be zero.
>>>> - */
>>>> -static inline unsigned int find_first_set_bit(unsigned long word)
>>>> -{
>>>> -    asm ( "rep; bsf %1,%0" : "=r" (word) : "rm" (word) );
>>>> -    return (unsigned int)word;
>>>> -}
>>> And you think it's okay to no longer use TZCNT like this when available,
>>> where the output doesn't have to have its value set up front?
>> This is a particularly evil piece of inline asm.
>>
>> It is interpreted as BSF or TZCNT depending on the BMI instruction set
>> (Haswell/Piledriver era).  Furthermore there are errata on some Intel
>> systems where REP BSF behaves as per TZCNT *even* when BMI isn't enumerated.
>>
>> Which means this piece of asm suffers from all of an undefined output
>> register, undefined CF behaviour, and differing ZF behaviour (I believe)
>> depending on which hardware you're running on.
>>
>> The only thing the REP prefix is getting you is a deterministic 0 in the
>> destination register,
> 
> No, it doesn't.
> 
> For a zero input, TZCNT yields the operand size, so you get 16/32/64; 64
> in this case.
> 
> It also means there's no chance of coming up with a useful alternative
> for ffs() to use TZCNT when available.

Right, for ffs() TZCNT isn't suitable. But for find_first_set_bit() it was,
yielding a reliably out-of-range output for zero input (which BSF wouldn't
guarantee).

Jan

