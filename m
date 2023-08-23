Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB1786328
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 00:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589610.921593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYw0G-0008SC-5Q; Wed, 23 Aug 2023 22:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589610.921593; Wed, 23 Aug 2023 22:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYw0G-0008Pc-1o; Wed, 23 Aug 2023 22:07:04 +0000
Received: by outflank-mailman (input) for mailman id 589610;
 Wed, 23 Aug 2023 22:07:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYw0E-0008PU-49
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 22:07:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYw0D-00052r-Hx; Wed, 23 Aug 2023 22:07:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYw0D-0002dZ-D2; Wed, 23 Aug 2023 22:07:01 +0000
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
	bh=4GdTVlycM1Lt6UK+BDRm9UAv5uRmAcCByuVPxXBXJKA=; b=7IeH+JCO3fDSnx9x6BZKQm52Kn
	6xgBCTuvSIOuMxVlRVLtKXG0ILZ7uBtd3MCeadg2pppTpLUU0rIlMmii3MlNkzn5FfSBORmuqw1H6
	mp1ckjW/mC1xp+3ubAyra+GyjpI7QO/YaaPl5tXihS+yCm/EkUv56JWcmrMpjSbUsAUM=;
Message-ID: <d5e658e4-e30e-4783-8fcc-0bd93126abf3@xen.org>
Date: Wed, 23 Aug 2023 23:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 14/19] common/device_tree: Add rwlock for dt_host
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-15-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-15-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
>   Dynamic programming ops will modify the dt_host and there might be other
>   function which are browsing the dt_host at the same time. To avoid the race

Typo: I think you want to write 'functions'

>   conditions, adding rwlock for browsing the dt_host during runtime. dt_host
>   writer will be added in the follow-up patch titled "xen/arm: Implement device
>   tree node addition functionalities."

I would prefer if we avoid mention the name of the follow-up commit. 
This will reduce the risk that the name of the commit is incorrect if we 
decide to commit this patch before the rest of the series is ready.

Also, the commit message seems to be indented. Was it intended?

> 
>   Reason behind adding rwlock instead of spinlock:
>      For now, dynamic programming is the sole modifier of dt_host in Xen during
>          run time. All other access functions like iommu_release_dt_device() are
>          just reading the dt_host during run-time. So, there is a need to protect
>          others from browsing the dt_host while dynamic programming is modifying
>          it. rwlock is better suitable for this task as spinlock won't be able to
>          differentiate between read and write access.

The indentation looks odd here as well.

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v7:
>      Keep one lock for dt_host instead of lock for each node under dt_host.
> ---
> ---
>   xen/common/device_tree.c              |  5 +++++
>   xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
>   xen/include/xen/device_tree.h         |  6 ++++++
>   3 files changed, 26 insertions(+)

I am not sue where to put the comment. I noticed that you didn't touch 
iommu_remove_dt_device() and iommu_add_dt_device(). Does this mean the 
caller is expected to held the lock? If so, then this should be 
documented and an ASSERT() should be added.

> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 0f10037745..6b934fe036 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
>   struct dt_device_node *dt_host;
>   /* Interrupt controller node*/
>   const struct dt_device_node *dt_interrupt_controller;
> +rwlock_t dt_host_lock;
>   
>   /**
>    * struct dt_alias_prop - Alias property in 'aliases' node
> @@ -2137,7 +2138,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>   
>       dt_dprintk(" <- unflatten_device_tree()\n");
>   
> +    /* Init r/w lock for host device tree. */
> +    rwlock_init(&dt_host_lock);

Calling rwlock_init() from unflattent_device_tree() seems to be 
incorrect as it would lead to re-initialize the lock every time we are 
create a new DT overlay.

Instead you want to replace the definition of dt_host_lock with:

DEFINE_RWLOCK(dt_host_lock)

> +
>       return 0;
> +

Spurious change?

>   }
>   
>   static void dt_alias_add(struct dt_alias_prop *ap,
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 4cb32dc0b3..31815d2b60 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -114,6 +114,8 @@ int iommu_release_dt_devices(struct domain *d)
>       if ( !is_iommu_enabled(d) )
>           return 0;
>   
> +    read_lock(&dt_host_lock);
> +
>       list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
>       {
>           rc = iommu_deassign_dt_device(d, dev);

So iommu_deassign_dt_device() is now called with the read lock. I am 
assuming the intention is all the caller will need to fist held the 
lock. If so, then I think this would require an ASSERT() in 
iommu_deassign_dt_device() and a comment on top of the function because 
it is exported.

I am guessing that iommu_assign_dt_device() is in the same situation.


> @@ -121,10 +123,14 @@ int iommu_release_dt_devices(struct domain *d)
>           {
>               dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
>                       dt_node_full_name(dev), d->domain_id);
> +
> +            read_unlock(&dt_host_lock);

Coding style: Usually we add the newline before the return. So I would 
switch around the two lines.

>               return rc;
>           }
>       }
>   
> +    read_unlock(&dt_host_lock);
> +
>       return 0;
>   }
>   
> @@ -251,6 +257,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>       int ret;
>       struct dt_device_node *dev;
>   
> +    read_lock(&dt_host_lock);
> +
>       switch ( domctl->cmd )
>       {
>       case XEN_DOMCTL_assign_device:
> @@ -304,7 +312,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>           spin_unlock(&dtdevs_lock);
>   
>           if ( d == dom_io )
> +        {
> +            read_unlock(&dt_host_lock);
>               return -EINVAL;

NIT: Rather than adding the unlock here, you could use:

rc = -EINVAL;
break;

> +        }
>   
>           ret = iommu_add_dt_device(dev);
>           if ( ret < 0 )
> @@ -342,7 +353,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>               break;
>   
>           if ( d == dom_io )
> +        {
> +            read_unlock(&dt_host_lock);
>               return -EINVAL;
> +        }

NIT: Same here.

>   
>           ret = iommu_deassign_dt_device(d, dev);
>   
> @@ -357,5 +371,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>           break;
>       }
>   
> +    read_unlock(&dt_host_lock);

Coding style: Please add a newline.

>       return ret;
>   }
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index e507658b23..8191f30197 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -18,6 +18,7 @@
>   #include <xen/string.h>
>   #include <xen/types.h>
>   #include <xen/list.h>
> +#include <xen/rwlock.h>
>   
>   #define DEVICE_TREE_MAX_DEPTH 16
>   
> @@ -216,6 +217,11 @@ extern struct dt_device_node *dt_host;
>    */
>   extern const struct dt_device_node *dt_interrupt_controller;
>   
> +/*
> + * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
> + */

The wording suggests that any update to any node would require to hold 
the write lock. However.. it looks like you are only holding the read 
when setting is_protected in the SMMU remove callback. Is this intended?

Or maybe you expect is_protected by to protected by dtdevs_lock? If so, 
then I think it would be good to spell it out. Possibly on top of 
is_protected.

Lastly, there are plenty of place in Xen where the lock is not taken. 
They mostly seem to be at boot, so I would mention that for boot only 
code, then lock may not be taken.

Lastly, this is a single line comment, so the coding style should be:

/* ... */

> +extern rwlock_t dt_host_lock;
> +
>   /**
>    * Find the interrupt controller
>    * For the moment we handle only one interrupt controller: the first

Cheers,

-- 
Julien Grall

