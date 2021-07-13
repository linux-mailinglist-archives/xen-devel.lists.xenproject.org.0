Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685A3C761B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155540.287148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mna-0003jY-En; Tue, 13 Jul 2021 18:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155540.287148; Tue, 13 Jul 2021 18:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mna-0003fd-AD; Tue, 13 Jul 2021 18:06:26 +0000
Received: by outflank-mailman (input) for mailman id 155540;
 Tue, 13 Jul 2021 18:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MnY-0002UL-GA
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:24 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.169])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b220a611-2cbe-434e-8ba0-601220fb6ed2;
 Tue, 13 Jul 2021 18:06:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6DtAn
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:13 +0200 (CEST)
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
X-Inumbo-ID: b220a611-2cbe-434e-8ba0-601220fb6ed2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199573;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Clrkbg11Ho2H2QvphK9GJKKzvhCVY4UGRclGnlEVBNo=;
    b=ncMC99+8T5s1sxnqRqUJetKk4Ynh023mspDlqYFfw21vrPc9vPmbwd4iNgTktq39zg
    5P2NX4LhClwagTbO9H2zaxMPd1Aj4d1iv1uDj+GUp3bG2nDEpLuO7WXlhZ9HONA+7DdP
    KARztatEq/Rc251lD7N2vUB6lTwbWxCg+JvcK5k7v6+x3JdfTZDbPWXB9uKLS1hwYkQn
    AAIHv0u8p34wWirG59r9QG/zhSYSDeSylI5/JgSfG67PqSWGh5YovuKXOWAMhOft0t1/
    mpnsFdsKQYHYl9EKkLdKFo50ZmHwk4Wxzs4bQqjd34T/2FRiCemmLCn1I5MelgmGU2FY
    5NSg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 06/31] tools: show migration transfer rate in send_dirty_pages
Date: Tue, 13 Jul 2021 20:05:40 +0200
Message-Id: <20210713180605.12096-7-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show how fast domU pages are transferred in each iteration.

The relevant data is how fast the pfns travel, not so much how much
protocol overhead exists. So the reported MiB/sec is just for pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v02:
- rearrange MiB_sec calculation (jgross)
---
 tools/libs/guest/xg_sr_common.h |  2 ++
 tools/libs/guest/xg_sr_save.c   | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 36d45ef56f..2e70cc6269 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -238,6 +238,8 @@ struct xc_sr_context
             bool debug;
 
             unsigned long p2m_size;
+            size_t pages_sent;
+            size_t overhead_sent;
 
             struct precopy_stats stats;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 3fce41b6cf..00b81033a9 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -1,5 +1,6 @@
 #include <assert.h>
 #include <arpa/inet.h>
+#include <time.h>
 
 #include "xg_sr_common.h"
 
@@ -238,6 +239,8 @@ static int write_batch(struct xc_sr_context *ctx)
     iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
 
     iovcnt = 4;
+    ctx->save.pages_sent += nr_pages;
+    ctx->save.overhead_sent += sizeof(rec) + sizeof(hdr) + nr_pfns * sizeof(*rec_pfns);
 
     if ( nr_pages )
     {
@@ -357,6 +360,42 @@ static int suspend_domain(struct xc_sr_context *ctx)
     return 0;
 }
 
+static void show_transfer_rate(struct xc_sr_context *ctx, struct timespec *start)
+{
+    xc_interface *xch = ctx->xch;
+    struct timespec end = {}, diff = {};
+    size_t ms, MiB_sec;
+
+    if (!ctx->save.pages_sent)
+        return;
+
+    if ( clock_gettime(CLOCK_MONOTONIC, &end) )
+        PERROR("clock_gettime");
+
+    if ( (end.tv_nsec - start->tv_nsec) < 0 )
+    {
+        diff.tv_sec = end.tv_sec - start->tv_sec - 1;
+        diff.tv_nsec = end.tv_nsec - start->tv_nsec + (1000U*1000U*1000U);
+    }
+    else
+    {
+        diff.tv_sec = end.tv_sec - start->tv_sec;
+        diff.tv_nsec = end.tv_nsec - start->tv_nsec;
+    }
+
+    ms = (diff.tv_nsec / (1000U*1000U));
+    ms += (diff.tv_sec * 1000U);
+    if (!ms)
+        ms = 1;
+
+    MiB_sec = (ctx->save.pages_sent * PAGE_SIZE * 1000U) / ms / (1024U*1024U);
+
+    errno = 0;
+    IPRINTF("%s: %zu bytes + %zu pages in %ld.%09ld sec, %zu MiB/sec", __func__,
+            ctx->save.overhead_sent, ctx->save.pages_sent,
+            diff.tv_sec, diff.tv_nsec, MiB_sec);
+}
+
 /*
  * Send a subset of pages in the guests p2m, according to the dirty bitmap.
  * Used for each subsequent iteration of the live migration loop.
@@ -370,9 +409,15 @@ static int send_dirty_pages(struct xc_sr_context *ctx,
     xen_pfn_t p;
     unsigned long written;
     int rc;
+    struct timespec start = {};
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
+    ctx->save.pages_sent = 0;
+    ctx->save.overhead_sent = 0;
+    if ( clock_gettime(CLOCK_MONOTONIC, &start) )
+        PERROR("clock_gettime");
+
     for ( p = 0, written = 0; p < ctx->save.p2m_size; ++p )
     {
         if ( !test_bit(p, dirty_bitmap) )
@@ -396,6 +441,7 @@ static int send_dirty_pages(struct xc_sr_context *ctx,
     if ( written > entries )
         DPRINTF("Bitmap contained more entries than expected...");
 
+    show_transfer_rate(ctx, &start);
     xc_report_progress_step(xch, entries, entries);
 
     return ctx->save.ops.check_vm_state(ctx);

