Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8688AF69F9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 07:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031720.1405469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXCvZ-0000JI-Ad; Thu, 03 Jul 2025 05:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031720.1405469; Thu, 03 Jul 2025 05:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXCvZ-0000Hl-7g; Thu, 03 Jul 2025 05:56:09 +0000
Received: by outflank-mailman (input) for mailman id 1031720;
 Thu, 03 Jul 2025 05:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXCvY-0000Hf-AK
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 05:56:08 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681ae8a6-57d2-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 07:56:05 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so4822977f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 22:56:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3afc70sm146982315ad.146.2025.07.02.22.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 22:56:03 -0700 (PDT)
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
X-Inumbo-ID: 681ae8a6-57d2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751522164; x=1752126964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oxwfIm7JeVa021jydIe5GiwGZEd2FwJGtelIfYENEGI=;
        b=bJz2VSAwE1aA12Hp6AZxWsSr8Tvjvd5geCK7QPmFrMoISZI9bWCmomXE1S8luo5xcM
         guf3LDTi1qoANZMpeyTfctQvzoYI8cmcnsN//lWuNAkAhl4ZqekjU1ohGDQuroJ5o9R1
         slL6RWJfP7PABtwRXHitM3uosRXS0OMD6bdtO2DwDWwPeZ0cKUDVyrr/VS8jK3J4sHSM
         WqGwvkueBMvIjT1ufg1LZLXYwR2U/kBZpdiqFoZvwrBxm6vLCYbzZt/mkymMH8LXbuBL
         UQzhHbG4I9l324JETRHkCyLI88uCUrkTo5hdm5qUPRcZbmoFYQVwu/tejWJbfY0Shj8H
         0IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751522164; x=1752126964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxwfIm7JeVa021jydIe5GiwGZEd2FwJGtelIfYENEGI=;
        b=IhnKYXV0uxNOS+K3pwwc14ccAUrDGUah+DjLGndyLI1RWEOgo8SOK1Y76nNHUTojgk
         815U6QD13mp6OzoQGwy8pRkOW6VlfpmCD2B0Fs7yOwC9nO+6RLdP/rCwzOTOjZ67zXX/
         I3xp9PgaQNethDVR68L6bmYY/sNkdSZZ2hhXQYEqqabXhZS7F6LfN7tw90kzlotxfhsR
         3J4AiU/PQdZWGaHaaNfLXpeSIjxh2Ry+4DSQ/m0DzP+pBgdocrRIK0L8QoBYRcOzko0n
         btspvh96xTSwIXXFORCC5BLmVE0M2TiFsgA3uAgxv/QZE2fGpfSAJoDLb3ojoVXNnhbN
         UM3A==
X-Forwarded-Encrypted: i=1; AJvYcCVbXGLaOyl5G3zWGGfkx7NiHmNld0+3HIcyaiFtlC8Y2Jjcd/av+/cuZd3M7OXWwRHQ5W/Ff8wdGyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL6LHMK/gkLeV4Q9xgBB6gFTT8v7NBcyYs0JNFetVmXulxZ9jB
	mZ0arFqHdyR5aHaS7KY0XxcrpW0AGgZ1WlRptxzQgqb3FBxjWGcMbLyd7D3L8xy4yQ==
X-Gm-Gg: ASbGncuLhSzNhe9+9VEewoCj2ipxBrzCWPO1w27tNpPz7sE3/GrWz7Vgv/CvIfd5XzB
	lrUDNjPo3Oae2s0I2uCdnciC2U15AbeUWEPRvU7Z5fAsy1MqRMCx5OO5lgf6NLOI8MIqln/BQht
	Fop3DBnjen16pEghu7XDtO2uJducQo7/KnQbFHUl5nlb2nOZ73RTZPM64TOH0vmcjctgwMv4CYz
	972l2QCizcs7M1M6kMp7TwR42KBDzrochs5A9Vkp/pYacEPzpuNzJeuR9pAbAKr4Bpfs3VNcilc
	P730CKZawj8k9CjtOfa+/qW1FHNumSMTu+2mMKfah7yWIWRnGPhL2H8dmd+rXrDRapSWNf8+Ulu
	OMnn9P3LePtsZtTGOWnAgnWwOpu7zbQfj58XP2GAE5hMeRkFIG3wq6JOBdA==
X-Google-Smtp-Source: AGHT+IEzQIDj/C9G8NxMQQjNoSHc1V94gThc5lz7HCWvZFyMnWbr1o+b9nr3rLroN8urUmNGQK+zQw==
X-Received: by 2002:a05:6000:2004:b0:3b2:fe84:a10 with SMTP id ffacd0b85a97d-3b328237c63mr1410498f8f.0.1751522164245;
        Wed, 02 Jul 2025 22:56:04 -0700 (PDT)
Message-ID: <db890d7b-0e4f-46de-b91c-e8a5a5185487@suse.com>
Date: Thu, 3 Jul 2025 07:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] xen: Split HAS_DEVICE_TREE in two
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-9-agarciav@amd.com>
 <ffba326b-6fa4-449d-8db3-66fb145a61a4@suse.com>
 <DB1OC2FGH37J.3VDC4G4ABWFRI@amd.com>
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
In-Reply-To: <DB1OC2FGH37J.3VDC4G4ABWFRI@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 17:28, Alejandro Vallejo wrote:
> On Wed Jul 2, 2025 at 3:30 PM CEST, Jan Beulich wrote:
>> On 01.07.2025 12:57, Alejandro Vallejo wrote:
>>> @@ -85,7 +86,11 @@ config HAS_ALTERNATIVE
>>>  config HAS_COMPAT
>>>  	bool
>>>  
>>> -config HAS_DEVICE_TREE
>>> +config HAS_DEVICE_TREE_DISCOVERY
>>> +	bool
>>> +	select DEVICE_TREE_PARSE
>>> +
>>> +config DEVICE_TREE_PARSE
>>>  	bool
>>>  	select LIBFDT
>>>  
>>
>> We're in the middle of various ([almost] alphabetically sorted) HAS_* here.
>> Thus DEVICE_TREE_PARSE wants to move elsewhere. Or we want to move back to
>> naming it HAS_DEVICE_TREE_PARSE, but I think there was a reason why we didn't
>> want it like that? Just that I don't recall what that reason was ...
> 
> AIUI, HAS_X are options selected by your architecture. Things that tell you
> whether X is supported in your arch or not. In this case, HAS_DEVICE_TREE_PARSE
> would be supported everywhere, while DEVICE_TREE_PARSE is not an arch property,
> but an option selected by DOM0LESS_BOOT (which appears in menuconfig) and
> HAS_DEVICE_TREE_DISCOVERY.

It's on the edge here, I agree. Yet we have other cases where one HAS_* selects
another HAS_*, and I think we're in the process of gaining more.

> I can move it elsewhere, but it's unfortunate to separate two so closely
> related options.

Imo there's only one of two options - move it or rename it.

>>> --- a/xen/common/sched/Kconfig
>>> +++ b/xen/common/sched/Kconfig
>>> @@ -67,7 +67,7 @@ endmenu
>>>  
>>>  config BOOT_TIME_CPUPOOLS
>>>  	bool "Create cpupools at boot time"
>>> -	depends on HAS_DEVICE_TREE
>>> +	depends on HAS_DEVICE_TREE_DISCOVERY
>>
>> Is this correct? CPU pool creation isn't driven by DT discovery, I thought,
>> but is a software-only thing much like dom0less?
> 
> In principle it would be possible. But I haven't tested the configuration, so
> I'd rather err on the side of caution and not enable features prematurely.
> 
> In time, this should become DOM0LESS_BOOT || HAS_DEVICE_TREE_DISCOVERY.

DEVICE_TREE_PARSE, that is?

>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>> @@ -423,7 +423,7 @@ static XSM_INLINE int cf_check xsm_deassign_device(
>>>  
>>>  #endif /* HAS_PASSTHROUGH && HAS_PCI */
>>>  
>>> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
>>> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>>>  static XSM_INLINE int cf_check xsm_assign_dtdevice(
>>>      XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
>>>  {
>>> @@ -438,7 +438,7 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
>>>      return xsm_default_action(action, current->domain, d);
>>>  }
>>>  
>>> -#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
>>> +#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
>>
>> Here I'm similarly unsure: Pass-through again isn't a platform thing, is it?
> 
> This has to do strictly with passthrough of devices discovered via DT.

Wait, no. You discover devices via DT, but you don't "discover" what domain
to pass them through. For the latter, DT is again only a vehicle.

>>> @@ -789,7 +789,7 @@ int xsm_multiboot_policy_init(
>>>      struct boot_info *bi, void **policy_buffer, size_t *policy_size);
>>>  #endif
>>>  
>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>>>  /*
>>>   * Initialize XSM
>>>   *
>>> @@ -839,7 +839,7 @@ static inline int xsm_multiboot_init(struct boot_info *bi)
>>>  }
>>>  #endif
>>>  
>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>>>  static inline int xsm_dt_init(void)
>>>  {
>>>      return 0;
>>> @@ -849,7 +849,7 @@ static inline bool has_xsm_magic(paddr_t start)
>>>  {
>>>      return false;
>>>  }
>>> -#endif /* CONFIG_HAS_DEVICE_TREE */
>>> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>>
>> The situation is yet less clear to me here
> 
> XSM segregates multibooting and DT-booting, this refers strictly to the latter.
> 
> By DT-booting I mean platforms where the DT is given by the platform rather
> than the user as a module.

Yet the platform as such hardly even knows of XSM (or in fact any of the software
that's going to run there).

I think we need DT maintainer input here.

Jan

