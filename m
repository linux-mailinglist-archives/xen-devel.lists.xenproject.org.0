Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28367B19C6C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068832.1432688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipa0-0007qH-JW; Mon, 04 Aug 2025 07:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068832.1432688; Mon, 04 Aug 2025 07:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipa0-0007on-Gn; Mon, 04 Aug 2025 07:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1068832;
 Mon, 04 Aug 2025 07:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipZz-0007oh-GT
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:25:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 414552a2-7104-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 09:25:54 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6156463fae9so8378508a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:25:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a078a11sm699479566b.7.2025.08.04.00.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:25:52 -0700 (PDT)
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
X-Inumbo-ID: 414552a2-7104-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754292353; x=1754897153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj4P3QBJfUG2ESOk/WDB36aNWoVLWCUT/GmpowtzHbg=;
        b=Pm7HTqejPfDz73ZwZkvp76faXNAMmsf94FvKYvNFqq6Zurk6a9JiocbA/9fxaREXHq
         XKdPJfGkmhSNg5bOAZyY9+KtR8seV1BLBUh2xSW7lc0vNRP9G9L284AJ1rTgoZ8jreGD
         59XSAj7FARY9HhhDOBEb22gFzvdRhpNslDBaNary1UH2rNcyh09eQeVnEBFMMEAL0gV2
         F085YKEOxuQVsDeqahAyRHhZZQSDG4Ilmcu1PX4ETKOhC3unVp5ez4s4PCW3yS7TAsn1
         ZXs4Asy++MscoT86jdvzRC/lDf1zosCEmogn8DwMmFsnc6o6/d/20qtok3SGKQIu21Jq
         fFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754292353; x=1754897153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj4P3QBJfUG2ESOk/WDB36aNWoVLWCUT/GmpowtzHbg=;
        b=IDng/0UsAYzet2Y0WHqQTweB9IL5A1XXuHqxcBfqWA4e6kb3Sz+VokG+XG/U/Oep8L
         Jg4BOzc2c31VvZWj+uRYF2z8fxgsdZR1Xa0QHZQjLyHv0z6OB+USbO6uldpyMZ2pYQ42
         7Vd+uXKuF5J8WS21UQ+/d/QzJxbANDJpJ0r5jIzDXwHmz+IVIsDFwyW6jVzhT/HodZEX
         CJDQVtv1665WM35V+j7PLOsVQFn3MZY5nCBamLSsdCXg3O91UG8Nfj2nQxS3TgwWq4LR
         e67AYyX1/i+l1CRQQIvUd26Bpda2+fZ76aEREhIGJyZYIL5lTAraNY+Uk19C4EhhPiqL
         LJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCXPgOf/Stv4a5eLaY+OSgZUqvdou4Tw7Ilb/Y18bINFFmxGP3QYlXcpEv5p4r2ZFlU0NtQ3B5SY+QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznhIoP7xjJ9Kh9tGV0GO9B6+aDIVNjrbMdKbQVWOdco3n3X+2s
	qT45+OSzL7VpHi+LJ371Z9JlOltOJntiOyNcLV2hyTOnVnkuC/p2dbzKmRygdWnkxQ==
X-Gm-Gg: ASbGncug9m1vJSWxS3YvV5Mkry7/ndaZKGLk/DBy6sRcFzlNUuWiys6wzAbruLACvmR
	EQL1vk1SutBoU4pgIeL/dx45K5MaUGmmjEUcNSmgvSHQvvs5sYiVTTJGnv8rGjI/CyPAiHmpNOp
	gU5TDuZA0eGsAc7n6hGo9XqXjn0htIxx8VqVOKyFWXPcBYklToqqgPl7TfxDY8FyJFgUV2TV4+H
	rhg8pdevgRjHlOcc7Hc8h0QnJnIIY7ZPxuUOZgyM4B+dq9engi+YYkIRNnQ14b/pigV2ZtbbxMe
	CZJdUoz97Hej6zflivPs6MuxixyLJ0da/YHnfJWhzWRAPO82R0RSeOYeqdMQqRXfFIILEA4MZ90
	JtPUkEhKnb88V3ohLRrokjZp+V5iy2CUUeycAfZug5lQ7DuMpkVEmzU8zAUgGXhswtKH7fIVXIP
	T49f/AOQu2QtcO3Ha2bA==
X-Google-Smtp-Source: AGHT+IFANaOepWRVt6+vT9pQ9ELWEWMZR1c6BGKI9yj+Zhviis7K40Z9Cp6tGE3HA+HGWp+AKfFpmg==
X-Received: by 2002:a17:907:971e:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-af9408a1543mr851157566b.19.1754292353129;
        Mon, 04 Aug 2025 00:25:53 -0700 (PDT)
Message-ID: <5f6f16b9-3aea-4407-8938-2ce4cc6edcfd@suse.com>
Date: Mon, 4 Aug 2025 09:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/19] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-11-Penny.Zheng@amd.com>
 <916162aa-01fa-42a3-82c6-42a2c635f082@suse.com>
 <DM4PR12MB845142B33B4AE40453161BF1E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845142B33B4AE40453161BF1E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2025 08:47, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, July 16, 2025 11:39 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v6 10/19] xen/cpufreq: introduce new sub-hypercall to
>> propagate CPPC data
>>
>> On 11.07.2025 05:50, Penny Zheng wrote:
>>> +             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
>>> +            /*
>>> +             * Right now, Xen doesn't actually use highest_perf/nominal_perf/
>>> +             * lowest_nonlinear_perf/lowest_perf values read from ACPI _CPC
>>> +             * table. Xen reads CPPC capability MSR to get these four values.
>>> +             * So warning is enough.
>>> +             */
>>> +            printk_once(XENLOG_WARNING
>>> +                        "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u),
>> nominal(%u), highest(%u)\n",
>>> +                        cppc_data->cpc.lowest_perf,
>>> +                        cppc_data->cpc.lowest_nonlinear_perf,
>>> +                        cppc_data->cpc.nominal_perf,
>>> +                        cppc_data->cpc.highest_perf);
>>> +
>>> +        /* lowest_mhz and nominal_mhz are optional value */
>>> +        if ( cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )
>>
>> If they're optional, what if lowest_mhz is provided but nominal_mhz isn't?
>> Wouldn't the warning needlessly trigger in that case?
>>
> 
> Yes, only both are provided, this check is meaningful
> +        if ( cppc_data->cpc.nominal_mhz &&
> +             cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )
> 
>>> --- a/xen/include/public/platform.h
>>> +++ b/xen/include/public/platform.h
>>> @@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>>>  #define XEN_PM_PX   1
>>>  #define XEN_PM_TX   2
>>>  #define XEN_PM_PDC  3
>>> +#define XEN_PM_CPPC 4
>>>
>>>  /* Px sub info type */
>>>  #define XEN_PX_PCT   1
>>> @@ -370,6 +371,10 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>>>  #define XEN_PX_PPC   4
>>>  #define XEN_PX_PSD   8
>>>
>>> +/* CPPC sub info type */
>>> +#define XEN_CPPC_PSD   1
>>> +#define XEN_CPPC_CPC   2
>>
>> As per this, ...
>>
>>> @@ -457,6 +462,26 @@ struct xen_processor_performance {  typedef
>>> struct xen_processor_performance xen_processor_performance_t;
>>> DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
>>>
>>> +struct xen_processor_cppc {
>>> +    uint8_t flags; /* IN: XEN_CPPC_xxx */
>>
>> ... it's a type that's living here, not a collection of flags. Any reason the field isn't
>> named "type"?
> 
> It is a collection of flags. Only when both XEN_CPPC_PSD and XEN_CPPC_CPC are set, we could run cpufreq_cpu_init() to initialize cpufreq core.

Hmm, right. The next legitimate XEN_CPPC_* value to use would be 4, not 3.
That's not visible from how things are defined, though. May I suggest that
you use

/* CPPC sub info type */
#define XEN_CPPC_PSD   (1U << 0)
#define XEN_CPPC_CPC   (1U << 1)

instead then?

Jan

