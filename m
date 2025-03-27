Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E897A72ACC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928558.1331242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhyH-0005F2-3C; Thu, 27 Mar 2025 07:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928558.1331242; Thu, 27 Mar 2025 07:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhyH-0005Cz-0E; Thu, 27 Mar 2025 07:48:13 +0000
Received: by outflank-mailman (input) for mailman id 928558;
 Thu, 27 Mar 2025 07:48:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txhyG-0005Ct-A5
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:48:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4177b20-0adf-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 08:48:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so5989975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:48:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedd1dsm28970525e9.8.2025.03.27.00.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:48:09 -0700 (PDT)
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
X-Inumbo-ID: d4177b20-0adf-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743061689; x=1743666489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YnD5q36OGBVMuUp5bg28UKw0UpHdji1xzUVQvzTfNKg=;
        b=Vi+0g0K69pfJZBqlSrF1F0dVXd6L7O87Vruj+AZSRj/Pt2AnZZ+bFubhVswsEiiUJM
         QA4WoL0YyrwOVqK8cjtl6rd2kp1VqAVPFVYqDkxliqfGCHTzJLkT6LO08wxmHe5TBPtz
         4igQWH40xyew37gUFFLrbXvB8+wq+MqGDk/RAMDkF1+KDNLHCWJPnBu+HdxAjpCygobD
         loUpSbRMFaffX9H1+YksXPsIfBunSWJP/XZ3A5sHS6I+JHIS29Nv+dlhWWv53JOb/hkM
         ejZUpD+nnbOUeeUlVS7Mnj3w0nbgKjFO7l+rFVm6zZNvnJ2uWLAHo0p0JCZAYyiidp6U
         uSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743061690; x=1743666490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnD5q36OGBVMuUp5bg28UKw0UpHdji1xzUVQvzTfNKg=;
        b=I/hYvNTkDguMm8fBbaoNgaqylxhXWJkFGu+5zymx4Q4sAMeEZtix/ef5BpBMF/JXd0
         rvNhH+X/nEZ2Z+shXYrIMsns0AxBEYqwWGt/quiBrCe9obzkg1++uZ0WQS59mcxRGs8K
         l5X/uq0XRPLDtOUwcYmpOwGWlHcPhRp+cFDX47cVQKs62oSoXSsmbRjT4EFcB38nNEUN
         gKIKp6ICfB6v0x97AOJDSqIQCrouHXL+JBzzT/QjK8KvsFLM1T1SjdSyC0rQgzK2acra
         ngHCcijq/SbfyRh0ZgterB9BV77fvBCbcAH9aKPb1gOhbmp+Gu/iX0z8b/5hUYOOxCCX
         2Ejw==
X-Forwarded-Encrypted: i=1; AJvYcCWN9sLDXVNnd4FPoQ+Eq/C6r5U4qdq00/08+r5R2A48jxZ+Ij4fYKUZM2cISlGZY7UiEotNHwyjC5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1skQx/oGhbZ9Qy+w3EAIA4pEwpsjy1VR3CTiGSvYigU3g2yVD
	l3OHZR4WWijadzosxHBRAk1kKsMCYAG+k1flA01f75KtMWCFBX4nj9K5zAbkZw==
X-Gm-Gg: ASbGnct2ekeKw0+8lm6rfDPzqa/8NXvpU6awX9ZzHzR6dT3s0klxAzRRC/Yh5DBkcvr
	yvyZIWqgVb4Qz2HyPDZycyZpNdC2DLQCo4WyeEFHcsztTZ2jOOJL/Qga9TnqnOSanItJrfoSbZa
	u61QJXmChW/mBBb0YAYbC3m2Y8dQkokrL0xIxvhOy80DF6PerWkUr7EYTt/vlzxZrCnwXReOMVJ
	3Vi/7pkt3GJ3o/D1PkBZP3mAF1WdyqJlTG7+RS1MxhMm3P/lVwrjaop1E8jKUeCmHtgGFAnMgHj
	YjY0Uz/r+sbGdQTV58KfSmhUDLRXAQtwDqofMyLP3yx/yatAZ3vv7kMV4eCDi/PZEkz4X/hizd1
	ytLhtRh79h5Fbxc2upFuPYFu1eVHg5w==
X-Google-Smtp-Source: AGHT+IHmKmLdLGe+l6Oz6sdMYE1IdzycE7kgGRrxIDlPFuk4AeovAY3i0iZshNJ6Isf2WtWP6amssQ==
X-Received: by 2002:a05:600c:4f89:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43d84f5dd3amr21662235e9.6.1743061689563;
        Thu, 27 Mar 2025 00:48:09 -0700 (PDT)
Message-ID: <a5c6b64c-b162-4b84-87ef-70c2ab665186@suse.com>
Date: Thu, 27 Mar 2025 08:48:08 +0100
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
 <df911e05-df3d-4f16-992e-a1931ad00099@suse.com>
 <IA1PR12MB84674DAE3F0FD2DB2DD87F17E1A12@IA1PR12MB8467.namprd12.prod.outlook.com>
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
In-Reply-To: <IA1PR12MB84674DAE3F0FD2DB2DD87F17E1A12@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 04:12, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, March 26, 2025 6:55 PM
>>
>> On 26.03.2025 09:35, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Monday, March 24, 2025 11:26 PM
>>>>
>>>> On 06.03.2025 09:39, Penny Zheng wrote:
>>>>> --- a/xen/include/acpi/cpufreq/cpufreq.h
>>>>> +++ b/xen/include/acpi/cpufreq/cpufreq.h
>>>>> @@ -28,6 +28,7 @@ enum cpufreq_xen_opt {
>>>>>      CPUFREQ_none,
>>>>>      CPUFREQ_xen,
>>>>>      CPUFREQ_hwp,
>>>>> +    CPUFREQ_amd_cppc,
>>>>>  };
>>>>>  extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
>>>>
>>>> I'm pretty sure I pointed out before that this array needs to grow,
>>>> now that you add a 3rd kind of handling.
>>>>
>>>
>>> Hmmm, but the CPUFREQ_hwp and CPUFREQ_amd_cppc are incompatible
>> options.
>>> I thought cpufreq_xen_opts[] shall reflect available choices on their hardware.
>>> Even if users define "cpufreq=hwp;amd-cppc;xen", in Intel platform,
>>> cpufreq_xen_opts[] shall contain  CPUFREQ_hwp and CPUFREQ_xen, while
>>> in amd platform, cpufreq_xen_opts[] shall contain CPUFREQ_amd_cppc and
>>> CPUFREQ_xen
>>
>> Maybe I misread the code, but the impression I got was that "cpufreq=hwp;amd-
>> cppc;xen"
> 
> My bad. In my platform, I haven't enabled the CONFIG_INTEL. I previously assumed that
> CONFIG_INTEL and CONFIG_AMD are incompatible options, which leads to the following code
> ```
> else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
>           !cmdline_strcmp(str, "hwp") )
> {
>     xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
>     cpufreq_controller = FREQCTL_xen;
> ```
> shall not be working in AMD platform...
> May I ask why not make them incompatible pair? I assumed it each wraps vendor-specific feature, like vmx vs svm...

I'm sorry to say this, but that seems like a pretty odd question to ask. Distros
quite clearly want to build one single hypervisor which can be used on both
Intel and AMD hardware. CONFIG_* are build-time constants after all, not runtime
values. We use them in if() where possible (instead of in #if / #ifdef) simply
to expose as much code as possible to at least syntax and alike checking by the
compiler, irrespective of configuration used by a particular individual. This
way we limit the risk of bit-rotting and unexpected build failures at least some.

Jan

