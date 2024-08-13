Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B117D94FE68
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 09:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775992.1186145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlez-0004YT-0K; Tue, 13 Aug 2024 07:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775992.1186145; Tue, 13 Aug 2024 07:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdley-0004Wd-Sz; Tue, 13 Aug 2024 07:09:36 +0000
Received: by outflank-mailman (input) for mailman id 775992;
 Tue, 13 Aug 2024 07:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdlex-0004WX-Aq
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 07:09:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fde43289-5942-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 09:09:33 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso118956266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 00:09:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411b585sm43846566b.104.2024.08.13.00.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 00:09:32 -0700 (PDT)
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
X-Inumbo-ID: fde43289-5942-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723532973; x=1724137773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UV5mHkDTbnPd/5WYuAL/5+XZ21L5I9EqLcQecmX8Qf0=;
        b=I3djPK91nBBP3bXG3yhwy+km9Vqvq4YyND2/8c8fbUhXMe60NZmRlR82+P5aNUZC4j
         LId9h/fQippTEADsQhpmmJjVOrXw+QCY7iTSYqSKQ4+Kxxfpz6ukQUTfDw4HbgkypIqB
         se2hpjMsONsruF68zwkinRq6dP3S6im5R8zvz2bYXVSDLrm0v6ot3oq6ApJfM/rKOriM
         BFwcK64sVh3uFjRuJZSsT7RrCDD578ETAJgsr/UuYosNEw0aToOnLiAXYKukj8fk4V7/
         C16ZRPhSnm+lZ/iw61z8htoI9DuohaG2LngN3Nr9dNjicFiF9pva5Pvu6uLXJe44fclw
         DvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723532973; x=1724137773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV5mHkDTbnPd/5WYuAL/5+XZ21L5I9EqLcQecmX8Qf0=;
        b=MJNkIlbl2BDNpaAHCvbRlk5C6RxGHqOkL7gGYUYS/asShCS5GQsLu1UOuipu36M+kG
         COyxYeix7r2i4WSas9G1s2e+QepsXLwsBEiccmhVvPwEcP++svB7UdUHNmn82Uo87ttl
         lS+bipGecoBXH8KAlVmhU13EpsDgTwASY4vaLwmGO8SZbvahmOvS1F2sZAt9vz2b+VTU
         LoWXFHoyc3q0Z2cG8s/8O8OdC0S3h4yk+3wXyFYTqzXW4nkWN3I0SVOQZ39TZbGPPCUR
         WiyiyrcmBuqrZwaqLMQfQA1CBntPj8106xfOYqeqBqJJBnVDvflgZ/9UkRYYAoaGZNgr
         hldA==
X-Gm-Message-State: AOJu0Yzcq860g3U4/NQ6ijo703dVVW0MxvDOOnIW1uTjzFQuAkPaM5Nf
	QqQVIJeKJBQrUrGGtWSXnHpodW5ZQd02+oIfHB96ARDUxo4/ybgQd5+oT0A9Xw==
X-Google-Smtp-Source: AGHT+IHYBiATnoh5UuoUZZfJpHTOPT2dFlyWs0DTROvngLxBySoeHSFUX0jQ15hP1kPXJYWIlbPNiQ==
X-Received: by 2002:a17:907:3f9e:b0:a7d:2bf7:5619 with SMTP id a640c23a62f3a-a80ed2d811cmr130227666b.58.1723532972682;
        Tue, 13 Aug 2024 00:09:32 -0700 (PDT)
Message-ID: <5fe3ddc4-8317-4129-a06b-73671ef15655@suse.com>
Date: Tue, 13 Aug 2024 09:09:31 +0200
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
 <724aa3bd-26a0-4a01-8be5-69fa838ee9ba@suse.com>
 <c5c0a198-97ca-4779-8d1e-91d01b3650ff@amd.com>
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
In-Reply-To: <c5c0a198-97ca-4779-8d1e-91d01b3650ff@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.08.2024 18:02, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 09/08/2024 10:34, Jan Beulich wrote:
>> On 08.08.2024 17:50, Ayan Kumar Halder wrote:
>>> On 08/08/2024 13:49, Jan Beulich wrote:
>>>> On 08.08.2024 14:09, Ayan Kumar Halder wrote:
>>>>> @@ -58,9 +58,13 @@ config PADDR_BITS
>>>>>    	default 40 if ARM_PA_BITS_40
>>>>>    	default 48 if ARM_64
>>>>>    
>>>>> +config HAS_VMAP
>>>>> +	def_bool y
>>>> With this being always enabled, ...
>>> I had to define the config somewhere. It seemed this is the correct
>>> place to define as HAS_VMAP will be turned off when MPU is introduced.
>>>
>>> So, it will be
>>>
>>> config HAS_VMAP
>>>
>>>              def_bool n
>>>
>>> At that time, only MMU will select HAS_VMAP.
>> Well, but why is it not simply
>>
>> config HAS_VMAP
>> 	bool
>>
>> from the very beginning? (There should never be "def_bool n" imo, btw.)
>>
>>>>> --- a/xen/include/xen/vmap.h
>>>>> +++ b/xen/include/xen/vmap.h
>>>>> @@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
>>>>>    /* Initialises the VMAP_DEFAULT virtual range */
>>>>>    static inline void vm_init(void)
>>>>>    {
>>>>> +#ifdef CONFIG_MMU
>>>>>        vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>>>>> +#endif
>>>>>    }
>>>> What about non-Arm, which all have MMUs but no corresponding Kconfig
>>>> setting?
>>> AFAICS , the only file that is of our concern xen/common/vmap.c It is
>>> enclosed with VMAP_VIRT_START which is defined in mmu specific file
>>> (xen/arch/arm/include/asm/mmu/layout.h).
>>>
>>> So, it will not be compiled for Arm MPU arch.
>> Yet that wasn't my question. I asked about non-Arm, for all of which it
>> looks like you're changing behavior of vm_init() (by suddenly making it
>> do nothing).
> 
> Oh now I see what you mean. There is no CONFIG_MMU is x86 , yet it is 
> used to enclose a common code which is a mistake.
> 
> So, we should introduce HAS_VMAP in xen/common/Kconfig and select it 
> from X86, X86_64 and Arm.
> 
> Is my understanding correct ?

Almost. On Arm the select would be conditional, depending on (or simply
from) MMU.

Jan

