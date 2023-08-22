Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA323784AB1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 21:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588705.920284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYXHn-0001BS-Cn; Tue, 22 Aug 2023 19:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588705.920284; Tue, 22 Aug 2023 19:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYXHn-00018i-8z; Tue, 22 Aug 2023 19:43:31 +0000
Received: by outflank-mailman (input) for mailman id 588705;
 Tue, 22 Aug 2023 19:43:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYXHm-00018c-9H
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 19:43:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYXHl-00051b-JP; Tue, 22 Aug 2023 19:43:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYXHl-0004Uh-Cz; Tue, 22 Aug 2023 19:43:29 +0000
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
	bh=/P5CHVsFqmLOZaued0ELCHI8ljq1iu8qA78eDjLrPjs=; b=aphdeWe6ZEj9zXBnDU06VBdaWs
	xaKG//0DpHCR3eudGyle4d7JUKuyZG8mKTrdALtclHic2Y5eivGHUaC6fSYJFfzOdamETYdR/DU1Q
	xwl4xxjDg43O1UTDyvOfKwwJrLJ7sF2/abOwxuQ302ZIITN3O1dpOJ7CB5u5BjG+o9j4=;
Message-ID: <e77c9551-a167-468f-b889-e2a0a18471c6@xen.org>
Date: Tue, 22 Aug 2023 20:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-10-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> Remove static type so this can also be used by SMMU drivers to check if the
> device is being used before removing.

I have commented on v8. But I will comment here to make easier to keep 
track of comment.

I don't think iommu_dt_device_is_assigned_locked() should be called from 
the SMMU. If you want to check a device is assigned then it would be 
best to use the internal state of the SMMU.

This has two benefits:
   * This avoids what I view as a layer of violation
   * This confirmed that the internal state match with what we expect

> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> patches in this series introduces node add/remove feature.
> 
> Also, caller is required hold the correct lock so moved the function prototype
> to a private header.

I don't understand how requiring the caller to hold the correct lock 
means you need to move the protype in a private header. Can you clarify?

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v7:
>      Update commit message.
>      Add ASSERT().
> ---
> ---
>   xen/drivers/passthrough/device_tree.c | 26 +++++++++++++++++++++----
>   xen/include/xen/iommu-private.h       | 28 +++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+), 4 deletions(-)
>   create mode 100644 xen/include/xen/iommu-private.h
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50c..5796ee1f93 100644
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
> @@ -83,16 +84,16 @@ fail:
>       return rc;
>   }
>   
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
>   {
>       bool_t assigned = 0;
>   
> +    ASSERT(spin_is_locked(&dtdevs_lock));
> +
>       if ( !dt_device_is_protected(dev) )
>           return 0;
>   
> -    spin_lock(&dtdevs_lock);
>       assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>   
>       return assigned;
>   }
> @@ -213,27 +214,44 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>           if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>               break;
>   
> +        /*
> +         * To ensure that the dev doesn't disappear between the time we look it
> +         * up with dt_find_node_by_gpath() and we check the assignment later.
> +         */
> +        spin_lock(&dtdevs_lock);

This change doesn't look to be explained in the commit message. But 
looking at the code after this series is applied, you justified the 
addition of read_lock(&dt_host_lock) to protect access to the 
device-tree. This will be held longer than dtdevs_lock. So is it 
actually necessary to move the locking earlier?

> +
>           ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                       domctl->u.assign_device.u.dt.size,
>                                       &dev);
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
> index 0000000000..bb5c94e7a6
> --- /dev/null
> +++ b/xen/include/xen/iommu-private.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/iommu-private.h
> + */
> +#ifndef __XEN_IOMMU_PRIVATE_H__
> +#define __XEN_IOMMU_PRIVATE_H__
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>
> +
> +/*
> + * Checks if dt_device_node is assigned to a domain or not. This function
> + * expects to be called with dtdevs_lock acquired by caller.
> + */
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> +#endif
> +
> +#endif /* __XEN_IOMMU_PRIVATE_H__ */
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

Cheers,

-- 
Julien Grall

