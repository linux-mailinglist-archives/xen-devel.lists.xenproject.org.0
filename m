Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C444A793362
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596116.929893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhLx-00042z-6X; Wed, 06 Sep 2023 01:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596116.929893; Wed, 06 Sep 2023 01:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhLx-0003zi-31; Wed, 06 Sep 2023 01:29:09 +0000
Received: by outflank-mailman (input) for mailman id 596116;
 Wed, 06 Sep 2023 01:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdhLv-0003yE-6Q
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:29:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ada569-4c54-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:29:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 208D5CE1384;
 Wed,  6 Sep 2023 01:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCF9C433C8;
 Wed,  6 Sep 2023 01:28:58 +0000 (UTC)
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
X-Inumbo-ID: c2ada569-4c54-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693963739;
	bh=WVL8TP3p8QGPqOGLpiYPw7wVXbzx66zsmtImYlGPhIc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JXVsnG201xFrEGrNq8QcSk2p/eXN7ZOKRxQEZ3pgORSZk9ElWmnFSHDQuzD2a1lvT
	 wz/YEim9GJ+VdGccIKP3Lg+cPI7uxC8VVDcxg7HXkkHojTM7GfT+2LYyRWWLVFIuQF
	 mhtTB7pddg9BXJv+EX6a+0B9PLQwkmRdIHCE197TOBGhBBUy2P6fcDcreQYvTO8Jgr
	 wyxAeOG/xOUUOKWT8foGnEKZO6YAvbOw5iRdsEhT0AfOnjPj9KEOSi0dCDYvyyOx3W
	 dJntuL1Th31yHApoEoh10HrQdjLWOzZWikjkxPLKcIMInv5Efl/9VPqQmS1VLe8iKf
	 tbSiqSxLQehnA==
Date: Tue, 5 Sep 2023 18:28:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, michal.orzel@amd.com, 
    sstabellini@kernel.org
Subject: Re: [XEN][PATCH v12 14/20] common/device_tree: Add rwlock for
 dt_host
In-Reply-To: <20230906011631.30310-15-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051828442.6458@ubuntu-linux-20-04-desktop>
References: <20230906011631.30310-1-vikram.garhwal@amd.com> <20230906011631.30310-15-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Sep 2023, Vikram Garhwal wrote:
> Dynamic programming ops will modify the dt_host and there might be other
> functions which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> writer will be added in the follow-up patch for device tree overlay
> functionalities.
> 
> Reason behind adding rwlock instead of spinlock:
>     For now, dynamic programming is the sole modifier of dt_host in Xen during
>     run time. All other access functions like iommu_release_dt_device() are
>     just reading the dt_host during run-time. So, there is a need to protect
>     others from browsing the dt_host while dynamic programming is modifying
>     it. rwlock is better suitable for this task as spinlock won't be able to
>     differentiate between read and write access.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes from v11:
>     Update check state >= active for checking dt_host_lock to be locked
> Changes from v10:
>     Add ASSERT for iommu_assign_dt_device() and iommu_add_dt_device().
> Changes from v9:
>     Update commit message and fix indentation.
>     Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().
>     Fix code styles.
>     Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
>         device-tree.c
> Changes from v7:
>     Keep one lock for dt_host instead of lock for each node under dt_host.
> ---
> ---
>  xen/common/device_tree.c              |  1 +
>  xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++--
>  xen/include/xen/device_tree.h         |  7 +++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index f38f51ec0b..b1c2952951 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
>  struct dt_device_node *dt_host;
>  /* Interrupt controller node*/
>  const struct dt_device_node *dt_interrupt_controller;
> +DEFINE_RWLOCK(dt_host_lock);
>  
>  /**
>   * struct dt_alias_prop - Alias property in 'aliases' node
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 80f6efc606..075fb25a37 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -31,6 +31,8 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      int rc = -EBUSY;
>      struct domain_iommu *hd = dom_iommu(d);
>  
> +    ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
> +
>      if ( !is_iommu_enabled(d) )
>          return -EINVAL;
>  
> @@ -62,6 +64,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
>      const struct domain_iommu *hd = dom_iommu(d);
>      int rc;
>  
> +    ASSERT(rw_is_locked(&dt_host_lock));
> +
>      if ( !is_iommu_enabled(d) )
>          return -EINVAL;
>  
> @@ -113,6 +117,8 @@ int iommu_release_dt_devices(struct domain *d)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>  
> +    read_lock(&dt_host_lock);
> +
>      list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
>      {
>          rc = iommu_deassign_dt_device(d, dev);
> @@ -120,10 +126,14 @@ int iommu_release_dt_devices(struct domain *d)
>          {
>              dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
>                      dt_node_full_name(dev), d->domain_id);
> +            read_unlock(&dt_host_lock);
> +
>              return rc;
>          }
>      }
>  
> +    read_unlock(&dt_host_lock);
> +
>      return 0;
>  }
>  
> @@ -133,6 +143,8 @@ int iommu_remove_dt_device(struct dt_device_node *np)
>      struct device *dev = dt_to_dev(np);
>      int rc;
>  
> +    ASSERT(rw_is_locked(&dt_host_lock));
> +
>      if ( !iommu_enabled )
>          return 1;
>  
> @@ -177,6 +189,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      struct device *dev = dt_to_dev(np);
>      int rc = 1, index = 0;
>  
> +    ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
> +
>      if ( !iommu_enabled )
>          return 1;
>  
> @@ -249,6 +263,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>      int ret;
>      struct dt_device_node *dev;
>  
> +    read_lock(&dt_host_lock);
> +
>      switch ( domctl->cmd )
>      {
>      case XEN_DOMCTL_assign_device:
> @@ -289,7 +305,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          }
>  
>          if ( d == dom_io )
> -            return -EINVAL;
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
>  
>          ret = iommu_add_dt_device(dev);
>          if ( ret < 0 )
> @@ -327,7 +346,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>              break;
>  
>          if ( d == dom_io )
> -            return -EINVAL;
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
>  
>          ret = iommu_deassign_dt_device(d, dev);
>  
> @@ -342,5 +364,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          break;
>      }
>  
> +    read_unlock(&dt_host_lock);
> +
>      return ret;
>  }
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 44d315c8ba..a262bba2ed 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -18,6 +18,7 @@
>  #include <xen/string.h>
>  #include <xen/types.h>
>  #include <xen/list.h>
> +#include <xen/rwlock.h>
>  
>  #define DEVICE_TREE_MAX_DEPTH 16
>  
> @@ -218,6 +219,12 @@ extern struct dt_device_node *dt_host;
>   */
>  extern const struct dt_device_node *dt_interrupt_controller;
>  
> +/*
> + * Lock that protects r/w updates to unflattened device tree i.e. dt_host during
> + * runtime. Lock may not be taken for boot only code.
> + */
> +extern rwlock_t dt_host_lock;
> +
>  /**
>   * Find the interrupt controller
>   * For the moment we handle only one interrupt controller: the first
> -- 
> 2.17.1
> 

