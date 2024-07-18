Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6B934CC6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 13:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760424.1170274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUPdr-0002Wz-Db; Thu, 18 Jul 2024 11:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760424.1170274; Thu, 18 Jul 2024 11:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUPdr-0002VU-A1; Thu, 18 Jul 2024 11:49:47 +0000
Received: by outflank-mailman (input) for mailman id 760424;
 Thu, 18 Jul 2024 11:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUPdp-0002VK-LL
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 11:49:45 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2b38ecb-44fb-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 13:49:43 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eea7e2b0e6so11711331fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 04:49:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc271e2sm91437115ad.168.2024.07.18.04.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 04:49:42 -0700 (PDT)
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
X-Inumbo-ID: d2b38ecb-44fb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721303383; x=1721908183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NTO1Moi3WwzvBCk43Y+esa+kZmalZJva7Yg3Lfc4qPU=;
        b=XQZ96ZHR4oS1nKPJUnRR6K+Am/SAN191MRTqj98ljsXPNQ4Cqdt58b5H3GxNpRBPYp
         WYcBR9puMP7c8RE3Devp8+aZi4v3aKwXX8MNvrw83syOn3qH0yjxKGHc7dtuerJckP+U
         34NOPs2SPkXAk7CLCAIM2hjF1wGn9Bht1wHDx5ouT5OqCOqX6wmjCzhPkAbgOUBM2sMm
         8PGg+cj34Dms6xRjxXii9ZSxB7OBkGe158jK8875sIPhmGBL1JB5dgQYGsRXJBSVfyZG
         KKE1v5fACQGdY4pnAxQyCm9/2Mtc9ynbvwZ9zrjsq2/9FOkfWPcWOwEV8IA3JzQxCBPy
         MFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721303383; x=1721908183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTO1Moi3WwzvBCk43Y+esa+kZmalZJva7Yg3Lfc4qPU=;
        b=AZTrKrS+CRkVqhd6d9rvBfbW9gGO8cuY0WLYGBkh7ySFn5gIYDJnmY4eyeA55qnPhr
         l8fWxbP6h/gnDeOzzOt5dCgdkPWoCGSgLTU7uwtijJqDRdKFYvKleQpsMuO4/GRjWzRk
         SWevzSDVuKs5iaRdxR87jAnmw1MBj4zlzKD9PKVrHPbL2dF9njsNympMCZhSvf8Uvwwo
         oRRi4xsKwb0fUGpErZH/rI9Mv/R4e5QeeiBHMRshWUuiZLCy8EAaV5su7s/QQG1lvMXc
         GGaoiohGBVFkvSGNDtWfyTWpD24M/gomQo2ZRWLCd7c0LKOJ+hTzoDx1AjjzZiiurMuY
         eqVA==
X-Forwarded-Encrypted: i=1; AJvYcCV6RMU1C3DOGgzW+ZCf22f54Tl/mIPJKo/r9clXIxsBMd0LVw9SbzXajG97TURtCtbw3EJlZEu61COSeG0zx9qWW6JIPTeeDPJsY7LYWTg=
X-Gm-Message-State: AOJu0YySuwUEl5WhoKURvqeoJO6N2gZ0fWJblVMQNHquy5HGaey0s9Fs
	gCm2KotsX4If/T4OsjQ9CZuDjdNy25j+GUJJt7aOSnmK00MAN9Kaqv+NfYFHjw==
X-Google-Smtp-Source: AGHT+IGSSQSmSpFqaXtNZ16wrfLBT6XC0mP8TSK3rU8io1BPo6doXdX9wO8vbSOn/+r+3w9e+0SHNA==
X-Received: by 2002:a2e:88c5:0:b0:2ec:557b:f89c with SMTP id 38308e7fff4ca-2ef05d43a9fmr15614321fa.31.1721303382900;
        Thu, 18 Jul 2024 04:49:42 -0700 (PDT)
Message-ID: <78ae0b2f-e0a6-4ab9-b7a6-43e1357ff9b9@suse.com>
Date: Thu, 18 Jul 2024 13:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 3/4] x86/fpu: Combine fpu_ctxt and xsave_area in
 arch_vcpu
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <170c78f39dfef620d9060be3f1b31313673f09b9.1720538832.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <170c78f39dfef620d9060be3f1b31313673f09b9.1720538832.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 17:52, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1343,7 +1343,8 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  #define c(fld) (c.nat->fld)
>  #endif
>  
> -    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt));
> +    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
> +           sizeof(c.nat->fpu_ctxt));

Now that the middle argument has proper type, maybe take the opportunity
and add BUILD_BUG_ON(sizeof(...) == sizeof(...))? (Also in e.g.
hvm_save_cpu_ctxt() then.)

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -591,12 +591,7 @@ struct pv_vcpu
>  
>  struct arch_vcpu
>  {
> -    /*
> -     * guest context (mirroring struct vcpu_guest_context) common
> -     * between pv and hvm guests
> -     */
> -
> -    void              *fpu_ctxt;
> +    /* Fixed point registers */
>      struct cpu_user_regs user_regs;

Not exactly, no. Selector registers are there as well for example, which
I wouldn't consider "fixed point" ones. I wonder why the existing comment
cannot simply be kept, perhaps extended to mention that fpu_ctxt now lives
elsewhere.

> --- a/xen/arch/x86/x86_emulate/blk.c
> +++ b/xen/arch/x86/x86_emulate/blk.c
> @@ -11,7 +11,8 @@
>      !defined(X86EMUL_NO_SIMD)
>  # ifdef __XEN__
>  #  include <asm/xstate.h>
> -#  define FXSAVE_AREA current->arch.fpu_ctxt
> +#  define FXSAVE_AREA ((struct x86_fxsr *) \
> +                           (void*)&current->arch.xsave_area->fpu_sse)

Nit: Blank missing after before *.

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -507,9 +507,16 @@ int xstate_alloc_save_area(struct vcpu *v)
>      unsigned int size;
>  
>      if ( !cpu_has_xsave )
> -        return 0;
> -
> -    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
> +    {
> +        /*
> +         * This is bigger than FXSAVE_SIZE by 64 bytes, but it helps treating
> +         * the FPU state uniformly as an XSAVE buffer even if XSAVE is not
> +         * available in the host. Note the alignment restriction of the XSAVE
> +         * area are stricter than those of the FXSAVE area.
> +         */
> +        size = XSTATE_AREA_MIN_SIZE;

What exactly would break if just (a little over) 512 bytes worth were allocated
when there's no XSAVE? If it was exactly 512, something like xstate_all() would
need to apply a little more care, I guess. Yet for that having just always-zero
xstate_bv and xcomp_bv there would already suffice (e.g. using
offsetof(..., xsave_hdr.reserved) here, to cover further fields gaining meaning
down the road). Remember that due to xmalloc() overhead and the 64-byte-aligned
requirement, you can only have 6 of them in a page the way you do it, when the
alternative way 7 would fit (if I got my math right).

Jan

