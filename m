Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BCAA96160
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961885.1353303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78xi-0006tc-JG; Tue, 22 Apr 2025 08:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961885.1353303; Tue, 22 Apr 2025 08:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78xi-0006rC-GZ; Tue, 22 Apr 2025 08:26:38 +0000
Received: by outflank-mailman (input) for mailman id 961885;
 Tue, 22 Apr 2025 08:26:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u78xh-0006qQ-4t
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:26:37 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80a4c982-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:26:35 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so2646907f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 01:26:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493377sm14653260f8f.62.2025.04.22.01.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:26:34 -0700 (PDT)
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
X-Inumbo-ID: 80a4c982-1f53-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745310394; x=1745915194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pD8xyaTDuAVwQBspdA9NWn5m+f5GsW0lAwhnT0jcyys=;
        b=aa6lbrbCEU9N5G2eNdw3Gxank91kDLQBuAkIkQEV9K4DJCqy4Q00++3i5Mbe+jVoPS
         0JxeIBuc4nF8Z3+0LksVzqiP4ge3HIPOpqBb1MyA6FWbBiakxbVu1kBxeNDcRk15MZJJ
         F7on27vlAHB7a3Bdu4dw4InueegoOH5+veLV/cIsG602JhelH16t8IcAtlD/gtF0NqpK
         E9OsFGoVN1VshRxrGR6RD7j2vUqF7Ln7hGdd2+UQOu7cwM014kz0n9Mo7VbIOUvBcYLg
         wAkQ53fw/DPs02cuu8nF5lnhKPoPXWF3inA/KUxGpujxP+a1K1xjxo5GSZm7eM3FalXY
         bFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310394; x=1745915194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD8xyaTDuAVwQBspdA9NWn5m+f5GsW0lAwhnT0jcyys=;
        b=SVIuhG1qwca/gdUPjxi0jYwMbFjXssuq39UJV9oSKelXHf7ze7He9CbJn4R5SPIdr1
         ogtdeD2rm/+SUMJU2jojdH/rjaBFtU+PRhRcdnJ5Vn2Ffb/PClDkrzomMbnYnoiSWOrV
         Qw0fnB4SzqZsobRcsXLXRK71Eted6tQoJFsrXLzuSAusCmX+bFp5Mbp8Y/4gynGGuvvz
         TQljldGVOVqQDWLdkjj7101yFFNGV/JMNmRoA+POHbhCGEbUPlgbVc2XazHoSfrNlmpE
         rZSYjAG3Ibg61L/PhltpGcHDJsd+Tvmy6nHBV2cTQ2qkKyxZXUT4Cgi/i1DCcIywzJKj
         rJHw==
X-Forwarded-Encrypted: i=1; AJvYcCXdNg7XjN/jWh9236bI1yfSASxxBWLq/Wg+VrHy7P/t6Hp25bhmmo0uiydJQgDh9cB/WZYkjMa7Z58=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0ldl+/i1o9CgbLFOydPfSNI/IgcuxXxsjs0urmHnVvmXRFI8+
	esUdwwCskAUU+DlKgLuYfU1BuuRRvq5q7V5EVFlsVvARtMDgP2+jplFjekVuKA==
X-Gm-Gg: ASbGncu1qWNAmK4R35ZmHMUwBmz+ZpxeDYHKtF76gLc8otkw8BLIZeFUk0G6q+ya+gb
	LpltBba8mUF531HJ8C26GKTJ5YCtBTy0GSrmeGfYS48b1QUDMgihCP7YJTNMgQ5Krw7oAZPrgwe
	Dzp77pKbpOqZzUjQadL98OjKNASaSZJvcxnQPD3P+nT3fPEy775WerdAgIFLZendAojpC27bNll
	i4xSvNGkGg3X3NuzeaMKDsnOd1vhbo2pyGOQCGq7dhPLxEkWeQCpWou+KaocGxoPRpUwWLlJqpL
	qEVIrUUm3oPdMmjsnJo+tR6mpIrZy+cnK6CoFQTZzUwP5OsDf9TZt5BHmmReg9SOm3HEajWXVoS
	647nYIE435b6ORjw9NcXHH72b8A==
X-Google-Smtp-Source: AGHT+IEb3OADhD6mIWq982GtKFHXw5KBG9aPqit0VSqs1uARfcyVzwJGRu9MpUZw6skxIurSQNYEWA==
X-Received: by 2002:a05:6000:2506:b0:39c:1ef6:4364 with SMTP id ffacd0b85a97d-39efba47496mr11370765f8f.14.1745310394536;
        Tue, 22 Apr 2025 01:26:34 -0700 (PDT)
Message-ID: <463cd02d-febc-4878-90b5-9272f91b9033@suse.com>
Date: Tue, 22 Apr 2025 10:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250417161913.14661-1-roger.pau@citrix.com>
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
In-Reply-To: <20250417161913.14661-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 18:19, Roger Pau Monne wrote:
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -441,8 +441,14 @@ void cpuidle_wakeup_mwait(cpumask_t *mask)
>      cpumask_andnot(mask, mask, &target);
>  }
>  
> +/* Force sending of a wakeup IPI regardless of mwait usage. */
> +bool force_mwait_ipi_wakeup __read_mostly;

Nit: Annotation between type and identifier, please.

> @@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
>      }
>  }
>  
> +/*
> + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
> + * processor to wait in a sleep state until a store to the armed address range
> + * occurs. Due to this erratum, stores to the armed address range may not
> + * trigger MWAIT to resume execution.
> + *
> + * ICX143: Under complex microarchitectural conditions, a monitor that is armed
> + * with the MWAIT instruction may not be triggered, leading to a processor
> + * hang.
> + *
> + * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.

I didn't manage to spot all three spec updates; none of these have a ucode fix,
hence permitting the workaround to be avoided?

Since CPX is 3rd Gen Xeon Scalable just like ICX is, I'm surprised that one's
unaffected. The most recent spec update there is a year old than ICX'es, so
may simply be too old to include the erratum?

Sunny Cove is used by further Icelake models - they're known to be unaffected?

> + * Force the sending of an IPI in those cases.
> + */
> +static void probe_mwait_errata(void)
> +{
> +    static const struct x86_cpu_id models[] = {
> +        /* Apollo Lake */
> +        INTEL_FAM6_MODEL(0x5C),
> +        /* Ice Lake */
> +        INTEL_FAM6_MODEL(0x6A),
> +        INTEL_FAM6_MODEL(0x6C),
> +        /* Lunar Lake */
> +        INTEL_FAM6_MODEL(0xBD),

Use identifiers from intel-family.h here?

> +        { }
> +    };
> +#undef INTEL_FAM6_MODEL
> +
> +    if ( boot_cpu_has(X86_FEATURE_MONITOR) && !force_mwait_ipi_wakeup &&
> +         x86_match_cpu(models) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Forcing IPI MWAIT wakeup due to CPU erratum\n");
> +        force_mwait_ipi_wakeup = true;
> +    }
> +}

Do we really need to cater for asymmetric systems? IOW can't we do this once
on the BSP? Otherwise - why the use of boot_cpu_has() here? Oh, wait ...

> @@ -406,6 +443,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
>  
>  	probe_c3_errata(c);
> +	if (c == &boot_cpu_data)
> +		probe_mwait_errata();
>  }

..., you do this for the BSP only. Then why's the function not __init and
the global variable not __ro_after_init (and models[] __initconst)?

(Later) Except that this path is also taken for S3 resume, from
recheck_cpu_features(). This shouldn't alter the variable value anymore,
though. A disagreement ought to result in recheck_cpu_features() to
report failure. (Imo perhaps better to avoid the call above during resume.)

Jan

