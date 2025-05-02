Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB4AA728A
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 14:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974670.1362463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uApoc-0006oh-H1; Fri, 02 May 2025 12:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974670.1362463; Fri, 02 May 2025 12:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uApoc-0006lZ-DC; Fri, 02 May 2025 12:48:30 +0000
Received: by outflank-mailman (input) for mailman id 974670;
 Fri, 02 May 2025 12:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uApob-0006lT-CF
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 12:48:29 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc074605-2753-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 14:48:24 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso3251392a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 05:48:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b70sm1200519a12.29.2025.05.02.05.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 05:48:23 -0700 (PDT)
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
X-Inumbo-ID: bc074605-2753-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746190103; x=1746794903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kfROYIzqlybIUGbRuA6q37zGqiTVAb0hovsYhAl8wuA=;
        b=RlZB6PP5f3nLw65XJi9JJ8V+BAkXj2cO5pA/6cjMu+4IaMMCwSrWzjVT4wlRyUEjpa
         QoXq0mFhY531SciK1mVfJ8q4jpRX9mWjcRNcZfnbMcZ7bF0BTKwbsZrW/kCGD8oPgy0Q
         6lxA9iiIuu2ektj4aUpNTbYo19JEsQEhtT0OYMDMEiAWZC9mTkNVHwWgJyBby+QLir4x
         ulK/IPQYEerc6Az1fJo7UjuIXqxdNN7S5VkrDvk3i6mScc3P37BvZ+MlU4Mz96ji3okT
         albRiyEW4D/Q7ZCUuVXsSVQNrIqE5WHGTjI6z88fv3dsTilHBUm6UpUE0nMyOiKGd7xx
         jE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190103; x=1746794903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfROYIzqlybIUGbRuA6q37zGqiTVAb0hovsYhAl8wuA=;
        b=aAayDs+MAoq3Vu3S3eOTGGoanFtQay/A5tZv5Oh+UDD1hVfseoUlWY4kAuytYB4NwS
         PKDOLUleglDkKuYNVANGapfEir5hjNH87kYhqW6OzwwQps/l2X8RP9qPb61JI20KUKFY
         N028aQkeWxfihI71txl4hUabwvKxOvUpjns3Bx6wLiJ6SHvZ9BAcOLgHwVRJVcAK/Q/S
         rd9ozcB7UxlfxEGjz6QwGwL+R4wCQcJHCN9zbUleM09YO9OJyFnN226iFZgRz3AkzH/v
         5wGliCz+4dXE7u6/rx3321rNB8v1r4O2vxczOJ6Xu0VitdBCqMO59UBtYUGzk3rMILHF
         1RbA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHL5cTDpbB13roBEEYTQcZnyXxGaTRAj0UxrK2qpiGkt+THJkXWhcvOK3E+HKhcJ9CO1Is1scsyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKCC1CAkSEr5tBY6fhGIcbRSKdTiP9ntqP4HWvuWgNMwbmKvOV
	fImPHPQA1HM2O8i4MjIKIMNqmR2E+1lFgfQihpu7QNI34ebMMJU2XV7sIO7VaXRhm1aMdx8ScV0
	=
X-Gm-Gg: ASbGncubSEhyciDk6I9vp+JmW5PXbRPE0oSZnAn+XTceEoorfFeExDdHugIzyCQtiPu
	55sN8n/QQtoM3Ptr8iXLUPSakuFZvod/50C12NqdLGgSYhYYP1u0pROEdipE1cArCanE2Fn8cHe
	mGjD7QdFyQYjefLbvQqh1jT9/zTcNBUklzWZB4ZnMcpVEHwh6o1Z4+XQKpRkIK9AZM8GANigo4u
	0C4tmxI29MPxbeow3BNiegH5aEkEeQ3eRIlxhUeeShb07A+kNYsKj4MPDiXcO5dKo33NWSdokx0
	v36UdoElQ4+3CFAD95m3eFsVIX600acf5MaK4DiUMdAJj0y20qih37PA2+pPe1SvO/cMo7FhIY+
	vwNZ9ggDx7oYNcXF1BPm1M2NCcQ==
X-Google-Smtp-Source: AGHT+IGA6jRzWNhQw7ZbGZdHsyw6MwEtvPi4Ixp9YTzWHwVJXptNOfDLpxxmbI0JVLuZobITuwrXbw==
X-Received: by 2002:a05:6402:5216:b0:5f6:22ca:8aae with SMTP id 4fb4d7f45d1cf-5f919836912mr5313383a12.2.1746190103472;
        Fri, 02 May 2025 05:48:23 -0700 (PDT)
Message-ID: <677b6100-a53d-4ac1-aa88-9ed988f7b84b@suse.com>
Date: Fri, 2 May 2025 14:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] xen: Introduce physaddr_abi CDF flag
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744981654.git.teddy.astie@vates.tech>
 <df0da6d56a9a9ca440b7bb2c7c0b71d66567e3aa.1744981654.git.teddy.astie@vates.tech>
 <238c657e-a53c-4eaa-84aa-1d3310b65723@suse.com>
 <ec06a030-3983-4689-bb8d-bbd523e820d4@vates.tech>
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
In-Reply-To: <ec06a030-3983-4689-bb8d-bbd523e820d4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2025 13:55, Teddy Astie wrote:
> Le 30/04/2025 à 17:59, Jan Beulich a écrit :
>> On 18.04.2025 16:18, Teddy Astie wrote:
>>> @@ -745,6 +747,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>           return -EINVAL;
>>>       }
>>>   
>>> +    if ( physaddr_abi && !hvm )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "Physical address ABI requested for non-HVM guest");
>>> +        return -EINVAL;
>>> +    }
> 
>>
>> Why this restriction?
>>
> 
> physaddr_abi changes how copy_from/to_guest works to make it use GPA 
> instead of GVA. As non-HVM probably means PV guest, it would mean 
> something like PV guest hypercalls uses physical addresses (derived from 
> MFN?)

Machine addresses, yes (hence MFN). If it was PFNs / (pseudo-)physical
addresses, ...

> instead of virtual addresses, which would not really be practical 
> for both the guest and the hypervisor.

... I'd maybe agree here.

Jan

