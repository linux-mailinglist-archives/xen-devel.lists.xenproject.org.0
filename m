Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19E8CD72A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 17:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728656.1133679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAASc-0001YN-Gf; Thu, 23 May 2024 15:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728656.1133679; Thu, 23 May 2024 15:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAASc-0001Ws-Dm; Thu, 23 May 2024 15:34:30 +0000
Received: by outflank-mailman (input) for mailman id 728656;
 Thu, 23 May 2024 15:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAASb-0001Wm-C8
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 15:34:29 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f03e2f1f-1919-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 17:34:26 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57847c08e0cso1178183a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 08:34:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcad0362sm16692090a12.20.2024.05.23.08.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 08:34:25 -0700 (PDT)
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
X-Inumbo-ID: f03e2f1f-1919-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716478466; x=1717083266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4SiQWsf5o2I0gyNSUlQoMspiZtx0wo3qkAr4NjkpFI=;
        b=NviB6wcg8YALxo3y/9o+vDl579TP3ub3DWQino4wDJq1AR7meYIsXqr2C1giW4jAcH
         xTXBwCnq6xdEQ/oqOECRdsLAWTsUdeywr9+XdPCEVqe9JYXBZIyIyuWuFHKtE/I9RvAY
         tgs5ELivwfXb6VHDU+F5ijrvtxJpsAXQq77nyVAFHdCPQf/4mRRpMq7XTAPtxcrf2EWz
         zJEmOPX+c22G8iR5zZK5qwQxVcVWpUg//shw9+lQxaLTaPgogT2hCKnnylaagneW3QrX
         F5hknuFpyzbsqhn5F7uto7sjX6mFY3iNdnbO6eB7ddpshHcPcDpWZEJEUuh9OPK/IWJt
         B3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716478466; x=1717083266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4SiQWsf5o2I0gyNSUlQoMspiZtx0wo3qkAr4NjkpFI=;
        b=RMb4TbwaMw2CUH8lniHISY3jwtf2GeEQby8kHQSR2TNjtdV4RmNNbMUeIVSujPG487
         b+xHakEqacuzy7rMhs/xd48rs0ygx4UWO+CVQt0PhVqZtkQh4q/6QdkQ+1V6uk7TEKeN
         0MfiC/uIqEnFYifqITpAw7ZUkq4o/6DfTjtCQlsQ33GU8qH2E5urLp+clClgLPXsLjgU
         p4pcBBtxnMTL2fOglntFhdUsE1D3f4RmJFKrjoVa8aUJsQd88OAqzACtiwYsrYEDz8S3
         pX64Mi50diA1qXCWUyKHZBJjalHJdOPuhruOIv1siB6EwIjducO3QfKlWy0GNOaf+XJ5
         VDfA==
X-Forwarded-Encrypted: i=1; AJvYcCWai/lo8lawxuswVj20VVS6aTXrHr666o62W3QydokV0k0WOhMo6jekZZQ4OiycZWsB6WT7JowbY5JnNxVms0trKxm8Anzkr73WmYOgS+A=
X-Gm-Message-State: AOJu0YxqiFYXZqyDXK8yD8YtLiFaJfgtu+QMUPIYQwSu8QDqg1NsKpL2
	2sxVQPRrU9h52LhyikjgSRh9YkaLQt/h4nh+vsG9ss1vga2VMOXMIIDYViIHtg==
X-Google-Smtp-Source: AGHT+IGxbZZPcwy3Tz5tFFp/od9gLBSq2doW8l5XOPgeuKxy2gt+IWHX0DJsNAy9zqg+WqguO6uw8Q==
X-Received: by 2002:a50:d655:0:b0:572:7d77:179d with SMTP id 4fb4d7f45d1cf-57843c7a592mr1998648a12.5.1716478466214;
        Thu, 23 May 2024 08:34:26 -0700 (PDT)
Message-ID: <22e0473a-aca8-4645-a3f4-21a9d9e0ebd3@suse.com>
Date: Thu, 23 May 2024 17:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/xstate: Cross-check dynamic XSTATE sizes at boot
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240523111627.28896-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 13:16, Andrew Cooper wrote:
> Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
> every call.  This is expensive, being used for domain create/migrate, as well
> as to service certain guest CPUID instructions.
> 
> Instead, arrange to check the sizes once at boot.  See the code comments for
> details.  Right now, it just checks hardware against the algorithm
> expectations.  Later patches will add further cross-checking.
> 
> Introduce the missing X86_XCR0_* and X86_XSS_* constants, and a couple of
> missing CPUID bits.  This is to maximise coverage in the sanity check, even if
> we don't expect to use/virtualise some of these features any time soon.  Leave
> HDC and HWP alone for now.  We don't have CPUID bits from them stored nicely.

Since you say "the missing", ...

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -77,7 +77,7 @@
>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
>  
>  /*
> - * XSTATE component flags in XCR0
> + * XSTATE component flags in XCR0 | MSR_XSS
>   */
>  #define X86_XCR0_FP_POS           0
>  #define X86_XCR0_FP               (1ULL << X86_XCR0_FP_POS)
> @@ -95,11 +95,34 @@
>  #define X86_XCR0_ZMM              (1ULL << X86_XCR0_ZMM_POS)
>  #define X86_XCR0_HI_ZMM_POS       7
>  #define X86_XCR0_HI_ZMM           (1ULL << X86_XCR0_HI_ZMM_POS)
> +#define X86_XSS_PROC_TRACE        (_AC(1, ULL) <<  8)
>  #define X86_XCR0_PKRU_POS         9
>  #define X86_XCR0_PKRU             (1ULL << X86_XCR0_PKRU_POS)
> +#define X86_XSS_PASID             (_AC(1, ULL) << 10)
> +#define X86_XSS_CET_U             (_AC(1, ULL) << 11)
> +#define X86_XSS_CET_S             (_AC(1, ULL) << 12)
> +#define X86_XSS_HDC               (_AC(1, ULL) << 13)
> +#define X86_XSS_UINTR             (_AC(1, ULL) << 14)
> +#define X86_XSS_LBR               (_AC(1, ULL) << 15)
> +#define X86_XSS_HWP               (_AC(1, ULL) << 16)
> +#define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
> +#define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)

... I'm wondering if you deliberately left out APX (bit 19).

Since you're re-doing some of what I have long had in patches already,
I'd also like to ask whether the last underscores each in the two AMX
names really are useful in your opinion. While rebasing isn't going
to be difficult either way, it would be yet simpler with
X86_XCR0_TILECFG and X86_XCR0_TILEDATA, as I've had it in my patches
for over 3 years.

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -604,9 +604,156 @@ static bool valid_xcr0(uint64_t xcr0)
>      if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
>          return false;
>  
> +    /* TILE_CFG and TILE_DATA must be the same. */
> +    if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
> +        return false;
> +
>      return true;
>  }
>  
> +struct xcheck_state {
> +    uint64_t states;
> +    uint32_t uncomp_size;
> +    uint32_t comp_size;
> +};
> +
> +static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
> +{
> +    uint32_t hw_size;
> +
> +    BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
> +
> +    BUG_ON(s->states & new); /* States only increase. */
> +    BUG_ON(!valid_xcr0(s->states | new)); /* Xen thinks it's a good value. */
> +    BUG_ON(new & ~(X86_XCR0_STATES | X86_XSS_STATES)); /* Known state. */
> +    BUG_ON((new & X86_XCR0_STATES) &&
> +           (new & X86_XSS_STATES)); /* User or supervisor, not both. */
> +
> +    s->states |= new;
> +    if ( new & X86_XCR0_STATES )
> +    {
> +        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
> +            BUG();
> +    }
> +    else
> +        set_msr_xss(s->states & X86_XSS_STATES);
> +
> +    /*
> +     * Check the uncompressed size.  Some XSTATEs are out-of-order and fill in
> +     * prior holes in the state area, so we check that the size doesn't
> +     * decrease.
> +     */
> +    hw_size = cpuid_count_ebx(0xd, 0);
> +
> +    if ( hw_size < s->uncomp_size )
> +        panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, uncompressed hw size %#x < prev size %#x\n",
> +              s->states, &new, hw_size, s->uncomp_size);
> +
> +    s->uncomp_size = hw_size;
> +
> +    /*
> +     * Check the compressed size, if available.  All components strictly
> +     * appear in index order.  In principle there are no holes, but some
> +     * components have their base address 64-byte aligned for efficiency
> +     * reasons (e.g. AMX-TILE) and there are other components small enough to
> +     * fit in the gap (e.g. PKRU) without increasing the overall length.
> +     */
> +    hw_size = cpuid_count_ebx(0xd, 1);
> +
> +    if ( cpu_has_xsavec )
> +    {
> +        if ( hw_size < s->comp_size )
> +            panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, compressed hw size %#x < prev size %#x\n",
> +                  s->states, &new, hw_size, s->comp_size);
> +
> +        s->comp_size = hw_size;
> +    }
> +    else
> +        BUG_ON(hw_size); /* Compressed size reported, but no XSAVEC ? */

I'm not quite happy with this being fatal to booting. Maybe just WARN_ON()?

Jan

