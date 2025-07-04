Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF82AF8BEC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033036.1406457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbuU-00055d-VW; Fri, 04 Jul 2025 08:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033036.1406457; Fri, 04 Jul 2025 08:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbuU-00053d-St; Fri, 04 Jul 2025 08:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1033036;
 Fri, 04 Jul 2025 08:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXbuT-00053X-7q
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:36:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014e5771-58b2-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 10:36:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso4364805e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 01:36:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459a665sm15873445ad.223.2025.07.04.01.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 01:36:38 -0700 (PDT)
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
X-Inumbo-ID: 014e5771-58b2-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751618199; x=1752222999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j7T7JGhA3883kYumXRd2AhN54F92+OOBPXClihgH8Ko=;
        b=LCP2aRQKdLWPhDNTcgp8CFjLdFM2AUwezU7mqAnSJ619/SqoLU20bGlz1OoqGuUm/u
         /hhnGjU8LWbv9T4W7CLhHF7ggAucuMVdpR9qkjCQsPSmvybZ0DhoZj3CNo2VF2pHdWNA
         OuKSksHsDbDJa8Bf1OU7ChRfYRk0X64dRToIfZE97QAM/DgGUuARpPjJewMR079ToaHV
         iTf1+AtVd0LlcsGwRaLTvQASdMNdrwfmtQLHfjImHMEPl8E2Cl5OJLnw1gyfoXNokQ1v
         RBmQvexvgZWvvIXU8BSMAhY2zMOIvxhVJ6RD+HCzc3DCeA/jIqok6gWjIbmInEUCor9f
         NcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618199; x=1752222999;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7T7JGhA3883kYumXRd2AhN54F92+OOBPXClihgH8Ko=;
        b=KEHv+RtLkeSTXtiZda5AQXDPB0IanYOlv5GfnxaDNvNiTXlxM6NbZp2tLPpmoCeouB
         mIBA+wqSQmPY2cbSYUX3SiY/n4WWlhY/aLkmPooliGQZ2LU8oRMwVVq3mXDJKicra8+o
         jBKPTmBGuU+AlD3GJbmaLKyqHOONYVquLTunnW/+5F89Rv0zCIg63gvTeBKqlY+WYYaf
         iaPK1SMvbQeZHxQMB0grG3sh6bx4sio0XkRSVge0JDqqvw2azKN6wU+6XySmDPzFbI8o
         plGs7nqj3WfR535D3CvYjYaVzPB8B43c2+tSuX/dSODrmYpgmKccUCZYUiqc+FE5Yr+6
         S4hg==
X-Forwarded-Encrypted: i=1; AJvYcCVS/Cv7aFXiKrEspGcIMKAH+OXt0i+W5pHnZnRv2vnXiW7+eVN9E4/z1O5ejOuG8ZtzDWztfU/bDN4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoyAaxpFR67LiUtVpUUd7Vp3/UoaXGQQPE4APs2ikupbumWZ/H
	9DyqhQOu8tJJKnyfA0/SjYJrm9ealUWthUohO2jKiVltVwFCVa9mihgmI85C5ZQnaw==
X-Gm-Gg: ASbGncvfJB8GeMV2SuQEDPhes+4NLj9FsAjxxoPDIM1C2RHmGuF1KTjoVR/phG15Ibd
	Jyiu6Kxg6NYRCJEoKKLbfwYf0FsvujgT5xFsxY3UwAGKkqjd42+bAnIzjKB1d9waKn/JLfwOh3U
	SMV/1Lv82hDqSOZlhWJwO4WkDieiKmzahX2o3+lwAKPrW6VVnzOFygXlMViISPVE2aUaxgFbgoV
	cy/vN+uUg7tVf07yMC4ftZSIbNu2dob41ek1b6UrCDPzVX0ZYwK6C07iOvMSTAkEVUP8R25YiMD
	PTlS1+aa3PIDBsHhn1YFqImyglFi87apOyQRF5HY8PzdpfhPVVN3eUhOh81CxtCaskWqSLuwDyb
	Cl4+IElrqAi8fksYygwoVkgE18w66N0v8dSJ5SaDJH5GbIM4=
X-Google-Smtp-Source: AGHT+IFEJw33efhOEYxFTBOQCbIzE6Gd6P8Nn/fm05Yu42Jl5XQ8z6fT/PBPWhJW/eVGLOpa1ac5+A==
X-Received: by 2002:a05:6000:714:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3b4964bdb54mr1316399f8f.9.1751618199106;
        Fri, 04 Jul 2025 01:36:39 -0700 (PDT)
Message-ID: <c309b2a3-e2aa-40a1-847b-144b816e7764@suse.com>
Date: Fri, 4 Jul 2025 10:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
From: Jan Beulich <jbeulich@suse.com>
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
Content-Language: en-US
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
In-Reply-To: <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 10:32, Jan Beulich wrote:
> On 04.07.2025 10:13, Penny, Zheng wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Tuesday, June 17, 2025 6:08 PM
>>>
>>> On 27.05.2025 10:48, Penny Zheng wrote:
>>>> --- a/tools/misc/xenpm.c
>>>> +++ b/tools/misc/xenpm.c
>>>> @@ -69,6 +69,7 @@ void show_help(void)
>>>>              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>>>>              "                                     set the C-State limitation (<num> >= 0) and\n"
>>>>              "                                     optionally the C-sub-state limitation
>>> (<num2> >= 0)\n"
>>>> +            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU
>>> <cpuid> or all\n"
>>>>              " set-cpufreq-cppc      [cpuid] [balance|performance|powersave]
>>> <param:val>*\n"
>>>>              "                                     set Hardware P-State (HWP) parameters\n"
>>>>              "                                     on CPU <cpuid> or all if omitted.\n"
>>>> @@ -812,33 +813,7 @@ static void print_cpufreq_para(int cpuid, struct
>>>> xc_get_cpufreq_para *p_cpufreq)
>>>>
>>>>      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>>>>
>>>> -    if ( hwp )
>>>> -    {
>>>> -        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
>>>> -
>>>> -        printf("cppc variables       :\n");
>>>> -        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear
>>> [%"PRIu32"]\n",
>>>> -               cppc->lowest, cppc->lowest_nonlinear);
>>>> -        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
>>>> -               cppc->nominal, cppc->highest);
>>>> -        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf
>>> [%"PRIu32"]\n",
>>>> -               cppc->minimum, cppc->maximum, cppc->energy_perf);
>>>> -
>>>> -        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
>>>> -        {
>>>> -            unsigned int activity_window;
>>>> -            const char *units;
>>>> -
>>>> -            activity_window = calculate_activity_window(cppc, &units);
>>>> -            printf("                     : activity_window [%"PRIu32" %s]\n",
>>>> -                   activity_window, units);
>>>> -        }
>>>> -
>>>> -        printf("                     : desired [%"PRIu32"%s]\n",
>>>> -               cppc->desired,
>>>> -               cppc->desired ? "" : " hw autonomous");
>>>> -    }
>>>> -    else
>>>> +    if ( !hwp )
>>>>      {
>>>>          if ( p_cpufreq->gov_num )
>>>>              printf("scaling_avail_gov    : %s\n",
>>>
>>> I'm not sure it is a good idea to alter what is being output for get-cpufreq-para.
>>> People may simply miss that output then, without having any indication where it
>>> went.
>>
>> Hwp is more like amd-cppc in active mode. It also does not rely on Xen governor to do performance tuning, so in previous design, we could borrow governor filed to output cppc info
>> However after introducing amd-cppc passive mode, we have request to output both governor and CPPC info. And if continuing expanding get-cpufreq-para to include CPPC info, it will make the parent stuct xen_sysctl.u exceed exceed 128 bytes.
> 
> How is the xenpm command "get-cpufreq-para" related to the sysctl interface struct
> size? If you need to invoke two sysctl sub-ops to produce all relevant
> "get-cpufreq-para" output, so be it I would say.
> 
>> So I'm left to create a new subcmd to specifically deal with CPPC info
>> I could leave above output for get-cpufreq-para unchanged. Then we will have duplicate CPPC info in two commands. Or is it fine to do that?
> 
> Duplicate information (in distinct commands) isn't a problem either, imo.

But, ftaod, duplicate code producing the same information is. Such code would
want breaking out into a helper function then. (And yet further ftaod, if the
code only produces identical information, but from different input structures,
such breaking out of course wouldn't normally be an option.)

Jan

