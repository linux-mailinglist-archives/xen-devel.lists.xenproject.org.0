Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C89198E7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 22:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749461.1157559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMZ8Q-0001Vu-NP; Wed, 26 Jun 2024 20:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749461.1157559; Wed, 26 Jun 2024 20:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMZ8Q-0001Tj-Jx; Wed, 26 Jun 2024 20:20:54 +0000
Received: by outflank-mailman (input) for mailman id 749461;
 Wed, 26 Jun 2024 20:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3iT=N4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMZ8P-0001Td-J4
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 20:20:53 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94cee366-33f9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 22:20:51 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-df481bf6680so6748225276.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 13:20:51 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444c2b96f1bsm71144221cf.50.2024.06.26.13.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 13:20:48 -0700 (PDT)
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
X-Inumbo-ID: 94cee366-33f9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719433250; x=1720038050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zmIqgfhSAFjxQ2QdaVxb8nf0xnw08WiIAaLdT7PYG4Q=;
        b=WbgCWjxxR2Q+QZvaZ0NPxy1ffPWhyC7zYHoe5OQl350+TQx2HHumaFMXrlVwhbYhHf
         PtV5qtFTa5+vXVvqJGZFwsF71C+eus2Gg4xp2l7eOWmr5zeRqJ+vWe0OvbxVkXu+w1fL
         VOCfs/G0FY2409gsGk3C4sWCfIdGfTzLdlZcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433250; x=1720038050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmIqgfhSAFjxQ2QdaVxb8nf0xnw08WiIAaLdT7PYG4Q=;
        b=q62nNBfDNElVYrsSs5gGQEzMN6INPtX+lfZLknzyjNw4soTPTSV+P8JTJpRCN4+U1M
         B5b80W9z8wIcAHSRmkkkMpg2teQce7SEvQlW+zlFce+AwNzjaghozfF43V9cU1oTij4G
         uMvSsfMx6qpO+tgeK95kJuVPjP6HV50yqIAGguGZ/3Fqt5K37VcUdg6OJhBydQv0y5rq
         Nd1xZwWF3K2t/xkTvLFwr4ISyvXw4PwYNxIAIWum6HccsSQBTOwHwmzEA/dRyItbFroz
         sX6wkZwS7WbxnGC0by0LRw1p32mxKcsKNKizN1wkfuPWjsWrkuQaT/mvtixY2yzAv9jh
         H6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwXg1A3bJyVoN46DizBKwEBBPbBJAKrTNvxQz4FRQgjIMi6hO4KNh1uTfa9j2tdwiGDFJ5dYlQQB3hIISEh3ehVyE5w6znenQeRylhgoo=
X-Gm-Message-State: AOJu0Yz5GK9KjwvX6RiorzzqVj45Z7H3XnGEwojA6KBhPeQqWGVvQisf
	OSfO1FFS6VXRQAuFSLmMPfnHzpCdK10Ut/Z/K4NbjWBgktrdSJmepuuxeC5lsHs=
X-Google-Smtp-Source: AGHT+IGC/Ou3GeYLu9ZcYb2RUeYFXig4UGjp2KN+t3/+McSUOZfZEJ+LOFSIazx9SmP9Qvw05jvqdg==
X-Received: by 2002:a25:291:0:b0:df4:f2d2:fcd6 with SMTP id 3f1490d57ef6-e0303fe9b62mr11265914276.44.1719433250146;
        Wed, 26 Jun 2024 13:20:50 -0700 (PDT)
Message-ID: <b27d4722-a8d0-4134-bc2e-d2d751a88c10@citrix.com>
Date: Wed, 26 Jun 2024 21:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] x86/spec-ctrl: Support for SRSO_US_NO and
 SRSO_MSR_FIX
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240619191057.2588693-1-andrew.cooper3@citrix.com>
 <8510895d-70fb-4fce-adfa-ac5638b4ae3c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8510895d-70fb-4fce-adfa-ac5638b4ae3c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2024 9:39 am, Jan Beulich wrote:
> On 19.06.2024 21:10, Andrew Cooper wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2390,7 +2390,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>>  >              {ibrs,ibpb,ssbd,psfd,
>>  >              eager-fpu,l1d-flush,branch-harden,srb-lock,
>>  >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
>> ->              bhi-dis-s}=<bool> ]`
>> +>              bhi-dis-s,bp-spec-reduce}=<bool> ]`
>>  
>>  Controls for speculative execution sidechannel mitigations.  By default, Xen
>>  will pick the most appropriate mitigations based on compiled in support,
>> @@ -2539,6 +2539,13 @@ boolean can be used to force or prevent Xen from using speculation barriers to
>>  protect lock critical regions.  This mitigation won't be engaged by default,
>>  and needs to be explicitly enabled on the command line.
>>  
>> +On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
>> +to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
>> +SRSO (Speculative Return Stack Overflow) vulnerability.
> Upon my request to add "... against HVM guests" here you replied "Ok.", yet
> then you didn't make the change? Even a changelog entry says you supposedly
> added this, so perhaps simply lost in a refresh?

Yes, and later in the thread you (correctly) pointed out that it's not
only for HVM guests.

The PV aspect, discussed in the following sentence, is very relevant and
makes it not specific to HVM guests.

> It also didn't really become clear to me whether the entirety of your reply
> to my request for adding "AMD" early in the sentence wasn't boiling down
> more to a "yes, perhaps".

It was a "no I'm not going to introduce an inconsistency with the way
this document has been written for the past 7 years".


>
>> @@ -605,6 +606,24 @@ static void __init calculate_pv_max_policy(void)
>>          __clear_bit(X86_FEATURE_IBRS, fs);
>>      }
>>  
>> +    /*
>> +     * SRSO_U/S_NO means that the CPU is not vulnerable to SRSO attacks across
>> +     * the User (CPL3)/Supervisor (CPL<3) boundary.  However the PV64
>> +     * user/kernel boundary is CPL3 on both sides, so it won't convey the
>> +     * meaning that a PV kernel expects.
>> +     *
>> +     * PV32 guests are explicitly unsupported WRT speculative safety, so are
>> +     * ignored to avoid complicating the logic.
>> +     *
>> +     * After discussions with AMD, it is believed to be safe to offer
>> +     * SRSO_US_NO to PV guests when BP_SPEC_REDUCE is active.
> IOW that specific behavior is not tied to #VMEXIT / VMRUN, and also isn't
> going to in future hardware?

This is the best I can say in public.

I am satisfied with the explanation.
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -1009,16 +1009,33 @@ static void cf_check fam17_disable_c6(void *arg)
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
>> +	 * On hardware supporting SRSO_MSR_FIX, activate BP_SPEC_REDUCE by
>> +	 * default.  This lets us do two things:
>> +         *
>> +         * 1) Avoid IBPB-on-entry to mitigate SRSO attacks from HVM guests.
>> +         * 2) Lets us advertise SRSO_US_NO to PV guests.
>> +	 */
>> +	if (boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) && opt_bp_spec_reduce)
>> +		new |= BP_CFG_SPEC_REDUCE;
>> +
>> +	/* Avoid reading BP_CFG if we don't intend to change anything. */
>> +	if (!new)
>>  		return;
>>  
>>  	rdmsrl(MSR_AMD64_BP_CFG, val);
>>  
>> -	if (val & chickenbit)
>> +	if ((val & new) == new)
>>  		return;
> You explained that you want to avoid making this more complex, upon my
> question towards tweaking this to also deal with us possibly clearing
> flags. I'm okay with that, but I did ask that you add at least half a
> sentence to actually clarify this to future readers (which might include
> myself).

"I wrote it this way because it is sufficient and simple, but you can
change it in the future if you really need to" is line noise wherever
it's written.

It literally goes without saying, for every line the entire codebase.

>
>> @@ -1145,22 +1151,41 @@ static void __init ibpb_calculations(void)
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
> To my PV32 related comment here you said "..., we might as well do our best".
> Yet nothing has changed here?

Correct.

First, because the AMD Whitepaper actually says CPL0 and CPL3, not
User/Supervisor (the latter is only implied from the name AMD gave it).

Second, because I thought though what it would actually take to make
this work for PV32 which includes...

>  Yet then, thinking about it again, trying to
> help PV32 would apparently mean splitting def_ibpb_entry_pv and hence, via
> opt_ibpb_entry_pv, X86_FEATURE_IBPB_ENTRY_PV (and perhaps yet more items). I
> guess the resulting complexity then simply isn't worth it.

... the fact that Xen doesn't know if a PV guest is going to be PV32 or
PV64 until after the toolstack has partially constructed the domain,
including choosing it's "default" policy.

This ends up in a bizarre case where PV32 is more featureful than PV64,
(SRSO_US_NO does not depend on BP_SPEC_REDUCE), and nothing in the CPUID
hanlding logic can cope nicely with this.

Here, you end up in the weird situation where it's safe to always pass
the hardware SRSO_U/S_NO bit through into PV32, yet it's not

> However, as an unrelated aspect: According to the respective part of the
> comment you add to  calculate_pv_max_policy(), do we need the IBPB when
> BP_SPEC_REDUCE is active?

To what are you referring?

SRSO is about Return predictions becoming poisoned by other
predictions.  The best way to mount an SRSO attack is with forged
near-branch predictions.

For SRSO safety, we use IBPB to flush the Branch *Type* information from
the BTB.  Fam17h happened to have this property, but Fam19h needed it
retrofitting in a microcode update, with the prior "Indirect Branch
Targets only, explicitly retaining the Branch Type information" being
retroactively named SBPB.

This does not interact with the use of IBPB for it's
architecturally-given purpose.

>> +            /*
>> +             * SRSO_MSR_FIX enumerates that we can use MSR_BP_CFG.SPEC_REDUCE
>> +             * to mitigate SRSO across the host/guest boundary.  We only need
>> +             * to use IBPB-on-entry for HVM guests if we haven't enabled this
>> +             * control.
>> +             */
>> +            if ( !boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) || !opt_bp_spec_reduce )
>> +                def_ibpb_entry_hvm = true;
> Here and elsewhere, wouldn't conditionals become simpler if you (early on)
> cleared opt_bp_spec_reduce when !boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX)?

I don't think so, no.  The uses are all at different phases of
initialisation.

>
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -312,7 +312,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
>>  XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
>>  XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
>>  XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
>> -XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
>> +XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
>> +XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A! Hardware not vulnerable to SRSO across the User/Supervisor boundary */
> Nit: Elsewhere we have ! first, and I think that's preferable, to avoid
> confusion with | (which normally comes last).

Ok.

~Andrew

