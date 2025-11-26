Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4BC884F7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172294.1497378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO9GS-0007ws-EL; Wed, 26 Nov 2025 06:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172294.1497378; Wed, 26 Nov 2025 06:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO9GS-0007um-BC; Wed, 26 Nov 2025 06:44:32 +0000
Received: by outflank-mailman (input) for mailman id 1172294;
 Wed, 26 Nov 2025 06:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vO9GR-0007ug-ON
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:44:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c00b882-ca93-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 07:44:30 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso2600065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 22:44:30 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52?
 (p200300cab70c6a15dd939ad410e5cb52.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a76sm38597411f8f.24.2025.11.25.22.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 22:44:29 -0800 (PST)
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
X-Inumbo-ID: 5c00b882-ca93-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764139470; x=1764744270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rH47JUdpBE8fS8Lyjlxp40JiqhAKxUvP8IpxkZ9ea3c=;
        b=IFdeDCZebGIybTTl/0+fSPvgomq7yBg5Z17nW+tC8+P385LX7pc2M+o7wNuUH0FJWh
         6jeVNCh/wW9uNkouie/ejp/mYpAc9oxzqHhYzr7l27vEQH7+gjMyGMs+9dXDE7KE8TuB
         +dmmaLmK4bKNonDBIjr1fi81QbdKh7cbauhL/fj3S8En3w0nQDHKaLrZ7wkG3bcma6Us
         C7YyVETzbi62zzjO+rG05iyVRIwFC3o0wuPcVFFopuN9qKIczAalKxsagLbcA8t0nHkG
         rqwxfpqM79v3BbLJhpdbZjMLKEylm2Zzz0zuPAQKGHZ/sN+39Pz1Iyn3tALP7+iwOulh
         r1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139470; x=1764744270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH47JUdpBE8fS8Lyjlxp40JiqhAKxUvP8IpxkZ9ea3c=;
        b=Go2Yw7LWjMur0wuB48sY+S64ZncsIGmruDtXh5430vsPVaqwXigWgAdTmiAHbJsmWc
         jJQvQlnG98bgkXf8jCRbnWsOW/zX27NFmXj8P8cRAIYVtlk5kBPUzKbHhj1i0AklPa7E
         tMtPQjm4RFip6rSytFfZBZiPhen6g032g7EDrBaekl/bsmouTTBIRS4yRudLR7uZE7gS
         n4xTSup20uFhjSOV5SqX3an2uyW3SgqiWb9IpkhjADJGOfkmDXDRSRyUk36UH1OTYTxG
         MTtMZkdRvZ5LhchhPyCair94oiVr7m1TL1UNEyng6ubLS+4HM2ouGryEtDOMqOfPz6rm
         Ty2A==
X-Forwarded-Encrypted: i=1; AJvYcCXg1Lvsk4tCpfPW5C8P+AWx/hRpag6DbhVdTO1aFY1un4Nd0pS+tD5MLGbZVdhDb9u0KDuQE4wMxdY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+aqb/D+O6jB5/1ZbsqAPA/MAWZ543K9p90Oah7TtYk4Zb489k
	uEV45Q0MuH0lZ0GVa+wejxf80wReBlDydgiiZRHhN3GeKtdH9WPN3Sn9tADCgSHW6w==
X-Gm-Gg: ASbGncuNote6Ayq/6PZ5QgvKg6lQxbX7JmR1tFue254E/yPUxFMCKFU6BAtNmF9oXEv
	LsHOv7AiJr6HOMMIxlrbYqfU/k+HIdcFzp6Z3BESrSQxEk8qBSWqEP72X4aGcIM1a0ZVaq7xtuF
	ioWQRACcrNZwNwIB7DTvFm+HGw4jTvvlP+v2i2tMeTDII2A0VF6WyN8O3sRJs9OzyVpvaTwXv7j
	/w2tmGUMZw4RJhCRmgVzI1XUWQFKyW/TJmcaheedvcSfvNIQ3oeLtArF7Z4ZZ+1ZVidYlZAP/mp
	umHqMD/GXRieUo5w3ezFIgJSnrqx58EIgrJtdmlCQ0XhF8r02DBtKh/8LpxLO2Cs5GjVAx7iXjK
	1wq0akx9Mr29XOrlVD8pd+a3TfOMCjqh90SbmS7t2KPO/ZaUo0xsWEelPfHJMZ+dDWBE7I/k3hb
	Fzw7G+5uau8lpI3YFc/K6BUpgt8KpNnj0aTLriDN6X+7V4CLbi6GIwuzfzEu4rEjXws6d3nljWG
	5ypxGyG7gGWGOl8ttrUa9YBht7hVy95D92kRqornB8wH2Di6MhbqjV8rYg=
X-Google-Smtp-Source: AGHT+IH5TpP8H0OVqJ4p4+ulCBNNTSGnhdbiyPANNw8G5up6E98V8eUHlAb5cqaSJANtRX+MKycrqg==
X-Received: by 2002:a05:6000:4026:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42cc125247bmr23311511f8f.0.1764139469645;
        Tue, 25 Nov 2025 22:44:29 -0800 (PST)
Message-ID: <356a69b1-f072-48b7-a66a-5aa827c8bab7@suse.com>
Date: Wed, 26 Nov 2025 07:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: Remove x86 prefixed names from cpuinfo for
 intel.c
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20251125202724.1384622-1-kevin.lampis@citrix.com>
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
In-Reply-To: <20251125202724.1384622-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2025 21:27, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Changes in v2:
> - Convert the two switch statements in probe_masking_msrs()
>   and check_memory_type_self_snoop_errata()
> - Requested style changes

As to the latter - not quite, see below.

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -86,18 +86,19 @@ static void __init check_memory_type_self_snoop_errata(void)
>  	if (!boot_cpu_has(X86_FEATURE_SS))
>  		return;
>  
> -	switch (boot_cpu_data.x86_model) {
> -	case 0x0f: /* Merom */
> -	case 0x16: /* Merom L */
> -	case 0x17: /* Penryn */
> -	case 0x1d: /* Dunnington */
> -	case 0x1e: /* Nehalem */
> -	case 0x1f: /* Auburndale / Havendale */
> -	case 0x1a: /* Nehalem EP */
> -	case 0x2e: /* Nehalem EX */
> -	case 0x25: /* Westmere */
> -	case 0x2c: /* Westmere EP */
> -	case 0x2a: /* SandyBridge */
> +	switch ( boot_cpu_data.vfm )
> +	{
> +	case INTEL_CORE2_MEROM:
> +	case INTEL_CORE2_MEROM_L:
> +	case INTEL_CORE2_PENRYN:
> +	case INTEL_CORE2_DUNNINGTON:
> +	case INTEL_NEHALEM:
> +	case INTEL_NEHALEM_G:
> +	case INTEL_NEHALEM_EP:
> +	case INTEL_NEHALEM_EX:
> +	case INTEL_WESTMERE:
> +	case INTEL_WESTMERE_EP:
> +	case INTEL_SANDYBRIDGE:

The ordering here would imo ...

> @@ -137,28 +138,29 @@ static void __init probe_masking_msrs(void)
>  	unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
>  
>  	/* Only family 6 supports this feature. */
> -	if (c->x86 != 6)
> +	if (c->family != 6)
>  		return;
>  
> -	switch (c->x86_model) {
> -	case 0x17: /* Yorkfield, Wolfdale, Penryn, Harpertown(DP) */
> -	case 0x1d: /* Dunnington(MP) */
> +	switch ( c->vfm )
> +	{
> +	case INTEL_CORE2_PENRYN:
> +	case INTEL_CORE2_DUNNINGTON:
>  		msr_basic = MSR_INTEL_MASK_V1_CPUID1;
>  		break;
>  
> -	case 0x1a: /* Bloomfield, Nehalem-EP(Gainestown) */
> -	case 0x1e: /* Clarksfield, Lynnfield, Jasper Forest */
> -	case 0x1f: /* Something Nehalem-based - perhaps Auburndale/Havendale? */
> -	case 0x25: /* Arrandale, Clarksdale */
> -	case 0x2c: /* Gulftown, Westmere-EP */
> -	case 0x2e: /* Nehalem-EX(Beckton) */
> -	case 0x2f: /* Westmere-EX */
> +	case INTEL_NEHALEM_EP:
> +	case INTEL_NEHALEM:
> +	case INTEL_NEHALEM_G:
> +	case INTEL_WESTMERE:
> +	case INTEL_WESTMERE_EP:
> +	case INTEL_NEHALEM_EX:
> +	case INTEL_WESTMERE_EX:

... best also be followed here, even if that means some re-ordering
compared to what original code had.

> @@ -572,8 +580,13 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>              factor = core_factors[msrval];
>              break;
>  
> -        case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
> -        case 0x25: case 0x2c: case 0x2f: /* Westmere */
> +        case INTEL_NEHALEM_EP:
> +        case INTEL_NEHALEM:
> +        case INTEL_NEHALEM_G:
> +        case INTEL_NEHALEM_EX:
> +        case INTEL_WESTMERE:
> +        case INTEL_WESTMERE_EP:
> +        case INTEL_WESTMERE_EX:
>              factor = 13333;
>              break;

Same here. (This iirc also wasn't there in v1, but isn't mentioned in
the changelog.)

> @@ -657,14 +670,17 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>  	/* Work around errata */
>  	Intel_errata_workarounds(c);
>  
> -	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> -		(c->x86 == 0x6 && c->x86_model >= 0x0e))
> -		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> -	if (cpu_has(c, X86_FEATURE_ITSC)) {
> -		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> -		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
> -		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
> -	}
> +    if ( ( c->family == 15 && c->model >= 0x03 ) ||
> +         ( c->family == 6 && c->model >= 0x0e ) )
> +        __set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> +
> +    if ( cpu_has(c, X86_FEATURE_ITSC) )
> +    {
> +        __set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> +        __set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
> +        __set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
> +    }
> +
>  	if ( opt_arat &&
>  	     ( c->cpuid_level >= 0x00000006 ) &&
>  	     ( cpuid_eax(0x00000006) & (1u<<2) ) )

From your v1 reply I concluded that you understood that this isn't the way
to go. Within a function, indentation shouldn't vary like this. I suggest
anyway that you really wait with submitting a new version until discussion
has settled.

Jan

