Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DEFC6D4C3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 09:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165662.1492350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLdE0-0004ga-Hp; Wed, 19 Nov 2025 08:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165662.1492350; Wed, 19 Nov 2025 08:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLdE0-0004dZ-Eh; Wed, 19 Nov 2025 08:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1165662;
 Wed, 19 Nov 2025 08:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLdDy-0004dS-JX
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 08:07:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc8efe2d-c51e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 09:07:32 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b735487129fso1027541966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 00:07:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed90c0sm1573939266b.65.2025.11.19.00.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 00:07:30 -0800 (PST)
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
X-Inumbo-ID: cc8efe2d-c51e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763539651; x=1764144451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PVx08SGiWWUV7Lhm2cQgXuUgrX4KHmWFJc6GnQW5Y5o=;
        b=eaIk0/Xthzl+Pft4tCBJspo8qPfuspRleFbjztz+DbFAMVK+Fzt8ybVLXLvFTKXmZ7
         R9rIsQ9yK98knYPxYjlrFqWishG18s6vQIb9tt8EjMzxkHXIXR1WUlXrmv6lYF5Lb5my
         jYtocC8LgFSNVE72Tsf7KKaM8CoojqEST4CWoOW6hLYhdmZ8oKeyra4JKLk+4Jo+F7Jr
         EgH4taOf86ugbUcv4sTOsUWWyuVQD8lNDAbcmmB9xA2b5zXY7fLpdO8d8e3SJm3oYfwq
         FeH5ZAZJyVjHNWW0vH3ZaW/eZDnggNC23g4x4oxXe27VuAMm0J+z/+FUPkWRc+7JQSYN
         nqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539651; x=1764144451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVx08SGiWWUV7Lhm2cQgXuUgrX4KHmWFJc6GnQW5Y5o=;
        b=MLg1mKn2Glbvag1H4s36I8uvHjW2GZqXzIiWUGXuMVDOZ556X9C+Rvq1dNj+AXJzU/
         TkswPb9cyykcoc/kqlqKMTo6SFh6094leDJp2dyIMfKfxF/sHaABBPw4ncLSudcI0epp
         C7FGSWSO8fYIPspVsQIL+5A/kKgrc6mqxKh+XoJjgqxrLxkyIhkm5LJFhe0v9dDzTYv1
         DIP1oHqfKdZQF+Tyge8pHbeChOtc7uJ45EGu9Oj4ZO3rdowTl5/j7+ePM8/RbTOg0eK7
         kxHbSSFEw0DPXB5GfrCU4eukC9z3ud9ImDT+Yhj20/1w/zvyWyiTKo4dYDatbw+rzysI
         gyrw==
X-Forwarded-Encrypted: i=1; AJvYcCXiReYXu6G0JfXWLO+j6Uo+kUEE4TzX/e5sud7LVPKuDTJ30TA/pmrA+7mvHHvFsfy93lKFq3UdYK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHQY6Btdb/rhlnv7roJXLqcHAXickLo2SmJGOaxI3gde/ud548
	jHQMAZMOwM3/2xcMcWMjeq6ugx/FuTO/ACKIAUM6MssG7DphixLMZkjxTqqi2/rhoA==
X-Gm-Gg: ASbGncvTYzutYdNIflXxwNTKvojaW2tyuF4OYzrUOCd1jvvDJnYLeQA0OARibtSTSW0
	F7ExHd5wPKQ85n7cSoC1D8E5OJl2wKFI+miFP7MPeZmRJd98vI2k/PlbHDFqdJTYU3DGXi6dNa2
	i/d6xxMClRiv83iB8JQQrtHNfp8IfcGStrmI0NTWskm6o8cVt4QHJdnXoBARwBI8gmg3mC9LWcW
	9bSXtx8n7BP3Ud72VXbHZu29ikyL+uJBaaExsQuwfSwkuMiBU6c00f33fjluzkkbUyocExB+Az7
	BMNob8vnjh+FZsLA00smPIfPRtqGLzSpBX1/ZA7i/6PEXb3DhFOImY00bnJyHN91H0EEuvqJMvd
	z8kLNNLdE6KQvGKs7TJf9C9VPQ89WUxLxVHKHeOxFL2Vdo5zmEIY1YB1gezjWYpgRyw0ZALB+5m
	5z8d6Vcc7zGpOV7M43ABWNZoSR2Crgx+DuWXH+HKjhil1rXFyAy51+R1obILHbFqMI9xGtEACC5
	3Y=
X-Google-Smtp-Source: AGHT+IErqqIW6EdFTgNsS+vQL2Lg3SPejQuoN9dpQQDsdcgTM/GfipZHIFAV0QbPQV+jwEqr1fUFEg==
X-Received: by 2002:a17:907:1c28:b0:b73:8f33:eee6 with SMTP id a640c23a62f3a-b738f4336b3mr1282484866b.23.1763539651350;
        Wed, 19 Nov 2025 00:07:31 -0800 (PST)
Message-ID: <a4575711-01e3-4fbf-a78e-9997b0c4df3b@suse.com>
Date: Wed, 19 Nov 2025 09:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] x86/cpufreq: use host CPU policy in HWP driver
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
 <b57c2fc2-d302-464d-aaf3-552da0114bb2@citrix.com>
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
In-Reply-To: <b57c2fc2-d302-464d-aaf3-552da0114bb2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 21:04, Andrew Cooper wrote:
> On 18/11/2025 3:09 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>> @@ -183,29 +178,25 @@ static bool __init hwp_available(void)
>>          return false;
>>      }
>>  
>> -    eax = cpuid_eax(CPUID_PM_LEAF);
>> -
>>      hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
>> -                !!(eax & CPUID6_EAX_HWP),
>> -                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
>> -                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
>> -                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
>> -                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
>> -                !!(eax & CPUID6_EAX_HWP_PECI));
>> +                host_cpu_policy.basic.pm.hwp,
>> +                host_cpu_policy.basic.pm.hwp_notification,
>> +                host_cpu_policy.basic.pm.hwp_activity_window,
>> +                host_cpu_policy.basic.pm.hwp_epp,
>> +                host_cpu_policy.basic.pm.hwp_plr,
>> +                host_cpu_policy.basic.pm.hwp_peci);
>>  
>> -    if ( !(eax & CPUID6_EAX_HWP) )
>> +    if ( !host_cpu_policy.basic.pm.hwp )
> 
> I think this justifies a cpu_has_hwp like we have for turbo/arat/etc. 
> Similarly for the other features.

Hmm, okay, I can do that. The difference between using boot_cpu_data vs
host_cpu_policy in cpu_has_* is completely that way, which in fact made
me uncertain even for the introduction of the APERFMPERF, ARAT, and
TURBO shorthands.

>>          return false;
>>  
>> -    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
>> +    if ( !host_cpu_policy.basic.pm.hwp_epp )
>>      {
>>          hwp_verbose("disabled: No energy/performance preference available");
>>  
>>          return false;
>>      }
>>  
>> -    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
>> -    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
>> -    feature_hdc                 = eax & CPUID6_EAX_HDC;
>> +    feature_hdc                 = host_cpu_policy.basic.pm.hdc;
> 
> Looking at how feature_hdc is used, I think it should be the bit within
> the host policy, rather than a separate boolean.
> 
> The host policy "is" what Xen is using, so if the HWP code decides it
> doesn't like HDC, then that does want reflecting.

I'm not sure about this. Yes as long as the host policy bits don't propagate
to guest policies. But if they did (and as said earlier, sooner or later we
may want / need to do that for some of the leaf 6 ones), why would the
driver's choice affect what guests get to see? (That's applicable to a fair
degree for the host policy as well: What the driver chooses doesn't need to
match Xen's global view of the world.

>> @@ -365,7 +357,7 @@ static void cf_check hwp_init_msrs(void
>>      }
>>  
>>      /* Ensure we don't generate interrupts */
>> -    if ( feature_hwp_notification )
>> +    if ( host_cpu_policy.basic.pm.hwp_notification )
>>          wrmsr_safe(MSR_HWP_INTERRUPT, 0);
> 
> Again, unrelated to the patch, but why is this a wrmsr_safe() ?
> 
> If the feature is enumerated, the MSR had better work.

Yet as we know when running virtualized ourselves, we can't always rely on
CPUID bits and MSR accessibility to be fully in sync. Yes, using in fact any
cpufreq driver is pretty meaningless when running virtualized, but we don't
prevent that scenario afaict.

> Things like this start to matter more when we consider the code
> generation for wrmsr_safe() using MSR_IMM.

Your patch from August only altered wrmsrns() iirc, hence even if we switched
to wrmsr() here there would be no difference (yet). If wrmsrns() was provably
usable in this case, wouldn't wrmsrns_safe() (yet to be invented) ultimately
be not significantly different in terms of code gen, wrt MSR_IMM? The
difference would continue to be whether there's recovery code; the recovery
code, however, isn't affected by MSR_IMM. Finally, for a purpose like the one
here (infrequently executed code), would the code size increase from trying
to use the immediate form really be justified by the to be expected perf
gain?

>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -115,14 +115,6 @@ static inline bool boot_cpu_has(unsigned
>>  }
>>  
>>  #define CPUID_PM_LEAF                                6
> 
> Doesn't this patch drop the final user?

No, there's one use left in the HWP driver.

Jan

