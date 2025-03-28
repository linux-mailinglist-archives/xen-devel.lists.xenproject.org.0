Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CB5A74447
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 08:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930210.1332877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3yv-00018E-Le; Fri, 28 Mar 2025 07:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930210.1332877; Fri, 28 Mar 2025 07:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3yv-00016m-Ij; Fri, 28 Mar 2025 07:18:21 +0000
Received: by outflank-mailman (input) for mailman id 930210;
 Fri, 28 Mar 2025 07:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty3yu-00016g-1u
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 07:18:20 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d29b0138-0ba4-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 08:18:18 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so745874f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 00:18:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6589efsm1805622f8f.16.2025.03.28.00.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 00:18:17 -0700 (PDT)
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
X-Inumbo-ID: d29b0138-0ba4-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743146298; x=1743751098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ysb/TieFcNNwsrOmHAHkzeIyb9NteHXasdP7r2m2ZDM=;
        b=KYYsAc8CXGioNR5igN1hWAlCNRB6me4OmFRHHNC/luXy0XIz1bbcnKi4vRN3yVpbuV
         5vO/K7zGoOOtRuTawRVZxeacD9TP+LfWPf4+fo9ILXynp/J8wbjtwbu1oPnkWG1R4BlF
         qb35ZAKOm5OJIcD5fxRbQpKCZYBMEQGvbWerJxw7j6AcXGrrz3FEFGBlDCL0Os8hJCs+
         xH8Ws8gDKUFsnDi1oBEFOfuTi9FX8PcEMVcXc68n80nU5pgkAK+6xxCsvsau9ukOemPa
         +fbEomUyXwMdRSeNbBhxwJe/Bc6gHcxhSITKwjwn0Dojo41X9ANBz5UrywzYgqP9u1Fg
         +qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743146298; x=1743751098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ysb/TieFcNNwsrOmHAHkzeIyb9NteHXasdP7r2m2ZDM=;
        b=JqMAtWALsCCOZ6q0e5QknHk/HobQGOgTI2GuD+IWc5UT35G81FIZWBgmfV5jkCY/am
         k8PkXdpovMn04AK+EZ5lN4ZdoiUd7R2Lgg0Cw7PqQycRqjM6W/Ynsnz2Z251d3E2/tJR
         MQFgndUzGYH0sfiR//mwPrmWrP9B1beHIyWNgsGGNTh3kZGuRf+pfipfrevf9Qc3vabU
         ODxyHtOYprepMNAKxmOSsmeLpU5zy4qwaGOK5FwGUSyrzVjuFZut9+iwZ/ybnq4Mn7Qn
         XNz1XygX8sIZ/8Bn9vantG9B+/Xgs80OZvvyquwRQTJdHUjIbBk0BgvRtudhLOXFr/my
         8mxg==
X-Forwarded-Encrypted: i=1; AJvYcCWH7wbJmfChuXTVFLbudMj6MbDaM54ADqmlL9XsyArUTOjzUPGUQlg3Tnl5SKsR6grLrM59er/O4ic=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyU9tnV/D5xsToYg4QENrtyOCQ0C0Vr6o+kR61IZJUk77Mt8vY
	+M1ZEva2vCroFMsk++r6bu5BYclvui6TlkLkkk/wEa5hkgZzh2CmgTbZnYjYWA==
X-Gm-Gg: ASbGnctbytZIhNNNCI6yeVMvmZDo/737eQhrPtKbTNQtpe2aKBK5rMlT7TIHJmeWS03
	3T9o3L30gMVaUzk8Dzj0QjTj/oaOf4iPRj5RoMb5vlWrINsnR9txIRMjDImMsYwdVBX6VTqKxEZ
	ukFvU8iY3TEwxAPiWQaB8R5vDrUFu5rGdNJ30SO7gPeYBHxUv5ibsEp55qqs/dMV5LYVOvVce3W
	Vkfdq/BNh4kp3KZVpo9mwQHcWNkbdspl7dzdUFwKCbkn2xFgfZHOujo28+eLp9ojKnlG5oOPSyA
	NowQjTESq8a3ootS3MiZGAF/8BR4tV5h6DMBvxuyP0pXd6ggauKV0HlIkxTUWNyIoRMRi6wyuyK
	R5Qz41EAhlj8hPfgr8WDUELtzvrJslQ==
X-Google-Smtp-Source: AGHT+IG6gH0rq092aLuN/lswuBaPb+vQ98vXyyAiRKKKRxjp/TqQjyB/bzdWC3a2txNtIIGLwM2Cng==
X-Received: by 2002:a05:6000:1446:b0:391:13ef:1af5 with SMTP id ffacd0b85a97d-39ad1794fc3mr5338496f8f.48.1743146297912;
        Fri, 28 Mar 2025 00:18:17 -0700 (PDT)
Message-ID: <56243215-797b-4a1d-915e-7fabd6271388@suse.com>
Date: Fri, 28 Mar 2025 08:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-13-Penny.Zheng@amd.com>
 <6bcd0903-7406-4105-b471-85b5eb0bccc0@suse.com>
 <DM4PR12MB8451472692B00DAE0A909954E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451472692B00DAE0A909954E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 05:07, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, March 25, 2025 6:49 PM
>>
>> On 06.03.2025 09:39, Penny Zheng wrote:
>>> @@ -261,7 +276,20 @@ static int cf_check amd_cppc_cpufreq_target(struct
>> cpufreq_policy *policy,
>>>          return res;
>>>
>>>      return amd_cppc_write_request(policy->cpu, data-
>>> caps.lowest_nonlinear_perf,
>>> -                                  des_perf, data->caps.highest_perf);
>>> +                                  des_perf, data->caps.highest_perf,
>>> +                                  /* Pre-defined BIOS value for passive mode */
>>> +                                  per_cpu(epp_init, policy->cpu)); }
>>> +
>>> +static int read_epp_init(void)
>>> +{
>>> +    uint64_t val;
>>> +
>>> +    if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
>>> +        return -EINVAL;
>>
>> I'm unconvinced of using rdmsr_safe() everywhere (i.e. this also goes for earlier
>> patches). Unless you can give a halfway reasonable scenario under which by the
>> time we get here there's still a chance that the MSR isn't implemented in the next
>> lower layer (hardware or another hypervisor, just to explain what's meant, without
>> me assuming that the driver should come into play in the first place when we run
>> virtualized ourselves).
>>
> 
> Correct me if I understand wrongly, we are concerning that the driver may not always
> have the privilege to directly access the MSR in all scenarios, so rdmsr_safe with exception
> handling isn't always suitable. Then maybe I shall switch them all into rdmsrl() ?

There's no privilege question here - we're running at the highest possible privilege
level. The only question in MSR access can concern the existence of these MSRs (on
bare hardware) or improper emulation of MSRs by an underlying hypervisor. The latter
case I think we can pretty much exclude for a driver like this one - the driver
simply has no (real) use when running virtualized. Which leaves errata on hardware.
Those would better be dealt with by checking once up front (and then disabling the
driver if need be). IOW except for perhaps a single probing access early in driver
init, I think these better would all be plain accesses. And even such an early
probing access would likely only need switching to when a relevant erratum becomes
known.

>> Furthermore you call this function unconditionally, i.e. if there was a chance for the
>> MSR read to fail, CPU init would needlessly fail when in passive mode.
>>
> 
> The reason why I also run read_epp_init() for passive mode is to avoid setting epp with zero value
> for MSR_AMD_CPPC_REQ in passive mode. I want to give it pre-defined BIOS value in passive mode.
> If we wrap read_epp_init() with active mode check, maybe we shall add extra read before setting request register MSR_AMD_CPPC_REQ,
> introducing MSR_AMD_CPPC_EPP_MASK to reserve original value for epp in passive mode, or any better suggestion?

Well, not using rdmsr_safe() here would make the function impossible to fail, and
hence the question itself would be moot. Otherwise my suggestion would be to ignore
the error (perhaps associated with a warning) in passive mode.

>>> +    {
>>> +        /* Force the epp value to be zero for performance policy */
>>> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
>>> +        min_perf = max_perf;
>>> +    }
>>> +    else if ( policy->policy == CPUFREQ_POLICY_POWERSAVE )
>>> +        /* Force the epp value to be 0xff for powersave policy */
>>> +        /*
>>> +         * If set max_perf = min_perf = lowest_perf, we are putting
>>> +         * cpu cores in idle.
>>> +         */
>>
>> Nit: Such two successive comments want combining. (Same near the top of the
>> function, as I notice only now.)
>>
>> Furthermore I'm in trouble with interpreting this comment: To me "lowest"
>> doesn't mean "doing nothing" but "doing things as efficiently in terms of power use
>> as possible". IOW that's not idle. Yet the comment reads as if it was meant to be an
>> explanation of why we can't set max_perf from min_perf here. That is, not matter
>> what's meant to be said, I think this needs re- wording (and possibly using
>> subjunctive mood).
> 
> How about:
> The lowest non-linear perf is equivalent as P2 frequency. Reducing performance below this
> point does not lead to total energy savings for a given computation (although it reduces momentary power).
> So we are not suggesting to set max_perf smaller than lowest non-linear perf, or even the lowest perf.

In an abstract way I think I can follow this. In the context of the code being
commented, however, I'm afraid I still can't make sense of it. Main point being
that the code commented doesn't use any of the *_perf values. It only sets the
"epp" local variable. Maybe the point of the comment is to explain why non of
the *_perf are used here, but I can't read this out of either of the proposed
texts.

Jan

