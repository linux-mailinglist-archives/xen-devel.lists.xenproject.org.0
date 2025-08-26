Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373FCB356EF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 10:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094111.1449442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqp6k-0006Ot-Es; Tue, 26 Aug 2025 08:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094111.1449442; Tue, 26 Aug 2025 08:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqp6k-0006ML-C3; Tue, 26 Aug 2025 08:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1094111;
 Tue, 26 Aug 2025 08:32:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqp6j-0006MF-9z
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 08:32:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c038ce9-8257-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 10:32:43 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78d5dcbso757613066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 01:32:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48e848besm730171266b.23.2025.08.26.01.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 01:32:42 -0700 (PDT)
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
X-Inumbo-ID: 3c038ce9-8257-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756197162; x=1756801962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XY/Xr13sNAZZeD05cyJIG3z76WcNp6dlJi3Up5C8Mno=;
        b=Ss1NTAvavLZKt8HL0xJv7+xGqLQ0vfugwzmhDCzTiIbt9NO+oBFfZX8Jit6zi8ebtY
         w+LYMtl6bb3/yogmCCqbkeO9/uaZf1tnYQJl8gV0zSq62jN37maBC+EX+jCobrxHoLG3
         GV1xvGY7GKFimySHkvA4CcKLl1aid7BJsJVWalz1lPiK0uJ4fvW440exoDiia0EPyVIH
         pbUWeKeGJcv7jIdSfiuG83P2zT6NGXjdB06RibSs2ghDqEPJQqjhkBnFUNSadwvNF6JZ
         DNtP9NUPX+zEoN5WedpiQ6KlGGsbl0u/J7fTKXHxC8PRwdRqVYtXRPA5gfQRtQmavorM
         UdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197162; x=1756801962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XY/Xr13sNAZZeD05cyJIG3z76WcNp6dlJi3Up5C8Mno=;
        b=KfamocCviY3p4cyRNnogqPpxY9DRzzKqmrrX6kugbc1sTl068ZOeQR5q5ycf4MsZ76
         XObZbZre2NvglaUozGeAx56uNc47L1xyuF1iHiH03QBXxjm+N4HkrOf7PMLS1JSSSFGX
         6I6QGnKUEb0txPODvCYuo26b0a2JivCeMRPWJ3AvuVteljvt7wDyB93aBOLVpgFUXygL
         qZROZw1kdz/5ngHDMJh+P+9+gyMuIgtdrYFDvmAdYmbGiiKmXYyafm01HX9LLUKfr/qx
         tElfZRmU1zI3+P5/KCmxvh4N+JYxv+7MxWhxVaOAFl+JO1KgK6Vz6QYgFi1KD1vIq4YT
         oiCg==
X-Forwarded-Encrypted: i=1; AJvYcCVs8SFaKVmq85WkM3XxHAvE+VkygkxzVxoaGAVWuVq/XIVsgXBDQvco7LxIpelfmF9Du21ux4xoOFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznFghh173j/eNW1yRDSu0B4lflVgno+yOv89tcxajtN1HsiYBz
	Hshu92Hpbp2tlaFCA94E5sKTg8MiSWNnu8dsmiQZJGomdINVjjTge6phTr7/a+hLZw==
X-Gm-Gg: ASbGncvmFKzJFZG11xuYtIn1M6TYih9WWc0gGPfgoEth5im+iKeAtVmTaqxDdsvuvkU
	pxMKarm5k0aCkoT1v2sgwGOc7gKGu3IpED1MRfKktAwkiUc8fEGo4KlWhzFrhLwZYtjgRwfnij3
	+GTUslDxs7EYR2kSXRSZAthj87mQX1eEGhV1kxjSujcg6Z45+xRf+03iXCUb4yxlO9Ag9Nxgobq
	eWoz7dYYcKg5KfRhpkYwnCOB0mffujIvTc8Wbjl8yxr/lc0XjL8oUN1EhiJ0x/jf3inY5pUQ7WJ
	NsznempdywcNQBLyWVj+T209eWQ5bo7VBDelspN/R/P1zIJ5RDjd6JLfkGioVlGydFelenhngHJ
	KBZmNRpLWBOQZwXAu4YPi1y0DD50mdAwwWUa8Es/A7A6IshvC9kP6JfcXO3WgSvmBf4kiyQV7OY
	exqxRrT6o=
X-Google-Smtp-Source: AGHT+IFPlIvDjvLOvAm9XuGkZ+vRK0tojxxBiU5bec2CDWMsiWTfWrxzOWEd1otdwqaJ9ysiRXImEg==
X-Received: by 2002:a17:906:a115:b0:afe:7ba0:df58 with SMTP id a640c23a62f3a-afe7ba0e246mr599947866b.46.1756197162439;
        Tue, 26 Aug 2025 01:32:42 -0700 (PDT)
Message-ID: <af56fd77-7567-4fd9-89ed-340939843e51@suse.com>
Date: Tue, 26 Aug 2025 10:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-12-Penny.Zheng@amd.com>
 <b54e3460-380b-41e4-b9e9-75ba5c6129fd@suse.com>
 <DM4PR12MB845198356D8DDCE39A62DF29E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845198356D8DDCE39A62DF29E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2025 10:21, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, August 25, 2025 11:37 PM
>>
>> On 22.08.2025 12:52, Penny Zheng wrote:
>>> --- a/tools/libs/ctrl/xc_pm.c
>>> +++ b/tools/libs/ctrl/xc_pm.c
>>> @@ -288,7 +288,6 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>>>          CHK_FIELD(s.scaling_min_freq);
>>>          CHK_FIELD(s.u.userspace);
>>>          CHK_FIELD(s.u.ondemand);
>>> -        CHK_FIELD(cppc_para);
>>>
>>>  #undef CHK_FIELD
>>
>> What is done here is already less than what could be done; I think ...
>>
> 
> Emm, maybe because we define two different cpufreq para structures for user space and sysctl, struct xc_get_cpufreq_para and struct xen_get_cppc_para.
> But for cppc para, it is an alias:
> typedef struct xen_get_cppc_para xc_cppc_para_t;

Oh. Then ...

> So ...
> 
>>> @@ -366,6 +365,33 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
>>>      return ret;
>>>  }
>>>
>>> +int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
>>> +                     xc_cppc_para_t *cppc_para) {
>>> +    int ret;
>>> +    struct xen_sysctl sysctl = {};
>>> +    struct xen_get_cppc_para *sys_cppc_para =
>>> +&sysctl.u.pm_op.u.get_cppc;
>>> +
>>> +    if ( !xch  || !cppc_para )
>>> +    {
>>> +        errno = EINVAL;
>>> +        return -1;
>>> +    }
>>> +
>>> +    sysctl.cmd = XEN_SYSCTL_pm_op;
>>> +    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
>>> +    sysctl.u.pm_op.cpuid = cpuid;
>>> +
>>> +    ret = xc_sysctl(xch, &sysctl);
>>> +    if ( ret )
>>> +        return ret;
>>> +
>>> +    BUILD_BUG_ON(sizeof(*cppc_para) != sizeof(*sys_cppc_para));

... why is this here, when ...

>>> +    memcpy(cppc_para, sys_cppc_para, sizeof(*sys_cppc_para));
>>
>> ... you minimally want to apply as much checking here.

... a better effect can be had by

    cppc_para = sys_cppc_para;

?

Jan

