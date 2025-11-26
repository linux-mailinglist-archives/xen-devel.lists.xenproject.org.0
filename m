Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5EC8A884
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 16:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173014.1498111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOH7i-0007qy-Rf; Wed, 26 Nov 2025 15:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173014.1498111; Wed, 26 Nov 2025 15:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOH7i-0007oZ-Or; Wed, 26 Nov 2025 15:08:02 +0000
Received: by outflank-mailman (input) for mailman id 1173014;
 Wed, 26 Nov 2025 15:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOH7h-0007oT-Ci
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 15:08:01 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1d694b6-cad9-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 16:07:59 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b3c965df5so3725973f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 07:07:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e432sm40261378f8f.9.2025.11.26.07.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 07:07:58 -0800 (PST)
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
X-Inumbo-ID: b1d694b6-cad9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764169678; x=1764774478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SanXmrO6y9ylfggTxZWTna478i2qTWTFYg+rg19bfZw=;
        b=F+JMnNxenShuiFt8aKCpY8Bktk3VQ2tZlbeYFWVQXzY97jeDnyd24w6ng2pLU3cgkX
         +2L+P8LMS0OIsbywgQekZRO1xqrh/WqCyrE9l0h+ekEKxC1Uun0rEHHO1M5ef3SQjjos
         qlsnXqFdhsdZw4a1aW0zxUcdW5jc1Z5elE1Aemnb/HxWG6qzrBDTIqLuzdp/ldTKN076
         x1Cu2dq/ylLaesaHa2V5FOEYkqO4USlSbDS4UuFRigiYODSEXXV4xMdC1AaDEz2Wa+hH
         u5vJWdxz8MGvb8unzdEM9sFOc3F/jE1jy389K/FZMrY6qFxJl/AQL2pIAgLlguX12Kq0
         uMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169678; x=1764774478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SanXmrO6y9ylfggTxZWTna478i2qTWTFYg+rg19bfZw=;
        b=RNfiulbd+QFXXcwqF5RPRnodNfCLmUftuVlGuMyQnlrC1o5+cbU67yZax5FPgv4gm5
         Lk5Fh6mE0t9er4u++haZj2iZAxDuTASXkmddLgMVPRccV94ak/4iiNLFAzwGvUmThBQP
         T8YplER0PFQ7P23CF9+mrTpmO+yU6gOWPGfXO0JM+K4yyPU40s2AbMdpmMv/So6MSqNK
         mWvB/zk371d2rrJBOHMjJsEPhlko12kQ7o6J4oTRCGDQ+z6OfwTEAg0S5SIFZffesm9Z
         OZ1mkPga1JVs5DgqC9eQ5ucQ3E9PxooAE0h1f/reIXpI9IBTT1jkxn3JKlXiDhwZog5N
         o1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPOk3Z9aJHkQ+f2m06ePMlAkOutiJsWfKxGs9x5+ybU+PCQewFv7g5P4LogKwRi3MJCpHaqQzh3tM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf7MPV3GvZgh+4fZzQwtmwFkzVyejtvxJPdmqY89i5W3hW4cy7
	g1bldkXSQRWXs6HcJyZ6cD8hwjVdr9uH+MDpxM2yddF+vFytupu85Eac0IUdsTq5ZWyyoSBp2IA
	OevA=
X-Gm-Gg: ASbGnctDVF5oMs1MNsKW4IlXsBvt0prcM109YUs7+Ai40xUO3hlksh9JB29+8TLzWQC
	hrKILI/v/+qRR+RuZYcCBcfJkLQb7mQcJGQ2bxm2PnsUdGD8/75AGiULHsQz5j6uMwJ+NU4CIOn
	K2oZl5YFjrhKq268TI1OUftkpbBP8AGc/6maWDbtwxqpu+Yfjw25wHNwfVmXMn7VJwB+LZ8Gfd6
	OxGu5NqSY+5C5pB+Qw2UUEtxCnOMK6jLCUZRYkMK/Ayd/U7jfbIhX2QYcSV84+T7snB+G02n0A3
	WwyNhEfQ/RT7aeh8GBZf23u4Jn5ciTxbPWfMwNb5Pq8KNFldQRtkYFrchEPdv/F7PfOgGnuMj7h
	gN5Ey/E1enDm9BZ4AVVpDUUeRkqtMURw8ZFs9kMmcoO9MQPxqi+7Gme4t70NQT8pH9BZouJpWNe
	2eQUQrp0uLRxa8M4ue4qgBMyMsW7h7R2oWUw72UKuiBWO5FTuCbHxwcFcYCKz5bNcnQP5OxD60O
	WU=
X-Google-Smtp-Source: AGHT+IHnkbcr7IhDEJVgzk/Nx2kOcdMc7fMK5wVDpyuDTaDeH2ztgTSNb4DvhdoiiSCJne8VBwxY6g==
X-Received: by 2002:a05:6000:40c9:b0:42b:47da:c31c with SMTP id ffacd0b85a97d-42e0f344674mr7988465f8f.37.1764169678311;
        Wed, 26 Nov 2025 07:07:58 -0800 (PST)
Message-ID: <52fd793f-5bb1-4e14-a64c-b431b0ae83a6@suse.com>
Date: Wed, 26 Nov 2025 16:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/amd: Fix race editing DE_CFG
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251126132220.881028-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 14:22, Andrew Cooper wrote:
> @@ -1075,6 +966,112 @@ static void cf_check fam17_disable_c6(void *arg)
>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>  }
>  
> +static bool zenbleed_use_chickenbit(void)
> +{
> +    unsigned int curr_rev;
> +    uint8_t fixed_rev;
> +
> +    /*
> +     * If we're virtualised, we can't do family/model checks safely, and
> +     * we likely wouldn't have access to DE_CFG even if we could see a
> +     * microcode revision.
> +     *
> +     * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
> +     * position to care either way.  An admin doesn't want to be disabling
> +     * AVX as a mitigation on any build of Xen with this logic present.
> +     */
> +    if ( cpu_has_hypervisor || boot_cpu_data.family != 0x17 )
> +        return false;
> +
> +    curr_rev = this_cpu(cpu_sig).rev;
> +    switch ( curr_rev >> 8 )
> +    {
> +    case 0x083010: fixed_rev = 0x7a; break;
> +    case 0x086001: fixed_rev = 0x0b; break;
> +    case 0x086081: fixed_rev = 0x05; break;
> +    case 0x087010: fixed_rev = 0x32; break;
> +    case 0x08a000: fixed_rev = 0x08; break;
> +    default:
> +        /*
> +         * With the Fam17h check above, most parts getting here are Zen1.
> +         * They're not affected.  Assume Zen2 ones making it here are affected
> +         * regardless of microcode version.
> +         */
> +        return is_zen2_uarch();
> +    }
> +
> +    return (uint8_t)curr_rev >= fixed_rev;
> +}
> +
> +void amd_init_de_cfg(const struct cpuinfo_x86 *c)
> +{
> +    uint64_t val, new = 0;
> +
> +    /* The MSR doesn't exist on Fam 0xf/0x11. */
> +    if ( c->family != 0xf && c->family != 0x11 )
> +        return;

Comment and code don't match. Did you mean

    if ( c->family == 0xf || c->family == 0x11 )
        return;

(along the lines of what you have in amd_init_lfence_dispatch())?

> +    /*
> +     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
> +     * serialising, and is enumerated in CPUID.  Hypervisors may also
> +     * enumerate it when the setting is in place and MSR_AMD64_DE_CFG isn't
> +     * available.
> +     */
> +    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
> +        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
> +
> +    /*
> +     * If vulnerable to Zenbleed and not mitigated in microcode, use the
> +     * bigger hammer.
> +     */
> +    if ( zenbleed_use_chickenbit() )
> +        new |= (1 << 9);
> +
> +    if ( !new )
> +        return;
> +
> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) ||
> +         (val & new) == new )
> +        return;
> +
> +    /*
> +     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
> +     * threads calculate the new value from state which expected to be
> +     * consistent across CPUs and unrelated to the old value, so the result
> +     * should be consistent.
> +     */
> +    wrmsr_safe(MSR_AMD64_DE_CFG, val | new);

Either of the bits may be the cause of #GP. In that case we wouldn't set the
other bit, even if it may be possible to set it.

> +}
> +
> +void __init amd_init_lfence_dispatch(void)
> +{
> +    struct cpuinfo_x86 *c = &boot_cpu_data;
> +    uint64_t val;
> +
> +    if ( test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
> +        /* LFENCE is forced dispatch serialising and we can't control it. */
> +        return;
> +
> +    if ( c->family == 0xf || c->family == 0x11 )
> +        /* MSR doesn't exist.  LFENCE is dispatch serialising on this hardare. */
> +        goto set;
> +
> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) )
> +        /* Unable to read.  Assume the safer default. */
> +        goto clear;
> +
> +    if ( val & AMD64_DE_CFG_LFENCE_SERIALISE )
> +        /* Already dispatch serialising. */
> +        goto set;

Why "already", when this is now after we did the adjustment?

> + clear:
> +    setup_clear_cpu_cap(X86_FEATURE_LFENCE_DISPATCH);
> +    return;
> +
> + set:
> +    setup_force_cpu_cap(X86_FEATURE_LFENCE_DISPATCH);
> +}
> +
>  static void amd_check_bp_cfg(void)
>  {
>  	uint64_t val, new = 0;
> @@ -1118,6 +1115,11 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	u32 l, h;
>  	uint64_t value;
>  
> +        amd_init_de_cfg(c);
> +
> +        if (c == &boot_cpu_data)
> +            amd_init_lfence_dispatch(); /* Needs amd_init_de_cfg() */
> +
>  	/* Disable TLB flush filter by setting HWCR.FFDIS on K8
>  	 * bit 6 of msr C001_0015
>  	 *

Nit: I don't think we want to mix indentation style within a function.

> --- a/xen/arch/x86/cpu/hygon.c
> +++ b/xen/arch/x86/cpu/hygon.c
> @@ -31,7 +31,11 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
>  {
>  	unsigned long long value;
>  
> -	amd_init_lfence(c);
> +        amd_init_de_cfg(c);
> +
> +        if (c == &boot_cpu_data)
> +            amd_init_lfence_dispatch(); /* Needs amd_init_de_cfg() */
> +
>  	amd_init_ssbd(c);
>  
>  	/* Probe for NSCB on Zen2 CPUs when not virtualised */

Same here then.

Jan

