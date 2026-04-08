Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LsPKVhD1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:00:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D83BBA0C
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275818.1561528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARZn-0005af-7n; Wed, 08 Apr 2026 12:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275818.1561528; Wed, 08 Apr 2026 12:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARZn-0005Yc-4a; Wed, 08 Apr 2026 12:00:07 +0000
Received: by outflank-mailman (input) for mailman id 1275818;
 Wed, 08 Apr 2026 12:00:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARZl-0005Nl-Qm
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:00:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARZl-00FRXj-2g
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:00:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d64339-e002-0a2a0a5209dd-0a2a4507cb8c-30
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:00:04 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d64344-ba2d-0a2a45070019-d1558031b1c0-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:00:04 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4888375f735so58160395e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:00:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a4b2e111sm361362825e9.1.2026.04.08.05.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:00:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775649604; x=1776254404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GonctP+zBht/YI/YmvNFud8nNmDlZKQ0R6oRVx0JBVA=;
        b=D5hQV63/2G+hxeZofvwQ5WoOiaOykqXhiWwAICL8cSvFakDI8ihrIwnn0aHbofByxV
         9McjOQzplyuQgy2cDD9kJl1nJj0jpsJ1A+/g3st2Fv9EIU9SaiQdW9wPEZjLaYbw5kR2
         ILUZpmBJL/EDu4qnXcnsTZiGlAIN1Fqjin7H40e3g1ozMomznJBI+eYhEK6v2SEABjgv
         flN8S+ggfWXmxQJ9OpET7M0XGfeeG0ioElGmdpUXFn6kOYQQWg549J8ewCEOQnEM+Pdj
         pOlNWbiywcSxc54ZECXLU7kQmWF1dVNf0zSPH3yiL/WltMTtGR/2+bNqLamIDX4xH83a
         8rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649604; x=1776254404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GonctP+zBht/YI/YmvNFud8nNmDlZKQ0R6oRVx0JBVA=;
        b=M3TJkeRSBYEg2hzQjtGiW8MS7htvDxhNqhTDwyha6EDEcSwVHJXeECZO1v6NgCIdzO
         oSzOsx99kQwehKZwPLLOZ+642dB8PUkK5VVI1rqWHi0JG/9Y7lWVVYQrIPvTqsjotqBl
         NpMGGR43/igzl4pHqkxP2Y2OvXF5hdSpS+t+qdAB1wXsqRPpc7zStg3nbvaVUU7zW+kT
         ezcwGuysY+rX+ueWfyociR+FoBOZ/eQFR/Vme19wiXzeFRKCi2V2kta6+1GMWS22fXw4
         ga3YLwIRw/n3dHj6ghcwEvwqqQ+AqXGX20heIAgcVvUqjvPZxxQGMFeWxux+sPaXXJ1I
         1GWw==
X-Forwarded-Encrypted: i=1; AJvYcCW1fRMqN3cJEb6YHyxElWC0sU3FeW5fqywKEvCYBqIZjQeIflVNYUf/IsEZ+pw32CwVUFJnLJ1cGZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkZke2Hi6+C0BpVtn4Xr7qOkfersGKL3Yb9ei53oVosLyRSA4m
	q4//bfFxJuCsoldLw3aSUcb/UusDpXTfwhtBhfKdHXGIxNzvKWJLjSzvJ3GtK7KNZQ==
X-Gm-Gg: AeBDietkWYWU1BbUc7B8AdlQhqIvo5hmxbYS5ODZqIWB/fZWzOweOxlAH+hDkp52AWU
	SjdhK9eMzzXAA+buHrnFk7CAKnhQijMv+7D4xpxSYD7NvvjXeh+sHLrRwsPxhnQLIcXicvg02x7
	i0bPErZ/49uFJj9wMI3D/PQcY87GLm8TlAM5IN00TpLGu/p89hIerk/Hy/vQu9a61nuskiyRnzd
	+5ng8vw7/sM4jThn6xcTe4J2MdPjwy5AP3242jCzwKAj1jbgFDVB8/5uWjAwhLnDQIg6Od1QBjI
	1sX5DOxXO+KUEPdyggD/SbQLdqsYBICZtE4WNcN5lOp3xX3/7IcDhX8+lBRcBhem9qvF5RMUDdf
	jlkkgzI1D5tSV4kibCLgJPkAerdy9AGZMoYO8X9BQOxgd4iBD/RRzPmzPFw0r/MMtcdkIESaVOC
	hSBHf+eiMQvljv9JfDhsSeHc6G6BJgeHZto4JpTvTCzvFKYmLXzm9m6hQtYXDn0PagaWXdeWl8m
	qZc0q+3zcDlIAfGSPUAFcyXNA==
X-Received: by 2002:a05:600c:4f15:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488995cbaa7mr315339315e9.0.1775649604164;
        Wed, 08 Apr 2026 05:00:04 -0700 (PDT)
Message-ID: <f243ce4a-ecf8-42fe-b30d-bc77ad86074e@suse.com>
Date: Wed, 8 Apr 2026 14:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] x86emul: support LKGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a902e1bb-d51e-4889-a4af-505fd19e63d0@suse.com>
 <9b9dd025-fd4d-4fa1-abb4-ad10c86f839e@citrix.com>
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
In-Reply-To: <9b9dd025-fd4d-4fa1-abb4-ad10c86f839e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775649604-13B4041E-E68E4F2C/0/0
X-purgate-type: clean
X-purgate-size: 6360
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sreg.base:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 852D83BBA0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 13:34, Andrew Cooper wrote:
> On 08/04/2026 11:22 am, Jan Beulich wrote:
>> ---
>> For PV save_segments() would need adjustment,
> 
> Not really.  CPL3 must never have a way of modifying GS_KERN, hence ...
> 
>> but the insn being restricted to ring 0 means PV guests can't use it anyway
> 
> ... the CPL0 restriction.
> 
> Arguably I should have had this in one of the FRED patches:
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1952,7 +1952,7 @@ static void load_segments(struct vcpu *n)
>   * changes to bases can also be made with the WR{FS,GS}BASE instructions, when
>   * enabled.
>   *
> - * Guests however cannot use SWAPGS, so there is no mechanism to modify the
> + * Guests cannot use SWAPGS or LKGS, so there is no mechanism to modify the
>   * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
>   * GS base is still accurate, and doesn't need reading back from hardware.
>   *
> 
> 
> but I don't think it's appropriate to merge into this patch.
> 
>> (unless we wanted to emulate it as another privileged insn).
> 
> We already have "LKGS" in hypercall form.  It's spelt
> SEGBASE_GS_USER_SEL and has existed for 20 years or so.

Hmm, yes.

> I don't see any reason to extend emul_priv_op().

Nor do I. Nevertheless I wanted to mention the PV aspect.

>> I've also dropped the test harness read_segment() change. It generally
>> would be correct to have, but isn't needed anymore with neither SWAPGS
>> nor LKGS handling using the hook.
> 
> Dropping read_segment() makes your patch depend on Teddy's, now that
> test_x86_emulator is blocking in CI.

I'm not dropping read_segment() from there. I've dropped a change to
that function that v9 had. That depends on your change (which has gone
in), but not Teddy's. Or else I may not understand what you mean.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -2899,8 +2899,37 @@ x86_emulate(
>>                  break;
>>              }
>>              break;
>> -        default:
>> -            generate_exception_if(true, X86_EXC_UD);
>> +
>> +        case 6: /* lkgs */
>> +            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
>> +                                  X86_EXC_UD);
>> +            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
>> +            vcpu_must_have(lkgs);
>> +            fail_if(!ops->read_msr || !ops->write_segment || !ops->write_msr);
>> +            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
>> +                                     ctxt)) != X86EMUL_OKAY ||
>> +                 (rc = ops->read_msr(MSR_GS_BASE, &sreg.base,
>> +                                         ctxt)) != X86EMUL_OKAY )
>> +                goto done;
>> +            dst.orig_val = sreg.base; /* Preserve full GS Base. */
> 
> "Preserve current GS Base."
> 
>> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
>> +                                         ctxt, ops)) != X86EMUL_OKAY )
>> +                goto done;
>> +            /* Write (32-bit) base into SHADOW_GS. */
> 
> "Write new base into SHADOW_GS.  Zero extended from GDT/LDT."
> 
>> +            if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
>> +                                      ctxt, false)) != X86EMUL_OKAY ||
>> +                 (sreg.base = dst.orig_val, /* Reinstate full GS Base. */
> 
> "Reinstate original GS base."

I can make these adjustments, sure, yet I think my forms were clear enough.

> This patch needs one more hunk:
> 
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -765,14 +765,25 @@ static void __init calculate_hvm_max_policy(void)
>       */
>      __set_bit(X86_FEATURE_NO_LMSL, fs);
>  
> -    /*
> -     * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
> -     * long mode (and init_amd() has cleared it out of host
> capabilities), but
> -     * HVM guests are able if running in protected mode.
> -     */
> -    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
> -         raw_cpu_policy.basic.sep )
> -        __set_bit(X86_FEATURE_SEP, fs);
> +    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> +    {
> +        /*
> +         * On AMD, PV guests are unable to use SYSENTER as Xen runs in long
> +         * mode (and init_amd() has cleared it out of host
> capabilities), but
> +         * HVM guests are able if running in protected mode.
> +         */
> +        if ( raw_cpu_policy.basic.sep )
> +            __set_bit(X86_FEATURE_SEP, fs);
> +
> +        /*
> +         * NullSelectorClearsBase is really a "hardware doesn't have
> this bug
> +         * any more" bit.  All FRED-capable hardware has NSCB
> properties, so
> +         * disallow a configuration which suggest/causes behaviour the
> OS isn't
> +         * expecting.
> +         */
> +        if ( !test_bit(X86_FEATURE_NSCB, fs) )
> +            __clear_bit(X86_FEATURE_LKGS, fs);
> +    }
>  
>      /*
>       * VIRT_SSBD is exposed in the default policy as a result of
> 
> 
> because otherwise a CPU Policy could hide NCSB and LKGS would be have
> correctly when executed normally but malfunction in the emulator.

A policy cannot validly hide NSCB, as the flag - whichever way it is set -
describes how the underlying hardware works. We'd need to intercept and
emulate all selector loads to allow flag and hardware behavior to be out
of sync. I.e. what you say for LKGS would be true for all selector loads.

> This hunk is in lieu of having vendor-dependent deep-deps calculations,
> although it would need duplicating in userspace too.
> 
> Because this is only a link between an AMD-only feature and a common
> feature, I think I can express it by only having a per-vendor
> deep_features bitmap and keeping a shared deep_deps matrix.
> 
> Perhaps I should prototype that instead, but it would become another
> dependency for this patch.

Please do, albeit as per above I don't think it's truly a prereq to the
one here.

Jan

