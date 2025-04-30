Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4B5AA5447
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 20:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973936.1361955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uACbc-0007bd-QI; Wed, 30 Apr 2025 18:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973936.1361955; Wed, 30 Apr 2025 18:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uACbc-0007Yx-Ne; Wed, 30 Apr 2025 18:56:28 +0000
Received: by outflank-mailman (input) for mailman id 973936;
 Wed, 30 Apr 2025 18:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r90l=XQ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uACba-0007Yr-Uq
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 18:56:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdd42924-25f4-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 20:56:21 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1746039364140191.95765285522737;
 Wed, 30 Apr 2025 11:56:04 -0700 (PDT)
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
X-Inumbo-ID: cdd42924-25f4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1746039367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BU+KqFFztoKAOVYEa4e5NM2Ox6M+fmsVLPJ62+X9wwOHRYDrNnGd8+n3Lf/pIbHj5/7GDkAzPoAsDy99zYR6ez5sIvYwtHmDqeiGbCz9tWXLuketId6T42lxuCE8UKbafawjVFGrKhmBx+I+WmV12bsWVxN068kEJZ+hH9GKpog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746039367; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v3wAS+QWKlf3sFKFaCHmypL7EoFI4skKFhk5fOrZQ10=; 
	b=Qzz2jR5iu+b6B4NMHyAd4GjoLFjwxI8OCF6MGTdO4OWEUzFprT8UZ8bpDHo4XZnFTs+fnkVv5vJs3lI1VYMunuKS+bLMyIBADJdFEqZ60l7Zq7d0Df476FyKEJAXaS9ci9B+btgZCyRhVsY4ZYBfJPleFLvPhtpUc9M3hc56uTs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746039367;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v3wAS+QWKlf3sFKFaCHmypL7EoFI4skKFhk5fOrZQ10=;
	b=JfYw7AhlW11xTCkbMH//PjG8DvDidRbwvaBYZ/ML/2QQC1iBBssfXjgOojfWtAEJ
	BVVmBEdD0c4u+9ZdjWCh8k4yVRLyFO4ECICh2OXwOabfm45OR6r1l+DTHrDq2rmuJG0
	ZYd+oEVNk+aEtagiaQdaw7vDsgs4/Ggi4xqLUkuI=
Message-ID: <9021c878-9605-4d6e-95b8-ab97da186542@apertussolutions.com>
Date: Wed, 30 Apr 2025 14:56:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20250429123629.20839-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/29/25 08:36, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Introduce the domain builder which is capable of consuming a device tree as the
> first boot module. If it finds a device tree as the first boot module, it will
> set its type to BOOTMOD_FDT. This change only detects the boot module and
> continues to boot with slight change to the boot convention that the dom0
> kernel is no longer first boot module but is the second.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h |  3 ++
>   xen/arch/x86/setup.c                | 19 ++++++++----
>   xen/common/Makefile                 |  1 +
>   xen/common/domain-builder/Makefile  |  2 ++
>   xen/common/domain-builder/core.c    | 45 +++++++++++++++++++++++++++++
>   xen/common/domain-builder/fdt.c     | 39 +++++++++++++++++++++++++
>   xen/common/domain-builder/fdt.h     | 14 +++++++++
>   xen/include/xen/domain-builder.h    | 29 +++++++++++++++++++
>   8 files changed, 146 insertions(+), 6 deletions(-)
>   create mode 100644 xen/common/domain-builder/Makefile
>   create mode 100644 xen/common/domain-builder/core.c
>   create mode 100644 xen/common/domain-builder/fdt.c
>   create mode 100644 xen/common/domain-builder/fdt.h
>   create mode 100644 xen/include/xen/domain-builder.h
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 3afc214c17..82c2650fcf 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -27,6 +27,7 @@ enum bootmod_type {
>       BOOTMOD_RAMDISK,
>       BOOTMOD_MICROCODE,
>       BOOTMOD_XSM_POLICY,
> +    BOOTMOD_FDT,
>   };
>   
>   struct boot_module {
> @@ -80,6 +81,8 @@ struct boot_info {
>       paddr_t memmap_addr;
>       size_t memmap_length;
>   
> +    bool hyperlaunch_enabled;
> +
>       unsigned int nr_modules;
>       struct boot_module mods[MAX_NR_BOOTMODS + 1];
>       struct boot_domain domains[MAX_NR_BOOTDOMS];
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2518954124..f3b5c83a3c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -6,6 +6,7 @@
>   #include <xen/cpuidle.h>
>   #include <xen/dmi.h>
>   #include <xen/domain.h>
> +#include <xen/domain-builder.h>
>   #include <xen/domain_page.h>
>   #include <xen/efi.h>
>   #include <xen/err.h>
> @@ -1284,9 +1285,14 @@ void asmlinkage __init noreturn __start_xen(void)
>                  bi->nr_modules);
>       }
>   
> -    /* Dom0 kernel is always first */
> -    bi->mods[0].type = BOOTMOD_KERNEL;
> -    bi->domains[0].kernel = &bi->mods[0];
> +    if ( builder_init(bi) == FDT_KIND_NONE )
> +    {
> +        /* Find first unknown boot module to use as dom0 kernel */
> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +        bi->mods[i].type = BOOTMOD_KERNEL;
> +        bi->domains[0].kernel = &bi->mods[i];
> +        bi->hyperlaunch_enabled = false;
> +    }
>   
>       if ( pvh_boot )
>       {
> @@ -1469,8 +1475,9 @@ void asmlinkage __init noreturn __start_xen(void)
>           xen->size  = __2M_rwdata_end - _stext;
>       }
>   
> -    bi->mods[0].headroom =
> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
> +    bi->domains[0].kernel->headroom =
> +        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
> +                         bi->domains[0].kernel->size);
>       bootstrap_unmap();
>   
>   #ifndef highmem_start
> @@ -1594,7 +1601,7 @@ void asmlinkage __init noreturn __start_xen(void)
>   #endif
>       }
>   
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relocated )
>           panic("Not enough memory to relocate the dom0 kernel image\n");
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 98f0873056..e42af71e3f 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>   obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
>   obj-y += domain.o
> +obj-$(CONFIG_DOMAIN_BUILDER) += domain-builder/

Please don't do this, use IF_ENABLED in core.c and then hide the 
unnecessary units in domain-builder/Makefile as I originally had it. 
This allows for a much easier time incrementally converting the dom0 
construction path into a generalized domain construction path.

>   obj-y += event_2l.o
>   obj-y += event_channel.o
>   obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
> diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-builder/Makefile
> new file mode 100644
> index 0000000000..bfd2f6267e
> --- /dev/null
> +++ b/xen/common/domain-builder/Makefile
> @@ -0,0 +1,2 @@
> +obj-y += fdt.init.o
> +obj-y += core.init.o
> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
> new file mode 100644
> index 0000000000..97c92db571
> --- /dev/null
> +++ b/xen/common/domain-builder/core.c
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/bug.h>
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/kconfig.h>
> +#include <xen/domain-builder.h>
> +#include <xen/lib.h>
> +
> +#include <asm/bootinfo.h>
> +
> +#include "fdt.h"
> +
> +enum fdt_kind __init builder_init(struct boot_info *bi)
> +{
> +    enum fdt_kind kind;
> +
> +    bi->hyperlaunch_enabled = false;
> +    switch ( (kind = fdt_detect_kind(bi)) )
> +    {
> +    case FDT_KIND_NONE:
> +        /* No DT found */
> +        return kind;
> +
> +    case FDT_KIND_UNKNOWN:
> +        printk(XENLOG_DEBUG "DT found: non-hyperlaunch\n");
> +        bi->mods[0].type = BOOTMOD_FDT;
> +        return kind;
> +
> +    default:
> +        BUG();
> +    }
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
> new file mode 100644
> index 0000000000..4b07bd22c8
> --- /dev/null
> +++ b/xen/common/domain-builder/fdt.c
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +
> +#include <asm/bootinfo.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +
> +enum fdt_kind __init fdt_detect_kind(const struct boot_info *bi)
> +{
> +    enum fdt_kind kind;
> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +
> +    if ( !fdt || fdt_check_header(fdt) < 0 )
> +        kind = FDT_KIND_NONE;
> +    else
> +        kind = FDT_KIND_UNKNOWN;
> +
> +    bootstrap_unmap();
> +
> +    return kind;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
> new file mode 100644
> index 0000000000..ef897fc412
> --- /dev/null
> +++ b/xen/common/domain-builder/fdt.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_DOMAIN_BUILDER_FDT_H__
> +#define __XEN_DOMAIN_BUILDER_FDT_H__
> +
> +#include <xen/domain-builder.h>
> +
> +struct boot_info;
> +
> +/* hyperlaunch fdt is required to be module 0 */
> +#define HYPERLAUNCH_MODULE_IDX 0
> +
> +enum fdt_kind fdt_detect_kind(const struct boot_info *bi);
> +
> +#endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
> diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
> new file mode 100644
> index 0000000000..b9702db735
> --- /dev/null
> +++ b/xen/include/xen/domain-builder.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_DOMAIN_BUILDER_H__
> +#define __XEN_DOMAIN_BUILDER_H__
> +
> +struct boot_info;
> +
> +/* Return status of builder_init(). Shows which boot mechanism was detected */
> +enum fdt_kind
> +{
> +    /* FDT not found. Skipped builder. */
> +    FDT_KIND_NONE,
> +    /* Found an FDT that wasn't hyperlaunch. */
> +    FDT_KIND_UNKNOWN,
> +};
> +
> +/*
> + * Initialises `bi` if it detects a compatible FDT. Otherwise returns
> + * FDT_KIND_NONE and leaves initialisation up to the caller.
> + */
> +#if IS_ENABLED(CONFIG_DOMAIN_BUILDER)
> +enum fdt_kind builder_init(struct boot_info *bi);
> +#else
> +static inline enum fdt_kind builder_init(struct boot_info *bi)
> +{
> +    return FDT_KIND_NONE;
> +}
> +#endif /* !IS_ENABLED(CONFIG_DOMAIN_BUILDER) */
> +
> +#endif /* __XEN_DOMAIN_BUILDER_H__ */


