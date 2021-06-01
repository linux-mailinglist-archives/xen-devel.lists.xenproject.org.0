Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535A3977A2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134990.251084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zj-0000PF-O6; Tue, 01 Jun 2021 16:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134990.251084; Tue, 01 Jun 2021 16:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zj-0000ES-CT; Tue, 01 Jun 2021 16:11:55 +0000
Received: by outflank-mailman (input) for mailman id 134990;
 Tue, 01 Jun 2021 16:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zh-0005X1-Vz
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:54 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 083036e1-0830-4d8b-ad5b-37494827089f;
 Tue, 01 Jun 2021 16:11:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBT1BF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:29 +0200 (CEST)
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
X-Inumbo-ID: 083036e1-0830-4d8b-ad5b-37494827089f
ARC-Seal: i=1; a=rsa-sha256; t=1622563889; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=j23TsGK+nbxG3edYgJTv/d8uKBKj6wrHbhV04xpLKdY0XkbgSQOZXCoPHjLAWlM3Pk
    QonfCPg1lvOQ+Hy1IK2zwotH1I570y4bmoWrDHqw6L4VWs0XnuKvdtgvt5qDq0I+17S5
    0Kke+8CmT63dwlYE8S6GVNSlIf6TTGhwqK8reIMvhJevQk5sG7BXpIMe8wmptslDGnp0
    imOeMDiupWnNsBUmtDjrT38rRQLotHqptcfcCcmpasdlrsQnTXm1i3/Q26CHAGJfUuaV
    euTLK+cqnPBiLGlXDxqjxu79d8JRY+kq8rheD1fDXfijG8RyKijsKpG9WYuV9GI8WCcN
    45Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563889;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E7wVU3AYom1qSRf+sliiKc9mzY5OMMBLqGFhTssnmUM=;
    b=OTb0QjhiXLeVWtHNw8GQlI1+c5r0H2nPn3R+l6SKShj2rIwf+kb4lGnsFLWkHF2LbJ
    EyVEHbc49qRnZ3wd9FLhGNzanaF/ZLDFSoPAeoA2kTxTZv2vxAEmJn3k29MlzMgYLmIs
    yN0Y7QnLCKBvQYuEpNhcG0NPSV8RiFVNfV3KFyFxhtkK9/ERFdIecPyq16ep0MHY88YT
    waayuplCtyhIhoPP/bx3HgI7b5KQU6k57gq6CEtsCpGlfgpSBGuW2r4L6DCOaUhlhjS+
    2QRv7wsTBEv2Js0gWjUWZmOOCRXsRbRO7hyNZfoCAYokV9MDq7cdiucs4TtX+J7e8aLE
    8YoA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563889;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E7wVU3AYom1qSRf+sliiKc9mzY5OMMBLqGFhTssnmUM=;
    b=cVcv1Crx7fTfkauGUpNoOIuyaysmjNizIy2vMBgKV15/N5Rh3KQeueIMpvMWtFe3PJ
    S03OxF0ICFBINoo7HNh5D3xnVEJWfvBLrz6d5hP1RJpL4N5wwdw60OSklwOHdP9Ko53x
    W9XYO8zNS4E7M7LH1v6mjlYyDhhuBEFqz2QCi5Z0HH4mfl3MkXSeEKXbRdZZJCb1MuVW
    DLhIL9Bgg/msb0MxWq8xtRAdMwVIkWZvwhJF5zqJgF99GcAQG2Y/c8UcwcuIP4BfFk1s
    4JZrkIbElRkzQE12k65ydyhT+/Amxzz+LEkyhBn/jUFkO+Kdp8G//YHk2ze3tsPxhqeb
    3Ucg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 10/38] tools/guest: save: move batch_pfns
Date: Tue,  1 Jun 2021 18:10:50 +0200
Message-Id: <20210601161118.18986-11-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The batch_pfns array is already allocated in advance.
Move it into the preallocated area.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h |  2 +-
 tools/libs/saverestore/save.c   | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 80b2e878aa..0d94a4c01e 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -224,6 +224,7 @@ static inline int update_blob(struct xc_sr_blob *blob,
 }
 
 struct xc_sr_save_arrays {
+    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
@@ -261,7 +262,6 @@ struct xc_sr_context
 
             struct precopy_stats stats;
 
-            xen_pfn_t *batch_pfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 1662e3ee50..b11ce70a11 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -77,7 +77,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
- * is constructed in ctx->save.batch_pfns.
+ * is constructed in ctx->save.m->batch_pfns.
  *
  * This function:
  * - gets the types for each pfn in the batch.
@@ -128,12 +128,12 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; i < nr_pfns; ++i )
     {
         types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
-                                                      ctx->save.batch_pfns[i]);
+                                                      ctx->save.m->batch_pfns[i]);
 
         /* Likely a ballooned page. */
         if ( mfns[i] == INVALID_MFN )
         {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+            set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
         }
     }
@@ -179,7 +179,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      ctx->save.m->batch_pfns[i], mfns[p], errors[p]);
                 goto err;
             }
 
@@ -193,7 +193,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                    set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
@@ -224,7 +224,7 @@ static int write_batch(struct xc_sr_context *ctx)
     rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.m->batch_pfns[i];
 
     iov[0].iov_base = &rec.type;
     iov[0].iov_len = sizeof(rec.type);
@@ -296,9 +296,9 @@ static int flush_batch(struct xc_sr_context *ctx)
 
     if ( !rc )
     {
-        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.batch_pfns,
+        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.m->batch_pfns,
                                     MAX_BATCH_SIZE *
-                                    sizeof(*ctx->save.batch_pfns));
+                                    sizeof(*ctx->save.m->batch_pfns));
     }
 
     return rc;
@@ -315,7 +315,7 @@ static int add_to_batch(struct xc_sr_context *ctx, xen_pfn_t pfn)
         rc = flush_batch(ctx);
 
     if ( rc == 0 )
-        ctx->save.batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
+        ctx->save.m->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
 
     return rc;
 }
@@ -850,14 +850,12 @@ static int setup(struct xc_sr_context *ctx)
 
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
-                                  sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
     ctx->save.m = malloc(sizeof(*ctx->save.m));
 
-    if ( !ctx->save.m || !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.m || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
+        ERROR("Unable to allocate memory for dirty bitmaps and"
               " deferred pages");
         rc = -1;
         errno = ENOMEM;
@@ -886,7 +884,6 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
     free(ctx->save.m);
 }
 

