Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099A36E98D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 13:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119887.226668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4pm-00073M-LX; Thu, 29 Apr 2021 11:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119887.226668; Thu, 29 Apr 2021 11:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4pm-00072x-Hn; Thu, 29 Apr 2021 11:27:54 +0000
Received: by outflank-mailman (input) for mailman id 119887;
 Thu, 29 Apr 2021 11:27:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rkAN=J2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1lc4pl-00072n-RD
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:27:53 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cbbfa78a-5ce5-47ee-9caa-5fa2bdec6dff;
 Thu, 29 Apr 2021 11:27:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-5Pvl26hHO4OBYFbRkMiEmQ-1; Thu, 29 Apr 2021 07:27:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DF1A8042A6;
 Thu, 29 Apr 2021 11:27:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C705F67CC4;
 Thu, 29 Apr 2021 11:27:30 +0000 (UTC)
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
X-Inumbo-ID: cbbfa78a-5ce5-47ee-9caa-5fa2bdec6dff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619695672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNce5xZGYwSY6mhN845V4iwjhXo75SIJ2plRmjN8C/4=;
	b=Bz4fI4OIZeB35QXYouiHWX0Ha/gcpjWhn8KOejU4ODk3AWYXiybUdWHM5QkEqy3LXHJIiV
	LKPwD9lw4NK4JBNnwQ5xAfHPA7BXxGxxKFJgLWkGkHiqBGX5NuPy3JHU1UBBhEHMiprRrw
	wFqzk7zEhztABPZ5siNmFmJO4YycitU=
X-MC-Unique: 5Pvl26hHO4OBYFbRkMiEmQ-1
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	haxm-team@intel.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v5 02/10] numa: Teach ram block notifiers about resizeable ram blocks
Date: Thu, 29 Apr 2021 13:27:00 +0200
Message-Id: <20210429112708.12291-3-david@redhat.com>
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Ram block notifiers are currently not aware of resizes. To properly
handle resizes during migration, we want to teach ram block notifiers about
resizeable ram.

Introduce the basic infrastructure but keep using max_size in the
existing notifiers. Supply the max_size when adding and removing ram
blocks. Also, notify on resizes.

Acked-by: Paul Durrant <paul@xen.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: xen-devel@lists.xenproject.org
Cc: haxm-team@intel.com
Cc: Paul Durrant <paul@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Wenchao Wang <wenchao.wang@intel.com>
Cc: Colin Xu <colin.xu@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/numa.c             | 22 +++++++++++++++++-----
 hw/i386/xen/xen-mapcache.c |  7 ++++---
 include/exec/ramlist.h     | 13 +++++++++----
 softmmu/physmem.c          | 12 ++++++++++--
 target/i386/hax/hax-mem.c  |  5 +++--
 target/i386/sev.c          | 18 ++++++++++--------
 util/vfio-helpers.c        | 16 ++++++++--------
 7 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 7f08c27a6d..921bf86ab4 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -806,11 +806,12 @@ void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms)
 static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
 {
     const ram_addr_t max_size = qemu_ram_get_max_length(rb);
+    const ram_addr_t size = qemu_ram_get_used_length(rb);
     void *host = qemu_ram_get_host_addr(rb);
     RAMBlockNotifier *notifier = opaque;
 
     if (host) {
-        notifier->ram_block_added(notifier, host, max_size);
+        notifier->ram_block_added(notifier, host, size, max_size);
     }
     return 0;
 }
@@ -827,20 +828,31 @@ void ram_block_notifier_remove(RAMBlockNotifier *n)
     QLIST_REMOVE(n, next);
 }
 
-void ram_block_notify_add(void *host, size_t size)
+void ram_block_notify_add(void *host, size_t size, size_t max_size)
 {
     RAMBlockNotifier *notifier;
 
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_added(notifier, host, size);
+        notifier->ram_block_added(notifier, host, size, max_size);
     }
 }
 
-void ram_block_notify_remove(void *host, size_t size)
+void ram_block_notify_remove(void *host, size_t size, size_t max_size)
 {
     RAMBlockNotifier *notifier;
 
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_removed(notifier, host, size);
+        notifier->ram_block_removed(notifier, host, size, max_size);
+    }
+}
+
+void ram_block_notify_resize(void *host, size_t old_size, size_t new_size)
+{
+    RAMBlockNotifier *notifier;
+
+    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
+        if (notifier->ram_block_resized) {
+            notifier->ram_block_resized(notifier, host, old_size, new_size);
+        }
     }
 }
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 5b120ed44b..d6dcea65d1 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -169,7 +169,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
 
     if (entry->vaddr_base != NULL) {
         if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
-            ram_block_notify_remove(entry->vaddr_base, entry->size);
+            ram_block_notify_remove(entry->vaddr_base, entry->size,
+                                    entry->size);
         }
         if (munmap(entry->vaddr_base, entry->size) != 0) {
             perror("unmap fails");
@@ -211,7 +212,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
     }
 
     if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
-        ram_block_notify_add(vaddr_base, size);
+        ram_block_notify_add(vaddr_base, size, size);
     }
 
     entry->vaddr_base = vaddr_base;
@@ -452,7 +453,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     }
 
     pentry->next = entry->next;
-    ram_block_notify_remove(entry->vaddr_base, entry->size);
+    ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
     if (munmap(entry->vaddr_base, entry->size) != 0) {
         perror("unmap fails");
         exit(-1);
diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
index 26704aa3b0..ece6497ee2 100644
--- a/include/exec/ramlist.h
+++ b/include/exec/ramlist.h
@@ -65,15 +65,20 @@ void qemu_mutex_lock_ramlist(void);
 void qemu_mutex_unlock_ramlist(void);
 
 struct RAMBlockNotifier {
-    void (*ram_block_added)(RAMBlockNotifier *n, void *host, size_t size);
-    void (*ram_block_removed)(RAMBlockNotifier *n, void *host, size_t size);
+    void (*ram_block_added)(RAMBlockNotifier *n, void *host, size_t size,
+                            size_t max_size);
+    void (*ram_block_removed)(RAMBlockNotifier *n, void *host, size_t size,
+                              size_t max_size);
+    void (*ram_block_resized)(RAMBlockNotifier *n, void *host, size_t old_size,
+                              size_t new_size);
     QLIST_ENTRY(RAMBlockNotifier) next;
 };
 
 void ram_block_notifier_add(RAMBlockNotifier *n);
 void ram_block_notifier_remove(RAMBlockNotifier *n);
-void ram_block_notify_add(void *host, size_t size);
-void ram_block_notify_remove(void *host, size_t size);
+void ram_block_notify_add(void *host, size_t size, size_t max_size);
+void ram_block_notify_remove(void *host, size_t size, size_t max_size);
+void ram_block_notify_resize(void *host, size_t old_size, size_t new_size);
 
 void ram_block_dump(Monitor *mon);
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index bd2c0dc4ec..d6463f203d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1810,6 +1810,7 @@ static int memory_try_enable_merging(void *addr, size_t len)
  */
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
 {
+    const ram_addr_t oldsize = block->used_length;
     const ram_addr_t unaligned_size = newsize;
 
     assert(block);
@@ -1846,6 +1847,11 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
         return -EINVAL;
     }
 
+    /* Notify before modifying the ram block and touching the bitmaps. */
+    if (block->host) {
+        ram_block_notify_resize(block->host, oldsize, newsize);
+    }
+
     cpu_physical_memory_clear_dirty_range(block->offset, block->used_length);
     block->used_length = newsize;
     cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
@@ -2013,7 +2019,8 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
             qemu_madvise(new_block->host, new_block->max_length,
                          QEMU_MADV_DONTFORK);
         }
-        ram_block_notify_add(new_block->host, new_block->max_length);
+        ram_block_notify_add(new_block->host, new_block->used_length,
+                             new_block->max_length);
     }
 }
 
@@ -2192,7 +2199,8 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     if (block->host) {
-        ram_block_notify_remove(block->host, block->max_length);
+        ram_block_notify_remove(block->host, block->used_length,
+                                block->max_length);
     }
 
     qemu_mutex_lock_ramlist();
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
index 35495f5e82..8d44edbffd 100644
--- a/target/i386/hax/hax-mem.c
+++ b/target/i386/hax/hax-mem.c
@@ -293,7 +293,8 @@ static MemoryListener hax_memory_listener = {
     .priority = 10,
 };
 
-static void hax_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
+static void hax_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                                size_t max_size)
 {
     /*
      * We must register each RAM block with the HAXM kernel module, or
@@ -304,7 +305,7 @@ static void hax_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
      * host physical pages for the RAM block as part of this registration
      * process, hence the name hax_populate_ram().
      */
-    if (hax_populate_ram((uint64_t)(uintptr_t)host, size) < 0) {
+    if (hax_populate_ram((uint64_t)(uintptr_t)host, max_size) < 0) {
         fprintf(stderr, "HAX failed to populate RAM\n");
         abort();
     }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 72b9e2ab40..9cfe5afe31 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -181,7 +181,8 @@ sev_set_guest_state(SevGuestState *sev, SevState new_state)
 }
 
 static void
-sev_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
+sev_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                    size_t max_size)
 {
     int r;
     struct kvm_enc_region range;
@@ -198,19 +199,20 @@ sev_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
     }
 
     range.addr = (__u64)(unsigned long)host;
-    range.size = size;
+    range.size = max_size;
 
-    trace_kvm_memcrypt_register_region(host, size);
+    trace_kvm_memcrypt_register_region(host, max_size);
     r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_REG_REGION, &range);
     if (r) {
         error_report("%s: failed to register region (%p+%#zx) error '%s'",
-                     __func__, host, size, strerror(errno));
+                     __func__, host, max_size, strerror(errno));
         exit(1);
     }
 }
 
 static void
-sev_ram_block_removed(RAMBlockNotifier *n, void *host, size_t size)
+sev_ram_block_removed(RAMBlockNotifier *n, void *host, size_t size,
+                      size_t max_size)
 {
     int r;
     struct kvm_enc_region range;
@@ -227,13 +229,13 @@ sev_ram_block_removed(RAMBlockNotifier *n, void *host, size_t size)
     }
 
     range.addr = (__u64)(unsigned long)host;
-    range.size = size;
+    range.size = max_size;
 
-    trace_kvm_memcrypt_unregister_region(host, size);
+    trace_kvm_memcrypt_unregister_region(host, max_size);
     r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_UNREG_REGION, &range);
     if (r) {
         error_report("%s: failed to unregister region (%p+%#zx)",
-                     __func__, host, size);
+                     __func__, host, max_size);
     }
 }
 
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 92b9565797..911115b86e 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -459,26 +459,26 @@ fail_container:
     return ret;
 }
 
-static void qemu_vfio_ram_block_added(RAMBlockNotifier *n,
-                                      void *host, size_t size)
+static void qemu_vfio_ram_block_added(RAMBlockNotifier *n, void *host,
+                                      size_t size, size_t max_size)
 {
     QEMUVFIOState *s = container_of(n, QEMUVFIOState, ram_notifier);
     int ret;
 
-    trace_qemu_vfio_ram_block_added(s, host, size);
-    ret = qemu_vfio_dma_map(s, host, size, false, NULL);
+    trace_qemu_vfio_ram_block_added(s, host, max_size);
+    ret = qemu_vfio_dma_map(s, host, max_size, false, NULL);
     if (ret) {
-        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, size,
+        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, max_size,
                      strerror(-ret));
     }
 }
 
-static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n,
-                                        void *host, size_t size)
+static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n, void *host,
+                                        size_t size, size_t max_size)
 {
     QEMUVFIOState *s = container_of(n, QEMUVFIOState, ram_notifier);
     if (host) {
-        trace_qemu_vfio_ram_block_removed(s, host, size);
+        trace_qemu_vfio_ram_block_removed(s, host, max_size);
         qemu_vfio_dma_unmap(s, host);
     }
 }
-- 
2.30.2


