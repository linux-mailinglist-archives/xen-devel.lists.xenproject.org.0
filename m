Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC70CA66F4
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 08:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178470.1502257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQHI-0002IP-4b; Fri, 05 Dec 2025 07:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178470.1502257; Fri, 05 Dec 2025 07:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQHI-0002Gz-0n; Fri, 05 Dec 2025 07:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1178470;
 Fri, 05 Dec 2025 07:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRQHG-0002Gt-3Z
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 07:30:54 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530b6334-d1ac-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 08:30:52 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e2d44c727so909999f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 23:30:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9032sm6668271f8f.1.2025.12.04.23.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 23:30:49 -0800 (PST)
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
X-Inumbo-ID: 530b6334-d1ac-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764919850; x=1765524650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0aigU3TqwxY2ENx3SoF9XNLy+q8KNYgu9SQUaMh9GAA=;
        b=PBxjsdEx2dY1SBxDhKm5kK1lF4oL5F8iwbaXohN0cFFPLL/vehFr7LiTEnXKpmCmj0
         8SRXtBwIdmJEi4OyudSRF5xxfchrQZu7fRFn1HV6n7/bUQsstqrjlYlun9qxMOcifK1Q
         /sGDk4vUibwqyyyd8r3DJYgKz7L124ghLp1b1ZjfJLGH4s/Z1LFRmKRy6DCgjrs9tPbB
         6sVpCE94wBh45zkLwBwUHV4ZwdVjGicpILOIWjkC/pfYRNKc1tsT0IY7CYP+72OLflmR
         1DiyFXEHkfaU1AeZ42HZEVfpfe83oMRQ8KlSrp+kzTzyqyVUJbpFF0bAeH1GlNtO2y0W
         NJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919850; x=1765524650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aigU3TqwxY2ENx3SoF9XNLy+q8KNYgu9SQUaMh9GAA=;
        b=P0phE3PRBpZPFfv0JUEuaVmx4oKBgk5uACNF/KxuimR96HJ+XXIslYJzS0VPJJdfkK
         2tCb1dULjtP4xNQVSiVihO0XSX/fp0D6nqUUz2NNxR1MqQRMsPv734py4cx16UwczGln
         4N7HSS0b/0BNf9yH/j+MQ0KGxaJObPxCKQasspa7yiLcKgitewNBDOVPaWtvweUPwpsI
         B2O1MxlNIdgCOJQnfs7PohCmXDIuGgGv1a7n8hpt+f5zes/mjFxEsHMMW9oI3dUv0spa
         Q4NiEfaLVaH+jmbHZWzn77n7W7vOjuT9kgZdyEaMs5DbbvdPQtKn+5F7yaiqXcMvHMI8
         Zwgw==
X-Forwarded-Encrypted: i=1; AJvYcCVFeK6IJ72BfXnLKoq5Illlz9HtBZnU6ZAA/7FBYXCer0OBWxz9dU4c8XYRxaJ+/tfALgQjpePLP/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1a/SU52gasoRcq23FamEblTlmHa/FKpmK29DV+oNmsqaH1l+0
	TUFardJtVNgHKOyegtBDkpYmoZ7+sINnaSm5vrTq5cHOrpH3wR0iA7MmSCZxGvy7ww==
X-Gm-Gg: ASbGncu4H6D1B6zphUl/MBam0rtCAcTEaxx2zHJzfaFM6ZK3XZg1871UU3oww+/yDvm
	h2NhpOPSlRVDs7HJC7wCrVm5AuKtZYaY8PToHwPYBHl3W8UwJHmeA2m5lkzIPc0l6pJ25IEOuUY
	PP7qdpUCQlG4QPyvrSkdTuro878+vOov0HKZr1V+RtxxfHvv1kzWnhiYeP3BsVHd+qlQMitlD4C
	6JhnlqXoSMIim2lRKpdZyZIqHWx0WbkPloqs7VgAPXyPMftng6m5Mz2b+5bCzCrqTpRhrf+Q35N
	vm25N3S4ZJROCB4wE1j9jvAvTC6UWIBcg17IXrCiWmUXC1srzOpZ/Nk+P8pplwrwoyQThiceSMt
	QNnGPX+VBRNS5KZ/o4f7r82T58oE2MR7chLJQQBTQz/5fB0w3toJKjeq0kSjLHPbVG1HW7OVk5t
	28CZ5qVC/1BiK3y/bN3KH0QTrZ5jbPqgZGTELJsBCImkvbSXJ5CV9RikFQLGYCR0+01STaRsM6h
	34=
X-Google-Smtp-Source: AGHT+IF22ETfsmxT7FAk8vaaWMlO7/GQrU57gDwBDSGmpXXYk+B+q1Tm8vq175YiwYYvnpSis75Y/w==
X-Received: by 2002:a05:6000:1449:b0:429:d170:b3d1 with SMTP id ffacd0b85a97d-42f7320bea0mr8994503f8f.59.1764919850116;
        Thu, 04 Dec 2025 23:30:50 -0800 (PST)
Message-ID: <93895869-2584-4054-b651-7d77e72cb20c@suse.com>
Date: Fri, 5 Dec 2025 08:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "grygorii_strashko@epam.com" <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-21-Penny.Zheng@amd.com>
 <de34ea34-1558-46b3-b5a6-79edd60ad45f@suse.com>
 <DM4PR12MB84519D61527BF82117F65CAEE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <57dea7ef-9bbe-44f8-a0dc-c933a6235c05@suse.com>
 <DM4PR12MB8451F190E0AA787B9DAA7A6AE1A7A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451F190E0AA787B9DAA7A6AE1A7A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 04:28, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, December 4, 2025 5:41 PM
>>
>> On 04.12.2025 05:23, Penny, Zheng wrote:
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, November 26, 2025 1:00 AM
>>>>
>>>> On 21.11.2025 11:57, Penny Zheng wrote:
>>>>> --- a/xen/arch/x86/Kconfig
>>>>> +++ b/xen/arch/x86/Kconfig
>>>>> @@ -29,7 +29,7 @@ config X86
>>>>>     select HAS_PCI_MSI
>>>>>     select HAS_PIRQ
>>>>>     select HAS_SCHED_GRANULARITY
>>>>> -   imply HAS_SOFT_RESET
>>>>> +   select HAS_SOFT_RESET if MGMT_HYPERCALLS
>>>>
>>>> Why would you undo an "imply", when really we should use it more? One
>>>> of its purposes is so that you can add "depends on MGMT_HYPERCALLS"
>>>> there, and it then won't be auto-enabled if that dependency isn't fulfilled.
>>>>
>>>>> --- a/xen/arch/x86/include/asm/paging.h
>>>>> +++ b/xen/arch/x86/include/asm/paging.h
>>>>> @@ -55,7 +55,7 @@
>>>>>  #define PG_translate   0
>>>>>  #define PG_external    0
>>>>>  #endif
>>>>> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>>>>> +#if defined(CONFIG_PAGING)
>> && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>>>> &&
>>>>> +defined(CONFIG_MGMT_HYPERCALLS)
>>>>
>>>> This line is too long now.
>>>
>>> Hmm, how about I introduce a new Kconfig, something like:
>>> ```
>>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig index
>>> c808c989fc..ec8f51b0b1 100644
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -166,6 +166,9 @@ config SHADOW_PAGING  config PAGING
>>>         def_bool HVM || SHADOW_PAGING
>>>
>>> +config PAGING_LOG_DIRTY
>>> +       def_bool PAGING
>>> +
>>>  config BIGMEM
>>>         bool "big memory support"
>>>         default n
>>> ```
>>> Then, later future dependency could be added to PAGING_LOG_DIRTY
>>
>> I fear I don't see how having an option merely aliasing another option would help the
>> line length issue. I may simply be missing some context ...
> 
> Later when MGMT_HYPERCCALLS kicks in, we could have to avoid overlong #ifdef:
> ```
> #if defined(CONFIG_PAGING_LOG_DIRTY) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)

Yet this is a bogus construct to have. It really means PAGING_LOG_DIRTY would
better depend on !PV_SHIM_EXCLUSIVE, except that this is precisely the
pattern we want to get rid of. At which point imo the usefulness of
PAGING_LOG_DIRTY would be somewhat limited.

Jan

> #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
> ...
> ```
> The addition of MGMT_HYPERCCALLS dependency could be added to PAGING_LOG_DIRTY kconfig
> ```
> config PAGING_LOG_DIRTY
>         def_bool PAGING && MGMT_HYPERCALLS
> ```
> 
>>
>> Jan


