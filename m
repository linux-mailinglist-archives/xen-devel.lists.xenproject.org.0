Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14926C2F6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWvD-0001lv-Jm; Wed, 16 Sep 2020 12:52:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vwKx=CZ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kIWvB-0001ld-Ke
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:52:25 +0000
X-Inumbo-ID: 17be3bfc-d31f-460d-ba1a-b7d1a052bd71
Received: from out30-57.freemail.mail.aliyun.com (unknown [115.124.30.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17be3bfc-d31f-460d-ba1a-b7d1a052bd71;
 Wed, 16 Sep 2020 12:52:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R931e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0U97x1KA_1600260734; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U97x1KA_1600260734) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Sep 2020 20:52:14 +0800
Date: Wed, 16 Sep 2020 20:52:14 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Michal Hocko <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v4 6/8] virtio-mem: try to merge system ram resources
Message-ID: <20200916125214.GB48039@L-31X9LVDL-1304.local>
References: <20200911103459.10306-1-david@redhat.com>
 <20200911103459.10306-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911103459.10306-7-david@redhat.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 11, 2020 at 12:34:57PM +0200, David Hildenbrand wrote:
>virtio-mem adds memory in memory block granularity, to be able to
>remove it in the same granularity again later, and to grow slowly on
>demand. This, however, results in quite a lot of resources when
>adding a lot of memory. Resources are effectively stored in a list-based
>tree. Having a lot of resources not only wastes memory, it also makes
>traversing that tree more expensive, and makes /proc/iomem explode in
>size (e.g., requiring kexec-tools to manually merge resources later
>when e.g., trying to create a kdump header).
>
>Before this patch, we get (/proc/iomem) when hotplugging 2G via virtio-mem
>on x86-64:
>        [...]
>        100000000-13fffffff : System RAM
>        140000000-33fffffff : virtio0
>          140000000-147ffffff : System RAM (virtio_mem)
>          148000000-14fffffff : System RAM (virtio_mem)
>          150000000-157ffffff : System RAM (virtio_mem)
>          158000000-15fffffff : System RAM (virtio_mem)
>          160000000-167ffffff : System RAM (virtio_mem)
>          168000000-16fffffff : System RAM (virtio_mem)
>          170000000-177ffffff : System RAM (virtio_mem)
>          178000000-17fffffff : System RAM (virtio_mem)
>          180000000-187ffffff : System RAM (virtio_mem)
>          188000000-18fffffff : System RAM (virtio_mem)
>          190000000-197ffffff : System RAM (virtio_mem)
>          198000000-19fffffff : System RAM (virtio_mem)
>          1a0000000-1a7ffffff : System RAM (virtio_mem)
>          1a8000000-1afffffff : System RAM (virtio_mem)
>          1b0000000-1b7ffffff : System RAM (virtio_mem)
>          1b8000000-1bfffffff : System RAM (virtio_mem)
>        3280000000-32ffffffff : PCI Bus 0000:00
>
>With this patch, we get (/proc/iomem):
>        [...]
>        fffc0000-ffffffff : Reserved
>        100000000-13fffffff : System RAM
>        140000000-33fffffff : virtio0
>          140000000-1bfffffff : System RAM (virtio_mem)
>        3280000000-32ffffffff : PCI Bus 0000:00
>
>Of course, with more hotplugged memory, it gets worse. When unplugging
>memory blocks again, try_remove_memory() (via
>offline_and_remove_memory()) will properly split the resource up again.
>
>Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Dan Williams <dan.j.williams@intel.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Cc: Jason Wang <jasowang@redhat.com>
>Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>Cc: Baoquan He <bhe@redhat.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

>---
> drivers/virtio/virtio_mem.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
>index ed99e43354010..ba4de598f6636 100644
>--- a/drivers/virtio/virtio_mem.c
>+++ b/drivers/virtio/virtio_mem.c
>@@ -424,7 +424,8 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
> 
> 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
> 	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
>-					 vm->resource_name, MHP_NONE);
>+					 vm->resource_name,
>+					 MEMHP_MERGE_RESOURCE);
> }
> 
> /*
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

