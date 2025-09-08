Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64105B48C36
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 13:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115149.1461874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uva60-0005WD-Bv; Mon, 08 Sep 2025 11:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115149.1461874; Mon, 08 Sep 2025 11:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uva60-0005Tg-8v; Mon, 08 Sep 2025 11:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1115149;
 Mon, 08 Sep 2025 11:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uva5z-0005TZ-KL
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 11:31:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61a5fe1c-8ca7-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 13:31:37 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b043da5a55fso563461066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 04:31:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042fcae867sm1840918466b.58.2025.09.08.04.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 04:31:36 -0700 (PDT)
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
X-Inumbo-ID: 61a5fe1c-8ca7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757331097; x=1757935897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ChsJASznYJonQA/Njmso6wdUcVt+OwkSQTY44xwqQ8=;
        b=JcoCYlmQSQPMYH3CmTahUFsIkxNAExxD0FjQXlgd2cj7sIopSxiWyhPHCQFaPmd8DY
         ttL3h7uOB8FeRv2FRmFEGnANGQr2IFfYbYuVhCgjjq6JJXZsu6bh/NanWVTG9KE/nway
         SBEf+qJpVifFN9L7jeVAtstWJBjaMicyxqIlt3lnK5ff6HQ9IULJrqaRX4wYyZA4eD3w
         U7tVmCJo8Wly/K/fjHq9fYHVIwNPRu+G4iBFk7E6kWCni7lreIrdvFZHwJFuKxAHylE8
         93wPCZMZSwr/AenVWALEX/eJGJZQoOL7lWp48L2YAv9q7oNXhF4r7tdr76EA5v9J/pDZ
         fMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757331097; x=1757935897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ChsJASznYJonQA/Njmso6wdUcVt+OwkSQTY44xwqQ8=;
        b=p6tZQ4hcuAURYJnE/MkkYZNh9trOY+BU4AjRtun/7H0zJaUUiiTmQW9/Jyo+qdes92
         oY9mKhODBoVoPi13AgXEDcybGrwGiihc26JNfg1H+u9zL+mpksCH9ewT2/kl/sypZcqM
         eVlk4L35QBu3z86ydgRtN5iVC0G6198/Y9m+6OKypIf5cIgtnJVOdZfitNU4Xdm/yjpf
         mDP56fei4RrL6K+9kcnsVaZ/YPWKx4C5kn4k01HtxSau82GwQHUwUla5frbBSJg2fG7R
         aO5oYL62245MRNNNedvxd5vw4XfIlKi1qhtwMP4rEhMVgpbLeLKZA8JwvunB8Y3dKybn
         NMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbr/dBuLTB7JmfyjfNm/Q4vtFWygsTHMPOTsp+aqqaJGgHQ+Q9Epxuuek5nC1/imW1mqIOdBd10zQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdR7Sdu7XPUyf0ThNVHqF8tpk+MKu5txTajlt6xc0p7HMLAoYb
	8w2lBNZeDwEP6EfWyChxledN8Ebnk7m/SLvegkuei6ndiNoOUsVNo/panSysDpXPiw==
X-Gm-Gg: ASbGncspxRGRkWyGh6AU6BOCVE1Nn9ojyv7Wn0fEN+NIbfCNUn/ZoiXKMjHvz6bvDLf
	x58Fc1Wh4MTiZDJvg3Rrzr0Jh9SRrzBAy2UjEnzrjSK9rSKIhXJb91L7jCd5ycL18nzvRyfSTF+
	KcYc0IqQqxM/zKJyN0wS0DUJ/NzEEhnCIDo+eVSlf1TmKC+7zmoIG3CingbHjl7cTYDqfBQV8GR
	bLm8+CGLnV9GnPr0DJ1Zz5qb3k2I8zSBFY9dKpSiI/u5XDIuczsamOmuteYioAFlUXTxOzbjXtn
	jmOD+pHiWHCIndXKJYffPoFkDKzqeqdI6/07ZpXD4nN3QDuJu0N6+g1vb+hGDLuCMIxb9Fa81uH
	12O0yVyCqZ6MlEVg9IqIsvZP69LtZX8gS2WUe8co6UVdGn3Xvmc+6IrbRjIGHRs/i9HaRjGjQ2S
	1mFWwiOJEn7H5dqcNmQA==
X-Google-Smtp-Source: AGHT+IFSvyv1Vaz/+kqLO3e26IA45pl/JDuserIDeKkHKEi98EUgW81rOD5EZ/1Ut8Et0Pheo/WUXg==
X-Received: by 2002:a17:907:5ce:b0:afe:a6d3:b4a2 with SMTP id a640c23a62f3a-b04b13d2117mr784185566b.11.1757331096736;
        Mon, 08 Sep 2025 04:31:36 -0700 (PDT)
Message-ID: <6f70da02-c331-4332-b609-68a258d8e630@suse.com>
Date: Mon, 8 Sep 2025 13:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-2-Penny.Zheng@amd.com>
 <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
 <DM4PR12MB8451C5D54EFEC8F6E0B76E43E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a76aa498-512e-4797-b6d7-b7045cffa21b@suse.com>
 <DM4PR12MB8451B46BE82513603E1CA5B8E10CA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451B46BE82513603E1CA5B8E10CA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.09.2025 13:28, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, September 8, 2025 6:02 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Andryuk, Jason <Jason.Andryuk@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct cpufreq_policy{}
>>
>> (re-adding the list)
>>
>> On 05.09.2025 06:58, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, September 4, 2025 7:51 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>; Andryuk, Jason
>>>> <Jason.Andryuk@amd.com>
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>>>> <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
>>>> cpufreq_policy{}
>>>>
>>>> On 04.09.2025 08:35, Penny Zheng wrote:
>>>>> For cpus sharing one cpufreq domain, cpufreq_driver.init() is only
>>>>> invoked on the firstcpu, so current per-CPU hwp driver data struct
>>>>> hwp_drv_data{} actually fails to be allocated for cpus other than
>>>>> the first one. There is no need to make it per-CPU.
>>>>> We embed struct hwp_drv_data{} into struct cpufreq_policy{}, then
>>>>> cpus could share the hwp driver data allocated for the firstcpu,
>>>>> like the way they share struct cpufreq_policy{}. We also make it a
>>>>> union, with "hwp", and later "amd-cppc" as a sub-struct.
>>>>
>>>> And ACPI, as per my patch (which then will need re-basing).
>>>>
>>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Not quite, this really is Reported-by: as it's a bug you fix, and in
>>>> turn it also wants to gain a Fixes: tag. This also will need backporting.
>>>>
>>>> It would also have been nice if you had Cc-ed Jason right away,
>>>> seeing that this code was all written by him.
>>>>
>>>>> @@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct
>>>> cpufreq_policy *policy,
>>>>>                                         unsigned int relation)  {
>>>>>      unsigned int cpu = policy->cpu;
>>>>> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>>>>> +    struct hwp_drv_data *data = policy->u.hwp;
>>>>>      /* Zero everything to ensure reserved bits are zero... */
>>>>>      union hwp_request hwp_req = { .raw = 0 };
>>>>
>>>> Further down in this same function we have
>>>>
>>>>     on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
>>>>
>>>> That's similarly problematic when the CPU denoted by policy->cpu
>>>> isn't online anymore. (It's not quite clear whether all related
>>>> issues would want fixing together, or in multiple patches.)
>>>
>>> Checking the logic in cpufreq_del_cpu(), once any processor in the
>>> domain gets offline, the governor will stop.
>>
>> Yet with HWP and CPPC drivers being governor-less, how would that matter?
> 
> In CPPC passive mode, we are still relying on governor to do performance tuning.
> In CPPC active mode, yes, it is governor-less, how about we disable the CPPC-
> enable bit for the offline cpus?

Didn't you say that's a sticky bit? Plus how would this help with the issue
at hand?

Jan

