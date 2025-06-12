Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C21AD6C17
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012630.1391107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeDT-0006a4-79; Thu, 12 Jun 2025 09:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012630.1391107; Thu, 12 Jun 2025 09:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeDT-0006XX-4W; Thu, 12 Jun 2025 09:27:23 +0000
Received: by outflank-mailman (input) for mailman id 1012630;
 Thu, 12 Jun 2025 09:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPeDR-0006XR-Ha
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:27:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8b6cc5-476f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 11:27:10 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4533027c0ceso2187905e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 02:27:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e71951dsm9477815ad.220.2025.06.12.02.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:27:17 -0700 (PDT)
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
X-Inumbo-ID: 6a8b6cc5-476f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749720438; x=1750325238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZApT+XQfkEfc+EvMaQtY7Y9mohLcsC+SvTkdAMk9fQ=;
        b=ErJHEyhHFccwVNCYJUvRAWNHaNd2DDTOMWjdOVQCgLDPa8xORn5TGnbxYAFlgfN51n
         rv35EZD4s+v2upZoLpktaU67CYXpGj24Mez9ILotUdlRU18CYdyxXEotIMYA3NW3BGA9
         M9kXlxA06sSywyG8ElpaxEyLyFQaPlPfkKifzwU9ysx6ERh76RNBUjLjFItvqWZCLAH/
         6qNLtBk7Tm6DnUZ3+T+tQkelKNzAh2uXAXxck/RRMj8PDzZ2vK278NaxBudmP/bx4Squ
         tUfdrplnI8sbTIqPk1huTcnBjr/ck2kY1CTru55LPZDrBrBnUDR0fpGBNHzDl4gHXgfs
         3/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720438; x=1750325238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZApT+XQfkEfc+EvMaQtY7Y9mohLcsC+SvTkdAMk9fQ=;
        b=uvp+4xHcuKlf3clP6ltcNWp9I3b50qn6ph0YUfr2MhapdLWp7PYdll6PbeOoDCByps
         zIJeIVY78TCybCuYkA4eW9VgNcdsR8QNxjNhSRSTJCxIIzIKJPLFb7Lac87CKbBb3ge2
         wRnRJmD6z/Sej1MLj9qLa95lI9a/U7lX/zgeWM2YrAmaZLoUN1gFdiJfU34AVq4cvh7p
         AGsGDC301OqQoZGEV53QIAKgQybe/RyFfVSQM14DxuwJMa9W4Z6syTru4SgvEjuaWAAa
         jCpBBnd5ZitAUXKBsjnxPC1/fkuiOOsycGI9+ztlWqajx9A5AyoZPPrA0iY/HpbkwA3N
         rw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnwOXaT4l5bFscVzmYIzwqfBvBkzIXq1KeFbFUsP8ttoB4K4jyr7Dm39KOeiXo1kGy+kdFC71qTVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxelcaWAmadk91YVMW48XQqAnN3n/OaTCBOdnxuyUrCNJAen08N
	zpVXzoPTn2SOLFwSs3qOLfU0dgldhWehG5T/FHNCGKFIV56QGjxt0ahhXS07wHScrg==
X-Gm-Gg: ASbGncsQ0M1FSEQfB7RZ3a50xdnFypl4WCzYkDsKSS780P+y/WEQOZrEBqwrk/0ea0L
	1kdmq3G0h5duA6AY7HeFThKVzHuVGllOcAuAH2jMwZKuQvIt5VJVEzf+Ez9SoEqCFPITTl7n54J
	j+OCw+RdGAsrrcBYuQxD0ZChN0AdsW15LC+foRuI7UMT8QsvwwPPukUeQXMPFPMgh+780193YA7
	0Oba7zyxgEg39BGFUHWnigpVWgpv5nt3nIvGyItUAi51gn6mz7S9GjCVA2jnw+svsT3EqaQnKZd
	r+CoKvhCzajq7NeJBd3orY/LWFC7mKoibSgiezPl52WSjmSRIwGEXttLHgISCLeVZ4xH0ogdQQq
	szgprWjS/nR1yHQJeJU76ok1O4M5KDGfBBOwctoDu+8FjCQQ=
X-Google-Smtp-Source: AGHT+IFQFQt0vRFbM02Ea0B2dzxpfXFN910fZ6mjq2baEZEeF0amH4aqQU8raqsz+tO4NU7bl4ygaQ==
X-Received: by 2002:a5d:5c84:0:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a560769194mr2144127f8f.56.1749720438263;
        Thu, 12 Jun 2025 02:27:18 -0700 (PDT)
Message-ID: <8fbc7416-39ed-4e09-9a6f-6d84cd5747ee@suse.com>
Date: Thu, 12 Jun 2025 11:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-4-Penny.Zheng@amd.com>
 <1a73c720-012a-4795-9f47-f9c23b643de1@suse.com>
 <DM4PR12MB8451B5CBFD6D9DCDDB7040DEE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <b692d934-7f0a-427d-99df-2404662333eb@suse.com>
 <DM4PR12MB84515FBDE10EDBB14A7EEFA0E174A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84515FBDE10EDBB14A7EEFA0E174A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 10:52, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, June 12, 2025 3:02 PM
>>
>> On 12.06.2025 06:09, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, June 10, 2025 9:01 PM
>>>>
>>>> On 28.05.2025 11:16, Penny Zheng wrote:
>>>>> --- a/xen/arch/x86/Kconfig
>>>>> +++ b/xen/arch/x86/Kconfig
>>>>> @@ -143,7 +143,7 @@ config XEN_IBT
>>>>>
>>>>>  config SHADOW_PAGING
>>>>>     bool "Shadow Paging"
>>>>> -   default !PV_SHIM_EXCLUSIVE
>>>>> +   default y
>>>>>     depends on PV || HVM
>>>>>     help
>>>>>
>>>>> @@ -175,7 +175,7 @@ config BIGMEM
>>>>>  config TBOOT
>>>>>     bool "Xen tboot support (UNSUPPORTED)"
>>>>>     depends on INTEL && UNSUPPORTED
>>>>> -   default !PV_SHIM_EXCLUSIVE
>>>>> +   default y
>>>>>     select CRYPTO
>>>>>     help
>>>>>       Allows support for Trusted Boot using the Intel(R) Trusted
>>>>> Execution
>>>>
>>>> ... these two fit with title and description. The justification for
>>>> removing the !PV_SHIM_EXCLUSIVE here is not "breaks allyesconfig".
>>>
>>> Hmmm, it is the consequence of "removing the !PV_SHIM_EXCLUSIVE"
>>> Maybe I shall add more explanation in commit message?
>>
>> Just to clarify - my questions here were about the changes altogether, i.e.:
>> Why are these two change - as a whole - needed, given the subject? And just to try
>> to avoid any misunderstanding: My point is that "depends on ..." and "default ..." are
>> different things, when the commit message discusses only the former. So yes,
>> extending the commit message may be one way to address my remarks. But really
>> I think changes to defaults (if needed at all) would better be separate from changes
>> to "depends on ...".
>>
> 
> The reason why I added an extra default y for CONFIG_SHADOW_PAGING is that
> the .config file generated from x86_64_defconfig has changed after removing the "default !PV_SHIM_EXCLUSIVE", from "CONFIG_SHADOW_PAGING=y" to " CONFIG_SHADOW_PAGING is not set ". To fix it, I casually added a "default y" here.
> I understand that like you said, it doesn't fit with the title and description... I'll create a new commit for it. And instead of adding "default y", maybe just adding " CONFIG_SHADOW_PAGING=y" in x86_64_defconfig is enough.

No, the change (if it is really wanted / needed, which I question at least
for the time being) would need to be done to the default (unless there are
other reasons to alter the default presently used).

>>>>> --- a/xen/arch/x86/configs/pvshim_defconfig
>>>>> +++ b/xen/arch/x86/configs/pvshim_defconfig
>>>>> @@ -26,3 +26,8 @@ CONFIG_EXPERT=y
>>>>>  # CONFIG_INTEL_IOMMU is not set
>>>>>  # CONFIG_DEBUG is not set
>>>>>  # CONFIG_GDBSX is not set
>>>>> +# CONFIG_SHADOW_PAGING is not set
>>>>> +# CONFIG_TBOOT is not set
>>>>> +# HYPERV_HYPERV_GUEST is not set
>>>>
>>>> This one doesn't look right, simply by its name.
>>>>
>>>>> +# CONFIG_HVM is not set
>>>>> +# CONFIG_VGA is not set
>>>>
>>>> Just to mention it - I'm unsure whether adding such at the end isn't
>>>> going to cause issues. But maybe I'm paranoid ...
>>>>
>>>
>>> It could be too casual..
>>> I will only leave VGA here, as we're sure that with removing
>>> "!PV_SHIM_EXCLUSIVE", CONFIG_VGA is setting as y in pvshim_defconfig
>>
>> I don't follow: Why would a shim need VGA support compiled in?
> 
> Yes, VGA shall not be compiled for a shim. And it is the reason why I added "# CONFIG_VGA is not set" in pvshim_defconfig. Without it, the consequence of removing " if !PV_SHIM_EXCLUSIVE " for VGA is that when we run "make defconfig pvshim_defconfig", we will get CONFIG_VGA=y in .config
> Like you said, this change belongs to the group of changing kconfig default values, and will later be included in a new commit

I keep being confused by what you say; will need to see how v5 is going to
look like.

>>>>> --- a/xen/drivers/video/Kconfig
>>>>> +++ b/xen/drivers/video/Kconfig
>>>>> @@ -3,10 +3,10 @@ config VIDEO
>>>>>     bool
>>>>>
>>>>>  config VGA
>>>>> -   bool "VGA support" if !PV_SHIM_EXCLUSIVE
>>>>> +   bool "VGA support"
>>>>>     select VIDEO
>>>>>     depends on X86
>>>>> -   default y if !PV_SHIM_EXCLUSIVE
>>>>> +   default y
>>>>>     help
>>>>>       Enable VGA output for the Xen hypervisor.
>>>>
>>>> Like above, this change also doesn't really fit with title and description.
>>>
>>> I have added " (also the functionally equivalent "if !...") " in
>>> commit message to also cover above change
>>
>> Well. There are multiple uses of "if ...". The one matching "depends on ..." is covered
>> in the description, yes. But the two uses here don't fall in this same group. One is a
>> prompt visibility change, and the other is a change to yet another default. See above
>> for my recommendation (to split things properly).
>>
> 
> Correct me if I understand wrongly:
> "if ..." for HYPERV_GUEST is falling the group where prompt visibility changes, and fits with the title and description

No and yes. A file scope "if" acts like a "depends on" on every enclosed option.
Hence it fits with the title here, but _not_ because prompt visibility changes.
What you may be mixing up is the fact that a prompt of course _also_ becomes
invisible when an option's dependencies aren't met. Yet normally when talking
about prompt visibility, at least I would always mean the prompt for an active
option (i.e. where by hiding the prompt we just take away the user's ability
to control the value).

> "if ...." for VGA is a change regarding kconfig default value, and shall be covered in a new commit.
> Yet my changes on  pvshim_defconfig and x86_64_defconfig shall also be included in the new commit. As they are all
> talking about changing kconfig default value.

I'm not sure. When you remove a "depends on" yet at the same time you want to
retain the "off" setting for the default shim configuration, pvshim_defconfig
may still need adding to. So edits may be necessary there in more than one of
the split patches.

Jan

