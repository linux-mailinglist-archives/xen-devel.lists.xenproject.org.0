Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA170B19DF0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068969.1432829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqsF-0001OQ-Ty; Mon, 04 Aug 2025 08:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068969.1432829; Mon, 04 Aug 2025 08:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqsF-0001MD-R1; Mon, 04 Aug 2025 08:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1068969;
 Mon, 04 Aug 2025 08:48:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiqsE-000122-W1
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:48:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6f786df-710f-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 10:48:49 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af66f444488so541334266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:48:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a24365asm696790466b.137.2025.08.04.01.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:48:48 -0700 (PDT)
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
X-Inumbo-ID: d6f786df-710f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754297329; x=1754902129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X3pzOVntHKUcKWR8z6U9pOBbDddhwgTd/XTq1OF+ttM=;
        b=JCDG3OrEzPhV5ruNar4aV3LOokqCWAyPuuP5KKzCsh+C7Ll/a6Oda+6D0fHVIYBQ+u
         VmyC0gqg9FbYZiqZCrmCCvNKZI5zPRSDmHC1a+JdeR491DRWsHDlg7ztYhJHzz8h16TV
         uOxVPJ6n+xX+ocI/bneDWa9E92AkD+Z4lUzbK1MVaBTKNH9eVDjAalxhbRKC4mni643D
         S5kFX8qpTKO3GWaOuc9lBowYbsLR8SJM9DVSW0O35njI0tDD93QBdPEMFQVmLgbM/cL4
         JvfW8n326fNdnh10u6aZGuzXsMyKVeNz5mHGBD1hKN1dmj71+4syfq4zF1ATWBFNExQl
         vJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754297329; x=1754902129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3pzOVntHKUcKWR8z6U9pOBbDddhwgTd/XTq1OF+ttM=;
        b=LOvUSPGoRC8jSCuXAWGkvi1nEg5OzZBUJ9YjD5dk1cHmW41MA9Nv2+c0xbGYsqdS07
         ym1gHDas0xd1cwxiVK+Tl3/VAK9DaNGSw1SeJ+TLCKsKJHGZpX04Kk5EcKn/F0yPxQg1
         iidsgRzcpcaT4texNl6jpHrtmzga5YnZK91jA7bvt2fT1VB+UShPx+KmpDlW8v47OdQ1
         9Io8bvlwKwwGzs3rtbjsu2fCmlljaG10rvsZv9OQqqdky8cbAJWIW0H877T2FMy56MpD
         Vn4XVtsQXoES+47SF+6IK1WheT+Kw5tYJTTDW+cXdkPA5Hma8s8I9zjdYPbUNwkwn9RM
         VNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVSKPsprZVMILvILtQFYpZ388sTqFDsU8Htbk5MdaIz8GPXmN1H2DNVIsaLtlYsBxow8BP8WQIgiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy29Gy2ufS/WWFeN2WEEt7S8FuwgqinKH2VvYjTyf8Co1xd9+RN
	halM9/GwD0UnyYEfwMrNJrhj9xntNFnEjXaueH8H7RhZVgHwIf7/U9DLRNmAGGKV+A==
X-Gm-Gg: ASbGncuhK/Mr4UhSMhC2z/KLP4HyY0rlAH+V9KqCr6H5SrAvG5TheaXqL6lLuDyCEQK
	fdRT/Othbx8sM57rzR22M6FyY5piQKsbvSJqrm4L8V0uW3Jp8QwxbyWdLFHIMOuT0FYtGRZgJ+A
	xTwD6Lgj0rnvmnYVhwu1kJMZ86OoRqPPubxPA33F2Dd574/45I4b+cJQrn2UFYu+hWjdovtSIOy
	BcHB66vzBKDYeW3Pbba1uq9j0s9tJgGxxTi3SxAAr166A0Z9+XWIWf/zpRPQlVPh/gRzfQPJpqR
	ASVahNei7VaWyG4alOUlb8t/hYlOe3AQQaY3DoEU28zi8bmLp/hH/y9Nig2wu/cz8wINz4NmnhG
	9pnmEcDhne27yK3yonQCkSj1dki/ZWg+0UfIrZA8WZua6p0Qr6M840q3Me2UIO8f1Mpo3L1F7tJ
	ewSK+BrDPIM+xy/9BfulBAwyOS5CTe
X-Google-Smtp-Source: AGHT+IGxlSM3avoUbyb+fd3PwxjqQmuoDItEv/EngGr/UKLUC2ZTJ3kj75ONZCm617a8Z3F/IPG8Ig==
X-Received: by 2002:a17:906:c149:b0:ae6:e0a7:234c with SMTP id a640c23a62f3a-af940156652mr884752466b.33.1754297328851;
        Mon, 04 Aug 2025 01:48:48 -0700 (PDT)
Message-ID: <4df7c533-8d6e-4cf6-9ab2-90a00a31ebbb@suse.com>
Date: Mon, 4 Aug 2025 10:48:50 +0200
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
> " here?

That's what I said, didn't I?

> In which case, When CONFIG_AMD=n and users doesn't provide "cpufreq=xxx", we will have cpufreq_xen_cnt initialized as 1 and cpufreq_xen_opts[0] = CPUFREQ_xen. powernow_register_driver() hence gets invoked. The thing is that we don't have stub for it and it is compiled under CONFIG_AMD
> I suggest to change to use #ifdef CONFIG_AMD code wrapping

Perhaps necessary, yes. As you know, we generally prefer IS_ENABLED() where possible,
but when not possible, #ifdef is certainly okay to use.

Jan

