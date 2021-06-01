Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6393977A1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134989.251078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zi-0000EM-Uo; Tue, 01 Jun 2021 16:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134989.251078; Tue, 01 Jun 2021 16:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zi-00009U-N3; Tue, 01 Jun 2021 16:11:54 +0000
Received: by outflank-mailman (input) for mailman id 134989;
 Tue, 01 Jun 2021 16:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zh-0005Ec-1H
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:53 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2cc1909-2698-480b-8f54-aba8ac30e54e;
 Tue, 01 Jun 2021 16:11:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBS1BD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:28 +0200 (CEST)
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
X-Inumbo-ID: c2cc1909-2698-480b-8f54-aba8ac30e54e
ARC-Seal: i=1; a=rsa-sha256; t=1622563889; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rnJXdhgrXacgywk38aKsQE7O0+NhpB+PxH/eZKPkEcLT/M19R5KSVeg8kCZYBLfUUA
    AdK8ByK7g8edyjpdC7wtaQdGV+riv8mzN0QZrHHVT5y415uX87SFAHYOCO2DpwLRybAt
    NKdF1K64VpqL/FYm0MwUhnwW3XpTyYDIxhk5LwO67BI3a1GlxlmTD3UyVn/JVhku7nq4
    yZz1zI+OXSZOuaQghShoAUHIL2xfbTZLYn6RsoahVmr9zDdW7DcEZkUg/J1ghXqmdWf7
    VSHUg0yFXt2NyvLmiNrYyw9lrF25GKrq6yJpQ55Svxti2YNMGqLcm/bFJ7ViY0af9RY4
    bVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563889;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=cDil57jxI4Z5Z9nbXjVlKKlvOaQMfsb66RRaO8m9ED8=;
    b=eUW5+lj09D+EqeYYhWwyDOnODC1rQFKFUnFVTvraE2R2lM4Frg5cOvunGY6tW5XPMf
    9WNVbsiXm/xvd2/LkVdhmd0GgV2Zqk+k+RZmn81G+4wqIUriS+nslfVg0ZXXRtxtEwm6
    NInQxJoQLUvRCR1kxHcrv/otELiU7bcy18W56VhYV/S+dFLXRRWglzVgHUIVYlS3jvfy
    6vEmdDhlC6rDuRcC2KiOtsWG02mipc+rj1LX0FjNnoS2mP9I9j1Y0lyYCAR7uZX0r8ij
    p0WgLa8Alv0NiBcWfDihUQcZUn/kj3PzktUykj5jDeUS8YjDxV9EamF4SZWum1zZCN7K
    rKDg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563889;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=cDil57jxI4Z5Z9nbXjVlKKlvOaQMfsb66RRaO8m9ED8=;
    b=hNSJVlEhOJlKLSnCwsYffA1aYwF0tB02Ok2uJ21W3vA/ExnRX0/9xUPLYs1JpLlotg
    m4vphErILK7zWQwilFZ2DvEgeebVRQ8nouo91ktzb9yHleGt+srZkLPC//+yOXLJN8Rk
    DkZ1ezBLEGpahNxBOIV5rbPrzAM3hk059Z/0681Th/S+0HoqJvW8Th/S5WtTP2gr1YaU
    nQ5M+vGShR0Ey+L00f5Q6O2JtU9q5oM2RpJ/MyEXMhM5hbNvU70gf9iVGZ3TYREq26uM
    KUO2ql8E6ybCmzCisCzTDtByTrYo7v50wxzaCrVHm61HZnag1J95lamGSp6dGIv2e1Pi
    3G9Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 08/38] tools: show migration transfer rate in send_dirty_pages
Date: Tue,  1 Jun 2021 18:10:48 +0200
Message-Id: <20210601161118.18986-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show how fast domU pages are transferred in each iteration.

The relevant data is how fast the pfns travel, not so much how much
protocol overhead exists. So the reported MiB/sec is just for pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 47 +++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 50a8479d39..f5fe23caad 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -250,6 +250,8 @@ struct xc_sr_context
             bool debug;
 
             unsigned long p2m_size;
+            size_t pages_sent;
+            size_t overhead_sent;
 
             struct precopy_stats stats;
 
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index bcff2d28f5..760ca04a84 100644
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

