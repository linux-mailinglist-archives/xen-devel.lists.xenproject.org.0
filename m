Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981BBCF47CA
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 16:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195519.1513449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmmi-0006Ge-ND; Mon, 05 Jan 2026 15:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195519.1513449; Mon, 05 Jan 2026 15:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmmi-0006Ea-KC; Mon, 05 Jan 2026 15:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1195519;
 Mon, 05 Jan 2026 15:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcmmh-0006EU-8O
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 15:46:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac78bc01-ea4d-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 16:46:17 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so3164188f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 07:46:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca2f8fbsm194740f8f.10.2026.01.05.07.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:46:16 -0800 (PST)
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
X-Inumbo-ID: ac78bc01-ea4d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767627977; x=1768232777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XPnu0vThWEgbI0+DkMRoNLVg7V3inLjFC/70HVjgUUs=;
        b=JW/QT+lwarqZDhzbC74GNIkXZwAA8vPY3q96d7AmfLhCW2IWWZU15XA0kLqdHNxD8p
         z5Byu6TqAZ3ssWty69dvtSDddf7wYfyI/C1F+UGRHzSlOXk64/nscV4t2jj7ZTcbIVil
         zNOdldHYft+8eFrRApWRp3DJI9v6Y078jthSATNOANhVef0NMyWFHhkVN25mIyVYuM6D
         B90xHiSLHT1Hrxy9p3UlpcGdD3Z1myvLIBFT/bGjMEU9Uh887KWu+fLUBd/ZSkQgOsXt
         3vY47uS/lsW2Fk0iaU/cHdig6xZszZfT8Y8NmJXCQPpbA/JubO4eB+vroG2Jlp5jE8B7
         FJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627977; x=1768232777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPnu0vThWEgbI0+DkMRoNLVg7V3inLjFC/70HVjgUUs=;
        b=lnp5d3SONkF2BguHTna/f/IL8JQYfC3AjtTkBhKBOzr5L8uNRb5Qo3R6iHth8P2lJL
         2V7GLnfmcVsEUp8Mx5O1Lb1HZWHfbxBOzPI4QwCeF+umH+RGC7csexD++gkNSa7nZQRH
         i453KyVsOyz6R4Zm/AaUZJcm86dQ8PeF0TJkbZU9/QAiyOP2snobF14S+dhmeO4lLdyL
         rAwl/4JCosLmeAdrUjr0dywhEVoIjNlsMPdi8w+PdFjfAm4akxFKySt6VXSem/eBSx7L
         xQ7J3yYPezx6l65os5yhWsMZqsWd5RcMmfeWaeP2DG2YAWRPQbotwNioHq+DCmO0a7f1
         EveA==
X-Forwarded-Encrypted: i=1; AJvYcCX1YeqGSPMo+kuijBpgeopyJnfSZHvaYQmWJ2MoMOQ+c530qJVuVMyaTcBgMd05WWqJxt2zUDkqCDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdydBmSDTjWRwuKLlwqt3sv9Io/6DsBi9riN4dDx5NrPSiK5l8
	vK5n3pFvQfbcarp5yFqtrd8QpI/2QdQXHC+nXXwh/qKWQoFcXbabr9RO4b60dGszKw==
X-Gm-Gg: AY/fxX4edg3SWg9dcNzA6/jXG9VMm8w/Ee/9HcC02F3AEjM7EBKeu4DuDUJXgWpDoOH
	Cm0Hq8aH0fliQLw557Yq0hBPZ7yoZ8+KKgWSI2s5LTN7JAXyLXwDvgHsCBuBI4SQX5tsqN7naOy
	VZAMOZQRRnQon/K7IqA4Kb1k0NyUQ5nApreLMdoli1wVjH8kh/FhrQ7QEGQpAZYsDWPmirrcmDg
	jGBSsekYqmLoVkdShzegkG+iq+1VnWcrADwWUeCFG8zF/5le8flI7+kC9D+x5toZEz7BimrTaBw
	cdJKJ/wzwBZy2ZCuDoqVx8bjwOtRP5LAq9dl3uJ5jvzngWRTXcGq0vMRzpGH/D6cQO7r42YvZ9a
	J/3iwF3uCsyKeDgVpQue2XIULt7PGLvQtAS5XpSfwvRDaxOdhUj8B78xVgUu3+ASz+RUYybC6PV
	l00ghGrgTv5xKrJdZHQqCyCsr5+2i8Kr99T8sws+3IaCz6DTyROae54kwP0xwoWpTanx7Q5u0xY
	8k=
X-Google-Smtp-Source: AGHT+IHmgw+GvbLF1rhSiPMvK24miYy9YjgnCuuiN8osungdBnVsOfZFUxZx1FpUVxhYW7LEd34wRA==
X-Received: by 2002:a05:6000:4287:b0:430:f272:3489 with SMTP id ffacd0b85a97d-432bca3e33amr232998f8f.28.1767627977017;
        Mon, 05 Jan 2026 07:46:17 -0800 (PST)
Message-ID: <4b051e1f-0d99-4637-b433-bade93e67e0a@suse.com>
Date: Mon, 5 Jan 2026 16:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135427.188440-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:54, Andrew Cooper wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>      uint32_t hmask = mask >> 32;
>      uint32_t lmask = mask;
>      unsigned int fip_width = v->domain->arch.x87_fip_width;
> -#define XSAVE(pfx) \
> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
> -                           : "=m" (*ptr) \
> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
> -        else \
> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
> -                           X86_FEATURE_XSAVEOPT, \
> -                           "=m" (*ptr), \
> -                           "a" (lmask), "d" (hmask), "D" (ptr))
> +
> +#define XSAVE(pfx)                                                      \
> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
> +        asm volatile ( "xsaves %0"                                      \
> +                       : "=m" (*ptr)                                    \
> +                       : "a" (lmask), "d" (hmask) );                    \
> +    else                                                                \
> +        alternative_io("xsave %0",                                      \
> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
> +                       "=m" (*ptr),                                     \
> +                       "a" (lmask), "d" (hmask))

While no doubt neater to read this way, there's a subtle latent issue here:
"m" doesn't exclude RIP-relative addressing, yet that addressing form can't
be used in replacement code (up and until we leverage your decode-lite to
actually be able to fix up the displacement). Sadly "o" as a constraint
doesn't look to be any different in this regard (I think it should be, as
adding a "small integer" may already bring the displacement beyond the
permitted range, but their definition of "offsettable" allows this).

This issue is latent until such time that (a) a caller appears passing in
the address of a Xen-internal variable and (b) we make LTO work again.
Since the breakage would be impossible to notice at build time, I think we
would be better off if we avoided it from the beginning. Which may mean
sacrificing on code gen, by using "r" and then "(%0)" as the insn operand.

> @@ -489,17 +484,17 @@ void xrstor(struct vcpu *v, uint64_t mask)
>              ptr->xsave_hdr.xcomp_bv = 0;
>          }
>          memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
> -        continue;
> +        goto retry;
>  
>      case 2: /* Stage 2: Reset all state. */
>          ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
>          ptr->xsave_hdr.xstate_bv = 0;
>          ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
>              ? XSTATE_COMPACTION_ENABLED : 0;
> -        continue;
> -    }
> +        goto retry;
>  
> -        domain_crash(current->domain);
> +    default: /* Stage 3: Nothing else to do. */
> +        domain_crash(v->domain, "Uncorrectable XRSTOR fault\n");
>          return;

There's an unexplained change here as to which domain is being crashed.
You switch to crashing the subject domain, yet if that's not also the
requester, it isn't "guilty" in causing the observed fault.

Jan

