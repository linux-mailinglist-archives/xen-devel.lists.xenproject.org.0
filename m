Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BC303D09
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 13:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74943.134782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NVa-0002fd-3f; Tue, 26 Jan 2021 12:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74943.134782; Tue, 26 Jan 2021 12:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NVa-0002fE-0M; Tue, 26 Jan 2021 12:31:46 +0000
Received: by outflank-mailman (input) for mailman id 74943;
 Tue, 26 Jan 2021 12:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIjv=G5=huawei.com=linmiaohe@srs-us1.protection.inumbo.net>)
 id 1l4NRk-0001qy-9p
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:27:48 +0000
Received: from szxga04-in.huawei.com (unknown [45.249.212.190])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864f3703-621c-4299-88cd-d6f8dead558f;
 Tue, 26 Jan 2021 12:27:40 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DQ5Z86PRDz15yYC;
 Tue, 26 Jan 2021 20:26:24 +0800 (CST)
Received: from [10.174.179.117] (10.174.179.117) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 20:27:32 +0800
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
X-Inumbo-ID: 864f3703-621c-4299-88cd-d6f8dead558f
Subject: Re: [PATCH v1] mm/memory_hotplug: MEMHP_MERGE_RESOURCE ->
 MHP_MERGE_RESOURCE
To: David Hildenbrand <david@redhat.com>
CC: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Pankaj Gupta
	<pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@kernel.org>, "Oscar
 Salvador" <osalvador@suse.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>, <linux-hyperv@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>,
	<xen-devel@lists.xenproject.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <20210126115829.10909-1-david@redhat.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <9a7a0057-85ac-c7cf-1c2d-88671de4d947@huawei.com>
Date: Tue, 26 Jan 2021 20:27:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126115829.10909-1-david@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.117]
X-CFilter-Loop: Reflected

On 2021/1/26 19:58, David Hildenbrand wrote:
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
> Cc: xen-devel@lists.xenproject.org> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

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
> 


