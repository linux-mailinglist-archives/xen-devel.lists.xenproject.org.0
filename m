Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03CA180A6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 16:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875481.1285928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taFn3-0006EJ-Gh; Tue, 21 Jan 2025 15:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875481.1285928; Tue, 21 Jan 2025 15:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taFn3-0006BP-Df; Tue, 21 Jan 2025 15:03:41 +0000
Received: by outflank-mailman (input) for mailman id 875481;
 Tue, 21 Jan 2025 15:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taFn2-00069s-0z
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 15:03:40 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e015dc32-d808-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 16:03:30 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385dece873cso3104068f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 07:03:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499884sm246831485e9.5.2025.01.21.07.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 07:03:29 -0800 (PST)
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
X-Inumbo-ID: e015dc32-d808-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737471810; x=1738076610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C0DDs/jRuXK4di6ZzkqrmzJpEB0SiMe3X2u+cZw3fJI=;
        b=Q5/crleT3MxVN/18ivf+idJMRUj1QIAvJcJOW8LseLZCIVEiXCdd7RmnzIzFSgghuX
         psrY4URVTcGHLqgjhhs4gqFKh0q9sMOAWPVslmpzN3AJ45NGAOstsGcc7BBrpETyF84n
         Ty8U23An4zLCE6OQgWCZW4qJfEi29yc86yJPmDd69xTR1JhjpR/KF1PCrQBCYI46jJdZ
         Kl4UalYDRZI9JtBCuuICpvEBy/8FQnsMGycs8elt4AzxEC83TkCUOXILG51rOo+jkZ4S
         9ljtpAJohH/GON93Pli0Lk6JhGN4DOmddxhyCuuiqd5YsOB8qtuNy0kg/YgC3sc08BpH
         KjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471810; x=1738076610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0DDs/jRuXK4di6ZzkqrmzJpEB0SiMe3X2u+cZw3fJI=;
        b=ILSL0913lmpuNx239O1ogSdiNUamREyjSgXkSr97SpZeMy1Z9VeXlx1Hg4xgJ1vXbb
         8p6vJaID7+ZLv346MIWNz9T3WmR+Yv2iXQLwl4Ay+6Ni/QvSPwsV70giVgV+8fQq32Gt
         1PsbHFpLN7JvBS2Xbwrlk/43jgJt8+NcbLz7jLzm1ik4E6kS3NbuIL02Yq+HroAiny5D
         3hlmDvR1VuNCZbjE6TyZ8wE7w91ABVtU8bq3XcnbzHB/TI0Vt1lXeiu4ucfbR6NUyqKw
         BUXIsVGzfjSyP8/vBQkG1Epq9W1PhboRkVJs7eXDR5UGkWk20/BVRzhrE3WdjpJZVLDY
         LBvw==
X-Forwarded-Encrypted: i=1; AJvYcCW/8oIH9oTKCOBDaVqEV8iUj7BOQk3Bi64VyTfPD38mqOlSzSN6STGP8+iA8Dr8/a4MdFrnT1yHf6o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr+BbIBytI7ciWmEfBgDSQh7x30GydaYvs1HB+3zm5WMXvT5DW
	QSXKSXd1SsPOO1omxlO3O0chbXBCkViNOOavEvWngJllgfpMmqzUiA+RA1CUfg==
X-Gm-Gg: ASbGncu5Lb240LhRUxpRPKi2T1okhsoPkor5gbZZH4yCMXJh5Xa1GnvK8hXzczF/R4I
	ij1L44EHEuu+AgCIi+uq/n8hnz2yZK5ZM5kVYgyyOszFOCbj0wVsB/bRr4TznjOWA2wrwBqhFBD
	qywrGaMg17qkd5+h+vnv1SApM2rcQyQrTnx23VEo4kCQN9OsahJ0CY0uOQGLvMoV3BY8Hy65ovK
	x9aOJxAqg27i9gIcVo7YAFgEKGldrH/jo9OBTnOZbAxx/GocnVdIgS1NRA0PqiuNJqTTWKbG6kd
	zTrNqqEjmRUUZ8VqdItE/hdIOGjipy628VxNNGo062Wm9YbImCwC1PA=
X-Google-Smtp-Source: AGHT+IEjfneuXBKEtBPbxN196hAx21Z+8eC27m/+wW8+5o+QaW7o132OtJrTrAY8z45Smo+5oCUTLQ==
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38bf5656b93mr16106365f8f.8.1737471809448;
        Tue, 21 Jan 2025 07:03:29 -0800 (PST)
Message-ID: <2b36d54d-88fb-4ad4-b0e4-cfa837872b14@suse.com>
Date: Tue, 21 Jan 2025 16:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jonathan Katz <jonathan.katz@aptar.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250121142510.358996-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 15:25, Andrew Cooper wrote:
> Logic using performance counters needs to look at
> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
> 
> When virtualised under ESX, Xen dies with a #GP fault trying to read
> MSR_CORE_PERF_GLOBAL_CTRL.
> 
> Factor this logic out into a separate function (it's already too squashed to
> the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.
> 
> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
> consumer of this flag) cross-checks too.
> 
> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
> Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Untested, but this is the same pattern used by oprofile and watchdog setup.

Wow, in the oprofile case with pretty bad open-coding.

> I've intentionally stopped using Intel style.  This file is already mixed (as
> visible even in context), and it doesn't remotely resemble it's Linux origin
> any more.

I guess you mean s/Intel/Linux/ here? (Yes, I'm entirely fine with using Xen
style there.)

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>      printk("%u MHz\n", (factor * max_ratio + 50) / 100);
>  }
>  
> +static void init_intel_perf(struct cpuinfo_x86 *c)
> +{
> +    uint64_t val;
> +    unsigned int eax, ver, nr_cnt;
> +
> +    if ( c->cpuid_level <= 9 ||
> +         rdmsr_safe(MSR_IA32_MISC_ENABLE, val) ||

In e.g. intel_unlock_cpuid_leaves() and early_init_intel() and in particular
also in boot/head.S we access this MSR without recovery attached. Is there a
reason rdmsr_safe() needs using here?

> +         !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
> +        return;
> +
> +    eax = cpuid_eax(10);
> +    ver = eax & 0xff;
> +    nr_cnt = (eax >> 8) & 0xff;
> +
> +    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
> +    {
> +        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
> +
> +        /*
> +         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
> +         * starts with all the enable bits for the general-purpose PMCs
> +         * cleared.  Adjust so counters can be enabled from EVNTSEL.
> +         */
> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
> +
> +        if ( (val & cnt_mask) != cnt_mask )
> +        {
> +            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
> +                   smp_processor_id(), val, val | cnt_mask);
> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
> +        }
> +    }
> +
> +    __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);

This moved, without the description suggesting the move is intentional.
It did live at the end of the earlier scope before, ...

> +}
> +
>  static void cf_check init_intel(struct cpuinfo_x86 *c)
>  {
>  	/* Detect the extended topology information if available */
>  	detect_extended_topology(c);
>  
>  	init_intel_cacheinfo(c);
> -	if (c->cpuid_level > 9) {
> -		unsigned eax = cpuid_eax(10);
> -		unsigned int cnt = (eax >> 8) & 0xff;
> -
> -		/* Check for version and the number of counters */
> -		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
> -			uint64_t global_ctrl;
> -			unsigned int cnt_mask = (1UL << cnt) - 1;
> -
> -			/*
> -			 * On (some?) Sapphire/Emerald Rapids platforms each
> -			 * package-BSP starts with all the enable bits for the
> -			 * general-purpose PMCs cleared.  Adjust so counters
> -			 * can be enabled from EVNTSEL.
> -			 */
> -			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> -			if ((global_ctrl & cnt_mask) != cnt_mask) {
> -				printk("CPU%u: invalid PERF_GLOBAL_CTRL: %#"
> -				       PRIx64 " adjusting to %#" PRIx64 "\n",
> -				       smp_processor_id(), global_ctrl,
> -				       global_ctrl | cnt_mask);
> -				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
> -				       global_ctrl | cnt_mask);
> -			}
> -			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
> -		}
> -	}

... as can be seen here.

Jan

> +	init_intel_perf(c);
>  
>  	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )
>  	{
> 
> base-commit: c3f5d1bb40b57d467cb4051eafa86f5933ec9003


