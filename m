Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7613AE137A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 07:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020547.1396693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUj1-0004No-EH; Fri, 20 Jun 2025 05:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020547.1396693; Fri, 20 Jun 2025 05:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUj1-0004Lj-A7; Fri, 20 Jun 2025 05:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1020547;
 Fri, 20 Jun 2025 05:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSUiz-0004Ld-IZ
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 05:55:41 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31424b9e-4d9b-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 07:55:39 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so956514f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 22:55:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a628156sm1196238b3a.103.2025.06.19.22.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 22:55:38 -0700 (PDT)
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
X-Inumbo-ID: 31424b9e-4d9b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750398939; x=1751003739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=huFiJS4prfytDKetwX3HkCXZJNR5J6F0RiYxcK507vY=;
        b=UQ1MQDPWiKMCKnM1veokR//ecRmecp2rEYh/OewS80xPEm/nkt4CHHCA+fkzZn6MCX
         rdKBk2HbArDLe5T8EwjIcyrYtYuDcVY52EutyZbtodgVJdDnaqA991c7aEWjJMdacd/l
         8xEASPpooMFcBIXjF/vBP/eRGqV7Q/v1F6D9ZWyPLl+m7XmJt/o81h3vFZwrpAl2DJW3
         9HYD0lOzBM75Ch2din4dujUECctnFD/zim2FPdRjyYj71g1t/F0zBcS2xr0r3Cpq9OL1
         N/v3T98qxhxzkANFMou9WFRP0P6tkGhFrnAIGwm1UMbhvEsTeqxKPumH4JLxXTyT9+zd
         e0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750398939; x=1751003739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huFiJS4prfytDKetwX3HkCXZJNR5J6F0RiYxcK507vY=;
        b=cMuoDegKO7xB5Pvor6TWlZlKhcRqTtFdZlMn77fBFh94a/hfqZXNBvbuPtaa1/g2Uk
         1WUmB/orccwU2iqjgQCHS/Qcpsky6wMDv8FLm+ginqqZowRrMiCbiKxetXiFIkSYCqpK
         7NM2IgYfkmIbofccL9PJD+A1gHKEgCGlTBu/UAb4qL8/nQilyrB904U+gSA1BFq4ksGe
         92j/+34mrBVNZA3S8SE7XRMocWtzNmcQUZ1o8cIfhEOcHXZSeFrYAhjTjPqMPydz+Uvq
         8JhLxWCQM8Qhau2O14hS0dsYS4J8M4pUtGQ6GTKjqGzssiiZZezJAX9opnSxUWB6/U/U
         4rtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLoHjwJRpg1vrgoclCJIbl+MOdJIU5phU8G3HkqOYfKR3p1G5xW6NoJ89hws0uTIcgyaKGFHnOuoI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKCAPNeK5xP7VfZmUigyTMfMemcLOH/dXnmPBYSnrB874kG7aP
	Mhu6DDI8sG4k26OgI3/rJ+7cs2B6W159t77KIaU3I664CA6MzsIJkCm6l79R/oNRkA==
X-Gm-Gg: ASbGnculB/3ehloNG4yrGkRdFBFkva87vEkgo1ZzznNX6YcAOgzAKYJtG/jYzPr8dhc
	7hPtyO5dBCMvCmaNX2BKCfwVjqeDhgp4lpqtcQ3TPAlfcB7Y+R+2ORuPKN2GfBycYAwAvaikYZf
	nIPKYv5ogqnXhR8qGV2xSieGzwIE2fQCSRmRs755PGNxeEbXJY3W+P/gGragv7NbJcDlEsvZk9O
	qT2Ll/UmOcCOfBGhFWRiNhgQQuSv8eFzqFVByETyfIfFuqY2Pq3Qu4nbsfN7JS3o2zoHLQyxY4Y
	86HGz9kRCaxLwPWLFI9XGluYWnHBV5nq1bmcEzI8cqolDU/RsfZ7BA1YDAx6Z01W2SOuH2wiOGZ
	rQ0YUN3yOclCRwGXe7pfMrEPt11ICFVyvIWBQwfWwi5W6tL8=
X-Google-Smtp-Source: AGHT+IElxzQcXrnQeDkhcQ6jmrx5M+2pbPw6DdODZHtfEjPbPr0AvzsVyTKsilX4TZ+e+ew3a9fqOg==
X-Received: by 2002:a05:6000:248a:b0:3a4:f5f6:b4ab with SMTP id ffacd0b85a97d-3a6d13044dfmr954468f8f.30.1750398938871;
        Thu, 19 Jun 2025 22:55:38 -0700 (PDT)
Message-ID: <3f0a1d9f-51e6-4203-ba49-5f346640e43e@suse.com>
Date: Fri, 20 Jun 2025 07:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-5-Penny.Zheng@amd.com>
 <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
 <DM4PR12MB845119472EAA75DC986868B4E17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845119472EAA75DC986868B4E17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2025 08:43, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, June 12, 2025 12:10 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
>> propagate CPPC data
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> @@ -635,6 +641,124 @@ out:
>>> --- a/xen/include/public/platform.h
>>> +++ b/xen/include/public/platform.h
>>> @@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>>> +struct xen_processor_cppc {
>>> +    uint8_t flags; /* flag for CPPC sub info type */
>>
>> A common way of commenting on such would be /* XEN_CPPC_... */.
>>
>> In any event, here and ...
>>
>>> +    uint8_t pad[3]; /* padding and must be zero */
>>
>> ... here (and of course anywhere else) - please adhere to designated comment
>> style.
> 
> Apart from Capital for the first letter, do designated comment style include
> format like: IN/OUT: xxx?

Comment style applies everywhere; the IN/OUT annotations in public headers are
generally desirable to have imo, yet for a padding field I'm not quite seeing
a need for such (if the caller passes in zeroes, the field will stay zeroed
unless the hypervisor actively altered the contents; IOW such fields simply
need to be zero at all times).

Jan

