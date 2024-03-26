Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3388C0B6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 12:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698041.1089355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp53o-0002Ov-04; Tue, 26 Mar 2024 11:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698041.1089355; Tue, 26 Mar 2024 11:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp53n-0002NC-Td; Tue, 26 Mar 2024 11:33:43 +0000
Received: by outflank-mailman (input) for mailman id 698041;
 Tue, 26 Mar 2024 11:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGH+=LA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rp53m-0002N6-4k
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 11:33:42 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0df6841-eb64-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 12:33:39 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-515a81928faso2771957e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 04:33:39 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u14-20020a056402110e00b0056bfc48406csm3570825edv.7.2024.03.26.04.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 04:33:38 -0700 (PDT)
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
X-Inumbo-ID: b0df6841-eb64-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711452819; x=1712057619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFihbIHx519vetj8heH7cI1+jYi3MJxoJ9N464/WuLY=;
        b=nTHxUsnLI7WCA8qddhi3WJrzR36+KSgqOKh6q1JAz8CRpgp33nkSSqfSEW6+jKjZnD
         rahIiw8PxrD8mLDFelsc+Or7qRDlGLHzOqLLOyHZEeSzhcTNHXgVysVbj+jpVpvZOGsA
         N6rJVEyDhZWvUgRZ/WmeGtvvWF94siHkzxknw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711452819; x=1712057619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFihbIHx519vetj8heH7cI1+jYi3MJxoJ9N464/WuLY=;
        b=CxIWRAQnHfDG9neM7M9rofAimWb1MqNXUQjs/STQ6ZiIvAwI5viulIx07Lavw1VKrx
         VGgo1JCbgg47JgC2oZGz2O58xqnzWegUWiQEGiZ1KgyTCKxZES6EuL0KtfeCvwVmXA8m
         qXz/04V5Oie6BwJhVUB3IYs/8Rkp4QaKrCYtNY/MmKM/VmmGLNJgni3Cu9jHSyOTDyR4
         aUOtWrqrIa1KWYLWLB8ic+G1k6veINf7piTq97+dO06p2x1G2VXOxL0UrdeYmuZts6OP
         7JGR8lvMkLzlNUm/E0cG/LOT1tq5kAMz7VsiRHGmb01hoF8qre1hmHZcL71OHy4WdjCH
         5KSA==
X-Forwarded-Encrypted: i=1; AJvYcCXZzMB05xz3zIs5xqHc1udGANiJuts6ih5+DAPG8YL6g1OpEimnphk6IdwDm69GKuv9gORyY3XIdsS4FIuRBZVeKGSIpfP8Ke4tP+Gtyso=
X-Gm-Message-State: AOJu0Yy1OAlVmHTXoMU4VACaBjY89bbf7l76uBfSbYYh3xgK53Jam/Qg
	B5Gmw6gbJb9w9EPC5z/9+kbFpVnD17qu4y2wgTS36AQejHLjokCgdYeR0x7E8Gw=
X-Google-Smtp-Source: AGHT+IE9guz682ae5nwhIVGQbiEVR0ZelppmFhDTjh07D3Cs5qUGMCkOrmVpbSoM46s5BRrE3RN+kg==
X-Received: by 2002:a19:5f14:0:b0:513:27a1:24cb with SMTP id t20-20020a195f14000000b0051327a124cbmr646780lfb.51.1711452818541;
        Tue, 26 Mar 2024 04:33:38 -0700 (PDT)
Message-ID: <78be9d6c-2b3d-43ad-92fe-23d58767e2d6@citrix.com>
Date: Tue, 26 Mar 2024 11:33:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec-ctrl: Support for SRSO_US_NO and SRSO_MSR_FIX
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240325181830.638680-1-andrew.cooper3@citrix.com>
 <c03d96b2-ad9c-4fa7-b7bb-fb453dbb9c5e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c03d96b2-ad9c-4fa7-b7bb-fb453dbb9c5e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2024 9:13 am, Jan Beulich wrote:
> On 25.03.2024 19:18, Andrew Cooper wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2377,7 +2377,8 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>>  >              {msr-sc,rsb,verw,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
>>  >              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
>>  >              eager-fpu,l1d-flush,branch-harden,srb-lock,
>> ->              unpriv-mmio,gds-mit,div-scrub,lock-harden}=<bool> ]`
>> +>              unpriv-mmio,gds-mit,div-scrub,lock-harden,
>> +>              bp-spec-reduce}=<bool> ]`
>>  
>>  Controls for speculative execution sidechannel mitigations.  By default, Xen
>>  will pick the most appropriate mitigations based on compiled in support,
>> @@ -2509,6 +2510,12 @@ boolean can be used to force or prevent Xen from using speculation barriers to
>>  protect lock critical regions.  This mitigation won't be engaged by default,
>>  and needs to be explicitly enabled on the command line.
>>  
>> +On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
>> +to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
>> +SRSO (Speculative Return Stack Overflow) vulnerability.
> "... against HVM guests" to avoid things being left ambiguous, and to also ...
>
>>  By default, Xen will
>> +use bp-spec-reduce when available, as it preferable to using `ibpb-entry=hvm`
>> +to mitigate SRSO.
> ... correlate with the `ibpb-entry=hvm` here?

Ok.

> Maybe at the start of the paragraph also add "AMD"?

The rest of the text specifically doesn't mention vendors, in an attempt
to prevent it going stale.

Although now I re-read it, it makes the statements about microcode drops
ambiguous.

>
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -1009,16 +1009,31 @@ static void cf_check fam17_disable_c6(void *arg)
>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>  }
>>  
>> -static void amd_check_erratum_1485(void)
>> +static void amd_check_bp_cfg(void)
>>  {
>> -	uint64_t val, chickenbit = (1 << 5);
>> +	uint64_t val, new = 0;
>>  
>> -	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x19 || !is_zen4_uarch())
>> +	/*
>> +	 * AMD Erratum #1485.  Set bit 5, as instructed.
>> +	 */
>> +	if (!cpu_has_hypervisor && boot_cpu_data.x86 == 0x19 && is_zen4_uarch())
>> +		new |= (1 << 5);
>> +
>> +	/*
>> +	 * On hardware supporting SRSO_MSR_FIX, we prefer BP_SPEC_REDUCE to
>> +	 * IBPB-on-entry to mitigate SRSO for HVM guests.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_HVM) && boot_cpu_has(X86_FEATURE_SRSO_US_NO) &&
>> +            opt_bp_spec_reduce)
> Nit: Indentation is odd here (wants to be a tab followed by a few spaces).
>
>> +		new |= BP_CFG_SPEC_REDUCE;
> I take it that this goes from the assumption that it is deemed pretty unlikely
> that nowadays people would only run PV guests on a host? Otherwise, assuming
> that - like almost any such mitigation - its use costs performance, enabling
> the mitigation only as long as there are any HVM guests around might be better.

I have no idea what the perf cost is.  Native systems are expected not
to use this.

However, I have no care to try and make this dynamic based on having HVM
guests active.  For one, it would need a real spinlock to avoid the MSR
race, or a stop machine context, and anyone running PV guests on this
hardware really oughtn't to be.

[Edit, See later, but we need this for PV too]

>
>> +	/* Avoid reading BP_CFG if we don't intend to change anything. */
>> +	if (!new)
>>  		return;
>>  
>>  	rdmsrl(MSR_AMD64_BP_CFG, val);
>>  
>> -	if (val & chickenbit)
>> +	if ((val & new) == new)
>>  		return;
> Since bits may also need turning off:
>
> 	if (!((val ^ new) & (BP_CFG_SPEC_REDUCE | (1 << 5))))
> 		return;
>
> and the !new early-out dropped, too? Looks like this wasn't quite right
> before, either. 

That's adding unnecessary complexity.  It's unlikely that we'll ever
need to clear bits like this.

>
>> @@ -1078,22 +1082,41 @@ static void __init ibpb_calculations(void)
>>           * Confusion.  Mitigate with IBPB-on-entry.
>>           */
>>          if ( !boot_cpu_has(X86_FEATURE_BTC_NO) )
>> -            def_ibpb_entry = true;
>> +            def_ibpb_entry_pv = def_ibpb_entry_hvm = true;
>>  
>>          /*
>> -         * Further to BTC, Zen3/4 CPUs suffer from Speculative Return Stack
>> -         * Overflow in most configurations.  Mitigate with IBPB-on-entry if we
>> -         * have the microcode that makes this an effective option.
>> +         * Further to BTC, Zen3 and later CPUs suffer from Speculative Return
>> +         * Stack Overflow in most configurations.  Mitigate with IBPB-on-entry
>> +         * if we have the microcode that makes this an effective option,
>> +         * except where there are other mitigating factors available.
>>           */
> Hmm, is "Zen3 and later" really appropriate?

Yes.

SRSO isn't fixed until SRSO_NO is enumerated.

> Isn't your "speculative coding"
> remark related to perhaps both of the new bits becoming available on Zen5
> (meaning that the vulnerability would be limited to the guest/host boundary,
> as long as the MSR-based mitigation isn't used)?

Both of these are interim fixes.
>>          if ( !boot_cpu_has(X86_FEATURE_SRSO_NO) &&
>>               boot_cpu_has(X86_FEATURE_IBPB_BRTYPE) )
>> -            def_ibpb_entry = true;
>> +        {
>> +            /*
>> +             * SRSO_U/S_NO is a subset of SRSO_NO, identifying that SRSO isn't
>> +             * possible across the user/supervisor boundary.  We only need to
>> +             * use IBPB-on-entry for PV guests on hardware which doesn't
>> +             * enumerate SRSO_US_NO.
>> +             */
>> +            if ( !boot_cpu_has(X86_FEATURE_SRSO_US_NO) )
>> +                def_ibpb_entry_pv = true;
> opt_rsb_pv continues to take opt_pv32 into account, despite us having
> removed security support for 32-bit PV guests (by wording that's sadly a
> little ambiguous). Shouldn't that be done here too then, seeing that the
> flag only covers transitions from ring3?

Hmm, probably.

In practice, all these systems have CET so PV32 will be off-by-default,
but if people really want to run PV32 guests, we might as well do our best.

>
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -304,7 +304,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
>>  XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
>>  XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
>>  XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
>> -XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
>> +XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
>> +XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A  Hardware not vulnerable to SRSO across the User/Supervisor boundary */
> Can we validly expose this to 64-bit PV guests, where there's no CPL
> boundary? Or else isn't my "x86/PV: issue branch prediction barrier
> when switching 64-bit guest to kernel mode" needed as a prereq?

Based on uarch details, if BP-SPEC-REDUCE is active, we can advertise
SRSO_US_NO to PV guests.

But I doubt I'll be able to persuade AMD to put the safety details
behind this in writing.


I also missed the hunks adding SRSO_US_NO and SRSO_MSR_FIX to
print_details().  Fixed locally.

~Andrew

