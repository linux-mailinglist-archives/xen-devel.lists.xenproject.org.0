Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51529ADC61A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 11:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018006.1394918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSVB-0002UY-FM; Tue, 17 Jun 2025 09:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018006.1394918; Tue, 17 Jun 2025 09:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSVB-0002T4-CG; Tue, 17 Jun 2025 09:21:09 +0000
Received: by outflank-mailman (input) for mailman id 1018006;
 Tue, 17 Jun 2025 09:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRSVA-0002Sy-2T
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 09:21:08 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66300aeb-4b5c-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 11:21:07 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4510971f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 02:21:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236934a9be9sm8393765ad.47.2025.06.17.02.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:21:05 -0700 (PDT)
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
X-Inumbo-ID: 66300aeb-4b5c-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750152066; x=1750756866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LiFy+lU0j8w4MeGQcckXznrKwlEJssO7K8m0olMxEPc=;
        b=UJSSMd6tyxwspjw01RYdUwYbCgTaLTwRq246+iL0I3/iVSKKfql+A/QTwQNm5OZ1w2
         CNH3dNUj2MD2rXI4jzGE306ThJwyJRk8qY94YwV0GL+5PoxNrZDKffmxaj45hNgFufV3
         MLI8zKDfyBkRZQ77vnWvOTloH1WKFn56VkGCyI4zpqT6VZrF8SjAPFkratA/LigC/61g
         nZFBGdQ+B+Mb6fQqXZPNM9/cDXQqwSnIZOEEJ+QQjGlJNcd3UdU3RrTXTb0nxc3U8w0W
         4gLxbyGVC8ps/BeEzzgWNjij5N6+7RgjoQIR6PLq9a9PZpGen08YflWDBapmxbWJT28g
         8vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152066; x=1750756866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiFy+lU0j8w4MeGQcckXznrKwlEJssO7K8m0olMxEPc=;
        b=e+WkTne5qtI/7xfxPUJUiTbsCBsijInxgIrUIfTA0T9Eis9F/IJG3dF/7cXoDXMN6t
         fg/tzSwYVT4/5j+X1iMtSjRevlEqpJ7UGrB75QhDTioghBXldIz8XVNrkreYKJh2hROt
         oNCTLQLm7mAg+zwitVFGpE4Ab7SpN9cMOPflw4LlxCtalaQfWfa9X6c+38JLYnYGnDxS
         UA3PQxLgavqtdAvfvUCTcHdAuAs+SKsPEEFXhkmcGoRh1VX8A7OQ0RXi0PbVnlBccyAZ
         gxOucoGtHLpn8y1ZGgjJl8X9lRy39x+bny+s/kiTUBqz4M57IcV+osdN/XAtuQ0eQCYw
         pdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8nWwDZsdVn7tZnZW016j9Ll4uvuSQMF30KKu6WHm/9Ls1C5nNI/ltJVXEccSWeVVakASs6bvljOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxueGzkJYCz40/klSVWmvItk8tsVeakhHkQxGQrvJIlUCRENFqj
	gH0geAo9d/vCEql4phXyhwLFOJP7WT7Oq2GJ+Xr5oaCEKiNQQ/00f3+a4kju+ebDig==
X-Gm-Gg: ASbGncvLlr+97ccV8bAyvZIfw8yTSiJmXcV9vvi5P6oO44uOC4fn5C3o3Aas13HBqLb
	ZViMP2x40DcJENIQBOTFlY/xNTyez4DH/2x7TrBOqW2jCTEsyYxP4QBffF2XMgQD2eU/6Grl8kX
	cRQZLw3qRjXfZpLi+nGPAgiYYUWmQtimLhzU/EGQWuedcj0wNw4O3fv683COcJffXN16iixYWo2
	0E0wcxjZvMdn4wB3VbcszF6712OTfI/vcCjXIkJRlYjJfrL+KYM9zoohzDL9tjDjmjH0BYY9dyO
	tulqBRjc6/sompUTYUbF8S25KXokoMcS/OZNZfy+7bp2zKZF0TwbZ6N+sNat30t5t9xBO/BwfZg
	g0KHHydXrNTYSkGOBcmW6kTJQDSzQ4X3CwaUD53jdJkCCygEH+TqEm+D/SQ==
X-Google-Smtp-Source: AGHT+IFaHQzj0MirwfyIOAWq7Ss4/ea1aKyXAKi26Qt14UnhsL+9+crgrWLtvhoan8fJDi9Zk0btEg==
X-Received: by 2002:a05:6000:2310:b0:3a4:f7ae:77ca with SMTP id ffacd0b85a97d-3a57236773fmr10771831f8f.3.1750152066480;
        Tue, 17 Jun 2025 02:21:06 -0700 (PDT)
Message-ID: <4068d1cd-6328-445e-a2f2-e5384f3a9fa5@suse.com>
Date: Tue, 17 Jun 2025 11:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-7-Penny.Zheng@amd.com>
 <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
 <DM4PR12MB8451ABA583A373B1C2FBEE46E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451ABA583A373B1C2FBEE46E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2025 09:15, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, June 12, 2025 6:42 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
>> cmdline
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> Users need to set "cpufreq=amd-cppc" in xen cmdline to enable amd-cppc
>>> driver, which selects ACPI Collaborative Performance and Power Control
>>> (CPPC) on supported AMD hardware to provide a finer grained frequency
>>> control mechanism.
>>> `verbose` option can also be included to support verbose print.
>>>
>>> When users setting "cpufreq=amd-cppc", a new amd-cppc driver shall be
>>> registered and used. All hooks for amd-cppc driver are transiently
>>> missing and will be implemented in the ongoing commits.
>>>
>>> New xen-pm internal flag XEN_PROCESSOR_PM_CPPC is introduced, to be
>>> differentiated with legacy XEN_PROCESSOR_PM_PX. We define
>>> XEN_PROCESSOR_PM_CPPC 0x100, as it is the next value to use after
>>> 8-bits wide public xen-pm options. All xen-pm flag checking involving
>>> XEN_PROCESSOR_PM_PX shall also be updated to consider
>> XEN_PROCESSOR_PM_CPPC now.
>>>
>>> Xen is not expected to support both or mixed mode (CPPC & legacy PSS,
>>> _PCT,
>>> _PPC) operations, so only one cpufreq driver gets registerd, either
>>> amd-cppc or legacy P-states driver, which is reflected and asserted by
>>> the incompatible flags XEN_PROCESSOR_PM_PX and
>> XEN_PROCESSOR_PM_CPPC.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> v1 -> v2:
>>> - Obey to alphabetic sorting and also strict it with CONFIG_AMD
>>> - Remove unnecessary empty comment line
>>> - Use __initconst_cf_clobber for pre-filled structure cpufreq_driver
>>> - Make new switch-case code apply to Hygon CPUs too
>>> - Change ENOSYS with EOPNOTSUPP
>>> - Blanks around binary operator
>>> - Change all amd_/-pstate defined values to amd_/-cppc
>>> ---
>>> v2 -> v3
>>> - refactor too long lines
>>> - Make sure XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC
>> incompatible
>>> flags after cpufreq register registrantion
>>> ---
>>> v3 -> v4:
>>> - introduce XEN_PROCESSOR_PM_CPPC in xen internal header
>>> - complement "Hygon" in log message
>>> - remove unnecessary if()
>>> - grow cpufreq_xen_opts[] array
>>> ---
>>> v4 -> v5:
>>> - remove XEN_PROCESSOR_PM_xxx flag sanitization from individual driver
>>> - prefer ! over "== 0" in purely boolean contexts
>>> - Blank line between non-fall-through case blocks
>>> - add build-time checking between internal and public
>>> XEN_PROCESSOR_PM_* values
>>> - define XEN_PROCESSOR_PM_CPPC with 0x100, as it is the next value to
>>> use after public interface, and public mask SIF_PM_MASK is 8 bits wide.
>>> - as Dom0 will send the CPPC/Px data whenever it could, the return
>>> value shall be 0 instead of -ENOSYS/EOPNOTSUP when platform doesn't require
>> these data.
>>> ---
>>>  docs/misc/xen-command-line.pandoc         |  7 ++-
>>>  xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
>>>  xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 68 +++++++++++++++++++++++
>>>  xen/arch/x86/acpi/cpufreq/cpufreq.c       | 63 ++++++++++++++++++++-
>>>  xen/arch/x86/platform_hypercall.c         | 13 ++++-
>>>  xen/drivers/acpi/pmstat.c                 |  3 +-
>>>  xen/drivers/cpufreq/cpufreq.c             | 18 +++++-
>>>  xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
>>>  xen/include/acpi/cpufreq/processor_perf.h |  3 +
>>>  xen/include/public/sysctl.h               |  1 +
>>>  10 files changed, 175 insertions(+), 8 deletions(-)  create mode
>>> 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>
>>> @@ -157,7 +162,63 @@ static int __init cf_check
>>> cpufreq_driver_init(void)
>>>
>>>          case X86_VENDOR_AMD:
>>>          case X86_VENDOR_HYGON:
>>> -            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -
>> ENODEV;
>>> +            unsigned int i;
>>> +
>>> +            if ( !IS_ENABLED(CONFIG_AMD) )
>>> +            {
>>> +                ret = -ENODEV;
>>> +                break;
>>> +            }
>>> +            ret = -ENOENT;
>>> +
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
>>> +                }
>>> +
>>> +                if ( ret != -ENODEV )
>>> +                    break;
>>
>> This, I think, needs some commenting. It's not quite clear why we shouldn't try the
>> next option if registration failed with other than -ENODEV.
> 
> I followed the original logic.

Which may easily itself be partly bogus.

> Now, I'm trying to understand the reason. I read the related code, there are two code path erroring out other than -ENODEV
> In cpufreq_register_driver(), either the driver itself is broken, like missing mandatory hooks, etc, yet in which case, IMO we shall try the fallback option,
> or repeated registration, TBH, which seems unlikely to me. cpufreq_driver_init() is a presmp call, so repeated registration doesn't come from racing.
> Then if we successfully registered a driver, we will immediately exit the loop. How come we will register twice?
> Or am I missing something for this error path:
> ```
>         if ( cpufreq_driver.init )
>                 return -EBUSY;
> ```

Imo this error path is there "just in case".

Jan

