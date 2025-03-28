Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2732DA74589
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 09:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930281.1332927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5D5-0005OZ-64; Fri, 28 Mar 2025 08:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930281.1332927; Fri, 28 Mar 2025 08:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5D5-0005Mc-3W; Fri, 28 Mar 2025 08:37:03 +0000
Received: by outflank-mailman (input) for mailman id 930281;
 Fri, 28 Mar 2025 08:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty5D4-0005MW-32
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 08:37:02 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cef89ded-0baf-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 09:36:57 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso962560f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 01:36:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a420bsm1875222f8f.82.2025.03.28.01.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 01:36:56 -0700 (PDT)
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
X-Inumbo-ID: cef89ded-0baf-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743151016; x=1743755816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=68h2Vs4l6qq4jV/p2K0hkPSQagT8dZgWP4gbpbuWzPE=;
        b=IrmxWdekCfcfWcHZUgYIS20TzL6fXh+MOs0RIRETyBqXQimLHTKM2YzI2GyJIZx6Kp
         UKusRxE1qq5yO4G1oRho0A3x7ZvTIvwos+spOKtAxsebjCgK4t9AwFUwj1qJuE24prRH
         PFpTIkwtSfeEI3LNSsSMeyhLaUPw0Zo8tYpZtUVTEyJKhqJ64Lk2Rl8iqqvizt5XDHcn
         Gb2+C7bOo8LPdAwwbEyKcczHjwc/5bxCOqYmiUpjUdxpMHOa21IVxGZmYzszaqwWK1gU
         Tv37508PkeLC+dq6n/hcH13XoQ3UL2r20AyGzv5g/QhAIFMkkvkBF9vQGFXNpaxHPrHH
         UQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151016; x=1743755816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68h2Vs4l6qq4jV/p2K0hkPSQagT8dZgWP4gbpbuWzPE=;
        b=IsmgNWBm/kegbyc5LvqxIVFpOmK3Mpq0h8mpAiE2R4BJ3JTmw3UPaSdgehzqGzkfbf
         3egec9xtRa6uLed1LfYJlkCJi6qaF0O12Igbyp6APKKp8HddOcjIs+VzG3nkYxLBdeFV
         On5tZlrQGXOVrgEk07ED6K2doDryeOLes0SED1RPahifKBnZoIn0GUvgpx1GnQobKcp8
         9uqlivG0+539jceC9be877BZ6D08Ept9Tj3m9IP/CkZdCIQDcaQC3l+2ODVbzNGZWgH3
         eJLtP4sms/9Yteq9yybr0TlLO+3/Uyp6w1ICGjY3ct+77Sldj7VxPX1lv9af97BQRswv
         uY6A==
X-Forwarded-Encrypted: i=1; AJvYcCUR5wwaCsIuq3GpYY2i6sXxEumK1+0d8AYO6Soa/f4xaPK8Kwda9ijSTR0OCqWUuLZ7+bpMU/FuOsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/GrlAVfFkLF/My+YNDA3FqMlMx5RAvQr/4twImMTvYuVxlifK
	oSk0bh8YlkW41A2Mer7pKHtTKQLCdwysin69fT+TVYU4tLyaxQhp2BDDTSzggA==
X-Gm-Gg: ASbGncsy8mW9z9br6Xe0Oyf1H/azJpAvnVBE2xj+gMGZHFXczFHNsxIL0FN7gqDKhiP
	wZsaU4hQ2FAxmKWSsWdLtnD8g6YMpIl3MZU+P84LU5m5vUF0aRqHecUxwir3x7ALFLGDZxxvNX2
	5JlHLw1igYDMc9Rs7LPEgJT+tJkwMe4eTvsQNr0zDfXUMVZSgAy6tQ0svMgI6gsYfIA4fSsSphq
	kKrEaCHX4jDi80WjAZ3+/NOwNhpiN9ruo5rlJUZjLr7riT7KgWJFOK4Ngt5BJq1BK40X7y9sYMV
	nXEyAxwvXipKngLMtC7GzG7UG8GGGp4B7Tntpkta5wz+231uz5m3LRjmYpWhlVQIxJU6beJgYhK
	wyuFj4Vpg85SDD4xH6UZeWCE1H+NnJw==
X-Google-Smtp-Source: AGHT+IHfo0Rn+xpz00264KqNj9RI2n2BuoAnsomMrbx1QB1zfPttfFdj1u6F53XttdF9l7D8IlnfHg==
X-Received: by 2002:a5d:6488:0:b0:391:2f2f:836 with SMTP id ffacd0b85a97d-39ad174bf52mr5251457f8f.17.1743151016293;
        Fri, 28 Mar 2025 01:36:56 -0700 (PDT)
Message-ID: <016f3ba5-a3d0-4aaf-a090-abab820127ff@suse.com>
Date: Fri, 28 Mar 2025 09:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-3-Penny.Zheng@amd.com>
 <19cab53d-3edc-4900-95f1-6d5d81e0ecac@suse.com>
 <DM4PR12MB845156C8C25495D7DB396ED9E1A72@DM4PR12MB8451.namprd12.prod.outlook.com>
 <c46e1b7a-d765-421f-a7a8-9187bfb5b732@suse.com>
 <DM4PR12MB845155F64B8B08408D68CE14E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845155F64B8B08408D68CE14E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.03.2025 09:27, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, March 25, 2025 3:54 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to propagate
>> CPPC data
>>
>> On 25.03.2025 05:12, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Monday, March 24, 2025 10:28 PM
>>>>
>>>> On 06.03.2025 09:39, Penny Zheng wrote:
>>>>> +    pm_info = processor_pminfo[cpuid];
>>>>> +    /* Must already allocated in set_psd_pminfo */
>>>>> +    if ( !pm_info )
>>>>> +    {
>>>>> +        ret = -EINVAL;
>>>>> +        goto out;
>>>>> +    }
>>>>> +    pm_info->cppc_data = *cppc_data;
>>>>> +
>>>>> +    if ( cpufreq_verbose )
>>>>> +        print_CPPC(&pm_info->cppc_data);
>>>>> +
>>>>> +    pm_info->init = XEN_CPPC_INIT;
>>>>
>>>> That is - whichever Dom0 invoked last will have data recorded, and
>>>> the other effectively is discarded? I think a warning (perhaps a
>>>> one-time one) is minimally needed to diagnose the case where one type of
>> data replaces the other.
>>>>
>>>
>>> In last v2 discussion, we are discussing that either set_px_pminfo or
>>> set_cppc_pminfo shall be invoked, which means either PX data is recorded, or
>> CPPC data is recorded.
>>> Current logic is that, cpufreq cmdline logic will set the
>>> XEN_PROCESSOR_PM_PX/CPPC flag to reflect user preference, if user
>>> defines the fallback option, like "cpufreq=amd-cppc,xen", we will have both
>> XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC set in the
>> beginning.
>>> Later in cpufreq driver register logic, as only one register could be
>>> registered , if amd-cppc being registered successfully, it will clear the
>> XEN_PROCESSOR_PM_PX flag bit.
>>> But if it fails to register, fallback scheme kicks off, we will try
>>> the legacy P-states, in the mean time, clearing the
>> XEN_PROCESSOR_PM_CPPC.
>>> We are trying to make XEN_PROCESSOR_PM_PX and
>> XEN_PROCESSOR_PM_CPPC
>>> exclusive values after driver registration, which will ensure us that
>>> either set_px_pminfo or set_cppc_pminfo is taken in the runtime.
>>
>> Yet you realize that this implies Dom0 to know what configuration Xen uses, in
>> order to know which data to upload. The best approach might be to have
>> Dom0 upload all data it has, with us merely ignoring what we can't make use of.
> 
> PLZ correct me if I understand you wrongly:
> Right now, I was letting DOM0 upload all data it has, and in the Xen:
> ```
>     case XEN_PM_CPPC:
>         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
>         {
>             ret = -EOPNOTSUPPED;
>             break;
>         }
>         ret = set_cppc_pminfo(op->u.set_pminfo.id,
>                               &op->u.set_pminfo.u.cppc_data);
>         break;
> 
>     case XEN_PM_PX:
>         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
>         {
>             ret = -EOPNOTSUPPED;
>             break;
>         }
>         ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
>         break;
> ```
> I relied on flag XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX to choose which
> info we shall record.
> Firstly, we shall not return -EOPNOTSUPPED error above there.

Yes.

>> The order of uploading (CPPC first or CPPC last) shouldn't matter. Then (and only
>> then, and - ftaod - only when uploading of the "wrong" kind of data doesn't result in
>> an error) things can go without warning.
> 
> Then in
> ```
>     pm_info->init = XEN_CPPC_INIT;
>     ret = cpufreq_cpu_init(cpuid);
> ```
> We shall add warning here to clarify no fallback scheme to replace now, when ret is not zero.

Maybe. In the earlier reply I said with certain conditions fulfilled a warning
may not be necessary. Yet perhaps initially having a warning there (maybe just
for debug builds) may make sense.

Jan

