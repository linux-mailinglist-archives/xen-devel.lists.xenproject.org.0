Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3152A78B06
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935370.1336796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuLg-0002KM-W6; Wed, 02 Apr 2025 09:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935370.1336796; Wed, 02 Apr 2025 09:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuLg-0002IM-TR; Wed, 02 Apr 2025 09:25:28 +0000
Received: by outflank-mailman (input) for mailman id 935370;
 Wed, 02 Apr 2025 09:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuLf-0002IG-7J
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:25:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686cc44c-0fa4-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:25:25 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso42953195e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60cc0fcsm14663835e9.20.2025.04.02.02.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:25:24 -0700 (PDT)
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
X-Inumbo-ID: 686cc44c-0fa4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743585924; x=1744190724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M7u46J27CCYhmEFRigGoqBgSwxL6f/h2A8tMYQRwoLE=;
        b=HdUzMVIQ9QzoraNf9ebWZWEloSPPXlVEG3oxNKDDyWEkKc/PGeU6N3/r6xk65rEdBi
         tNw1bfRRr1d18REscgve/TM1X5b6fEjP3nLRKb7NtrHW1JtYLIA8vXU17oUXHzC1zjna
         xPJsQLWEKoFBdjvS4ydZ0ozSO9d4iNor1Ux2tfnPg/gAQn6plOmg4UGBoK77ltmUmaiF
         yUCLPt2TprYpY14nfiF5wMe8yRvfQbt1rPJykQAOqjgLjpRmKYIxMBXNoQivvM4fpQW0
         uL7x9ACXduwS2NA058mNcuerB6uzyybZ4S6tLSxYyJWm6yWYHUmBdN+1qKDvYfBoDPLf
         yhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585924; x=1744190724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7u46J27CCYhmEFRigGoqBgSwxL6f/h2A8tMYQRwoLE=;
        b=cZ8BrVYofg1tMfMhLlOQd4fBWKjVrtF+GIDUX//Mv44Z7bLmPswh0g/wMvHpQsN/yd
         v9lxdimwYIH4em8rlLFXI0XuTW6mTp4FJ0xayZeec4SWdJHG1h9GnVOL2Sm6Ukwq4UQ7
         AEZ44L9/vINb78qW1DL1b1xjohF72Bfn2RLfWgiJFiZu2MRc8ujN/6z7By/Qrsq8dEbh
         o/yXik2CmvYN63F4/9NNYE7mKFhQN8R2divf1YK/TjuZzgQXEn7q1ReWwUJfg86MfYn2
         UHXftb7OdUzAZBBye0R01Sh4f424wp7giKjYsODTeXqkwdSjzs4KRFdcA1niO4D45HhH
         n4bw==
X-Forwarded-Encrypted: i=1; AJvYcCXh9Wcuo5fLy7g0+IIJmuGA9SrY0tB5IuhwrJbfl+IcAlzgnOPe4X6jmeyvBiorgoo3N8L3z67xH0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqfRG052EKQ0ORmoSEU0l8abNped20/jmxej2i8Vbv7b+7J4RZ
	wY7hxLF3WnU9hrbHdoNb69RSV6jBA/azaqnheuaB0r+miz7/MksuYlPHJiTKaw==
X-Gm-Gg: ASbGncsHaweXrATTNTzdBWLqsjDbTtdT0zWfX3lRIffxMx7kfTjQM7Th4v9MieVIUhp
	qUEx2bhywbUoyj8JiSGTT0ZN2CbZydj3feFwMFtspfuut/TdtX17TSvaQFXslnJy416kmK1rzZj
	KzzNY1bMRUrU38FiFkEZpPa+QHVlZPI3Ad0BryYyLxFyP/GygYaXu3+fhidOcea1ERwcyuZNVbj
	Wm7g2EULeOXVWTPR7+O8APUK5eYICCi34z99ujaY7QHRYcrmpd6ygJPKSav2gkXEGK1Oao+kGD3
	mW5AcbtmG2oOzDJdx3tcu6kNN87w9zTjzjlCrZt6B2Ghiy3M9sd8mIPVLAg6eG+ZW0MLcuoYPPS
	reiq0ajx3DgQ1TMsIJRhHolCWrdFNeQ==
X-Google-Smtp-Source: AGHT+IGe/EIvN2ws27sfb998cV92d1rAmiAjYiESQdPV8FaqXGyln3o46aHOHJP8e5topfxCNAJ4kw==
X-Received: by 2002:a05:600c:1f96:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43eb5b80267mr16802475e9.0.1743585924487;
        Wed, 02 Apr 2025 02:25:24 -0700 (PDT)
Message-ID: <9e3f962a-a45b-4dba-b204-b9f6acae30ec@suse.com>
Date: Wed, 2 Apr 2025 11:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro.GarciaVallejo@amd.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-7-dpsmith@apertussolutions.com>
 <004b066a-b26f-44bd-994f-5c573f6511e6@suse.com>
 <847a0afa-05bd-4f33-b07c-d9d69b9198ae@amd.com>
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
In-Reply-To: <847a0afa-05bd-4f33-b07c-d9d69b9198ae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 20:01, Jason Andryuk wrote:
> On 2025-01-30 09:52, Jan Beulich wrote:
>> On 26.12.2024 17:57, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -81,6 +81,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>>>   obj-y += sysctl.o
>>>   endif
>>>   
>>> +obj-y += domain-builder/
>>
>> The set of subdirs needed in $(obj-y) is specified at the top of the file.
>> Also shouldn't this be obj-$(CONFIG_DOMAIN_BUILDER)?
> 
> Later, all boot-time domain building is handled by 
> domain-builder/core.c.  So some of domain-builder/ is always built, and 
> Kconfig disables multidomain support.

Then CONFIG_DOMAIN_BUILDER is a misnomer?

>>> --- /dev/null
>>> +++ b/xen/arch/x86/domain-builder/core.c
>>> @@ -0,0 +1,57 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2024, Apertus Solutions, LLC
>>> + */
>>> +#include <xen/err.h>
>>> +#include <xen/init.h>
>>> +#include <xen/kconfig.h>
>>> +#include <xen/lib.h>
>>> +
>>> +#include <asm/bootinfo.h>
>>> +
>>> +#include "fdt.h"
>>> +
>>> +void __init builder_init(struct boot_info *bi)
>>> +{
>>> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>>> +    {
>>> +        int ret;
>>> +
>>> +        switch ( ret = has_hyperlaunch_fdt(bi) )
>>> +        {
>>> +        case 0:
>>> +            printk("Hyperlaunch device tree detected\n");
>>> +            bi->hyperlaunch_enabled = true;
>>> +            bi->mods[0].type = BOOTMOD_FDT;
>>> +            break;
>>> +
>>> +        case -EINVAL:
>>> +            printk("Hyperlaunch device tree was not detected\n");
>>> +            bi->hyperlaunch_enabled = false;
>>> +            break;
>>> +
>>> +        case -ENOENT:
>>> +        case -ENODATA:
>>> +            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
>>> +            bi->hyperlaunch_enabled = false;
>>> +            bi->mods[0].type = BOOTMOD_FDT;
>>> +            break;
>>> +
>>> +        default:
>>> +            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
>>> +                   ret);
>>> +            bi->hyperlaunch_enabled = false;
>>> +            break;
>>> +        }
>>> +    }
>>> +}
>>
>> What is it that's x86-specific in here?
> 
> Would you prefer xen/common/domain-builder ?

Whatever isn't arch-specific would better live somewhere under xen/common/, yes.

>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/domainbuilder.h
>>> @@ -0,0 +1,8 @@
>>> +#ifndef __XEN_X86_DOMBUILDER_H__
>>> +#define __XEN_X86_DOMBUILDER_H__
>>> +
>>> +#include <asm/bootinfo.h>
>>
>> ... here, is it? Forward decls of struct boot_info are going to do.
> 
> Generally, if you only need a type, just use a forward decl?  Use an 
> include when you need function prototypes?

Yes. The latter also when you need struct/union fields or sizes.

>>> @@ -1285,9 +1286,12 @@ void asmlinkage __init noreturn __start_xen(void)
>>>                  bi->nr_modules);
>>>       }
>>>   
>>> -    /* Dom0 kernel is always first */
>>> -    bi->mods[0].type = BOOTMOD_KERNEL;
>>> -    bi->domains[0].kernel = &bi->mods[0];
>>> +    builder_init(bi);
>>> +
>>> +    /* Find first unknown boot module to use as Dom0 kernel */
>>> +    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>>> +    bi->mods[i].type = BOOTMOD_KERNEL;
>>> +    bi->domains[0].kernel = &bi->mods[i];
>>
>> This is going to change again later? Or else what about there already
>> being a module marked BOOTMOD_KERNEL?
> 
> Yes, it will change.  There will be two paths, and this is part of the 
> non-Hyperlaunch path which needs to implicitly select kernel and initrd 
> from the module order, the same as today.  For hyperlaunch, the device 
> tree explicitly assigns kernel and initrd.

Here and elsewhere, for things that aren't quite right yet, mentioning
such aspects specially in the description (or in certain cases even in
FIXME comments) would help avoid questions like the one I had raised.

Jan

