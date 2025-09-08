Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719FB4895B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 12:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115065.1461824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYhN-000886-D1; Mon, 08 Sep 2025 10:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115065.1461824; Mon, 08 Sep 2025 10:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYhN-00085u-9H; Mon, 08 Sep 2025 10:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1115065;
 Mon, 08 Sep 2025 10:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvYhM-00085o-FP
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 10:02:08 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0110cad-8c9a-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 12:02:06 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-622b4b14a75so4413567a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 03:02:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6248711bfe8sm4680231a12.20.2025.09.08.03.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 03:02:04 -0700 (PDT)
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
X-Inumbo-ID: e0110cad-8c9a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757325725; x=1757930525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ondTFiHWY2mZVcmZM7yDM+yK/Cw/QYhytB/lqUAJTAU=;
        b=cVQRxZVEfj7/tuloCrQAgttH94F0qmPPOdX/yzMf+dA1y+MQV50orhx6bgwbjxDzNW
         D4vYHF7OF8vypRV5+tL2vDAPldnVqvvA650fnQlMexlF7IO0J8/kbxt5TEE3XcETH/ze
         a5lvUi5R280ADHSebAuL8a3oth8rYw2hwD6zFOXJ4bcZhVhoj+am6au/wN46SjI5uKwI
         hXAg2dzRyfwoS2hyPcZ3fsUY5pPMvV4R9fT6rsiNmsHjvUbDiTGks/dBhfbxNtzF56+s
         QFmk6/sL/5P+0Zk08978t/fqcjDZ2IHyIuoMhbZyPXwFgNU+y0n0Pn1qZxvFkenxJPux
         msjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325726; x=1757930526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ondTFiHWY2mZVcmZM7yDM+yK/Cw/QYhytB/lqUAJTAU=;
        b=QEfgdkeVaUSPn65FB7r5xxxoJ/Q2WpQB27mQhNK83h6UFuvKszzNts7w6RtBDQm+N1
         XzRaRSERIu0HEUY6xJKUwWuJSpEWRFMKGIR20qhB/M2X0D5jMJC+RbZO5Yd1RCRIEqjX
         F/lRRtpbOBPPy2atFbUh8SCRy6sUBWyXLFD/utvSK3xy11Ey7GnP6FDZVvH+M6erljjy
         KonMPQSNG/S0pKHQbmw6DRBqxsOiju1yvBRT46/Rx/4ciRebgofxcakg6JzVDYcSrRzF
         vthDJ9xAuoVcikrGah+mrTSROMFBoDGz5/NMLpfK+9QB+u00ohiNWvZX8RM08uO8jD+O
         AfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGJTM9WlQ77UA0pF7FfCFgTWhHPkXgsOFPTE+T1vGU8iternUMgD+gQDcoB7u+tI5CCguYfwa0w7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6TIhddWqM7AQmqO+nk+I7e01I/oiLxRntGcuEsRf/SDFrspTl
	s89adEMX56wfGGA8eKu8WuHxhM5aU6rkCrNJx9JQDoD/EDf5jS/01Ok5eZ91CB41UVJafwjP5w6
	kAA0=
X-Gm-Gg: ASbGncu099fGLBf+mIbT89wOd3ON7qYQ3CT6ni51aEMI5qCNxgta+xIPDdJCJUUw8uO
	A4LqahFDEeO5l+gOaiV5QOyJ2BUS6kbTEDvgpJ4PKc+QxIANgPe1lSCYWIjsGiuXbhvl1SWbpmj
	6X3P4rCaKgi1Z8CpKNZ1PE0nVepY4p5f28tQ2bOq9djyvTECZejBxwwYRAWm+dOdWAfDTKL6+8X
	ybbMlTbixZXqZY7VCO8X1eJoLDn31mAvB4OW5sKdaJ7xmArmF6dKadsFDkDXMSjpuqg59a/+3ge
	ZQkwKLfpuI+U7IdFiV2gbOkFTCRMCt9Rj7kr82yu7kzs1TV43iqYZRBRg905ySnjnKAatC1GAav
	EzztItrOG9CBIqrGlT3rtm1Fin/IGidkwOAcl32fAm5dAd/x0siWJavysZ5LYfHBlO7VT3VkRJG
	aLo5Xox+o=
X-Google-Smtp-Source: AGHT+IHMQ5WdwKWqvhqrXAdoHEwjg2azK0ZTvwpC3hHoLPRipxOWdTBKT7gZpxZR9druekND9xCzkg==
X-Received: by 2002:a05:6402:3514:b0:628:f072:2f18 with SMTP id 4fb4d7f45d1cf-628f07235eemr2021763a12.3.1757325725210;
        Mon, 08 Sep 2025 03:02:05 -0700 (PDT)
Message-ID: <a76aa498-512e-4797-b6d7-b7045cffa21b@suse.com>
Date: Mon, 8 Sep 2025 12:02:04 +0200
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
In-Reply-To: <DM4PR12MB8451C5D54EFEC8F6E0B76E43E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(re-adding the list)

On 05.09.2025 06:58, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, September 4, 2025 7:51 PM
>> To: Penny, Zheng <penny.zheng@amd.com>; Andryuk, Jason
>> <Jason.Andryuk@amd.com>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct cpufreq_policy{}
>>
>> On 04.09.2025 08:35, Penny Zheng wrote:
>>> For cpus sharing one cpufreq domain, cpufreq_driver.init() is only
>>> invoked on the firstcpu, so current per-CPU hwp driver data struct
>>> hwp_drv_data{} actually fails to be allocated for cpus other than the
>>> first one. There is no need to make it per-CPU.
>>> We embed struct hwp_drv_data{} into struct cpufreq_policy{}, then cpus
>>> could share the hwp driver data allocated for the firstcpu, like the
>>> way they share struct cpufreq_policy{}. We also make it a union, with
>>> "hwp", and later "amd-cppc" as a sub-struct.
>>
>> And ACPI, as per my patch (which then will need re-basing).
>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> Not quite, this really is Reported-by: as it's a bug you fix, and in turn it also wants to
>> gain a Fixes: tag. This also will need backporting.
>>
>> It would also have been nice if you had Cc-ed Jason right away, seeing that this
>> code was all written by him.
>>
>>> @@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct
>> cpufreq_policy *policy,
>>>                                         unsigned int relation)  {
>>>      unsigned int cpu = policy->cpu;
>>> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>>> +    struct hwp_drv_data *data = policy->u.hwp;
>>>      /* Zero everything to ensure reserved bits are zero... */
>>>      union hwp_request hwp_req = { .raw = 0 };
>>
>> Further down in this same function we have
>>
>>     on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
>>
>> That's similarly problematic when the CPU denoted by policy->cpu isn't online
>> anymore. (It's not quite clear whether all related issues would want fixing together,
>> or in multiple patches.)
> 
> Checking the logic in cpufreq_del_cpu(), once any processor in the
> domain gets offline, the governor will stop.

Yet with HWP and CPPC drivers being governor-less, how would that matter?

> That is to say, only all processors in the domain are online, cpufreq driver could still be effective. Which is also complies to the description in _PSD ACPI SPEC for "Num Processors" [1]:
> ```
> The number of processors belonging to the domain for this logical processor’s P-states. OSPM will not start performing power state transitions to a particular P-state until this number of processors belonging to the same domain have been detected and started.
> ```
> [1] https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html?highlight=cppc#pstatedependency-package-values
> 
> I know that AMD CPPC is obeying the _PSD dependency relation too, even if both CPPC Request register (ccd[15:0]_lthree0_core[7:0]_thread[1:0]; MSRC001_02B3) and CPPC Capability Register (_ccd[15:0]_lthree0_core[7:0]_thread[1:0]; MSRC001_02B0) is Per-thread MSR.
> I don't have the hardware to test "sharing" logic. All my platform says "HW_ALL" in _PSD.

Aiui that's not mandated by the CPU spec, though. Plus HW_ALL still doesn't say
anything about the scope/size of each domain.

Jan

