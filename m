Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9DAB3C9C
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981779.1368190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVLN-0007Z7-Sg; Mon, 12 May 2025 15:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981779.1368190; Mon, 12 May 2025 15:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVLN-0007Wi-PI; Mon, 12 May 2025 15:45:29 +0000
Received: by outflank-mailman (input) for mailman id 981779;
 Mon, 12 May 2025 15:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVLM-0007Wc-74
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:45:28 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 201cb33d-2f48-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 17:45:27 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fc8c68dc9fso2264054a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:45:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fdd088798dsm2253874a12.13.2025.05.12.08.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:45:26 -0700 (PDT)
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
X-Inumbo-ID: 201cb33d-2f48-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747064727; x=1747669527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uLZ5lLRzqSOVbBVCu0uKzeU1eltQpxxmcZdkkSjHSuM=;
        b=RKg/OdwCn/LT4y8AemptvfXWrCgLhgATymmIDZXb0cFHn2tlTqbk6jUmLCVxoK8xci
         4eMIaceLXkgWz1giD+h+/CyaeDmOXmfBKsp8XIZFUYVV46XX6Ss7T0wABJ8n1DPajJya
         qxdMoJT0BRg5NP7i9xU4tKAIZ2fCnEsbqQ7NaAbwSSIkTDel/i5SSg3mFOrPIKatxtBu
         TaEM0/CE63umlQztsr+U8yF18/NwLHGVRi/PMUnnF1MhpW7HkSjevemJigT4M4an8tMr
         41KTwBVdVFDTsY0coDtfNq0KrUKlD9E9OZZ9VcNAdg/2hYcgXlbEx5APBzY27Jc5F+Vl
         DmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064727; x=1747669527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLZ5lLRzqSOVbBVCu0uKzeU1eltQpxxmcZdkkSjHSuM=;
        b=ExDb0YzdpzknOOW2sKhaQ+bUCyfgU45jSDYpHf2RW3tsHABsfXUUJIiMFMFH2zFPlQ
         n+sH0S3hGfWPTexPESu2Fe/UeALbxQsBYaS5yrfTfwzobWTErjckHf0NS3d9pWTC63iQ
         eet4nxWgJVH1MLjDPhEzqoOrYgDiVtvTDSI16aZlJeZqppxm7uLkoCreXTwN9Pj6emgn
         3Uowri/i6yugN5k/IoVar6/qKIViUinb3/OzxmipdqwGY2GHpE0cw0gIGjUehNQmym9F
         WFo15Bfj0XtigG4SE1IOWJorfd7NE3cCB4MYjnZEjssUSoo+jKdTkdvZEhi9kqF6w/q1
         UGwg==
X-Forwarded-Encrypted: i=1; AJvYcCVy2+iDLVSsgNuOb4VQyDJ4IQueNbsQgvF1wWjLww9Ux8IVE3/LoYDlD/71htVDw93v5Fh18UQlTYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/m18tICVhllzga54JcvzF5s5yHCrFNwiV+kHvn1zBsIVexdOM
	ugha67XKzocfBUfTq+4FlEYPRpXyrjBq794GmfOuZjqXYdLaxUjnk9D7Jv6ojA==
X-Gm-Gg: ASbGncseToMU6sj7MARmb5o7CL8kliqCuRwuPei+3uXk0rPQMXrpWEENQV16DYE++Wl
	PP9vKq230swjRWHuv4AqqQO2UvsIA2GHD+oz427FHw+V3rLzKAm/A/YEDrXdryLbLpOg7Ts2x9b
	g9skXNcrQwxZMUi/rQCkKZ0sZaxCWFmxPo1QjpgYzpdu88QrTOA5NTR4RRuAUY5pFcxgzHiHLjr
	+bb1px/GMcKLFboPH2pRYSEktGGYC8iCDd2vO7dmtuydOOsh6ySuuVCGKqvqOJUAaAsiYJ7Do82
	3G8RnqQxGmnkKRH+ZHWeRh9v1+86yeBb6edKs4Dm28qRUIwCWvi+4I291FIJ4axul6g/dk84Kbi
	/wlcyLJa49zIl3BfwAGNWQ8j/4eB8/Qfhs6zZ
X-Google-Smtp-Source: AGHT+IHMqsV4licPo7r9WTATzWX6lkhuiLc6xNTR2H8r9rWKaQUn3U7AwAENEjvSpjRwAzcWzE7+TQ==
X-Received: by 2002:a05:6402:378c:b0:5f8:357c:d58c with SMTP id 4fb4d7f45d1cf-5fca11e5e51mr10245749a12.34.1747064726313;
        Mon, 12 May 2025 08:45:26 -0700 (PDT)
Message-ID: <e79f6143-e8c3-490f-9f01-f4c99134c318@suse.com>
Date: Mon, 12 May 2025 17:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
 <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
 <DM4PR12MB8451CF34EE2A52B8D8A42369E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451CF34EE2A52B8D8A42369E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 09:22, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, April 28, 2025 11:32 PM
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>> +    {
>>> +    case XEN_PX_INIT:
>>> +        if ( shared_type )
>>> +            *shared_type = processor_pminfo[cpu]->perf.shared_type;
>>> +        if ( domain_info )
>>> +            *domain_info = processor_pminfo[cpu]->perf.domain_info;
>>
>> Does this need to be a structure copy? Can't you hand back just a pointer, with the
>> function parameter being const struct xen_psd_package **?
>>
> 
> I've considered handing backing a pointer, then maybe we need to allocate space for
> "struct xen_psd_package **domain_info = xvzalloc(struct xen_psd_package *);", and XVFREE(xxx)
> it in each exit, especially cpufreq_add_cpu() has a lot exits, which could be a few code churn.
> So I chose the struct copy to have the smallest change.

I fear I don't see why such allocations (of space holding a single pointer)
would be necessary. Afaict all you need is a local variable of the specific
(pointer) type, the address of which you pass into here.

Jan

