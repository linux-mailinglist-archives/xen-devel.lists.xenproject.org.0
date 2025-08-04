Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C19B19DEF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068967.1432818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqrw-00014U-Lm; Mon, 04 Aug 2025 08:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068967.1432818; Mon, 04 Aug 2025 08:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqrw-000128-J5; Mon, 04 Aug 2025 08:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1068967;
 Mon, 04 Aug 2025 08:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiqru-000122-Sh
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:48:30 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca814d5e-710f-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 10:48:28 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso3812128a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:48:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8effda1sm6458526a12.1.2025.08.04.01.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:48:27 -0700 (PDT)
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
X-Inumbo-ID: ca814d5e-710f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754297308; x=1754902108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rvSVJ95foTsBpRFS+4SvOU3DjjCK8hnlcDIJbxe2lE0=;
        b=JE1ExhIwQ0Z2cd5zJfyccnROduw3kLbBChFeZrOdE7UpIdKqmNrbdDmMvne/qKmBMS
         b0bmO64WKI77CbpbHnRQ37WRl57YaM27C5uupH5qmSMXUp1Two6hMmpbsb0x9qrj3dC0
         6HxzXdfOmTUf9zYz6pPufSStdH9jNdAFruKpXBCk31/w6fDnJVuqPXMUOE3Ume45Xeio
         ejfxjQ9JDCYdNj3wltkju6e58kIdJs7JLw0//3id5zbiW+IPkO74dINH+db97EnSc0c8
         ku10c9TnCkq7abOBOgxnNNDqRV6G1gJM5w0q3CBL3PYLqroJ5F9+XB1vT1Ytam1aV0DJ
         wwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754297308; x=1754902108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvSVJ95foTsBpRFS+4SvOU3DjjCK8hnlcDIJbxe2lE0=;
        b=AYosL9Hwo36GCAlCenHmvQA+QwOKhWvaiYylckXOuYQ2r6wxpANIElfOu5+5tCLQnd
         F6IzJe1l5SSxNjSltewwLt1hPFzSrimH8gC5AdiM4OMloxix7OXRqo5P2kUBD4rS0zdW
         eOP6iQw0c88BDOGWcJ9P3KE8qQC0FMV/2GnZSoOSJGvRrkpvxSvy8C7CG5gcBZrpeUnK
         hMY8LAnzkF31hb4HVZi+VRmueQTVO849Btxx6sI2FoUtcXJLdIJrjn5VvWN0jr+L//xO
         wrd/SZCW81dYXKckwq1Ivyk+5FLiCAtGj7SdFzN2E7SfLiySCxlk5kxtg3zY5nocLvoC
         +Z5w==
X-Forwarded-Encrypted: i=1; AJvYcCWOQfCjAIuKgRJE08GqEufktpJfH5qlebIMhXmSL54RfwJyPG04L8KYC1Urtf6x6ewfMWz5tIfizDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIJ3TCFsxPkZxflXASBzs4zLi3yLjaIhmjYLNM8n6dwO8v0QCP
	dMZDhSdOlJkbghcwKaK11WsFeQpccsNdYoeFTqWFobq5vPIOc/Waz34JHkwr1Wc+5g==
X-Gm-Gg: ASbGncuZz49ZTf5rP1Jv5JdVZeX97fhglfZsVo6iYPk8o50vR+7fX9O3ZG9cpbX7/kN
	go81OmqyLPhYZ3DMu4rbFdsV4abfr7gENQMrDNW34tbDXq9kX5piSaGNJ1zRdc7vagY/TcjvjcM
	lxmLjHII0Y4SiFjqLFQo00otFMAw9Dtv1tEudXaUhD4N7uTVxjWyFa8XkzEua8F7SVpjpnFugjQ
	4CWT+aM/6Xzkv06bevysnKcZp+yd7/F+cvCuGbELTn8yH6Kq4nr5zC3dIOTwQtW5OmuMYBi0WQx
	CPA510CckJvBvrRcAZCcJnUKZnj3fCuks1BH+7STSFkhorNpTgEim1EPzNqPtRJRfCon7Oxt7j7
	YKKpROpsvEBwZp2G4HIDSDleNNluaeI3mHR3LbPEZn+336yV2EFSVLZOJAhbKEyha8p+TjwudSq
	3vdj5JgCbEq/BObkjevw==
X-Google-Smtp-Source: AGHT+IG9INVx7HPbSjkfNR9Yg9TZA31ptT4Dr/p5609Q2k+8O2Vmuu8f5EDewgvXBsddWlOt+ZzQqQ==
X-Received: by 2002:a05:6402:26cf:b0:615:920d:4de5 with SMTP id 4fb4d7f45d1cf-615e6ed63a5mr6588882a12.12.1754297307921;
        Mon, 04 Aug 2025 01:48:27 -0700 (PDT)
Message-ID: <a2411fcd-d6b1-4912-b00a-b331ab472f50@suse.com>
Date: Mon, 4 Aug 2025 10:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-12-Penny.Zheng@amd.com>
 <a11aa19e-a151-469b-a58d-bc31fc4d7e01@suse.com>
 <DM4PR12MB8451FD535917A84B3054C93CE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451FD535917A84B3054C93CE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2025 10:09, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, July 17, 2025 12:00 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
>> and amd-cppc driver
>>
>> On 11.07.2025 05:50, Penny Zheng wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> @@ -128,12 +128,14 @@ static int __init cf_check
>>> cpufreq_driver_init(void)
>>>
>>>      if ( cpufreq_controller == FREQCTL_xen )
>>>      {
>>> +        unsigned int i = 0;
>>
>> Pointless initializer; both for() loops set i to 0. But also see further down.
>>
>>> @@ -157,9 +164,70 @@ static int __init cf_check
>>> cpufreq_driver_init(void)
>>>
>>>          case X86_VENDOR_AMD:
>>>          case X86_VENDOR_HYGON:
>>> -            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -
>> ENODEV;
>>> +            if ( !IS_ENABLED(CONFIG_AMD) )
>>> +            {
>>> +                ret = -ENODEV;
>>> +                break;
>>> +            }
>>> +            ret = -ENOENT;
>>
>> The code structure is sufficiently different from the Intel counterpart for this to
>> perhaps better move ...
>>
>>> +            for ( i = 0; i < cpufreq_xen_cnt; i++ )
>>> +            {
>>> +                switch ( cpufreq_xen_opts[i] )
>>> +                {
>>> +                case CPUFREQ_xen:
>>> +                    ret = powernow_register_driver();
>>> +                    break;
>>> +
>>> +                case CPUFREQ_amd_cppc:
>>> +                    ret = amd_cppc_register_driver();
>>> +                    break;
>>> +
>>> +                case CPUFREQ_none:
>>> +                    ret = 0;
>>> +                    break;
>>> +
>>> +                default:
>>> +                    printk(XENLOG_WARNING
>>> +                           "Unsupported cpufreq driver for vendor AMD or Hygon\n");
>>> +                    break;
>>
>> ... here.
>>
> 
> Are we suggesting moving
> "
>         if ( !IS_ENABLED(CONFIG_AMD) )
>         {
>                 ret = -ENODEV;
>                 break;
>         }
> " here? In which case, When CONFIG_AMD=n and users doesn't provide "cpufreq=xxx", we will have cpufreq_xen_cnt initialized as 1 and cpufreq_xen_opts[0] = CPUFREQ_xen. powernow_register_driver() hence gets invoked. The thing is that we don't have stub for it and it is compiled under CONFIG_AMD
> I suggest to change to use #ifdef CONFIG_AMD code wrapping
> 
>>> +                }
>>> +
>>> +                if ( !ret || ret == -EBUSY )
>>> +                    break;
>>> +            }
>>> +
>>>              break;
>>>          }
>>> +
>>> +        /*
>>> +         * After successful cpufreq driver registeration,
>> XEN_PROCESSOR_PM_CPPC
>>> +         * and XEN_PROCESSOR_PM_PX shall become exclusive flags.
>>> +         */
>>> +        if ( !ret )
>>> +        {
>>> +            ASSERT(i < cpufreq_xen_cnt);
>>> +            switch ( cpufreq_xen_opts[i] )
>>
>> Hmm, this is using the the initializer of i that I commented on. I think there's
>> another default: case missing, where you simply "return 0" (to retain prior behavior).
>> But again see also yet further down.
>>
>>
>>> +            /*
>>> +             * No cpufreq driver gets registered, clear both
>>> +             * XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX
>>> +             */
>>> +             xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_CPPC |
>>> +                                       XEN_PROCESSOR_PM_PX);
>>
>> Yet more hmm - this path you want to get through for the case mentioned above.
>> But only this code; specifically not the "switch ( cpufreq_xen_opts[i] )", which really
>> is "switch ( cpufreq_xen_opts[0] )" in that case, and that's pretty clearly wrong to
>> evaluate in then.
> 
> Correct me if I understand you wrongly:
> The above "case missing" , are we talking about is entering "case CPUFREQ_none" ?
> IMO, it may never be entered. If users doesn't provide "cpufreq=xxx", we will have cpufreq_xen_cnt initialized as 1 and cpufreq_xen_opts[0] = CPUFREQ_xen. That is, we will have px states as default driver. Even if we have failed px-driver initialization, with cpufreq_xen_cnt limited to 1, we will not enter CPUFREQ_none.
> CPUFREQ_none only could be set when users explicitly set "cpufreq=disabled/none/0", but in which case, cpufreq_controller will be set with FREQCTL_none. And the whole cpufreq_driver_init() is under " cpufreq_controller == FREQCTL_xen " condition
> Or "case missing" is referring entering default case? In which case, we will have -ENOENT errno. As we have ret=-ENOENT in the very beginning

Sorry, this is hard to follow. Plus I think I made the main requirement quite
clear: You want to "retain prior behavior" for all cases you don't deliberately
change to accommodate the new driver. Plus you want to watch out for pre-
existing incorrect behavior: Rather than proliferating any, such would want
adjusting.

Jan

