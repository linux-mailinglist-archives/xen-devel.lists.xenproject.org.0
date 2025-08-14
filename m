Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C1CB25BF3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 08:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080742.1440952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRdC-0004At-BZ; Thu, 14 Aug 2025 06:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080742.1440952; Thu, 14 Aug 2025 06:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRdC-000490-7l; Thu, 14 Aug 2025 06:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1080742;
 Thu, 14 Aug 2025 06:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umRdA-00048u-Vh
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 06:40:08 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84a65f15-78d9-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 08:40:07 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b656f21so675808a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 23:40:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23bedcsm2539279366b.120.2025.08.13.23.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 23:40:06 -0700 (PDT)
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
X-Inumbo-ID: 84a65f15-78d9-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755153607; x=1755758407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SHDRJqvvTrdBtTQuvivlBPdXEncrA5oFnrfcJFBd19o=;
        b=FrSRvmNIy/6UJ/X0Ae9d/ZP3s4BI9d01AutX9yPBjPv1/rAl49mvncvTA78rr5IkyA
         pcArKDbAwA2Xv+vp//TZOxPkDe0ppkeIpQWoNjXvkZIPQkAmbQKElp/mxCYJMNvBFjeD
         kLt4jmu1yXiz6f0l9aAq1bKkS+5Klg8EfxQXvzHi7uSMpqHAb024XkbooSl3m52yNuh3
         EIpOuDyM89TB/RJWtkDLYAWma1radeU4gYrnDxq9M3KotE0H51vQMSyFBhJ0643TVEOz
         sM408SXLZ9Xtws2TeGnABDY7k58b1xSBYrVo5IPFfw9aXNxexJ2G1PL+e8P7hgDDF+iz
         Q8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755153607; x=1755758407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHDRJqvvTrdBtTQuvivlBPdXEncrA5oFnrfcJFBd19o=;
        b=v7CcQOF7WYfJ9laUAnapUPdYo05JOzFTncpli+XI3YiTRhHtA1fHVPJR9Vco1OpQcX
         ITf/qEZ2nAcv4tMNvOWD56FsS1aAF47qGGJ2A68qDbH3A/T0oD7JO5lacqgrzw8x2cGy
         wpsz+Q31ggsMtYwjwppddVTuy6WlpsU+Co/c+8/7T0H8Ex24RGtabWgbMHfeYYxZySIo
         SoAR0XmF9QN5H7bSgxnosEjg5gNKzfG+klCpokv5RDC4PSiMTTxBklILuQj5C2V7kQxO
         Uz6Yk9aTRBwE8pbBDHbJZD1MyWvDE8XEhoq+ZB5oDUR/2KV3XG/K/4trQf8Rm2c0al2S
         z6bA==
X-Forwarded-Encrypted: i=1; AJvYcCVNOXn16ZaLjuGweQF4oBejr/0tzWkRaQbIlhaLIVEpCmdw3DQRYciwJmNmP4B7QljvEV8js9QJmp8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykBwZSrQzoLVXraDLjC65yUXGcAPXHCMBG774vLomJp2tG/lVE
	OPjipkykWOE2bnzplqxMyAW2wYf1pE6YGYzLOXnMJs+pwHPEPrurCZRqM+V72q/vUw==
X-Gm-Gg: ASbGncux6710aaZL0JHPN5Edi5dCeFqABF3uOmgzkd8SdqaA1UgrYj4ctxS6CR8EMhi
	KF5I7OxFsDlF/LtXlkaIA4Z3zmFP09GpWUqRwcnJfT4M5vOrf1dUdSxTNLQgfeNTZv5ZAXSg9Kc
	AHUNs8ETC39EZaLn56A6MUKIXPmY9kAyZ0/4igyzaEyizYFnkr21XJXAkT2XFyoIu90/5pCduyB
	y9fFDsUS5P7lfr2682omj9libvuTsfXELZPVpIw+W+2aNwCYhypSsmlZeeD3gamboon/UM77I3h
	y+VepRqSy1UI6SkTcKTpMwtO6o6p+gQ8BJ+KAv5eCw4nq92EtVP4aeyMzD9icIX7HxNFGmLm0zY
	YszUYii/3VBZlTY51aJH7RFvU4zFLdqwSHxT1RntkOOqjTBbEf6YhHwT2VrCuSps+PD+y5lmcOD
	3rXP209n4=
X-Google-Smtp-Source: AGHT+IE6l+PcNgmF6mDeR/KHUzEwOxaJrISN1ElOCHN2dlA3Qm4zmhzy3MJlXnDV389MV78c2QPj5A==
X-Received: by 2002:a17:906:3b8b:b0:afa:1be7:3136 with SMTP id a640c23a62f3a-afcb996c60bmr122610866b.51.1755153607027;
        Wed, 13 Aug 2025 23:40:07 -0700 (PDT)
Message-ID: <98aa5a7b-5268-41ae-a1d5-25028b0704b6@suse.com>
Date: Thu, 14 Aug 2025 08:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-20-Penny.Zheng@amd.com>
 <796a9251-8b4f-4266-a31e-828d4da29f54@suse.com>
 <DM4PR12MB845131A7E81BD54B0334E3B2E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845131A7E81BD54B0334E3B2E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 05:13, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, July 24, 2025 10:44 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>> xen_sysctl_pm_op for amd-cppc driver
>>
>> On 11.07.2025 05:51, Penny Zheng wrote:
>>> Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
>>> SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.
>>>
>>> In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
>>> "processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to
>>> deal with cpufreq driver in amd-cppc.
>>>
>>> Also, a new field "policy" has also been added in "struct xen_get_cppc_para"
>>> to describe performance policy in active mode. It gets printed with
>>> other cppc paras. Move manifest constants "XEN_CPUFREQ_POLICY_xxx" to
>>> public header to let it be used in user space tools. Also add a new
>>> anchor "XEN_CPUFREQ_POLICY_xxx" for array overrun check.
>>
>> If only they indeed had XEN_ prefixes.
>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> v1 -> v2:
>>> - Give the variable des_perf an initializer of 0
>>> - Use the strncmp()s directly in the if()
>>> ---
>>> v3 -> v4
>>> - refactor comments
>>> - remove double blank lines
>>> - replace amd_cppc_in_use flag with XEN_PROCESSOR_PM_CPPC
>>> ---
>>> v4 -> v5:
>>> - add new field "policy" in "struct xen_cppc_para"
>>> - add new performamce policy XEN_CPUFREQ_POLICY_BALANCE
>>> - drop string comparisons with "processor_pminfo[cpuid]->init &
>> XEN_CPPC_INIT"
>>> and "cpufreq.setpolicy == NULL"
>>> - Blank line ahead of the main "return" of a function
>>> - refactor comments, commit message and title
>>> ---
>>> v5 -> v6:
>>> - remove duplicated manifest constants, and just move it to public
>>> header
>>> - use "else if" to avoid confusion that it looks as if both paths
>>> could be taken
>>> - add check for legitimate perf values
>>> - use "unknown" instead of "none"
>>> - introduce "CPUFREQ_POLICY_END" for array overrun check in user space
>>> tools
>>> +         (set_cppc->maximum > data->caps.highest_perf ||
>>> +          set_cppc->maximum < data->caps.lowest_nonlinear_perf) )
>>> +        return -EINVAL;
>>> +    /*
>>> +     * Minimum performance may be set to any performance value in the range
>>> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
>>> +     * be set to a value that is less than or equal to Maximum Performance.
>>> +     */
>>> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM &&
>>> +         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
>>> +          (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&
>>> +           set_cppc->minimum > set_cppc->maximum) ||
>>> +          (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
>>
>> Hmm, I find this confusing to read, and was first thinking the ! was wrong here. Imo
>> such is better expressed with the conditional operator:
>>
>>
>>           set_cppc->minimum > (set_cppc->set_params &
>> XEN_SYSCTL_CPPC_SET_MAXIMUM
>>                                ? set_cppc->maximum
>>                                : data->req.max_perf)
>>
> 
> Thx, understood!
> 
>> Which also makes it easier to spot that here you use data->req, when in the
>> minimum check you use data->caps. Why this difference?
>>
> 
>  minimum check has two boundary check,
> left boundary check is against data->caps.lowest_nonlinear_perf. And right boundary check is against data->req.max_perf. As it shall not only not larger than caps.highest_perf , but also req.max_perf. The relation between max_perf and highest_perf is validated in the maximum check. So here, we are only considering max_perf

I still don't get why one check is against capabilities (permitted values) why the
other is again what's currently set.

Jan

