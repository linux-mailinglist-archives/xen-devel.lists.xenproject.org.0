Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E6C8DD52
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 11:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173737.1498745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZWX-0006ZT-7h; Thu, 27 Nov 2025 10:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173737.1498745; Thu, 27 Nov 2025 10:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZWX-0006WY-4O; Thu, 27 Nov 2025 10:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1173737;
 Thu, 27 Nov 2025 10:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOZWV-0006WS-JQ
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 10:46:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60d81d5b-cb7e-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 11:46:50 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso456762f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 02:46:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca7880asm2866822f8f.31.2025.11.27.02.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 02:46:49 -0800 (PST)
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
X-Inumbo-ID: 60d81d5b-cb7e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764240409; x=1764845209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3vGNY6XUo4iXFGrN57ODdsWqDYAbDdpJ1oS0+lfGWNs=;
        b=DTZw3fepZtUeWvjtDFM9AY18zZPPOPg4FBvb3/7JPV4XOIPgToQWEin9dlBjv4zvZy
         W6qMghrlv/xkOitS9E1xR90Qmg5kvJnHCcd5jINFBYLVC6Jh3Quf4UNTQIvt/wljz/vX
         lxC2sB7g3z627is9Ekt07QIeu1KZdiKx3AG80LXrM6x1qx/MrU5ZypIt7HszN9fQVuuX
         WAGgFJ+VLtdpDO2tgOWd0lya6rsEAChxLQ4NNDVPSbyrwyQyVHo6UtleQZxFnk0wP4CG
         NiPxXmsg0twJMcG8p1OJpxgWFgQTZv6KskQWWOiUebQoDbYuFDJcY/a9XP57mNVy9ji7
         RWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764240409; x=1764845209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vGNY6XUo4iXFGrN57ODdsWqDYAbDdpJ1oS0+lfGWNs=;
        b=LMGAcQNLbILKUx0EJixgAiBrfN+3fvZxwuZIlcHEMi7R5iWCurvUMh6vX6nsn8BpRk
         8Bk5fL/U5Oxb7uP/wMaJ4M7QE81z9DhwcYj1dKutueAWFwADAJEfTvFt4TTvoYoKTBoy
         Dm1qIF5/PxMuNcmDkWm3Ndyw9zm3n03RtqB+ZIkv1N4x2zZQPqVTFt7oJxBy6LR1DMFy
         SMR75GpMAyYjzPqFcguDhCjbpsNnc+HeiWyzfLbY4P79wPAm8drlYCk6+tZuS9V62I8n
         eMonVZIhzskmeKO+6eAGeV6eIiBNL0+Gjff7y2g/bPcTJPLWa5PlZXYcsCSaZnc/Np7e
         PL4A==
X-Forwarded-Encrypted: i=1; AJvYcCVjT1QwbFRGoGQc42hiXn9rRVGSr6q+nkWcz+PDjZJ5o6P8aWLUtbasTLW8mTTTjG2E7gI7mMGig/k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziGLLEmD4C3hMzi0YfSJM7YC/o6dcpEVeeOTsZ3AW0bRyMUHGV
	3ebwVTJq7fg7ckJY+X57ikrXvYX/o0fpNHk3lzixGmNI2YrF5CeSo9i5GtpHxWPugQ==
X-Gm-Gg: ASbGncvIu/pwjJU7UiBM9EN8vBxRDVea9Ao/xZARRdR1mNB5BVhT4vqsBvPkSxkhU5v
	LYhQbOQaJhM7b789n9v0c57MbcFysRR2Fd8exFYWvoWbQXEiH09fzOMV40Lr/ThLL6+GHwyGK72
	fwvCCDGBLzzj+jUc/VUUZNQeFSzP9nY9X5OXyD+8TCUEebB4Cz7H7rSzyJ3rVXqjCY+xXj5mUZA
	HS2VJV/XZXYNzE8GJOLymJ8o7P3gl3PJWZ4bXMnT0bdOGI8p9pzpaoNVbNVeA7TTkvwsYB4JX0K
	c/cij87VDqa+2EPDahvNqpvXdW5nZRQGNDYetG8iCDW+wmzy+UOvGpcMuw3M2wDgN/5H3pvODtg
	/zTRF0QujFPiQ188XVs7U6s4G3P3UpIZuBiKiOYgYwqSd+VB+jag+4hr+OtNr+lVkIatP7CYw58
	LfMuK8cNfumBdWB457+utZ9L132E7bIPCZ7nffL2cjZvzpWGE+hsNPKZ2MlZmcO2DBgDAbk60Yv
	dM=
X-Google-Smtp-Source: AGHT+IGgCouW4U7WQDQ6t3usISuKPZLqqWspb7K0uSNWLaOTSN8hVn4J9pwOZZa0BwpUH9IJWfqBWg==
X-Received: by 2002:a05:6000:186b:b0:42b:3ab7:b8a3 with SMTP id ffacd0b85a97d-42cc1cf459fmr27046593f8f.27.1764240409384;
        Thu, 27 Nov 2025 02:46:49 -0800 (PST)
Message-ID: <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
Date: Thu, 27 Nov 2025 11:46:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before using
 it
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 17:44, Alejandro Vallejo wrote:
> This function is meant to replace all instances of the following
> patterns in CPU policies and boot_cpu_data:
> 
>   - x->x86_vendor == X86_VENDOR_FOO
>   - x->x86_vendor != X86_VENDOR_FOO
>   - x->x86_vendor & (X86_VENDOR_FOO | X86_VENDOR_BAR)
> 
> The secret sauce is that all branches inside the helper resolve at
> compile time, so for the all-vendors-compiled-in case the function
> resolves to equivalent code as that without the helper and you get
> progressively more aggressive DCE as you disable vendors. The function
> folds into a constant once you remove the fallback CPU vendor setting.

Here and below in the comment, "fallback CPU vendor" wants clarifying. I
don't view it as obvious that what's presently named UNKNOWN_CPU is that
"fallback" (as imo that really isn't any kind of fallback, but merely a
placeholder).

> While at this, move an include out of place so they sort alphabetically.

I'd rather suggest to simply ...

> --- a/xen/arch/x86/include/asm/cpuid.h
> +++ b/xen/arch/x86/include/asm/cpuid.h
> @@ -2,10 +2,12 @@
>  #define __X86_CPUID_H__
>  
>  #include <asm/cpufeatureset.h>
> +#include <asm/x86-vendors.h>
>  
> -#include <xen/types.h>
> +#include <xen/compiler.h>
>  #include <xen/kernel.h>
>  #include <xen/percpu.h>
> +#include <xen/types.h>

... drop it. xen/kernel.h, for example, already gets it for you anyway.

> @@ -56,6 +58,51 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>       (IS_ENABLED(CONFIG_SHANGHAI) ? X86_VENDOR_SHANGHAI : 0) | \
>       (IS_ENABLED(CONFIG_HYGON)    ? X86_VENDOR_HYGON    : 0))
>  
> +/*
> + * When compiling Xen for a single vendor with no fallback vendor there's no
> + * need no check the candidate. `vendor` is always a compile-time constant,
> + * which means this all can fold into a constant boolean.

DYM "`vendor` is always supposed to be a compile-time constant, ..." ?

> + * A runtime check at the time of CPUID probing guarantees we never run on
> + * wrong hardware and another check when loading CPU policies guarantees we
> + * never run policies for a vendor in another vendor's silicon.
> + *
> + * By the same token, the same folding can happen when no vendor is compiled
> + * in and the fallback path is present.
> + */
> +static always_inline bool x86_vendor_is(uint8_t candidate, uint8_t vendor)

I fear the comment, no matter that it's pretty large already, doesn't make
clear how this function is to be used, i.e. how for this being an "is"
predicate the two arguments should be chosen. My typical expectation would be
for "is" predicates to apply to a single property, with other parameters (if
any) only being auxiliary ones. Maybe it would already help if the first
parameter wasn't named "candidate" but e.g. "actual" (from looking at just
the next patch). Or maybe (depending on the number of possible different
inputs for the first parameter) there want to be a few wrappers, so the
"single property" aspect would be achieved at use sites.

Then I see no reason for the parameters to be other than unsigned int. (Same
for the local variable then, obviously.)

I'm further uncertain this is a good place for the function. In the old days
it may have been, but cpuid.[ch] now are only about guest exposure of CPUID,
when this predicate is intended to be used for both host and guest. (As I
realize only now, this also applies to the addition patch 1 does.) One
might think processor.h might be a good home, but we're actually trying to
slim that one down. So one of cpufeature.h and cpufeatures.h, I guess. (Maybe
other x86 maintainers also have thoughts here.)

> +{
> +    uint8_t filtered_vendor = vendor & X86_ENABLED_VENDORS;
> +
> +    if ( vendor == X86_VENDOR_UNKNOWN )
> +    {
> +        if ( IS_ENABLED(CONFIG_UNKNOWN_CPU) )
> +            /* no-vendor optimisation */

Nit: Comment style (also again below).

> +            return X86_ENABLED_VENDORS ? vendor == candidate : true;

With the surrounding if() this effectively (and more explicitly) is

            return X86_ENABLED_VENDORS ? candidate == X86_VENDOR_UNKNOWN : true;

First: Would one ever pass X86_VENDOR_UNKNOWN for "vendor"? The next patch,
for example, specifically doesn't. And then why not shorter as

            return !X86_ENABLED_VENDORS || candidate == X86_VENDOR_UNKNOWN;

Which raises the next question: Should we even allow a hypervisor to be built
with X86_ENABLED_VENDORS == 0? Plus, question more on patch 1, what's the
(useful) difference between a build with all vendors set to N and
(a) UNKNOWN_CPU=n vs (b) UNKNOWN_CPU=y? With all vendor support explicitly
turned off, all CPUs are going to be "unknown".

> +
> +        /* unknown-vendor-elimination optimisation */
> +        return false;
> +    }
> +
> +    /* single-vendor optimisation */
> +    if ( !IS_ENABLED(CONFIG_UNKNOWN_CPU) &&
> +         (ISOLATE_LSB(X86_ENABLED_VENDORS) == X86_ENABLED_VENDORS) )
> +        return filtered_vendor == X86_ENABLED_VENDORS;
> +
> +    /* compiled-out-vendor-elimination optimisation */
> +    if ( !filtered_vendor )
> +        return false;
> +
> +    /*
> +     * When checking against a single vendor, perform an equality check, as
> +     * it yields (marginally) better codegen
> +     */
> +    if ( ISOLATE_LSB(filtered_vendor) == filtered_vendor )

So one may pass a combination of multiple vendors for "vendor"? Is so, why
is the parameter name singular?

> +        return filtered_vendor == candidate ;

Nit: Stray blank.

Jan

