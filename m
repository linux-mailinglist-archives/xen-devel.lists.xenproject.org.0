Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE1C8D9CA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173657.1498675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYXi-0003Li-4r; Thu, 27 Nov 2025 09:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173657.1498675; Thu, 27 Nov 2025 09:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYXi-0003Ip-1B; Thu, 27 Nov 2025 09:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1173657;
 Thu, 27 Nov 2025 09:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOYXg-0003Ij-Ax
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:44:00 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9871ddb3-cb75-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 10:43:57 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b3377aaf2so384065f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:43:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca78f77sm2470582f8f.32.2025.11.27.01.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:43:57 -0800 (PST)
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
X-Inumbo-ID: 9871ddb3-cb75-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764236637; x=1764841437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6GX77rmB5naK+JKPmw6jU0H2AQeVc+HB91PKD3WOh8=;
        b=gcXwW8r1ggKU4q7Q6B35px41ysMUEtgkaM15Y1LMXwArPC4u0a7BDm1Mpsht0RiCcY
         pQfC/qaljRTJ0FCEhMu+XHMBaa3XV+zHIVqkYhJ0zkLu6oQyhwqmeZe7lD/nrHQf8Czr
         wRKXVfKfKwM8RSPN/WFi4yraPb0XWyudN+8ccwCn66H4TIzpkoBG2WZgrZFQIYNd6fPn
         j220aaOVbSpqs7fm5jFDomFswRkXA6heNqpmBKYHe/ISou9ZtElms7B/pKaDKOsyjVZN
         ua0RhpsW78KV0WXlldbI+3AyuBXhVfdjz1mtHsqnFFsdGV9ld/yp/waCGjO79SmgF1I1
         pgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236637; x=1764841437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6GX77rmB5naK+JKPmw6jU0H2AQeVc+HB91PKD3WOh8=;
        b=YAwdQTmZBAbhJBc2af7zfQ0Gf344GmuH1j2tCo2KLIJXGYWm9qxs8/hLky0yGnmk2y
         FB7AuYXIWgKlFUrX5WTuTsL4CoF/SrxR38O16z2lZ9P+JaSTzpSOUUOLskdIP+fl1F9t
         8JtQxHfrPaL3/nPODGOwGB6h5j4DmusBh/sP9Zl7LyF8DLffX4pUYJtq7VLbXi+tpj9j
         vTF1/EYFLapzx5aGQHUpZPscDp3NB0G34ZlU/C9vgXX49Dn8Q8IYG+XTiTrPcLGtAyqN
         tCrKAbK+opAVWByF+TVI8UuzxH2aG/QBXsjYb+/3kOG+BU/Dd5St8bzZpm4MVI+2YiAN
         NZig==
X-Forwarded-Encrypted: i=1; AJvYcCWo6kjEPbSLCC7kZd/JCeGUMMGIG9c0tbZRIbmlJK94VH5EhzMxMswUS2cJfL/E/hCN73Iev/wZPVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8ihnrlOUXlyENHHu1XJeKRe/YylSp3/FUQ8YuAiBM0Df/E4Wz
	ffsz0Dzr4mI/rRE5Oh3MnxY/zfwKCnUCaqqO/u6/Jbm/8Efh6a3Fni+t/Glyv47rHw==
X-Gm-Gg: ASbGncvO6XASeeH88HiMmDvISY+eCSq183uLaMLKivFi5Rc9UVBXJI7gUKm0oRHksc8
	dUBk3/W3kydSgqPSKWUAlPmP9vPUND6apVUOnpim8nBztm38u4y1WhWUSag1BcB0r2+DQKQ1V6+
	6lI5pi/361khDtE4QKwZxt3/1zHozEaAxhb69Ga29Btcb7QzFaa40RiCqLmhyztMxYofkSOFjqn
	IeM3EAcRZ6zdKjqFyRHXahoLxYAcyGdBTEebRBGBz1I9m9Sv+hFTDcg5OfWz3NeYMTowZ6EJnIg
	F0AoQGqS9gdsNRpY9fk61b07qfE5czTCRnnQ1TBTZrtvJ2w66eH0BT9iwuZd8vbkqW3zZ2l9uIJ
	dmbNB6D+PnX9HiokIz4vgneiPuttOv73YlIEBamMBpauaVJXDuK0qGJCBCInj3sSHNqzxdYu33H
	gaQLZ3Dt0s2BTgaFAgiXwyN6ZQcmiIJHeqCDJxFzImRV7E77rM+UhACwhe6yZTGfx2mL6EcXPtM
	0Q=
X-Google-Smtp-Source: AGHT+IH6Nt/uB+Bs565wh6m6P2t8d0ZDDLm/oA66fcsbe6gOG+PD22vSchTDXNZ07qX6CY5N3xCNQQ==
X-Received: by 2002:a05:6000:184d:b0:429:d66b:508f with SMTP id ffacd0b85a97d-42cc1d0cf29mr24071952f8f.30.1764236637301;
        Thu, 27 Nov 2025 01:43:57 -0800 (PST)
Message-ID: <868f28fe-f2dd-469d-a0cf-111885184dfe@suse.com>
Date: Thu, 27 Nov 2025 10:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 17:44, Alejandro Vallejo wrote:
> This enables very aggressive DCE passes on single-vendor builds in later
> patches, as it will allow most vendor checks to become statically chosen
> branches. A lot of statics go away and a lot more inlining is allowed.
> 
> In order to allow x86_vendor_is() to fold into constants, expand Kconfig
> to have the full set of vendors. Adds Hygon, Centaur, Shanghai and the
> default path.
> 
> Have Hygon depend on AMD, and Centaur+Shanghai depend on Intel.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/Kconfig.cpu         | 45 ++++++++++++++++++++++++++++++++
>  xen/arch/x86/cpu/common.c        | 17 +++++++-----
>  xen/arch/x86/include/asm/cpuid.h |  7 +++++
>  3 files changed, 62 insertions(+), 7 deletions(-)

Shouldn't patch 5 be folded into here? Or, if there were some dependencies
on patches 2-4 (albeit I can't spot anything, as the files are all self-
contained), at least the parts which can be done right away?

> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -19,4 +19,49 @@ config INTEL
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on Intel platforms.
>  
> +config HYGON
> +	bool "Support Hygon CPUs"
> +	depends on AMD
> +	default y
> +	help
> +	  Detection, tunings and quirks for Hygon platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Hygon platforms.
> +
> +
> +config CENTAUR
> +	bool "Support Centaur CPUs"
> +	depends on INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Centaur platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Centaur platforms.
> +
> +config SHANGHAI
> +	bool "Support Shanghai CPUs"
> +	depends on INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Shanghai platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Shanghai platforms.
> +
> +config UNKNOWN_CPU
> +	bool "Support unknown CPUs"

"Unknown CPUs" can be of two kinds: Such of vendors we don't explicitly support,
and such of vendors we do explicitly support, but where we aren't aware of the
particular model. This needs to be unambiguous here, perhaps by it becoming
UNKNOWN_CPU_VENDOR (and the prompt changing accordingly).

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -118,7 +118,7 @@ static void cf_check default_init(struct cpuinfo_x86 * c)
>  	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
>  }
>  
> -static const struct cpu_dev __initconst_cf_clobber __used default_cpu = {
> +static const struct cpu_dev __initconst_cf_clobber default_cpu = {

This change isn't explained in the description. __used here was introduced not
all this long ago together with __initconst_cf_clobber. Maybe this really was
a mistake, but if so it's correction should be explained.

> @@ -340,7 +340,8 @@ void __init early_cpu_init(bool verbose)
>  	*(u32 *)&c->x86_vendor_id[8] = ecx;
>  	*(u32 *)&c->x86_vendor_id[4] = edx;
>  
> -	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> +	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx) &
> +	                X86_ENABLED_VENDORS;

May I suggest the & to move ...

>  	switch (c->x86_vendor) {

... here? Yes, you panic() below, but I see no reason to store inaccurate
data when that's easy to avoid.

>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>  				  actual_cpu = intel_cpu_dev;    break;
> @@ -349,12 +350,14 @@ void __init early_cpu_init(bool verbose)
>  	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
>  	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
>  	default:
> +		if (verbose || !IS_ENABLED(CONFIG_UNKNOWN_CPU))
> +			printk(XENLOG_ERR
> +			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
> +			       c->x86_vendor_id);
> +		if (!IS_ENABLED(CONFIG_UNKNOWN_CPU))
> +			panic("Cannot run in unknown/compiled-out CPU vendor.\n");

The text reads somewhat odd to me, "run in" in particular. Also nit: No full stop
please at the end of log messages, except maybe in extraordinary situations.

Jan

