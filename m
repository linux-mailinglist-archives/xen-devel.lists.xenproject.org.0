Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBAB09BBB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048048.1418364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucewr-0005Zm-6Z; Fri, 18 Jul 2025 06:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048048.1418364; Fri, 18 Jul 2025 06:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucewr-0005Xx-36; Fri, 18 Jul 2025 06:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1048048;
 Fri, 18 Jul 2025 06:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucewp-0005Xr-P3
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:51:59 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b28081da-63a3-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 08:51:57 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so1218356f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 23:51:57 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8026e4sm69020075e9.11.2025.07.17.23.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 23:51:56 -0700 (PDT)
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
X-Inumbo-ID: b28081da-63a3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752821517; x=1753426317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mGQEpNUd0oexWkA1zZZ9DKb2ylsUZO9spIuA9uWRDv0=;
        b=B8fVLVw97DSymZ6+P3CYSBLupu2tjBXOaRg3bWkkegOitbyRINTsVCPaQjEQ61lJgs
         aKJGhdsQSBlV5qH74EpSIvQlmARb6CWegKOhjynMhy6X0JmfiPJ6rijZ8cwX1M1GXJ+y
         VCvGLIKRRMrxwz42qE9RD6Qxx8kS8RIsUUIqaj5Y9/0jHuYwch8dNMNwkr85Es4TiEws
         eGehPeg5JVfVcL8Zp3ZAVCcWyE7tNz96jMuRMFRaBP3PMgQt82X/B92us4bDUBRbVw9u
         bvbglUwAAXWRS+oOqONfAR3aV70ZJy4zUqKPwTq3J7KUC4QXFVxsm/lnEoz04YXHzMPf
         KJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752821517; x=1753426317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGQEpNUd0oexWkA1zZZ9DKb2ylsUZO9spIuA9uWRDv0=;
        b=AvaxVtCZrE+eqY5LHRlGdriJVki1XJQGvp4XKmKaMpCY8XDlL3f5t03kSCgNL61w6r
         r2uTGWOlM2oyUYFu4ogbOprom5rJlKSyRtaONw7hbFBYfofBsg8Fjqny+o7TaXLIzDM6
         l3fIRpJe0TJH1VQgRTnIStFE2F7sh+IOyNsU2Y9k7MXXItp81+KMunU2w5o2M/C5nIFQ
         j5toz5+im2eH8Fk/Vq58IsDaQk18p5DDhwq2L+UidglzbbFuVxRnc3zJug4MjmGkHJYf
         g3GeOxbp42TIH50GmfaascP7Ynq3i6CdDluJOz+mI+ttKvRUa18UYs3XUWQIYOFNmnbK
         JdTg==
X-Gm-Message-State: AOJu0YybmIR4MeatE2TVhNKTo1AT+r3EqnMGcqnWFgVk7j2lBuqzjagm
	VWAoI3iegJVFxJtFIE9oln6hjElkbkzVuP7Q4TWMPrFvr1cOQ+l9/mW++JoOVZHTAw==
X-Gm-Gg: ASbGncsgycGkJZhrHrKE99aWi+jdBa7y/ZEDpbKz6Ahbkj07k5FYPqIPNuQRsxI6Js7
	rzz1tn4OvnQfRtIRQMl728+Dc5KvLDi1gQRpj3cIiMVzcnnHJ159PlSBIgzVjM39SZfqHZcSMfM
	hwgGJrbhLV1KBL590x7/WUbv19F92aZ+VuZBYUIF998ySJQ/JjXHQCtDOEGmDvm31Xs1XWwHm4y
	3jpx1tCXVs8hAXtTGMfMjHtwbgm4PQN3iDFu7J4WR87lL6QIHdx3fWMy/FIY2q1BF+1x+cy983a
	aguCdwgmcG2qw9AijvF41yo/RR7NW54RDCHofGWstq84aFRSS8G3tzIZcHGnIU7JaJJVs3avJsw
	BlbTIoOmGNucmyRBcxFNKJ7hHk1ha7ejdxsKIl//uGSReFsGwLedGoG+M1nMkCiq8000ogoHkDl
	0b47Ib3rsJu7C3G91Mr9Ea6WmR6hrHsGBlat80x3e8ee2iUPnHqx3lITHv
X-Google-Smtp-Source: AGHT+IGn+fU/9ztmD496wWgsq2o3YTtzB7YFvi8Wj1JDPRUp5Q2MjZLPjxrw7BPpFoLv0gNIdmQn4g==
X-Received: by 2002:adf:e195:0:b0:3aa:caea:aa7f with SMTP id ffacd0b85a97d-3b60e540843mr7067014f8f.56.1752821516796;
        Thu, 17 Jul 2025 23:51:56 -0700 (PDT)
Message-ID: <481f8b5f-97bb-47b8-8766-2bc4178f087d@suse.com>
Date: Fri, 18 Jul 2025 08:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/11] x86: Replace arch-specific boot_domain with the
 common one
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 alejandro.garciavallejo@amd.com
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-4-alejandro.garciavallejo@amd.com>
 <alpine.DEB.2.22.394.2507171707170.15546@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507171707170.15546@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 02:09, Stefano Stabellini wrote:
> It looks like this patch is the only one missing an Ack. (Aside from
> patch #11).

I've sent an ack. Yet according to my records patch 1 also is still
lacking an (XSM) ack. Plus, to be honest, a ping after ...

> On Tue, 15 Jul 2025, Alejandro Vallejo wrote:

... just 3 days feels a little early. Especially as I'm sure you're
aware I'm looking at lots of patches ... (If only many of my patches
were looked at at all, let alone within 3 days.)

Jan

>> No functional change intended.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>>  xen/arch/x86/hvm/dom0_build.c          |  2 +-
>>  xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
>>  xen/arch/x86/include/asm/bootinfo.h    |  1 -
>>  xen/arch/x86/pv/dom0_build.c           |  2 +-
>>  xen/arch/x86/setup.c                   |  2 +-
>>  xen/include/xen/bootfdt.h              |  4 ++++
>>  6 files changed, 7 insertions(+), 37 deletions(-)
>>  delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index 2bb8ef355c..8d2734f2b5 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -648,7 +648,7 @@ static int __init pvh_load_kernel(
>>  {
>>      struct domain *d = bd->d;
>>      struct boot_module *image = bd->kernel;
>> -    struct boot_module *initrd = bd->module;
>> +    struct boot_module *initrd = bd->initrd;
>>      void *image_base = bootstrap_map_bm(image);
>>      void *image_start = image_base + image->arch.headroom;
>>      unsigned long image_len = image->size;
>> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
>> deleted file mode 100644
>> index d7c6042e25..0000000000
>> --- a/xen/arch/x86/include/asm/boot-domain.h
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-or-later */
>> -/*
>> - * Copyright (c) 2024 Apertus Solutions, LLC
>> - * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> - * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> - */
>> -
>> -#ifndef __XEN_X86_BOOTDOMAIN_H__
>> -#define __XEN_X86_BOOTDOMAIN_H__
>> -
>> -#include <public/xen.h>
>> -
>> -struct boot_domain {
>> -    domid_t domid;
>> -
>> -    struct boot_module *kernel;
>> -    struct boot_module *module;
>> -    const char *cmdline;
>> -
>> -    struct domain *d;
>> -};
>> -
>> -#endif
>> -
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * tab-width: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index d33b100e04..4f2cc5906e 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -12,7 +12,6 @@
>>  #include <xen/init.h>
>>  #include <xen/multiboot.h>
>>  #include <xen/types.h>
>> -#include <asm/boot-domain.h>
>>  
>>  /* Max number of boot modules a bootloader can provide in addition to Xen */
>>  #define MAX_NR_BOOTMODS 63
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index a4b5362357..c37bea9454 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>>      struct vcpu *v = d->vcpu[0];
>>  
>>      struct boot_module *image = bd->kernel;
>> -    struct boot_module *initrd = bd->module;
>> +    struct boot_module *initrd = bd->initrd;
>>      void *image_base;
>>      unsigned long image_len;
>>      void *image_start;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 7e70b46332..7380f1053f 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2171,7 +2171,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>      if ( initrdidx < MAX_NR_BOOTMODS )
>>      {
>>          bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
>> -        bi->domains[0].module = &bi->mods[initrdidx];
>> +        bi->domains[0].initrd = &bi->mods[initrdidx];
>>          if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
>>              printk(XENLOG_WARNING
>>                     "Multiple initrd candidates, picking module #%u\n",
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index 28f7d18262..ac2a79b59b 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -103,6 +103,10 @@ struct shared_meminfo {
>>  struct boot_domain {
>>      struct domain *d;
>>  
>> +#ifdef CONFIG_X86
>> +    domid_t domid;
>> +#endif
>> +
>>      struct boot_module *kernel;
>>      struct boot_module *initrd;
>>  
>> -- 
>> 2.43.0
>>


