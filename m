Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057419EEB88
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 16:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856156.1268875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLl3r-0005rw-4h; Thu, 12 Dec 2024 15:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856156.1268875; Thu, 12 Dec 2024 15:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLl3q-0005qO-W5; Thu, 12 Dec 2024 15:25:06 +0000
Received: by outflank-mailman (input) for mailman id 856156;
 Thu, 12 Dec 2024 15:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y8ka=TF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLl3p-0005qI-O8
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 15:25:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413e4baa-b89d-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 16:25:03 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734017092551658.7603516810639;
 Thu, 12 Dec 2024 07:24:52 -0800 (PST)
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
X-Inumbo-ID: 413e4baa-b89d-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1734017095; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aVtsHmmoEPRBVqafU+X+SyutgeOiZednb86pOZ2qen/R+1G8bsHyl0NAPMq7HgbgA8AJOVvoeRIIG6ivKse0aXsSmcE8BajtmDWMHr2H3uSb19cGf9XnW/VFyGmBUoU8wzb/OJohnfbbER2H/AZhZpt4nq2FJD7dSOqrO3KQ0fU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734017095; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F1Ma1hJwRLZUMkZ2303OZR8O0S2s2eu3hXgcPBG/cjs=; 
	b=HPma9QzpItga95COO84F5RNI9eLWRF4KPTfqQ3IRxteIuL//z9Ctpw5SvLi0h1wA9csto9MR23Orahvrnppon7dV67I6hGoC5+ObzaKiDBMJwY3iecuGWdvQvUaGzJ/ZtWCEuD1zA/00Q8AXjfdhWTbUvEAxI/0Hu5VSWRtg+ms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734017095;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=F1Ma1hJwRLZUMkZ2303OZR8O0S2s2eu3hXgcPBG/cjs=;
	b=jT9FWvBHJcgaF4Xhp/MHkDU6c0KhVvGzWitZQAZ2dqoVxt80YavPuENU68Rxlcg/
	stwILGU9nVXBzp8jDetEP6OkzLB2F6fqeFZ362KyJBQHOFDIqj5pvrufdcJpGatOQsY
	gdUwHaiU31WVegeT1l2eJubYjzQB1JrFjdMqvdUg=
Message-ID: <6ea84558-4042-468b-9607-1a2e5a281a89@apertussolutions.com>
Date: Thu, 12 Dec 2024 10:24:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
 <f12f30f2-c1ea-4118-bbd0-c37a948f0ac2@suse.com>
 <71d62f74-91d9-498f-80a7-d0dc01fb51da@apertussolutions.com>
 <3b0d3128-2501-4866-a2c5-36a1277956b1@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <3b0d3128-2501-4866-a2c5-36a1277956b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/12/24 06:06, Jan Beulich wrote:
> On 11.12.2024 13:36, Daniel P. Smith wrote:
>> On 12/2/24 05:10, Jan Beulich wrote:
>>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>>> Introduce the domain builder which is capable of consuming a device tree as the
>>>> first boot module. If it finds a device tree as the first boot module, it will
>>>> set its type to BOOTMOD_FDT. This change only detects the boot module and
>>>> continues to boot with slight change to the boot convention that the dom0
>>>> kernel is no longer first boot module but is the second.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>    xen/arch/x86/Makefile                    |  2 +
>>>>    xen/arch/x86/domain_builder/Makefile     |  3 ++
>>>>    xen/arch/x86/domain_builder/core.c       | 55 ++++++++++++++++++++++++
>>>>    xen/arch/x86/domain_builder/fdt.c        | 38 ++++++++++++++++
>>>>    xen/arch/x86/domain_builder/fdt.h        | 21 +++++++++
>>>>    xen/arch/x86/include/asm/bootinfo.h      |  3 ++
>>>>    xen/arch/x86/include/asm/domainbuilder.h |  8 ++++
>>>>    xen/arch/x86/setup.c                     | 18 +++++---
>>>>    8 files changed, 142 insertions(+), 6 deletions(-)
>>>>    create mode 100644 xen/arch/x86/domain_builder/Makefile
>>>>    create mode 100644 xen/arch/x86/domain_builder/core.c
>>>>    create mode 100644 xen/arch/x86/domain_builder/fdt.c
>>>>    create mode 100644 xen/arch/x86/domain_builder/fdt.h
>>>
>>> As I'm sure I indicated before: Dashes instead of underscores please in new
>>> files' names.
>>>
>>>>    create mode 100644 xen/arch/x86/include/asm/domainbuilder.h
>>>
>>> Why is there no separator in this file's name?
>>
>> Name was getting a bit long, but can add separator if desired.
> 
> Well, my desire is for the subdir and the header names to match up.
> Personally I think that neater to achieve when both have a dash in the
> middle.

Sure.

>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/domain_builder/core.c
>>>> @@ -0,0 +1,55 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (C) 2024, Apertus Solutions, LLC
>>>> + */
>>>> +#include <xen/err.h>
>>>> +#include <xen/init.h>
>>>> +#include <xen/kconfig.h>
>>>> +#include <xen/lib.h>
>>>> +
>>>> +#include <asm/bootinfo.h>
>>>> +
>>>> +#include "fdt.h"
>>>> +
>>>> +void __init builder_init(struct boot_info *bi)
>>>> +{
>>>> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>>>> +    {
>>>> +        int ret;
>>>> +
>>>> +        switch ( ret = has_hyperlaunch_fdt(bi) )
>>>> +        {
>>>> +        case 0:
>>>> +            printk("Hyperlaunch device tree detected\n");
>>>> +            bi->hyperlaunch_enabled = true;
>>>> +            bi->mods[0].type = BOOTMOD_FDT;
>>>> +            break;
>>>> +        case -EINVAL:
>>>> +            printk("Hyperlaunch device tree was not detected\n");
>>>> +            bi->hyperlaunch_enabled = false;
>>>> +            break;
>>>> +        case -ENOENT:
>>>> +            fallthrough;
>>>
>>> No need for this.
>>
>> I thought MISRA called for explicit fallthrough?
> 
> Only when there are statements between two case labels. Which ...
> 
>>>> +        case -ENODATA:
> 
> ... isn't the case here.

Rgr, have already dropped it.

>>>> @@ -1277,9 +1278,12 @@ void asmlinkage __init noreturn __start_xen(void)
>>>>                   bi->nr_modules);
>>>>        }
>>>>    
>>>> -    /* Dom0 kernel is always first */
>>>> -    bi->mods[0].type = BOOTMOD_KERNEL;
>>>> -    bi->domains[0].kernel = &bi->mods[0];
>>>> +    builder_init(bi);
>>>> +
>>>> +    /* Find first unknown boot module to use as Dom0 kernel */
>>>> +    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>>>> +    bi->mods[i].type = BOOTMOD_KERNEL;
>>>> +    bi->domains[0].kernel = &bi->mods[i];
>>>
>>> Better latch the result here into a separate local variable, for use ...
>>>
>>>> @@ -1466,8 +1470,9 @@ void asmlinkage __init noreturn __start_xen(void)
>>>>            xen->size  = __2M_rwdata_end - _stext;
>>>>        }
>>>>    
>>>> -    bi->mods[0].headroom =
>>>> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
>>>> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>>> +    bi->mods[i].headroom =
>>>> +        bzimage_headroom(bootstrap_map_bm(&bi->mods[i]), bi->mods[i].size);
>>>>        bootstrap_unmap();
>>>>    
>>>>    #ifndef highmem_start
>>>> @@ -1591,7 +1596,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>>    #endif
>>>>        }
>>>>    
>>>> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
>>>> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>>> +    if ( bi->mods[i].headroom && !bi->mods[0].relocated )
>>>>            panic("Not enough memory to relocate the dom0 kernel image\n");
>>>>        for ( i = 0; i < bi->nr_modules; ++i )
>>>>        {
>>>
>>> ... in these two places?
>>
>> I don't know if a local variable is need. I assume your suggestion is to
>> drop the first_boot_module_index() call,
> 
> The latter two of the three, yes.
> 
>> but thinking about it, not sure
>> why I kept the walk. A direct use of bi->domains[0].kernel could be used
>> without the intermediate variable while removing the call.
> 
> If that's possible, the even better.

Yep, while it did make the lines a little longer, I was able to use the 
boot_domain reference.

v/r,
dps

