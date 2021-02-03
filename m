Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350C30D31A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 06:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80809.148013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Aqa-0007J3-J8; Wed, 03 Feb 2021 05:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80809.148013; Wed, 03 Feb 2021 05:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Aqa-0007Ie-FI; Wed, 03 Feb 2021 05:37:00 +0000
Received: by outflank-mailman (input) for mailman id 80809;
 Wed, 03 Feb 2021 05:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uxJz=HF=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1l7AqZ-0007IZ-C6
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 05:36:59 +0000
Received: from mail-io1-xd2c.google.com (unknown [2607:f8b0:4864:20::d2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a000cab-8888-4dde-8355-6bf540b869ad;
 Wed, 03 Feb 2021 05:36:58 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id u17so24021949iow.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 21:36:57 -0800 (PST)
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
X-Inumbo-ID: 4a000cab-8888-4dde-8355-6bf540b869ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOAFG5e83xgmf8k0DWJGMDL7RfKZ3CHVYa0GrtuyQBw=;
        b=WZXVoX6SBgnC737ppEU8/8migVv7IeXjPzQUQq2rQmRHGbhY89dPWxCwx+Wmj9UwGC
         lc/ACKgBxCQOBOR8RUH5eS+ZPszj1UvGL6thVaamq885PN7G9pFlhBvZt/UjpdnwUrZg
         FDRP03+Qs+KKS0ZCfxVEv4+Z4/KVByyF72r3O200gqOcdZmCVoRhsevpy2Kep1gmtYrX
         Q+vutsQ/UKBFRtLGqSfujBUn6z8YXtBb9x+4Re1py20oDhkh+JYoKAnMoNlcqsZD6Vhz
         bSwoRNFfqOu/YSNSWO+PLMoufPlB/CQGXyPhvVpQUklr9CoM4qVkcvUe703e7h5kz2Ur
         uszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOAFG5e83xgmf8k0DWJGMDL7RfKZ3CHVYa0GrtuyQBw=;
        b=BcIgkP6sNxKDY6mLd4hlqMoMFFsMDvxdtjxiwZMCm9IqJPjCjei2KNr4sEOqZZTCYC
         mqXu2y0aHIpMRtGyclUMo6zvpCsrh/glHB+MSGT3qNQ0WbCVldGfKxDr/JTVSeYtmmF6
         k8jMkBDmrTHf+D5Nqd5pyR1TQ0ecJFWziY4iLgiGDAPcH3YLKLHBRGXeQiH2WuK5pWQ9
         UTQucq5HBp1S9CPNOCxNMNNLXZBeLCLSVkRwm8Pj6NcYGFjrRT74SQAyprKYiISl7bdE
         QSO0KnVxU81LlvjT+mgiLdCuKyrCIO+R1u7SF3/o/Rf7A0k7J5YlfGQTAdO2p+5rHcwd
         CBXQ==
X-Gm-Message-State: AOAM5316cVmpzhJViHgeU/Pu/aTAAG9OZo0FsyLoSDgc6nHPaAmvlX0T
	32LaFoM3rgXA/Ku1gOMV7II6ZzzLPQBVNM7fPdw=
X-Google-Smtp-Source: ABdhPJzDAiiFwtpxbYTCU0PBMsJeg/lZf0roQ6HxhxuikJq6gsCG0p+pEyAta6N+UlSj2M5K1LhBFUYNd+rK32Rpbt8=
X-Received: by 2002:a05:6638:33aa:: with SMTP id h42mr1547914jav.124.1612330617400;
 Tue, 02 Feb 2021 21:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126115829.10909-1-david@redhat.com>
In-Reply-To: <20210126115829.10909-1-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 3 Feb 2021 06:36:45 +0100
Message-ID: <CAM9Jb+hQMqBmHOQoME+ro4K82v6bVe9Fhcjmkp4bxFtighVo8w@mail.gmail.com>
Subject: Re: [PATCH v1] mm/memory_hotplug: MEMHP_MERGE_RESOURCE -> MHP_MERGE_RESOURCE
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Wei Yang <richard.weiyang@linux.alibaba.com>, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> Let's make "MEMHP_MERGE_RESOURCE" consistent with "MHP_NONE", "mhp_t" and
> "mhp_flags". As discussed recently [1], "mhp" is our internal
> acronym for memory hotplug now.
>
> [1] https://lore.kernel.org/linux-mm/c37de2d0-28a1-4f7d-f944-cfd7d81c334d@redhat.com/
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: linux-hyperv@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/hv/hv_balloon.c        | 2 +-
>  drivers/virtio/virtio_mem.c    | 2 +-
>  drivers/xen/balloon.c          | 2 +-
>  include/linux/memory_hotplug.h | 2 +-
>  mm/memory_hotplug.c            | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
> index 8c471823a5af..2f776d78e3c1 100644
> --- a/drivers/hv/hv_balloon.c
> +++ b/drivers/hv/hv_balloon.c
> @@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
>
>                 nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
>                 ret = add_memory(nid, PFN_PHYS((start_pfn)),
> -                               (HA_CHUNK << PAGE_SHIFT), MEMHP_MERGE_RESOURCE);
> +                               (HA_CHUNK << PAGE_SHIFT), MHP_MERGE_RESOURCE);
>
>                 if (ret) {
>                         pr_err("hot_add memory failed error is %d\n", ret);
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 85a272c9978e..148bea39b09a 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -623,7 +623,7 @@ static int virtio_mem_add_memory(struct virtio_mem *vm, uint64_t addr,
>         /* Memory might get onlined immediately. */
>         atomic64_add(size, &vm->offline_size);
>         rc = add_memory_driver_managed(vm->nid, addr, size, vm->resource_name,
> -                                      MEMHP_MERGE_RESOURCE);
> +                                      MHP_MERGE_RESOURCE);
>         if (rc) {
>                 atomic64_sub(size, &vm->offline_size);
>                 dev_warn(&vm->vdev->dev, "adding memory failed: %d\n", rc);
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index b57b2067ecbf..671c71245a7b 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -331,7 +331,7 @@ static enum bp_state reserve_additional_memory(void)
>         mutex_unlock(&balloon_mutex);
>         /* add_memory_resource() requires the device_hotplug lock */
>         lock_device_hotplug();
> -       rc = add_memory_resource(nid, resource, MEMHP_MERGE_RESOURCE);
> +       rc = add_memory_resource(nid, resource, MHP_MERGE_RESOURCE);
>         unlock_device_hotplug();
>         mutex_lock(&balloon_mutex);
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 3d99de0db2dd..4b834f5d032e 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -53,7 +53,7 @@ typedef int __bitwise mhp_t;
>   * with this flag set, the resource pointer must no longer be used as it
>   * might be stale, or the resource might have changed.
>   */
> -#define MEMHP_MERGE_RESOURCE   ((__force mhp_t)BIT(0))
> +#define MHP_MERGE_RESOURCE     ((__force mhp_t)BIT(0))
>
>  /*
>   * Extended parameters for memory hotplug:
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 710e469fb3a1..ae497e3ff77c 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1153,7 +1153,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>          * In case we're allowed to merge the resource, flag it and trigger
>          * merging now that adding succeeded.
>          */
> -       if (mhp_flags & MEMHP_MERGE_RESOURCE)
> +       if (mhp_flags & MHP_MERGE_RESOURCE)
>                 merge_system_ram_resource(res);
>
>         /* online pages if requested */

 Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

