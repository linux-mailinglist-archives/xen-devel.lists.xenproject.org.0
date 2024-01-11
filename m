Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247C82AB7B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666090.1036536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrrX-0004OY-M0; Thu, 11 Jan 2024 10:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666090.1036536; Thu, 11 Jan 2024 10:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrrX-0004MQ-Ik; Thu, 11 Jan 2024 10:00:35 +0000
Received: by outflank-mailman (input) for mailman id 666090;
 Thu, 11 Jan 2024 10:00:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNrrW-0004MI-AA
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:00:34 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41c8c540-b068-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 11:00:32 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cca5d81826so68270691fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:00:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ck13-20020a0566383f0d00b0046e36644c0asm219131jab.142.2024.01.11.02.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 02:00:31 -0800 (PST)
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
X-Inumbo-ID: 41c8c540-b068-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704967232; x=1705572032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vPNBHdZ/MedErYugSGqIPruilwNNZ520xOVlh57NwI=;
        b=YgzL7TQkDWTNk907ubK7XW+9/axdcGahohmdQSzM/PF6TdvVSH5I348sUS9i5DxPg1
         4t5aE4Nnvps6FeXw0TeOxXVMESJ2e5yapP2tGgGFJykitCyomB+qE8ntIWFW0fk0VaO3
         do4PuGeOIWvi0y8v1ujXanArPPQHcyaIuD9yaqcmDRCnibuYS0w5Vq5YxB/TLPRuVvSS
         ILLtFqUIC1hmSYPUC2RgOfyU3trIav+ac3UKUSuEE/NWaMyht3cZv8DfEeBHLHLwAqy8
         /EzHz71XAxCXD78LCggop6pJVtgzP29QH0arG8gAJX5jR+9Fsxq5g3vL9BwNtvx6uDZH
         J6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704967232; x=1705572032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vPNBHdZ/MedErYugSGqIPruilwNNZ520xOVlh57NwI=;
        b=T1FEJGPMGQ7nOd6jgZEh2g7HOCR7DnkZyYt+FBBrkPm4oIbKGuN+tWBwcQYwMDqibR
         pr/JY4G2hdL56DyRzJpe6SLgPPqwvDUnMNFcqSYeYtvjEvntSiDcMVviOeRfyGo44swi
         /fVlDZpDiAv/7G/1BsMrP1KEPchVh7VXefEB+UOUGJrjiuyBTcmo9YOueb2eBSzh0dcF
         hSJiGso3jYHIjMZwciVDrcWLogmf9pn5CIw5NZ+r1Ojgfn4khlNEmSZpr3ZRizUj+aaW
         93RRqKkhtiI33Y9FDZSXVZa8em4LpYqXESmSGc4T5967y/GKq23uBJwEhwSnCOIfrZLa
         KmqA==
X-Gm-Message-State: AOJu0YwZpaPpwHrkVbQ1URnuG/1pttglf7WCXhJx4He2z8Md9u3fUEiT
	vF0krZYXg0D9I/54CXWIRDGZ6L5AfHPm
X-Google-Smtp-Source: AGHT+IEIxzC1pJO5vsBoy6g3AFuPoRWK27SoLeqgR/kDUboHms+3J5yuvyITsF/oE59ZIxJaTr6e6A==
X-Received: by 2002:a2e:b743:0:b0:2cc:5e44:a8ee with SMTP id k3-20020a2eb743000000b002cc5e44a8eemr231896ljo.105.1704967231729;
        Thu, 11 Jan 2024 02:00:31 -0800 (PST)
Message-ID: <d09dfd7c-a266-4c3b-ade6-c537b30b0a1d@suse.com>
Date: Thu, 11 Jan 2024 11:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240111090821.67594-1-roger.pau@citrix.com>
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
In-Reply-To: <20240111090821.67594-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 10:08, Roger Pau Monne wrote:
> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> MSR contains per-counter enable bits that is ANDed with the enable bit in the
> counter EVNTSEL MSR in order for a PMC counter to be enabled.
> 
> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> bits being set by default, but at least on some Intel Sapphire and Emerald
> Rapids this is no longer the case, and Xen reports:
> 
> Testing NMI watchdog on all CPUs: 0 40 stuck
> 
> The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> relevant enable bit in PERF_GLOBAL_CTRL not being set.
> 
> Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
> general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
> PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
>    enable all counters.
> ---
> Unsure whether printing a warning if the value of PERF_GLOBAL_CTRL is not
> correct is of any value, hence I haven't added it.
> ---
>  xen/arch/x86/cpu/intel.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index dfee64689ffe..40d3eb0e18a7 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -533,9 +533,25 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>  	init_intel_cacheinfo(c);
>  	if (c->cpuid_level > 9) {
>  		unsigned eax = cpuid_eax(10);
> +		unsigned int cnt = (uint8_t)(eax >> 8);

(Not just) since ./CODING_STYLE wants us to avoid fixed width types where
possible, personally I'd prefer "& 0xff" here.

>  		/* Check for version and the number of counters */
> -		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
> +		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
> +			uint64_t global_ctrl;
> +			unsigned int cnt_mask = (1UL << cnt) - 1;
> +
> +			/*
> +			 * On (some?) Sapphire/Emerald Rapids platforms each
> +			 * package-BSP starts with all the enable bits for the
> +			 * general-purpose PMCs cleared.  Adjust so counters
> +			 * can be enabled from EVNTSEL.
> +			 */
> +			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> +			if ((global_ctrl & cnt_mask) != cnt_mask)
> +				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
> +				       global_ctrl | cnt_mask);

Should there perhaps be a log message?

Jan

>  			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
> +		}
>  	}
>  
>  	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )


