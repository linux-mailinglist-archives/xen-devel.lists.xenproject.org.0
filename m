Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F23B353A9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 07:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093890.1449261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmht-0000YN-Sw; Tue, 26 Aug 2025 05:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093890.1449261; Tue, 26 Aug 2025 05:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmht-0000Wa-QJ; Tue, 26 Aug 2025 05:58:57 +0000
Received: by outflank-mailman (input) for mailman id 1093890;
 Tue, 26 Aug 2025 05:58:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqmhs-0000WT-Qu
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 05:58:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9973b0-8241-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 07:58:54 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso6964800a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 22:58:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f4e42sm6274935a12.28.2025.08.25.22.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 22:58:54 -0700 (PDT)
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
X-Inumbo-ID: bf9973b0-8241-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756187934; x=1756792734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wt3/dzT3rgtyFBF1/8cIv/VlLMj9U6X3hDTyouxVFpk=;
        b=CD4wGEhTsmiAt11SjYjPxLMjwINQ0opz/kQTrLSOgSDWEgUvABrgHs+9n3Y7Sc3NL8
         TgjHAuo1Wi45LfcbqoX1CzlKSsxqikd12cfLWwyKT0HjS7QGWeuxtLhe1xD2zcB7YIwG
         2p7J+s2oJwxz2N5WLsuWxEVx8EIHWxR9dBx6TgIVsbpckeF6GZBdXmZZsCnhqtE6DCe3
         9/9cRpo3kOM1TMNCDx0+2SN+D0hOqD/mzfjRwbfEQK7zW3CCvgiHlV5gOnzS/0/JRNEt
         UN1dHN7f4OS7cdzsgEVD0OW1vTF/oo29GlUqT7bg7jDVpvttduTShXO8fbRE0a9bUg94
         SIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756187934; x=1756792734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt3/dzT3rgtyFBF1/8cIv/VlLMj9U6X3hDTyouxVFpk=;
        b=ptOdkh1lnPZuHSddxDkztRFSmoMLfvbIwYxwX/HQJTWbx8r8VmsTrrlItknSGpCZfu
         K2cXXmaTCQigXxKsuG6kbXcYgTv2sRb5tRispS+BOvgJhWy7ri+WP0lJ3YLfddKxnvz6
         jPIXzl26IA5qeD6U7JaIIaGgNe5NUoybG4aeU/QaAlLIioYgt7+FVR/kNiUHlNIFFrXW
         Xy0jpdJkKGbEhguK6zpG5Ycn0M/mW0Km32LE9BLOKEY5vqW6mOsSET15u2jAo71hst7b
         AwB5BALTb6N8e3eQDvRCk75P821DQvheS59AImqWBy4HRY0vCDzOvXYzbKCs+BvYFsxw
         Sn5w==
X-Forwarded-Encrypted: i=1; AJvYcCUB5TPrF1Du22GcWVl47HsSjUG/CisAHwEyIzSnqqFktww4UB+HSTth7dRcwdm45Tuxfm2B4tXl8m8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZiRMhg0eVklJ6hpjtYCEiaA/JWitAMgsLYSpZD4ViVsovWgFf
	syN3wHw9CzXveMbnKtNoM0y5zUgD6gvxken6mnR5qX3bcildXyiqqkQK520UO/JiNg==
X-Gm-Gg: ASbGncuydMnuta4KPt2Ckx1rbvXlL8IyozAdQL61UPLA94ALYUf8nJYpETelnqM2P35
	url2AWhZfX4kIvK/yQBk/GAE4II/Srf0EduE1r9Xx89+ctpQbx3t23YRH0aZj0GW84bcS7T+pBA
	2wPV8GbGjuPP4uEFSQ18cRQ7Jz7NwxOGQx9M1cIMwI/uruajWN2J3vVJYqGS0UgEZdMeJL2gP38
	q5vzRqgFUvhfMxQIMNeH0A0gYbRH4a8aHrlg6t6obHoHWiX0sAXc5grigRDYSu9VRcslZolVRFC
	y9xAzBPEqdVrGpR4pdAC5rGNxxwsJxJJYqR1t7dDPwxXYZ2A7aqbLBkSD5T14THsuFpHyfBxgix
	q/WJUBDv+l+jtX3xfTGJ4CzgCyDpJRrZt8x5/0N9Uh63/zTZ6SdHl8W2z3ci0RBD7SAUrr7JcK0
	6/g3Wn6Pw=
X-Google-Smtp-Source: AGHT+IEH/RIt0o7c7WjgbjbQ45O8W2DsGs3eyxlzdPhSRqai7z8a8S2QPwNVBTVXlBd4H7lZLySTBQ==
X-Received: by 2002:a05:6402:13d2:b0:61c:6fd2:9700 with SMTP id 4fb4d7f45d1cf-61c6fd29962mr4639327a12.24.1756187934257;
        Mon, 25 Aug 2025 22:58:54 -0700 (PDT)
Message-ID: <927867b4-0cda-4600-b880-e5b1d9c2fbbf@suse.com>
Date: Tue, 26 Aug 2025 07:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-7-Penny.Zheng@amd.com>
 <a4c5e149-828f-4ea9-83e2-79ecc8c56033@suse.com>
 <DM4PR12MB845136B4B4FA756EC654FE31E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845136B4B4FA756EC654FE31E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.08.2025 07:53, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, August 25, 2025 11:02 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v7 06/13] xen/cpufreq: introduce new sub-hypercall to
>> propagate CPPC data
>>
>> On 22.08.2025 12:52, Penny Zheng wrote:
>>> --- a/xen/arch/x86/x86_64/cpufreq.c
>>> +++ b/xen/arch/x86/x86_64/cpufreq.c
>>> @@ -54,3 +54,22 @@ int compat_set_px_pminfo(uint32_t acpi_id,
>>>
>>>      return set_px_pminfo(acpi_id, xen_perf);  }
>>> +
>>> +int compat_set_cppc_pminfo(unsigned int acpi_id,
>>> +                           const struct compat_processor_cppc
>>> +*cppc_data)
>>> +
>>> +{
>>> +    struct xen_processor_cppc *xen_cppc;
>>> +    unsigned long xlat_page_current;
>>> +
>>> +    xlat_malloc_init(xlat_page_current);
>>> +
>>> +    xen_cppc = xlat_malloc_array(xlat_page_current,
>>> +                                 struct xen_processor_cppc, 1);
>>> +    if ( unlikely(xen_cppc == NULL) )
>>> +        return -EFAULT;
>>
>> I think we want to avoid repeating the earlier mistake with using a wrong error code.
>> It's ENOMEM or ENOSPC or some such.
>>
> 
> Understood, I'll change it to -ENOMEM
> 
>>> --- a/xen/drivers/acpi/pm-op.c
>>> +++ b/xen/drivers/acpi/pm-op.c
>>> @@ -91,7 +91,9 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>>      pmpt = processor_pminfo[op->cpuid];
>>>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>>>
>>> -    if ( !pmpt || !pmpt->perf.states ||
>>> +    if ( !pmpt ||
>>> +         ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
>>> +         ((pmpt->init & XEN_CPPC_INIT) && pmpt->perf.state_count) ||
>>
>> I fear I don't understand this: In the PX case we check whether necessary data is
>> lacking. In the CPPC case you check that some data was provided that we don't
>> want to use? Why not similarly check that data we need was provided?
>>
> 
> We are introducing another checking line for CPPC is actually to avoid NULL deref of state[i]:
> ```
>         for ( i = 0; i < op->u.get_para.freq_num; i++ )
>                 data[i] = pmpt->perf.states[i].core_frequency * 1000;
> ```
> We want to ensure "op->u.get_para.freq_num" is always zero in CPPC mode, which is validated against pmpt->perf.state_count.
> We have similar discussion in here https://old-list-archives.xen.org/archives/html/xen-devel/2025-06/msg01160.html

Indeed I was thinking that we would have touched this before. As to your reply:
This explains the .state_count check (which imo wants a comment). It doesn't,
however, explain the absence of a "have we got the data we need" part. Unless
of course there simply isn't anything to check for.

Jan

