Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C513BA71510
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927555.1330279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOE4-0003ES-NZ; Wed, 26 Mar 2025 10:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927555.1330279; Wed, 26 Mar 2025 10:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOE4-0003Bv-KQ; Wed, 26 Mar 2025 10:43:12 +0000
Received: by outflank-mailman (input) for mailman id 927555;
 Wed, 26 Mar 2025 10:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txOE3-0003Bp-88
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:43:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad37d60-0a2f-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 11:43:08 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43948021a45so58882615e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:43:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9eef37sm16170353f8f.85.2025.03.26.03.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:43:06 -0700 (PDT)
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
X-Inumbo-ID: 1ad37d60-0a2f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742985787; x=1743590587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=94yY/NZoC7Jt7gmwdVq9Muckwc0UvBMmuDWNsS52KTc=;
        b=d2yMiPwWgwmARfj1p5jZLX+CVCDiWQuxWpfiCfnLGeG/SmhAMwkAvCephqgpLIiSeK
         DMxSJmtw1bqEze9RkoAaOT1nogg+q/UALvJfw00KjHx/DauKPR4XDKnwGJ1l0go24Jcw
         gz46ItMtGSrPmEhTP89IN3ki/EkRHH88vtzjE5Kh+XQA6l0oiGJNdrCvA/YQEO/kdQik
         ka2odPlNuJv7Eky0Kqz3cm8H8DIgaHkWpMuaxPflwkMEXMjDuxiuEYkoHZvpP3Ev4Xon
         EbZ0G7x8HRdm9npyQTAER05hX0CNx8uVCJ2mccjT0a6nS0H9EJzoImMIwbaIh+KTQDDS
         qcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742985787; x=1743590587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94yY/NZoC7Jt7gmwdVq9Muckwc0UvBMmuDWNsS52KTc=;
        b=fMHPxd7cFTgfKzq1UNFau7Al/DZU8YF0JfkzKqtWv5YU3ayaJcD4FjquNrDjTTYdmi
         vv739OjgaaLJc+Aqkxw8GNevg1/oqQvWqiT37409v+SRpWHqFOdR1vTk92cF97WJEoCR
         6gUKRu5wFK3B8eg49ziCxoeuroFEDvOB9ORdnKFwRWC5g2XrGhrZMF4Q3Vjha0e1xKFD
         zyGVMQn4A/0ImifJKFqFuaAJx54bqUqyuUZEar1XHJ1Z86dcqJvxK3n7dMEVkHfTlGCQ
         WeXhd5xxW96Pj+ms7J8+OANza5VSF6pUqcWo9KOM8h8o0HPr2eh8WMLsZq9oAb14PiyF
         Zkbg==
X-Forwarded-Encrypted: i=1; AJvYcCUWycXSZvEvYY7nFO4bLYk68H7KFCGhjw+uwnCul5pDiDSNqvcMRs7No9VjZj4BufNrag8eS5vJgRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFbtB6eVmRVWpRNSNYHMxz3i6T5oBQN7egN0jXcTuVwmARFfnk
	GlnbUNIA7b9MvlnV7JCI5lDfNuCApIY7NHZ1dgs0+Ab0t3oVKLYxZA1BKO/sfg==
X-Gm-Gg: ASbGnctftRzayxG1aPKm87ogookUrsdnaLtJcATNb07dDvJ2gvCO5r49UJwd96m6YwD
	BczcoU83cgmaDVyMMf5I0NEGfj4ZsslOEGp1G7TOAV81bN/CMO+kvfTh2ulYQYOxdp5qkQp2Axh
	Z2Mg5mce6Pq6IMrNcw4xqMaAMWRUh9eUw2wpyUyTrmf/uIAmsQngQxSUbTWVcR4PwRaevjf3N2L
	9mXP/EaheWYvt9EUCyD9Ys4qgmvAG9Te0JRvtdxVjT92DHxibIzb/ijWvlHYAvRy9yzKudNcH54
	/I5D35mowU65u/JUyEv8JFHjpfLQPRtFPE2zSopltCj/0fEdX950iJnCH2JkP9/QgTpJGuA6gyF
	tCloioBmO+8VpdZgnoS2S1IdcmyCpiw==
X-Google-Smtp-Source: AGHT+IEMnhLbOeti6NgOYcqVBOzNWxm1OEH/Jjwe5S+vVTPqxBEP9kAr6SOBMXawdIEGGsvO6JF39g==
X-Received: by 2002:a05:600c:3d85:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43d50a39becmr171643045e9.26.1742985787261;
        Wed, 26 Mar 2025 03:43:07 -0700 (PDT)
Message-ID: <94160460-357a-4852-b56d-3d89febd0e68@suse.com>
Date: Wed, 26 Mar 2025 11:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-4-Penny.Zheng@amd.com>
 <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
 <DM4PR12MB8451F07287ABC9BB683D7BD3E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451F07287ABC9BB683D7BD3E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 08:20, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 24, 2025 11:01 PM
>>
>> On 06.03.2025 09:39, Penny Zheng wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -535,7 +535,8 @@ choice of `dom0-kernel` is deprecated and not supported
>> by all Dom0 kernels.
>>>    processor to autonomously force physical package components into idle state.
>>>    The default is enabled, but the option only applies when `hwp` is enabled.
>>>
>>> -There is also support for `;`-separated fallback options:
>>> +User could use `;`-separated options to support universal options
>>> +which they would like to try on any agnostic platform, *but* under
>>> +priority order, like
>>>  `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to
>>> `xen` if  unavailable.  Note: The `verbose` suboption is handled
>>> globally.  Setting it  for either the primary or fallback option
>>> applies to both irrespective of where
>>
>> What does "support" here mean? I fear I can't even suggest what else to use, as I
>> don't follow what additional information you mean to add here. Is a change here
>> really needed?
> 
> There are two changes I'd like to address:
> 1) ";" is not designed for fallback options anymore, like we discussed before, we would
> like to support something like "cpufreq=hwp;amd-cppc;xen" for users to define all universal options
> they would like to try.

Why would the meaning of ; change? There's no difference between having a single
fallback option from hwp, or two of them from amd-cppc.

> 2) Must under *priority* order. As in cpufreq_driver_init(), we are using loop to decide which driver to
> try firstly. If user defines "cpufreq=xen;amd-cppc", which leads legacy P-state set before amd-cppc in cpufreq_xen_opts[],
> then in the loop, we will try to register legacy P-state firstly, once it gets registered successfully, we will not try to register amd-cppc at all.

This in-order aspect also doesn't change.

Overall I fear I don't feel my question was answered.

>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>> +    if ( arg[0] && arg[1] )
>>> +        ret = cpufreq_cmdline_parse(arg + 1, end);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int __init cpufreq_cmdline_parse_hwp(const char *arg, const
>>> +char *end) {
>>> +    int ret = 0;
>>> +
>>> +    xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
>>> +    cpufreq_controller = FREQCTL_xen;
>>> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
>>> +    if ( arg[0] && arg[1] )
>>> +        ret = hwp_cmdline_parse(arg + 1, end);
>>> +
>>> +    return ret;
>>> +}
>>
>> For both of the helpers may I suggest s/parse/process/ or some such ("handle"
>> might be another possible term to use), as themselves they don't do any parsing?
>>
> 
> Maybe I mis-understood the previous comment you said
> ```
>         >          else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
>         > ```
> 
>         For the rest of this, I guess I'd prefer to see this in context. Also with
>         regard to the helper function's name.
> ```
> I thought you suggested to introduce helper function to wrap the conditional codes...
> Or may you were suggesting something like:
> ```
> #ifdef CONFIG_INTEL
> else if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
> {
>     xen_processor_pmbits |= XEN_PROCES
>     ...
> }
> #endif
> ```

Was this reply of yours misplaced? It doesn't fit with the part of my reply in
context above. Or maybe I'm not understanding what you mean to say.

>> In the end I'm also not entirely convinced that we need these two almost identical
>> helpers (with a 3rd likely appearing in a later patch).

Instead it feels as if this response of yours was to this part of my comment.
Indeed iirc I was suggesting to introduce a helper function. Note, however, the
singular here as well as in your response above.

Jan

