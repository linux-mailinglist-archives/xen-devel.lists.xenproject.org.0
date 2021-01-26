Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7293303C46
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74916.134725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Mzl-000795-5c; Tue, 26 Jan 2021 11:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74916.134725; Tue, 26 Jan 2021 11:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Mzl-00078g-23; Tue, 26 Jan 2021 11:58:53 +0000
Received: by outflank-mailman (input) for mailman id 74916;
 Tue, 26 Jan 2021 11:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=enZd=G5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1l4Mzj-00078Y-FY
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:58:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a0ce53b5-f437-4b35-9c72-fd7dec791763;
 Tue, 26 Jan 2021 11:58:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-BVQC5xv5MCqMrpZFuyFWbQ-1; Tue, 26 Jan 2021 06:58:43 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB8E15725;
 Tue, 26 Jan 2021 11:58:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C093B5D9C2;
 Tue, 26 Jan 2021 11:58:30 +0000 (UTC)
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
X-Inumbo-ID: a0ce53b5-f437-4b35-9c72-fd7dec791763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611662327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CXtH9iqe5CxsuS1iT0M6Cxkc2fG+D5KUD5SMADHTIIk=;
	b=QK4is44ZFLje5JkiscK8OlL9VGr3IIAMWEE1XUMbBdv5SpfXugc6cRb2KBced9AwMNbDHX
	qk9raT/MZp1Y557ejm1givgMUYhqWehi/IssbzEuIhshBgJHOvSRme15kcafFYqOrhSEbQ
	f/M3xXz9GI7HbBW1yUCe6RdyB/oIexk=
X-MC-Unique: BVQC5xv5MCqMrpZFuyFWbQ-1
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
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
Subject: [PATCH v1] mm/memory_hotplug: MEMHP_MERGE_RESOURCE -> MHP_MERGE_RESOURCE
Date: Tue, 26 Jan 2021 12:58:29 +0100
Message-Id: <20210126115829.10909-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

Let's make "MEMHP_MERGE_RESOURCE" consistent with "MHP_NONE", "mhp_t" and
"mhp_flags". As discussed recently [1], "mhp" is our internal
acronym for memory hotplug now.

[1] https://lore.kernel.org/linux-mm/c37de2d0-28a1-4f7d-f944-cfd7d81c334d@redhat.com/

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: linux-hyperv@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: xen-devel@lists.xenproject.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/hv/hv_balloon.c        | 2 +-
 drivers/virtio/virtio_mem.c    | 2 +-
 drivers/xen/balloon.c          | 2 +-
 include/linux/memory_hotplug.h | 2 +-
 mm/memory_hotplug.c            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index 8c471823a5af..2f776d78e3c1 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
 
 		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
 		ret = add_memory(nid, PFN_PHYS((start_pfn)),
-				(HA_CHUNK << PAGE_SHIFT), MEMHP_MERGE_RESOURCE);
+				(HA_CHUNK << PAGE_SHIFT), MHP_MERGE_RESOURCE);
 
 		if (ret) {
 			pr_err("hot_add memory failed error is %d\n", ret);
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 85a272c9978e..148bea39b09a 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -623,7 +623,7 @@ static int virtio_mem_add_memory(struct virtio_mem *vm, uint64_t addr,
 	/* Memory might get onlined immediately. */
 	atomic64_add(size, &vm->offline_size);
 	rc = add_memory_driver_managed(vm->nid, addr, size, vm->resource_name,
-				       MEMHP_MERGE_RESOURCE);
+				       MHP_MERGE_RESOURCE);
 	if (rc) {
 		atomic64_sub(size, &vm->offline_size);
 		dev_warn(&vm->vdev->dev, "adding memory failed: %d\n", rc);
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index b57b2067ecbf..671c71245a7b 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -331,7 +331,7 @@ static enum bp_state reserve_additional_memory(void)
 	mutex_unlock(&balloon_mutex);
 	/* add_memory_resource() requires the device_hotplug lock */
 	lock_device_hotplug();
-	rc = add_memory_resource(nid, resource, MEMHP_MERGE_RESOURCE);
+	rc = add_memory_resource(nid, resource, MHP_MERGE_RESOURCE);
 	unlock_device_hotplug();
 	mutex_lock(&balloon_mutex);
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 3d99de0db2dd..4b834f5d032e 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -53,7 +53,7 @@ typedef int __bitwise mhp_t;
  * with this flag set, the resource pointer must no longer be used as it
  * might be stale, or the resource might have changed.
  */
-#define MEMHP_MERGE_RESOURCE	((__force mhp_t)BIT(0))
+#define MHP_MERGE_RESOURCE	((__force mhp_t)BIT(0))
 
 /*
  * Extended parameters for memory hotplug:
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 710e469fb3a1..ae497e3ff77c 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1153,7 +1153,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 * In case we're allowed to merge the resource, flag it and trigger
 	 * merging now that adding succeeded.
 	 */
-	if (mhp_flags & MEMHP_MERGE_RESOURCE)
+	if (mhp_flags & MHP_MERGE_RESOURCE)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-- 
2.29.2


