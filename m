Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4389EE4C1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855771.1268589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLh1r-00081F-Up; Thu, 12 Dec 2024 11:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855771.1268589; Thu, 12 Dec 2024 11:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLh1r-0007zS-Qn; Thu, 12 Dec 2024 11:06:47 +0000
Received: by outflank-mailman (input) for mailman id 855771;
 Thu, 12 Dec 2024 11:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLh1r-0007zI-0z
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:06:47 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b3e416-b879-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 12:06:38 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so246286f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:06:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878251dba9sm3669114f8f.98.2024.12.12.03.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:06:42 -0800 (PST)
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
X-Inumbo-ID: 28b3e416-b879-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734001603; x=1734606403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9q1TIO9XEXl5wxz4pacBPWrkjhyyhVCZ/ilae7gYZHQ=;
        b=gRbnHhd7ulk+c2aBIUQt9GkbJDZoXgEL7WDR/8bXzQDsJtUx0xzsD2EflevQgeOg0i
         nHnnht3MGsR22Funty31+//Y6XU5LBCWlhXJyvDbivpGCW2Jom+KuBRVr+lV2/y0AMmx
         WENE8udLj8jriwmt+3552g3GhFXNbq1rnlPgGYO+Mff7wB/kKpCshXCMY7OfBtGvqH0Q
         e4Js/m8vjgMqz+RTaDLiorMF8uZem8p5iGR1JIBwBj5tVdnYsxAQDzu9Kmq2yFABhvmg
         K6yNg4JQCosd0QJqtlvlie1lTrtH4JOC0WHnhrmBQyt6aJlv0gWBTWDeNkrZxcaKABa6
         UtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734001603; x=1734606403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q1TIO9XEXl5wxz4pacBPWrkjhyyhVCZ/ilae7gYZHQ=;
        b=fh5DEEA7GtrHv/panjmtpd0k1uGVxFfcyVpAU5IMstM1qKo+sM79mnhwjAFvIpiZ4F
         x7ppYH0c8xR2CBaymxM/BDlupkblzzdg6jtJlhNJzwcD5efppUr6WXeV1RApYTJ2fIeC
         sNHQ4uuUAJqcSI0LFKSI0FJPQdnnlMPHjFPX6kWZajn2O5p0tlC/bjQGjPwwfm0gCjmY
         l9SYpCWsC1sfEZcKiBpWz8jyCOisL0hvTqwx19YZmKIxDnfIzEkSBuQn9wEkZE6fKpe3
         ziThyOdg9+2DlpgrONjlLp7N8MlIN1hqsx9VqngcA8K/0Y+EvcgD0Dm7+37xuV5kkSiL
         1okQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUjlSk5eRqmn2sMBiipkym0ARVDpso3EsDJRs7M6xAq6tY226L7cUOQqm3vd3i0Ya9n5QeTct1+nM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhA9a69bbXDEGtRaep94E6jQJMJfbokhFMW/A39oRP0UeCocxV
	B0Dhi+KhStm1eOP9+S6sKKgqjGTY5SCgRHYDq1Gp/ZFlfKaNGuHFWlpK/9JMJg==
X-Gm-Gg: ASbGncuOtop2v8y/n1ldnavJHV0yySLkND2paA9wxMDmW49GrCsLJ4DFeb4ETiNQzCk
	ZCaDgqL5dzYoxegR4t8wMwbRg1OXNPKM2CE8rkI52dlMgde9Ek1FpY4ppvAg1ORy8t0LCyH6Ct7
	JxPmtj+j3B4GCoxLchbA/k4sVt4ePiQFKci52IJ19L1NHdC6JRlLUGFTav3mZ+FVo1h3ojON1iC
	Xv+OGvxikX46XkwXql41TGdqehP2FCmf8xepIR+0ZTWuG/4oGHXmxp95e6DWvsgPFdOOTdiVq/a
	gCSFHHZJmH9C6NUiCvmWPN4xFB7FlH5iO3RZi/03Gw==
X-Google-Smtp-Source: AGHT+IHmkNR0XAQVTlDj3u/r6hlDW61dK4PKHL5CU1YpHRwdmprv/DKhapmAALyupWWdoLF3A8ROuw==
X-Received: by 2002:a05:6000:986:b0:386:3918:16a8 with SMTP id ffacd0b85a97d-3878768e1f5mr2547114f8f.13.1734001603084;
        Thu, 12 Dec 2024 03:06:43 -0800 (PST)
Message-ID: <3b0d3128-2501-4866-a2c5-36a1277956b1@suse.com>
Date: Thu, 12 Dec 2024 12:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
 <f12f30f2-c1ea-4118-bbd0-c37a948f0ac2@suse.com>
 <71d62f74-91d9-498f-80a7-d0dc01fb51da@apertussolutions.com>
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
In-Reply-To: <71d62f74-91d9-498f-80a7-d0dc01fb51da@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 13:36, Daniel P. Smith wrote:
> On 12/2/24 05:10, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> Introduce the domain builder which is capable of consuming a device tree as the
>>> first boot module. If it finds a device tree as the first boot module, it will
>>> set its type to BOOTMOD_FDT. This change only detects the boot module and
>>> continues to boot with slight change to the boot convention that the dom0
>>> kernel is no longer first boot module but is the second.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>   xen/arch/x86/Makefile                    |  2 +
>>>   xen/arch/x86/domain_builder/Makefile     |  3 ++
>>>   xen/arch/x86/domain_builder/core.c       | 55 ++++++++++++++++++++++++
>>>   xen/arch/x86/domain_builder/fdt.c        | 38 ++++++++++++++++
>>>   xen/arch/x86/domain_builder/fdt.h        | 21 +++++++++
>>>   xen/arch/x86/include/asm/bootinfo.h      |  3 ++
>>>   xen/arch/x86/include/asm/domainbuilder.h |  8 ++++
>>>   xen/arch/x86/setup.c                     | 18 +++++---
>>>   8 files changed, 142 insertions(+), 6 deletions(-)
>>>   create mode 100644 xen/arch/x86/domain_builder/Makefile
>>>   create mode 100644 xen/arch/x86/domain_builder/core.c
>>>   create mode 100644 xen/arch/x86/domain_builder/fdt.c
>>>   create mode 100644 xen/arch/x86/domain_builder/fdt.h
>>
>> As I'm sure I indicated before: Dashes instead of underscores please in new
>> files' names.
>>
>>>   create mode 100644 xen/arch/x86/include/asm/domainbuilder.h
>>
>> Why is there no separator in this file's name?
> 
> Name was getting a bit long, but can add separator if desired.

Well, my desire is for the subdir and the header names to match up.
Personally I think that neater to achieve when both have a dash in the
middle.

>>> --- /dev/null
>>> +++ b/xen/arch/x86/domain_builder/core.c
>>> @@ -0,0 +1,55 @@
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
>>> +        case -EINVAL:
>>> +            printk("Hyperlaunch device tree was not detected\n");
>>> +            bi->hyperlaunch_enabled = false;
>>> +            break;
>>> +        case -ENOENT:
>>> +            fallthrough;
>>
>> No need for this.
> 
> I thought MISRA called for explicit fallthrough?

Only when there are statements between two case labels. Which ...

>>> +        case -ENODATA:

... isn't the case here.

>>> @@ -1277,9 +1278,12 @@ void asmlinkage __init noreturn __start_xen(void)
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
>> Better latch the result here into a separate local variable, for use ...
>>
>>> @@ -1466,8 +1470,9 @@ void asmlinkage __init noreturn __start_xen(void)
>>>           xen->size  = __2M_rwdata_end - _stext;
>>>       }
>>>   
>>> -    bi->mods[0].headroom =
>>> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
>>> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>> +    bi->mods[i].headroom =
>>> +        bzimage_headroom(bootstrap_map_bm(&bi->mods[i]), bi->mods[i].size);
>>>       bootstrap_unmap();
>>>   
>>>   #ifndef highmem_start
>>> @@ -1591,7 +1596,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>   #endif
>>>       }
>>>   
>>> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
>>> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>> +    if ( bi->mods[i].headroom && !bi->mods[0].relocated )
>>>           panic("Not enough memory to relocate the dom0 kernel image\n");
>>>       for ( i = 0; i < bi->nr_modules; ++i )
>>>       {
>>
>> ... in these two places?
> 
> I don't know if a local variable is need. I assume your suggestion is to 
> drop the first_boot_module_index() call,

The latter two of the three, yes.

> but thinking about it, not sure 
> why I kept the walk. A direct use of bi->domains[0].kernel could be used 
> without the intermediate variable while removing the call.

If that's possible, the even better.

Jan

