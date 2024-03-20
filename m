Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA02880B80
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 07:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695697.1085610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmpoH-0001CP-Oi; Wed, 20 Mar 2024 06:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695697.1085610; Wed, 20 Mar 2024 06:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmpoH-00018Z-Jv; Wed, 20 Mar 2024 06:52:25 +0000
Received: by outflank-mailman (input) for mailman id 695697;
 Wed, 20 Mar 2024 06:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CSxH=K2=redhat.com=clg@srs-se1.protection.inumbo.net>)
 id 1rmpm6-0000AA-12
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 06:50:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17236479-e686-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 07:50:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-81MjY4A2OjelT2_yDjhWkA-1; Wed,
 20 Mar 2024 02:50:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 723113CBDF6A;
 Wed, 20 Mar 2024 06:49:59 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 791411C060CE;
 Wed, 20 Mar 2024 06:49:55 +0000 (UTC)
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
X-Inumbo-ID: 17236479-e686-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710917408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+fu3I95chIk56zixXafJc0iqGViBh7Y5/UDMejOikQ=;
	b=hqwJ3WMzyZ81lxhV07xEIrgy0D/Mjwm3jSnG47q60IaXtQdwmCPpLPm1qbj+o2dZzfPVTs
	hGAQ825ydZd9DjepTnpVXkxcIXPJDEuInwrdGmbyUcAHmeNTFvtdNFpIcUniOo4vfM3kx8
	xRWMds4TL2C7MUhiX2RC0dukG5B8O4I=
X-MC-Unique: 81MjY4A2OjelT2_yDjhWkA-1
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Hyman Huang <yong.huang@smartx.com>,
	Fabiano Rosas <farosas@suse.de>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Markus Armbruster <armbru@redhat.com>,
	Prasad Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH for-9.1 v5 11/14] memory: Add Error** argument to the global_dirty_log routines
Date: Wed, 20 Mar 2024 07:49:07 +0100
Message-ID: <20240320064911.545001-12-clg@redhat.com>
In-Reply-To: <20240320064911.545001-1-clg@redhat.com>
References: <20240320064911.545001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Now that the log_global*() handlers take an Error** parameter and
return a bool, do the same for memory_global_dirty_log_start() and
memory_global_dirty_log_stop(). The error is reported in the callers
for now and it will be propagated in the call stack in the next
changes.

To be noted a functional change in ram_init_bitmaps(), if the dirty
pages logger fails to start, there is no need to synchronize the dirty
pages bitmaps. colo_incoming_start_dirty_log() could be modified in a
similar way.

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Hyman Huang <yong.huang@smartx.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---

 Changes in v5:

 - Removed Yong Huang's R-b 
 - Made use of ram_bitmaps_destroy() in ram_init_bitmaps() to cleanup
   allocated bitmaps
 
 include/exec/memory.h |  5 ++++-
 hw/i386/xen/xen-hvm.c |  2 +-
 migration/dirtyrate.c | 13 +++++++++++--
 migration/ram.c       | 23 +++++++++++++++++++++--
 system/memory.c       | 11 +++++------
 5 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5555567bc4c9fdb53e8f63487f1400980275687d..c129ee6db7162504bd72d4cfc69b5affb2cd87e8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2570,8 +2570,11 @@ void memory_listener_unregister(MemoryListener *listener);
  * memory_global_dirty_log_start: begin dirty logging for all regions
  *
  * @flags: purpose of starting dirty log, migration or dirty rate
+ * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_global_dirty_log_start(unsigned int flags);
+bool memory_global_dirty_log_start(unsigned int flags, Error **errp);
 
 /**
  * memory_global_dirty_log_stop: end dirty logging for all regions
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f6e9a1bc86491783077b5cb5aafdb19ab294e392..006d219ad52d739cc406ad5f8082ca82c16c61cc 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -669,7 +669,7 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
     if (enable) {
-        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION, errp);
     } else {
         memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     }
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 1d2e85746fb7b10eb7f149976970f9a92125af8a..d02d70b7b4b86a29d4d5540ded416543536d8f98 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -90,9 +90,15 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
 
 void global_dirty_log_change(unsigned int flag, bool start)
 {
+    Error *local_err = NULL;
+    bool ret;
+
     bql_lock();
     if (start) {
-        memory_global_dirty_log_start(flag);
+        ret = memory_global_dirty_log_start(flag, &local_err);
+        if (!ret) {
+            error_report_err(local_err);
+        }
     } else {
         memory_global_dirty_log_stop(flag);
     }
@@ -608,9 +614,12 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
 {
     int64_t start_time;
     DirtyPageRecord dirty_pages;
+    Error *local_err = NULL;
 
     bql_lock();
-    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
+    if (!memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE, &local_err)) {
+        error_report_err(local_err);
+    }
 
     /*
      * 1'round of log sync may return all 1 bits with
diff --git a/migration/ram.c b/migration/ram.c
index f0bd71438a4f7212118593b51648b645737933d4..bade3e9281ae839578033524b800dcf3c6f486dc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2862,18 +2862,32 @@ static void migration_bitmap_clear_discarded_pages(RAMState *rs)
 
 static void ram_init_bitmaps(RAMState *rs)
 {
+    Error *local_err = NULL;
+    bool ret = true;
+
     qemu_mutex_lock_ramlist();
 
     WITH_RCU_READ_LOCK_GUARD() {
         ram_list_init_bitmaps();
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
-            memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
+            ret = memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION,
+                                                &local_err);
+            if (!ret) {
+                error_report_err(local_err);
+                goto out_unlock;
+            }
             migration_bitmap_sync_precopy(rs, false);
         }
     }
+out_unlock:
     qemu_mutex_unlock_ramlist();
 
+    if (!ret) {
+        ram_bitmaps_destroy();
+        return;
+    }
+
     /*
      * After an eventual first bitmap sync, fixup the initial bitmap
      * containing all 1s to exclude any discarded pages from migration.
@@ -3665,6 +3679,8 @@ int colo_init_ram_cache(void)
 void colo_incoming_start_dirty_log(void)
 {
     RAMBlock *block = NULL;
+    Error *local_err = NULL;
+
     /* For memory_global_dirty_log_start below. */
     bql_lock();
     qemu_mutex_lock_ramlist();
@@ -3676,7 +3692,10 @@ void colo_incoming_start_dirty_log(void)
             /* Discard this dirty bitmap record */
             bitmap_zero(block->bmap, block->max_length >> TARGET_PAGE_BITS);
         }
-        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
+        if (!memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION,
+                                           &local_err)) {
+            error_report_err(local_err);
+        }
     }
     ram_state->migration_dirty_pages = 0;
     qemu_mutex_unlock_ramlist();
diff --git a/system/memory.c b/system/memory.c
index ca4d91484fb3d06f4b902486fea49dba86dc141b..d7ca1de994f6c3d08820eae4f0b1922db0030831 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -2937,10 +2937,9 @@ err:
     return false;
 }
 
-void memory_global_dirty_log_start(unsigned int flags)
+bool memory_global_dirty_log_start(unsigned int flags, Error **errp)
 {
     unsigned int old_flags;
-    Error *local_err = NULL;
 
     assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
 
@@ -2952,7 +2951,7 @@ void memory_global_dirty_log_start(unsigned int flags)
 
     flags &= ~global_dirty_tracking;
     if (!flags) {
-        return;
+        return true;
     }
 
     old_flags = global_dirty_tracking;
@@ -2960,17 +2959,17 @@ void memory_global_dirty_log_start(unsigned int flags)
     trace_global_dirty_changed(global_dirty_tracking);
 
     if (!old_flags) {
-        if (!memory_global_dirty_log_do_start(&local_err)) {
+        if (!memory_global_dirty_log_do_start(errp)) {
             global_dirty_tracking &= ~flags;
             trace_global_dirty_changed(global_dirty_tracking);
-            error_report_err(local_err);
-            return;
+            return false;
         }
 
         memory_region_transaction_begin();
         memory_region_update_pending = true;
         memory_region_transaction_commit();
     }
+    return true;
 }
 
 static void memory_global_dirty_log_do_stop(unsigned int flags)
-- 
2.44.0


