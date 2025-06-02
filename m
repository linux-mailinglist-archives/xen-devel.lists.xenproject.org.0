Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B54CACAB7B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003069.1382511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1a6-0004xF-NF; Mon, 02 Jun 2025 09:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003069.1382511; Mon, 02 Jun 2025 09:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1a6-0004vn-JS; Mon, 02 Jun 2025 09:35:46 +0000
Received: by outflank-mailman (input) for mailman id 1003069;
 Mon, 02 Jun 2025 09:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1a4-0004vh-Ul
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:35:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f41d928a-3f94-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:35:43 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so202920f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:35:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb396f6sm4491200a12.42.2025.06.02.02.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:35:42 -0700 (PDT)
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
X-Inumbo-ID: f41d928a-3f94-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748856943; x=1749461743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Yu5AAL3zoKPvgz1Wy3fQ+yLKsDz3HqiqShgBRi5YVw=;
        b=XGIhZJ6G7Imr4D8MiG9MCYy0J0czoI3glhq+WNYFAk4tjDvKOexzEJHQ43YnPB+7SI
         yjO7e2Mhv4Rx1Xjjb8UWwT+CBxVMYTS18I9hZD53lSSzhhTGzTNhEgxw1nGGKIZftUbS
         20hht4RnXsUbLwGKXl/Im/wVSyy250vLWPZQnlhln0NNCoe+apgyo4/9UFtwLQjX01pS
         lIg5mUJF1JLb1FyNlE8SazUOgPOHzszYlNSoVbFYCsJ0/bK1cuBquNi4rA9urfvxo/1h
         TxJSHKyUDtXiEI/X6i2yqYvGlY/t+k1R7KNqfVAdAnmE6kY5WCyuvPS480ul4m0ybWA7
         QADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748856943; x=1749461743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Yu5AAL3zoKPvgz1Wy3fQ+yLKsDz3HqiqShgBRi5YVw=;
        b=nQpJX4SO5u/jVyumO4HppfsMuVxUghPdsvwn3Vjc5CmZvqzW6gOrxdzRwR/aMRVDBx
         RKklXwKJ2Ov3YrxgNOV6mElOlhGfEsxK1g+nweCk0mYU57T/y+G3+Ak+8T3ciW9yz+gv
         oq6gFgQHeZT3HcheDkB/7+uMaUcAdLr8qwMbWohxiMRuS+0ibyDzLHPY4vI2D4+Koi4b
         SIKjTOPi/V/LdffQsIzvRyCBCn2l7EJ+5N4EcL9j1UV0ACG8Oib8m9gxuEAalMzVhirV
         cElzLW6K6EHwPw6ksrbmunUBhtTUGwUE/Q2AN5EG8fhGeIqHFgPZujnAmuBvdDaimfQ+
         N4ag==
X-Forwarded-Encrypted: i=1; AJvYcCWYczmyhIKY4PmFtZwwIrNSvH+tblz0wASBb1BdYG8OI1IGGH4aeRgvKTkNTM3BA/J2rzG6XwtTUSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1qjUY/jbS9nzfqWlyzje1oIp1EGQhjIIMY+ItZOCcfTWjYZnx
	+OXdgE5XW4bwHDeybcw3APSrU1W7LA9e/KVf0LMpbmfsEMGt+PlhHoeskBldHY7Qqg==
X-Gm-Gg: ASbGncu6KVJyJKPpt5x8xlsCvzud7npdusc9die9ed01d3RjUHjERzDfxhrPtu29Dly
	a8sxSz0blekwktdZJZf9/7IFVIa0HlYldoGh7kFk+kinEEFVB08zb17RNtZaumvE8+BvQAz8+bi
	DBpSJO+cPgo63jylZ3CoQ9XU2S3s0XAu69ODKtszst4fXbh8AHx70eIIHXsXWgARYXp0v6gvctf
	yVUXjOWpiDoeQALLHTxwRu8AgCjIarToLPrHRsuQFiD1ivRXSh4BbyeIkGmJCqc08o2eqSP4Yh5
	rZaBtsWnfasluBoubqZiRrC8aaD2Yn9FnQCaB7nKyKd9qf7bv1JTi5EsutumDDq7yYa51mHzogI
	zwQ8MoCSDIh6WBXFXiP5TwWyX/ohfSUfRAY7f5AFwFpPoFmE=
X-Google-Smtp-Source: AGHT+IGTp70XTPR7UcAZewF3ACtFqXkDT/PZzqfQPlGgU/iZjWf6BOAc2yXMpR6D3IM6Imgh/AkSvQ==
X-Received: by 2002:a05:6000:18ab:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a4fb3388bbmr8265737f8f.46.1748856942606;
        Mon, 02 Jun 2025 02:35:42 -0700 (PDT)
Message-ID: <9ac69643-6510-4a14-8187-9e2d0c831576@suse.com>
Date: Mon, 2 Jun 2025 11:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Optimise arch_ffs()/etc some more on AMD
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 00:29, Andrew Cooper wrote:
> One aspect of the old ffs()/etc infrastructure was the use of TZCNT/LZCNT
> without a CPUID check.  Given no obvious justification, I dropped it during
> the cleanup.
> 
> It turns out there is a good reason, on all but the most recent AMD CPUs.
> 
> Reinstate the use of "blind" TZCNT/LZCNT when safe to do so.  This happens to
> be preferentially in loops where a repeated saving of 5-6 uops becomes far
> more relevant than a one-off scenario.
> 
> Leave an explanation of why.
> 
> No functional change.
> 
> Fixes: 989e5f08d33e ("x86/bitops: Improve arch_ffs() in the general case")
> Fixes: 5ed26fc0768d ("xen/bitops: Implement ffsl() in common logic")
> Fixes: 54b10ef6c810 ("xen/bitops: Implement fls()/flsl() in common logic")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but ...

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -399,9 +399,16 @@ static always_inline unsigned int arch_ffs(unsigned int x)
>           *
>           * and the optimiser really can work with the knowledge of x being
>           * non-zero without knowing it's exact value, in which case we don't
> -         * need to compensate for BSF's corner cases.  Otherwise...
> +         * need to compensate for BSF's corner cases.
> +         *
> +         * That said, we intentionally use TZCNT on capable hardware when the
> +         * behaviour for the 0 case doesn't matter.  On AMD CPUs prior to
> +         * Zen4, TZCNT is 1-2 uops while BSF is 6-8 with a latency to match.
> +         * Intel CPUs don't suffer this discrepancy.
> +         *
> +         * Otherwise...
>           */
> -        asm ( "bsf %[val], %[res]"
> +        asm ( "rep bsf %[val], %[res]"

... why would we use REP (again) when gas 2.25 supports LZCNT/TZCNT?

Jan

>                : [res] "=r" (r)
>                : [val] "rm" (x) );
>      }
> @@ -428,7 +435,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
>  
>      /* See arch_ffs() for safety discussions. */
>      if ( __builtin_constant_p(x > 0) && x > 0 )
> -        asm ( "bsf %[val], %q[res]"
> +        asm ( "rep bsf %[val], %q[res]"
>                : [res] "=r" (r)
>                : [val] "rm" (x) );
>      else
> @@ -446,7 +453,7 @@ static always_inline unsigned int arch_fls(unsigned int x)
>  
>      /* See arch_ffs() for safety discussions. */
>      if ( __builtin_constant_p(x > 0) && x > 0 )
> -        asm ( "bsr %[val], %[res]"
> +        asm ( "rep bsr %[val], %[res]"
>                : [res] "=r" (r)
>                : [val] "rm" (x) );
>      else
> @@ -464,7 +471,7 @@ static always_inline unsigned int arch_flsl(unsigned long x)
>  
>      /* See arch_ffs() for safety discussions. */
>      if ( __builtin_constant_p(x > 0) && x > 0 )
> -        asm ( "bsr %[val], %q[res]"
> +        asm ( "rep bsr %[val], %q[res]"
>                : [res] "=r" (r)
>                : [val] "rm" (x) );
>      else
> 
> base-commit: d965e2ee07c56c341d8896852550914d87ea5374
> prerequisite-patch-id: 8da89000c73c38aab6abfa6622217ea9eff07fbd
> prerequisite-patch-id: 74830838bac94ed1e036a8173cf3210a314b35d8
> prerequisite-patch-id: 0654835c28df8d40b6c97006d041c4d31447a9a6
> prerequisite-patch-id: 2d47d646c6a6e0019918c57753d6c01a752c377f
> prerequisite-patch-id: d8f8c4221a2d7039bae6f3d38e93fe90b2091d01
> prerequisite-patch-id: e0397c86b545a1d65f2e6b2049c282b926c40c64
> prerequisite-patch-id: ea21abe4540ee229f4f8725ce3f701d9ba4bd4a8


