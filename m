Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A3B43BA2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109986.1459344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu96a-0008O3-GX; Thu, 04 Sep 2025 12:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109986.1459344; Thu, 04 Sep 2025 12:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu96a-0008MB-D7; Thu, 04 Sep 2025 12:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1109986;
 Thu, 04 Sep 2025 12:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu96Y-0008M5-Fg
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:30:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e974adba-898a-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 14:30:16 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61cb4374d2fso1431967a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:30:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ded4749aesm10028832a12.32.2025.09.04.05.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:30:15 -0700 (PDT)
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
X-Inumbo-ID: e974adba-898a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756989016; x=1757593816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zx/hmlFxLP2KrveGa5u82+pZv7SJoB//hblsQ8YInIM=;
        b=SQnjVtHtB2DOMlZ8zib5eCOIcmQ6RoyUWfUYa/MZUJxFLba0bBzhbL36Ey2LKmWUQX
         hyBJX3RZUS3LGhnMHY0xf+Xz3elANd+DW9FBk32QIA9E1DBBLEOJVvk+iHcOLZisvFr0
         IE/C/QPtwzJcQYhttwoBiCIxZtwxF0qqwQVBDDUp4mPHyqMgsUeXEhJ0Vz2M2/DyZS8E
         qj7x0ngftThQpW9/D/vfgJLL2vBXNg2VcO6LikQeoSqSdbPk57fxDDmKKrSOBKF/HZ0R
         ihKINY0qT5iuhStzeF6Z6Ih38cccNaRIRVVyBE6DfBlDx/XtTFlQBErNKcMq88CSWWjV
         5gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756989016; x=1757593816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx/hmlFxLP2KrveGa5u82+pZv7SJoB//hblsQ8YInIM=;
        b=LAiaDBzS6GQb8YGZRJsMhnUNfCE5aiux7yNnITCsDJ0l9m45aaKjMpOjVsaHraQ6/s
         NsYhk51tlO0p69r9JwN+3NX5mO5NP2G3NLv56wnzvPfDIy8a+AqsnKlNrWkz7mHMqT9D
         MO/3Y0wNck41RT6+/YqYuH0UOIb3otyZNAk8QtHDo4Y01snKHgeivvO9AoQ7khoUNixG
         nrD+6wSYsRup4hi+DAzIVaXY43FmVQ43j23vdkcB2hzACRLsIeHB5yTRrxG3vJD7NHeC
         gW75oLKUIFgZnRCZ992QdTpaURv5mHV1T7rBqbXVSrYznC88gWvUVF6jfEMOKf4JE6Z+
         5XNg==
X-Forwarded-Encrypted: i=1; AJvYcCUAGJ+on5WHYb4mLerCdRjJLD3HPeBCN6VoNidsxIjQJx0icgGBUy070FmQhtVaFyk4xnPHo1B5164=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2haczN/48YxcYCN0NoQbtOli/Kgk/MFUTwjBNMI9Whhc1mhq3
	iUdeci6sN10yQwmJWIkFtj6QiZYb7/uXvk/+Gdj9nwuDDLqW1A5aD4UJm5TnONVo7A==
X-Gm-Gg: ASbGncvLxlu6aRtZnfs1N6ezEYD/ryJXEaK5SFEvtI1MSdyjDheXF0kv9lkc8Cr1Vbr
	t7tz688rFzjX0/+UVyIbXjddYoCxDKWm9Yddc6D4LS8uqhML3UypYcDvg1GFmSifUn8ODWq2NfF
	YdNu3jVFa5XShI2PfSXfWbe7++QH8WQI/7/2U3oqtRwMba8wTsnBGKFzaG60ce0tVzSncmJoEQQ
	xWgVLpSstm7i2kYpd07OuxmECxt2hcmF1fteGv1DQo5/jkO+OiYzkTsn3vjGt7XQfTx1yrxl48i
	MBCY7AOlf+hk81pW8W3IDx9Zpj/cMh2lvRrgV8aGVMu+SdVKC0xZOHKYmTvTN7lgcb/4/YOYntC
	2mqbgfsqBJmiE/oynNGiJ6kOjCb17wm8NtrjCqkFGogAu/zb4WeILYSRbRrPnA9qh7yWuF97yYj
	eeW7ryFqI=
X-Google-Smtp-Source: AGHT+IEb6iIc0jRozbcXayisHqVHi2Y2Bp3vhP3PmwZp3Y4+epRa1lTFD8YBzS2ObwMvoArfRT7RTg==
X-Received: by 2002:a05:6402:3594:b0:61e:49dc:171f with SMTP id 4fb4d7f45d1cf-61e49dc176fmr13140088a12.1.1756989015811;
        Thu, 04 Sep 2025 05:30:15 -0700 (PDT)
Message-ID: <d9913c35-b1bc-4a64-876f-0378f6bd36f5@suse.com>
Date: Thu, 4 Sep 2025 14:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Jason Andryuk <jason.andryuk@amd.com>, "Penny, Zheng"
 <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
 <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
 <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <8ab89125-4693-4d9a-b9a3-b8ab38b1908f@amd.com>
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
In-Reply-To: <8ab89125-4693-4d9a-b9a3-b8ab38b1908f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 20:17, Jason Andryuk wrote:
> On 2025-09-02 23:14, Penny, Zheng wrote:
>> [Public]
>>
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Thursday, August 28, 2025 7:07 PM
>>> To: Penny, Zheng <penny.zheng@amd.com>
>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>>> <anthony.perard@vates.tech>; Andrew Cooper <andrew.cooper3@citrix.com>;
>>> Roger Pau Monné <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>>> Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>>> xen_sysctl_pm_op for amd-cppc driver
>>>
>>> On 28.08.2025 12:06, Penny Zheng wrote:
>>>> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op
>>> *op)
>>>>       else
>>>>           strlcpy(op->u.get_para.scaling_driver, "Unknown",
>>>> CPUFREQ_NAME_LEN);
>>>>
>>>> +    /*
>>>> +     * In CPPC active mode, we are borrowing governor field to indicate
>>>> +     * policy info.
>>>> +     */
>>>> +    if ( policy->governor->name[0] )
>>>> +        strlcpy(op->u.get_para.u.s.scaling_governor,
>>>> +                policy->governor->name, CPUFREQ_NAME_LEN);
>>>> +    else
>>>> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
>>>> +                CPUFREQ_NAME_LEN);
>>>
>>> Isn't pulling this ...
>>>
>>>>       if ( !cpufreq_is_governorless(op->cpuid) )
>>>>       {
>>>>           if ( !(scaling_available_governors =
>>>
>>> ... out of this if()'s body going to affect HWP? It's not clear to me whether that would
>>> be entirely benign.
>>>
>>
>> HWP has its own unique "hwp" governor. So, imo, it may not affect.
> 
> get_hwp_para() writes into the same union:
> op->u.get_para.u.cppc_para
> op->u.get_para.u.s.scaling_governor

Not anymore as of "tools/cpufreq: extract CPPC para from cpufreq para".

> Which is why I avoided it for hwp.
> 
> I guess writing scaling_governor first and then overwriting it still 
> ends up with the same data in cppc_para.  Seems a little messy though.
> 
> Penny, I'm confused by this comment:
> +    /*
> +     * In CPPC active mode, we are borrowing governor field to indicate
> +     * policy info.
> +     */
> 
> You have CPPC active and passive modes - which uses a governor and which 
> uses get_cppc?
> 
> It seems like only writing the scaling governor inside
> if ( !cpufreq_is_governorless )
> 
> should be correct since it's using the union.  Am I missing something?

The union is now fake; it has just a single member, and hence would better
be dropped. I've commented correspondingly on v9.

Jan

