Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C204153D6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 01:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193163.344070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYg-0000Gs-KL; Wed, 22 Sep 2021 23:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193163.344070; Wed, 22 Sep 2021 23:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYg-0000EZ-G6; Wed, 22 Sep 2021 23:21:46 +0000
Received: by outflank-mailman (input) for mailman id 193163;
 Wed, 22 Sep 2021 23:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTBYe-000854-GD
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 23:21:44 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5839112-1bfb-11ec-b9f2-12813bfff9fa;
 Wed, 22 Sep 2021 23:21:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 3C58E21ECD;
 Wed, 22 Sep 2021 16:15:56 +0000 (UTC)
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
X-Inumbo-ID: d5839112-1bfb-11ec-b9f2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83vzCH47KASlUcuFQINQpuff64c+MWa6MS19Qg8Yxnk=;
	b=P7hcyu+pxVIWKnhY3fU1nC0/ApGUVDeZbSeiHxcpgkCZWg35zWms2xJ3anjKnSVUoSAD8c
	H+qh2umF75EUBiBBC7qMvIrQtuaCSddKC0OjRXsV4MQS+CTdyIeI2BmpDSKe3DXTKRIt0Q
	VCthFEhyqAq/QRJQzHUCvH2QWSOp70s=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org,
	mark.burton@greensocs.com,
	mirela.grujic@greensocs.com,
	edgari@xilinx.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 11/16] softmmu/memory: add memory_region_try_add_subregion function
Date: Wed, 22 Sep 2021 18:14:00 +0200
Message-Id: <20210922161405.140018-12-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

It allows to try to add a subregion to a memory region with error
handling. Like memory_region_add_subregion_overlap, it handles
priority as well.
Apart the error handling, the behavior is the same. It can be used
to do the simple memory_region_add_subregion() (with no overlap) by
setting the priority parameter to 0.

This commit is a preparation to further use this function in the
context of qmp command which needs error handling support.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Adding a new function is obviously not ideal. But there is ~900
occurrences of memory_region_add_subregion[_overlap] calls in the code
base. We do not really see an alternative here.
---
 include/exec/memory.h | 22 ++++++++++++++++++++++
 softmmu/memory.c      | 22 ++++++++++++++--------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..422e1eda67 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          MemoryRegion *subregion,
                                          int priority);
 
+/**
+ * memory_region_try_add_subregion: Add a subregion to a container
+ *                                  with error handling.
+ *
+ * Behaves like memory_region_add_subregion_overlap(), but errors are
+ * reported if the subregion cannot be added.
+ *
+ * @mr: the region to contain the new subregion; must be a container
+ *      initialized with memory_region_init().
+ * @offset: the offset relative to @mr where @subregion is added.
+ * @subregion: the subregion to be added.
+ * @priority: used for resolving overlaps; highest priority wins.
+ * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Returns: True in case of success, false otherwise.
+ */
+bool memory_region_try_add_subregion(MemoryRegion *mr,
+                                     hwaddr offset,
+                                     MemoryRegion *subregion,
+                                     int priority,
+                                     Error **errp);
+
 /**
  * memory_region_get_ram_addr: Get the ram address associated with a memory
  *                             region
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..eac61f8236 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2513,22 +2513,28 @@ done:
     memory_region_transaction_commit();
 }
 
-static void memory_region_add_subregion_common(MemoryRegion *mr,
-                                               hwaddr offset,
-                                               MemoryRegion *subregion)
+bool memory_region_try_add_subregion(MemoryRegion *mr,
+                                     hwaddr offset,
+                                     MemoryRegion *subregion,
+                                     int priority,
+                                     Error **errp)
 {
-    assert(!subregion->container);
+    if (subregion->container) {
+        error_setg(errp, "The memory region is already in another region");
+        return false;
+    }
+    subregion->priority = priority;
     subregion->container = mr;
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
+    return true;
 }
 
 void memory_region_add_subregion(MemoryRegion *mr,
                                  hwaddr offset,
                                  MemoryRegion *subregion)
 {
-    subregion->priority = 0;
-    memory_region_add_subregion_common(mr, offset, subregion);
+    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
 }
 
 void memory_region_add_subregion_overlap(MemoryRegion *mr,
@@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          MemoryRegion *subregion,
                                          int priority)
 {
-    subregion->priority = priority;
-    memory_region_add_subregion_common(mr, offset, subregion);
+    memory_region_try_add_subregion(mr, offset, subregion, priority,
+                                    &error_abort);
 }
 
 void memory_region_del_subregion(MemoryRegion *mr,
-- 
2.33.0


