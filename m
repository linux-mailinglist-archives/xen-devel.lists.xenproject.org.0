Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05997B3DB9F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 09:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104108.1455252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszR6-0000DD-RM; Mon, 01 Sep 2025 07:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104108.1455252; Mon, 01 Sep 2025 07:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszR6-0000B9-Of; Mon, 01 Sep 2025 07:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1104108;
 Mon, 01 Sep 2025 07:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uszR4-0000B1-Jw
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 07:58:42 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79adbb7d-8709-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 09:58:41 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6188b7550c0so4794340a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 00:58:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0431832a98sm133994266b.80.2025.09.01.00.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 00:58:40 -0700 (PDT)
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
X-Inumbo-ID: 79adbb7d-8709-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756713521; x=1757318321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xdIUtIQmXUoYqJt3tM/kewKZM5sAxU84JgTSFymboaU=;
        b=Dx1+mTjp63pV5/Hw+xyBaSka7haVZKaD82WXuLrqlviDKqdYywnrqAOUmtkKA5vpoJ
         lRJQdCfgLmIGV+WnyA6pXKiA7r/mzV8vvVWFAWRpfCis0ktznqxWyJz1EdwRbyrHWi0F
         PUsTCZaj264lvcGXrWiFFyEOqFSO1gqi8dkQ/HXbO5QuoJqksJn5SvC2RkLFMr0j4RgC
         ahFFtTjbcz6+5ZQb8J9y8Wrg48o6oSMl0y45OC0q7OgbJE9G8AWjvL+rWWLjsG657Hsw
         aWZwYe04uVdgoD40z4RLQQbfpcTkzPo2x+4gAav9qGLnz5VcCnNJrorNJ8zLkXGJs0zq
         wSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713521; x=1757318321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdIUtIQmXUoYqJt3tM/kewKZM5sAxU84JgTSFymboaU=;
        b=hIe4820svqMRoMnp/BGrJ1xtePkjc2o/7oWJ+w+u5nZfzMrMakdYREhwMh+VLsq/Kb
         mh3MuZ3M35syCVSkSWWcg7EpF+kbyAQwVQ0qhur/7Jcsixw0nodiDtpf2eXU3TNf5qfP
         8RVx/t8Z5cnXnFhQYJTgWqhb1S4BGciIjIyOIOVHLVFJfxENpIM1jCH/jD48Zq0z7I7c
         ztSnfSfn5zn8K8Dil1T8ZVsJYvqPYyJjWyBh1bDJvA1k3uF+VMtFMH5ToC1FPa5TiRCo
         fZXgpJVqa4ojp6nwVR5rxvynvr8NSvNcvGZ4C3T8Ph7DBtX4LAUV90LBCxaW2PdodZiS
         OUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVef4zsXUl2oa78oDgd3IgN5TelfoIGSH6xni0eCsYGnLiI7owpg6VYkdB1nj5G1OfT5G7DEwsdWCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYd7H0l9dGqPx6MUaiYRsgQ7gYPAMMIB0kcIYHiREnLxD9AuHP
	yiCjerAHei+N6G7EZzbqDT/wqoAih/Xp/6jltRNy8isjCa92B5E2HeDOp5Y6m5ndBw==
X-Gm-Gg: ASbGncsHILW54RidZObi02YudpoXP93lfyj7Ol1YwcJY8AWnK77af42/r66Zlz/add7
	jGJC1S0JO1Xu1Pn0ozmGDSEYU94ddvKhAFuC98D4PxcCOavrs7fP6wM+S83X5DgCINHDfhHAPmY
	G0mIr4trt1/EtxbaQRBL4dd3RJo4y1G3SGLDdsCS6dfjThdefEKAOsQW5D8ancTkI0BMKJbn2x2
	Bsf5/nqK6HflXo8MgjB+hY+ZIoawHXNG1fzyaJtWFRlUIzZ07das01BjwZ0dRRXdcX7WBgJ+OKQ
	ueXiYxBJ1lIJYjbWEmhbO/ISq5BzqBv6RbVddrCWTsy7k87p+8su4iZjvV7aE1rvyPbEwg5g3mG
	B7OQLyRSeb8EeuOalNGJQUNgS6dzGEr4TuDBKD6MvyzlCTxvcNinqO9G9HKbntY7dPkAlrVgpTf
	E2CSag5Ln8gsK43MFGcgwrZ3IYHUvk
X-Google-Smtp-Source: AGHT+IF59r9hGGFlmOyLRZDcXBrdwW6KX8FBY3CnlMdkjGFOaLxEjhpzTkXEoM5O5eAI4h7QsZoLZA==
X-Received: by 2002:a17:906:9f92:b0:afe:a615:39ef with SMTP id a640c23a62f3a-b01d8a2667emr663142966b.9.1756713521006;
        Mon, 01 Sep 2025 00:58:41 -0700 (PDT)
Message-ID: <16bd9d1c-66da-4526-8489-8b075678c4bb@suse.com>
Date: Mon, 1 Sep 2025 09:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-4-Penny.Zheng@amd.com>
 <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
 <DM4PR12MB8451D6ACE480227632A8156FE13AA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <1ad85430-2aa7-4834-be56-67515ca51310@suse.com>
 <DM4PR12MB845109DC4B0822344D2DC72CE107A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845109DC4B0822344D2DC72CE107A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.09.2025 05:21, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, August 29, 2025 2:12 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org; Andryuk, Jason
>> <Jason.Andryuk@amd.com>
>> Subject: Re: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
>> passive mode
>>
>> On 29.08.2025 05:30, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, August 28, 2025 7:23 PM
>>>>
>>>> On 28.08.2025 12:03, Penny Zheng wrote:
>>>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>>>> +                                            unsigned int target_freq,
>>>>> +                                            unsigned int relation) {
>>>>> +    unsigned int cpu = policy->cpu;
>>>>> +    const struct amd_cppc_drv_data *data =
>>>>> +per_cpu(amd_cppc_drv_data, cpu);
>>>>
>>>> I fear there's a problem here that I so far overlooked. As it
>>>> happens, just yesterday I made a patch to eliminate
>>>> cpufreq_drv_data[] global. In the course of doing so it became clear
>>>> that in principle the CPU denoted by
>>>> policy->cpu can be offline. Hence its per-CPU data is also unavailable.
>>>> policy->See
>>>> cpufreq_add_cpu()'s invocation of .init() and cpufreq_del_cpu()'s
>>>> invocation of .exit(). Is there anything well-hidden (and likely
>>>> lacking some suitable
>>>> comment) which guarantees that no two CPUs (threads) will be in the
>>>> same domain? If not, I fear you simply can't use per-CPU data here.
>>>>
>>>
>>> Correct me if I understand you wrongly:
>>> No, my env is always per pcpu per cpufreq domain. So it never occurred to me
>> that cpus, other than the first one in domain, will never call .init(), and of course, no
>> per_cpu(amd_cppc_drv_data) ever gets allocated then.
>>
>> Well, the question is how domains are organized when using the CPPC driver.
>> Aiui that's still driven by data passed in by Dom0, so in turn the question is whether
>> there are any constraints on what ACPI may surface. If there are, all that may be
>> necessary is adding a check. If there aren't, ...
>>
> 
> According to ACPI spec, _PSD controls both P-state or CPPC, so in my implementation of getting CPPC data passed by Dom0(set_cppc_pminfo()), I demand both entry exist, _PSD and _CPC.
> ```
>         if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )
>         {
>                 ...
>                 pm_info->init = XEN_CPPC_INIT;
>                 ret = cpufreq_cpu_init(cpuid);
>                 ...
>         }
> ```

That's only about presence of the data though. My remark, otoh, was about its
content. It could in principle be specified somewhere that no domain may cover
more than a single CPU / thread. In the absence of such, the case needs
handling correctly.

Jan

