Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5CCADC1CA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 07:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017696.1394690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uROxX-0006Og-9G; Tue, 17 Jun 2025 05:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017696.1394690; Tue, 17 Jun 2025 05:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uROxX-0006NE-5h; Tue, 17 Jun 2025 05:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1017696;
 Tue, 17 Jun 2025 05:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uROxW-0006N8-LS
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 05:34:10 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b068a427-4b3c-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 07:34:08 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so65200345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 22:34:08 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f21a:fe:66b6:9dc3:86d6?
 (p200300cab711f21a00fe66b69dc386d6.dip0.t-ipconnect.de.
 [2003:ca:b711:f21a:fe:66b6:9dc3:86d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b2a6a5sm12788299f8f.74.2025.06.16.22.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 22:34:07 -0700 (PDT)
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
X-Inumbo-ID: b068a427-4b3c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750138447; x=1750743247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D2f1itmEVIrle8OrIGrYJlEgsdZL5eJAQfLXLlsxXN8=;
        b=VT/1QZ8PaYWgt8rQzxmX1mSvONjyBdYiijCSAi6dt0xK83dOxXYzq93KQsWNOPlnz4
         eZBrku0R/U66Yu0aJNCs7P4kxFr5M0NlYqo3PbEdaVVAsoq14nClMsDdiJonrOh4OX+Y
         yhgZgXt03DVQ99oD0cpIKd2dH6dtfnCjyzm1EWpDgvwfFfC2awrgrYPJ0xvKcovOqaP0
         UOPEcoaHRlXe6ju/tMIuJH0lTTjDeITlAf7o5lM7R/WD2w0dLvE1W4u009Z6xZXYZvTs
         G98+g5ufKxLF6p86LZYD+/0DAP2/kocIj6msaaQt1OL5wBJoPguSbY38CHmL9d1OUwXU
         FzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750138447; x=1750743247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2f1itmEVIrle8OrIGrYJlEgsdZL5eJAQfLXLlsxXN8=;
        b=T5a2W4YeMuHttqaevb8mTQUOh/8sm1j0WEuhazvnaOPN63mthIh46QJwFBcUtpm00x
         94rKmJhs7H1yvd+htf91WNLyYRkanFs+ABVsbzRC44IYup1OIpldLNk1LvLRUwdN+xGA
         J6P/kkAFABi0XLMmyNf8PkilXsfd4MhYor23LHCcWZ5QdTcLsamMiO/euwEvm/n2T1r8
         vSNEzjFTR1kbnFQWmU6PStlhjV/fEssl4KSAtklHJ/CpAtOxDW/oWmG742gpuXPomvyK
         JFC1RbgvEWB1aKs63hQ4tBd8BNKv6i5TYgqSSGiHNcFZkpgqIT2TYyA/uNRWrYpwzy+H
         4QDA==
X-Forwarded-Encrypted: i=1; AJvYcCXS7j9KrRXsCD9YB0F734s0uocbmxKP1T2nlIU/AoSGMrktGE9UlwYPA+WpSOVg7AZt9yDrPWEiHpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQ4ErhaLUZLOffa4EulwiD1kJa9xsi192rE8xpFFiOz/mnHwro
	nr9Keq6bruOCknTiuUbWgNKjSPg6AxVq/ZQ/yo44iBVFmeJ01ucdEZpTX8abj7wnrM0xQ/ESbwQ
	41KY=
X-Gm-Gg: ASbGncuGDPOY8setTi2KP+HbLefJRez6nlHRAb6KYY47C2v2bgDndBnDg1QiNtLDF4t
	4iXbkqENgRYK0AX46s+PPfPyAl67RTrfOoyiYDcTdoX6qd12FyWhjzh54Mwj/C8tpRzGvtvF3Nt
	OJnx8E7N2PgguUuVOePSdziEOSvyrhprkO5W4ea03JikXDnCBwUZtHBZ49+7tC6vto4cKl1JW8O
	lfrNveFShir+1DV7xYeUF7LF05FjdW5FGmJPu4neo1aIF+LsrAkJQBSViX0tZ//hf+PnZx9mbTJ
	UwUy2J3rU0uaMkUZGSJdKJCL5+Zp1Gqtm4rVJOxzWAZrRRYrvKcu6ge20ZuYU34W5v+MDTj0bxZ
	uH0ixTG+Sb0jQ+8xUbVi6Ufy+41fZualX5mgb1ekJMBoPbzXkAczwBT49hUMFmCbZjL00GsvgNB
	vhRrSaf1JGLF9fiSU=
X-Google-Smtp-Source: AGHT+IGAkjSaRKXrdtrIHyxnxGkzD+xV2iNG4SuSIKDjbR2suVjLeXEOD/d00zjmd5DYt4owfwrWCw==
X-Received: by 2002:a05:6000:2286:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a572e9a4bamr8891130f8f.57.1750138447345;
        Mon, 16 Jun 2025 22:34:07 -0700 (PDT)
Message-ID: <de2cc8ce-55e0-433d-9cd7-a1ec15ad64c2@suse.com>
Date: Tue, 17 Jun 2025 07:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-4-Penny.Zheng@amd.com>
 <005a0e3a-dc8f-480f-8bb9-fd8eb164eb02@suse.com>
 <DM4PR12MB84516E8BD6E4C48D48273C93E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <824a8aa5-c603-47e8-8688-a324152329a9@suse.com>
 <DM4PR12MB8451236776D6F83C5B38A527E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451236776D6F83C5B38A527E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 06:12, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, June 16, 2025 5:51 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
>> xen_processor_performance"
>>
>> On 16.06.2025 11:43, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, June 11, 2025 11:34 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from
>>>> "struct xen_processor_performance"
>>>>
>>>> On 27.05.2025 10:48, Penny Zheng wrote:
>>>>> @@ -545,14 +597,9 @@ int set_px_pminfo(uint32_t acpi_id, struct
>>>>> xen_processor_performance *perf)
>>>>>
>>>>>      if ( perf->flags & XEN_PX_PSD )
>>>>>      {
>>>>> -        /* check domain coordination */
>>>>> -        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
>>>>> -             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
>>>>> -             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
>>>>> -        {
>>>>> -            ret = -EINVAL;
>>>>> +        ret = check_psd_pminfo(perf->shared_type);
>>>>> +        if ( ret )
>>>>>              goto out;
>>>>> -        }
>>>>>
>>>>>          pxpt->shared_type = perf->shared_type;
>>>>>          memcpy(&pxpt->domain_info, &perf->domain_info,
>>>>
>>>> ... the need for this change. And even if there is a need, a
>>>> follow-on question would be how this relates to the subject of this patch.
>>>
>>> I extracted this snippet out for sharing the same checking logic both
>>> in Px and later CPPC. They both need _PSD info
>>
>> Right, and that (iirc) becomes visible later in the series. But it needs saying here. As
>> it stands the description talks of only get_psd_info() right now. And the change
>> above is also unrelated to the "extract" mentioned in the title.
>>
>>> I could change title to "xen/cpufreq: make _PSD info common" and also
>>> add description in commit message for introducing check_psd_pminfo()
>>
>> The title was probably fine; it's the description which was lacking. In fact I'd deem
>> "make ... common" misleading when there's no 2nd user (yet).
>>
> 
> How about:
> "
> Title: xen/cpufreq: export _PSD info and checking

As said, the original title was probably fine. In the new title (and also in
the text suggested below), I wonder what "export" means.

> _PSD info, consisted of "shared_type" and "struct xen_psd_package", will not
> only be provided from px-specific "struct xen_processor_performance", but also
> in CPPC data.
> 
> In cpufreq_add/del_cpu(), a new helper get_psd_info() is introduced to
> export _PSD info. While in set_px_pminfo(), check_psd_pminfo() is also introduced to
> export _PSD value checking.

How about "Two new helper functions are introduced to deal with _PSD. They
will later be re-used for handling the same data for CPPC."

Jan

> in the meantime, the following style corrections get applied at the same time: ........
> ```
> 
>> Jan


