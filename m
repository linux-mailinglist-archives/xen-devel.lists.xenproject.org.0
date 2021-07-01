Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AD3B9023
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148359.274289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRf-0001bz-6x; Thu, 01 Jul 2021 09:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148359.274289; Thu, 01 Jul 2021 09:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRe-0001Xo-Tu; Thu, 01 Jul 2021 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 148359;
 Thu, 01 Jul 2021 09:57:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRd-0004r4-Gd
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:17 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5bf76a4-ed1b-4216-9294-edd5278aaf94;
 Thu, 01 Jul 2021 09:56:55 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619un5NC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:49 +0200 (CEST)
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
X-Inumbo-ID: d5bf76a4-ed1b-4216-9294-edd5278aaf94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133409;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0ENk4UcCha2plreo4qu8AQV+ZCOBGywsK+BeOcrXNEw=;
    b=hvsGNz2aPTyUlje9u2IN1cqOqVzxnm8zakXYxhY4Dh3rUTNsVHK9vn9sEFbKoLqQrO
    zabF6S0hEqENSsCUFdqV6+pRBRaSAX9Xh7vdUFlHWHowuAvORi+vCclXXQi6Dv7ePMIH
    9KjOwKV6v1TpW4hegVz0r4mxxNUBiFBlYaYCLWWrvXFkR7oVqeNz5dMiuE5QCWmphRoc
    O9UwdBLMExdfaT/LKBbvXao0iIwni+8tyTBpkFELF7ec4Vrjbzsi3DjkizKlFq1eGFBm
    3+sAyGbAF6aMjpoUjwe8iovH4XqJGJI4yBA1O89Lrh2uIZgXvJt7OxE82YUzT/Ryhbi7
    uV8Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 21/40] tools: save: move guest_data array
Date: Thu,  1 Jul 2021 11:56:16 +0200
Message-Id: <20210701095635.15648-22-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move guest_data array into preallocated space.

Because this was allocated with calloc:
Adjust the loop to clear unused entries as needed.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 3994ab3844..c3570e0c9a 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -235,6 +235,8 @@ struct sr_save_arrays {
     struct iovec iov[MAX_BATCH_SIZE + 4];
     /* write_batch */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Pointers to page data to send. Mapped gfns or local allocations. */
+    void *guest_data[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 0f02988ff9..ea04cb1a74 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -90,7 +90,7 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
+    void **guest_data = ctx->save.m->guest_data;
     void **local_pages = NULL;
     int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -105,12 +105,10 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
 
-    if ( !guest_data || !local_pages )
+    if ( !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -166,7 +164,10 @@ static int write_batch(struct xc_sr_context *ctx)
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
             if ( page_type_has_stream_data(types[i]) == false )
+            {
+                guest_data[i] = NULL;
                 continue;
+            }
 
             if ( errors[p] )
             {
@@ -183,6 +184,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
             if ( rc )
             {
+                guest_data[i] = NULL;
                 if ( rc == -1 && errno == EAGAIN )
                 {
                     set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
@@ -256,7 +258,6 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
     free(local_pages);
-    free(guest_data);
 
     return rc;
 }

