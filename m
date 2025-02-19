Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B287BA3B7A1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 10:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892499.1301467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgC8-0006HH-Rw; Wed, 19 Feb 2025 09:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892499.1301467; Wed, 19 Feb 2025 09:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgC8-0006F9-PB; Wed, 19 Feb 2025 09:16:40 +0000
Received: by outflank-mailman (input) for mailman id 892499;
 Wed, 19 Feb 2025 09:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkgC6-0006F3-V7
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 09:16:38 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38db463a-eea2-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 10:16:37 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-abb75200275so559190266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 01:16:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5323226asm1228060966b.8.2025.02.19.01.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 01:16:37 -0800 (PST)
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
X-Inumbo-ID: 38db463a-eea2-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739956597; x=1740561397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JmODnbeYy+q8jVPFtasIyfmZu4/Xj3K6TL63o5ksCuo=;
        b=PwyTL0tX+T65jW/8somALKNEwcjmk205QX1t49ksHWvi15fZ5bqUMKhxoxwG2Pas5G
         hZcEwhjS2WrWkKZLSWzaQ8IroMCnZLF0jrc55U7ybrr86y05GkpLQQykbalncb3Eslsv
         4PuXm9R8YSvkK6Az1BoY+DBrQNEuBPOSKh6gKMXXm9LEGKkCIarKHXRoq8OFbLu5jDPw
         2CkBglkQtXLKJn6WQN/y82J/DCZWSGAL3IqRjqw21jt9OQN/jjxOOC7ZhiD/Oxrm+QEv
         BItHSzNkN3h78dLp9Oa1EV4wymr19IrD9L5wNirthrDQbTw1RGoC3WZQe2HofqQ/WGhx
         EouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956597; x=1740561397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmODnbeYy+q8jVPFtasIyfmZu4/Xj3K6TL63o5ksCuo=;
        b=C5IHptIg22wLT8x9YORsvIk9+i6X/jT95NG8MOh/4bI06RAaXT+y8AwWX+VffDKWKV
         dx9z9R6nmX6qtZgxtVudZ3VT9bhwyehllVdLYZ6+auwZIXCjehQm+nZ8pn8BGfW/Elz+
         ovNAhWilOhtJC30fRpYee//yzR2/k67jPp/DyR+Wne5OjQTMAODelaYRSXjhEkis1KeQ
         2Q/2BQuKWgWPGsRM1ogk3DubSKRpPzh8gOUSOJVGtZCj3dqShg2Obqt5YoGOf/ENR4Gu
         FCLWothIc613/uvQCBnVhTR1oKh2a7EXIxbC9hq8pdtgdv9HmUeuIjCMPdTjyIcOL1jP
         z+6A==
X-Forwarded-Encrypted: i=1; AJvYcCVMmG0fZjnujZC9bKWFRxt2oShMZsUtNJBcy8fsjcRNlJuNm00O+0toTcIuIbfmfGy3wvaR2DJ077Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMJsxccT/hyUW8TolzKLmOOZRt8AWqakhrf4/y5/bh50xXo6At
	eCSRXSGqbR33F024OjjjL0xVHMJAp2VJfG+b6Zy2DLmloyuHdD+pToxnWd+FCA==
X-Gm-Gg: ASbGnctleHAXVY5D1AsATrnTlLUPECyjbCxNuXnmIzfpwXg7ABSEXzMdx1PwdJnQARs
	aPvuHlEwodllilrwCd2SMA4xx8/8/yY9L68AMxUVRDE8MZM5+EmB3VKlnd/bsm1N70p3N+XgyN8
	9B+FOI1431TQ3gDAE9R1XmoL19vpbjZ22Nw4aKQIjXqC0t6oFIyll1rmpHfK8os8m/Wk43ADOCW
	nMN46RN38NqoBpscaF4zntZ7hgyZ3xQ7GNaCp+TtPE+Sn8wsUFusQVpKozqt5X5l0zHqaZVXgZC
	Qja3bOKCFsHI1FzNjB+C2ncmT+UfPT7W541oj9OGedoE3nx3fQjbrEh8yWN7Bh6g2llLEnonLo8
	R
X-Google-Smtp-Source: AGHT+IHNAt+E3wKNV9LQtTTDFMcPMkTXVuZkSzOTWKULPf9ixM+cgSjZavw+7/34eeggejl/hPMlEw==
X-Received: by 2002:a17:906:3091:b0:ab7:b5d9:525a with SMTP id a640c23a62f3a-abb70de28bcmr1530900066b.37.1739956597279;
        Wed, 19 Feb 2025 01:16:37 -0800 (PST)
Message-ID: <988c2baa-4c18-4f50-955a-500f75b6d7c0@suse.com>
Date: Wed, 19 Feb 2025 10:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-3-Penny.Zheng@amd.com>
 <d3198e8c-2723-484c-b305-822a681d544b@suse.com>
 <DM4PR12MB8451A5DC8E389ECA2D8A3E1AE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <7a0d4cab-188d-41de-ac32-b307109cb0dc@suse.com>
 <DM4PR12MB8451E14BD7539A3A2C565C0DE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <8a5071fc-7948-43aa-82e1-9dde9b0fcc24@suse.com>
 <DM4PR12MB8451F9B2CDFB20783A3B78E7E1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451F9B2CDFB20783A3B78E7E1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 09:36, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, February 18, 2025 10:49 PM
>>
>> On 18.02.2025 07:05, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Monday, February 17, 2025 3:39 PM
>>>>
>>>> On 17.02.2025 08:20, Penny, Zheng wrote:
>>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>
>>>> Btw, boiler plates like this aren't really liked on public mailing
>>>> lists, for being contrary to the purpose of such lists.
>>
>> You did read this, didn't you? I ask because the same boilerplate keeps appearing in
>> your mails.
>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Tuesday, February 11, 2025 7:10 PM
>>>>>>
>>>>>> On 06.02.2025 09:32, Penny Zheng wrote:
>>>>>>> +{
>>>>>>> +    int ret = 0, cpuid;
>>>>>>> +    struct processor_pminfo *pm_info;
>>>>>>> +
>>>>>>> +    cpuid = get_cpu_id(acpi_id);
>>>>>>> +    if ( cpuid < 0 || !cppc_data )
>>>>>>> +    {
>>>>>>> +        ret = -EINVAL;
>>>>>>> +        goto out;
>>>>>>> +    }
>>>>>>> +    if ( cpufreq_verbose )
>>>>>>> +        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
>>>>>>> +               acpi_id, cpuid);
>>>>>>> +
>>>>>>> +    pm_info = processor_pminfo[cpuid];
>>>>>>> +    if ( !pm_info )
>>>>>>> +    {
>>>>>>> +        pm_info = xvzalloc(struct processor_pminfo);
>>>>>>> +        if ( !pm_info )
>>>>>>> +        {
>>>>>>> +            ret = -ENOMEM;
>>>>>>> +            goto out;
>>>>>>> +        }
>>>>>>> +        processor_pminfo[cpuid] = pm_info;
>>>>>>> +    }
>>>>>>> +    pm_info->acpi_id = acpi_id;
>>>>>>> +    pm_info->id = cpuid;
>>>>>>> +    pm_info->cppc_data = *cppc_data;
>>>>>>> +
>>>>>>> +    if ( cpufreq_verbose )
>>>>>>> +        print_CPPC(&pm_info->cppc_data);
>>>>>>> +
>>>>>>> + out:
>>>>>>> +    return ret;
>>>>>>> +}
>>>>>>
>>>>>> What's the interaction between the data set by set_px_pminfo() and
>>>>>> the data set here? In particular, what's going to happen if both
>>>>>> functions come into play for the same CPU? Shouldn't there be some
>>>>>> sanity
>>>> checks?
>>>>>
>>>>> Yes, I've considered this and checked ACPI spec. I'll refer them here:
>>>>> ```
>>>>> If the platform supports CPPC, the _CPC object must exist under all
>>>>> processor
>>>> objects.
>>>>> That is, OSPM is not expected to support mixed mode (CPPC & legacy
>>>>> PSS,
>>>> _PCT, _PPC) operation.
>>>>> ```
>>>>> See
>>>>> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Contr
>>>>> ol
>>>>> .html?highlight=cppc#power-performance-and-throttling-state-dependen
>>>>> ci es So CPUs could have both _CPC and legacy P-state info in ACPI
>>>>> for each entry, they just can't have mixed-mode Maybe we shall add
>>>>> sanity check to see if _CPC exists, it shall exist for all pcpus?
>>>>
>>>> Maybe, but that wasn't the point of my remark.
>>>>
>>>> Properly behaving Dom0 should probably be passing only one of the two
>>>> possible pieces of information. Yet maybe we'd better sanity check _that_?
>>>> (I don't recall seeing Linux kernel side patches yet; if they were
>>>> posted somewhere, they may at least partly address my concern.)
>>>>
>>>
>>> In my linux patch,
>>> https://lore.kernel.org/lkml/20241204082430.469092-1-Penny.Zheng@amd.c
>>> om/T/ I only did zero-value check in xen_processor_get_perf_caps(), Do
>>> you think in that place, I shall add more strict sanity check, like
>>> the register value shall not be zero and also must smaller than UINT8_T?
>>> Or we just do the above check in Xen part when receiving the data?
>>
>> Value range checking is nice to have in Dom0, but the same checking needs doing
>> in the hypervisor anyway. But that isn't what my comment was about. What I'm
>> asking is how it is being made sure that we won't have to deal with a mix of
>> traditional and CPPC data in the hypervisor.
> 
> Are you suggesting that we only do either set_cppc_pminfo or set_px_pminfo?
> Only one side data get set to avoid the consequence of mixture.

That's one of the possible ways to avoid mixing things. Then again Dom0
won't know what cpufreq= was passed to Xen, and hence it may not be in
the position to decide what to upload. It hence may need to be Xen to
simply ignore the uploading of data it's not going to use.

Jan

