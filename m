Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84E9AC04D2
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 08:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992954.1376413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzlt-0007T3-UB; Thu, 22 May 2025 06:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992954.1376413; Thu, 22 May 2025 06:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzlt-0007PW-Qs; Thu, 22 May 2025 06:51:17 +0000
Received: by outflank-mailman (input) for mailman id 992954;
 Thu, 22 May 2025 06:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHzls-0007PQ-KN
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 06:51:16 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 274fd9c4-36d9-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 08:51:14 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6016d401501so10176009a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 23:51:14 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d501e19sm10401525a12.22.2025.05.21.23.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 23:51:11 -0700 (PDT)
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
X-Inumbo-ID: 274fd9c4-36d9-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747896674; x=1748501474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bd4mK2u+CfFvys3QXUw7XXnjE55NQfDRpthBE3KeDDE=;
        b=biG6yi5TiSlYFoFeFv5c2pAZ2WkcaHTMDywvbjrN+P7Y+vNz4D8HAhsPt+80y8rduM
         LTcbBLtRCrU4T9Zc0ASThA2bxX62Cd6Cw2CWP0ASjOWxgqRMPwmuwrlJgCctE1ZNmZSr
         o6CDdQ4rI9IyaVy9kBWqgXq+SakI5xy/Aqv6CZW2ZpAkNc4ABz8z3sZpgtXpSqZHnFB6
         27gBp1RKWV6c6oxvHyOoC3O3YdWB39GEOp1Cpcs7PjoZ5xRzoImc5dACk6MrHzZ0wkbo
         8sueviXQbqqFmDKjqzg102mUxVnQTxfoLfXIBUuU+YWHzeohsmQaBM3mEfng3kMXDhQV
         sWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747896674; x=1748501474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd4mK2u+CfFvys3QXUw7XXnjE55NQfDRpthBE3KeDDE=;
        b=NHBpBkzM11tQMVVy+13hGM7rbPApP327fmfBObmxqQXX+s51guQJjlkkhDjM77st3o
         JnHhYaNyvDrB5OChp2nUWpWpqG5EKNwKYX644zkDqTHdfmkXNOSGa7SnO1ZsXVpV1LIj
         PLO/28ExYFr8cxvCo043FRovCAjpsB4kzIAuhom5Ym6co7vHIc3AQ0avf/BajG27dsNj
         qR7XviTUJKSgPNOyEBdG7LLWqDYaE9ZlDgGdUqV31BFe8LlDpuyEp9P+8F0oUXsQwO9G
         e4zYGMMKMbo9/ttOk+hPj0rJiFo6VcE4E8IxHimtEzXCQbN+bBuOEmA1QlSAAYCKrkIZ
         tvyg==
X-Forwarded-Encrypted: i=1; AJvYcCVuKCHox9WbLO8rq+sZrT7dpGoMZlqwdUaBaa5bKlau1m91guTcftDTPTdvZjJEl6051Qi+aElordM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaDY468gGg5sf4gEqmsf+RLCmmJ0C9GlV0nWu0VdWwAd/FJ0a0
	V2+VZoUdmqPWF9DS/MieOvpl6hL8GRCtgWabGyNSwXPAu0p2tNVQDxiLiJIoQSKGmA==
X-Gm-Gg: ASbGncsyqMuQ4+Q9p/mmSRBqGf8kIf82UwKA0yjH5KFiwu7TUYrV8qSeItW6i/7n6M/
	n8t9Lc73qq6lb0+qFLLS/xzcsaR6LJRa69gnFoGaA32zKdnG2VzQhcyRhCJRLzYa6Zu7oYvdBt6
	928pm/Egc/PRA7F4BHFi1vPLP6SCMDF9FhFfSkMFnc6glfa9v8AlyHqnpyEVx60tTUZGTfpHmUq
	JSECcJ0PHnsagJTmzaIbOxJmQWqdwI7e3/CScAWT7LvM2XY0nANSASnjY0DVUggtMdWKs3mf1Id
	d8Tlyk/W2PXLqnXn+pi1T5lVP8mbQXoWnyt6XMqQQw5Z00jkcCYb6ESjzt603SSPNx+NXG2A
X-Google-Smtp-Source: AGHT+IHrHFNLJNTvFNdFHpx9TiLdPBXsI3TDI4zyzd1hfPOA/ApNrmXzT8gfyXxPxK8t+wz7HZZx1g==
X-Received: by 2002:a05:6402:50cf:b0:5f7:f55a:e5e1 with SMTP id 4fb4d7f45d1cf-600900e014bmr19760528a12.24.1747896672037;
        Wed, 21 May 2025 23:51:12 -0700 (PDT)
Message-ID: <eaec44d4-8ff5-4b58-8b8e-d7a4d526a5bc@suse.com>
Date: Thu, 22 May 2025 08:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-16-Penny.Zheng@amd.com>
 <239e1256-a47d-44e1-a335-2199b880f5d7@suse.com>
 <DM4PR12MB845151DE494A9E7EF888E402E199A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM4PR12MB845151DE494A9E7EF888E402E199A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 07:59, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, April 30, 2025 11:02 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 15/15] xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC
>> xen_sysctl_pm_op for amd-cppc driver
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
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
>>> +
>>> +    /* Activity window not supported in MSR */
>>> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    /* Return if there is nothing to do. */
>>> +    if ( set_cppc->set_params == 0 )
>>> +        return 0;
>>> +
>>> +    epp = per_cpu(epp_init, cpu);
>>> +    /*
>>> +     * Apply presets:
>>> +     * XEN_SYSCTL_CPPC_SET_DESIRED reflects whether desired perf is set,
>> which
>>> +     * is also the flag to distiguish between passive mode and active mode.
>>> +     * When it is set, CPPC in passive mode, only
>>> +     * XEN_SYSCTL_CPPC_SET_PRESET_NONE could be chosen, where
>> min_perf =
>>> +     * lowest_nonlinear_perf to ensures performance in P-state range.
>>> +     * when it is not set, CPPC in active mode, three different profile
>>> +     *
>> XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANC
>> E are provided,
>>> +     * where min_perf = lowest_perf having T-state range of performance.
>>> +     */
>>
>> I fear I'm struggling to parse some of this, making it difficult to suggest possible
>> adjustments (as I can't derive what is meant to be said). Plus where's the term T-
>> state coming from all of the sudden?
>>
> 
> Pasting description on "lowest_perf" and "nonlinear_lowest_perf":
> "
> Lowest Nonlinear Performance is the lowest performance level at which nonlinear power savings are achieved, for example, due to the combined effects of voltage and frequency scaling. Above this threshold, lower performance levels should be generally more energy efficient than higher performance levels. In traditional terms, this represents the P-state range of performance levels.
> 
> Lowest Performance is the absolute lowest performance level of the platform. Selecting a performance level lower than the lowest nonlinear performance level may actually cause an efficiency penalty, but should reduce the instantaneous power consumption of the processor. In traditional terms, this represents the T-state range of performance levels.
> "

And again "T-state". The only T-ish thing I'm aware of is something that
was never implemented in Xen's power management. Hence I fear I continue
to be confused. (And btw, I searched PM vol 2 for the term, and it doesn't
occur there at all.) As a result ...

> IMO, in passive mode, we rely on Xen governor to do performance tuning. And Xen governor is thinking based on P-states. So I take non-linear lowest perf as min_perf
> While in active mode, hardware itself is calculating suitable performance/frequency automatically based on workload, thermal, voltage, and etc. So maybe setting min_perf with lowest perf is a better choice?

...answering this question isn't possible for me (yet).

>>> +        ret = get_amd_cppc_para(policy->cpu,
>>> + &op->u.get_para.u.cppc_para);
>>> +
>>> +    if ( strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
>>> +                 CPUFREQ_NAME_LEN) &&
>>> +         strncmp(op->u.get_para.scaling_driver,
>> XEN_AMD_CPPC_EPP_DRIVER_NAME,
>>> +                 CPUFREQ_NAME_LEN) )
>>>      {
>>>          if ( !(scaling_available_governors =
>>>                 xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
>>
>> Isn't it the non-EPP driver which is governor-independent?
>>
> 
> EPP driver is governor-independent, indicating active mode.

I'm confused here as well then: Early in the series, before the EPP driver
is introduced (i.e. as preparation for the non-EPP one) you suppress use
and reporting of the governor. Whereas for the EPP driver while you (also)
don't use the governor as such, you use the choice of governor to determine
the EPP setting. In that sense to me the EPP driver is less governor-
independent than the non-EPP one. That's what I tried to express in my
earlier reply.

Jan

> Hardware itself will automatically calculate and set frequency. User only shall set min_perf, max_perf, and EPP at the beginning.
> EPP is a preference ratio value towards performance over powersave, on the scale of 0-255, 0 as 100% percentage favoring performance, while 255 as 100% percentage favoring powersave
> Non-EPP driver is still relying on Xen governor to do the tuning.
> 
>> Jan


