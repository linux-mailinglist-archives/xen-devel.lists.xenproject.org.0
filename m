Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D6ADC1DC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 07:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017703.1394699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRP2C-0006yh-Py; Tue, 17 Jun 2025 05:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017703.1394699; Tue, 17 Jun 2025 05:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRP2C-0006wM-My; Tue, 17 Jun 2025 05:39:00 +0000
Received: by outflank-mailman (input) for mailman id 1017703;
 Tue, 17 Jun 2025 05:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRP2B-0006wG-B9
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 05:38:59 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce48ef3-4b3d-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 07:38:57 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54836cb7fso3580739f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 22:38:57 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f21a:fe:66b6:9dc3:86d6?
 (p200300cab711f21a00fe66b69dc386d6.dip0.t-ipconnect.de.
 [2003:ca:b711:f21a:fe:66b6:9dc3:86d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b28876sm12839951f8f.73.2025.06.16.22.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 22:38:56 -0700 (PDT)
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
X-Inumbo-ID: 5ce48ef3-4b3d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750138737; x=1750743537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+onuvzNiq176yQ8p8naS05aA5DxQlKVbmWiA5rgjdFc=;
        b=U0OJcccdzihOT5odUDvMw24DmxwpjJ8kCf69CRErepr0Zd+8YetZQbtD4Q9UknOZId
         aTIxup7rQ8+zOk5nFKV36XPgpPJ4NsIV9ESbsfb4H2ZIDZ72pfocV0bz1aE3QdAae5zt
         RC0M7tdiWxeLSNPUMlMe6ox37YmmOSCG11QZv8FASM2x5j38vsEmZj+k0ecyVH4xmnxx
         TJLIRXyPiT4o0KaLed8/XWs+cBMr/zNKs3ttGRHoKF4ldASFShkqvpnTjx7x/Jkw9r4x
         vyCPSnswo/SVQ/XMdgjTG87uBhT1RAq74QhI5zuKOuDWpij1pUPhauoVl1gA/uwQ++HD
         iofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750138737; x=1750743537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+onuvzNiq176yQ8p8naS05aA5DxQlKVbmWiA5rgjdFc=;
        b=d+zwkc7tUXN6mtMWMWjYkTgHJw/hBzMkGPp0vEBYJQmWd8Og7mMN4PR7MIHpu8GRnx
         grFbKeWdS5TVA27Juv+O3oqlWTnf1jXZaq5d2B023qVD75N3hD2oUJronGE2iwhIPwyu
         uWnJQWfOKqDr0jdymFBeHC+mRAmDRI2MCm4h61XkZZnHzw0NPFeg95NJZhdqSYwWjJUO
         GVGRRnZK+/G7GeFTd9k2ZhF9n82wLSuNYsg/mnwhzr8juCp1YFoy2bvJzdC5v5c60gxJ
         urWrl0je0YDxoXL1IlwzCsGq9h6gAu54B46nQwdcQHax+kPsIWPodKnRdmr0zBARz2Ag
         IB1g==
X-Forwarded-Encrypted: i=1; AJvYcCXKkIF2M/Y+Hx4A8l0WotezzrlA1HJeMz1ep7gexuOacTJ4FVfZW4ubdYy4S5KHZ7eSskDDpTco5YI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy14C/yYN8sENFcQRb86CE+CR+vMgdwTBCvtJz/Mwl0pMEf7dvP
	Ok8pqCkUibdqutYzoijx2EeHxbZmv4r8vtwcPHOEX2uFG1Zx3fge5BdnzeumSsX7+vWWrBlz3Wc
	hw3M=
X-Gm-Gg: ASbGncuesbwFx3oFnuYyHQ3Dj1onStYvjUIVeVwy37JgOKC7W69Kw4Fzkx/6NbSfzHm
	cH3yP5+HcJR9xoXMN18GkeCSbTmMC+xf5zOoPYa9Neu+MX3iBDnV1SErKDnMcELpr9Kg5WLRlir
	hmdVBkwD2KRArjVaOZTMun5HDzWVsMKwaCVhLZ1X3QN/Zr98nC0YG/sKmM2brN3NIyW9BsOvnhx
	qhGmAilQXdbFVuRrPytn7PpP+aP3r5+aJ/c3DE6zbd4KZJl5TfDMUWQOHrKx6X18pFlNjAmUpmA
	EDvDfCxH6SZIvgFcE7fSykdJ0Hv7PNwniFL4vRb2DmY31/mWoqSlhNKgYuNiPYZ7KeJ0iocs9ey
	WOQELO1Ph9tSnA2CXW6CIZqiO0yAvRya5VVGA9o1Nng40v2HoTdat2Yxivkdu270MPWsP/A7SQn
	ZW9ds7G7R3S0WOTEs=
X-Google-Smtp-Source: AGHT+IG/AZdb7p5o+ncvrqmpEMlCFOEwAOWO8E2d6qQkjJN6queWDIlnEyfdtgpYtRxOSnapQFFE7g==
X-Received: by 2002:a5d:5f87:0:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a572e588d7mr8747779f8f.56.1750138736735;
        Mon, 16 Jun 2025 22:38:56 -0700 (PDT)
Message-ID: <f46e847a-3f3c-41b8-837b-f904c37a5e5a@suse.com>
Date: Tue, 17 Jun 2025 07:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-5-Penny.Zheng@amd.com>
 <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
 <DM4PR12MB84518F0C8E04A57FFD71341BE173A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84518F0C8E04A57FFD71341BE173A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2025 06:18, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, June 12, 2025 12:10 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
>> propagate CPPC data
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> @@ -635,6 +641,124 @@ out:
>>>      return ret;
>>>  }
>>>
>>> +static void print_CPPC(const struct xen_processor_cppc *cppc_data) {
>>> +    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
>>> +           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
>>> +           "nominal_mhz=%uMHz, lowest_mhz=%uMHz\n",
>>> +           cppc_data->cpc.highest_perf, cppc_data->cpc.lowest_perf,
>>> +           cppc_data->cpc.nominal_perf, cppc_data->cpc.lowest_nonlinear_perf,
>>> +           cppc_data->cpc.nominal_mhz, cppc_data->cpc.lowest_mhz); }
>>> +
>>> +int set_cppc_pminfo(unsigned int acpi_id,
>>> +                    const struct xen_processor_cppc *cppc_data) {
>>> +    int ret = 0, cpuid;
>>> +    struct processor_pminfo *pm_info;
>>> +
>>> +    cpuid = get_cpu_id(acpi_id);
>>> +    if ( cpuid < 0 || !cppc_data )
>>
>> The !cppc_data part isn't really needed, is it?
> 
> I added it because set_cppc_pminfo() is an external function, and maybe we shall validate each
> input for any external functions? Or maybe not. I'm not sure if it is a MUST?

It's not. If look through code globally, it is rare that we have such checks.
Many of them are imo pointless (and thus giving bad examples). In certain
cases they're meaningful to have.

>>> +        pm_info->init = XEN_CPPC_INIT;
>>> +        ret = cpufreq_cpu_init(cpuid); #ifndef NDEBUG
>>> +        if ( ret )
>>> +            dprintk(XENLOG_WARNING,
>>> +                    "CPU %u failed to be initialized with amd-cppc mode, and users
>> could only reboot and re-define cmdline with \"cpufreq=xen\"",
>>> +                    cpuid);
>>> +#endif
>>
>> What use if the #ifdef here? The more that NDEBUG controls behavior of
>> ASSERT(), not that of (debug) logging.
> 
> Understood. Maybe I shall use one-time printk_once()

Perhaps, also considering that the action to take is relevant also in
release builds. However, "users could only" is once again odd wording for
a log message. How about "CPU%u failed amd-cppc mode init; use \"cpufreq=xen\"
instead"?

Jan

