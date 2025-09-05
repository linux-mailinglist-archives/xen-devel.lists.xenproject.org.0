Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23FB44E32
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 08:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111310.1460052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQBj-00085o-3V; Fri, 05 Sep 2025 06:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111310.1460052; Fri, 05 Sep 2025 06:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQBj-00083I-03; Fri, 05 Sep 2025 06:44:47 +0000
Received: by outflank-mailman (input) for mailman id 1111310;
 Fri, 05 Sep 2025 06:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuQBh-00083C-Iq
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 06:44:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce3433e0-8a23-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 08:44:44 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b047f28a83dso259910166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 23:44:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0307435422sm1501587866b.78.2025.09.04.23.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 23:44:42 -0700 (PDT)
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
X-Inumbo-ID: ce3433e0-8a23-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757054683; x=1757659483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ6NgGmyUr4WcOILQVxU1LZax48OJGEDQdBZLekTbPE=;
        b=DFg1Q9i4+jUNuG8RObQQmSBCcyymlhfcz7+nl4PtYiOXU6AiVnQBAo+YJa8/QyMABs
         jYdMt4Ls7/CWtresViuL66v9a9BKaysOtMlTu8RvnRgiiLUViC8F67YGcuF6osYO8r+1
         Ghe8L+F/wqU6t7KJrfgk55TYuW8MeN/AVVc9NVsqxZ5HFSIfiI3I3hwTuxhQVvcBDo4X
         MY7YSk7qqJ9k2GSJrsQgipMQl3JGy/dW0NjpGn1xwZXGblEp1P2XLvvjriD93/BKA1Z3
         O6akn5DIhprYnvaFZp53QJc7f77O53dxBDx9BHFx2pjNXpVR8PYCFJGMAUZFxp7IQZf1
         YwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757054683; x=1757659483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ6NgGmyUr4WcOILQVxU1LZax48OJGEDQdBZLekTbPE=;
        b=mM4erfzZd0UFMm7plkwXb52eXv+nKNKs8yNbeaCV5lb2Ws9y8n0wvr05GzhjinYYRe
         Tt2+i6EOvJuuUuiGn0S0v/5+Q54Dwg2+GCZEFXbAmXMsyV8pf10UKaBmpN5IaAMVHBeT
         aXQiRpQ0LPX+lfffsHEKRPKrd7ASNS6YU8tUw++L2c3mk9rzxKp7IaxNOn5jsI25NBx2
         y8FonmYVO1We03xfvHEpobLi3Kgq2dJQxSYQ0uEajFIadQzJks4+AXmY26f0xkGG3R7u
         hJa9p+ddicTha94yBYB+91XzNVS3h+3go3c5JGZNN7m7KGiywo2m6gz1UKli02npTDgO
         mmlw==
X-Forwarded-Encrypted: i=1; AJvYcCUHInab91Rdqs1lJb5HKw3WZpTnA6u9xWFhUKuCKntggsr2noxSMfoDuvv3Clu7A+tWfLGUQWeI9cY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEkAKtIJ1WH9gVTWX+Jm10IOsAvDXwxDRGsXde6GCWTZwf6t4j
	pm8A13rMTzSFS9r30UNh/1Td04g8O+nCHA73qDIk1rUjwXB70FuDMFMz/hv08DbqeQ==
X-Gm-Gg: ASbGnctfCi5cxkXvn5rpq8Lc7kp6hcWeObNhGoQilcMaWOKi7gSla6nA7bPc/x/ZgF6
	yypbPw+u3/IqrkplrgjiF5hgNOsaeXjiq4lHUxO0Dzj7wciIRNPuWbLnTpsSEOdbtZtdLnqR7dH
	CRVuAEflSdrtSoAIR2k04dNKCAowgv2xHnsyJOwBJVxmuAY5AJwJpkghUm/ff/I7X7t1vObLSqX
	ua13phMd7yfAvRhAdEdmxNG4eZ36i2wurFeUKYPhfQTQZO3AiB/yEVpULTvcFqoEDFcS5+tU4zn
	9CAn3Z4iSdih0TieWrOma5gZG4TZWizbpE+j0WNZc+IK167EV8CBGVi5xCGULUVwrxr49iS7Wn5
	s/9jFB2WSoxaARBp4hNytntPZIn8yvXKLVVY1m/zAN5eVkCkQN+TkGinzp4Gah3xgEA7ux6ukBn
	Reff78WDs=
X-Google-Smtp-Source: AGHT+IGGz95khelF8gPOlY3aaf55yjJKT/GDxsHX0f1z36rfwxu6Q2P7L/Ge2w3fwErrxseHLNOPNw==
X-Received: by 2002:a17:907:7e8e:b0:b04:3402:393e with SMTP id a640c23a62f3a-b0434023f95mr1619092466b.31.1757054683051;
        Thu, 04 Sep 2025 23:44:43 -0700 (PDT)
Message-ID: <4f2ff564-e64a-4d0e-b123-d85b81f10929@suse.com>
Date: Fri, 5 Sep 2025 08:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-3-Penny.Zheng@amd.com>
 <7e769952-a906-4a3e-af27-26faa76f6dd4@suse.com>
 <DM4PR12MB84512B3A12E5185725F84BD7E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84512B3A12E5185725F84BD7E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.09.2025 07:15, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, September 4, 2025 8:04 PM
>>
>> On 04.09.2025 08:35, Penny Zheng wrote:
>>> +static void cf_check amd_cppc_write_request_msrs(void *info) {
>>> +    const struct amd_cppc_drv_data *data = info;
>>> +
>>> +    wrmsrl(MSR_AMD_CPPC_REQ, data->req.raw); }
>>> +
>>> +static void amd_cppc_write_request(unsigned int cpu,
>>> +                                   struct amd_cppc_drv_data *data,
>>> +                                   uint8_t min_perf, uint8_t des_perf,
>>> +                                   uint8_t max_perf, uint8_t epp) {
>>> +    uint64_t prev = data->req.raw;
>>> +
>>> +    data->req.min_perf = min_perf;
>>> +    data->req.max_perf = max_perf;
>>> +    data->req.des_perf = des_perf;
>>> +    data->req.epp = epp;
>>> +
>>> +    if ( prev == data->req.raw )
>>> +        return;
>>> +
>>> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs,
>>> + data, 1);
>>
>> With "cpu" coming from ...
>>
>>> +}
>>> +
>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>> +                                            unsigned int target_freq,
>>> +                                            unsigned int relation) {
>>> +    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
>>> +    uint8_t des_perf;
>>> +    int res;
>>> +
>>> +    if ( unlikely(!target_freq) )
>>> +        return 0;
>>> +
>>> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    /*
>>> +     * Having a performance level lower than the lowest nonlinear
>>> +     * performance level, such as, lowest_perf <= perf <= lowest_nonliner_perf,
>>> +     * may actually cause an efficiency penalty, So when deciding the min_perf
>>> +     * value, we prefer lowest nonlinear performance over lowest performance.
>>> +     */
>>> +    amd_cppc_write_request(policy->cpu, data,
>>> + data->caps.lowest_nonlinear_perf,
>>
>> ... here, how can this work when this particular CPU isn't online anymore?
> 
> Once any processor in the domain gets offline, the governor will stop, then .target() could not be invoked any more:
> ```
>         if ( hw_all || cpumask_weight(cpufreq_dom->map) == domain_info->num_processors )
>                 __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
> ```

I can't bring the code in line with what you say.

>>> +                           des_perf, data->caps.highest_perf,
>>> +                           /* Pre-defined BIOS value for passive mode */
>>> +                           per_cpu(epp_init, policy->cpu));
>>> +    return 0;
>>> +}
>>> +
>>> +static void cf_check amd_cppc_init_msrs(void *info) {
>>> +    struct cpufreq_policy *policy = info;
>>> +    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
>>> +    uint64_t val;
>>> +    unsigned int min_freq = 0, nominal_freq = 0, max_freq;
>>> +
>>> +    /* Package level MSR */
>>> +    rdmsrl(MSR_AMD_CPPC_ENABLE, val);
>>
>> Here you clarify the scope, yet what about ...
>>
>>> +    /*
>>> +     * Only when Enable bit is on, the hardware will calculate the processor’s
>>> +     * performance capabilities and initialize the performance level fields in
>>> +     * the CPPC capability registers.
>>> +     */
>>> +    if ( !(val & AMD_CPPC_ENABLE) )
>>> +    {
>>> +        val |= AMD_CPPC_ENABLE;
>>> +        wrmsrl(MSR_AMD_CPPC_ENABLE, val);
>>> +    }
>>> +
>>> +    rdmsrl(MSR_AMD_CPPC_CAP1, data->caps.raw);
>>
>> ... this and ...
>>
> GOV_GETAVG);
>>> +
>>> +    /* Store pre-defined BIOS value for passive mode */
>>> +    rdmsrl(MSR_AMD_CPPC_REQ, val);
>>
>> ... this?
> 
> They are all Per-thread MSR. I'll add descriptions.

If they're per-thread, coordination will be yet more difficult if any domain
had more than one thread in it. So question again: Is it perhaps disallowed
by the spec for there to be any "domain" covering more than a single thread?

>>> --- a/xen/include/acpi/cpufreq/cpufreq.h
>>> +++ b/xen/include/acpi/cpufreq/cpufreq.h
>>> @@ -63,6 +63,7 @@ struct perf_limits {  };
>>>
>>>  struct hwp_drv_data;
>>> +struct amd_cppc_drv_data;
>>>  struct cpufreq_policy {
>>>      cpumask_var_t       cpus;          /* affected CPUs */
>>>      unsigned int        shared_type;   /* ANY or ALL affected CPUs
>>> @@ -85,6 +86,9 @@ struct cpufreq_policy {
>>>      union {
>>>  #ifdef CONFIG_INTEL
>>>          struct hwp_drv_data *hwp; /* Driver data for Intel HWP */
>>> +#endif
>>> +#ifdef CONFIG_AMD
>>> +        struct amd_cppc_drv_data *amd_cppc; /* Driver data for AMD
>>> +CPPC */
>>>  #endif
>>>      } u;
>>>  };
>>
>> Same comments here as for the HWP patch.
> 
> May I ask why structure over pointer here?

Efficiency: Less allocations, and one less indirection level. For relatively
small structures you also want to consider the storage overhead of the extra
pointer.

Jan

