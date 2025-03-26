Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA8A71525
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927568.1330289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOPr-00076i-P2; Wed, 26 Mar 2025 10:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927568.1330289; Wed, 26 Mar 2025 10:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOPr-00074P-Ln; Wed, 26 Mar 2025 10:55:23 +0000
Received: by outflank-mailman (input) for mailman id 927568;
 Wed, 26 Mar 2025 10:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txOPq-00074J-Ni
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:55:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa8bfbb-0a30-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 11:55:21 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so60217845e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:55:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d53678dfcsm169347535e9.18.2025.03.26.03.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:55:19 -0700 (PDT)
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
X-Inumbo-ID: cfa8bfbb-0a30-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742986520; x=1743591320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iY3z6quRTasDbN6r9gIWHkYNuUCGDeJLBrHYFjuHPP8=;
        b=FxO1ixsOSL1M83NcqCa8HRNAZkvwbdtTfVBc8UBns6kKaI/ey42Hhu8ZSTS/gcqMDG
         y39MKlOmDr5lqZEFaTi7qyHro55k8u6a6anByv7B/5VRTttV8VTD5OPNwZ22jmE3fnVK
         IFepa++maniM8jjuqDxoVtADcErve9+7rU23SrkKiSt2PSP15En3R/7yyfuwD7GxsU49
         p7Rn5V0qg4a9xcbMDumWxyg/N6oCE4IQYGwPS/TAddGEAH8p65AshINGQRAknLFA8WeS
         XZufpWtAsajnYQ/TjkPewntWqt4Y0LRuZ2zSfuRgjXoX+SwFu9oVl2+1vPVEbOxdbFix
         ehBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742986520; x=1743591320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY3z6quRTasDbN6r9gIWHkYNuUCGDeJLBrHYFjuHPP8=;
        b=J/BK4+HMswxFO/sigmogLfG2+z+A+z6ASfIZjnTZCVX2YdZYi+Sxhb8v7j2UF7miBh
         z3A/ytWUaHgtjJtMILRiLxocmlZCaDNYuHTZ53XS/fSr26PeiGhkWLFsVcESSVuekrS4
         QYL1UBMHQiZhwGLx6RHm1oRJ37ieRFnJWkhI5aSWOu4fNJ2jN1krHQO4zd/8t48jpC+E
         FHQY6bIyvgDpqcR3i+xsO9vntj8UPnoAu0FqfmxpgP0CEMMWKKzWMCkkJHic0VjKrolT
         R2+vNDaHoqmLOZ/p2qoGlaCuUzkb2laj2fDjz/q4g+EFwSol08UM58S0Uv4Ec0LEuHEw
         IRLw==
X-Forwarded-Encrypted: i=1; AJvYcCVLFQsA4xC42C8uLjuN7+lkoVyArkWf1WQhJSr2OtUtvggFt+CnpLktOSQS2aUG7auEVPDiwsz9P/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBJ308qvac6VFWRERBkE5UxWNEzp9unXKJVH1z1Hx/ZngEl/6/
	MhOGXVAQX7Bi0PlJIHzsklCZ5wR7EOnrbXiyjM7fntG060v3TONHgOsw5DZFPw==
X-Gm-Gg: ASbGncvvbn1rIHlh7ue4AfTY/bJcPuMGvOdInXbDFgL4yoOhiUZ2m8VbnQJVvg3JZSV
	ZPZTk5bSU51J7em4OaveeqOstPvJT262sfub+XTiAZfcYbbHR5B+m+EQ+ycAyj4+tpqZZiLcclR
	lh5w/eTPEY3cVlfBweXEIIngBos31QNBUodIR2ZUAyuqnNqFMmeH0p40pX4D7EkOOARh4Q7v8Gq
	HddbNyLk0d3LuSroSqusYuOjAufEWwQJk6YAsZM1vm4IHHr5okoKcvDcqE80yDPVSFGl7/QlLza
	2aH+qJFB0hfVmtFPFfS/PYYVsCYeYNWphubANfKCoVnMwvArci58CExwBy4iy5qcyJdd0hgIQwA
	Y82OsQHoUdeQxF8Y8EadeYDeYIjHwDA==
X-Google-Smtp-Source: AGHT+IHHzr5vIJkqtjdUwQa+2nXMvWXDLydTRbqcnPuzID1tAd1wkBFGqKADVRZ+0h84Z4z4e8fB7A==
X-Received: by 2002:a05:600c:3502:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-43d50a4f8d5mr202616945e9.29.1742986520122;
        Wed, 26 Mar 2025 03:55:20 -0700 (PDT)
Message-ID: <df911e05-df3d-4f16-992e-a1931ad00099@suse.com>
Date: Wed, 26 Mar 2025 11:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-6-Penny.Zheng@amd.com>
 <5498f98e-f3c5-4cb4-9a3d-793239a4339d@suse.com>
 <DM4PR12MB84519AF2B72DDDF50CA8BF18E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519AF2B72DDDF50CA8BF18E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 09:35, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 24, 2025 11:26 PM
>>
>> On 06.03.2025 09:39, Penny Zheng wrote:
>>> @@ -514,5 +515,14 @@ acpi_cpufreq_driver = {
>>>
>>>  int __init acpi_cpufreq_register(void)  {
>>> -    return cpufreq_register_driver(&acpi_cpufreq_driver);
>>> +    int ret;
>>> +
>>> +    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
>>> +    if ( ret )
>>> +        return ret;
>>> +
>>> +    if ( IS_ENABLED(CONFIG_AMD) )
>>> +        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
>>
>> What's the purpose of the if() here?
> 
> After cpufreq driver properly registered, I'd like XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC
> being exclusive value to represent the actual underlying registered driver.
> As users could define something like "cpufreq=amd-cppc,xen", which implies both XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC
> got set in parsing logic. With amd-cppc failing to register, we are falling back to legacy ones. Then XEN_PROCESSOR_PM_CPPC needs to clear.

Looks like you try to explain the &= when my question was about the if().
I understand the purpose of the &=. What I don't understand is why it needs
to be conditional.

>>> --- a/xen/include/acpi/cpufreq/cpufreq.h
>>> +++ b/xen/include/acpi/cpufreq/cpufreq.h
>>> @@ -28,6 +28,7 @@ enum cpufreq_xen_opt {
>>>      CPUFREQ_none,
>>>      CPUFREQ_xen,
>>>      CPUFREQ_hwp,
>>> +    CPUFREQ_amd_cppc,
>>>  };
>>>  extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
>>
>> I'm pretty sure I pointed out before that this array needs to grow, now that you add a
>> 3rd kind of handling.
>>
> 
> Hmmm, but the CPUFREQ_hwp and CPUFREQ_amd_cppc are incompatible options.
> I thought cpufreq_xen_opts[] shall reflect available choices on their hardware.
> Even if users define "cpufreq=hwp;amd-cppc;xen", in Intel platform, cpufreq_xen_opts[] shall
> contain  CPUFREQ_hwp and CPUFREQ_xen, while in amd platform, cpufreq_xen_opts[] shall
> contain CPUFREQ_amd_cppc and CPUFREQ_xen

Maybe I misread the code, but the impression I got was that "cpufreq=hwp;amd-cppc;xen"
would populate 3 slots of the array (with one of "hwp" and "amd-cppc" necessarily not
working, leading to the next one to be tried).

Jan

