Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3F722FA0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543875.849219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Fjy-00043C-JW; Mon, 05 Jun 2023 19:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543875.849219; Mon, 05 Jun 2023 19:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Fjy-0003zq-Fm; Mon, 05 Jun 2023 19:19:42 +0000
Received: by outflank-mailman (input) for mailman id 543875;
 Mon, 05 Jun 2023 19:19:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6Fjx-0003zj-1k
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:19:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6Fjw-0003uS-Ga; Mon, 05 Jun 2023 19:19:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6Fjw-0000z1-BD; Mon, 05 Jun 2023 19:19:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=UMIh03paM4Zl6CZIngzjwiJaiFR0/YGU8PoXYpcy3C0=; b=HFb1wGftUpBHf0VXIok0aG/O7d
	527KaMTpb4OQ/pieOdAfCYEqjx3KEjpvwa9YH+P/tWZaEMGTypOYnWGe2vrOYUgffoUgLALJvRAgw
	gbLVX2DDzLm2ulNxCgPextGpVjpMNxGGWiPiiKgMmdmaK0+QCrbk85rDSb3C41aOTdks=;
Message-ID: <831b46dc-eff8-b937-c0f7-57acc39afee7@xen.org>
Date: Mon, 5 Jun 2023 20:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
In-Reply-To: <20230602004824.20731-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> Remove static type so this can also be used by SMMU drivers to check if the
> device is being used before removing.
> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign.

Can you explain if you are trying to resolve an existing bug, or this is 
something that will be necessary in a follow-up patch?

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v6:
>      Created a private header and moved iommu_dt_device_is_assigned() to header.
> ---
>   xen/drivers/passthrough/device_tree.c | 20 ++++++++++++++++----
>   xen/include/xen/iommu-private.h       | 27 +++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+), 4 deletions(-)
>   create mode 100644 xen/include/xen/iommu-private.h
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50c..52e370db01 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -18,6 +18,7 @@
>   #include <xen/device_tree.h>
>   #include <xen/guest_access.h>
>   #include <xen/iommu.h>
> +#include <xen/iommu-private.h>
>   #include <xen/lib.h>
>   #include <xen/sched.h>
>   #include <xsm/xsm.h>
> @@ -83,16 +84,14 @@ fail:
>       return rc;
>   }
>   
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
>   {

Please add an ASSERT() checking the lock is taken.

>       bool_t assigned = 0;
>   
>       if ( !dt_device_is_protected(dev) )
>           return 0;
>   
> -    spin_lock(&dtdevs_lock);
>       assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>   
>       return assigned;
>   }
> @@ -213,27 +212,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>           if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>               break;
>   
> +        spin_lock(&dtdevs_lock);
> +

'dtdevs_lock' was intended to protect modification related to any IOMMU 
change. But here...

>           ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                       domctl->u.assign_device.u.dt.size,
>                                       &dev);

... you also include "dt_find_node_by_gpath". Can you explain why and 
add a comment on top of 'dtdevs_lock' to explain what it is intended use?

>           if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
>               break;
> +        }
>   
>           ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
>           if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
>               break;
> +        }
>   
>           if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>           {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +
> +            if ( iommu_dt_device_is_assigned_locked(dev) )
>               {
>                   printk(XENLOG_G_ERR "%s already assigned.\n",
>                          dt_node_full_name(dev));
>                   ret = -EINVAL;
>               }
> +
> +            spin_unlock(&dtdevs_lock);
>               break;
>           }
>   
> +        spin_unlock(&dtdevs_lock);
> +
>           if ( d == dom_io )
>               return -EINVAL;
>   
> diff --git a/xen/include/xen/iommu-private.h b/xen/include/xen/iommu-private.h
> new file mode 100644
> index 0000000000..5615decaff
> --- /dev/null
> +++ b/xen/include/xen/iommu-private.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> + /*
> + * xen/iommu-private.h
> + *
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#ifndef __XEN_IOMMU_PRIVATE_H__
> +#define __XEN_IOMMU_PRIVATE_H__
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> +#endif
> +
> +#endif /* __XEN_IOMMU_PRIVATE_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

-- 
Julien Grall

