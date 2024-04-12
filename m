Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28648A23DB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 04:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704286.1100598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv6tb-0004UX-Sl; Fri, 12 Apr 2024 02:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704286.1100598; Fri, 12 Apr 2024 02:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv6tb-0004RK-Od; Fri, 12 Apr 2024 02:44:07 +0000
Received: by outflank-mailman (input) for mailman id 704286;
 Fri, 12 Apr 2024 02:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv6ta-0004RE-Ps
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 02:44:06 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84846653-f876-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 04:44:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1FF5B8285591;
 Thu, 11 Apr 2024 21:44:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ygWY-N45c9o3; Thu, 11 Apr 2024 21:43:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 14A3E82855C0;
 Thu, 11 Apr 2024 21:43:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mpZboqFsdDGO; Thu, 11 Apr 2024 21:43:58 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 860F18285591;
 Thu, 11 Apr 2024 21:43:58 -0500 (CDT)
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
X-Inumbo-ID: 84846653-f876-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 14A3E82855C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712889839; bh=kf3IEagB3Vf7gJQfkbNuK4wKdkw5i0BAXPNiJPR0xrA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=H5frHa1vzp8OzpS5FzPA5Tjn1jefTO5wzNt0ywhcfCujkX6yMWKz5rYwhohBWoohz
	 fqkRut54Gx2wXaHjqAVj6zVnUVA/VdIoIq7O7rfd7B4fush51z0ooiWEoTwIogqzoY
	 lX7G/rw9wlRLk4BqRTtNvHOmDVmY/+mysRxr6RIs=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <fdeabecc-9144-4eb6-9eb8-aac722ed1bb4@raptorengineering.com>
Date: Thu, 11 Apr 2024 21:43:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
 <19c4d0c2-c69c-4310-bf02-28d3894f8006@xen.org>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <19c4d0c2-c69c-4310-bf02-28d3894f8006@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 3/21/24 12:47 PM, Julien Grall wrote:
> Hi Shawn,
> 
> On 14/03/2024 22:15, Shawn Anastasio wrote:
>> Arm's setup.c contains a collection of functions for parsing memory map
>> and other boot information from a device tree. Since these routines are
>> generally useful on any architecture that supports device tree booting,
>> move them into xen/common/device-tree.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   MAINTAINERS                       |   1 +
>>   xen/arch/arm/setup.c              | 419 --------------------------
>>   xen/common/Makefile               |   1 +
>>   xen/common/device-tree/Makefile   |   1 +
>>   xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
> 
> The new bootinfo.c is exported quite a few functions. Please introduce
> an generic header with the associated functions/structures.
>

Good suggestion, will do.

> [...]
> 
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index e5eee19a85..3a39dd35f2 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -76,6 +76,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
>>     obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>>   obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>> +obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>>     CONF_FILE := $(if $(patsubst
>> /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
>>   $(obj)/config.gz: $(CONF_FILE)
>> diff --git a/xen/common/device-tree/Makefile
>> b/xen/common/device-tree/Makefile
>> new file mode 100644
>> index 0000000000..c97b2bd88c
>> --- /dev/null
>> +++ b/xen/common/device-tree/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += bootinfo.o
>> diff --git a/xen/common/device-tree/bootinfo.c
>> b/xen/common/device-tree/bootinfo.c
>> new file mode 100644
>> index 0000000000..a6c0fe7917
>> --- /dev/null
>> +++ b/xen/common/device-tree/bootinfo.c
>> @@ -0,0 +1,469 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Derived from $xen/arch/arm/setup.c.
>> + *
>> + * Early device tree parsing and bookkeeping routines.
>> + *
>> + * Tim Deegan <tim@xen.org>
>> + * Copyright (c) 2011 Citrix Systems.
>> + * Copyright (c) 2024 Raptor Engineering LLC
>> + */
>> +
>> +#include <xen/compile.h>
>> +#include <xen/errno.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/domain_page.h>
>> +#include <xen/grant_table.h>
>> +#include <xen/types.h>
>> +#include <xen/string.h>
>> +#include <xen/serial.h>
>> +#include <xen/sched.h>
>> +#include <xen/console.h>
>> +#include <xen/err.h>
>> +#include <xen/init.h>
>> +#include <xen/irq.h>
>> +#include <xen/mm.h>
>> +#include <xen/param.h>
>> +#include <xen/softirq.h>
>> +#include <xen/keyhandler.h>
>> +#include <xen/cpu.h>
>> +#include <xen/pfn.h>
>> +#include <xen/virtual_region.h>
>> +#include <xen/vmap.h>
>> +#include <xen/trace.h>
>> +#include <xen/libfdt/libfdt-xen.h>
>> +#include <xen/acpi.h>
>> +#include <xen/warning.h>
>> +#include <xen/hypercall.h>
>> +#include <asm/page.h>
>> +#include <asm/current.h>
>> +#include <asm/setup.h>
>> +#include <asm/setup.h>
> 
> setup.h seems duplicated. But this list of headers look suspiciously
> very long for the code you are moving. Can you look at reduce the number
> of includes?
> 
> Also, please take the opportunity to sort them out.

Sure, I'll clean up the order and drop any unneeded includes.

> 
> [...]
> 
>> +/*
>> + * Populate the boot allocator.
>> + * If a static heap was not provided by the admin, all the RAM but the
>> + * following regions will be added:
>> + *  - Modules (e.g., Xen, Kernel)
>> + *  - Reserved regions
>> + *  - Xenheap (arm32 only)
>> + * If a static heap was provided by the admin, populate the boot
>> + * allocator with the corresponding regions only, but with Xenheap
>> excluded
>> + * on arm32.
>> + */
>> +void __init populate_boot_allocator(void)
>> +{
>> +    unsigned int i;
>> +    const struct meminfo *banks = &bootinfo.mem;
>> +    paddr_t s, e;
>> +
>> +    if ( bootinfo.static_heap )
>> +    {
>> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
>> +        {
>> +            if ( bootinfo.reserved_mem.bank[i].type !=
>> MEMBANK_STATIC_HEAP )
>> +                continue;
>> +
>> +            s = bootinfo.reserved_mem.bank[i].start;
>> +            e = s + bootinfo.reserved_mem.bank[i].size;
>> +#ifdef CONFIG_ARM_32
> 
> I think this wants to be replaced with #ifdef CONFIG_SEPARATE_XENHEAP
> same ...
> 
>> +            /* Avoid the xenheap, note that the xenheap cannot across
>> a bank */
>> +            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
>> +                 e >= mfn_to_maddr(directmap_mfn_end) )
>> +            {
>> +                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
>> +                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
>> +            }
>> +            else
>> +#endif
>> +                init_boot_pages(s, e);
>> +        }
>> +
>> +        return;
>> +    }
>> +
>> +    for ( i = 0; i < banks->nr_banks; i++ )
>> +    {
>> +        const struct membank *bank = &banks->bank[i];
>> +        paddr_t bank_end = bank->start + bank->size;
>> +
>> +        s = bank->start;
>> +        while ( s < bank_end )
>> +        {
>> +            paddr_t n = bank_end;
>> +
>> +            e = next_module(s, &n);
>> +
>> +            if ( e == ~(paddr_t)0 )
>> +                e = n = bank_end;
>> +
>> +            /*
>> +             * Module in a RAM bank other than the one which we are
>> +             * not dealing with here.
>> +             */
>> +            if ( e > bank_end )
>> +                e = bank_end;
>> +
>> +#ifdef CONFIG_ARM_32
> 
> ... here. This comment on top of the function would also need to be
> updated.

Good catch, will update the conditional as well as the function's
comment accordingly.

> 
> Cheers,

Thanks,
Shawn

