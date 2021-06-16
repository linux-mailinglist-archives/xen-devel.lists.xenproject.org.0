Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49F3A9B1E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142951.263708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1c-0003gn-4F; Wed, 16 Jun 2021 12:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142951.263708; Wed, 16 Jun 2021 12:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1b-0003Xu-Nq; Wed, 16 Jun 2021 12:52:07 +0000
Received: by outflank-mailman (input) for mailman id 142951;
 Wed, 16 Jun 2021 12:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1a-0006lZ-0S
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:06 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1862b455-a593-4217-a96b-2c8baf4754e0;
 Wed, 16 Jun 2021 12:51:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpctlz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:38 +0200 (CEST)
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
X-Inumbo-ID: 1862b455-a593-4217-a96b-2c8baf4754e0
ARC-Seal: i=1; a=rsa-sha256; t=1623847898; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ag0e/5sNW6+i/kXyXoqt1VWKzYhGkvW0AiLGi5eTmr7Em384H6YwHHk9NueZhAldqx
    Jyl+j2c36db5IiIN4u1QAyhX1KukuIMi3YGVKKJW5/1zg62cXvVrKjWONLG7vzXV2bdQ
    6eRBuxuXW/bLCVKD9MWId3jcIDrBrqAKxzBkE7GbTnMXSWcaapFr4nwqzUdfyPJy/f5c
    CL0ZuNrWYSbiz4BYzJLpf+fjqQreDGX6LWPbdoMluAgV8mCVF4QR+s3ibQPKwh3gYZVM
    74PiscTSFgHaThxQv4wobdcIX2qiqxHiLZAO550Ry7vp0jByztRWwz1d4VvxK4tjHXsn
    aVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847898;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Zji+2Vj186gOQDCiA8MR4SQwrN68K3CPojQMJJRtxVk=;
    b=Sqxqycp1IAHnBrceTsX6/60pWhzCIFxBPvyU4pzVlVcPo/G5vnjTvQIHTGcohglMzn
    tuhpSWpV7Rds8Tj389fql61styvu47nTWkAD5xwFmCEHbjYHUUEhVt0RL36cA3WEck1j
    hJYPlLlD0s9zwo25eLhgblPwK9xT1BOOEj2nr8/HUsZtayN13MUmivKNhhs8E7n0uzCR
    1yZ2p987jl/fJf6+t2Vjwx9ud92HyBPBMWdgwvhqQrghxirMy+LiS6b9B7oQ8u9QCpMb
    l79RzrF8f1GZz+qscsndw85QqQpYj7tIVWsLvrNYgl6jnqsUe2mLDjmx3gi8pQyDJDPi
    tJGg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847898;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Zji+2Vj186gOQDCiA8MR4SQwrN68K3CPojQMJJRtxVk=;
    b=naAFTL1rKhbPf85zZPnuCga7UufnYhJaiCPJ0EROBqh0RuNZfq3kV28HyN1Gq0Q4V3
    pK70e3O5ZB1+IzWWrS1w0gtK+YlOhQz2NmlumxQ1gf+Vc781A7bK/2/yAkXQ7AqABPE+
    vY284A8IDgmtp5vNpzL2/+Wf1QFSyxXNU/wVUmZdl7PoSVX+uJ9/VmJ1Sq83UGrU5Qc7
    xtpHQ61QC65WVEEeDWyNp5VhzWSPqArVfwh6YrnE8VZ3Ftjl1mwFL0w5PmA8yUHwjfPw
    FRql2yVtjyYZg17Iuj0MZ8YlwqS4kHHR0NyL6xsAjG30HOpK5kbMYwVHdak7ZsTnqO8b
    l1uw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 10/36] tools: show migration transfer rate in send_dirty_pages
Date: Wed, 16 Jun 2021 14:51:03 +0200
Message-Id: <20210616125129.26563-11-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index 08bbe902b9..d61569e1a6 100644
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

