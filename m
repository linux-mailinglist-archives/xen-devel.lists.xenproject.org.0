Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67978B4889A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114950.1461734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYHs-0007Lm-Ax; Mon, 08 Sep 2025 09:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114950.1461734; Mon, 08 Sep 2025 09:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYHs-0007JK-7q; Mon, 08 Sep 2025 09:35:48 +0000
Received: by outflank-mailman (input) for mailman id 1114950;
 Mon, 08 Sep 2025 09:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvYHr-0007JA-DC
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:35:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32421f1a-8c97-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 11:35:46 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aff0775410eso745177166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:35:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04279a59ffsm1902705566b.60.2025.09.08.02.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:35:45 -0700 (PDT)
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
X-Inumbo-ID: 32421f1a-8c97-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757324145; x=1757928945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vAWbVGFOyVbyku9ekhHyfh442nJbdOdcBzWpnssbG5A=;
        b=CMdBN4J2cMPtA5cr5RqE294PS558EnKFBwcWB1ncISFVL2FWsDPNIIZi+BTC8Wxw1v
         njWw+dMIPmLuK/LGlulX4f6g7qpZqDnAoDhQgGIvUEMn/IgrowXQ+oJzY3sdWrBkn3Zr
         A+tSzbgGxBXFGuHzXoz/z96YkkFEeghpudKr0QgYxjJdv02Vp0WyMdocsA4PnnY/rzIf
         gA5fOWbZqxtr4Pq3HETDrHpgvvW4bjhXN4xMjK1ZiTbNfdI0oIZAm/yPE8p26l4SG708
         vlEuKDnyxZlfPVG9XmuhqUTZANp7yDYfIhuECia29h+tCHlXVcN0QiDGj3s92eJZjGUi
         T3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324145; x=1757928945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAWbVGFOyVbyku9ekhHyfh442nJbdOdcBzWpnssbG5A=;
        b=FPNL04PG/6tRm7C1Qknduwg59qIr8azhYygoRJLrMGh9U6SqS0eKtzyz75FF3Ckyh6
         GbX1c+OGf7JcJvvavjuupJ2136nInzv0GaQtq0ZShITQPBmHmbeiB2/fWqmP4umqMMDt
         x+RKiEenNBzv+/eYD5Jp1Ucr9rX690wi7etWroYlgCKmOzJEBb4Au/voRNEpeEIUKhUK
         FIwCnGwokQg5IPfVbmL0uhCQgFNv4Z5e6rxLLcZml/+nWWTm6lEjm7Q0ITZbm14ULrqV
         75zqsQiuynM+s9YTXEAQP5znuLcSiEtswxRZ4dJx4JswcJZUe0Rcr7GfMnPsJ/5nZFFC
         wfxA==
X-Forwarded-Encrypted: i=1; AJvYcCUvilQ6b6TRJvwoyediYzdqJ8H2qVRgzR/saXfmhct1A+5mKK9GldZgLaW49L+pp1km+EskGc1Iq4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd1fFB5r18m9FJHY0emtBz/9Usx5cTzRMH69LDox1FFOQ6wmx+
	D69MVpKp0tw2jkltj5kNaOjwK4OYyT869vlFqEq+pKfVQFtW6uOu5aLAXfTgEMQohg==
X-Gm-Gg: ASbGnctmHvV/JqDIQPbNHpQfKD8ibmJ6s7AZ6YOiz0jmkHyjQwTnfzTkFGbia4s1q92
	12F2Qxfi/rIrTpAenVSFKyJtqKJvVMfDRvMrK6tmTUy122tdBehKyLZCP1EPLXeyQWXY0YnW7U4
	ifnFgUdMfu0S8VbyaoR07TVeAKGQ/Uz7j6AkKJBW0WswgZp7j/hvUfJPTGKO/bnX4E+qpgidz/f
	bjWo4EURmogk+RPmjVM3UCLliVZJyoVurTCIgDkeNZS09AP/T6p7ocPbU31RtRiF5XqAcGlC+4f
	Gnw0gnj6KD5YDQk5fG4OflWnJPthjjrcoKF5lYxgDqSBQ0deFpOu3tIZEahg9xqGJYxeSyuANJi
	Yis/XCC/A2+UNQxKF+ElJmmdp2lS8KjPUWAxpgtMkLaPu5RlYc0DTi63qJDwyFf7/HR/S0LL8nF
	S26mYComM=
X-Google-Smtp-Source: AGHT+IGTuMXtVjPISB1s7aGMxTgzZ489AnseGOsTbQpR3w/49IpmHYrsZYszaZZLrBSOa4FZz7dJBg==
X-Received: by 2002:a17:907:3f92:b0:afe:d4b0:c0bf with SMTP id a640c23a62f3a-b04931f4c34mr1289895866b.17.1757324145337;
        Mon, 08 Sep 2025 02:35:45 -0700 (PDT)
Message-ID: <ca5f1389-8d8f-4490-a476-462ffb8aa212@suse.com>
Date: Mon, 8 Sep 2025 11:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-2-Penny.Zheng@amd.com>
 <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
 <ea021d1d-1e53-48cb-8957-f83313c2f8f3@amd.com>
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
In-Reply-To: <ea021d1d-1e53-48cb-8957-f83313c2f8f3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 20:53, Jason Andryuk wrote:
> On 2025-09-04 07:50, Jan Beulich wrote:
>> On 04.09.2025 08:35, Penny Zheng wrote:
>>> @@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
>>>                                          unsigned int relation)
>>>   {
>>>       unsigned int cpu = policy->cpu;
>>> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>>> +    struct hwp_drv_data *data = policy->u.hwp;
>>>       /* Zero everything to ensure reserved bits are zero... */
>>>       union hwp_request hwp_req = { .raw = 0 };
>>
>> Further down in this same function we have
>>
>>      on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
>>
>> That's similarly problematic when the CPU denoted by policy->cpu isn't
>> online anymore. (It's not quite clear whether all related issues would
>> want fixing together, or in multiple patches.)
>>
>>> @@ -350,7 +349,7 @@ static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
>>>   static void cf_check hwp_init_msrs(void *info)
>>>   {
>>>       struct cpufreq_policy *policy = info;
>>> -    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
>>> +    struct hwp_drv_data *data = policy->u.hwp;
>>>       uint64_t val;
>>>   
>>>       /*
>>> @@ -426,15 +425,14 @@ static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
>>>   
>>>       policy->governor = &cpufreq_gov_hwp;
>>>   
>>> -    per_cpu(hwp_drv_data, cpu) = data;
>>> +    policy->u.hwp = data;
>>>   
>>>       on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
>>
>> If multiple CPUs are in a domain, not all of them will make it here. By
>> implication the MSRs accessed by hwp_init_msrs() would need to have wider
>> than thread scope. The SDM, afaics, says nothing either way in this regard
>> in the Architectural MSRs section. Later model-specific tables have some
>> data.
> 
> When I wrote the HWP driver, I expected there to be per-cpu 
> hwp_drv_data.  policy->cpu looked like the correct way to identify each 
> CPU.  I was unaware of the idea of cpufreq_domains, and didn't intend 
> there to be any sharing.
> 
>> Which gets me back to my original question: Is "sharing" actually possible
>> for HWP? Note further how there are both HWP_REQUEST and HWP_REQUEST_PKG
>> MSRs, for example. Which one is (to be) used looks to be controlled by
>> HWP_CTL.PKG_CTL_POLARITY.
> 
> I was aware of the Package Level MSRs, but chose not to support them. 
> Topology information didn't seem readily available to the driver, and 
> using non-Package Level MSRs is needed for backwards compatibility anyway.
> 
> I don't have access to an HWP system, so I cannot check if processors 
> share a domain.  I'd feel a little silly if I only ever wrote to CPU 0 :/
> 
> I have no proof, but I want to say that at some point I had debug 
> statements and saw hwp_cpufreq_target() called for each CPU.
> 
> Maybe forcing hw_all=1 in cpufreq_add_cpu()/cpufreq_del_cpu() would 
> ensure per-cpu policies?

No, domain info is handed to us from ACPI (_PSD). That's what
cpufreq_add_cpu() evaluates. Therefore if there was evidence that HWP (and
CPPC) can only ever have single-CPU domains, we could refuse such _PSD
being handed to us (ideally already in set_px_pminfo()). But I don't think
we can just go and override what we were told. I fear though that the mere
existence of a package-level (alternative) MSR suggests that such
configurations might be possible.

Jan

