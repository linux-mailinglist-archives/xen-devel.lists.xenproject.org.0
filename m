Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD894CD6E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 11:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774590.1185042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scM1N-000355-OS; Fri, 09 Aug 2024 09:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774590.1185042; Fri, 09 Aug 2024 09:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scM1N-00032l-L7; Fri, 09 Aug 2024 09:34:53 +0000
Received: by outflank-mailman (input) for mailman id 774590;
 Fri, 09 Aug 2024 09:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1scM1M-000326-TN
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 09:34:52 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0ea234e-5632-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 11:34:52 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5b5b67d0024so2114703a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 02:34:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c6f6ebsm1373929a12.56.2024.08.09.02.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 02:34:51 -0700 (PDT)
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
X-Inumbo-ID: a0ea234e-5632-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723196092; x=1723800892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vie/7mTHBG1wCPOj38RBCAuED74DuAm56LUWZFPnkBM=;
        b=D6B6nLwsUAWLlW6r7sJJH0Fzspkq4AOxo7ELhdt+us8ws/P3VdeML+3gmz1m5ed8Kl
         yTGip6rW7R7tkw0gWt33G4DHY90zbnGRPxgD+4M01f0h4qLF7HfUzRM3aUkFll4KAw2p
         wi6FI5BX9PiXFd/9RmojlGwf6UzZO2vIYIqRJD+yjEf6VdFUIYyOoVw6khJUFBwyM18S
         UnLiVgokJlWZCA/duYDlJu1e5eLvkT68cqHhWUHgT8Z1qFG5lVgKTp4hoTpeRDamTNV8
         9rnVNvDayRRv10EklO5pHChfgPn9zf5Ld3iCvcFfWlPhEHtm+BL3qrZWa3X72Wscx5xk
         7bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723196092; x=1723800892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vie/7mTHBG1wCPOj38RBCAuED74DuAm56LUWZFPnkBM=;
        b=rI/OnltN/wibk+oWfL/cw3La6+yNdWJt4Qrx49/fKaC61yQfP6OkGYI5Bh7ejfwCig
         xYXfRt5p1obBA4i03h1PQhjHEJf931OvQ4t2Pjf7eZLne4u9PQZdqPWsklahCIF1Bwtz
         h22zJGqXsRQFia3Lwi3eTekvV7D5yjpEE+vPt6ozJMSsNbf1ejJRWe4g9VS4Tr3uG3pT
         PaZX7kyEHRFKJkbjVwvIDILWA9M3/ykAHjwmlNLGhcP/tOdi2wslpR5YxVvQfcasw8bA
         SIS9TEcbmV36DEjfvWDU3hCokab0QOn/rTkibdmkb6ILeNQ2yNRgiIuizKFuvCCgNbWm
         VOhQ==
X-Gm-Message-State: AOJu0Yxa8fE5u6qa6E19LGhgtVUjfOUq4FYIuixbDFJfQVeL+WMwxyur
	Kw0bZQVSIgqKv1BL3pTNFfq/JxZA0Cu6pxdqjspdMR9MoCX5MBtcyfXJsQWxzg==
X-Google-Smtp-Source: AGHT+IFsn6TdwlATxR82p8PfhpY1Qz9V1q4vsqmOFbRGHEsrGudFsSG5tZKjX0udTTs6XfjR2lLkYg==
X-Received: by 2002:a05:6402:2742:b0:59e:b95d:e744 with SMTP id 4fb4d7f45d1cf-5bd0a63e264mr624000a12.29.1723196091641;
        Fri, 09 Aug 2024 02:34:51 -0700 (PDT)
Message-ID: <724aa3bd-26a0-4a01-8be5-69fa838ee9ba@suse.com>
Date: Fri, 9 Aug 2024 11:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen: arm: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-3-ayan.kumar.halder@amd.com>
 <bc643306-a41a-41bb-b7b7-b7c67f9e5bdf@suse.com>
 <3c491d8f-6180-46d7-a996-049df88a023e@amd.com>
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
In-Reply-To: <3c491d8f-6180-46d7-a996-049df88a023e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2024 17:50, Ayan Kumar Halder wrote:
> On 08/08/2024 13:49, Jan Beulich wrote:
>> On 08.08.2024 14:09, Ayan Kumar Halder wrote:
>>> @@ -58,9 +58,13 @@ config PADDR_BITS
>>>   	default 40 if ARM_PA_BITS_40
>>>   	default 48 if ARM_64
>>>   
>>> +config HAS_VMAP
>>> +	def_bool y
>> With this being always enabled, ...
> 
> I had to define the config somewhere. It seemed this is the correct 
> place to define as HAS_VMAP will be turned off when MPU is introduced.
> 
> So, it will be
> 
> config HAS_VMAP
> 
>             def_bool n
> 
> At that time, only MMU will select HAS_VMAP.

Well, but why is it not simply

config HAS_VMAP
	bool

from the very beginning? (There should never be "def_bool n" imo, btw.)

>>> --- a/xen/include/xen/vmap.h
>>> +++ b/xen/include/xen/vmap.h
>>> @@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
>>>   /* Initialises the VMAP_DEFAULT virtual range */
>>>   static inline void vm_init(void)
>>>   {
>>> +#ifdef CONFIG_MMU
>>>       vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>>> +#endif
>>>   }
>> What about non-Arm, which all have MMUs but no corresponding Kconfig
>> setting?
> 
> AFAICS , the only file that is of our concern xen/common/vmap.c It is 
> enclosed with VMAP_VIRT_START which is defined in mmu specific file 
> (xen/arch/arm/include/asm/mmu/layout.h).
> 
> So, it will not be compiled for Arm MPU arch.

Yet that wasn't my question. I asked about non-Arm, for all of which it
looks like you're changing behavior of vm_init() (by suddenly making it
do nothing).

>> And why is this not CONFIG_HAS_VMAP anyway (with HAS_VMAP
>> properly moved to common/Kconfig, where e.g. HAS_PMAP also lives,
>> and then unconditionally selected by all other architectures)?
> 
> I am not sure why CONFIG_HAS_VMAP should be moved to common/Kconfig when 
> it will be selected/deselected only for Arm architecture.

Because you will want to use that (not MMU) in vm_init().

Jan

