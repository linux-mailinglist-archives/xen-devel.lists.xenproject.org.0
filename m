Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB7AD68DB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012418.1390849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcGX-0001IA-TP; Thu, 12 Jun 2025 07:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012418.1390849; Thu, 12 Jun 2025 07:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcGX-0001FJ-QW; Thu, 12 Jun 2025 07:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1012418;
 Thu, 12 Jun 2025 07:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPcGX-0001FD-1V
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:22:25 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbc549f7-475d-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:22:23 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so556132f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:22:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488089624asm780018b3a.62.2025.06.12.00.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:22:21 -0700 (PDT)
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
X-Inumbo-ID: fbc549f7-475d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749712942; x=1750317742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GT0tJ9tHfDEsYoVJraQMtWrpW/Am4c/YStdv2WWbkoA=;
        b=F5HOBu5JuiQ3gmagSAFM1mPjFLR0sWFKrJnUByxA9cltTyB9MoGIOwMHROTrUQrvFV
         /DZ9gRxamuNyzk8N+nWXhkVasHNbroQyOxHuk1JYxegbfH5K3zCNb4/Gr/3DHPjrjiur
         WvjgtwYx/vD3VjrU5cVZWD74evqtlCQMuMiXSVzn8pWOPYAXBrVwbsFV9IiUTjWjY51i
         r00u6Kma5zI0s1tfQ8eT+nDUv17KOnPzm1Hay+rFYoIMCuFTmSY9Qu3tWZ8SKvqOsZWK
         hElB10X1WJWiUWQsq+ra5pAWQaqTq0pqkCoGw76BiB1DyMVutLyq6iGetddDJckrv3RG
         aQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712942; x=1750317742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT0tJ9tHfDEsYoVJraQMtWrpW/Am4c/YStdv2WWbkoA=;
        b=bE8p+mMbPAeTnhSzM+RZK+qW+bN9OmuhhfEdeHA5uksoXpuJQk+5ZWRRqVnycRdPiO
         9Sn3UVDltpT0/rGGuxl7lGqgqUbp2LHSdGZX68EkGmcvIbINMHeu6y2PiBX3AK6lIfYk
         G6obNnX9g8Nk5soHXY/XB7+D1V6Hqypy6IQ9R7u8hiy80dWiuxVF5x88zlN9XGbkT6o0
         5V8ZRrA/GxrTkc9RYmr0eeyLrR5cIpw25YX/q1gSk0lwg4cS+tkmY/laNPhE/3Aa8VPA
         CWMq9w8oa8RFDWvhD1RTWCbw3HONvmZAdJExohGBk0vX0sGFmh5ZtP5LNdqKSWBEKgk8
         D0mg==
X-Forwarded-Encrypted: i=1; AJvYcCUnx19qD1OPUN5Ti1vpmCgBbz83sqaff5cd85cCVOUuzPzshXzLqTFsk2IbzaP7U52dWGFAJ17mDgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoBeF3poznwX5V7gPX6lzVKoli/AuYPwZgN2RDQ2pZqFB99lDM
	gLGbZummXW9yXaCU6+tGvjEeTeEg/w6pUlLOP6+9Dy1gdIajwuHfjoPK03Lh84AelQ==
X-Gm-Gg: ASbGncv7mNPQRoKUn8JuM8aPDw38GpY8vkb9HPsPWsK7coUhUEWYFQhb55eBnEkNEn2
	PBIvM8o94RyuKyfHhSk9qtCcW8zFAk+nOGeHBi2nAn2l8uRSBhmMgxMeZzuzfNkdV+2ewQmpoLm
	9aE1AtCnr3eaSHagadvHmKvGeu6BnpSmBZB97U/NPRxEl580cxtf27I1seRyCe1azOG1SbB5Jyf
	t3tu0w/37f8u3x6hQdMdhKYH5oFE/v/lNQKnIRGnZPb5iIKTX3X/Efc/FTzU1v6s4s7pqt0vBHl
	J54kHWHUi7muqxwl2MG+XMGzZfND47SVXE98jUHmfs61JMOuxj4PspsARiQBQFrqll1JBZmTmA/
	PFX5wun4rC8APW0p0Nnk2EIGsKe3NpYGIlacG5DwfLdLt1vw=
X-Google-Smtp-Source: AGHT+IE7Mk5fsAkeCPyTzi1ufdf3GtX1vMNMd8kG6cpcnfbR9ghLJ/5wMnc5zV/Jmf0Q+Mjq3wlE9Q==
X-Received: by 2002:a5d:588a:0:b0:3a4:ffec:ee8e with SMTP id ffacd0b85a97d-3a558a2766emr5251389f8f.36.1749712942363;
        Thu, 12 Jun 2025 00:22:22 -0700 (PDT)
Message-ID: <d400536d-4047-4f58-a2a0-06331a305960@suse.com>
Date: Thu, 12 Jun 2025 09:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/20] xen/pmstat: introduce CONFIG_PM_OP
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-12-Penny.Zheng@amd.com>
 <1a660f83-5d9a-402b-af28-ea82311b37ce@suse.com>
 <DM4PR12MB8451B7E75E5D8F978B943997E174A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451B7E75E5D8F978B943997E174A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 09:00, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 10, 2025 9:41 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 11/20] xen/pmstat: introduce CONFIG_PM_OP
>>
>> On 28.05.2025 11:16, Penny Zheng wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -591,4 +591,11 @@ config SYSCTL
>>>       to reduce Xen footprint.
>>>  endmenu
>>>
>>> +config PM_OP
>>> +   bool "Enable Performance Management Operation"
>>> +   depends on ACPI && HAS_CPUFREQ && SYSCTL
>>> +   default y
>>> +   help
>>> +     This option shall enable userspace performance management control
>>> +     to do power/performance analyzing and tuning.
>>>  endmenu
>>
>> Why is this being added outside of the "Supported hypercall interfaces"
>> menu? (No matter where it's added, please make sure there's a separating blank
>> line ahdead of the subsequent "endmenu".)
> 
> Because, I intended to have the only five catogory under "Supported hypercall interfaces":
>         - sysctl
>         - domctl
>         - hvm
>         - physdev
>         - platform
> Which will be introduced in a patch serie and may contain multiple different features.
> PM_OP is more or less a feature to me. And it is only dependent on SYSCTL, like LIVEPATCH, etc

Hmm, well, okay. Especially your reference to LIVEPATCH here suggests to me that
some re-ordering would then be quite desirable in the file. It is generally
pretty desirable for "depends on <feat>" to appear later than "<feat>". While
for the graphical UI interfaces of kconfig the difference may be marginal, for
the command line one you otherwise get to select the setting for the dependent
feature first, just for that setting potentially being undone by the later
selection for <feat>.

Then again the entire file could do with some rearrangements. Yet I guess to
avoid interfering with your work, I'd better postpone any tidying work there.

Jan

