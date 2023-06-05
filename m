Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D81723072
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543909.849281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6GFZ-0002h8-9c; Mon, 05 Jun 2023 19:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543909.849281; Mon, 05 Jun 2023 19:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6GFZ-0002ee-6G; Mon, 05 Jun 2023 19:52:21 +0000
Received: by outflank-mailman (input) for mailman id 543909;
 Mon, 05 Jun 2023 19:52:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6GFX-0002eX-C5
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:52:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6GFW-0004dC-UN; Mon, 05 Jun 2023 19:52:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6GFW-0002Bw-Oo; Mon, 05 Jun 2023 19:52:18 +0000
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
	bh=5jEO/jzw2x3Li/mUq3HBeT04s6Tk+lYxU779iVRi0Q0=; b=dpAsGGVtwBce7Ge39Y7IXpgU/b
	JFCiL5F2sCmF1+tlYp6EaRMZVKM+bggVdMoN8KIZM64Ws1QBblqqjD6LhPBX3FOk23cxKgDaz9LJG
	P5mFYyN51gdvuzOqhoekZNSnVwQpj4SoY4BBzDwl8tnLJESaj53gc1PKZewuSZZLQP0Y=;
Message-ID: <6e15489a-5213-3b8e-0b99-277c0ba989c3@xen.org>
Date: Mon, 5 Jun 2023 20:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-15-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
In-Reply-To: <20230602004824.20731-15-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
>   Dynamic programming ops will modify the dt_host and there might be other
>   function which are browsing the dt_host at the same time. To avoid the race
>   conditions, adding rwlock for browsing the dt_host during runtime.
Please explain that writer will be added in a follow-up patch.

> 
>   Reason behind adding rwlock instead of spinlock:
>      For now, dynamic programming is the sole modifier of dt_host in Xen during
>          run time. All other access functions like iommu_release_dt_device() are
>          just reading the dt_host during run-time. So, there is a need to protect
>          others from browsing the dt_host while dynamic programming is modifying
>          it. rwlock is better suitable for this task as spinlock won't be able to
>          differentiate between read and write access.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v6:
>      Remove redundant "read_unlock(&dt_host->lock);" in the following case:
>           XEN_DOMCTL_deassign_device
> ---
>   xen/common/device_tree.c              |  4 ++++
>   xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
>   xen/include/xen/device_tree.h         |  6 ++++++
>   3 files changed, 25 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index c5250a1644..c8fcdf8fa1 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2146,7 +2146,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>   
>       dt_dprintk(" <- unflatten_device_tree()\n");
>   
> +    /* Init r/w lock for host device tree. */
> +    rwlock_init(&dt_host->lock);
> +
>       return 0;
> +
>   }
>   
>   static void dt_alias_add(struct dt_alias_prop *ap,
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 301a5bcd97..f4d9deb624 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -112,6 +112,8 @@ int iommu_release_dt_devices(struct domain *d)
>       if ( !is_iommu_enabled(d) )
>           return 0;
>   
> +    read_lock(&dt_host->lock);
> +
>       list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
>       {
>           rc = iommu_deassign_dt_device(d, dev);
> @@ -119,10 +121,14 @@ int iommu_release_dt_devices(struct domain *d)
>           {
>               dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
>                       dt_node_full_name(dev), d->domain_id);
> +
> +            read_unlock(&dt_host->lock);
>               return rc;
>           }
>       }
>   
> +    read_unlock(&dt_host->lock);
> +
>       return 0;
>   }
>   
> @@ -246,6 +252,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>       int ret;
>       struct dt_device_node *dev;
>   
> +    read_lock(&dt_host->lock);
> +
>       switch ( domctl->cmd )
>       {
>       case XEN_DOMCTL_assign_device:
> @@ -295,7 +303,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>           spin_unlock(&dtdevs_lock);
>   
>           if ( d == dom_io )
> +        {
> +            read_unlock(&dt_host->lock);
>               return -EINVAL;
> +        }
>   
>           ret = iommu_add_dt_device(dev);
>           if ( ret < 0 )
> @@ -333,7 +344,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>               break;
>   
>           if ( d == dom_io )
> +        {
> +            read_unlock(&dt_host->lock);
>               return -EINVAL;
> +        }
>   
>           ret = iommu_deassign_dt_device(d, dev);
>   
> @@ -348,5 +362,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>           break;
>       }
>   
> +    read_unlock(&dt_host->lock);
>       return ret;
>   }
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index e239f7de26..dee40d2ea3 100644
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
> @@ -106,6 +107,11 @@ struct dt_device_node {
>       struct list_head domain_list;
>   
>       struct device dev;
> +
> +    /*
> +     * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
> +     */

 From the description, it sounds like the rwlock will only be used to 
protect the entire device-tree rather than a single node. So it doesn't 
seem to be sensible to increase each node structure (there are a lot) by 
12 bytes.

Can you outline your plan?

> +    rwlock_t lock;
>   };
>   
>   #define dt_to_dev(dt_node)  (&(dt_node)->dev)

Cheers,

-- 
Julien Grall

