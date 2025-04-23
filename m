Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03754A98476
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964234.1355084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Vv7-0002mu-KX; Wed, 23 Apr 2025 08:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964234.1355084; Wed, 23 Apr 2025 08:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Vv7-0002kX-HX; Wed, 23 Apr 2025 08:57:29 +0000
Received: by outflank-mailman (input) for mailman id 964234;
 Wed, 23 Apr 2025 08:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Vv6-0002kQ-5x
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:57:28 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae6e0c7-2020-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 10:57:27 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so3233421f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:57:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39f069df9fcsm12811759f8f.16.2025.04.23.01.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:57:25 -0700 (PDT)
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
X-Inumbo-ID: fae6e0c7-2020-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745398646; x=1746003446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dY6sI1kfD+bgQVJ9TFVem7ucYgEopEx44l7CgXAfIfc=;
        b=XVTYTLvg+JmOeXGlpUOfuJLr5WAcPTWEJnazvS48ljRx/GHTicEBdkTSfqdee+/fG1
         dpDcHmj4QEUMGvC54wLX1+h38mWcm3RLtvE1YvTiNRPnn0YZhQCgQZJpKn6CkYD0N3iF
         HP+opHI4Zz0A1RxNCtBmg6wNBgT4PICFi5oZADwJfDj//ao/F8wPXG/50+F4Idzl/SXV
         Z6R5gdgFkZOG0NCHqhw1IGJsFqz5IwFADFjiab8AjuTvKu0XS9xKjKHRZCSS2iXL5p2U
         DZ7hewhUjMbgEX1wczyiWFrNmgz5TUpwEAL6VMGbQ26x00jZJb7q4pLIDHbWWkVNngx7
         V9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398646; x=1746003446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY6sI1kfD+bgQVJ9TFVem7ucYgEopEx44l7CgXAfIfc=;
        b=uPG2Qa008fx2BDW+DLnVL60FTxSVCwqFaxnIWkIJSmk0lmrgA0LFb/dC90yuNW2CNw
         ci+tlJzH4u/ITNSG/tf3LelR0kUP6faTAHCq6Dj9kjnbsJMC8U9G1ZF7uAAsrx4jKzUJ
         1OF0pA234XtvQRAAlhFssGYKzONH3tJ9FjFEKjHr5ji/v0hSPo9JPKjXAEJs5u4f9iEE
         SV6OFzSwJKtzT70IjxWvKbWqBQ/aZZyx08qWRNxP/UVb9HuCx5cAnGHBEwBevMEnCH6v
         TDhUtA8dYuX4CsiJtC8pp6B5X07PD6kzsduxVMRokbtUzGMozxC7rooaX4LRrQnanWKi
         A6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfn4Dy20MiD0kIa3UzL9sMYcg1V6a3C55GvBh8AZDESmMLYVyVGVivjuHiFqzinXqDWbiEf4xrAGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweO5XsTBjW7EvA1dKnTneIC72sLFk0zZ09YHsgsRYMvsfYOrC5
	mmVF+USx72FRz4SRHZoX3RyzoNAmfP/dQxDCKmOf988IMprsSGWJFiQP9Ys9bY916Usp+02aL2I
	=
X-Gm-Gg: ASbGncuqmgfBbrAmqZpPqlLpoB0uCZPZUzvEyW0Zqmmz43VkMhqhhUrBNZdECC5PQB6
	vWydYXMv2rMCENZKlQrpu8GLD53zYJIjjbofEmcP1jhrVLSl6hq+PoHdb2Pa6jQi9E4UwBwU3yo
	PrvLDJg0f8rjyrJ8BR0/J9/nj2zBWvW7O05DpS3rpjxC6aYUadPQeRir/+g6ItdtNUZIE4SLGB6
	TVJFgULpfQ05e02V1kP6WULiamKD77C9DWDdcGZACHoV0dSt9RGQtnoJ+WNaqTgYLjDbRcOc5Lg
	La+715u8PPvgGaXpEkfxyeVXixgUquY/8nxAaccW5A250yUvJizn6r87vUoFSKl1SN2VCX+Gw5Y
	IIyra2HKc7wSeS2ak1OyjN3IxTg==
X-Google-Smtp-Source: AGHT+IEiZdZF+jALvaCxg9Uy3GSsIzUZGBi6I9mboqb3H+CbMZRDWSFyTdvfBNnvIWZItEjr34LLIQ==
X-Received: by 2002:a5d:5f54:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39efba4ad94mr14654862f8f.16.1745398646259;
        Wed, 23 Apr 2025 01:57:26 -0700 (PDT)
Message-ID: <2de9f9a8-a785-445b-9ca3-97c6ba7285d6@suse.com>
Date: Wed, 23 Apr 2025 10:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250417161913.14661-1-roger.pau@citrix.com>
 <463cd02d-febc-4878-90b5-9272f91b9033@suse.com>
 <aAioMDTUgjn3MJS2@macbook.lan>
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
In-Reply-To: <aAioMDTUgjn3MJS2@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 10:45, Roger Pau Monné wrote:
> On Tue, Apr 22, 2025 at 10:26:37AM +0200, Jan Beulich wrote:
>> On 17.04.2025 18:19, Roger Pau Monne wrote:
>>> @@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
>>>      }
>>>  }
>>>  
>>> +/*
>>> + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
>>> + * processor to wait in a sleep state until a store to the armed address range
>>> + * occurs. Due to this erratum, stores to the armed address range may not
>>> + * trigger MWAIT to resume execution.
>>> + *
>>> + * ICX143: Under complex microarchitectural conditions, a monitor that is armed
>>> + * with the MWAIT instruction may not be triggered, leading to a processor
>>> + * hang.
>>> + *
>>> + * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
>>
>> I didn't manage to spot all three spec updates; none of these have a ucode fix,
>> hence permitting the workaround to be avoided?
>>
>> Since CPX is 3rd Gen Xeon Scalable just like ICX is, I'm surprised that one's
>> unaffected. The most recent spec update there is a year old than ICX'es, so
>> may simply be too old to include the erratum?
>>
>> Sunny Cove is used by further Icelake models - they're known to be unaffected?
> 
> FWIW, client IceLake also seems to be unaffected, so I don't really
> know.  So far I've only found this issue in the ICX spec update.  The
> fix for Linux limits this further to model 106 only.
> 
>>> + * Force the sending of an IPI in those cases.
>>> + */
>>> +static void probe_mwait_errata(void)
>>> +{
>>> +    static const struct x86_cpu_id models[] = {
>>> +        /* Apollo Lake */
>>> +        INTEL_FAM6_MODEL(0x5C),
>>> +        /* Ice Lake */
>>> +        INTEL_FAM6_MODEL(0x6A),
>>> +        INTEL_FAM6_MODEL(0x6C),
>>> +        /* Lunar Lake */
>>> +        INTEL_FAM6_MODEL(0xBD),
>>
>> Use identifiers from intel-family.h here?
> 
> Sure.
> 
>>> +        { }
>>> +    };
>>> +#undef INTEL_FAM6_MODEL
>>> +
>>> +    if ( boot_cpu_has(X86_FEATURE_MONITOR) && !force_mwait_ipi_wakeup &&
>>> +         x86_match_cpu(models) )
>>> +    {
>>> +        printk(XENLOG_WARNING
>>> +               "Forcing IPI MWAIT wakeup due to CPU erratum\n");
>>> +        force_mwait_ipi_wakeup = true;
>>> +    }
>>> +}
>>
>> Do we really need to cater for asymmetric systems? IOW can't we do this once
>> on the BSP? Otherwise - why the use of boot_cpu_has() here? Oh, wait ...
>>
>>> @@ -406,6 +443,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>>>  		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
>>>  
>>>  	probe_c3_errata(c);
>>> +	if (c == &boot_cpu_data)
>>> +		probe_mwait_errata();
>>>  }
>>
>> ..., you do this for the BSP only. Then why's the function not __init and
>> the global variable not __ro_after_init (and models[] __initconst)?
>>
>> (Later) Except that this path is also taken for S3 resume, from
>> recheck_cpu_features(). This shouldn't alter the variable value anymore,
>> though. A disagreement ought to result in recheck_cpu_features() to
>> report failure. (Imo perhaps better to avoid the call above during resume.)
> 
> I did consider to limit the call based on system_state, wasn't sure
> whether that would be more churn than help.

The fundamental expectation is that such aspects don't changes across
S3. I'd suggest to add the extra check, but I wouldn't insist; what I'd
like to see is the variable becoming __ro_after_init, though (whichever
way this is being arranged for).

> LNL030 has a reference to: "It may be possible for the BIOS to contain
> a workaround for this erratum." so wasn't fully sure we wouldn't need
> to check for this in all cores if there's some firmware fix for it
> that Xen could identify.

Usually this means a ucode update (occasionally it may also be a chipset
config that firmware can fiddle with), in which case we wouldn't
normally (i.e. unless in critical situations) add a workaround at all.

Jan

