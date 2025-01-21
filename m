Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C07A1818B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 16:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875504.1285948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGdu-0005jR-NR; Tue, 21 Jan 2025 15:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875504.1285948; Tue, 21 Jan 2025 15:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGdu-0005gz-JV; Tue, 21 Jan 2025 15:58:18 +0000
Received: by outflank-mailman (input) for mailman id 875504;
 Tue, 21 Jan 2025 15:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taGdt-0005gt-Em
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 15:58:17 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86106a59-d810-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 16:58:15 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso37456685e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 07:58:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32151f1sm14006802f8f.14.2025.01.21.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 07:58:14 -0800 (PST)
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
X-Inumbo-ID: 86106a59-d810-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737475095; x=1738079895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgxlN/7GROnSqyYD26A1DB4EiWNixpT7taZWgqGGyWA=;
        b=COcJ62TMc9K1V0nruiihaQzBXCFjanYqz00LMpd8E7kWg6yAiXw4je37QD1F6TcVcM
         o0wmO8MpJXZK/0oh0TqPrICywzR1KFhxJTmTtgUbGx6itZi6UJHOtR3pJIEOaCWrGg2a
         0+Lxo0hTMYWLbNfUKwiQNiFiB/UvNxEW3OV6i607ceYE4BDn9cdM3wjeEttZ6j0Y39bC
         9Rt5TA4aJbhp32Dlclfhs99Rx0tMSY0faXMjVr4ryj13cPFYKKaOsszceiJMpLRLNX2a
         pCJKmpPo6y9PnHJ0akvFjYz2KY+hgnDl/QbagKJ7ErjFATDiz4eTu39sql7pgnGkkFYM
         TZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475095; x=1738079895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgxlN/7GROnSqyYD26A1DB4EiWNixpT7taZWgqGGyWA=;
        b=UkAfmBrNOIQPClGdTePc659MaS/AcgpkUdBFLP1IZw+YianbWMRD4EkNxM/Iqcctpx
         iwhv8XgJLeLwolGsIl0thVKV1GuDrj6WTJp6T2ENJxzoW34ms3hte1BFCqD4ZFTtDfLl
         Y51bLE0115TtGBA4OqVJBvoGAExvk6eDa89fpMc2zbL6Bz3DwucoKxolZAcPAY/25i4D
         xD0gMbfAUXFCcyUMn931BxTpw97x8Z0pICLsvaThgK9wWqJRInSp0WQWPOw3t8AOstMr
         StPhc8KcvFkXHyTHS5AErn4tBtPeFZSvLwOKNigFgG0fIQAPjjRaYm1ldvVj+9i9AO16
         ziHw==
X-Forwarded-Encrypted: i=1; AJvYcCUH5mT83OIKDSiGGgyNql3S1WHJZhagmdr71RxlT5MXWHftSP9am4kQkdnU4uItZWjY1H+Pjvtk+Ow=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs2NFWZRF3r134gua2ZCzAKBgITN6oNRNaxxFKnl6jdLBin9Dc
	Fy6G9aMianU3qQ/YO90sZMp6ryFwPjd7bv0NQ+/pl3Zl1efHB7joAZMCsm3X+w==
X-Gm-Gg: ASbGncv3aY74KEYiVCQea2OWzaWkWo3aYyc7gsiXFmqoP0wLE33+SzqetYrSRq2c/ce
	KJAySlKhveImG1g+DGZHWdR4GV6Eok7c6oz3VXNNDlffyZ1qa0OpJu4+UsC6o9l26VHqk/5uiCo
	TUvsKL8nYlBIuXeMs1ZdrkKecKI5o7VFNhzI0NQb4zs8m53Vz3zUAx5EbjGmfbxxaWHGa7w0cT+
	gq4pFWkPZTGCInrOSjAh6XaV3JPRmgXs+6g4ApLv5aA5ULAg6ktTYyrPbVFj0FIa6pcEcMOHKiW
	V3JgUNyrhpsAuJ4NcaKQcdq181+retwloAQPwd+JdJrq0kIy41+vkfw=
X-Google-Smtp-Source: AGHT+IFZApX3OS7dzZBiap5RiYUt9pHkpeyxfMPTkZ0Oq1Kuz3UzRQUgSVrTKwY9yQg5MZ/t5Mlccg==
X-Received: by 2002:a05:600c:cc8:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-438918f6027mr138981105e9.12.1737475094652;
        Tue, 21 Jan 2025 07:58:14 -0800 (PST)
Message-ID: <445f93d3-626e-40ca-9acd-db3af83be1e5@suse.com>
Date: Tue, 21 Jan 2025 16:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jonathan Katz <jonathan.katz@aptar.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <2b36d54d-88fb-4ad4-b0e4-cfa837872b14@suse.com>
 <ae54889d-ae82-4df3-a35f-ea09f3972eec@citrix.com>
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
In-Reply-To: <ae54889d-ae82-4df3-a35f-ea09f3972eec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 16:23, Andrew Cooper wrote:
> On 21/01/2025 3:03 pm, Jan Beulich wrote:
>> On 21.01.2025 15:25, Andrew Cooper wrote:
>>> Logic using performance counters needs to look at
>>> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
>>>
>>> When virtualised under ESX, Xen dies with a #GP fault trying to read
>>> MSR_CORE_PERF_GLOBAL_CTRL.
>>>
>>> Factor this logic out into a separate function (it's already too squashed to
>>> the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.
>>>
>>> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
>>> consumer of this flag) cross-checks too.
> 
> Fixes: 6bdb965178bb ("x86/intel: ensure Global Performance Counter
> Control is setup correctly")
> 
> (fixed up locally).
> 
>>> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
>>> Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> Untested, but this is the same pattern used by oprofile and watchdog setup.
>> Wow, in the oprofile case with pretty bad open-coding.
>>
>>> I've intentionally stopped using Intel style.  This file is already mixed (as
>>> visible even in context), and it doesn't remotely resemble it's Linux origin
>>> any more.
>> I guess you mean s/Intel/Linux/ here? (Yes, I'm entirely fine with using Xen
>> style there.)
> 
> Oops yes.
> 
>>
>>> --- a/xen/arch/x86/cpu/intel.c
>>> +++ b/xen/arch/x86/cpu/intel.c
>>> @@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>>>      printk("%u MHz\n", (factor * max_ratio + 50) / 100);
>>>  }
>>>  
>>> +static void init_intel_perf(struct cpuinfo_x86 *c)
>>> +{
>>> +    uint64_t val;
>>> +    unsigned int eax, ver, nr_cnt;
>>> +
>>> +    if ( c->cpuid_level <= 9 ||
>>> +         rdmsr_safe(MSR_IA32_MISC_ENABLE, val) ||
>> In e.g. intel_unlock_cpuid_leaves() and early_init_intel() and in particular
>> also in boot/head.S we access this MSR without recovery attached. Is there a
>> reason rdmsr_safe() needs using here?
> 
> Abundance of caution.  cpufreq/hwp.c uses a safe accessor.

Perhaps it (and other places) shouldn't?

> Given the regular NMI path works, I doubt we need the _safe() here.
> 
> As future work, it's accessed loads of times, so I'm highly tempted to
> have the BSP sanitise it once, and have the APs copy the "global" value.
> 
>>
>>> +         !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
>>> +        return;
>>> +
>>> +    eax = cpuid_eax(10);
>>> +    ver = eax & 0xff;
>>> +    nr_cnt = (eax >> 8) & 0xff;
>>> +
>>> +    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
>>> +    {
>>> +        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
>>> +
>>> +        /*
>>> +         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
>>> +         * starts with all the enable bits for the general-purpose PMCs
>>> +         * cleared.  Adjust so counters can be enabled from EVNTSEL.
>>> +         */
>>> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
>>> +
>>> +        if ( (val & cnt_mask) != cnt_mask )
>>> +        {
>>> +            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
>>> +                   smp_processor_id(), val, val | cnt_mask);
>>> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
>>> +        }
>>> +    }
>>> +
>>> +    __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
>> This moved, without the description suggesting the move is intentional.
>> It did live at the end of the earlier scope before, ...
> 
> Final paragraph of the commit message?
> 
> If PERF_AVAIL is clear, we don't have ARCH_PERFMON, whatever the CPUID
> leaves say.

Hmm, the final paragraph in the posting that I got in my inbox was:

"This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
 consumer of this flag) cross-checks too."

Which says quite the opposite: You now set the bit in more cases, i.e.
when nr_cnt is out of range or when ver is zero.

> OTOH, this bit really doesn't serve much value.  Given oprofile
> cross-checks everything anyway, I think it can be dropped.

Hmm, it's not entirely straightforward to see that all uses of
cpu_has_arch_perfmon can really be done away with.

Jan

