Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E6B2C452
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 14:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086546.1444755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLs4-0006n9-UW; Tue, 19 Aug 2025 12:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086546.1444755; Tue, 19 Aug 2025 12:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLs4-0006k0-R2; Tue, 19 Aug 2025 12:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1086546;
 Tue, 19 Aug 2025 12:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoLs3-0006ju-Lt
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 12:55:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3d04d0f-7cfb-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 14:55:21 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb732eee6so856326866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 05:55:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53dd5sm989063866b.5.2025.08.19.05.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 05:55:20 -0700 (PDT)
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
X-Inumbo-ID: c3d04d0f-7cfb-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755608121; x=1756212921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zPeWn1uKgrYm5hjlnnYYszZYtUhP5jdYvGwzHYJ/we4=;
        b=C1uPioulcpu4nvr+c+5lsZpdrxSdFMsNWAYkoWXTtNiEBlqEsRvwXe+HrfIdsWnVxt
         TgkAvD9IL5bzP9BsOOwV5hriPQDNMLYjbDi+IKB2nGaXczhvRERF0PZmkXteu5yN4ReJ
         j3Dh/z3KQQ16JXrxxaItDlwXZt9wVewCu1F7d2pmu/PEi85DorvlQmvRmBcyevSIuiZG
         1o8JL7+/U7rGmG7ynixFGY0TpcT3qdM4+sPjbIK8tJyO256pno75UTi9c/pGuglLefjz
         i8vCz15v1HDpBB7Nh13q4LBJ5Z9Ga+bDwilWYUs4e/HXkolDQ7htMvOh4MZexb4UpYaV
         nn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608121; x=1756212921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPeWn1uKgrYm5hjlnnYYszZYtUhP5jdYvGwzHYJ/we4=;
        b=L0KQTub8Xc1nO3YcNxWL0HUrxJlIJNIXpqfC8yzkH1MktVPhOfKBh3lCol9KUQijmc
         KUkvLOOiZphFrmyZxJbfykr9hrmkBH8R5JCHzXCGXYsZKko9LFIk9LL5cWrdhi/jhyWi
         gdNclAiqxpI4UZudVXf6Pdl1l5TWViVTCAnjsJs0Hg/FDJv8zrloToqEj9Z6j2rh2uF8
         Hv0a7vCW8F9YGs6Xo548wRzQM6HDZzEvwlNo4ephYRV4QZbPoE2HGhZBts18tRwk6DvO
         KpqM0pB8isAJ6XvOwMynKEVWWutomM3n1VCcwIBduO0Y+OfndBn1BQWM3zpRfBX+S9lP
         nEkg==
X-Forwarded-Encrypted: i=1; AJvYcCVpFUncB3kMUSYCbWsd2f0Bhqqakr2ISJ+FupEDDcL6a8drlxxNyam8X9w4MZeFOIplnvwlpvm7xsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgH6w6jNpZzgMQajU5H9i1+wce7AdWqNi/Nt7AiPM0QMI+ncwn
	26Vmr2YE4osHk2GeSLnll+cz9RwlVrhl2GXG4iikkhgNwJqtwYn3dN1MdmAcrEOe0g==
X-Gm-Gg: ASbGncvGc3Js+eIj+xvtdiGQ03ectR7ycgds/hTSo3NKHXMnnEYmvIGXcihCJDxr2kU
	ix2bN0HpciT7/ynEjFT9hjxZkqnrCusgLd3YEkTCCHXYNdu3A8W4xchwQw3qU4mDNBOqVVycEOd
	Ky1Y5L3qUyHxme3FVokG8QI/UjOP1VHavaMZ+2+AO5SzjuK1EyZorNxCxaUX9BlweYH8jBXQle4
	XPtW2IzcEsjSnC5eZmk6mb2wMZ6soFbcOiMMqYM6EQsVUDBgiDr6pGSMFPCyNtNn2zWHz2EGjwp
	q6aEKRwjpty5RJsAgsLq8nwQcoh9DtcDYh5ohUxTwsMBgvig6iTfYn5ugKjUm3H4ns/n4u98wUp
	dp+yQqkdI2ih3HnH6c7M7KyI5W/QKF8mPHAMpMcR7Nv6SWqJ+b+gHe008gVQreesjTbgdCRVrv2
	3cbe3C5Rf0boY0MO9RyA==
X-Google-Smtp-Source: AGHT+IHvEphjHIogtlHbIyHTISiV65ylqR6d+7Yo7KEfpXlEjJA6iJSp9MqjkfGHHoZAvyTJ19mXww==
X-Received: by 2002:a17:907:6d04:b0:ae3:7255:ba53 with SMTP id a640c23a62f3a-afddd1f7ccamr207797866b.53.1755608120496;
        Tue, 19 Aug 2025 05:55:20 -0700 (PDT)
Message-ID: <3b367c39-4c4a-4bdd-91cd-7cb8ba18c2c9@suse.com>
Date: Tue, 19 Aug 2025 14:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] x86/msr: Use MSR_IMM when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-14-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> Most MSR accesses have compile time constant indexes.  By using the immediate
> form when available, the decoder can start issuing uops directly for the
> relevant MSR, rather than having to issue uops to implement "switch (%ecx)".
> Modern CPUs have tens of thousands of MSRs, so that's quite an if/else chain.
> 
> Create __{rdmsr,wrmsrns}_imm() helpers and use them from {rdmsr,wrmsrns}()
> when the compiler can determine that the msr index is known at compile time.
> 
> At the instruction level, the combined ABI is awkward.  Explain our choices in
> detail.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> The expression wrmsrns(MSR_STAR, rdmsr(MSR_STAR)) now yields:
> 
>   <test_star>:
>       b9 81 00 00 c0          mov    $0xc0000081,%ecx
>       0f 32                   rdmsr
>       48 c1 e2 20             shl    $0x20,%rdx
>       48 09 d0                or     %rdx,%rax
>       48 89 c2                mov    %rax,%rdx
>       48 c1 ea 20             shr    $0x20,%rdx
>       2e 0f 30                cs wrmsr
>       e9 a3 84 e8 ff          jmp    ffff82d040204260 <__x86_return_thunk>
> 
> which is as good as we can manage.  The alternative form of this looks like:
> 
>   <test_star>:
>       b9 81 00 00 c0          mov    $0xc0000081,%ecx
>       c4 e7 7b f6 c0 81 00    rdmsr  $0xc0000081,%rax
>       00 c0
>       2e c4 e7 7a f6 c0 81    cs wrmsrns %rax,$0xc0000081
>       00 00 c0
>       e9 xx xx xx xx          jmp    ffff82d040204260 <__x86_return_thunk>
> 
> Still TBD.  We ought to update the *_safe() forms too.  rdmsr_safe() is easier
> because the potential #GP locations line up, but there need to be two variants
> because of

Because of ...?

> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -151,6 +151,13 @@ extern void alternative_instructions(void);
>          ALTERNATIVE(oldinstr, newinstr, feature)                        \
>          :: input )
>  
> +#define alternative_input_2(oldinstr, newinstr1, feature1,              \
> +                            newinstr2, feature2, input...)              \
> +    asm_inline volatile (                                               \
> +        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
> +                      newinstr2, feature2)                              \
> +        :: input )
> +
>  /* Like alternative_input, but with a single output argument */
>  #define alternative_io(oldinstr, newinstr, feature, output, input...)   \
>      asm_inline volatile (                                               \
> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
> index 1bd27b989a4d..2ceff6cca8bb 100644
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -29,10 +29,52 @@
>   *  wrmsrl(MSR_FOO, val);
>   */
>  
> -static inline uint64_t rdmsr(unsigned int msr)
> +/*
> + * RDMSR with a compile-time constant index, when available.  Falls back to
> + * plain RDMSR.
> + */
> +static always_inline uint64_t __rdmsr_imm(uint32_t msr)
> +{
> +    uint64_t val;
> +
> +    /*
> +     * For best performance, RDMSR $msr, %r64 is recommended.  For
> +     * compatibility, we need to fall back to plain RDMSR.
> +     *
> +     * The combined ABI is awkward, because RDMSR $imm produces an r64,
> +     * whereas WRMSR{,NS} produces a split edx:eax pair.
> +     *
> +     * Always use RDMSR $imm, %rax, because it has the most in common with the
> +     * legacy form.  When MSR_IMM isn't available, emit logic to fold %edx
> +     * back into %rax.
> +     *
> +     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
> +     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
> +     * the compiler can de-duplicate the setup in the common case of reading
> +     * and writing the same MSR.
> +     */
> +    alternative_io(
> +        "rdmsr\n\t"
> +        "shl $32, %%rdx\n\t"
> +        "or %%rdx, %%rax\n\t",
> +
> +        /* RDMSR $msr, %rax */
> +        ".byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
> +
> +        "=a" (val),

Strictly speaking "=&a". Not that it matters much here; just to not
set a bad precedent.

> @@ -55,11 +97,51 @@ static inline void wrmsr(unsigned int msr, uint64_t val)
>  }
>  #define wrmsrl(msr, val) wrmsr(msr, val)
>  
> +/*
> + * Non-serialising WRMSR with a compile-time constant index, when available.
> + * Falls back to plain WRMSRNS, or to a serialising WRMSR.
> + */
> +static always_inline void __wrmsrns_imm(uint32_t msr, uint64_t val)
> +{
> +    /*
> +     * For best performance, WRMSRNS %r64, $msr is recommended.  For
> +     * compatibility, we need to fall back to plain WRMSRNS, or to WRMSR.
> +     *
> +     * The combined ABI is awkward, because WRMSRNS $imm takes a single r64,
> +     * whereas WRMSR{,NS} takes a split edx:eax pair.
> +     *
> +     * Always use WRMSRNS %rax, $imm, because it has the most in common with
> +     * the legacy forms.  When MSR_IMM isn't available, emit setup logic for
> +     * %edx.
> +     *
> +     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
> +     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
> +     * the compiler can de-duplicate the setup in the common case of reading
> +     * and writing the same MSR.
> +     */
> +    alternative_input_2(
> +        "mov %%rax, %%rdx\n\t"
> +        "shr $32, %%rdx\n\t"
> +        ".byte 0x2e; wrmsr",
> +
> +        /* CS WRMSRNS %rax, $msr */
> +        ".byte 0x2e,0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
> +
> +        "mov %%rax, %%rdx\n\t"
> +        "shr $32, %%rdx\n\t"
> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,

Isn't this the wrong way round for hardware which has both features? The
last active alternative wins, iirc.

Jan

