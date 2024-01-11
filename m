Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6182AD9A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 12:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666203.1036665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtKm-0004Wr-AK; Thu, 11 Jan 2024 11:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666203.1036665; Thu, 11 Jan 2024 11:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtKm-0004UD-7d; Thu, 11 Jan 2024 11:34:52 +0000
Received: by outflank-mailman (input) for mailman id 666203;
 Thu, 11 Jan 2024 11:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNtKk-0004U6-O9
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 11:34:50 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6db6e88e-b075-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 12:34:49 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cd880ceaf2so6007361fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 03:34:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056638400700b0046e3432a5b0sm259195jai.177.2024.01.11.03.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 03:34:48 -0800 (PST)
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
X-Inumbo-ID: 6db6e88e-b075-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704972889; x=1705577689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKKOYfgvvO/YOUbxb2mUYUWTCTW+DHqnzBkun1XWuVU=;
        b=ZUIxU7CGGk8rA9CUPACPWevLcjyXKnwZHOhrvEuTp5gFUrKhFEg4zTyOxsVkTl6qZc
         FXcuhdqMG+yB1iBTHa5qoE9b+JHQ5tGCoSmqHvSeGtviWiq2BadY3mW/2ZRWPY1Q1A2R
         AmDBRxiOZp1b6y0rguuEj+GOjKubmFslnOxa/kXkdnvwRHW/qKjuFCjUR2zW5G1eUt+F
         iistpVljH7PoJAKzcwC8GYNo3ZthkEh8kJ4neGNychRY27YOfsBmEI6hiv3lLSXkn19V
         AbRud/keF3nilKYLCm4BESbr5+Viwkafj0PTN8zIQBa905lphJiljr7SeFxiCP0zPOjA
         UJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704972889; x=1705577689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKKOYfgvvO/YOUbxb2mUYUWTCTW+DHqnzBkun1XWuVU=;
        b=TmUBmExPMFI8ipBSpa9eWaw6DC1rP5XcWR4LzH61AS30zgPhhDHqXfLGrE3p9bnv6p
         eo1t1YnFSQjmfOjkqgEMLJCmd+ZhIiDJHC95o+uiXXDANiI+IcBovDTFkTs4j0s2h3iz
         FbyQ09mNYHBAp7kYPAQOEKXf4qKKJHzLREGu6jCQXMkfe2asy2XoOTPSI7P3gsWeMAMP
         qWZ857OZhqMQKt3jB6L/sIzyTErYZZuZKHiY7dSnNnykwmnDeHCFEkiMdRwcmdZXkcS2
         NVZ1csprG12NwVlT7GeBQaFLvfJ2bCtsBQY4pwn3cOpwevVwxBr/WmCC9eDJI3+8rAkr
         9iZA==
X-Gm-Message-State: AOJu0YwsrhFOsF0B91837+H/ZcntntGRwNEaQs5D5XC+QUaonYAFHO+a
	Q79TYFHB+vokcOoSHUhnymYl0KH701UjzAE70MhNGj6rNQ==
X-Google-Smtp-Source: AGHT+IEeK2utsGXC91VpFvQ6LeeRx9US3sXJ6ca8r6ZKI31XBp2lbszKFW4WRyu1mD6yyBdyw9BUqw==
X-Received: by 2002:a2e:8516:0:b0:2cc:8dda:c979 with SMTP id j22-20020a2e8516000000b002cc8ddac979mr310849lji.51.1704972888936;
        Thu, 11 Jan 2024 03:34:48 -0800 (PST)
Message-ID: <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com>
Date: Thu, 11 Jan 2024 12:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com> <ZZ_FjFa9mILtDZgv@macbook>
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
In-Reply-To: <ZZ_FjFa9mILtDZgv@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 11:40, Roger Pau Monné wrote:
> On Thu, Jan 11, 2024 at 11:11:07AM +0100, Jan Beulich wrote:
>> On 11.01.2024 10:08, Roger Pau Monne wrote:
>>> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
>>> MSR contains per-counter enable bits that is ANDed with the enable bit in the
>>> counter EVNTSEL MSR in order for a PMC counter to be enabled.
>>>
>>> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
>>> bits being set by default, but at least on some Intel Sapphire and Emerald
>>> Rapids this is no longer the case, and Xen reports:
>>>
>>> Testing NMI watchdog on all CPUs: 0 40 stuck
>>>
>>> The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
>>> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
>>> relevant enable bit in PERF_GLOBAL_CTRL not being set.
>>>
>>> Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
>>> general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
>>> PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v1:
>>>  - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
>>>    enable all counters.
>>> ---
>>> Unsure whether printing a warning if the value of PERF_GLOBAL_CTRL is not
>>> correct is of any value, hence I haven't added it.
>>> ---
>>>  xen/arch/x86/cpu/intel.c | 18 +++++++++++++++++-
>>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
>>> index dfee64689ffe..40d3eb0e18a7 100644
>>> --- a/xen/arch/x86/cpu/intel.c
>>> +++ b/xen/arch/x86/cpu/intel.c
>>> @@ -533,9 +533,25 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>>>  	init_intel_cacheinfo(c);
>>>  	if (c->cpuid_level > 9) {
>>>  		unsigned eax = cpuid_eax(10);
>>> +		unsigned int cnt = (uint8_t)(eax >> 8);
>>> +
>>>  		/* Check for version and the number of counters */
>>> -		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
>>> +		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
>>
>> I may not have looked closely enough, but I didn't find the limit of
>> 32 being stated anywhere.
> 
> Hm, my copy of the SDM vol4 states that bits 31:n are the enable bits,
> where n is CPUID.0AH: EAX[15:8].  Bits 32, 33 and 34 control the Fixed
> PMCs.
> 
>>> +			uint64_t global_ctrl;
>>> +			unsigned int cnt_mask = (1UL << cnt) - 1;
>>
>> Bits 2 + 4 * n have an additional qualification as per SDM vol 4.
> 
> Let me update my copy...
> 
> Looking at the version from December 2023, I see:
> 
> 0 EN_PMC0 If CPUID.0AH: EAX[15:8] > 0
> 1 EN_PMC1 If CPUID.0AH: EAX[15:8] > 1
> 2 EN_PMC2 If CPUID.0AH: EAX[15:8] > 2
> n EN_PMCn If CPUID.0AH: EAX[15:8] > n
> 31:n+1 Reserved.
> 
> And I'm afraid I'm not able to infer this additional qualification of
> bits 2 + 4 * n.

I'm sorry, both earlier questions were my fault, due to looking at the
table entry for the first match of PERF_GLOBAL_CTRL (i.e.
IA32_FIXED_CTR_CTRL). Still need to get used to the new table layout,
it seems.

Looking at the correct entry raises a question on cnt > 1 though, as
EN_PMC0 is defined for cnt > 0.

Jan

