Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8390FF0F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 10:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744286.1151302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDK5-0005pS-0K; Thu, 20 Jun 2024 08:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744286.1151302; Thu, 20 Jun 2024 08:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDK4-0005nt-Tn; Thu, 20 Jun 2024 08:39:12 +0000
Received: by outflank-mailman (input) for mailman id 744286;
 Thu, 20 Jun 2024 08:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKDK4-0005nn-6f
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 08:39:12 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b4833c-2ee0-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 10:39:11 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so1111544f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 01:39:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c7e58d3f93sm1101917a91.45.2024.06.20.01.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 01:39:09 -0700 (PDT)
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
X-Inumbo-ID: 90b4833c-2ee0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718872750; x=1719477550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iK9VrNyqPAWHESqyOB6kolM/1IfMF/IfC3WBxzHWHRc=;
        b=BzEzezWM6w7/GeG/h6LW0LUew8OSVVmcGaBbi0FnL0vXeUrY9BmKxyXw6LGT0OC3sm
         GQ67k4KdFnqnLdHrN9ba+FgUY5YyFlKD2/4h64lVONAy6GLYvdeTnAf/WTg0UHUkRyBi
         1ZlNv5IVHibXvJmYbfIEJKxGGLyBhxit0AmLQoPmaOBcZ9bAiegYMLH+PGGy4gln21Pj
         AYLtKZ+7zYBtE17owqcrrmX6qTAjmTCsfaVusXqjmehDG00D9KXg8h8foW4Eje+1/UKQ
         iNpE9qwo/2UcjqJPBx0J+B/lNEbxXkTkKeiicLt/ynYcVngTipD+Nsp+/kcxtbSXkS1h
         YfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718872750; x=1719477550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK9VrNyqPAWHESqyOB6kolM/1IfMF/IfC3WBxzHWHRc=;
        b=HHXsJ29xo39BgOCPiXlsm5sWG+MH0sqpwwg+prsnmAtmWYVXjcYmZikSe6KTjBvkNk
         /VFi7xiisVt5di7SUKl01dHmU/qHxSOQNHM4LBqNjN/kOADG0YDsL50NRjU7ZdIAbNZP
         MAMTSCtniDldGKB5Jxc5+gIV8jeBplMcorK4Kmf5eVvX/Cxs0XKCiWQz9B9emF1XOhcQ
         boVU9sBRyaOu5fqVaH0ityAweT2Mdd7CeXf5kviDM+xDGcSbPNXwaVPcwAeMMTUvdjZj
         iPPlqChCUSIZY6EBDvocThjaGvtr2GUcbzL0czAun4EBfGsgR0QsnSzWe4Vq89qIwgbW
         GDYw==
X-Forwarded-Encrypted: i=1; AJvYcCWX58nK98rQ/4GALVaLAtBcl60TmLCcXoehovLagXvFp4RXsySTWwnB5gm1P36wRSqWCdfrnqfxR6UszOdXQgxO8JjPbrUrRFzy5iIphS0=
X-Gm-Message-State: AOJu0YwO+S3xyRSkp7jnOcWBB98KFHdWbIdnmMpn3jSxkHu+irf179G0
	WXMNvsDoibHORgW6niwevKcz9Lc3cNV4DlZa2p12fFTBorEsrvUxXqboPfyKIA==
X-Google-Smtp-Source: AGHT+IHBaCQJPSHC9eWejO5AgoNza+C+5v/h+Y/DtpN7Y8MfruF0A1kgL0yH5hdinGEDpH9xNJoGhQ==
X-Received: by 2002:a5d:4dc2:0:b0:361:94d9:1e9f with SMTP id ffacd0b85a97d-36194d9203amr5713875f8f.7.1718872750116;
        Thu, 20 Jun 2024 01:39:10 -0700 (PDT)
Message-ID: <8510895d-70fb-4fce-adfa-ac5638b4ae3c@suse.com>
Date: Thu, 20 Jun 2024 10:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] x86/spec-ctrl: Support for SRSO_US_NO and
 SRSO_MSR_FIX
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240619191057.2588693-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240619191057.2588693-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 21:10, Andrew Cooper wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2390,7 +2390,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>  >              {ibrs,ibpb,ssbd,psfd,
>  >              eager-fpu,l1d-flush,branch-harden,srb-lock,
>  >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
> ->              bhi-dis-s}=<bool> ]`
> +>              bhi-dis-s,bp-spec-reduce}=<bool> ]`
>  
>  Controls for speculative execution sidechannel mitigations.  By default, Xen
>  will pick the most appropriate mitigations based on compiled in support,
> @@ -2539,6 +2539,13 @@ boolean can be used to force or prevent Xen from using speculation barriers to
>  protect lock critical regions.  This mitigation won't be engaged by default,
>  and needs to be explicitly enabled on the command line.
>  
> +On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
> +to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
> +SRSO (Speculative Return Stack Overflow) vulnerability.

Upon my request to add "... against HVM guests" here you replied "Ok.", yet
then you didn't make the change? Even a changelog entry says you supposedly
added this, so perhaps simply lost in a refresh?

It also didn't really become clear to me whether the entirety of your reply
to my request for adding "AMD" early in the sentence wasn't boiling down
more to a "yes, perhaps".

> @@ -605,6 +606,24 @@ static void __init calculate_pv_max_policy(void)
>          __clear_bit(X86_FEATURE_IBRS, fs);
>      }
>  
> +    /*
> +     * SRSO_U/S_NO means that the CPU is not vulnerable to SRSO attacks across
> +     * the User (CPL3)/Supervisor (CPL<3) boundary.  However the PV64
> +     * user/kernel boundary is CPL3 on both sides, so it won't convey the
> +     * meaning that a PV kernel expects.
> +     *
> +     * PV32 guests are explicitly unsupported WRT speculative safety, so are
> +     * ignored to avoid complicating the logic.
> +     *
> +     * After discussions with AMD, it is believed to be safe to offer
> +     * SRSO_US_NO to PV guests when BP_SPEC_REDUCE is active.

IOW that specific behavior is not tied to #VMEXIT / VMRUN, and also isn't
going to in future hardware?

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1009,16 +1009,33 @@ static void cf_check fam17_disable_c6(void *arg)
>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>  }
>  
> -static void amd_check_erratum_1485(void)
> +static void amd_check_bp_cfg(void)
>  {
> -	uint64_t val, chickenbit = (1 << 5);
> +	uint64_t val, new = 0;
>  
> -	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x19 || !is_zen4_uarch())
> +	/*
> +	 * AMD Erratum #1485.  Set bit 5, as instructed.
> +	 */
> +	if (!cpu_has_hypervisor && boot_cpu_data.x86 == 0x19 && is_zen4_uarch())
> +		new |= (1 << 5);
> +
> +	/*
> +	 * On hardware supporting SRSO_MSR_FIX, activate BP_SPEC_REDUCE by
> +	 * default.  This lets us do two things:
> +         *
> +         * 1) Avoid IBPB-on-entry to mitigate SRSO attacks from HVM guests.
> +         * 2) Lets us advertise SRSO_US_NO to PV guests.
> +	 */
> +	if (boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) && opt_bp_spec_reduce)
> +		new |= BP_CFG_SPEC_REDUCE;
> +
> +	/* Avoid reading BP_CFG if we don't intend to change anything. */
> +	if (!new)
>  		return;
>  
>  	rdmsrl(MSR_AMD64_BP_CFG, val);
>  
> -	if (val & chickenbit)
> +	if ((val & new) == new)
>  		return;

You explained that you want to avoid making this more complex, upon my
question towards tweaking this to also deal with us possibly clearing
flags. I'm okay with that, but I did ask that you add at least half a
sentence to actually clarify this to future readers (which might include
myself).

> @@ -1145,22 +1151,41 @@ static void __init ibpb_calculations(void)
>           * Confusion.  Mitigate with IBPB-on-entry.
>           */
>          if ( !boot_cpu_has(X86_FEATURE_BTC_NO) )
> -            def_ibpb_entry = true;
> +            def_ibpb_entry_pv = def_ibpb_entry_hvm = true;
>  
>          /*
> -         * Further to BTC, Zen3/4 CPUs suffer from Speculative Return Stack
> -         * Overflow in most configurations.  Mitigate with IBPB-on-entry if we
> -         * have the microcode that makes this an effective option.
> +         * Further to BTC, Zen3 and later CPUs suffer from Speculative Return
> +         * Stack Overflow in most configurations.  Mitigate with IBPB-on-entry
> +         * if we have the microcode that makes this an effective option,
> +         * except where there are other mitigating factors available.
>           */
>          if ( !boot_cpu_has(X86_FEATURE_SRSO_NO) &&
>               boot_cpu_has(X86_FEATURE_IBPB_BRTYPE) )
> -            def_ibpb_entry = true;
> +        {
> +            /*
> +             * SRSO_U/S_NO is a subset of SRSO_NO, identifying that SRSO isn't
> +             * possible across the user/supervisor boundary.  We only need to
> +             * use IBPB-on-entry for PV guests on hardware which doesn't
> +             * enumerate SRSO_US_NO.
> +             */
> +            if ( !boot_cpu_has(X86_FEATURE_SRSO_US_NO) )
> +                def_ibpb_entry_pv = true;

To my PV32 related comment here you said "..., we might as well do our best".
Yet nothing has changed here? Yet then, thinking about it again, trying to
help PV32 would apparently mean splitting def_ibpb_entry_pv and hence, via
opt_ibpb_entry_pv, X86_FEATURE_IBPB_ENTRY_PV (and perhaps yet more items). I
guess the resulting complexity then simply isn't worth it.

However, as an unrelated aspect: According to the respective part of the
comment you add to  calculate_pv_max_policy(), do we need the IBPB when
BP_SPEC_REDUCE is active?

> +            /*
> +             * SRSO_MSR_FIX enumerates that we can use MSR_BP_CFG.SPEC_REDUCE
> +             * to mitigate SRSO across the host/guest boundary.  We only need
> +             * to use IBPB-on-entry for HVM guests if we haven't enabled this
> +             * control.
> +             */
> +            if ( !boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) || !opt_bp_spec_reduce )
> +                def_ibpb_entry_hvm = true;

Here and elsewhere, wouldn't conditionals become simpler if you (early on)
cleared opt_bp_spec_reduce when !boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX)?

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -312,7 +312,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
>  XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
>  XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
>  XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
> -XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
> +XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
> +XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A! Hardware not vulnerable to SRSO across the User/Supervisor boundary */

Nit: Elsewhere we have ! first, and I think that's preferable, to avoid
confusion with | (which normally comes last).

Jan

