Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CFD2F1CC4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65115.115355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Db-0003IJ-SA; Mon, 11 Jan 2021 17:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65115.115355; Mon, 11 Jan 2021 17:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Db-0003GQ-EL; Mon, 11 Jan 2021 17:43:03 +0000
Received: by outflank-mailman (input) for mailman id 65115;
 Mon, 11 Jan 2021 17:43:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DY-0002aB-PE
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:00 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1a01310-3ed6-46e9-896c-386918dfcdbd;
 Mon, 11 Jan 2021 17:42:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgXM3S
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:33 +0100 (CET)
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
X-Inumbo-ID: c1a01310-3ed6-46e9-896c-386918dfcdbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386959;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=o9fNhJYfzxfmis0d+C/AMAb8WbNRM5iWlhebvKPfTxA=;
	b=ErZhKJvBGNa8Kl03YsgC5oI8KESr88R2w0srAtwgpWH+W+6fANXyeaIhpreMDCDouj
	ngQCcBgyKA1t3017VbMDIzW3zVAMZousuKUQSU1TPW0yPoXjdYQQ8gGUw4glZ9gv4I0+
	20I7CHvgMuCOPWOVmZ6EB/KTLel3B3C7Ob3pKxYYX1nT3O+UXWIcbQU8T1BxmQR0UMv6
	MnWcLKXK4BX3ei2L0WAwJP33zuLwNLU9+o1dPl90A6uHXIH5z2hNp88ntGnzc8I+hsG7
	hxZGA2rhlMe3fupsGtFT0H3SzXc8KJej86NIn3M+hLabvHb7NQ3ftc0lL82whMIqVYRQ
	kxmQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 13/39] tools: show migration transfer rate in send_dirty_pages
Date: Mon, 11 Jan 2021 18:41:58 +0100
Message-Id: <20210111174224.24714-14-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show how fast domU pages are transferred in each iteration.

The relevant data is how fast the pfns travel, not so much how much
protocol overhead exists. So the reported MiB/sec is just for pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  2 ++
 tools/libs/guest/xg_sr_save.c   | 47 +++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 70e328e951..f3a7a29298 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -238,6 +238,8 @@ struct xc_sr_context
             bool debug;
 
             unsigned long p2m_size;
+            size_t pages_sent;
+            size_t overhead_sent;
 
             struct precopy_stats stats;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 0546d3d9e6..da031fcfce 100644
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
@@ -357,6 +360,43 @@ static int suspend_domain(struct xc_sr_context *ctx)
     return 0;
 }
 
+static void show_transfer_rate(struct xc_sr_context *ctx, struct timespec *start)
+{
+    xc_interface *xch = ctx->xch;
+    struct timespec end = {}, diff = {};
+    size_t ms, MiB_sec = ctx->save.pages_sent * PAGE_SIZE;
+
+    if (!MiB_sec)
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
+    if (!ms)
+        ms = 1;
+    ms += (diff.tv_sec * 1000U);
+
+    MiB_sec *= 1000U;
+    MiB_sec /= ms;
+    MiB_sec /= 1024U*1024U;
+
+    errno = 0;
+    IPRINTF("%s: %zu bytes + %zu pages in %ld.%09ld sec, %zu MiB/sec", __func__,
+            ctx->save.overhead_sent, ctx->save.pages_sent, diff.tv_sec, diff.tv_nsec, MiB_sec);
+}
+
 /*
  * Send a subset of pages in the guests p2m, according to the dirty bitmap.
  * Used for each subsequent iteration of the live migration loop.
@@ -370,9 +410,15 @@ static int send_dirty_pages(struct xc_sr_context *ctx,
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
@@ -396,6 +442,7 @@ static int send_dirty_pages(struct xc_sr_context *ctx,
     if ( written > entries )
         DPRINTF("Bitmap contained more entries than expected...");
 
+    show_transfer_rate(ctx, &start);
     xc_report_progress_step(xch, entries, entries);
 
     return ctx->save.ops.check_vm_state(ctx);

