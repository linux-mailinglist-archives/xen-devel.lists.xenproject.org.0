Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D837B442321
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219431.380286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUo-0001Tx-7J; Mon, 01 Nov 2021 22:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219431.380286; Mon, 01 Nov 2021 22:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUn-0001NS-Sg; Mon, 01 Nov 2021 22:09:37 +0000
Received: by outflank-mailman (input) for mailman id 219431;
 Mon, 01 Nov 2021 22:09:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUl-0007pr-NU
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e1b86dc-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:22 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-AoAgT-_7MfGQZC-dnIEWZg-1; Mon, 01 Nov 2021 18:09:21 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so170014wmc.7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id g5sm709951wmi.2.2021.11.01.15.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:19 -0700 (PDT)
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
X-Inumbo-ID: 5e1b86dc-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zC+zxEH+pUhjgORZ5ETFB7/+CsNzKhs7SNRZ+CUF1/0=;
	b=D0ygIqxRSY5Sl+3gvqB/NSQ8h4qa/gD/WFYh5IuLJraAntcO8uP6NH0Ci5xFMQuthBGBxG
	jhiX9O8doGFwN36n5ItLILypvBkTjo4IiIgvqpngg6WrPT2BnaIJHzXnGPq94AMNJEuZnH
	EE5oCAg4SoyUOSUAEj6pyJEFrz9ZajY=
X-MC-Unique: AoAgT-_7MfGQZC-dnIEWZg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zC+zxEH+pUhjgORZ5ETFB7/+CsNzKhs7SNRZ+CUF1/0=;
        b=FlQ8VcFtHenZbW4cAs3E7kcZXxvZeKe4uvd30Ba31QHsACbfSgC9KJxAR88af7IYNx
         7VCE4/vGRdjG/KUZ1ccA9xdYCkpyTnEnEfr2ty6Nz0GbS/JYrLODMMp+JPFk46AR2Eey
         AAGT24MJpTLa1fYGfuIH+vpQZjbbWy2CqWnpqEp2iRAoerAwMTCDgPmP7LMxeajj9if/
         c172+0O81/K/Hjqr8Ba4LOQeE3F7NqE2EtuCCJw8K8e+PyytHCwTnbMDRbhBjuor9OsL
         e81EXvW1UQMD2iofJS4H4m0zTZq63K3m2ULP6PIElmbFLBMsOL+MiMuGRf0hbABIqjhU
         IehA==
X-Gm-Message-State: AOAM5302R6sz7a5N0g9amTLf/TqHOHwc+6Ef1q085up/RDST/D/aJMhW
	M0LZDBfU+9VhCdJKobpqGPparbiKaGbRYCZ4iHOVKezL08v/wdVN1qyPCvo7EXn7bhB0hloBok8
	UKpupecJVivHPjuyXKmmDy3+2EQk=
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr24140823wrs.26.1635804559961;
        Mon, 01 Nov 2021 15:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOqU8wWYVaIjRWd2sjZqSUpY8HCgD5Gu3n1DFyO90oDUDzJdkVJM68NrFLzLaF6oWA+5DyZw==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr24140791wrs.26.1635804559728;
        Mon, 01 Nov 2021 15:09:19 -0700 (PDT)
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
Subject: [PULL 04/20] migration/dirtyrate: introduce struct and adjust DirtyRateStat
Date: Mon,  1 Nov 2021 23:08:56 +0100
Message-Id: <20211101220912.10039-5-quintela@redhat.com>
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

introduce "DirtyRateMeasureMode" to specify what method should be
used to calculate dirty rate, introduce "DirtyRateVcpu" to store
dirty rate for each vcpu.

use union to store stat data of specific mode

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <661c98c40f40e163aa58334337af8f3ddf41316a.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   | 30 +++++++++++++++++++++++++++
 migration/dirtyrate.h | 21 +++++++++++++++----
 migration/dirtyrate.c | 48 +++++++++++++++++++++++++------------------
 3 files changed, 75 insertions(+), 24 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 9aa8bc5759..94eece16e1 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1731,6 +1731,21 @@
 { 'event': 'UNPLUG_PRIMARY',
   'data': { 'device-id': 'str' } }
 
+##
+# @DirtyRateVcpu:
+#
+# Dirty rate of vcpu.
+#
+# @id: vcpu index.
+#
+# @dirty-rate: dirty rate.
+#
+# Since: 6.1
+#
+##
+{ 'struct': 'DirtyRateVcpu',
+  'data': { 'id': 'int', 'dirty-rate': 'int64' } }
+
 ##
 # @DirtyRateStatus:
 #
@@ -1748,6 +1763,21 @@
 { 'enum': 'DirtyRateStatus',
   'data': [ 'unstarted', 'measuring', 'measured'] }
 
+##
+# @DirtyRateMeasureMode:
+#
+# An enumeration of mode of measuring dirtyrate.
+#
+# @page-sampling: calculate dirtyrate by sampling pages.
+#
+# @dirty-ring: calculate dirtyrate by via dirty ring.
+#
+# Since: 6.1
+#
+##
+{ 'enum': 'DirtyRateMeasureMode',
+  'data': ['page-sampling', 'dirty-ring'] }
+
 ##
 # @DirtyRateInfo:
 #
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index e1fd29089e..69d4c5b865 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -43,6 +43,7 @@
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
+    DirtyRateMeasureMode mode; /* mode of dirtyrate measurement */
 };
 
 /*
@@ -58,17 +59,29 @@ struct RamblockDirtyInfo {
     uint32_t *hash_result; /* array of hash result for sampled pages */
 };
 
-/*
- * Store calculation statistics for each measure.
- */
-struct DirtyRateStat {
+typedef struct SampleVMStat {
     uint64_t total_dirty_samples; /* total dirty sampled page */
     uint64_t total_sample_count; /* total sampled pages */
     uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
+} SampleVMStat;
+
+typedef struct VcpuStat {
+    int nvcpu; /* number of vcpu */
+    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
+} VcpuStat;
+
+/*
+ * Store calculation statistics for each measure.
+ */
+struct DirtyRateStat {
     int64_t dirty_rate; /* dirty rate in MB/s */
     int64_t start_time; /* calculation start time in units of second */
     int64_t calc_time; /* time duration of two sampling in units of second */
     uint64_t sample_pages; /* sample pages per GB */
+    union {
+        SampleVMStat page_sampling;
+        VcpuStat dirty_ring;
+    };
 };
 
 void *get_dirtyrate_thread(void *arg);
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 320c56ba2c..e0a27a992c 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -88,33 +88,44 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     return info;
 }
 
-static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
-                                uint64_t sample_pages)
+static void init_dirtyrate_stat(int64_t start_time,
+                                struct DirtyRateConfig config)
 {
-    DirtyStat.total_dirty_samples = 0;
-    DirtyStat.total_sample_count = 0;
-    DirtyStat.total_block_mem_MB = 0;
     DirtyStat.dirty_rate = -1;
     DirtyStat.start_time = start_time;
-    DirtyStat.calc_time = calc_time;
-    DirtyStat.sample_pages = sample_pages;
+    DirtyStat.calc_time = config.sample_period_seconds;
+    DirtyStat.sample_pages = config.sample_pages_per_gigabytes;
+
+    switch (config.mode) {
+    case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
+        DirtyStat.page_sampling.total_dirty_samples = 0;
+        DirtyStat.page_sampling.total_sample_count = 0;
+        DirtyStat.page_sampling.total_block_mem_MB = 0;
+        break;
+    case DIRTY_RATE_MEASURE_MODE_DIRTY_RING:
+        DirtyStat.dirty_ring.nvcpu = -1;
+        DirtyStat.dirty_ring.rates = NULL;
+        break;
+    default:
+        break;
+    }
 }
 
 static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
 {
-    DirtyStat.total_dirty_samples += info->sample_dirty_count;
-    DirtyStat.total_sample_count += info->sample_pages_count;
+    DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
+    DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
     /* size of total pages in MB */
-    DirtyStat.total_block_mem_MB += (info->ramblock_pages *
-                                     TARGET_PAGE_SIZE) >> 20;
+    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
+                                                   TARGET_PAGE_SIZE) >> 20;
 }
 
 static void update_dirtyrate(uint64_t msec)
 {
     uint64_t dirtyrate;
-    uint64_t total_dirty_samples = DirtyStat.total_dirty_samples;
-    uint64_t total_sample_count = DirtyStat.total_sample_count;
-    uint64_t total_block_mem_MB = DirtyStat.total_block_mem_MB;
+    uint64_t total_dirty_samples = DirtyStat.page_sampling.total_dirty_samples;
+    uint64_t total_sample_count = DirtyStat.page_sampling.total_sample_count;
+    uint64_t total_block_mem_MB = DirtyStat.page_sampling.total_block_mem_MB;
 
     dirtyrate = total_dirty_samples * total_block_mem_MB *
                 1000 / (total_sample_count * msec);
@@ -327,7 +338,7 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
         update_dirtyrate_stat(block_dinfo);
     }
 
-    if (DirtyStat.total_sample_count == 0) {
+    if (DirtyStat.page_sampling.total_sample_count == 0) {
         return false;
     }
 
@@ -372,8 +383,6 @@ void *get_dirtyrate_thread(void *arg)
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
     int64_t start_time;
-    int64_t calc_time;
-    uint64_t sample_pages;
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
                               DIRTY_RATE_STATUS_MEASURING);
@@ -383,9 +392,7 @@ void *get_dirtyrate_thread(void *arg)
     }
 
     start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-    calc_time = config.sample_period_seconds;
-    sample_pages = config.sample_pages_per_gigabytes;
-    init_dirtyrate_stat(start_time, calc_time, sample_pages);
+    init_dirtyrate_stat(start_time, config);
 
     calculate_dirtyrate(config);
 
@@ -442,6 +449,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
 
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
+    config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
-- 
2.33.1


