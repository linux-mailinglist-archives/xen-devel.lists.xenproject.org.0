Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6616A3A05F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891800.1300834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOu8-0007Rm-Gz; Tue, 18 Feb 2025 14:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891800.1300834; Tue, 18 Feb 2025 14:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOu8-0007PZ-ER; Tue, 18 Feb 2025 14:48:56 +0000
Received: by outflank-mailman (input) for mailman id 891800;
 Tue, 18 Feb 2025 14:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkOu7-0007PT-To
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:48:55 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7930d69e-ee07-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:48:53 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-abb86beea8cso508768766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:48:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbb186c5d5sm200341366b.51.2025.02.18.06.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:48:52 -0800 (PST)
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
X-Inumbo-ID: 7930d69e-ee07-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739890133; x=1740494933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GpgQyrdGiJDe13+6Q062la2rXojAzLnH/luhEYXBVps=;
        b=OgjmKVxzwPQnITUcKXnnrj9pJxgy6JSkGRYI39PmUZLWSdryDHY+36qHt6PhkdnHuU
         kyGqNBswgIXT7yWhvKB4SsNM9Uzpauc42BPVWAxYRhF60n2zBkQoeugp6FVRDC6XyI/M
         jI+vBHd5xflWA5dc2oQi+daEB9oMIMgkxN0r/irZ3dxv5hXVg4aUabEHJK5ujX/xdIXP
         UtORSetROH0xtT1/lpb6gzH5haMgwR0feh2/ZfHbYgyiMmcJSNkAA3mgF/xwLFaVzraK
         ueKFWELEQTue1F7rDcB6Aw/RNEJVML8P3TNiJBQkGv1Zc0ietdJvT44JGL7Qx7zBytgM
         0O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739890133; x=1740494933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpgQyrdGiJDe13+6Q062la2rXojAzLnH/luhEYXBVps=;
        b=csZ38pfOwvAR8ny04orcJx8u2GFbHJL6Id/pYVqjTHsoN2aWP8H/HA/gQiP3YLe2/B
         14P0UuUHEsK9lmMg9P3upp44JgY7Vy12p0wdPfkBcikZ7nJIYLKKkcktDzutE6SufS3Y
         vy7Swgcg2Qw4g0mbUoIDLbI9Wwkbi4T5NeqbE3U5OxA2Zon3XSkGXUQzqHpLWjZD9YOj
         lkFub9cAzxCzAYMI+8yb82t0tL9m7Blkf4+tjLYwKjcIalsinCmYT7pPYf3GN1DYZAhm
         jK1IAA8Ahu4c54BLoga4dhJZ+kZ3X1QgxJSrVVjskOu8+HcgKxYYAXkn6GxTbADeI/Fx
         CG9w==
X-Forwarded-Encrypted: i=1; AJvYcCUZOtqNDZ2qP+Aa8huVj89kNwkE16Bm4pXIHjtZnYxtStZ5f172PsU0Lt02KiStm+whQ4HLxpN4aNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOMJdmYYIDeXrwJcX8xwn5ExyARbtwDfP+7XSH1MqJaSwEY8P4
	vLbee8pQ+y12IuAGzA7Gye4uj07qKMMGUJuy/7OnNu10Ml94n3sy3uuN8OqPrQ==
X-Gm-Gg: ASbGncvwN7DlYB9ctvTytoHQqDme6YdNDG3K9ueUHyl6hORQSvujHhUVls5JuWuy+2c
	ff/Zrb9IMLdsHJoriIoxnt7zFXub5Icfm+cw2rfyOxHDJnGBWowYttMFx4WP3BwI/fneT/qhF3t
	8oG1/1KnyMgcBWIeb9wXxvcynxp2h85BZJl5xqMPWnNNz+OyDdy/Gy4wgU9L+BKUoBlpdvsN6jr
	iPNtLZC9Ppc8zmpNxRumydDl2ERnjLqLmFDz/jqTzUTAKrJjAGivUjMRcfZFHzrgVt8BnuiVb7S
	QGszhfS69OEoahm/zp5RZXUDrKGRwmvhQoce0ATTW/PJ+yeF2a3e+PpfWHO6XT9Umj0PUgpT2FP
	6
X-Google-Smtp-Source: AGHT+IG9VzdBp6DS35UD64ynjVFHm1X/ffXvOaZ14bpJuvBn+nss89u9xTpRZzVy7MLVB+FrgwqCfQ==
X-Received: by 2002:a17:907:7209:b0:a9e:b2da:b4a3 with SMTP id a640c23a62f3a-abb710dcd81mr1402768766b.42.1739890133178;
        Tue, 18 Feb 2025 06:48:53 -0800 (PST)
Message-ID: <8a5071fc-7948-43aa-82e1-9dde9b0fcc24@suse.com>
Date: Tue, 18 Feb 2025 15:48:52 +0100
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
In-Reply-To: <DM4PR12MB8451E14BD7539A3A2C565C0DE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 07:05, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, February 17, 2025 3:39 PM
>>
>> On 17.02.2025 08:20, Penny, Zheng wrote:
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Btw, boiler plates like this aren't really liked on public mailing lists, for being contrary
>> to the purpose of such lists.

You did read this, didn't you? I ask because the same boilerplate keeps
appearing in your mails.

>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, February 11, 2025 7:10 PM
>>>>
>>>> On 06.02.2025 09:32, Penny Zheng wrote:
>>>>> +{
>>>>> +    int ret = 0, cpuid;
>>>>> +    struct processor_pminfo *pm_info;
>>>>> +
>>>>> +    cpuid = get_cpu_id(acpi_id);
>>>>> +    if ( cpuid < 0 || !cppc_data )
>>>>> +    {
>>>>> +        ret = -EINVAL;
>>>>> +        goto out;
>>>>> +    }
>>>>> +    if ( cpufreq_verbose )
>>>>> +        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
>>>>> +               acpi_id, cpuid);
>>>>> +
>>>>> +    pm_info = processor_pminfo[cpuid];
>>>>> +    if ( !pm_info )
>>>>> +    {
>>>>> +        pm_info = xvzalloc(struct processor_pminfo);
>>>>> +        if ( !pm_info )
>>>>> +        {
>>>>> +            ret = -ENOMEM;
>>>>> +            goto out;
>>>>> +        }
>>>>> +        processor_pminfo[cpuid] = pm_info;
>>>>> +    }
>>>>> +    pm_info->acpi_id = acpi_id;
>>>>> +    pm_info->id = cpuid;
>>>>> +    pm_info->cppc_data = *cppc_data;
>>>>> +
>>>>> +    if ( cpufreq_verbose )
>>>>> +        print_CPPC(&pm_info->cppc_data);
>>>>> +
>>>>> + out:
>>>>> +    return ret;
>>>>> +}
>>>>
>>>> What's the interaction between the data set by set_px_pminfo() and
>>>> the data set here? In particular, what's going to happen if both
>>>> functions come into play for the same CPU? Shouldn't there be some sanity
>> checks?
>>>
>>> Yes, I've considered this and checked ACPI spec. I'll refer them here:
>>> ```
>>> If the platform supports CPPC, the _CPC object must exist under all processor
>> objects.
>>> That is, OSPM is not expected to support mixed mode (CPPC & legacy PSS,
>> _PCT, _PPC) operation.
>>> ```
>>> See
>>> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control
>>> .html?highlight=cppc#power-performance-and-throttling-state-dependenci
>>> es So CPUs could have both _CPC and legacy P-state info in ACPI for
>>> each entry, they just can't have mixed-mode Maybe we shall add sanity
>>> check to see if _CPC exists, it shall exist for all pcpus?
>>
>> Maybe, but that wasn't the point of my remark.
>>
>> Properly behaving Dom0 should probably be passing only one of the two possible
>> pieces of information. Yet maybe we'd better sanity check _that_?
>> (I don't recall seeing Linux kernel side patches yet; if they were posted somewhere,
>> they may at least partly address my concern.)
>>
> 
> In my linux patch, https://lore.kernel.org/lkml/20241204082430.469092-1-Penny.Zheng@amd.com/T/
> I only did zero-value check in xen_processor_get_perf_caps(), Do you think in that place, I shall add
> more strict sanity check, like the register value shall not be zero and also must smaller than UINT8_T?
> Or we just do the above check in Xen part when receiving the data?

Value range checking is nice to have in Dom0, but the same checking
needs doing in the hypervisor anyway. But that isn't what my comment
was about. What I'm asking is how it is being made sure that we won't
have to deal with a mix of traditional and CPPC data in the hypervisor.

Jan

