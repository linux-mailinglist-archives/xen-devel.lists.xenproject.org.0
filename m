Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F25442348
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219542.380435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfdV-0003M0-Iu; Mon, 01 Nov 2021 22:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219542.380435; Mon, 01 Nov 2021 22:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfdV-0003FY-BR; Mon, 01 Nov 2021 22:18:37 +0000
Received: by outflank-mailman (input) for mailman id 219542;
 Mon, 01 Nov 2021 22:18:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfVe-0007pr-Pf
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:10:30 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.129.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6a026a0f-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:43 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-hSh5pPCwOLqPUsAmPza-aA-1; Mon, 01 Nov 2021 18:09:42 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso166204wml.9
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:42 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id k8sm688985wms.41.2021.11.01.15.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:40 -0700 (PDT)
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
X-Inumbo-ID: 6a026a0f-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jP/I5apHpfB9miqWjOSmHHOjh4FLTnrs+cMqC3xHGrM=;
	b=UJ5ZYR8tosx+CzcwON4T+X4Pi1p9fiytMUwu6K59IdAOrEjcL6tYOckZh6mWgAEMaWzGNb
	GJsPqHbPkym0ee8SwOdKSLQXidEtiXVZUgTjkyK+QblnVNU4R9BH13RooVy4Fcax8pQ/jC
	Gf+M7G/GN81pNH1GLN9S/L/bL4GtVqg=
X-MC-Unique: hSh5pPCwOLqPUsAmPza-aA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jP/I5apHpfB9miqWjOSmHHOjh4FLTnrs+cMqC3xHGrM=;
        b=0NuVXFoAXvHH9UPq7E6Sn51EG4cbKpXyTf34UObSPcGvQqWFFU+GgzY+sBC9+jrTXj
         IaDAx7Nr7GyRIKZ2fvA/IwJuNy9rt25tJbHmhwRFX+hZ08ZpKbkkVOIVbsaxbh10DFx7
         ZalajO3m/Nsl9aGNCE8aVGHjX0OuabeTIX486WrX6cAQPbjEwC2lpkEIRWPFUO2aijKJ
         3GLLUdZ0knFIgyJGTt1FZ6ad0O/FJJWUIqH5op7R0i9rZ7AXxb5+Lp8bRYsj6bcveL2A
         GxEK/QpZiru6Ol2Cy8di5aL1+4WTeVe0mZ9uOljsEIECRzqSJULZGX+QHU9JzZQEeuXh
         g47g==
X-Gm-Message-State: AOAM533QNxkUy+VBelWBg+x4gEbndstI0By10Vszjqs0gevMFqk/Zn3m
	CNPQjgzIeMNiKkdJCKISC3ls5Sf83UtvvE1/80tfKmrkFLgLCcrwq9sQQHOATxk51UsdITfJiGp
	3TCplFM8LwKk/BS0jui6pMK7KFfg=
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr17619025wrw.312.1635804581262;
        Mon, 01 Nov 2021 15:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwekiY665T3KtWYk+MojmKh2E8nDk/brzhW8Smm/r4bdKRN1BvOX4dI3pL5wzRW0aYS3i58/A==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr17619009wrw.312.1635804581077;
        Mon, 01 Nov 2021 15:09:41 -0700 (PDT)
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
	=?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PULL 20/20] migration/dirtyrate: implement dirty-bitmap dirtyrate calculation
Date: Mon,  1 Nov 2021 23:09:12 +0100
Message-Id: <20211101220912.10039-21-quintela@redhat.com>
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

introduce dirty-bitmap mode as the third method of calc-dirty-rate.
implement dirty-bitmap dirtyrate calculation, which can be used
to measuring dirtyrate in the absence of dirty-ring.

introduce "dirty_bitmap:-b" option in hmp calc_dirty_rate to
indicate dirty bitmap method should be used for calculation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   |   6 ++-
 migration/dirtyrate.c | 112 ++++++++++++++++++++++++++++++++++++++----
 hmp-commands.hx       |   9 ++--
 3 files changed, 112 insertions(+), 15 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index fae4bc608c..87146ceea2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1770,13 +1770,15 @@
 #
 # @page-sampling: calculate dirtyrate by sampling pages.
 #
-# @dirty-ring: calculate dirtyrate by via dirty ring.
+# @dirty-ring: calculate dirtyrate by dirty ring.
+#
+# @dirty-bitmap: calculate dirtyrate by dirty bitmap.
 #
 # Since: 6.1
 #
 ##
 { 'enum': 'DirtyRateMeasureMode',
-  'data': ['page-sampling', 'dirty-ring'] }
+  'data': ['page-sampling', 'dirty-ring', 'dirty-bitmap'] }
 
 ##
 # @DirtyRateInfo:
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 17b3d2cbb5..d65e744af9 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/ramblock.h"
+#include "exec/ram_addr.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
 #include "qapi/qapi-commands-migration.h"
@@ -118,6 +119,10 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
             }
             info->vcpu_dirty_rate = head;
         }
+
+        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) {
+            info->sample_pages = 0;
+        }
     }
 
     trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
@@ -429,6 +434,79 @@ static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
     return memory_size_MB / time_s;
 }
 
+static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
+                                            bool start)
+{
+    if (start) {
+        dirty_pages->start_pages = total_dirty_pages;
+    } else {
+        dirty_pages->end_pages = total_dirty_pages;
+    }
+}
+
+static void do_calculate_dirtyrate_bitmap(DirtyPageRecord dirty_pages)
+{
+    DirtyStat.dirty_rate = do_calculate_dirtyrate_vcpu(dirty_pages);
+}
+
+static inline void dirtyrate_manual_reset_protect(void)
+{
+    RAMBlock *block = NULL;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        RAMBLOCK_FOREACH_MIGRATABLE(block) {
+            memory_region_clear_dirty_bitmap(block->mr, 0,
+                                             block->used_length);
+        }
+    }
+}
+
+static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
+{
+    int64_t msec = 0;
+    int64_t start_time;
+    DirtyPageRecord dirty_pages;
+
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
+
+    /*
+     * 1'round of log sync may return all 1 bits with
+     * KVM_DIRTY_LOG_INITIALLY_SET enable
+     * skip it unconditionally and start dirty tracking
+     * from 2'round of log sync
+     */
+    memory_global_dirty_log_sync();
+
+    /*
+     * reset page protect manually and unconditionally.
+     * this make sure kvm dirty log be cleared if
+     * KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE cap is enabled.
+     */
+    dirtyrate_manual_reset_protect();
+    qemu_mutex_unlock_iothread();
+
+    record_dirtypages_bitmap(&dirty_pages, true);
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    DirtyStat.start_time = start_time / 1000;
+
+    msec = config.sample_period_seconds * 1000;
+    msec = set_sample_page_period(msec, start_time);
+    DirtyStat.calc_time = msec / 1000;
+
+    /*
+     * dirtyrate_global_dirty_log_stop do two things.
+     * 1. fetch dirty bitmap from kvm
+     * 2. stop dirty tracking
+     */
+    dirtyrate_global_dirty_log_stop();
+
+    record_dirtypages_bitmap(&dirty_pages, false);
+
+    do_calculate_dirtyrate_bitmap(dirty_pages);
+}
+
 static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
 {
     CPUState *cpu;
@@ -514,7 +592,9 @@ out:
 
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
-    if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
+    if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) {
+        calculate_dirtyrate_dirty_bitmap(config);
+    } else if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
         calculate_dirtyrate_dirty_ring(config);
     } else {
         calculate_dirtyrate_sample_vm(config);
@@ -597,12 +677,15 @@ void qmp_calc_dirty_rate(int64_t calc_time,
 
     /*
      * dirty ring mode only works when kvm dirty ring is enabled.
+     * on the contrary, dirty bitmap mode is not.
      */
-    if ((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) &&
-        !kvm_dirty_ring_enabled()) {
-        error_setg(errp, "dirty ring is disabled, use sample-pages method "
-                         "or remeasure later.");
-        return;
+    if (((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) &&
+        !kvm_dirty_ring_enabled()) ||
+        ((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) &&
+         kvm_dirty_ring_enabled())) {
+        error_setg(errp, "mode %s is not enabled, use other method instead.",
+                         DirtyRateMeasureMode_str(mode));
+         return;
     }
 
     /*
@@ -678,9 +761,8 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
     int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
     bool has_sample_pages = (sample_pages != -1);
     bool dirty_ring = qdict_get_try_bool(qdict, "dirty_ring", false);
-    DirtyRateMeasureMode mode =
-        (dirty_ring ? DIRTY_RATE_MEASURE_MODE_DIRTY_RING :
-         DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING);
+    bool dirty_bitmap = qdict_get_try_bool(qdict, "dirty_bitmap", false);
+    DirtyRateMeasureMode mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     Error *err = NULL;
 
     if (!sec) {
@@ -688,6 +770,18 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    if (dirty_ring && dirty_bitmap) {
+        monitor_printf(mon, "Either dirty ring or dirty bitmap "
+                       "can be specified!\n");
+        return;
+    }
+
+    if (dirty_bitmap) {
+        mode = DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP;
+    } else if (dirty_ring) {
+        mode = DIRTY_RATE_MEASURE_MODE_DIRTY_RING;
+    }
+
     qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, true,
                         mode, &err);
     if (err) {
diff --git a/hmp-commands.hx b/hmp-commands.hx
index b6d47bd03f..3a5aeba3fe 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1737,9 +1737,10 @@ ERST
 
     {
         .name       = "calc_dirty_rate",
-        .args_type  = "dirty_ring:-r,second:l,sample_pages_per_GB:l?",
-        .params     = "[-r] second [sample_pages_per_GB]",
-        .help       = "start a round of guest dirty rate measurement (using -d to"
-                      "\n\t\t\t specify dirty ring as the method of calculation)",
+        .args_type  = "dirty_ring:-r,dirty_bitmap:-b,second:l,sample_pages_per_GB:l?",
+        .params     = "[-r] [-b] second [sample_pages_per_GB]",
+        .help       = "start a round of guest dirty rate measurement (using -r to"
+                      "\n\t\t\t specify dirty ring as the method of calculation and"
+                      "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
         .cmd        = hmp_calc_dirty_rate,
     },
-- 
2.33.1


