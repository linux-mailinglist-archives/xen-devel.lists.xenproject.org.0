Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50DAF8F01
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033221.1406688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd0A-0002Lw-QZ; Fri, 04 Jul 2025 09:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033221.1406688; Fri, 04 Jul 2025 09:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd0A-0002JL-NZ; Fri, 04 Jul 2025 09:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1033221;
 Fri, 04 Jul 2025 09:46:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXd09-0002JF-NQ
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:46:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c693b29c-58bb-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:46:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so396992f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 02:46:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359e125sm1819150b3a.13.2025.07.04.02.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 02:46:35 -0700 (PDT)
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
X-Inumbo-ID: c693b29c-58bb-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751622396; x=1752227196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VH+ImBr3l9y7s9Uk2pNDV5IxsnSO3rRSJ9TMmU8NH7w=;
        b=DxJ0ThLIvvj2D6w2aDIaPlDniUMUgtFwspFch0IDCy2vjTWPEwCazB7eSZeWvVAaYC
         lI7LUPGufa/T3BhPf8W4G8CfgjtUNAMuqwiZuTIj1fmtFPLwoEPh4DtEIJYZwTuh1LB6
         1zaLNzzguFixNIdbUbSPDQ1PFGHRgjAJDLBf+9izOBT37SlMCigozYk7c2CtytPfko2n
         lutdEJyZdWJh/yCwjT1DRlmC+d3C+leRsz7Xcs3xDkBUOCOQySdGjjuaJCovDcWTa4Oj
         QPSmEAtiTDlIQG3jpNlLFh95XEV0RFQd5yw3m4NanvAtX78EmtGvy0p+hCu0vSAKnype
         XTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751622396; x=1752227196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH+ImBr3l9y7s9Uk2pNDV5IxsnSO3rRSJ9TMmU8NH7w=;
        b=ZoLlho/SYOqx7aQil8l3L7asNu0cE0EOSsWX/HSBVx9re4LkbFYHYfeA3lZs7hREm0
         qpBmS57LOsEgSpEN14hQ/lnhFBS0ryFuf3lxEJOIdS2xOvBFou/naMXkQgoUEGHMutPK
         Q6jwe5v+LTToqGYZ5/ShxNqDJTN5mo1mXuXtQaLvHcuz+jb2Pro+qNLZOmNAPgNdyeSw
         SXrYZlWXcMdQULqaqC/3236Hwg3QJqRa/tBCG+13b3L5dV3Z41Pw8w1cO8kHfYmCOJ9H
         UJam/9EiPYK5JXNTsIqwkBSxgiCBHkM4cdh9KLucoed6rMOY78b282s2PWdZGToK+0S7
         5eJA==
X-Forwarded-Encrypted: i=1; AJvYcCWe7G5VDOF+7e6sj+FPNW+2zNg3chCOjwjkfWtPsQ2Z2+mo3FdeBQbXi+mYM7lq2Uf0FkzNKi1nGOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzamJhMzuhL+7K4pujdqe5YU3BqXiqQiXPgWwt1+Eg54m47jjq6
	dmBWd+UaIpOb3Ucc7NRwo1xw9JrDsLBBJodVkbKkpssNFLB14B3V2C4rrVicN4SHJQ==
X-Gm-Gg: ASbGncvZnO44hFfU3oBmBVT6QCngmeLR8pZRrhqURk7JuCaTRuJizohn6U+KKigWC9Q
	5ukBQEaRQOgjGsrTfWGNLTRe4iYnrkf4hACryv2u3CK+pOeKlsoogb/CjVt0UULv02yICcCKiEU
	FuK6uGdc/gtMhAdThukE2awCi+pBNe2QVERLpn7egFP6xcnZ6hIy2yAVFcHrnYnQ5/hgthY/gx3
	BjQ/AnIQxpoyXgKHSFKSWgByYiXqBcegWEP+UcmVq9TCMYPwSPTIN/L0AJb/uRrLnlqlh6q6GFZ
	mol2WuFfwYdaRZoxnW/zQE+eB8GsMfmFZufRzsJQfZQTICiENYFklnKI6SpUGyU7suZNLhmU5Jz
	Oebpn8i6uSqGoHbn/6ozFmxHHEm1vPR8X1CJUoyvXAPXvXXQ=
X-Google-Smtp-Source: AGHT+IH+B2Flif6ttUGwmTwru5abP6w3lR0s3rcj3NxNxW7EqfFQtIkZ9hwB/U0RqD9OvMkvrijexA==
X-Received: by 2002:a5d:64e5:0:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b49703f008mr1268632f8f.45.1751622395651;
        Fri, 04 Jul 2025 02:46:35 -0700 (PDT)
Message-ID: <b5184b15-018c-4603-8b97-9e6f122d4863@suse.com>
Date: Fri, 4 Jul 2025 11:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
 <DM4PR12MB845185414637BC1CE87A3309E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845185414637BC1CE87A3309E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2025 10:56, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, July 4, 2025 4:33 PM
>> To: Penny, Zheng <penny.zheng@amd.com>; Andryuk, Jason
>> <Jason.Andryuk@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Julien Grall <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-
>> cmd
>>
>> On 04.07.2025 10:13, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, June 17, 2025 6:08 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>>>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>; Andrew
>>>> Cooper <andrew.cooper3@citrix.com>; Orzel, Michal
>>>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>>>> Monné <roger.pau@citrix.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC
>>>> sub- cmd
>>>>
>>>> On 27.05.2025 10:48, Penny Zheng wrote:
>>>>> --- a/tools/misc/xenpm.c
>>>>> +++ b/tools/misc/xenpm.c
>>>>> @@ -69,6 +69,7 @@ void show_help(void)
>>>>>              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>>>>>              "                                     set the C-State limitation (<num> >= 0)
>> and\n"
>>>>>              "                                     optionally the C-sub-state limitation
>>>> (<num2> >= 0)\n"
>>>>> +            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU
>>>> <cpuid> or all\n"
>>>>>              " set-cpufreq-cppc      [cpuid] [balance|performance|powersave]
>>>> <param:val>*\n"
>>>>>              "                                     set Hardware P-State (HWP) parameters\n"
>>>>>              "                                     on CPU <cpuid> or all if omitted.\n"
>>>>> @@ -812,33 +813,7 @@ static void print_cpufreq_para(int cpuid,
>>>>> struct xc_get_cpufreq_para *p_cpufreq)
>>>>>
>>>>>      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>>>>>
>>>>> -    if ( hwp )
>>>>> -    {
>>>>> -        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
>>>>> -
>>>>> -        printf("cppc variables       :\n");
>>>>> -        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear
>>>> [%"PRIu32"]\n",
>>>>> -               cppc->lowest, cppc->lowest_nonlinear);
>>>>> -        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
>>>>> -               cppc->nominal, cppc->highest);
>>>>> -        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy
>> perf
>>>> [%"PRIu32"]\n",
>>>>> -               cppc->minimum, cppc->maximum, cppc->energy_perf);
>>>>> -
>>>>> -        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
>>>>> -        {
>>>>> -            unsigned int activity_window;
>>>>> -            const char *units;
>>>>> -
>>>>> -            activity_window = calculate_activity_window(cppc, &units);
>>>>> -            printf("                     : activity_window [%"PRIu32" %s]\n",
>>>>> -                   activity_window, units);
>>>>> -        }
>>>>> -
>>>>> -        printf("                     : desired [%"PRIu32"%s]\n",
>>>>> -               cppc->desired,
>>>>> -               cppc->desired ? "" : " hw autonomous");
>>>>> -    }
>>>>> -    else
>>>>> +    if ( !hwp )
>>>>>      {
>>>>>          if ( p_cpufreq->gov_num )
>>>>>              printf("scaling_avail_gov    : %s\n",
>>>>
>>>> I'm not sure it is a good idea to alter what is being output for get-cpufreq-para.
>>>> People may simply miss that output then, without having any
>>>> indication where it went.
>>>
>>> Hwp is more like amd-cppc in active mode. It also does not rely on Xen
>>> governor to do performance tuning, so in previous design, we could borrow
>> governor filed to output cppc info However after introducing amd-cppc passive
>> mode, we have request to output both governor and CPPC info. And if continuing
>> expanding get-cpufreq-para to include CPPC info, it will make the parent stuct
>> xen_sysctl.u exceed exceed 128 bytes.
>>
>> How is the xenpm command "get-cpufreq-para" related to the sysctl interface struct
>> size? If you need to invoke two sysctl sub-ops to produce all relevant "get-cpufreq-
>> para" output, so be it I would say.
>>
> 
> Because we are limiting each sysctl-subcmd-struct, such as " struct xen_sysctl_pm_op ", 128 bytes in "struct xen_sysctl"，They are all combined as a union.
> Also, in "struct xen_sysctl_pm_op", its descending sub-op structs, including "struct xen_get_cpufreq_para", are all combined as union too
> ```
> struct xen_sysctl_pm_op {
>     ... ...
>     union {
>         struct xen_get_cpufreq_para get_para;
>         struct xen_set_cpufreq_gov  set_gov;
>         struct xen_set_cpufreq_para set_para;
>         struct xen_set_cppc_para    set_cppc;
>         uint64_aligned_t get_avgfreq;
>         uint32_t                    set_sched_opt_smt;
> #define XEN_SYSCTL_CX_UNLIMITED 0xffffffffU
>         uint32_t                    get_max_cstate;
>         uint32_t                    set_max_cstate;
>     } u;
> }
> ```
> It could deduce that "struct xen_get_cpufreq_para" is limited to 128 bytes (I think actual limit is smaller than 128)....

And that implies what? In my earlier reply I already said that you may then
simply need to invoke more than one sysctl to get all the data you need. (As
one of the options, that is.)

Jan

