Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2901B393E7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097536.1451820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWEm-0004Fq-UF; Thu, 28 Aug 2025 06:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097536.1451820; Thu, 28 Aug 2025 06:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWEm-0004E5-R5; Thu, 28 Aug 2025 06:35:56 +0000
Received: by outflank-mailman (input) for mailman id 1097536;
 Thu, 28 Aug 2025 06:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWEl-0004Dz-5e
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:35:55 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eee3110-83d9-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 08:35:53 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf6fso986397a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:35:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe89bd7acesm747484466b.73.2025.08.27.23.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:35:52 -0700 (PDT)
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
X-Inumbo-ID: 3eee3110-83d9-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756362953; x=1756967753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rv5rJBq+BfUlB7x2Nm3tGfV6V5yfJL3FK2im09nUlHU=;
        b=AxzMnncQDVbwzn8s6IQaqiJXTs2wZMlm1YTHRN8oiNufYCVtZyR0ZCh1AYjxlhhraN
         Cdp/Z8GygnF97Ry3g4NFPr+46GC2xLkufffpqbPuA2J5A4/Egy/sXn/u3vyX/tR+s3gK
         9LRhxR1hba3N14ggnkV+zz8F1zF77IMnXgHhyRPXfQW2L8m9gec1hrBRyUt2z4YXoRVx
         bCErB9tgrSDDjKX+mgmanSx8DBQoynxGDZKOzgUIDYRWF7JoqF8c+VFN3EAjhjnAXfct
         m5CSDTN/pcpOt696QxeB+1M8mQXkgfuSmUrTEyAJVboawXqXWg8HTUn7LS9C1H7uHGB/
         tLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756362953; x=1756967753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv5rJBq+BfUlB7x2Nm3tGfV6V5yfJL3FK2im09nUlHU=;
        b=cXWTxvzLrwMWUctCgCrv5q8nQUlaU1kkZoKKsz15dH1VUbb/t7XeecF+m0rUAVXvNo
         1V/emnxCZsQkcq+CAjFlXDsBvmhmiREb4Jc5QewWxU59vBeaqdYdpdD5LTNxbQcH5bLJ
         6jOMUrEhjE+cYqtG02cvOpdXgBfeM1hUoNFuaDZf14ppGlNxcaXe1y+q5BPl0BUNbX+R
         24hhrcCjc63dp2sqiBz5xk7WDO3AIT8MEXmThwbrpzHbO4qWWeEZ2jcVCik7r0eAL1DE
         KEoMx8vRsXht0a89WkGhQ0tDECmBRGyH3IFnY6u/9e2Ks8pMU6kABMg9Bj7FIfMstklp
         G0sg==
X-Forwarded-Encrypted: i=1; AJvYcCUVhxMBgDyBPUqEzOd0cNbOgzGHl5+RLbzQWghCWIRpHInaTwagx1p5ffdMvhj+su+zxvyHxc9LRkA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjdSgjq7qxTh1NibpPBNwx3mxfmUt3gvi99R1m1y3DPztLmAI9
	5JpxUrYUd7Yff0tI1vTEFimE0tAzNzcRWs/YSL/8g05todUgJtufzTqJgSrNTmyohw==
X-Gm-Gg: ASbGncst4hXqYZCmTmYscV+HfurPTStENgAJ2FDyGiDcUL1KfP709IyQgY/F7rhSSSy
	ssGYgN6nd7v8uJqQ3jnTrCNhMHnIzjuLMIst3WwNTCKq9eJqFErOoMLUsa8E0es7WnXGllq2TYW
	1OMRucI+/PtWfV/asXmeojIxGSoB3qcYbXh+TiKdRLKiJQjo8WhVRNcP3vehbp6Hgn+yxgK9fBx
	zJ5sPkgQErMT31BASWxQHr6eWXOhhuoKnZaTk712TC4du6sxS2td42eNt8xir63Z2N+fu/CUZ6h
	pWvRRZrNrU/QzwJZvbK0UkYbmzo61+gdYjs8G8O0B4VtMmvsJLupWXu3KKT3qU5YsIAPXSttjCY
	XQXAgrGJuSTZd5jRTFdU3Fdte0jotvmvW3XgbwYQ5JI8KPJ/8FQBDUKx6fxevouGA/n9mmvAdMx
	ywmz9pPpirg/MC3R43Xw==
X-Google-Smtp-Source: AGHT+IF6jNZo5wYka15xPzybPjvNpCmzSMbCAFvjsiIikXslrtJp8U02jHTBW6o0FraqihLOZFvSHQ==
X-Received: by 2002:a17:907:720f:b0:afe:b9e3:2a19 with SMTP id a640c23a62f3a-afeb9e337a9mr582546966b.19.1756362952936;
        Wed, 27 Aug 2025 23:35:52 -0700 (PDT)
Message-ID: <a877ad1b-1628-465b-9b38-dce347ba8ba1@suse.com>
Date: Thu, 28 Aug 2025 08:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com>
 <f27c17e6-8c88-42f3-b0e2-874aa02597c5@suse.com>
 <DM4PR12MB8451CFF93199B96578D96F88E13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451CFF93199B96578D96F88E13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 06:06, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, August 26, 2025 12:03 AM
>>
>> On 22.08.2025 12:52, Penny Zheng wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +    /* Only allow values if params bit is set. */
>>> +    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
>>> +          set_cppc->desired) ||
>>> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
>>> +          set_cppc->minimum) ||
>>> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
>>> +          set_cppc->maximum) ||
>>> +         (!(set_cppc->set_params &
>> XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
>>> +          set_cppc->energy_perf) )
>>> +        return -EINVAL;
>>
>> ... all the errors checked here are to be ignored when no flag is set at all?
> 
> Yes, values are only meaningful when according flag is properly set, which has been described in the comment for "struct xen_set_cppc_para"

Especially since you stripped the initial part of this comment of mine, it feels
as if you misunderstood my request. What it boils down to is the question whether
"if ( set_cppc->set_params == 0 )" shouldn't move after the if() you left in
context above.

>>> +    /*
>>> +     * Validate all parameters
>>> +     * Maximum performance may be set to any performance value in the range
>>> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but
>> must
>>> +     * be set to a value that is larger than or equal to minimum Performance.
>>> +     */
>>> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
>>> +         (set_cppc->maximum > data->caps.highest_perf ||
>>> +          set_cppc->maximum <
>>> +                        (set_cppc->set_params &
>> XEN_SYSCTL_CPPC_SET_MINIMUM
>>> +                         ? set_cppc->minimum
>>> +                         : data->req.min_perf)) )
>>
>> Too deep indentation (more of this throughout the function), and seeing ...
> 
> Maybe four indention is more proper
> ```
>         if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
>              (set_cppc->maximum > data->caps.highest_perf ||
>               (set_cppc->maximum <
>                           (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
>                     ? set_cppc->minimum
>                     : data->req.min_perf))) )
> ```

No. In expressions you always want to indent according to pending open
parentheses:

        if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
             (set_cppc->maximum > data->caps.highest_perf ||
              (set_cppc->maximum <
               (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
                ? set_cppc->minimum
                : data->req.min_perf))) )

>>> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
>>> +        if ( active_mode )
>>> +            policy->policy = CPUFREQ_POLICY_UNKNOWN;
>>> +        break;
>>> +
>>> +    default:
>>> +        return -EINVAL;
>>> +    }
>>
>> Much of this looks very similar to what patch 09 introduces in
>> amd_cppc_epp_set_policy(). Is it not possible to reduce the redundancy?
>>
> 
> I'll add a new helper to amd_cppc_prepare_policy() to extract common
> 
>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -336,8 +336,14 @@ struct xen_ondemand {
>>>      uint32_t up_threshold;
>>>  };
>>>
>>> +#define CPUFREQ_POLICY_UNKNOWN      0
>>> +#define CPUFREQ_POLICY_POWERSAVE    1
>>> +#define CPUFREQ_POLICY_PERFORMANCE  2
>>> +#define CPUFREQ_POLICY_ONDEMAND     3
>>
>> Without XEN_ prefixes they shouldn't appear in a public header. But do we
>> need ...
>>
>>>  struct xen_get_cppc_para {
>>>      /* OUT */
>>> +    uint32_t policy; /* CPUFREQ_POLICY_xxx */
>>
>> ... the new field at all? Can't you synthesize the kind-of-governor into struct
>> xen_get_cpufreq_para's respective field? You invoke both sub-ops from xenpm
>> now anyway ...
>>
> 
> Maybe I could borrow governor field to indicate policy info, like the following in print_cpufreq_para(), then we don't need to add the new filed "policy"
> ```
> +    /* Translate governor info to policy info in CPPC active mode */
> +    if ( is_cppc_active )
> +    {
> +        if ( !strncmp(p_cpufreq->u.s.scaling_governor,
> +                      "ondemand", CPUFREQ_NAME_LEN) )
> +            printf("cppc policy           : ondemand\n");
> +        else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
> +                           "performance", CPUFREQ_NAME_LEN) )
> +            printf("cppc policy           : performance\n");
> +
> +        else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
> +                           "powersave", CPUFREQ_NAME_LEN) )
> +            printf("cppc policy           : powersave\n");
> +        else
> +            printf("cppc policy           : unknown\n");
> +    }
> +
> ```

Something like this is what I was thinking of, yes.

Jan

