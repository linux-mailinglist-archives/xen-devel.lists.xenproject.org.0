Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F9934D0F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760438.1170284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQ6K-0006zB-L3; Thu, 18 Jul 2024 12:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760438.1170284; Thu, 18 Jul 2024 12:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQ6K-0006wV-IO; Thu, 18 Jul 2024 12:19:12 +0000
Received: by outflank-mailman (input) for mailman id 760438;
 Thu, 18 Jul 2024 12:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUQ6I-0006wO-Ni
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:19:10 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeefc8f0-44ff-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 14:19:08 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2eedec7fbc4so9541611fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 05:19:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc263d2sm91548705ad.128.2024.07.18.05.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 05:19:07 -0700 (PDT)
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
X-Inumbo-ID: eeefc8f0-44ff-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721305148; x=1721909948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ycnfUGnAhhal14c0Sgk9vB5RtvTGK7nNT8ySYL18EgE=;
        b=T9raNoNe/hOx8bSsyj19MGfs8Se8NKXVeKAOJpb1EeBFkIcnCAbqwHWtccHt0iOAO6
         Xu1PibvXLWwudVn0V7a8FWWHmSZwpvZ3b//f46FUYOchtUWMvwPt7roEdyqj6YXuT3l5
         eX8LrFGrqO2J2aFq0W5JqkhDpQmzSFZM95BrS9aG156Obe/NtRhHPTVq3vOEL8Yz9WUP
         ApfFBZYqwA4t//vS27d0yT9jIfM2YsLB6LZJ2glS3E543YZkPgGMmc9qphPeuEkeH4t+
         7pewoLUnPE4AjycC7Z1CcsBNRNmU2pWlAMm1rrAuBxoY9X0uJgQFBFbgqKcFbiGuGOtp
         zflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721305148; x=1721909948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycnfUGnAhhal14c0Sgk9vB5RtvTGK7nNT8ySYL18EgE=;
        b=FgTW4obZCReIJB0DS9oBcSCjKWESeTZred5h4kgJyg82oxgjcwPMG66/ipBcKxoJFH
         PvgA4t8oTKtp1qXLyE2lRonT7LhJS5NlqRrxjMu4VQXSue/xvCK0g0ChtbpIUst2of0+
         QNy8KADEz69S9oVwX7oLV/Hycw5QYxrNIXR4sFqObMml4CzyjvAQFTHvBEggluWrt4ql
         CUmQ02WXLFEl8pCseHSJH5REYtQ+k2olutLMsUi62UINjsSU/apEoWnICP0Wx2SKRBoV
         9I62fmveHofockJJHPwj8Tbg6eoUaCYRq2gB97RVeBKqhaxqv0Ulwyb1qBRAgipJlpQX
         CIeA==
X-Forwarded-Encrypted: i=1; AJvYcCVHlyEfNA4Ydij8rxcU2L5bbl0oJ/ctBlt28FAhqOWYIU0js+JcFj1PjeisU27WS6X6m56N3ONRls3qwYHIZreNs1w/os8wYDPVxNZdomE=
X-Gm-Message-State: AOJu0YwVlx6brHQbbztO6m3xcNcz8vZWjla5wBH6nR04Ed/44275Fo3F
	1Zo3gTJhUmwdJm3uaNGmI0Yr27pU48HL+isJEO/STCHUCK/UHyRxuTnta6I7Qw==
X-Google-Smtp-Source: AGHT+IGpICZsWMOtcYjE6zRBls3Hm+0TeX1iz9WVO3suRG8arZLjCoWdr6hEO7Sne3SQgLFOOosQmg==
X-Received: by 2002:a2e:bc05:0:b0:2ee:4a63:e927 with SMTP id 38308e7fff4ca-2ef05d43915mr19004941fa.39.1721305148181;
        Thu, 18 Jul 2024 05:19:08 -0700 (PDT)
Message-ID: <c311ef0f-7d86-4a2b-b056-9bfa0665113e@suse.com>
Date: Thu, 18 Jul 2024 14:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 4/4] x86/fpu: Split fpu_setup_fpu() in two
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <da30dedcfa68d7c30375b96c85424e13ec6d458b.1720538832.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <da30dedcfa68d7c30375b96c85424e13ec6d458b.1720538832.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 17:52, Alejandro Vallejo wrote:
> It's doing too many things at once and there's no clear way of defining what
> it's meant to do. This patch splits the function in two.
> 
>   1. A reset function, parameterized by the FCW value. FCW_RESET means to reset
>      the state to power-on reset values, while FCW_DEFAULT means to reset to the
>      default values present during vCPU creation.
>   2. A x87/SSE state loader (equivalent to the old function when it took a data
>      pointer).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I'm still not sure what the old function tries to do. The state we start vCPUs
> in is _similar_ to the after-finit, but it's not quite (`ftw` is not -1). I went
> for the "let's not deviate too much from previous behaviour", but maybe we did
> intend for vCPUs to start as if `finit` had just been executed?

A relevant aspect here may be that what FSXR and XSAVE area have is only an
abridged form of the tag word, being only 8 bits in size. 0x00 there is
equivalent to FTW=0xffff (all st(<N>) empty). That's not quite correct for
the reset case indeed, where FTW=0x5555 (i.e. all st(<N>) zero, requiring
the abridged form to hold 0xff instead). While no-one has reported issues
there so far, I think it wouldn't be inappropriate to correct this.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1162,10 +1162,17 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>      seg.attr = ctxt.ldtr_arbytes;
>      hvm_set_segment_register(v, x86_seg_ldtr, &seg);
>  
> -    /* Cover xsave-absent save file restoration on xsave-capable host. */
> -    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
> -                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_regs : NULL,
> -                   FCW_RESET);
> +    /*
> +     * On Xen 4.1 and later the FPU state is restored on a later HVM context, so
> +     * what we're doing here is initialising the FPU state for guests from even
> +     * older versions of Xen. In general such guests only use legacy x87/SSE
> +     * state, and if they did use XSAVE then our best-effort strategy is to make
> +     * an XSAVE header for x87 and SSE hoping that's good enough.
> +     */
> +    if ( ctxt.flags & XEN_X86_FPU_INITIALISED )
> +        vcpu_setup_fpu(v, &ctxt.fpu_regs);
> +    else
> +        vcpu_reset_fpu(v, FCW_RESET);

I'm struggling with the use of "later" in the comment. What exactly is that
meant to express? Fundamentally the XSAVE data is fully backwards compatible
with the FXSR one, I think, so the mentioning of "best-effort" isn't quite
clear to me either.

> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -310,41 +310,25 @@ int vcpu_init_fpu(struct vcpu *v)
>      return xstate_alloc_save_area(v);
>  }
>  
> -void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
> -                    const void *data, unsigned int fcw_default)
> +void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw)
>  {
> -    fpusse_t *fpu_sse = &v->arch.xsave_area->fpu_sse;
> -
> -    ASSERT(!xsave_area || xsave_area == v->arch.xsave_area);
> -
> -    v->fpu_initialised = !!data;
> -
> -    if ( data )
> -    {
> -        memcpy(fpu_sse, data, sizeof(*fpu_sse));
> -        if ( xsave_area )
> -            xsave_area->xsave_hdr.xstate_bv = XSTATE_FP_SSE;
> -    }
> -    else if ( xsave_area && fcw_default == FCW_DEFAULT )
> -    {
> -        xsave_area->xsave_hdr.xstate_bv = 0;
> -        fpu_sse->mxcsr = MXCSR_DEFAULT;
> -    }
> -    else
> -    {
> -        memset(fpu_sse, 0, sizeof(*fpu_sse));
> -        fpu_sse->fcw = fcw_default;
> -        fpu_sse->mxcsr = MXCSR_DEFAULT;
> -        if ( v->arch.xsave_area )
> -        {
> -            v->arch.xsave_area->xsave_hdr.xstate_bv &= ~XSTATE_FP_SSE;
> -            if ( fcw_default != FCW_DEFAULT )
> -                v->arch.xsave_area->xsave_hdr.xstate_bv |= X86_XCR0_X87;
> -        }
> -    }
> +    v->fpu_initialised = false;
> +    *v->arch.xsave_area = (struct xsave_struct) {
> +        .fpu_sse = {
> +            .mxcsr = MXCSR_DEFAULT,
> +            .fcw = fcw,
> +        },
> +        .xsave_hdr.xstate_bv = fcw == FCW_RESET ? X86_XCR0_X87 : 0,
> +    };
> +}

Old code checked against FCW_DEFAULT uniformly. You switching to checking
against FCW_RESET is no functional change only because all callers pass
either of the two values. I wonder whether the new function's parameter
wouldn't want to be a boolean (reset vs init).

> -    if ( xsave_area )
> -        xsave_area->xsave_hdr.xcomp_bv = 0;
> +void vcpu_setup_fpu(struct vcpu *v, const void *data)
> +{
> +    v->fpu_initialised = true;
> +    *v->arch.xsave_area = (struct xsave_struct) {
> +        .fpu_sse = *(fpusse_t*)data,

First of all please never cast away const. See Misra rule 11.8. And then
a nit again: Blank ahead of the latter of the two *-s, please.

> --- a/xen/arch/x86/include/asm/i387.h
> +++ b/xen/arch/x86/include/asm/i387.h
> @@ -31,10 +31,29 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
>  void vcpu_restore_fpu_lazy(struct vcpu *v);
>  void vcpu_save_fpu(struct vcpu *v);
>  void save_fpu_enable(void);
> -
>  int vcpu_init_fpu(struct vcpu *v);
> -struct xsave_struct;
> -void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
> -                    const void *data, unsigned int fcw_default);
>  void vcpu_destroy_fpu(struct vcpu *v);
> +
> +/*
> + * Restore `v`'s FPU to known values
> + *
> + * If fcw == FCW_RESET, then the reset state is power-on RESET.
> + *
> + * Otherwise `mxcsr` is set to `MXCSR_DEFAULT`, `fcw` is overriden with the
> + * `fcw` argument and everything else is zeroed out.

Backticks are used for two different purposes here, which I'm afraid is
confusing. You want to make it easy to tell function arguments from other
entities, imo.

> + * @param v   vCPU containing the FPU
> + * @param fcw Intended FPU Control Word
> + */
> +void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw);
> +
> +/*
> + * Load x87/SSE state into `v`'s FPU

Applicable here then as well.

Jan

