Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B74AF8BC0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033020.1406448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbqu-0004T6-CS; Fri, 04 Jul 2025 08:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033020.1406448; Fri, 04 Jul 2025 08:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbqu-0004Qu-99; Fri, 04 Jul 2025 08:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1033020;
 Fri, 04 Jul 2025 08:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXbqt-0004Qo-2n
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:32:59 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c81027b-58b1-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 10:32:57 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so468784f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 01:32:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce35cc2cesm1661832b3a.59.2025.07.04.01.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 01:32:55 -0700 (PDT)
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
X-Inumbo-ID: 7c81027b-58b1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751617976; x=1752222776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+7ErzgmnEXoZRRtMKcJgf3rUmyW5zoXhXsYXkOEJAKw=;
        b=Xz/g37cEkisRlNKtclYOTYIPy1Tbh6zsJ8aRgovF2/5I0u6Vx1WCnigqZZ5PD84uI0
         J8naZh3dK3LHI9t0kkLvIgrnBmfnaNsbeIcWUkSS/R0aQVulGOLS+5tMw1mxnm/MQixc
         c5wfMZ4mm0PIF5OLnN8l+0ys6hhQGwuQ5C7WnJJt7CystiR4YazitPDn7UMJnRHDM1Ja
         /p8f/csCgC3vBU0zUeWxFFx5jD8mShUmIuZbmZoL7TOLlJW753DRk7nZx5vQZ6zkJn1T
         avA0nMFJA8aOZpkaiM3rEb5/y+qnvblKR9fISnAr4it29mYO7ypRgrScJ5N8k85Cm8Kd
         C+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617976; x=1752222776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7ErzgmnEXoZRRtMKcJgf3rUmyW5zoXhXsYXkOEJAKw=;
        b=kTEsmVM+4xZdSwbHeNKQ26FckNS9mFPaq9DyaZ2Ru4EExd1njVPGSvLAeMYaM5770c
         L+zVKGWtsNlEIc7Gt30g8RR4Ie3amjb8rTzXK55ofgqp5xeZaT2X6LVRE3xLnWGZcZJw
         ynyEamO0NPCIVjpSzkI5hLUDrilSUCVs7iZx+nUa4q2S+Z6DBAnqaQkryQJExm4rOgkB
         EubMf9MqHO4ogdLog1eegXdsO7dgViRHcdhy17yGRNJddbzT3YCwIkSRPj6baHtS3pV9
         EV3nMbDEKu/oCLeEaZW0hP0/OBpGs7kzMuH5JTCq4y39anDJgu41TlsJUBYKf30vvz9y
         x0cA==
X-Forwarded-Encrypted: i=1; AJvYcCXRtEAO5aSOzOsQFnMrr1cww32kjFQq4SdlAeIxd6PjNb2MBV8Kyga5pLMXDicujNomFaxNI18u3vY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywpm65/ASY4b8+7FyNeP/EHOJBLOrnuijwMbQoMUcEsHOj+81Vx
	d63Ld15kOr6rMMt/b8sxfsb+I4DQHkhfWznL6PsXDjWU5Hx3pr7s+rKCy/urjQvvjw==
X-Gm-Gg: ASbGncszeOEO4Bfk7JSothN1HhWyqN19cpP9DwBULcErjJXwMznZBhhWSJT3LFoRXZ5
	eEY8jxM8qgMHiiznp+e8rC8Gr1x7w6RwM3RjurdCNsWh2AuxTDnH+5bTu6Md9yq8qThHWc61AFK
	467UfmK+gHRn7BxJQewjtPeyYU2pCLJA8XCM4LRp3dnSYgYB8t1j+XjE3/i5dXnKLX4WXOH4Pi7
	RaZ1TDOioO05ovvKwjSIIKLCJ7mQQ524bBEOR7/U7v00i4d8theN5PzkAs6QBpeZ6d0efIGMRJu
	mwVmTvMKOEdFwsudHbISDk1EnqgWh+2CRQu5WBEjKsWvdwiT0YB5Sc7XmCP28+bSz9BxBRFpwks
	vfAe/FwTZXLYAGjbGQhizhHuLURnIV3LmV10sLqZj+IsJmjQ=
X-Google-Smtp-Source: AGHT+IENuIyjn4y6Kd4Diapx/DJ2qIcrlFgahYyQx7fvwHP4wxGW/rPqc2I+EvBmzP+d95yqVL3MWw==
X-Received: by 2002:adf:b60e:0:b0:3a4:f6ed:767a with SMTP id ffacd0b85a97d-3b496607b6dmr930547f8f.38.1751617976439;
        Fri, 04 Jul 2025 01:32:56 -0700 (PDT)
Message-ID: <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
Date: Fri, 4 Jul 2025 10:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
To: "Penny, Zheng" <penny.zheng@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2025 10:13, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 17, 2025 6:08 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Julien Grall <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-
>> cmd
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> --- a/tools/misc/xenpm.c
>>> +++ b/tools/misc/xenpm.c
>>> @@ -69,6 +69,7 @@ void show_help(void)
>>>              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>>>              "                                     set the C-State limitation (<num> >= 0) and\n"
>>>              "                                     optionally the C-sub-state limitation
>> (<num2> >= 0)\n"
>>> +            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU
>> <cpuid> or all\n"
>>>              " set-cpufreq-cppc      [cpuid] [balance|performance|powersave]
>> <param:val>*\n"
>>>              "                                     set Hardware P-State (HWP) parameters\n"
>>>              "                                     on CPU <cpuid> or all if omitted.\n"
>>> @@ -812,33 +813,7 @@ static void print_cpufreq_para(int cpuid, struct
>>> xc_get_cpufreq_para *p_cpufreq)
>>>
>>>      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>>>
>>> -    if ( hwp )
>>> -    {
>>> -        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
>>> -
>>> -        printf("cppc variables       :\n");
>>> -        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear
>> [%"PRIu32"]\n",
>>> -               cppc->lowest, cppc->lowest_nonlinear);
>>> -        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
>>> -               cppc->nominal, cppc->highest);
>>> -        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf
>> [%"PRIu32"]\n",
>>> -               cppc->minimum, cppc->maximum, cppc->energy_perf);
>>> -
>>> -        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
>>> -        {
>>> -            unsigned int activity_window;
>>> -            const char *units;
>>> -
>>> -            activity_window = calculate_activity_window(cppc, &units);
>>> -            printf("                     : activity_window [%"PRIu32" %s]\n",
>>> -                   activity_window, units);
>>> -        }
>>> -
>>> -        printf("                     : desired [%"PRIu32"%s]\n",
>>> -               cppc->desired,
>>> -               cppc->desired ? "" : " hw autonomous");
>>> -    }
>>> -    else
>>> +    if ( !hwp )
>>>      {
>>>          if ( p_cpufreq->gov_num )
>>>              printf("scaling_avail_gov    : %s\n",
>>
>> I'm not sure it is a good idea to alter what is being output for get-cpufreq-para.
>> People may simply miss that output then, without having any indication where it
>> went.
> 
> Hwp is more like amd-cppc in active mode. It also does not rely on Xen governor to do performance tuning, so in previous design, we could borrow governor filed to output cppc info
> However after introducing amd-cppc passive mode, we have request to output both governor and CPPC info. And if continuing expanding get-cpufreq-para to include CPPC info, it will make the parent stuct xen_sysctl.u exceed exceed 128 bytes.

How is the xenpm command "get-cpufreq-para" related to the sysctl interface struct
size? If you need to invoke two sysctl sub-ops to produce all relevant
"get-cpufreq-para" output, so be it I would say.

> So I'm left to create a new subcmd to specifically deal with CPPC info
> I could leave above output for get-cpufreq-para unchanged. Then we will have duplicate CPPC info in two commands. Or is it fine to do that?

Duplicate information (in distinct commands) isn't a problem either, imo.

Jason, you did the HWP work here - any thoughts?

Jan

