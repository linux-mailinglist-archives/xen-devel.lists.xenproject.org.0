Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C6265E1E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:36:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgPV-0002RL-Fh; Fri, 11 Sep 2020 10:36:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mhfz=CU=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kGgPT-0002QH-UF
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:36:03 +0000
X-Inumbo-ID: 8040dd64-da73-4e27-8899-feb6227a2b63
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8040dd64-da73-4e27-8899-feb6227a2b63;
 Fri, 11 Sep 2020 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599820563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ilu5qA/4MOIRMjHNcFmuyfPNfVkDyJXmY7w9sBJwUqM=;
 b=D2BW2evt5fiDxV+jvaH2Ji9wgP6NH0Xj/zJ+htnGEsn7E3sxYsHZHwimuHe5nvzW4ZsS0u
 OI7oBFoBqVGa5IDEnqsJ0UrMP9YCTfNpSHq+7H6MlOjj4x1+FdMVqYthxlNQBlpmnPk/l9
 NSJg3h0HuXWx9SYbgNeuWU/IzKC6Blc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-i_fYLb3wO1GbagxD_riIhw-1; Fri, 11 Sep 2020 06:35:59 -0400
X-MC-Unique: i_fYLb3wO1GbagxD_riIhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1481873084;
 Fri, 11 Sep 2020 10:35:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-186.ams2.redhat.com [10.36.113.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D526C81C44;
 Fri, 11 Sep 2020 10:35:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Michal Hocko <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v4 6/8] virtio-mem: try to merge system ram resources
Date: Fri, 11 Sep 2020 12:34:57 +0200
Message-Id: <20200911103459.10306-7-david@redhat.com>
In-Reply-To: <20200911103459.10306-1-david@redhat.com>
References: <20200911103459.10306-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

virtio-mem adds memory in memory block granularity, to be able to
remove it in the same granularity again later, and to grow slowly on
demand. This, however, results in quite a lot of resources when
adding a lot of memory. Resources are effectively stored in a list-based
tree. Having a lot of resources not only wastes memory, it also makes
traversing that tree more expensive, and makes /proc/iomem explode in
size (e.g., requiring kexec-tools to manually merge resources later
when e.g., trying to create a kdump header).

Before this patch, we get (/proc/iomem) when hotplugging 2G via virtio-mem
on x86-64:
        [...]
        100000000-13fffffff : System RAM
        140000000-33fffffff : virtio0
          140000000-147ffffff : System RAM (virtio_mem)
          148000000-14fffffff : System RAM (virtio_mem)
          150000000-157ffffff : System RAM (virtio_mem)
          158000000-15fffffff : System RAM (virtio_mem)
          160000000-167ffffff : System RAM (virtio_mem)
          168000000-16fffffff : System RAM (virtio_mem)
          170000000-177ffffff : System RAM (virtio_mem)
          178000000-17fffffff : System RAM (virtio_mem)
          180000000-187ffffff : System RAM (virtio_mem)
          188000000-18fffffff : System RAM (virtio_mem)
          190000000-197ffffff : System RAM (virtio_mem)
          198000000-19fffffff : System RAM (virtio_mem)
          1a0000000-1a7ffffff : System RAM (virtio_mem)
          1a8000000-1afffffff : System RAM (virtio_mem)
          1b0000000-1b7ffffff : System RAM (virtio_mem)
          1b8000000-1bfffffff : System RAM (virtio_mem)
        3280000000-32ffffffff : PCI Bus 0000:00

With this patch, we get (/proc/iomem):
        [...]
        fffc0000-ffffffff : Reserved
        100000000-13fffffff : System RAM
        140000000-33fffffff : virtio0
          140000000-1bfffffff : System RAM (virtio_mem)
        3280000000-32ffffffff : PCI Bus 0000:00

Of course, with more hotplugged memory, it gets worse. When unplugging
memory blocks again, try_remove_memory() (via
offline_and_remove_memory()) will properly split the resource up again.

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index ed99e43354010..ba4de598f6636 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -424,7 +424,8 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 
 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
 	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
-					 vm->resource_name, MHP_NONE);
+					 vm->resource_name,
+					 MEMHP_MERGE_RESOURCE);
 }
 
 /*
-- 
2.26.2


