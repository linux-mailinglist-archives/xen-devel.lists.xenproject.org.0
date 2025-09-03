Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C0B41702
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 09:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107917.1458101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uti7N-0004BE-NI; Wed, 03 Sep 2025 07:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107917.1458101; Wed, 03 Sep 2025 07:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uti7N-00048s-KU; Wed, 03 Sep 2025 07:41:21 +0000
Received: by outflank-mailman (input) for mailman id 1107917;
 Wed, 03 Sep 2025 07:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uti7L-00048m-Vh
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 07:41:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60c9ad76-8899-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 09:41:18 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so503317566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 00:41:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0427c0d4cbsm714577166b.45.2025.09.03.00.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:41:17 -0700 (PDT)
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
X-Inumbo-ID: 60c9ad76-8899-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756885278; x=1757490078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KAvnL5SRF5Lo+M2iHOGAS/PugArumXQv5xsmK4GAAu8=;
        b=PsBbYdZOT84y7M1VH5OMrkOyfpB58CQLzJZnD5Z+CtOJ+nOdVIt5A3BK4wSPbmTBJB
         OyE02Xbijxfb8yfYD1LWzBj8PFS50Xthv/nRvdTiUbAxd9ySh9dNAZP4dU75er5xE8Dk
         anA/UQGevV45yVYFQhpkdq8pDwb8YDanXYcVRKJYCbx5nqjqxnrNLgg3jD0wU4Hu8NUq
         3v77ufBUB/zvrnodCy6SnvaYKiNQYHEImLi8UDdHhrXu2YMLtrkBSTqwphelu0lmTv5P
         UGw9Rj1aMVcgy+Y42aLUpwD75RHMmIu0y3DpdiUFIZ28UTmH1vB3D1vStkSkQ5ekPN+H
         gf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756885278; x=1757490078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAvnL5SRF5Lo+M2iHOGAS/PugArumXQv5xsmK4GAAu8=;
        b=AsoHbTrz3b0UGvysscQZpZhFdSyirwP8jYG94qR9u2BnKIU7nCV16LWn9E6EbJY7g6
         JaXbf/4Cg/3XfzjTQP7jXBbCsaD2HsgxX61mN2YYZCIaYrkHc+QwO9YH7fpA2idSGmDK
         drfIhnLaOsads7yHXY0q6L+K7VyHEg/7PQEM6kXDcDBT3R4RnYi+aHIUNYpk38//lou3
         YvrSBPeXQfcj1M4pdQx8VKkA8lPlCOzKcN+Y5YFsf4ivMFQ+YekeKGlVrtgX2iHqjcrN
         7Y2qiZl1WPCl5jF76RXNtzNgBnQMCd4MKnPS4GC+45vrpcI3PoXX9cvtpRDpcBYm7Pf0
         WwgA==
X-Forwarded-Encrypted: i=1; AJvYcCVnrxjzya+UDVDsdHIzvsaGzpGFD2dVsnzr9q+fLfjrD/UahB85FcQqqlgyO0pmjMGO0WkjYx/7mT0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ0muf6/K52RT7Yy6l5wPTcW3h0W7jk40O8kl65js9wxL1RSf+
	r+/zUm4VScF9nlyCp7l//LesqegjlpuCUTMTtIS0vAh5QGVu1gI37Bd2nzE/RD1iBg==
X-Gm-Gg: ASbGncuBAxPVd4DKBRoVQDeohgyWui00uH1Nw/RR+8OIkA+HhoT3Hg8vtkAQuz7n7Vk
	aX1ehcVslGfPAsHEh5q0TfWdml4nSWSGGTgTZDKsbWC93GHbRcScO1zziyOg7FN0cl4hnY8Ny3J
	VwPXz2bbgCgp4UvrpJE5+HKuflNccfRE8Ok9EAGeaXjUu/qNAsxTw706NrLvxAIq3KUggk6Jr/k
	m57/tsjghS1D4EwHBqJPeDIEh0Rm8RPw/2DROWH7REt1eAeeV36QF9gYHOx2HBH+prclA8XLGe/
	yx592gc8iGLRDhI7rSZQWs2t2d9OE963DDhcXrciS/qmBICapzcltKWFk+dhkdeHjUf54lACnYM
	fECyamO+xhN7yTMv/Dbh4/57+k5jI4Mgn9RwAEcR9J5vnD1p+ItHJz+YzVWG6VUHVVUomn+Tl76
	ilR/DNTDs=
X-Google-Smtp-Source: AGHT+IFkMihsqnaS9GprkQ0zfoziB9ZtGqnlNRhuR3tny2FbLUOJkaBnkDARShsHiFRLzr12kMqKCQ==
X-Received: by 2002:a17:907:928a:b0:b04:5b3d:c31f with SMTP id a640c23a62f3a-b045b3dc692mr377292066b.49.1756885277887;
        Wed, 03 Sep 2025 00:41:17 -0700 (PDT)
Message-ID: <5934de0f-2bdd-49a3-8159-f1af4ce5b4e3@suse.com>
Date: Wed, 3 Sep 2025 09:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
 <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
 <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <7ec5e23e-2415-41b7-ab3e-7b0a7007bd1f@suse.com>
 <DM4PR12MB845194FD2BDFA3930CA066E5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845194FD2BDFA3930CA066E5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 08:46, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, September 3, 2025 2:22 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; xen-devel@lists.xenproject.org;
>> Andryuk, Jason <Jason.Andryuk@amd.com>
>> Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>> xen_sysctl_pm_op for amd-cppc driver
>>
>> On 03.09.2025 05:14, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, August 28, 2025 7:07 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>>>> <anthony.perard@vates.tech>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>>>> xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>>>> xen_sysctl_pm_op for amd-cppc driver
>>>>
>>>> On 28.08.2025 12:06, Penny Zheng wrote:
>>>>> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct
>>>>> xen_sysctl_pm_op
>>>> *op)
>>>>>      else
>>>>>          strlcpy(op->u.get_para.scaling_driver, "Unknown",
>>>>> CPUFREQ_NAME_LEN);
>>>>>
>>>>> +    /*
>>>>> +     * In CPPC active mode, we are borrowing governor field to indicate
>>>>> +     * policy info.
>>>>> +     */
>>>>> +    if ( policy->governor->name[0] )
>>>>> +        strlcpy(op->u.get_para.u.s.scaling_governor,
>>>>> +                policy->governor->name, CPUFREQ_NAME_LEN);
>>>>> +    else
>>>>> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
>>>>> +                CPUFREQ_NAME_LEN);
>>>>
>>>> Isn't pulling this ...
>>>>
>>>>>      if ( !cpufreq_is_governorless(op->cpuid) )
>>>>>      {
>>>>>          if ( !(scaling_available_governors =
>>>>
>>>> ... out of this if()'s body going to affect HWP? It's not clear to me
>>>> whether that would be entirely benign.
>>>
>>> HWP has its own unique "hwp" governor. So, imo, it may not affect.
>>
>> How does it matter what (unique or not) governor it uses? The relevant aspect (to
>> me) is the !cpufreq_is_governorless() check that previously guarded the copying
>> of the name. (It would be another thing if this was benign to HWP, but such would
>> need clarifying in the description. Cc-ing Jason just in case.)
> 
> Sorry, What I mean is that HWP do have a governor, so such copying of the name shall be benign to the HWP. I'll clarify it in the description

FTAOD - "shall" isn't enough, it needs to be (provably) "is".

Jan

