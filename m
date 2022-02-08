Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A64AE0C0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:27:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268689.462634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHVCc-0002xn-MA; Tue, 08 Feb 2022 18:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268689.462634; Tue, 08 Feb 2022 18:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHVCc-0002vi-In; Tue, 08 Feb 2022 18:26:58 +0000
Received: by outflank-mailman (input) for mailman id 268689;
 Tue, 08 Feb 2022 18:26:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHVCb-0002vY-NZ
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:26:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHVCb-0006Kq-8y; Tue, 08 Feb 2022 18:26:57 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.10.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHVCb-0005jr-2e; Tue, 08 Feb 2022 18:26:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=C6XQZSSOMsjdvNQ5KEU18a01jSzfi4Uy2XgjLUtW+t8=; b=uQEo+gTU9bTK7am94EDuF+HnKv
	WOAj3tR9BWev+04k9zULhkwX/sEB2deWqXU1PVGLFo1D1BhBqDMPV6cLRpx0odhMh2s6zYr/mku+g
	E+1sByovPbfYmDPHIsDoZ73v0xrfih7vnFlMzitqy5b3cchA5d6swK0Kynhx4PlksxgI=;
Message-ID: <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
Date: Tue, 8 Feb 2022 18:26:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 08/02/2022 18:00, Oleksii Moisieiev wrote:
> If enabled, host device-tree will be exported to hypfs and can be
> accessed through /devicetree path.
> Exported device-tree has the same format, as the device-tree
> exported to the sysfs by the Linux kernel.
> This is useful when XEN toolstack needs an access to the host device-tree.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   xen/arch/arm/Kconfig           |   8 +
>   xen/arch/arm/Makefile          |   1 +
>   xen/arch/arm/host_dtb_export.c | 307 +++++++++++++++++++++++++++++++++

There is nothing specific in this file. So can this be moved in common/?

>   3 files changed, 316 insertions(+)
>   create mode 100644 xen/arch/arm/host_dtb_export.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..895016b21e 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -33,6 +33,14 @@ config ACPI
>   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>   	  an alternative to device tree on ARM64.
>   
> +config HOST_DTB_EXPORT
> +	bool "Export host device tree to hypfs if enabled"
> +	depends on ARM && HYPFS && !ACPI

A Xen built with ACPI enabled will still be able to boot on a host using 
Device-Tree. So I don't think should depend on ACPI.

Also, I think this should depend on HAS_DEVICE_TREE rather than ARM.

> +	---help---
> +
> +	  Export host device-tree to hypfs so toolstack can have an access for the
> +	  host device tree from Dom0. If you unsure say N.
> +
>   config GICV3
>   	bool "GICv3 driver"
>   	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 07f634508e..0a41f68f8c 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -8,6 +8,7 @@ obj-y += platforms/
>   endif
>   obj-$(CONFIG_TEE) += tee/
>   obj-$(CONFIG_HAS_VPCI) += vpci.o
> +obj-$(CONFIG_HOST_DTB_EXPORT) += host_dtb_export.o
>   
>   obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>   obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb_export.c
> new file mode 100644
> index 0000000000..794395683c
> --- /dev/null
> +++ b/xen/arch/arm/host_dtb_export.c

This is mostly hypfs related. So CCing Juergen for his input on the code.

> @@ -0,0 +1,307 @@
> +/*
> + * xen/arch/arm/host_dtb_export.c
> + *
> + * Export host device-tree to the hypfs so toolstack can access
> + * host device-tree from Dom0
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (C) 2021, EPAM Systems.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/device_tree.h>
> +#include <xen/err.h>
> +#include <xen/guest_access.h>
> +#include <xen/hypfs.h>
> +#include <xen/init.h>
> +
> +#define HOST_DT_DIR "devicetree"
> +
> +static int host_dt_dir_read(const struct hypfs_entry *entry,
> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
> +static unsigned int host_dt_dir_getsize(const struct hypfs_entry *entry);
> +
> +static const struct hypfs_entry *host_dt_dir_enter(
> +    const struct hypfs_entry *entry);
> +static void host_dt_dir_exit(const struct hypfs_entry *entry);
> +
> +static struct hypfs_entry *host_dt_dir_findentry(
> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len);

This is new code. So can you please make sure to avoid forward 
declaration by re-ordering the code.


[...]

> +static char *get_root_from_path(const char *path, char *name)
> +{
> +    const char *nm = strchr(path, '/');
> +    if ( !nm )
> +        nm = path + strlen(path);
> +    else
> +    {
> +        if ( !*nm )
> +            nm--;
> +    }
> +
> +    return memcpy(name, path, nm - path);

What does guaranteee that name will be big enough for the new value?

> +}
> +
> +static int host_dt_dir_read(const struct hypfs_entry *entry,
> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    int ret = 0;
> +    struct dt_device_node *node;
> +    struct dt_device_node *child;

The hypfs should not modify the device-tree. So can this be const?

> +    const struct dt_property *prop;
> +    struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_get_dyndata();
> +    if ( !data )
> +        return -EINVAL;

[...]

> +static struct hypfs_entry *host_dt_dir_findentry(
> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
> +{
> +    struct dt_device_node *node;
> +    char root_name[HYPFS_DYNDIR_ID_NAMELEN];
> +    struct dt_device_node *child;
> +    struct hypfs_dyndir_id *data;
> +    struct dt_property *prop;
> +
> +    data = hypfs_get_dyndata();
> +    if ( !data )
> +        return ERR_PTR(-EINVAL);
> +
> +    node = data->data;
> +    if ( !node )
> +        return ERR_PTR(-EINVAL);
> +
> +    memset(root_name, 0, sizeof(root_name));
> +    get_root_from_path(name, root_name);
> +
> +    for ( child = node->child; child != NULL; child = child->sibling )
> +    {
> +        if ( strcmp(get_name_from_path(child->full_name), root_name) == 0 )
> +            return hypfs_gen_dyndir_entry(&dt_dir.e,
> +                                  get_name_from_path(child->full_name), child);
> +    }
> +
> +    dt_for_each_property_node( node, prop )
> +    {
> +
> +        if ( dt_property_name_is_equal(prop, root_name) )
> +            return hypfs_gen_dyndir_entry(&dt_prop.e, prop->name, prop);
> +    }
> +
> +    return ERR_PTR(-ENOENT);

[...]

> +static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_funcs);
> +
> +static int __init host_dtb_export_init(void)
> +{
> +    ASSERT(dt_host && (dt_host->sibling == NULL));

dt_host can be NULL when booting on ACPI platform. So I think this wants 
to be turned to a normal check and return directly.

Also could you explain why you need to check dt_host->sibling?

Cheers,

-- 
Julien Grall

