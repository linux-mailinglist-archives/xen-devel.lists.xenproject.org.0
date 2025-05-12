Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30938AB3CB8
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981789.1368200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVSP-0001CH-JD; Mon, 12 May 2025 15:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981789.1368200; Mon, 12 May 2025 15:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVSP-00019N-G9; Mon, 12 May 2025 15:52:45 +0000
Received: by outflank-mailman (input) for mailman id 981789;
 Mon, 12 May 2025 15:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVSN-00019H-VJ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:52:43 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2321e9ea-2f49-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:52:41 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso501911466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:52:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2198b6ebcsm628618466b.185.2025.05.12.08.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:52:40 -0700 (PDT)
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
X-Inumbo-ID: 2321e9ea-2f49-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747065161; x=1747669961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gaFIforIFMWYLs76C5IfEyp2isGvwpw3w906clwWksA=;
        b=fNONocSkXYi5y1eo2Er/J55ZZ5bGAStVGWSDm4utOewkrjERopikiLz6hRb6TB8eXR
         2LkFisCLn+pSUtcs+WlbtiBi50xMkBcO6+R4Rp/lVSUXUqqwQ0IS41XEdaTHeS26VMYv
         Xbi/tOtpZ3Fo9uXE5iZycOXSDyWQvVONhvbh6q8U4PmLljXNg5vaNl8LccEAjSgGAEaV
         krmdn2k9V1WjO1sMqBTpfcFVxR2Pa03qEAdTBynqhdpQmW32OA1+0BfSCpUSuEZFhi88
         bv5PVc2z2NnRULBvg2qZa7i09QHRlnpMzVrLH6hKGnAfun5lnbW4bC3yI/Ru9lfUt8vW
         nmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065161; x=1747669961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaFIforIFMWYLs76C5IfEyp2isGvwpw3w906clwWksA=;
        b=VFGcTdN2oDf/iWBKYrFlkrxSeQ1qR6MMSu3w5wUMa/T277vBuld33davp4WSihYMV5
         FDCOJkiYfm7TdqD2p4nZnYCNNz2BS1wVce9MmCXhx7dpYfO9f6L6ivZKoDF9SGtYIeux
         /f3jgHZ6PenK/MDnXb9LQEPRLENmYWAbEo36p9MawO0Tk1Oc79wBgjtSEJW/FRccLo91
         gG++zaIJkpvhAVBevmHlu3CmILaIlyhoguSJEzs76aRFm11/wpP9h7jHQ71CPuzXGsiB
         ecow7QooW8QCnW28X5lT/KNySX2ttI5cxTe22ZfAiR2NeESqfue3iSZXRB6TjNCYe03C
         elJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/4lyFCNXq6G2I/qf4AgS+YYqK5XqPmSxIvz23NlVTSarKlA8LN9o2AX2SrqIxx/pwo9ao7Uz3yrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybZrs91e3FB4/O+7Hq12iOXJ8xtOhvjA++0aYm6M+b48v524EW
	EMW7XtoSegxHjLnR1QyqRVm8lY6X096FzdF0MYe6BLm+R3UHAl5C/4gWMJGtEQ==
X-Gm-Gg: ASbGncuufgthBctcQ0d053eutqomluGkF7a+IqrnxGl4oL4lYwqhsEsbFLFcp/QBo3X
	scsJKIczr3ptF/x7VsgVlmruxVlWiMdXx8vL3NUbsWryiIXpczwJ0Y9Jmn6PULgVfyVZCYI3jfM
	26Sj4Y1r+2gLj9yJjl39l+AOZRDlh8k+24tvMlBylWT7QXQVGZO+8/D4UqSwlU/nXWYjq/PGpqS
	JQEn1NXNxT9jh3AmMRFqMFOoZNLbdCujvy/G9ctIZt8J2oMaMF7OaAUytzGkp6z4piql9L4nHtL
	Cx8mjS+vphyhBoRd1dpvGAEHmTElmw4IryaGc/MGiF+kW+HthJzoGJYnnvzYVbL3TheVWodvw6M
	BGEf6GLr7JsKdnf/F+gdnh2dCMYCvASY8bgTk
X-Google-Smtp-Source: AGHT+IGV+2BTIjzIhC/pBnIElBSfuLtzDrM48BGhSG47QlrklxQIaRpReEALEVKPhcjpMSrrqG0TzA==
X-Received: by 2002:a17:906:1692:b0:ad2:1b0e:bfe5 with SMTP id a640c23a62f3a-ad21b0ec1bemr903746966b.7.1747065161196;
        Mon, 12 May 2025 08:52:41 -0700 (PDT)
Message-ID: <ea2339d7-2c90-4c94-bd8e-e1b9edd2f128@suse.com>
Date: Mon, 12 May 2025 17:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-4-Penny.Zheng@amd.com>
 <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
 <DM4PR12MB845170AAF569257173F73D18E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845170AAF569257173F73D18E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 11:11, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, April 28, 2025 11:57 PM
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> +    if ( cppc_data->flags & XEN_CPPC_CPC )
>>> +    {
>>> +        if ( cppc_data->cpc.highest_perf == 0 ||
>>> +             cppc_data->cpc.highest_perf > UINT8_MAX ||
>>> +             cppc_data->cpc.nominal_perf == 0 ||
>>> +             cppc_data->cpc.nominal_perf > UINT8_MAX ||
>>> +             cppc_data->cpc.lowest_nonlinear_perf == 0 ||
>>> +             cppc_data->cpc.lowest_nonlinear_perf > UINT8_MAX ||
>>> +             cppc_data->cpc.lowest_perf == 0 ||
>>> +             cppc_data->cpc.lowest_perf > UINT8_MAX ||
>>> +             cppc_data->cpc.lowest_perf >
>>> +                cppc_data->cpc.lowest_nonlinear_perf ||
>>
>> Where's this ordering spelled out in the spec?
>>
> 
> Clip a snippet from description on lowest performance[1], we may deduce that
> ```
> Selecting a performance level lower than the lowest nonlinear performance level may actually cause an efficiency penalty,
> but should reduce the instantaneous power consumption of the processor
> ```
> lowest is smaller than lowest nonlinear

I can't imply that from the quoted sentence. It describes what happens in that
situation, but it doesn't exclude the opposite relationship (in which case the
described situation simply can't occur).

>>> +             cppc_data->cpc.lowest_nonlinear_perf >
>>> +                cppc_data->cpc.nominal_perf ||
>>> +             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
>>> +            /*
>>> +             * Right now, Xen doesn't actually use perf values
>>> +             * in ACPI _CPC table, warning is enough.
>>> +             */
>>> +            printk(XENLOG_WARNING
>>> +                   "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u),
>> nominal(%u), highest(%u)\n",
>>> +                   cppc_data->cpc.lowest_perf,
>>> +                   cppc_data->cpc.lowest_nonlinear_perf,
>>> +                   cppc_data->cpc.nominal_perf,
>>> +                   cppc_data->cpc.highest_perf);
>>
>> If this warning was to ever surface, it would likely surface for every CPU.
>> That's unnecessarily verbose, I guess. Please consider using printk_once() here.
>>
> 
> Understood
> 
>> Also, is "right now" (as the comment says) still going to be true by the end of the
>> series? Didn't I see you use the values in earlier versions?
>>
> 
> The reason why I added this comment is that in current implementation, we actually
> don't use values read from ACPI _CPC table for lowest_perf, lowest_nonlinear_perf,
> nominal_perf, and highest_perf.
> We read CPPC capability MSR to get these four values.

Oh, okay. Could you slightly extend that comment to include this detail?

>>> +    if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )
>>
>> If either flag may be clear, ...
>>
>>> +    {
>>> +        pm_info->cppc_data = *cppc_data;
>>> +        if ( cpufreq_verbose )
>>> +        {
>>> +            print_PSD(&pm_info->cppc_data.domain_info);
>>> +            print_CPPC(&pm_info->cppc_data);
>>
>> ... why unconditionally loog both?
>>
>>> +        }
>>> +
>>> +        pm_info->init = XEN_CPPC_INIT;
>>
>> Plus is it correct to set this flag if either of the incoming flags was clear?
> 
> Hmm, I may not understand what you mean here...
> I log and set this flag only when both flags are set (cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC))
> _PSD entry and _CPC entry are both mandatory
> Did you suggest that we shall give warning message when either flag is clear?

Oh, sorry - I read & where you have == actually. Hence why I thought only
one of the flags may be set. Please disregard those comments of mine.

Jan

