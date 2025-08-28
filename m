Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC82B394B8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097657.1451909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWkt-0004vW-Av; Thu, 28 Aug 2025 07:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097657.1451909; Thu, 28 Aug 2025 07:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWkt-0004tU-8A; Thu, 28 Aug 2025 07:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1097657;
 Thu, 28 Aug 2025 07:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWkr-0004tI-VP
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:09:05 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1f792dd-83dd-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 09:09:05 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso667607a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:09:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cbabf816dsm2296032a12.21.2025.08.28.00.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 00:09:04 -0700 (PDT)
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
X-Inumbo-ID: e1f792dd-83dd-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756364944; x=1756969744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cV3Q76bXg7MihJiyAIy5mzVA4fG0oZeVyeuLPus4FRg=;
        b=KMEqQB/0xe1VUEBGQtIZaWQrLt/DWZP9JCVPGhrisS5+Kt3AYR1KY5FKMxJaxWfAL0
         KB/2FxSujFXzeDRpU30qGY8aRKIu6EjRyTd9DPABIoAZ5jE+fgv34MjzQykwk2U/9HAg
         xTCB1wq06lSyI0WtNr003qVgh1I4HPMiioswIypeKxQrLjEXYIt6YnMCl6T6kZxt+qz7
         Mi6IqWb44FdpdrXlhwNqg3DWo44ndVE/h6Cq5RSiWGHyIQOz1E68hFHPAPcg8yTnzd7C
         p40+oipmZifZ3Y1xotmyo48j3PF8JCijZC0SC/ktFADZXoaP86d0tK0gl2TLwb6OL1P/
         awVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756364944; x=1756969744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV3Q76bXg7MihJiyAIy5mzVA4fG0oZeVyeuLPus4FRg=;
        b=bhHquESTw8HV+ww5FnUQklueVtPi2udZewK9ucQxltuGuSZzvAoGVSm/XnGhqRiWoJ
         6CzZ3DOZmQJeMNQQpwvhjqQXpBqfjfvU/vrM0hxGnyWS889Bce7dhW0x6SEvlqx+9Owj
         BnuX38+PAAi5EHJo5fJ5Mi636ok4F5AiV86JvAkfWRqiLd0CdA/F1qVuJwO1+zxqF3nn
         DQw1TXI541BiM3tGqRFmy9R+RHzIWWOoxZG3t6vHCmG8X06HWCS9Y2XZxXYs6IKR7RMT
         shCTwn2u6XYmDr6zk6eJZO9zSJwfCnuwcdc5JqDFvcuz0m2UMcW2vp7/xvGh8S1zMIOV
         8cGw==
X-Forwarded-Encrypted: i=1; AJvYcCX/W307le2+bvdzTetEeOvFLdxsiFejaD3mwS/1v0ofmJzULOC3CaUdFm5DLDWokMkw927ZRXSS+TU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkJ3QbnnupXnBYFPDrrNA8pwJavLYKajwKqEke00lurQtEa+O2
	pc5Us37J4vNz31xZUN2uCUykRhNNRKhZn9WiMm7q4nMxzYtMgJu2QiGS9kN2CSpflQ==
X-Gm-Gg: ASbGncsO45X3OHfNH3VZ+9OraZ1oNd8mnYPvJgjHz2XFcs+QEfXjTi7aKBA2L6Yafkn
	Xto/Rpj19d6ABzpUcKLAQo/zPtfcl65iayQ6sdfQOMypeF+DEOfksfemt6qownSS/vrIkh9QAmt
	YvTX2D86V3RoDmAenNWntdFaG+Xu86A2qfqj6rGQ5I5Gd5Ah9VN+B55BJYq179CXsI5ON6rKSG0
	pw/8cgLS4/NkTsgtlIPTHNXD/1mOvhFhC4b9DKyhF/74yDPzlD4JnSPfuJxJQWDygbUfZCNSlvG
	D3MKEMvsyZJDqXm+FXelFE7DK1r8Qg8W8RjSfSsaCE6k8r/KIh0+l532zOF9wCxfEIwYe5u7y/k
	Qj/dUyFpqYpfbY8VDNI+evI3Y0cjmNamYAuZqDgtBkL5ekJhZVPeD/dxlyadefjipwTv1B1CEjq
	UnNjoKJBE=
X-Google-Smtp-Source: AGHT+IFBOMhj8Vhaz4m6cMWDktDd2yqXSfqjKCtNLcF5MQ358B0jCJGZPJScWl6VlgDjRdBr2Ehcaw==
X-Received: by 2002:a05:6402:1e96:b0:61c:b798:a14 with SMTP id 4fb4d7f45d1cf-61cb7980c01mr3709138a12.36.1756364944447;
        Thu, 28 Aug 2025 00:09:04 -0700 (PDT)
Message-ID: <8d591b74-5ff0-451a-b8ca-a8c71c0e2871@suse.com>
Date: Thu, 28 Aug 2025 09:09:03 +0200
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
 <a877ad1b-1628-465b-9b38-dce347ba8ba1@suse.com>
 <fa8f951f-610c-484f-a9c4-9b76b8f399cc@suse.com>
 <DM4PR12MB8451BD022E0150D6D784CDBFE13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451BD022E0150D6D784CDBFE13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 08:54, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, August 28, 2025 2:38 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>> xen_sysctl_pm_op for amd-cppc driver
>>
>> On 28.08.2025 08:35, Jan Beulich wrote:
>>> On 28.08.2025 06:06, Penny, Zheng wrote:
>>>>> -----Original Message-----
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: Tuesday, August 26, 2025 12:03 AM
>>>>>
>>>>> On 22.08.2025 12:52, Penny Zheng wrote:
>>>>>> --- a/xen/include/public/sysctl.h
>>>>>> +++ b/xen/include/public/sysctl.h
>>>>>> @@ -336,8 +336,14 @@ struct xen_ondemand {
>>>>>>      uint32_t up_threshold;
>>>>>>  };
>>>>>>
>>>>>> +#define CPUFREQ_POLICY_UNKNOWN      0
>>>>>> +#define CPUFREQ_POLICY_POWERSAVE    1
>>>>>> +#define CPUFREQ_POLICY_PERFORMANCE  2
>>>>>> +#define CPUFREQ_POLICY_ONDEMAND     3
>>>>>
>>>>> Without XEN_ prefixes they shouldn't appear in a public header. But
>>>>> do we need ...
>>>>>
>>>>>>  struct xen_get_cppc_para {
>>>>>>      /* OUT */
>>>>>> +    uint32_t policy; /* CPUFREQ_POLICY_xxx */
>>>>>
>>>>> ... the new field at all? Can't you synthesize the kind-of-governor
>>>>> into struct xen_get_cpufreq_para's respective field? You invoke both
>>>>> sub-ops from xenpm now anyway ...
>>>>>
>>>>
>>>> Maybe I could borrow governor field to indicate policy info, like the following in
>> print_cpufreq_para(), then we don't need to add the new filed "policy"
>>>> ```
>>>> +    /* Translate governor info to policy info in CPPC active mode */
>>>> +    if ( is_cppc_active )
>>>> +    {
>>>> +        if ( !strncmp(p_cpufreq->u.s.scaling_governor,
>>>> +                      "ondemand", CPUFREQ_NAME_LEN) )
>>>> +            printf("cppc policy           : ondemand\n");
>>>> +        else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
>>>> +                           "performance", CPUFREQ_NAME_LEN) )
>>>> +            printf("cppc policy           : performance\n");
>>>> +
>>>> +        else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
>>>> +                           "powersave", CPUFREQ_NAME_LEN) )
>>>> +            printf("cppc policy           : powersave\n");
>>>> +        else
>>>> +            printf("cppc policy           : unknown\n");
>>>> +    }
>>>> +
>>>> ```
>>>
>>> Something like this is what I was thinking of, yes.
>>
>> Albeit - why the complicated if/else sequence? Why not simply print the field the
>> hypercall returned?
> 
> userspace governor doesn't have according policy. I could simplify it to
> ```
>         if ( !strncmp(p_cpufreq->u.s.scaling_governor,
>              "userspace", CPUFREQ_NAME_LEN) )
>                 printf("policy               : unknown\n");
>         else
>                 printf("policy               : %s\n",
>                           p_cpufreq->u.s.scaling_governor);
> ```

But the hypervisor shouldn't report back "userspace" when the CPPC driver
is in use. ANd I think the tool is okay to trust the hypervisor.

Jan

