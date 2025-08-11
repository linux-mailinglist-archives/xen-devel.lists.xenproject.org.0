Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5378B20189
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077047.1438138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNhy-0007Zx-Av; Mon, 11 Aug 2025 08:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077047.1438138; Mon, 11 Aug 2025 08:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNhy-0007XY-7b; Mon, 11 Aug 2025 08:16:42 +0000
Received: by outflank-mailman (input) for mailman id 1077047;
 Mon, 11 Aug 2025 08:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulNhx-0007XS-2V
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:16:41 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8132802c-768b-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:16:39 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af66d49daffso679174766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:16:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e8332sm1982160366b.75.2025.08.11.01.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:16:37 -0700 (PDT)
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
X-Inumbo-ID: 8132802c-768b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754900198; x=1755504998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=POEA0QPnqm96S4bVm2RNz/pXhYhvjppDTaMDLoij+T8=;
        b=cffa8gMEHtFTAmZIcJbgLvdcNYv5CVFDsxgSEaXo8kmW9rBO+0cTS3cLB9wyQvB594
         QVHkuhMeAMtoWe2gQAiFJ6hvG4YjRV7a2j/pHlTflvLos2AiuHbj1RZ4Ey1XUufNXNMB
         D5XBP305w2fkXYkKN6LdVuOewd3T267ZB9harOOwTfVhagDn+R3Z4RcMLE4w8Bw1H0Up
         yGBmP9JwiIrioV6uZ8+i0wYA45wglY5DmhGDO1vGrOULi0QYsXWSJ0fz9lJpBiMhqdXf
         MMgl1FK36f1HhDgSpZgb6crtVMMoWV/sRsTffUeVY9bXhEdY81TehgCXQgcWbLq5GC+T
         l6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900198; x=1755504998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POEA0QPnqm96S4bVm2RNz/pXhYhvjppDTaMDLoij+T8=;
        b=B4D0bQm+heD27zTHt+hmaSU+cMCl0IBA6v5pDJ2zHT8/Ymay+HGbcMfn3EgBsgb6Qj
         KZPOS16vpLyeTeWgKChj6TMvIbeL2AcimUVKPWDDVyO2IZMC3W3xLE2javeRKBkQPTSi
         3xRoFtoUIqCT+6fjhk2s1xKhTQgUAg2MqmnsSbhpb5Uu3HymOOcK/qCyJjV4HLfrnFjF
         2lHbHMb6FMGH8mcXXVbd7doI/zYDWvITfyyyY7JtapD0Ls3oGTH07Y9q87cB0qmYzFX3
         Y7qCH68VXreybimrGVt5Ti7wMdodh4Rda0ro64tn3+K8NDhbpIpqe3KsC7Qt8hLiSgLz
         UN0g==
X-Forwarded-Encrypted: i=1; AJvYcCV4XJFASGxLGz1MQRdZt4oz2iruH4ArVlKk6iVncfKacUwOiUCiBW/W+Xaj202bOjTsG0XcQqb4rzE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHo3+tMe5knEbhB1crJQNgfkX913BqofEEsUeyRIeACjxMGkf1
	Pi66d6gVjh3Ql2uPJaz2+MIj0T8CuHCBry5mgq8LErlR5Wr7HRVEDepZbFMIw8HGgg==
X-Gm-Gg: ASbGncve8V4hCgB0jZfoTspQVJ2xmcd7yQ6lBiySwnSG0SjVZXAgZWm3kNsC3DcJX4K
	43ScAIvskKc2zlJrlDxX+L0hLju3oWceKoNg9gGtxUzQhkv9WtHVaiDgY5ABG8MhurBTEHQnveW
	L3eBNQw8WaL8q41CpSvOjf6o3d/l98gsapLngFGwA+KJH1+d/qyg2PyF3rsJYYUM5fanWQoNxwZ
	gzorbd2DVmLbG/ZODLyHYjfScDgVeAyI9cxqCfDxZuYmnP78x0uIwSQxdQF9Hgpmig4QCSNYxYU
	EGoIY6KUt1K9lBarq4BU50q34OaXCEzAamPAJIrut9E/MFu+TGQrf1CvXvmITxH5Fho/m7NlsRC
	doAnr9UV8/ohyRNdqu3LJXqgyZ7ubknwSFp3mCuTy1ehXgrZnPsznyBfSLOC+Ka3pAI1LlMFw9m
	KREg0uoNo=
X-Google-Smtp-Source: AGHT+IH9XB1F5/tWxvzPRdeH1fRSk3N3ISBm//mTuYCl8k35C6SNDNpjgwkyHlGm4FsifqWx0Xeozg==
X-Received: by 2002:a17:907:8690:b0:ae3:ed38:8f63 with SMTP id a640c23a62f3a-af9c63fc36bmr1152670466b.14.1754900198211;
        Mon, 11 Aug 2025 01:16:38 -0700 (PDT)
Message-ID: <e81bc459-347c-4eb9-8f8e-ada25fe8966f@suse.com>
Date: Mon, 11 Aug 2025 10:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC x86/msr: Use WRMSRNS $imm when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.08.2025 00:20, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> This is on top of the FRED series for the wrmsrns() cleanup, but otherwise
> unrelated.
> 
> The code generation isn't entirely ideal
> 
>   Function                                     old     new   delta
>   init_fred                                    255     274     +19
>   vmx_set_reg                                  248     256      +8
>   enter_state_helper.cold                     1014    1018      +4
>   __start_xen                                 8893    8897      +4
> 
> but made worse by the the prior codegen for wrmsrns(MSR_STAR, ...) being mad:
> 
>   mov    $0xc0000081,%ecx
>   mov    $0xe023e008,%edx
>   movabs $0xe023e00800000000,%rax
>   cs wrmsr
> 
> The two sources of code expansion come from the compiler not being able to
> construct %eax and %edx separately, and not being able propagate constants.
> 
> Loading 0 is possibly common enough to warrant another specialisation where we
> can use "a" (0), "d" (0) and forgo the MOV+SHR.
> 
> I'm probably overthinking things.  The addition will be in the noise in
> practice, and Intel are sure the advantage of MSR_IMM will not be.

It's not entirely clear to me what the overall effects are now with your
02/22 reply on the FRED series. Nevertheless a nit or two here.

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -38,9 +38,46 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
>          wrmsr(msr, lo, hi);
>  }
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
> +     * %ecx and %edx too.
> +     */
> +    alternative_input_2(
> +        "mov $%c[msr], %%ecx\n\t"

Simply %[msr] here?

And then, might it make sense to pull out this and ...

> +        "mov %%rax, %%rdx\n\t"
> +        "shr $32, %%rdx\n\t"
> +        ".byte 0x2e; wrmsr",
> +
> +        /* WRMSRNS %rax, $msr */
> +        ".byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
> +
> +        "mov $%c[msr], %%ecx\n\t"

... this, to ...

> +        "mov %%rax, %%rdx\n\t"
> +        "shr $32, %%rdx\n\t"
> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
> +
> +        [msr] "i" (msr), "a" (val) : "rcx", "rdx");

        [msr] "i" (msr), "a" (val), "c" (msr) : "rdx");

allowing the compiler to actually know what's put in %ecx? That'll make
original and 2nd replacement code 10 bytes, better balancing with the 9
bytes of the 1st replacement. And I'd guess that the potentially dead
MOV to %ecx would be hidden in the noise as well.

Then, seeing your use of a CS: prefix on WRMSR, why not also add one to
the 1st replacement, thus not requiring any NOP padding?

Jan

