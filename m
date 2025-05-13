Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AAAB4D93
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 10:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982608.1368962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkbS-0004GD-2f; Tue, 13 May 2025 08:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982608.1368962; Tue, 13 May 2025 08:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkbR-0004DU-Uy; Tue, 13 May 2025 08:03:05 +0000
Received: by outflank-mailman (input) for mailman id 982608;
 Tue, 13 May 2025 08:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEkbQ-0004DO-TG
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 08:03:04 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2113946-2fd0-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 10:03:03 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5faaddb09feso10576880a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 01:03:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2406eeadasm483804166b.97.2025.05.13.01.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 01:03:02 -0700 (PDT)
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
X-Inumbo-ID: b2113946-2fd0-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747123383; x=1747728183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m1m9swlxKhyehhxIC3pQfEf5rgn7GIpkaqgV9FzyeqQ=;
        b=ZllGngM7VShLEg3af/cGoJJjDfYW+KrFD+F697Ne53ofsyAMpHjch0GQi9F0Txc95N
         wkAAUcXO05PaxQhN1IUdCXLbf7uUjaMFTqJ/PJyT1DnXZf/Z7NXrJUoFC25Z+JQ/xV7t
         J3tJbB2Q1gnvl4MNq07ewjrAnNndtvLzD4XxFe23d+SCucMtbycCXAvndNXITxIo2qBJ
         FV0K0uWhF9QZaQTRN329o9sHnDP1Uer3tsD+whiC/9/2a0YuRENUUxJsHjW2/ovKVioY
         6OjvSYYjtAIXRITYe0Z3hCdSfKy5XPUIGWSpQZrc9/tzLfv6E/w37dzucd+dIBuorLCO
         f1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123383; x=1747728183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1m9swlxKhyehhxIC3pQfEf5rgn7GIpkaqgV9FzyeqQ=;
        b=KJ3vbby3aifuupeEn/y0FlL2fbNwfNJ1vFZ37r6h1mBPZNg0AdNjnAEtRg/UPl/rVr
         8zwIldgd1jVlY37luCJ4SmfB2ltvv+YCA9jgBj56Td836Y2iEG5YAPKPaPckvAMWG1NZ
         dx0lXL+rxNjwamYxDcLU36WNMzKRGA+vYhlGnErGS6tII0CHzq2Nu3TjN++XgWtM8YAc
         PUdg5LWCSobbd5GcXR+3mlzP26n2LXoRyiaX/8QILPT0RjsbEFjKrrNChTWuYpjg9/WV
         5rxwRxoIJJJGPNgmhggd/I8BqDkdIJsdk4bvhy7FDis6c0mhJfDWN5Mv2xQMF9WLHadX
         RiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3DJmtihiWLMjyRrbzws+6tSHwxSLI5kR9BqesaIKQY3y7N4xWPCipmOqxwpiaPmb6BK8KznUWToA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo/MsaX/cQVea3/Wnkgbx0LjO2s8kKnyW94pjLwTtpj0A4JEQ+
	6nShg3w6rcnC4JidVpruHeGlE8/cZCQYpMghUV1WtkMgrMQ3rgT9H7nVmTMcGqZNchbSVAcA7ns
	=
X-Gm-Gg: ASbGnctgwkkK4N9tfGSWzkDapFLx11/WOfc7ks4dcEcYm21gbd0lVJhSpuDI411GkGp
	ayZ2u51zwjxoz/WDfStl7IOSvlHf4MXaB3KizlHEQ64m6tYtA35id3Qs7EX5z3ES+axTjFJcOV6
	VQjNthV9MIarbg/ZZlbHiBjXbq9uuLgg7rKyyRAl98uEPnKjtB6cqjdp/OXAMuNrZJLSSEmMu/U
	QQ20NbuMvqXrgT4EKjDXm/ldgbIX3abJ3/vaffFhOKD+u/AN+Y19p6IZc73/+7ZY4ydSsaFZmYy
	eqxaUGeGErZlDe/Zbccjuiy8jVEMnr3UCn2rGozIIb0ud4YqlDOS38LZ9W5V9E1/FmqFH/MOR+b
	YCERcoALgswXjdRXR2tWcLsD/Hz+IciMjePEs
X-Google-Smtp-Source: AGHT+IH7BQaa5iSi90dldaCQe+ofINMskpGyVyQYUXrJUeyD+eWdWmx8x5W9iAHX2UzCQduapuZs0g==
X-Received: by 2002:a17:906:4ecc:b0:ad2:1b50:891b with SMTP id a640c23a62f3a-ad21b509698mr1217876466b.52.1747123383013;
        Tue, 13 May 2025 01:03:03 -0700 (PDT)
Message-ID: <75679a60-7ca0-41da-b542-c5b9d5efdfbe@suse.com>
Date: Tue, 13 May 2025 10:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-13-Penny.Zheng@amd.com>
 <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
 <DM4PR12MB8451F0794ED87DE6F9E5F2A3E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451F0794ED87DE6F9E5F2A3E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 08:36, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, April 30, 2025 9:55 PM
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> HWP, amd-cppc, amd-cppc-epp are all the implementation of ACPI CPPC
>>> (Collaborative Processor Performace Control), so we introduce
>>> cppc_mode flag to print CPPC-related para.
>>>
>>> And HWP and amd-cppc-epp are both governor-less driver, so we
>>> introduce hw_auto flag to bypass governor-related print.
>>
>> But in the EPP driver you use the information which governor is active.
> 
> We want to have a one-one mapping between governor and epp value, such as,
> If users choose performance governor, no matter via "xenpm" or cmdline, users want maximum performance,
> We set epp with 0 to meet the expectation.
> And if users choose powersave governor, users want the least power consumption, then we shall set
> epp with 255 to meet the expectation.

That's all fine, but completely misses the point of my question: If the
governor is relevant, why would you bypass respective printing?

> Ondemand is a tricky part, hmmmm, I don't know which value is suitable for it, the medium one? So I neglect it in the first place

Medium one may be okay-ish, but it's not really an appropriate fit. We may
want to at least consider rejecting the use of ondemand with the EPP driver.
That, however, heavily depends on how hardware would behave when using the
medium value.

>>> --- a/tools/misc/xenpm.c
>>> +++ b/tools/misc/xenpm.c
>>> @@ -790,9 +790,18 @@ static unsigned int
>>> calculate_activity_window(const xc_cppc_para_t *cppc,
>>>  /* print out parameters about cpu frequency */  static void
>>> print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>>> {
>>> -    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME)
>> == 0;
>>> +    bool cppc_mode = false, hw_auto = false;
>>>      int i;
>>>
>>> +    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
>>> +         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_DRIVER_NAME) ||
>>> +         !strcmp(p_cpufreq->scaling_driver,
>> XEN_AMD_CPPC_EPP_DRIVER_NAME) )
>>> +        cppc_mode = true;
>>> +
>>> +    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
>>> +         !strcmp(p_cpufreq->scaling_driver,
>> XEN_AMD_CPPC_EPP_DRIVER_NAME) )
>>> +        hw_auto = true;
>>
>> Please avoid doing the same strcmp()s twice. There are several ways how to, so
>> I'm not going to make a particular suggestion.
> 
> Maybe we shall use switch-case() to replace the same strcmp()s
> Since it's not easy to switch-case() string value, I had a draft idea to include an new entry in "struct xen_cppc_para",
> See:
> ```
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index fa431fd983..b872f1b66a 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -308,6 +308,10 @@ struct xen_ondemand {
> 
>  struct xen_cppc_para {
>      /* OUT */
> +#define XEN_SYSCTL_CPPC_VENDOR_HWP      1
> +#define XEN_SYSCTL_CPPC_VENDOR_AMD      2
> +#define XEN_SYSCTL_CPPC_VENDOR_AMD_EPP  3
> +    uint8_t vendor;
>      /* activity_window supported if set */
>  #define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
>      uint32_t features; /* bit flags for features */
> 
> ```
> A new vendor filed in struct xen_cppc_para could help us differ the underlying implementation.
> Or any better suggestions?

Well, if you set hw_auto first, then you can use that variable plus one
more strcmp() to set cppc_mode.

Jan

