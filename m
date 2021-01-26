Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F391130409F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75140.135220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PWu-00013N-BT; Tue, 26 Jan 2021 14:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75140.135220; Tue, 26 Jan 2021 14:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PWu-00012y-8C; Tue, 26 Jan 2021 14:41:16 +0000
Received: by outflank-mailman (input) for mailman id 75140;
 Tue, 26 Jan 2021 14:41:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tF6T=G5=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1l4PWs-00012q-Uc
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:41:15 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 339bb14d-206a-42b7-970f-b971d027cb2f;
 Tue, 26 Jan 2021 14:41:13 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-zGEwA0dvNiqonZPBIA2LZQ-1; Tue, 26 Jan 2021 09:41:10 -0500
Received: by mail-wr1-f70.google.com with SMTP id x12so11292196wrw.21
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jan 2021 06:41:10 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id k15sm3578856wmj.6.2021.01.26.06.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:41:08 -0800 (PST)
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
X-Inumbo-ID: 339bb14d-206a-42b7-970f-b971d027cb2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611672073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lpQ5FIdDj86dAJrmmf5VYfY1DlwRO3+NvNwOL07qIDw=;
	b=HvCjADmLjlzT9GAtQ9f1AWu7sFg2qDHfdGulp0zJt1OT/6mJBdKBH5ebBR055d7qnt6NMK
	9DU1vpU6PbckpJX0rq1WmokUbRMFpHsV0EjlcvIId8G2NEynXTAiawVaM8vQyj+JqrnVq4
	x4+SvpKKKexq67k1BcCdSOmkZETGwsk=
X-MC-Unique: zGEwA0dvNiqonZPBIA2LZQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lpQ5FIdDj86dAJrmmf5VYfY1DlwRO3+NvNwOL07qIDw=;
        b=GI0Y+bGPfFwdb8BgAx2Zacf6jL9hc4Mb49OeCp1DeWLqAIVgHxrN/uQzlyE7+WOgLK
         DappzuiGU2dKiDEJrAfawvjfyFQIOMxyDQ9WkCrY35xuYqSrnvcdQ70ZxlZesgZRK6qX
         oCJ1pyhw/34w2C+hsudjSbE8ATE2Wv8DEd8duaKtGgOOc9vLbge4Wv3aFoVIwitQUit1
         w3+SvZgXSWlmdf2plRQVLznPCSTrfgnBjvz4VveFVUq1TsiTcr9Tka8+EQFiYAMkuPHh
         m46rSPOObSqaFP5Q5Hv/e0cKHq0zFc/uzPoxQ4xj5wB4M1C6d25FnCbYx+GUq+oTYWQz
         i7mw==
X-Gm-Message-State: AOAM531/u8nZ/MesoaD5mrNKBAxqY29og6PDfd9kziQM/i2YUVfDA+C6
	6Cb6BR1Z/RwE2YJ8SKiDOLWnkeztDLUkQZmEbLyMivKna4dpmxyJtNJQphdT228pMTMB7dt7R2R
	xcaINzcWoaum5nbo45HZ8J4dg1is=
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr6488590wrq.258.1611672069389;
        Tue, 26 Jan 2021 06:41:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz39NDd6BmGGfj8bbtVOHXLcl2Kc7EC7CxqUvm9YDLAkU4h3pGT+kzWVgom/wIh//yZaOjzQw==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr6488565wrq.258.1611672069262;
        Tue, 26 Jan 2021 06:41:09 -0800 (PST)
Date: Tue, 26 Jan 2021 09:41:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Jason Wang <jasowang@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] mm/memory_hotplug: MEMHP_MERGE_RESOURCE ->
 MHP_MERGE_RESOURCE
Message-ID: <20210126094058-mutt-send-email-mst@kernel.org>
References: <20210126115829.10909-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126115829.10909-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 26, 2021 at 12:58:29PM +0100, David Hildenbrand wrote:
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

Acked-by: Michael S. Tsirkin <mst@redhat.com>

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
>  		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
>  		ret = add_memory(nid, PFN_PHYS((start_pfn)),
> -				(HA_CHUNK << PAGE_SHIFT), MEMHP_MERGE_RESOURCE);
> +				(HA_CHUNK << PAGE_SHIFT), MHP_MERGE_RESOURCE);
>  
>  		if (ret) {
>  			pr_err("hot_add memory failed error is %d\n", ret);
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 85a272c9978e..148bea39b09a 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -623,7 +623,7 @@ static int virtio_mem_add_memory(struct virtio_mem *vm, uint64_t addr,
>  	/* Memory might get onlined immediately. */
>  	atomic64_add(size, &vm->offline_size);
>  	rc = add_memory_driver_managed(vm->nid, addr, size, vm->resource_name,
> -				       MEMHP_MERGE_RESOURCE);
> +				       MHP_MERGE_RESOURCE);
>  	if (rc) {
>  		atomic64_sub(size, &vm->offline_size);
>  		dev_warn(&vm->vdev->dev, "adding memory failed: %d\n", rc);
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index b57b2067ecbf..671c71245a7b 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -331,7 +331,7 @@ static enum bp_state reserve_additional_memory(void)
>  	mutex_unlock(&balloon_mutex);
>  	/* add_memory_resource() requires the device_hotplug lock */
>  	lock_device_hotplug();
> -	rc = add_memory_resource(nid, resource, MEMHP_MERGE_RESOURCE);
> +	rc = add_memory_resource(nid, resource, MHP_MERGE_RESOURCE);
>  	unlock_device_hotplug();
>  	mutex_lock(&balloon_mutex);
>  
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 3d99de0db2dd..4b834f5d032e 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -53,7 +53,7 @@ typedef int __bitwise mhp_t;
>   * with this flag set, the resource pointer must no longer be used as it
>   * might be stale, or the resource might have changed.
>   */
> -#define MEMHP_MERGE_RESOURCE	((__force mhp_t)BIT(0))
> +#define MHP_MERGE_RESOURCE	((__force mhp_t)BIT(0))
>  
>  /*
>   * Extended parameters for memory hotplug:
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 710e469fb3a1..ae497e3ff77c 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1153,7 +1153,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>  	 * In case we're allowed to merge the resource, flag it and trigger
>  	 * merging now that adding succeeded.
>  	 */
> -	if (mhp_flags & MEMHP_MERGE_RESOURCE)
> +	if (mhp_flags & MHP_MERGE_RESOURCE)
>  		merge_system_ram_resource(res);
>  
>  	/* online pages if requested */
> -- 
> 2.29.2


