Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994DCB204DB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077227.1438302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPPv-00057q-GM; Mon, 11 Aug 2025 10:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077227.1438302; Mon, 11 Aug 2025 10:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPPv-00055I-DW; Mon, 11 Aug 2025 10:06:11 +0000
Received: by outflank-mailman (input) for mailman id 1077227;
 Mon, 11 Aug 2025 10:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulPPu-00055C-PT
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:06:10 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc9224bb-769a-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 12:06:07 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-af9180a11bcso824590366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:06:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0f4sm1981443066b.106.2025.08.11.03.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:06:06 -0700 (PDT)
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
X-Inumbo-ID: cc9224bb-769a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754906767; x=1755511567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rwa5hDRlm6ED9r8XhxDoq0M3ih9cHxB9U4KsWn+JG1g=;
        b=SEuTIiyroxQWsZnZFKi3Ow89B1b/qK4EYv+qhDuOh8TELgyOxdyJvLucnBVN3RIPTm
         uKENaIOLFgURtoeCLiPbMWpVYdYPY2a9IrTaq0LyazwDJa88vWw9g/WOENbUToqcDQVC
         RWp+XJsfCNx92Dc3yFzm0cXkNj26lm0scLOJoQTbivbpg5y3Nkn2ksOojW7o+4BMZdj/
         MfbLXZMtp4hDV4hqTR7Ba6Au3I5tnI/JbW9E1oBrnSPtWMAzDwhIZMDeCT47eaM/qJ55
         +bKILvc70POmkIa7sCXdzCgJqG8ajXilXKB3Gg/NVeqvDh6htBp4yuGPyibOUeOPwhcj
         LAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906767; x=1755511567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwa5hDRlm6ED9r8XhxDoq0M3ih9cHxB9U4KsWn+JG1g=;
        b=gE634+DT5XlyJPm77JZSPxnzl7QZUwLfaOOKjrtqfRwvmuSJGWgXUYI8KSweF8BPAS
         GSXvqhYygI33JkllrIiGAjHkBHCvPHnyeoC/DlN8owNsdZuxszBs85CLHWqulYFiTo3r
         9ZxoAIuIRsGp+UOnrpkCGyNTYyBWSmH3LwQPYDgpVgwQzM7qDh/PrUbfwH9kB0/RX2Bs
         01vrB9zcSybwiws6Vy2ZFDR87ihB02NaytYYhQ5ugyQsl6ubxf5vR/gyV3DfIEk41rA3
         V1V0Q9ia5nNSZ+awFT3vXpPXIqULOFhYa5R2c/cfhHfCJMNKXyLlfkOwQVrRg2UtrTTd
         p2hA==
X-Forwarded-Encrypted: i=1; AJvYcCU9p/cdGJ44Ejm/tH6NpLs9fjOuc2NAIFVavHSH+rpLkZrsNxGaqu13Rh3w2jQKLvW95Artp1Jxka0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9dbBYOSf3Ah/Pd0ieKn/eZKnNoxr/6FO99c5b7NXgSPGayubm
	vNXuwkLqLc2emZBto3FNrm3iBBloWbVU72HX4QOd5nUVWuYcr/qPl0rChZA9P3WXYg==
X-Gm-Gg: ASbGnctFTrWae+Wojeh3LED6AvlR6xHPBA89EMe/4zELuH14e4I09YSzMicnV1ENxxy
	yhrfGo4ivZcDIz0ul11vrz3goaRGP3FiRJL3OUkM9ZM6e8DlLuEGu1HwOOpZhuKRPKaoPbUzTKa
	/bu275Rc/av412sRFMkaCf9vT+5ObN7X0fgEbPxlyRfon2TOubrAQFd43TLbgXkuWiRkFq+dgmF
	sqjywIMMw52Wp5Pt0zwv4viQZsf3+lEH5TSsuM+0B+LnqDDJW/msDBLFBBTiTX7coG/MS9BHy5S
	MXGLZ4rx/3Sb/dQK1C+5zBl0glbqLjTfgTOjwhZt2PDc4NoWi8FWZZclOYeNuoSn+aNdsglToV3
	CP0badrP4+4e0ETOT8ihqQfFsFaU/C7n6WTR5lGNRHviiKWl86zsaLVNnJ/K8jlhHwM68KabJRH
	fcFCt4Gf6m2shlBC9FqA==
X-Google-Smtp-Source: AGHT+IEgVEj6auOp7ZrFVpVoEHVOLgA1m1YaSccgB1Vsd0mMKCnfEfyqzXZQw/4SWPCzt5dS8N1XPQ==
X-Received: by 2002:a17:907:d16:b0:af9:8739:10ca with SMTP id a640c23a62f3a-af9a3ebc937mr1689572966b.28.1754906767255;
        Mon, 11 Aug 2025 03:06:07 -0700 (PDT)
Message-ID: <d6b13991-e158-4232-8850-44c0b027edbb@suse.com>
Date: Mon, 11 Aug 2025 12:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC x86/msr: Use WRMSRNS $imm when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
 <e81bc459-347c-4eb9-8f8e-ada25fe8966f@suse.com>
 <0d78dd8e-af92-4b29-9706-e08c2c06ee89@citrix.com>
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
In-Reply-To: <0d78dd8e-af92-4b29-9706-e08c2c06ee89@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 11:50, Andrew Cooper wrote:
> On 11/08/2025 9:16 am, Jan Beulich wrote:
>> On 09.08.2025 00:20, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/msr.h
>>> +++ b/xen/arch/x86/include/asm/msr.h
>>> @@ -38,9 +38,46 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
>>>          wrmsr(msr, lo, hi);
>>>  }
>>>  
>>> +/*
>>> + * Non-serialising WRMSR with a compile-time constant index, when available.
>>> + * Falls back to plain WRMSRNS, or to a serialising WRMSR.
>>> + */
>>> +static always_inline void __wrmsrns_imm(uint32_t msr, uint64_t val)
>>> +{
>>> +    /*
>>> +     * For best performance, WRMSRNS %r64, $msr is recommended.  For
>>> +     * compatibility, we need to fall back to plain WRMSRNS, or to WRMSR.
>>> +     *
>>> +     * The combined ABI is awkward, because WRMSRNS $imm takes a single r64,
>>> +     * whereas WRMSR{,NS} takes a split edx:eax pair.
>>> +     *
>>> +     * Always use WRMSRNS %rax, $imm, because it has the most in common with
>>> +     * the legacy forms.  When MSR_IMM isn't available, emit setup logic for
>>> +     * %ecx and %edx too.
>>> +     */
>>> +    alternative_input_2(
>>> +        "mov $%c[msr], %%ecx\n\t"
>> Simply %[msr] here?
>>
>> And then, might it make sense to pull out this and ...
>>
>>> +        "mov %%rax, %%rdx\n\t"
>>> +        "shr $32, %%rdx\n\t"
>>> +        ".byte 0x2e; wrmsr",
>>> +
>>> +        /* WRMSRNS %rax, $msr */
>>> +        ".byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
>>> +
>>> +        "mov $%c[msr], %%ecx\n\t"
>> ... this, to ...
>>
>>> +        "mov %%rax, %%rdx\n\t"
>>> +        "shr $32, %%rdx\n\t"
>>> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
>>> +
>>> +        [msr] "i" (msr), "a" (val) : "rcx", "rdx");
>>         [msr] "i" (msr), "a" (val), "c" (msr) : "rdx");
>>
>> allowing the compiler to actually know what's put in %ecx? That'll make
>> original and 2nd replacement code 10 bytes, better balancing with the 9
>> bytes of the 1st replacement. And I'd guess that the potentially dead
>> MOV to %ecx would be hidden in the noise as well.
> 
> I considered that, but what can the compiler do as a result of knowing %ecx?

For example ...

> That said, we do need an RDMSR form (which I desperately want to make
> foo = rdmsr(MSR_BAR) but my cleanup series from 2019 got nowhere), and
> in a read+write case I suppose the compiler could deduplicate the setup
> of %ecx.

... this. But also simply to use a good pattern (exposing as much as possible
to the compiler), so there are more good instances of code for future cloning
from. (In size-optimizing builds, the compiler could further favor ADD/SUB
over MOV when the two MSRs accessed are relatively close together.)

Jan

