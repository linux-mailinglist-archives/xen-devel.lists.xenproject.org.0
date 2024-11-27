Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEE9DA435
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 09:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844547.1260045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDo8-00081Z-AR; Wed, 27 Nov 2024 08:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844547.1260045; Wed, 27 Nov 2024 08:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDo8-0007yt-71; Wed, 27 Nov 2024 08:54:00 +0000
Received: by outflank-mailman (input) for mailman id 844547;
 Wed, 27 Nov 2024 08:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGDo6-0007yn-Qh
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 08:53:58 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2220fc24-ac9d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 09:53:55 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53deefc2ceeso1804259e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 00:53:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa53e293078sm484478466b.125.2024.11.27.00.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 00:53:54 -0800 (PST)
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
X-Inumbo-ID: 2220fc24-ac9d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIyMjBmYzI0LWFjOWQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjk3NjM1LjU3MjEwNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732697635; x=1733302435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vWOM9EU/589qDesvGxCx+aZRLeWB2DvMrheW+dYh4ug=;
        b=OMZh9fv+x9EoFykFYmBZjo77CaXJLleIXOvvyfNgB9pvSuMZLpfl9R3R8GrLNDVC1e
         /dapLXovEb8ckhyjjwQsY1ZtCY9Q7vrBd3LFUb0xvXoxk+Zf4zOpCISSaHzcLW4zzFMD
         lSGLNNNgo0XF2sB6T7S6KkftmEXYlt/SAqy3Ye354fbXqeQZhDeIzRHTJgooInppbnWO
         0f2rYcGJxuEkSsNm33/YRFTcO3t9lRlSzNC9Rcrx7d4ygaOaw5iqgTC/Inzm6yyZNE2n
         NAmTSxPw2pExW23iGLDzoCC2wrEy+6cUMa9KdiGnn0Rg9TLVd49EdDNw4LWbDhO6aAr2
         J23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732697635; x=1733302435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWOM9EU/589qDesvGxCx+aZRLeWB2DvMrheW+dYh4ug=;
        b=sb2NjW+U9DVTne4QYtKMJaaczrE1+5M6Xd7TDnG9Q0EoTMdRDDdwW3AmmA4a8t8Qvf
         7aV9x1hsEm5VDgvo7cH/xnaw4maSJhrBhRoELWKpx1sYkUSdEKcnjEgruq95s1PyAZfK
         ePX1/+9docCZVsAcfxNXGyE72lsWADc+BdINzMMVED7w0tSwodMXjN6ngCkHgpOeR/as
         uA/q6SJzXLnlhjEU+nFYp4Hk2e7Mt0eHwO0U8dPWjyCVghoDbJB4NhReH4yxrmtH+rr6
         FvJqmCdUQmRNXnZEu/HIzSx+w2o0Y0v3fd+SlVCNKN91upKlfTJC93N9sy/cKtFDN4VS
         R3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU06cCR/EKMT5MRvdGotO4jbj4C8DihhvxbP9jzDLhTbue80B2el3rFGTDUoiKqcNjhu2Qx/yLTPPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyv1cqwBWKfnYj1+8ycTjdztuu0XquGA+XFWASiV7qS99+MBDA
	hZBwWKu9efW/UvSWRVdYPgKhHEKGli2mNZDu8+eaaDhxeXpY6o70Wwv1i2xrSg==
X-Gm-Gg: ASbGnctr8U0FxOfAEn7FOf+xs5TBab1/iZH0xgxspzwVAgC9cUriIb80WI8RMIlaUGj
	+MQ2fd9Yr/THHxvxnHsRy4+IxQ2GhpjTW5YArNlYLGP53Ohk2ywmu6I096/8FGaWTCVNREJQwrX
	jLnyNLGwz/6he2LU7sNgJ1iQX0r2KtsHywGipWr7aT6qlOed+ckBpWXn/HLP2ksfvkaK5Ot9gI4
	TZQQ/p8O3pPLRoQKB+YKuUwVB9f1ZR38tXpDc6OctFt1+LTAfqlxxk/2C9jFlgG2gWTxUii/DVw
	RVUwKDZz3c1FBRUmF+d5+YY+zcCQXj6Q3sA=
X-Google-Smtp-Source: AGHT+IEDoMFgY2dzFWatDu8KWAJqSfVor54wtkFu3Qu7vWKxMONw5BcCyqiFVYaUlDnagJWFH7mq9w==
X-Received: by 2002:a05:6512:2216:b0:53d:ee0e:b466 with SMTP id 2adb3069b0e04-53df010b19emr1613837e87.38.1732697634877;
        Wed, 27 Nov 2024 00:53:54 -0800 (PST)
Message-ID: <7c6b410d-c397-41a0-9ab9-7fe1bf0c27ec@suse.com>
Date: Wed, 27 Nov 2024 09:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <66aa8b0c-c811-483b-839e-49ca817a4672@suse.com>
 <b0678e09-a253-42bb-81c1-6fe17c9caf99@citrix.com>
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
In-Reply-To: <b0678e09-a253-42bb-81c1-6fe17c9caf99@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 15:27, Andrew Cooper wrote:
> On 25/11/2024 2:27 pm, Jan Beulich wrote:
>> Before we start actually adjusting behavior when ERMS is available,
>> follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
>> REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
>> bit is clear. Don't extend the artificial clearing to guest view,
>> though: Guests can take their own decision in this regard, as they can
>> read (most of) MISC_ENABLE.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: Would be nice if "cpuid=no-erms" propagated to guest view (for
>>      "cpuid=" generally meaning to affect guests as well as Xen), but
>>      since both disabling paths use setup_clear_cpu_cap() they're
>>      indistinguishable in guest_common_feature_adjustments(). A separate
>>      boolean could take care of this, but would look clumsy to me.
>> ---
>> v3: New.
> 
> I'm not sure this is a terribly wise course of action.  First, ...

It's been a long time, but I wonder if it wasn't you who pointed me at that
Linux change.

>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -337,8 +337,18 @@ static void cf_check early_init_intel(st
>>  		paddr_bits = 36;
>>  
>>  	if (c == &boot_cpu_data) {
>> +		uint64_t misc_enable;
>> +
>>  		check_memory_type_self_snoop_errata();
>>  
>> +		/*
>> +		 * If fast string is not enabled in IA32_MISC_ENABLE for any reason,
>> +		 * clear the enhanced fast string CPU capability.
>> +		 */
>> +		rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>> +		if (!(misc_enable & MSR_IA32_MISC_ENABLE_FAST_STRING))
>> +			setup_clear_cpu_cap(X86_FEATURE_ERMS);
> 
> 
> ... this is a thread scope MSR, and commonly does have a BIOS option,
> and has been observed to be asymmetrically configured.  (On Intel at
> least.  AMD has no equivalent control that I'm aware of.)
> 
> It needs checking in init_intel() and on every CPU, and to use plain
> clear_cpu_cap().

Except that we have no plain clear_cpu_cap(), and for a good reason: What
would be the use of it when invoked post-boot? All we'd get is an
inconsistent view of the system, as cleared_caps[] is consumed only by
identify_cpu() (and early_cpu_init()).

If we have to fear asymmetry, shouldn't we rather update APs to what the
BSP has?

> But, we virtualise MSR_MISC_ENABLE (along with MSR_PLATFORM_INFO) to
> *all* guests in order to advertise CPUID Faulting (even on AMD systems
> which have an architectural CPUID faulting).

How does CPUID faulting come into the picture here?

>  This means that all guests
> reliably see FAST_STRINGS disabled, even when it happens to be active.

DYM "reliably see FAST_STRINGS set to the host value"? For both PV and
HVM we only make some adjustments to the value read from hardware. We
don't fiddle with FAST_STRINGS there either way.

Plus that's nothing the patch here changes, so it's not clear to me
what you expect me to do in this regard.

> It turns out that Linux will hide ERMS because of this, adversely
> affecting Linux's choices in the same way that PVShim is about to be
> impacted.
> 
> 
> I see no option but to virtualise MSR_MISC_ENABLE more properly on Intel
> systems, but it's not without it's complexity.  One #MC errata
> workaround involves clearing FAST_STRING and leaving it disabled until
> the next warm reset (Xen has no knowledge about this, but Linux will if
> provoked).

As per above, that's a separate change then. I'm neither changing
MISC_ENABLE here, nor do I do anything affecting what guests would see
there.

> The ability to modify the FAST_STRING bit is without enumeration; It's
> simply existed since the P4, and I'm unsure whether we want to honour a
> guest's choice to disable fast strings, or simply ignore what the guest
> wants and echo it's choice back to it.

Perhaps the latter, at least as a first step. Otherwise we get into
playing with the MSR on context switch.

>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -590,6 +590,15 @@ static void __init guest_common_feature_
>>       */
>>      if ( host_cpu_policy.feat.ibrsb )
>>          __set_bit(X86_FEATURE_IBPB, fs);
>> +
>> +    /*
>> +     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
>> +     * FAST_STRING is not set should not propagate to guest view.  Guests can
>> +     * judge on their own whether to ignore the CPUID bit when the MSR bit is
>> +     * clear.
>> +     */
>> +    if ( raw_cpu_policy.feat.erms )
>> +        __set_bit(X86_FEATURE_ERMS, fs);
> 
> ... this breaks migration of a VM between hosts with different Fast
> String settings.

Isn't this broken already? They'd observe each host's FAST_STRING setting.
I'm extending that brokenness to CPUID, yes, and ...

>  ERMS is perf-hint bit, so wants to be set in the Max
> policy, with Default taking the host value.  There are several other
> examples of this pattern, but I've not made a magic string for it yet.

... I will certainly switch to this model to avoid doing so. Using raw rather
than host value though as the default, because of the clearing of the feature
in the host policy (implicit from its clearing via setup_clear_cpu_cap()).
I.e. keeping the hunk above as is, but additionally set the bit in the max
policies (in guest_common_max_feature_adjustments()).

Jan

