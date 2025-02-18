Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B695A3A091
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:56:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891827.1300844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP0q-0002vK-7B; Tue, 18 Feb 2025 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891827.1300844; Tue, 18 Feb 2025 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP0q-0002tN-4Y; Tue, 18 Feb 2025 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 891827;
 Tue, 18 Feb 2025 14:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkP0o-0002ry-LB
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:55:50 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70da06a0-ee08-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 15:55:49 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abb75200275so437892366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:55:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb99fd1983sm411292866b.108.2025.02.18.06.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:55:48 -0800 (PST)
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
X-Inumbo-ID: 70da06a0-ee08-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739890549; x=1740495349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3CaBfu5tjaIr7h06pH+Vr5s4jHvi+DeI7NX0QLXgr3c=;
        b=dufaBQ68HOcjpiJ/nbTWp7O0gBT46HIrAX4HzytozMONwDzb+cCHZU17mr8FHw/II5
         gWoKSmI5PGqAeKJpMi+Ykc4Xkhnbrgw+5IZhe94ruV+26hiXwe3qZF+YtzxSNCz75wgw
         V6R6+zAU44S5dgUczFJaCdVkPjibkHS+sgQAaQ41zmN9+M3Fm2k+yZk3gwhe1icHu3OK
         ttHG+OLTN9Z5Ai1Vkr6mtbBHYxOXqqRv4Vk+gIjim/Zi1qzP0zY9gOIRYdpirDrvlb+h
         TQyiOert6J2cYOZeM0pV3R022SK4zLdE33UFhxChI7HFp4s5RRzp418mH+KAZZWpHUS/
         Qs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739890549; x=1740495349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CaBfu5tjaIr7h06pH+Vr5s4jHvi+DeI7NX0QLXgr3c=;
        b=UzKWWjwsrMLmH0wG4nVd+CxqiHL+meWyGGakQrkgkHR6dj2gBleLA4uvE5cVDDW+Zx
         60rJzOKsFT1PppJZ6TYksjFqt6rpMfHpH3fgBYmrdnofbtAgCE0ZRTlykKq946/jZDJz
         dhDC+ZeszOIntBjyyyRNfYL2YFOvYX55XueHmeJU4+LxaU+oVnD9pD+grHtMzEa7bVsi
         lfGFajy6ZgiFn+toGAlCZwME7klOu4LP/9b/Zc3KBLypJn934+S87QIOpWoVKJpyFo4j
         YbuRshO5MzB2gP/q/13h9zU8ZnfzN2NN/z2O4CCbR9lJUy4r2b35JKXySzCj6cmF3B4l
         4Rkw==
X-Forwarded-Encrypted: i=1; AJvYcCXe96pYPuPgBZ4wDTppk7N7NLYsNSmH7+ylwtTPxLvOOiVfm+rDQJTN6SU2Ol5JP0FdwrtHP721DCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc05B5eu/QTisjCkqvo33dRUkiJbYwknALDLrh+0WnTkcF8Euj
	eMcfkAjR8QOueylT9GhYXdL69VWQHQJ+ReS1baxdudHc5db0dVwzzDCBEjYjfA==
X-Gm-Gg: ASbGncsGDd8lylfPNx328RV6KK6VP6Rya7OlF+SAF5635UVV/hL2DQIcf/FGVHUA7zE
	RtlWdag8QRuvu8mZma9J1umJriObGW7OCWOduJek75el3sVnKwx5Wz7s92WnTcDrai8nwexniVn
	ymCXn6Q7Iml667eG8xTb952McUe5uyAL2Fcuhy5w70peKxACSQEPIKYrdMsW4MgR4cD0gk9yIAm
	FI4venByOsYP/xZGS1TRZJQBcRUff6x1FzcvnqmrJqtN6oX9f4ZZ2IVqbwpwh9Qu2YVpDSs7i3M
	hzcLE4PaZZTQKJP28NQ3/JiueCsNZtp1hh6492NZ38BfDuBXSRW/2E7eL8fwErsR/7p6s0ghqZE
	l
X-Google-Smtp-Source: AGHT+IEKf+wWX2pgr9oepBM13ph/9PNuNZJUB8ZbQukIM1R2DSh3Mkl06b0MuLqpSQJ5+M7z9e1nlw==
X-Received: by 2002:a17:906:4116:b0:ab7:ea59:2120 with SMTP id a640c23a62f3a-abb70a7c980mr1231592566b.10.1739890548718;
        Tue, 18 Feb 2025 06:55:48 -0800 (PST)
Message-ID: <77bcd512-eea4-4098-bfe8-c7442cdf4fe9@suse.com>
Date: Tue, 18 Feb 2025 15:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
 <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
 <DM4PR12MB8451A3D08427CDD412AA650DE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <f9dccb9b-24e9-416f-bfd7-787b8df4b617@suse.com>
 <DM4PR12MB84519F089FBB09112A16D438E1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519F089FBB09112A16D438E1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 05:24, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, February 17, 2025 6:34 PM
>>
>> On 17.02.2025 11:17, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, February 11, 2025 8:09 PM
>>>>
>>>> On 06.02.2025 09:32, Penny Zheng wrote:
>>>>> @@ -131,6 +131,15 @@ static int __init cf_check
>>>>> setup_cpufreq_option(const
>>>> char *str)
>>>>>              if ( arg[0] && arg[1] )
>>>>>                  ret = hwp_cmdline_parse(arg + 1, end);
>>>>>          }
>>>>> +        else if ( choice < 0 && !cmdline_strcmp(str, "amd-cppc") )
>>>>> +        {
>>>>> +            xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
>>>>> +            cpufreq_controller = FREQCTL_xen;
>>>>> +            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_amd_cppc;
>>>>
>>>> While apparently again a pre-existing problem, the risk of array
>>>> overrun will become more manifest with this addition: People may
>>>> plausibly want to pass a universal option to Xen on all their instances:
>>>> "cpufreq=hwp,amd-cppc,xen". I think this wants taking care of in a prereq patch,
>> i.e.
>>>> before you further extend it. Here you will then further want to bump
>>>> cpufreq_xen_opts[]'es dimension, to account for the now sensible three-fold
>> option.
>>>>
>>>
>>> Correct me if I'm wrong, We are missing dealing the scenario which looks like the
>> following:
>>> "cpufreq=amd-cppc,hwp,verbose".
>>
>> Not so much this one (can it even overflow). It's "cpufreq=amd-cppc,hwp,xen"
>> that I'm concerned about (or, prior to your change something redundant like
>> "cpufreq=hwp,hwp,xen").
> 
> I misunderstood before, sorry
> What is the appropriate behavior when user passes an option to Xen, like "cpufreq=amd-cppc,hwp,xen" ?
> FWIT, amd-cppc and hwp are incompatible options.

Sure, but as said people may want to use something like this uniformly on
all their systems, be them AMD or Intel ones. IOW ...

> Send the error info to tell them you shall choose either of them, amd-cppc, or hwp, or xen?

... no, I don't think this should be an error.

> If user wants to add fall back scheme, when amd-cppc is hardware unavailable, we fall back to xen. user shall
> use ";", not "," to add, like "cpufreq=amd-cppc;xen"

Well, I didn't closely check whether the separator is to be semicolon or
comma. Things is that people may want to use one single command line
option across all their systems, old or new, Intel or AMD. Hence they may
want to ask to use HWP is available, CPPC is available, or fall back to
what we have had for ages. Yet they will also need to have a way to
express that they want only HWP and CPPC to be tried, without falling
back to the legacy driver. Hence we may not automatically fall back to
that if "amp-cppc" was passed, but is unavailable.

Jan

