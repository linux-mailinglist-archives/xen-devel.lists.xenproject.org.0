Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B446A8B434
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 10:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955369.1349161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yOX-0007bN-KE; Wed, 16 Apr 2025 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955369.1349161; Wed, 16 Apr 2025 08:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yOX-0007YF-H7; Wed, 16 Apr 2025 08:45:21 +0000
Received: by outflank-mailman (input) for mailman id 955369;
 Wed, 16 Apr 2025 08:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4yOW-0007Y9-Fp
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 08:45:20 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206598a9-1a9f-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 10:45:19 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so6373122f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 01:45:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4404352a536sm33815325e9.1.2025.04.16.01.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 01:45:18 -0700 (PDT)
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
X-Inumbo-ID: 206598a9-1a9f-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744793119; x=1745397919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=45CtvZwSqAs9vVxuUalSwVD2CbjgjGDDcM9GvYrNg2A=;
        b=NIHDz+U0+OA+9JU2VcSMVIT0iceVuEtV3Nom62CrTCey/tv7cnxwpO3B8T552p/MGI
         7jSdoQtKtdwCDNn0T9Rc5znCwuYXv3gCM7Yp5JW87sFMO+IBf5IMlrj8LOnaVtjiHvPm
         de5lwOTQAaBpWE/vj+hxzh+ze73bzo76lBhf9GQqOWpjYYtQPlqKH9PDU8j9OBOdj2Ra
         vTofGfovWSwkAjsmdKgvubyF1qOiikE2RSSsXGMEicOgJB8o9KIK99IcMOzhQx5kkEkl
         nmloyER2YqEba4VSSWDTCpquneHYpWu4KqIFY4zvzLFPFbVsX6aihVUMIo6NHny52Rqm
         gwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793119; x=1745397919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45CtvZwSqAs9vVxuUalSwVD2CbjgjGDDcM9GvYrNg2A=;
        b=K5zMqcNzCfGXjgv9YxdpFvZzJy/fjJApf6Cef4uq6wY/RYYQ6yliplZdMGGutx9AhM
         tf6islGdzrZk2UxBd/YCmW1/BkveeZsfR04K5UNv8ae/dfp0bSbzhthQswfSkWZYJsdD
         US7MzH1ZHQ6jezafja96IQAiKI0nB30jjBZLouUAm6iyO0ImWB5DGjwJc8Fou5w+elc3
         i4wKFfJEph/AGytjQW0XPx938JDD/vgL6N4CNOkYRoFe8rmDll93/wVadKFf25+ELsPY
         ZhWBdAKPY5Kvob2bzzwTR+eI9SDw6ghCXoez3YKqRaLxT2Rr1rTypCVVVjvCinSnCqt9
         tuNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3s4upMolSKndWQWc1vIht0PerlqpFs9eBAsl4xZCh/hFxNWYm2WYS9/mtDBZfL/F+V9gempvIC7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYsKUGWD1vHwURqOClUFr0me/M96i6dJdzSMmlSJ3M83gCOrZx
	2WZd6EPbAe5nlxXq/8J8MG21KebU1VyaOfIlAcnnLAU9Fuorsvp0toalxdbIXQ==
X-Gm-Gg: ASbGncuMK3+L8ZVIuyLz6Wh4C9pfzP3xm/UlaAihIJqnsSF84rqCee9pJS+gtWHN5Kt
	4N1zVK8tuS9PvT8qq7VbvPWRcQOHWwq8y9MAwLxnUSpe9B15u4lZG/cDRVt7k1t73LT1moS+81v
	EUO9yVELG4veu4x+hlj2OcvPbamFDSshxVyxP0etEWcRGyUqAE7/mmlzWyHOOFB6AHSsIyluzgz
	9xLuXsCm7ZXTQTDoZ4rIJptgIp3q8mMt9ARTXFhOYXhcc7PPPsEt1c2k51k+eXnDquXvx7a4V6h
	Iz/VetwL+Tq5WY/xIZ37xK2V07NF7reFnw1cPrhc3+vC3CSChpfZ+UHXwm6lTacwRPzsy+LIctY
	NZCWney8InMcDoSij47aSZBLknA==
X-Google-Smtp-Source: AGHT+IFPPKMHIr5eRIcjgDwxOQDmwcYJqdvyQSMCmPhgthhwM50sbH/CUMd3CFHSKFBgyIigOFLZkQ==
X-Received: by 2002:a05:6000:1ac5:b0:391:4231:414 with SMTP id ffacd0b85a97d-39ee5b8943bmr887350f8f.40.1744793118945;
        Wed, 16 Apr 2025 01:45:18 -0700 (PDT)
Message-ID: <137453c3-e6b2-498d-b17d-da57988f89ef@suse.com>
Date: Wed, 16 Apr 2025 10:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-11-Penny.Zheng@amd.com>
 <df30d9fa-15dd-4923-bdaf-04f9476529d1@suse.com>
 <DM4PR12MB84519E18C6F4FA7724C03751E1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <6c5b4f07-0f7a-47aa-9469-a5a7adffe27f@suse.com>
 <DM4PR12MB8451C5EDCEAB4592434706EEE1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451C5EDCEAB4592434706EEE1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 10:38, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, April 16, 2025 2:37 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
>>
>> On 16.04.2025 05:54, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, April 1, 2025 9:10 PM
>>>>
>>>> On 26.03.2025 06:50, Penny Zheng wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -557,4 +557,9 @@ config SYSCTL
>>>>>       to reduce Xen footprint.
>>>>>  endmenu
>>>>>
>>>>> +config PM_STATS
>>>>> +   bool "Enable Performance Management Statistics"
>>>>> +   depends on ACPI && HAS_CPUFREQ && SYSCTL
>>>>> +   default y
>>>>
>>>> As per above - either name, prompt and the description that Stefano
>>>> suggested are wrong, or it is too much that is being covered by this new
>> control.
>>>>
>>>
>>> We have two sysctl-op on performance, do_get_pm_info() and do_pm_op().
>>> I think do_get_pm_info() is to collect PM statistic info, which could
>>> be wrapped with CONFIG_PM_STATS, while maybe do_pm_op() is more
>> focusing on performance tuning.
>>> How about we introduce another Kconfig CONFIG_PM_TUNE to wrap
>>> do_pm_op() and related helpers? I suggest to introduce a new file pmtune.c to
>> contain.
>>> Or any better suggestion?
>>
>> "tune" is too narrow imo. "ctrl" may be an option, but how about simply pm-op.c,
>> fitting do_pm_op() pretty nicely? Question is what else is going to end up in that
>> file.
>>
> 
> The following functions will be included in pm_op.c

To avoid another round trip just for this - I wrote pm-op.c for a reason.

> and wrapped with PM_CTRL or PM_OP
>     - get_cpufreq_para()
>     - set_cpufreq_para()
>     - set_cpufreq_gov()
>     - set_cpufreq_cppc()
>     - cpufreq_driver_getavg()
>     - cpufreq_update_turbo()
>     - cpufreq_get_turbo_status()
> And description for PM_STATS, I'll take stefano's suggestion and for PM_CTRL/PM_OP, maybe it will be
> ```
> Enable userspace performance management control to do power/performance analyzing and tuning
> ```

Reads okay at the first glance.

Jan

