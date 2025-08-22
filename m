Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE0B30EBB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089542.1447069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upL82-0002zJ-FS; Fri, 22 Aug 2025 06:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089542.1447069; Fri, 22 Aug 2025 06:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upL82-0002xT-Ct; Fri, 22 Aug 2025 06:19:58 +0000
Received: by outflank-mailman (input) for mailman id 1089542;
 Fri, 22 Aug 2025 06:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upL80-0002xM-Jb
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:19:56 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04aec2f3-7f20-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 08:19:54 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso260215466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 23:19:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded2bad79sm541219266b.9.2025.08.21.23.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:19:53 -0700 (PDT)
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
X-Inumbo-ID: 04aec2f3-7f20-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755843594; x=1756448394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qp+yowN7UUJbeLF0dMoyMNCvnvIjXlaYP3G8IQbdIw=;
        b=IikRmlNomdUr+rEDgGyEvx6YGPi9hBUDctcTTv1ihcFj3QrxRzG6DwkuQhxXJyPhjN
         lAIWQKe8SWwH+bi1y8UrXx8gP6Hob9M+x/5jrAlWO+8LNa3KUGOgQoku8yOFCom5W922
         S3ANcke1ZNUjIvMF9iSxve0rYuw/RB9tBasondFIr47mqdquqF8iX64UoRdQqVDip+pS
         pC9IzUfYwOsYMJjBPVHKshGPJF4fVjycwvwBHNuAg7RcyVx4Z3YyQCyi3dOB94aipjRv
         sCohvpdstoFkwLUJdJE/lfbcw/W2fjuXqpdS+6A+pMCjwDqJeY1GI0LHXonS2OHSzlQ/
         ClMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843594; x=1756448394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qp+yowN7UUJbeLF0dMoyMNCvnvIjXlaYP3G8IQbdIw=;
        b=Rtppzk4b0C/dy3i2pCJcD5P6qRjJm21JrvJcJQKXaeylvgLRDlNRdTiIxSLV+8aq3W
         2nrhbNdhtgnpXJpFS4KX53r4CnyoK2j5j+Bs1Eu2Ixp+2+KHhbGzIqgXkllu+CRd40bD
         9QHBksVJxN4RJlufiQM+vxTutvKC+iKmrBp93FJ2JPXNkqj1ds1DuI2cNfwTQj61587p
         Ll27rubvPCwUEJtUU1Y0PmGe3e55lfCcyoov98vJMunWSLowCoZzpHAj7+VBeJ468JMU
         y+hHw/Ie71l1tnhG7Y37j5BnZ65r0J6vnh5xtXyC3liBqti7REdbiWZIZJQSi731v4Ud
         +KnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlfZ6JcTYnyHWGax/to30BNYRQCpyrSXojvnmv0ssH4J3P4+M3gyng2/2/V7cyrQz7A7JbO6P/9t0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFydCvQovwln/4UUiYtFXQ0L/8IdIzaAYHS6rbI01H/i+fU5CM
	JK5eHAUpmZanI7D1D3hIuUdrTDKqqVjNLkGBNEKIdTHp/x2eXs+DN9dgvUZ6fG+1Jw==
X-Gm-Gg: ASbGncuBGtIOtbKoWTbRI8XghKwarymcnM+54K9NkveBceyq7/yUwvubMhLGX3Oip8M
	h+eNGYABtK3EHAkaagg17CQQM2Wbjy7RO/sKT2Qp6icsty2R7xYrq7Ei8j0uUfffo2IDDBKtjcN
	VlCmGvd98TB/TGdd555Q7MqRTCUBb2LaWYcQVbX+mMQqImwVa7d1B2KtqbmnB02cF3RjIA0g962
	AJFnb7YQzN7a5P/4rNtr/GiBfwy4rykuOb2HxVxrUZ8SX7xNNIo16V+WqugU9FrBPR80MDnQDZS
	RmtKFbmITXpDLnxi7X6bIRT5lLSuzR1qT24xg5i/Bh/Sjtebp1LAuo+/fkyQktNiRaVy2F19GOI
	wpmChfo2GIutZdSThmQR0E4/PqYOX3wJCpGMNk1QpUklPX7JIExewH2zPwDSYmaoEdC5BMUoYW7
	0sUppdsADdvfyP13gqOA==
X-Google-Smtp-Source: AGHT+IFGvJGL62mR/o4NIwwOWQoFeCpb3hC7ykXQ6qQcPB5K6dUsPJY97pXiphbZY52v3yOU6V5Lfg==
X-Received: by 2002:a17:907:968c:b0:afd:d9e4:51e7 with SMTP id a640c23a62f3a-afe296bceabmr151924066b.63.1755843593817;
        Thu, 21 Aug 2025 23:19:53 -0700 (PDT)
Message-ID: <f07741bb-ffb1-4c97-8d85-4afdcf9cc182@suse.com>
Date: Fri, 22 Aug 2025 08:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] x86/msr: Use MSR_IMM when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-14-andrew.cooper3@citrix.com>
 <3b367c39-4c4a-4bdd-91cd-7cb8ba18c2c9@suse.com>
 <92abee8e-108a-4d2f-8f05-fb9397b64fca@citrix.com>
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
In-Reply-To: <92abee8e-108a-4d2f-8f05-fb9397b64fca@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 20:59, Andrew Cooper wrote:
> On 19/08/2025 1:55 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/msr.h
>>> +++ b/xen/arch/x86/include/asm/msr.h
>>> @@ -29,10 +29,52 @@
>>>   *  wrmsrl(MSR_FOO, val);
>>>   */
>>>  
>>> -static inline uint64_t rdmsr(unsigned int msr)
>>> +/*
>>> + * RDMSR with a compile-time constant index, when available.  Falls back to
>>> + * plain RDMSR.
>>> + */
>>> +static always_inline uint64_t __rdmsr_imm(uint32_t msr)
>>> +{
>>> +    uint64_t val;
>>> +
>>> +    /*
>>> +     * For best performance, RDMSR $msr, %r64 is recommended.  For
>>> +     * compatibility, we need to fall back to plain RDMSR.
>>> +     *
>>> +     * The combined ABI is awkward, because RDMSR $imm produces an r64,
>>> +     * whereas WRMSR{,NS} produces a split edx:eax pair.
>>> +     *
>>> +     * Always use RDMSR $imm, %rax, because it has the most in common with the
>>> +     * legacy form.  When MSR_IMM isn't available, emit logic to fold %edx
>>> +     * back into %rax.
>>> +     *
>>> +     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
>>> +     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
>>> +     * the compiler can de-duplicate the setup in the common case of reading
>>> +     * and writing the same MSR.
>>> +     */
>>> +    alternative_io(
>>> +        "rdmsr\n\t"
>>> +        "shl $32, %%rdx\n\t"
>>> +        "or %%rdx, %%rax\n\t",
>>> +
>>> +        /* RDMSR $msr, %rax */
>>> +        ".byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
>>> +
>>> +        "=a" (val),
>> Strictly speaking "=&a". Not that it matters much here; just to not
>> set a bad precedent.
> 
> Why?  A is not written to until after all inputs are consumed.
> 
> I don't see how it can qualify for being early-clobber.

Because the very first insn already writes to the register.

>>> @@ -55,11 +97,51 @@ static inline void wrmsr(unsigned int msr, uint64_t val)
>>>  }
>>>  #define wrmsrl(msr, val) wrmsr(msr, val)
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
>>> +     * %edx.
>>> +     *
>>> +     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
>>> +     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
>>> +     * the compiler can de-duplicate the setup in the common case of reading
>>> +     * and writing the same MSR.
>>> +     */
>>> +    alternative_input_2(
>>> +        "mov %%rax, %%rdx\n\t"
>>> +        "shr $32, %%rdx\n\t"
>>> +        ".byte 0x2e; wrmsr",
>>> +
>>> +        /* CS WRMSRNS %rax, $msr */
>>> +        ".byte 0x2e,0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
>>> +
>>> +        "mov %%rax, %%rdx\n\t"
>>> +        "shr $32, %%rdx\n\t"
>>> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
>> Isn't this the wrong way round for hardware which has both features? The
>> last active alternative wins, iirc.
> 
> Bah - fooled once again by the nop optimisation.  I'll reorder.
> 
> But, we really should swap the order.  Especially now that you've
> inserted serialisation, it's an expensive waste of time patching the
> same site multiple times.

I'm not convinced swapping the order would be a good thing. Nor do I
see how it would (easily) help here: When both features are present,
we always patch twice. To avoid that, while patching one location we
would need to peek ahead into the next table entry to see whether
that's going to patch the same location, same (or bigger) size.

Jan

