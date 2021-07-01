Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CE3B9026
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148367.274322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRo-0003cQ-QD; Thu, 01 Jul 2021 09:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148367.274322; Thu, 01 Jul 2021 09:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRo-0003Zp-IW; Thu, 01 Jul 2021 09:57:28 +0000
Received: by outflank-mailman (input) for mailman id 148367;
 Thu, 01 Jul 2021 09:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRl-0004XT-SS
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:25 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 844743a8-e2aa-4a5c-ba0d-5227f666b505;
 Thu, 01 Jul 2021 09:56:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uj5Mz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:45 +0200 (CEST)
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
X-Inumbo-ID: 844743a8-e2aa-4a5c-ba0d-5227f666b505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133406;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=HjAuQTbWmPJqlcbKtv74PXHy29j5qe7IwbSTeBBg19U=;
    b=SjBOdI0lSSEEBQqOqmxQDxpMY6Z2JwrcX6hsX0vTDg6IX2qrCx8zFagH0CYUx9FDE+
    wJr0ifynv8UbIBIIvZjp5jAtunFRKxNBT/NdyMtv6pYFgu6xgXfTxqfGXFokLeH9Wjca
    hrpAgUMNdhwAK5C+hRl9w+nJE6i4D9qc2Jnw4yMlgPYR7BOl9GnbamSFM9Yol9wyHafY
    13efq1OZf5k4nXDcCviHNuk4ZS8R8tn9vflUVzmcWboXv4iBmVyE07bkJyBpQRuAVFIo
    fqU88xLfamB95nhRkQ3M07BpcGhEjF2dYq0mNcafBhglJO4zNjXWmwu+7rglBUC5N6kQ
    9wPA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 14/40] tools: show migration transfer rate in send_dirty_pages
Date: Thu,  1 Jul 2021 11:56:09 +0200
Message-Id: <20210701095635.15648-15-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show how fast domU pages are transferred in each iteration.

The relevant data is how fast the pfns travel, not so much how much
protocol overhead exists. So the reported MiB/sec is just for pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- rearrange MiB_sec calculation (jgross)
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 905b4078f6..252076cf51 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -250,6 +250,8 @@ struct xc_sr_context
             bool debug;
 
             unsigned long p2m_size;
+            size_t pages_sent;
+            size_t overhead_sent;
 
             struct precopy_stats stats;
 
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 12598bd4e2..f8fbe7a742 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -1,5 +1,6 @@
 #include <assert.h>
 #include <arpa/inet.h>
+#include <time.h>
 
 #include "common.h"
 
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

