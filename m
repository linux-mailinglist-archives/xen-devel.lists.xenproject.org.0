Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9844231E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219429.380264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUi-0000dq-2n; Mon, 01 Nov 2021 22:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219429.380264; Mon, 01 Nov 2021 22:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUh-0000aD-UQ; Mon, 01 Nov 2021 22:09:31 +0000
Received: by outflank-mailman (input) for mailman id 219429;
 Mon, 01 Nov 2021 22:09:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUg-0007pr-NF
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:30 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5d89a486-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:21 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-aGyjZVJKN8-a3rPFwGMeiQ-1; Mon, 01 Nov 2021 18:09:20 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so4821858wrw.9
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:19 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id c79sm643941wme.43.2021.11.01.15.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:18 -0700 (PDT)
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
X-Inumbo-ID: 5d89a486-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mNV0USCJ0bTE7YbxR+SPvyYXWmDPBQ41R9sCmOpsXYk=;
	b=YP1w/pD0tmnXzYUmwg1kAxzgEk6iHvlWdcX0cBVPuVxq4oK93ZGZ8JDjzH8VuSf4QwZfaq
	Fvpxnyj8mA0vsAHUrTJTIZ1moclt8Xa2wbLcnwxE7hIEoIJX7eVxxMWT8WgSGisVGRLJc1
	+9RCYzgK4QpBvTV5u34epnPPaJPL4w0=
X-MC-Unique: aGyjZVJKN8-a3rPFwGMeiQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mNV0USCJ0bTE7YbxR+SPvyYXWmDPBQ41R9sCmOpsXYk=;
        b=neEIC2LCAPWIwaDOasqvenWeGyzBKw9VeSyyLBj80t4zWFImAbLYKLeaTr+Ct4Z3dc
         1ZL7rpm+RBzxEnYW7djjYfOldmSlqUAFzk3ng+gc8I1lxC5BF0XSOvrLOYmytDeiNdLc
         rDZ6YXAf0vi9e+Vpn+dHUWfcrNcT7w2S2TlZJrCqkywif1Tv9tYogwE73QM9siQMSR60
         PzlL3RFE0+csBqMoGRhTy/SGStiAU4fEyZaRtKzAJYzPY52qksTbbnVlpmLingjUOBVL
         5+ydFAXLwXdcOm3vaotXnhPlUoiKfbSncjAoIo5olEVP59ma+W/U2tJfKglP+cvX8EOX
         4j8g==
X-Gm-Message-State: AOAM531I+3EjEOOpmE2V0MCA6dvA7CxtGhM5dJPMcKYa6HFJdPl3e94e
	7r4Ei+nUasl8N4rOF64k7u7oOEp0dKxmz7euHh7Wh4HkTzgMb+SsaK9ZXdb6NT3zGyL9oaW8Vqx
	reUI3x7Az1p+mMUV+2x6rE2+y/yc=
X-Received: by 2002:a5d:658c:: with SMTP id q12mr16674210wru.34.1635804558680;
        Mon, 01 Nov 2021 15:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7l2Vftm7DMc/eD2Pbw7jBZVxT3bmH28cxDkkzkMDwNXV8YPCcpluT9gBfpkvFnsLHKLEoAQ==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr16674187wru.34.1635804558501;
        Mon, 01 Nov 2021 15:09:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?= =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>
Subject: [PULL 03/20] memory: make global_dirty_tracking a bitmask
Date: Mon,  1 Nov 2021 23:08:55 +0100
Message-Id: <20211101220912.10039-4-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

since dirty ring has been introduced, there are two methods
to track dirty pages of vm. it seems that "logging" has
a hint on the method, so rename the global_dirty_log to
global_dirty_tracking would make description more accurate.

dirty rate measurement may start or stop dirty tracking during
calculation. this conflict with migration because stop dirty
tracking make migration leave dirty pages out then that'll be
a problem.

make global_dirty_tracking a bitmask can let both migration and
dirty rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION
and GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty
tracking aims for, migration or dirty rate.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <9c9388657cfa0301bd2c1cfa36e7cf6da4aeca19.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/memory.h   | 20 +++++++++++++++++---
 include/exec/ram_addr.h |  4 ++--
 hw/i386/xen/xen-hvm.c   |  4 ++--
 migration/ram.c         | 15 +++++++++++----
 softmmu/memory.c        | 32 +++++++++++++++++++++-----------
 softmmu/trace-events    |  1 +
 6 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a185b6dcb8..04280450c9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -61,7 +61,17 @@ static inline void fuzz_dma_read_cb(size_t addr,
 }
 #endif
 
-extern bool global_dirty_log;
+/* Possible bits for global_dirty_log_{start|stop} */
+
+/* Dirty tracking enabled because migration is running */
+#define GLOBAL_DIRTY_MIGRATION  (1U << 0)
+
+/* Dirty tracking enabled because measuring dirty rate */
+#define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
+
+#define GLOBAL_DIRTY_MASK  (0x3)
+
+extern unsigned int global_dirty_tracking;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
 
@@ -2388,13 +2398,17 @@ void memory_listener_unregister(MemoryListener *listener);
 
 /**
  * memory_global_dirty_log_start: begin dirty logging for all regions
+ *
+ * @flags: purpose of starting dirty log, migration or dirty rate
  */
-void memory_global_dirty_log_start(void);
+void memory_global_dirty_log_start(unsigned int flags);
 
 /**
  * memory_global_dirty_log_stop: end dirty logging for all regions
+ *
+ * @flags: purpose of stopping dirty log, migration or dirty rate
  */
-void memory_global_dirty_log_stop(void);
+void memory_global_dirty_log_stop(unsigned int flags);
 
 void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled);
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 551876bed0..45c913264a 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -369,7 +369,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
                     qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
 
-                    if (global_dirty_log) {
+                    if (global_dirty_tracking) {
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
@@ -392,7 +392,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-        if (!global_dirty_log) {
+        if (!global_dirty_tracking) {
             clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
         }
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e3d3d5cf89..482be95415 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1613,8 +1613,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
     if (enable) {
-        memory_global_dirty_log_start();
+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
     } else {
-        memory_global_dirty_log_stop();
+        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     }
 }
diff --git a/migration/ram.c b/migration/ram.c
index bb908822d5..ae2601bf3b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2216,7 +2216,14 @@ static void ram_save_cleanup(void *opaque)
         /* caller have hold iothread lock or is in a bh, so there is
          * no writing race against the migration bitmap
          */
-        memory_global_dirty_log_stop();
+        if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
+            /*
+             * do not stop dirty log without starting it, since
+             * memory_global_dirty_log_stop will assert that
+             * memory_global_dirty_log_start/stop used in pairs
+             */
+            memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
+        }
     }
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
@@ -2678,7 +2685,7 @@ static void ram_init_bitmaps(RAMState *rs)
         ram_list_init_bitmaps();
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
-            memory_global_dirty_log_start();
+            memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
             migration_bitmap_sync_precopy(rs);
         }
     }
@@ -3434,7 +3441,7 @@ void colo_incoming_start_dirty_log(void)
             /* Discard this dirty bitmap record */
             bitmap_zero(block->bmap, block->max_length >> TARGET_PAGE_BITS);
         }
-        memory_global_dirty_log_start();
+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
     }
     ram_state->migration_dirty_pages = 0;
     qemu_mutex_unlock_ramlist();
@@ -3446,7 +3453,7 @@ void colo_release_ram_cache(void)
 {
     RAMBlock *block;
 
-    memory_global_dirty_log_stop();
+    memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         g_free(block->bmap);
         block->bmap = NULL;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index e5826faa0c..f2ac0d2e89 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -39,7 +39,7 @@
 static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
-bool global_dirty_log;
+unsigned int global_dirty_tracking;
 
 static QTAILQ_HEAD(, MemoryListener) memory_listeners
     = QTAILQ_HEAD_INITIALIZER(memory_listeners);
@@ -1821,7 +1821,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
     uint8_t mask = mr->dirty_log_mask;
     RAMBlock *rb = mr->ram_block;
 
-    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+    if (global_dirty_tracking && ((rb && qemu_ram_is_migratable(rb)) ||
                              memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
@@ -2760,14 +2760,18 @@ void memory_global_after_dirty_log_sync(void)
 
 static VMChangeStateEntry *vmstate_change;
 
-void memory_global_dirty_log_start(void)
+void memory_global_dirty_log_start(unsigned int flags)
 {
     if (vmstate_change) {
         qemu_del_vm_change_state_handler(vmstate_change);
         vmstate_change = NULL;
     }
 
-    global_dirty_log = true;
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
+    assert(!(global_dirty_tracking & flags));
+    global_dirty_tracking |= flags;
+
+    trace_global_dirty_changed(global_dirty_tracking);
 
     MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
 
@@ -2777,9 +2781,13 @@ void memory_global_dirty_log_start(void)
     memory_region_transaction_commit();
 }
 
-static void memory_global_dirty_log_do_stop(void)
+static void memory_global_dirty_log_do_stop(unsigned int flags)
 {
-    global_dirty_log = false;
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
+    assert((global_dirty_tracking & flags) == flags);
+    global_dirty_tracking &= ~flags;
+
+    trace_global_dirty_changed(global_dirty_tracking);
 
     /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
     memory_region_transaction_begin();
@@ -2792,8 +2800,9 @@ static void memory_global_dirty_log_do_stop(void)
 static void memory_vm_change_state_handler(void *opaque, bool running,
                                            RunState state)
 {
+    unsigned int flags = (unsigned int)(uintptr_t)opaque;
     if (running) {
-        memory_global_dirty_log_do_stop();
+        memory_global_dirty_log_do_stop(flags);
 
         if (vmstate_change) {
             qemu_del_vm_change_state_handler(vmstate_change);
@@ -2802,18 +2811,19 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
     }
 }
 
-void memory_global_dirty_log_stop(void)
+void memory_global_dirty_log_stop(unsigned int flags)
 {
     if (!runstate_is_running()) {
         if (vmstate_change) {
             return;
         }
         vmstate_change = qemu_add_vm_change_state_handler(
-                                memory_vm_change_state_handler, NULL);
+                                memory_vm_change_state_handler,
+                                (void *)(uintptr_t)flags);
         return;
     }
 
-    memory_global_dirty_log_do_stop();
+    memory_global_dirty_log_do_stop(flags);
 }
 
 static void listener_add_address_space(MemoryListener *listener,
@@ -2825,7 +2835,7 @@ static void listener_add_address_space(MemoryListener *listener,
     if (listener->begin) {
         listener->begin(listener);
     }
-    if (global_dirty_log) {
+    if (global_dirty_tracking) {
         if (listener->log_global_start) {
             listener->log_global_start(listener);
         }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index bf1469990e..9c88887b3c 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -19,6 +19,7 @@ memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '
 flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
+global_dirty_changed(unsigned int bitmask) "bitmask 0x%"PRIx32
 
 # softmmu.c
 vm_stop_flush_all(int ret) "ret %d"
-- 
2.33.1


