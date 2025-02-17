Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD3A37C61
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 08:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889740.1298787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvi7-0006V8-BG; Mon, 17 Feb 2025 07:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889740.1298787; Mon, 17 Feb 2025 07:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvi7-0006Sc-8M; Mon, 17 Feb 2025 07:38:35 +0000
Received: by outflank-mailman (input) for mailman id 889740;
 Mon, 17 Feb 2025 07:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjvi5-0006SW-S7
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 07:38:33 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30443d75-ed02-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 08:38:32 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e058ca6806so1502808a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 23:38:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf307sm847874866b.176.2025.02.16.23.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 23:38:31 -0800 (PST)
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
X-Inumbo-ID: 30443d75-ed02-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739777912; x=1740382712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LRPGlYSSR5aCT1DF3zZVycnmTlCM+fNTDqvv26hqEg4=;
        b=dLnajRA9v6yLMrWgUifXF1QSmsDr8K655XHh4E2rx/MYYOyYA6jL2khyTwi0DE3YA/
         r6daoEkiJ19Xw07vQPuX0Dtp+naMdGEJNH6A+Gu9MAGYOZXU19wOLO6raANgcvwYRbnW
         SLDZ+K/Kgw5WUvKhlazTNq4WOsEMiNCt/c76bsjo48aQIQIbws3603zHs0W75HD0XyU2
         OZEjpFb4nkWjI8Wk+BVvfY+2SjEmT7v95kCuzd2ulQhevudfy4naF0jxjg59Ne25biO3
         FTyAFm6hJtn/46ck+dLaJBrYVSh8zERFJ7PZPCeHXU70qGoNfBb3dq7rwFo1Ue8jsP3l
         EWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777912; x=1740382712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRPGlYSSR5aCT1DF3zZVycnmTlCM+fNTDqvv26hqEg4=;
        b=IRR1ZGU2Zp1iaqm6yXZsACGSd+nNfxQZBBJf1I6MI/HpwBaHFz7M2zYVFebeQ27eyJ
         DanmRzEmZUqmcMa0XoDRV2Z+wQylvsFa21s23QdD7s2Eti8H6iSyI6AK3Jg0tj3VivE9
         gHZbbcnmHqw1X44a/Jb7Ruz0DBviGC5hm8PXZOlRAaXbUdt53bI7ewv13+mOiK4r5/sm
         x+0/6mRfywPQ7lG+9tY0vze0VwxnseeO2zuio8sZYmjhBjQMZXdMIuc4NUII8i18vyQu
         eaJ0eB0MpG+C+uU7TCtVE41v2TDtsHS/WSgRVDSLaXhbsCimMGxgtNGl/y5pa7jfHsco
         Fjow==
X-Forwarded-Encrypted: i=1; AJvYcCUQ36/4ky/nkY90G6OK08fYCtndCiulfiWtLd+a0JfnYgxzAKw+PyYnLFDcnyCICPU9RFlT6Ey/Uro=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1FL6H6msQV47meK7B9kCGZL+SnHA2iP4EveMm0q3xolgCa4ys
	JUpuMa5C+XAaxYc4RnrOgcfYiFap6093YBzl/8Y5DTGTWfrzszDNeKDxcZ1EUA==
X-Gm-Gg: ASbGncvYOPnovPDcG20eKVRSDK3HcjrOFCbNPByg/s3ODEC7NX3n1TuvsBQN37Y8aG2
	QlK08qo8VBKRIWNTgpj3nvXReLpnxT+EMuZFkGC6H28QqPi1uu3sHcBgSxsjzKHpMhjBVyaGpQa
	FvlrRFX2yhj0DCGcjYF4BCpx5yMaQ43DIOhSMDw8Kt0YIo+ozLW5y5hCrioM62462zlxTk6u5Wz
	eJlYjK1sg+SoLcrQ5qp0NlYMHa2KsR/RHRsDz+dEcDloIXrRV7ZB3GTw1D3hFoWhfm1a70vn+mC
	iKupp7+Vie1uOKKBghiGC5oX/A7RTxBi9VesMozweMa6PuUCvW7ZV+0TEPk1PTUgnXjo4wRrP4E
	v
X-Google-Smtp-Source: AGHT+IHwXLAfvcraVqqmYpusbdDmD0J8pu1yLwpMYNixGF90CWnJXH82sjh6qTbAtXNM13v5b2aSIA==
X-Received: by 2002:a17:907:3d8e:b0:ab7:462f:647f with SMTP id a640c23a62f3a-abb70b35f1amr859532966b.25.1739777912301;
        Sun, 16 Feb 2025 23:38:32 -0800 (PST)
Message-ID: <7a0d4cab-188d-41de-ac32-b307109cb0dc@suse.com>
Date: Mon, 17 Feb 2025 08:38:32 +0100
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
In-Reply-To: <DM4PR12MB8451A5DC8E389ECA2D8A3E1AE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 08:20, Penny, Zheng wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

Btw, boiler plates like this aren't really liked on public mailing lists,
for being contrary to the purpose of such lists.

>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, February 11, 2025 7:10 PM
>>
>> On 06.02.2025 09:32, Penny Zheng wrote:
>>> +{
>>> +    int ret = 0, cpuid;
>>> +    struct processor_pminfo *pm_info;
>>> +
>>> +    cpuid = get_cpu_id(acpi_id);
>>> +    if ( cpuid < 0 || !cppc_data )
>>> +    {
>>> +        ret = -EINVAL;
>>> +        goto out;
>>> +    }
>>> +    if ( cpufreq_verbose )
>>> +        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
>>> +               acpi_id, cpuid);
>>> +
>>> +    pm_info = processor_pminfo[cpuid];
>>> +    if ( !pm_info )
>>> +    {
>>> +        pm_info = xvzalloc(struct processor_pminfo);
>>> +        if ( !pm_info )
>>> +        {
>>> +            ret = -ENOMEM;
>>> +            goto out;
>>> +        }
>>> +        processor_pminfo[cpuid] = pm_info;
>>> +    }
>>> +    pm_info->acpi_id = acpi_id;
>>> +    pm_info->id = cpuid;
>>> +    pm_info->cppc_data = *cppc_data;
>>> +
>>> +    if ( cpufreq_verbose )
>>> +        print_CPPC(&pm_info->cppc_data);
>>> +
>>> + out:
>>> +    return ret;
>>> +}
>>
>> What's the interaction between the data set by set_px_pminfo() and the data set
>> here? In particular, what's going to happen if both functions come into play for the
>> same CPU? Shouldn't there be some sanity checks?
> 
> Yes, I've considered this and checked ACPI spec. I'll refer them here:
> ```
> If the platform supports CPPC, the _CPC object must exist under all processor objects.
> That is, OSPM is not expected to support mixed mode (CPPC & legacy PSS, _PCT, _PPC) operation.
> ```
> See https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html?highlight=cppc#power-performance-and-throttling-state-dependencies
> So CPUs could have both _CPC and legacy P-state info in ACPI for each entry, they just can't have mixed-mode
> Maybe we shall add sanity check to see if _CPC exists, it shall exist for all pcpus?

Maybe, but that wasn't the point of my remark.

Properly behaving Dom0 should probably be passing only one of the two
possible pieces of information. Yet maybe we'd better sanity check _that_?
(I don't recall seeing Linux kernel side patches yet; if they were posted
somewhere, they may at least partly address my concern.)

>> Will consumers be able to tell which of the two were correctly invoked, before using
>> respective data? Even in the event of no code changes at all to address this, it will
>> want discussing in the patch description.
>>
> 
> I have checked the relevant spec. it shall be the following logic:
> ```
> Software enables Collaborative Processor Performance Control by setting
> CPPC_ENABLE[CPPC_En] (bit 0) = 1. Once it gets enabled, the processor ignores the legacy P-state control interface.
> ```
> Hmmm, I shall add relevant comment in Doc?

Mentioning this in the description would help. Yet the processor ignoring
the other P-state control interface shouldn't mean we can nevertheless try
to drive it. It has to be clear (and at least halfway obvious) internally
to Xen that we only ever use one of the two. My present reading of the
patches suggests that this is all implicit (and maybe not even guaranteed)
right now.

Jan

