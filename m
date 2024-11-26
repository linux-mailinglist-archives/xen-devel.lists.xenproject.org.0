Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A569D999A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 15:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843800.1259386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFwXn-0001Gs-Qk; Tue, 26 Nov 2024 14:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843800.1259386; Tue, 26 Nov 2024 14:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFwXn-0001Ez-O9; Tue, 26 Nov 2024 14:27:59 +0000
Received: by outflank-mailman (input) for mailman id 843800;
 Tue, 26 Nov 2024 14:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tFwXm-0001Et-V4
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 14:27:59 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9de0e481-ac02-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 15:27:51 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso65550991fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 06:27:51 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa533b04d87sm460945266b.97.2024.11.26.06.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 06:27:49 -0800 (PST)
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
X-Inumbo-ID: 9de0e481-ac02-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkZTBlNDgxLWFjMDItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjMxMjcxLjIzMjA5NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732631270; x=1733236070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QGKP/zwCz4WgxQ72Ftcf+4KBXBbEGWMRNxUpyv/zSW8=;
        b=Fv76BimyHVteuM7iHjNDKTTB/Nku9c2u5uGLAFO6MmNBZ2pwAm3Wvtg55+cATxscC2
         Hpgg42qPd9Ia4vBK8KmXAYe8gedCBYvJEE5QJ6P86X6lcUaheezjjWY8+XlNVjBKduj2
         0XDGVP576hHAKskeky/Fm9aKLE4cROKZQhM/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732631270; x=1733236070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGKP/zwCz4WgxQ72Ftcf+4KBXBbEGWMRNxUpyv/zSW8=;
        b=IP99h0IhRcwpSVc8STbM+g+YBvEaKnzTF2+UWzZ1B0S2Kvz2tXcl+6wIMgxRpjFRHj
         SqjfCq3E9lgyANlaxZsNezNCXGPgfxSOi4+bQg+xxuPnjr6/ZiKYJv6vcCFtIc5PzGSd
         WfbcBb15yCUOO7G7hdRwiDnhOkpPXONxjRJzlfHPoLQEZx3Wh2cCpc8JgPPtgdoO9Fpu
         f8f71NI3/kEQMTyVbAmwYUaYDxnGuPhqT4XzWcmfY5tcAJCJvDOiIrKnYYuMhccLmVU+
         ekMEeVeLBp2fqh50icql5fX616lGIKFBv1y5QV3N+Y09QDukdHWNCL2GmVd09COAgg2g
         YqIA==
X-Forwarded-Encrypted: i=1; AJvYcCUutzK72bLSinY3XsrA6ZyIxcuNoLGw4ogzdBuDG0jkpVrf6ki0Qj2q6Bes1S73Ru3nA2IwEaXABmE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGuk3Vvid3UAoHdAuZyirUx8QLhP+cKszpkuCiOhZ6LV07ZFzH
	EcMp1yvuHijdPmT3q+0uLQrKQpFzPwhBLFgC4NDeqBjOFpXXKy7to8PfmacvIuc=
X-Gm-Gg: ASbGnctjpCB4fadRp8648NyHMjaGUFBSv2wT8oEQE0M9oQ4UkjNAe5ZkFquKXFk95qB
	TC3s/Pffymlla7J9Nx4y//kcZMCLUxOdTBmMgfwW92dBUkXuKo9XdOOwA2+Aqu+7eRglHiabf+u
	8SWO5PxsiyT3iPLrQDO7KfGSVSouk+QjTHruxAmh4hBlI6SqKM24ao+OGkOkHKlbnhxK7K6imZ2
	/QtDltKdX6hieQ01FgC5ObDwrfUHfKxbakY6u1SpkyJU3nq3PtTLcjo7i9wrE0=
X-Google-Smtp-Source: AGHT+IGCJOhGSr3YEdrk3CjlPaAakogCyoekQZBfZXbaR2z7b51H00axfxSJf9E8J7nfirIWWY8ZfA==
X-Received: by 2002:a05:6512:3b90:b0:53d:c3aa:e4ec with SMTP id 2adb3069b0e04-53dd35a4cfamr8009111e87.1.1732631270449;
        Tue, 26 Nov 2024 06:27:50 -0800 (PST)
Message-ID: <b0678e09-a253-42bb-81c1-6fe17c9caf99@citrix.com>
Date: Tue, 26 Nov 2024 14:27:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <66aa8b0c-c811-483b-839e-49ca817a4672@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <66aa8b0c-c811-483b-839e-49ca817a4672@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2024 2:27 pm, Jan Beulich wrote:
> Before we start actually adjusting behavior when ERMS is available,
> follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
> REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
> bit is clear. Don't extend the artificial clearing to guest view,
> though: Guests can take their own decision in this regard, as they can
> read (most of) MISC_ENABLE.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Would be nice if "cpuid=no-erms" propagated to guest view (for
>      "cpuid=" generally meaning to affect guests as well as Xen), but
>      since both disabling paths use setup_clear_cpu_cap() they're
>      indistinguishable in guest_common_feature_adjustments(). A separate
>      boolean could take care of this, but would look clumsy to me.
> ---
> v3: New.

I'm not sure this is a terribly wise course of action.  First, ...

>
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -337,8 +337,18 @@ static void cf_check early_init_intel(st
>  		paddr_bits = 36;
>  
>  	if (c == &boot_cpu_data) {
> +		uint64_t misc_enable;
> +
>  		check_memory_type_self_snoop_errata();
>  
> +		/*
> +		 * If fast string is not enabled in IA32_MISC_ENABLE for any reason,
> +		 * clear the enhanced fast string CPU capability.
> +		 */
> +		rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +		if (!(misc_enable & MSR_IA32_MISC_ENABLE_FAST_STRING))
> +			setup_clear_cpu_cap(X86_FEATURE_ERMS);


... this is a thread scope MSR, and commonly does have a BIOS option,
and has been observed to be asymmetrically configured.  (On Intel at
least.  AMD has no equivalent control that I'm aware of.)

It needs checking in init_intel() and on every CPU, and to use plain
clear_cpu_cap().

But, we virtualise MSR_MISC_ENABLE (along with MSR_PLATFORM_INFO) to
*all* guests in order to advertise CPUID Faulting (even on AMD systems
which have an architectural CPUID faulting).  This means that all guests
reliably see FAST_STRINGS disabled, even when it happens to be active.

It turns out that Linux will hide ERMS because of this, adversely
affecting Linux's choices in the same way that PVShim is about to be
impacted.


I see no option but to virtualise MSR_MISC_ENABLE more properly on Intel
systems, but it's not without it's complexity.  One #MC errata
workaround involves clearing FAST_STRING and leaving it disabled until
the next warm reset (Xen has no knowledge about this, but Linux will if
provoked).

The ability to modify the FAST_STRING bit is without enumeration; It's
simply existed since the P4, and I'm unsure whether we want to honour a
guest's choice to disable fast strings, or simply ignore what the guest
wants and echo it's choice back to it.


Furthermore, ...

> +
>  		intel_init_levelling();
>  	}
>  
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -590,6 +590,15 @@ static void __init guest_common_feature_
>       */
>      if ( host_cpu_policy.feat.ibrsb )
>          __set_bit(X86_FEATURE_IBPB, fs);
> +
> +    /*
> +     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
> +     * FAST_STRING is not set should not propagate to guest view.  Guests can
> +     * judge on their own whether to ignore the CPUID bit when the MSR bit is
> +     * clear.
> +     */
> +    if ( raw_cpu_policy.feat.erms )
> +        __set_bit(X86_FEATURE_ERMS, fs);

... this breaks migration of a VM between hosts with different Fast
String settings.  ERMS is perf-hint bit, so wants to be set in the Max
policy, with Default taking the host value.  There are several other
examples of this pattern, but I've not made a magic string for it yet.

~Andrew

