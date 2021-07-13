Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B73C7623
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155546.287214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnq-0006Py-6Z; Tue, 13 Jul 2021 18:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155546.287214; Tue, 13 Jul 2021 18:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnp-0006JK-WC; Tue, 13 Jul 2021 18:06:42 +0000
Received: by outflank-mailman (input) for mailman id 155546;
 Tue, 13 Jul 2021 18:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mnn-0002UL-Gf
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:39 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2477b7d6-a2ac-427c-997e-ddef9a8e3457;
 Tue, 13 Jul 2021 18:06:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6GtAu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:16 +0200 (CEST)
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
X-Inumbo-ID: 2477b7d6-a2ac-427c-997e-ddef9a8e3457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199576;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=PTsQYvP6bBBv2G619w4kDBe3knppN9bIh+m3fSDyz7g=;
    b=labA6MsB39oPGMVWJ22VGeOWY5y7tTfBKBx4UIM2aUQZlpcy9RdUZznD48oXJr59r0
    OyZu/zfPUIW0DdeKGmOZVUNP9eWyUIUtx1ZMgW4iZg4pgWkKeujB1EF3YS2NHRZHJUOM
    fxA62Cai41o4FMSSEugvI8eB1FHwvozRY5qEatmTqL9Ci3e16J6xuRD/jXClDQpPHDzT
    QrlPb3/2mUJrVV9fkFepPsMXn+dLRcZ9gnLru61HaTJQhiZsce8jYIOIHHM8LsYzq1nw
    QpNCFLjOLXFk84j/rkTUM/H0w9L5GehLvB+4H+m6qDK+RC67FCTfXLojplWANNmJtqwf
    j6bA==
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
Subject: [PATCH v20210713 13/31] tools: save: preallocate local_pages array
Date: Tue, 13 Jul 2021 20:05:47 +0200
Message-Id: <20210713180605.12096-14-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in a batch.
Allocate the space once.

Adjust the code to use the unmodified src page in case of HVM.
In case of PV the page may need to be normalised, use a private memory
area for this purpose.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h       | 22 ++++++++++---------
 tools/libs/guest/xg_sr_save.c         | 26 ++++------------------
 tools/libs/guest/xg_sr_save_x86_hvm.c |  5 +++--
 tools/libs/guest/xg_sr_save_x86_pv.c  | 31 ++++++++++++++++++---------
 4 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index b90b35e564..34d4c15b22 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -33,16 +33,12 @@ struct xc_sr_save_ops
      * Optionally transform the contents of a page from being specific to the
      * sending environment, to being generic for the stream.
      *
-     * The page of data at the end of 'page' may be a read-only mapping of a
-     * running guest; it must not be modified.  If no transformation is
-     * required, the callee should leave '*pages' untouched.
+     * The page of data '*src' may be a read-only mapping of a running guest;
+     * it must not be modified. If no transformation is required, the callee
+     * should leave '*src' untouched, and return it via '**ptr'.
      *
-     * If a transformation is required, the callee should allocate themselves
-     * a local page using malloc() and return it via '*page'.
-     *
-     * The caller shall free() '*page' in all cases.  In the case that the
-     * callee encounters an error, it should *NOT* free() the memory it
-     * allocated for '*page'.
+     * If a transformation is required, the callee should provide the
+     * transformed page in a private buffer and return it via '**ptr'.
      *
      * It is valid to fail with EAGAIN if the transformation is not able to be
      * completed at this point.  The page shall be retried later.
@@ -50,7 +46,7 @@ struct xc_sr_save_ops
      * @returns 0 for success, -1 for failure, with errno appropriately set.
      */
     int (*normalise_page)(struct xc_sr_context *ctx, xen_pfn_t type,
-                          void **page);
+                          void *src, unsigned int idx, void **ptr);
 
     /**
      * Set up local environment to save a domain. (Typically querying
@@ -357,6 +353,12 @@ struct xc_sr_context
 
                 union
                 {
+                    struct
+                    {
+                        /* Used by write_batch for modified pages. */
+                        void *normalised_pages;
+                    } save;
+
                     struct
                     {
                         /* State machine for the order of received records. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 0ab8b7205c..c74c8d9348 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -89,11 +89,10 @@ static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     void *guest_mapping = NULL;
-    void **local_pages = NULL;
     int rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
-    void *page, *orig_page;
+    void *src;
     int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
@@ -102,16 +101,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Pointers to locally allocated pages.  Need freeing. */
-    local_pages = calloc(nr_pfns, sizeof(*local_pages));
-
-    if ( !local_pages )
-    {
-        ERROR("Unable to allocate arrays for a batch of %u pages",
-              nr_pfns);
-        goto err;
-    }
-
     for ( i = 0; i < nr_pfns; ++i )
     {
         ctx->save.types[i] = ctx->save.mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
@@ -175,11 +164,9 @@ static int write_batch(struct xc_sr_context *ctx)
                 goto err;
             }
 
-            orig_page = page = guest_mapping + (p * PAGE_SIZE);
-            rc = ctx->save.ops.normalise_page(ctx, ctx->save.types[i], &page);
-
-            if ( orig_page != page )
-                local_pages[i] = page;
+            src = guest_mapping + (p * PAGE_SIZE);
+            rc = ctx->save.ops.normalise_page(ctx, ctx->save.types[i], src, i,
+                                              &ctx->save.guest_data[i]);
 
             if ( rc )
             {
@@ -194,8 +181,6 @@ static int write_batch(struct xc_sr_context *ctx)
                 else
                     goto err;
             }
-            else
-                ctx->save.guest_data[i] = page;
 
             rc = -1;
             ++p;
@@ -256,9 +241,6 @@ static int write_batch(struct xc_sr_context *ctx)
  err:
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
-    for ( i = 0; local_pages && i < nr_pfns; ++i )
-        free(local_pages[i]);
-    free(local_pages);
 
     return rc;
 }
diff --git a/tools/libs/guest/xg_sr_save_x86_hvm.c b/tools/libs/guest/xg_sr_save_x86_hvm.c
index 1634a7bc43..11232b9f1d 100644
--- a/tools/libs/guest/xg_sr_save_x86_hvm.c
+++ b/tools/libs/guest/xg_sr_save_x86_hvm.c
@@ -129,9 +129,10 @@ static xen_pfn_t x86_hvm_pfn_to_gfn(const struct xc_sr_context *ctx,
     return pfn;
 }
 
-static int x86_hvm_normalise_page(struct xc_sr_context *ctx,
-                                  xen_pfn_t type, void **page)
+static int x86_hvm_normalise_page(struct xc_sr_context *ctx, xen_pfn_t type,
+                                  void *src, unsigned int idx, void **ptr)
 {
+    *ptr = src;
     return 0;
 }
 
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..defc044001 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -999,29 +999,31 @@ static xen_pfn_t x86_pv_pfn_to_gfn(const struct xc_sr_context *ctx,
  * save_ops function.  Performs pagetable normalisation on appropriate pages.
  */
 static int x86_pv_normalise_page(struct xc_sr_context *ctx, xen_pfn_t type,
-                                 void **page)
+                                 void *src, unsigned int idx, void **ptr)
 {
     xc_interface *xch = ctx->xch;
-    void *local_page;
+    void *dst;
     int rc;
 
     type &= XEN_DOMCTL_PFINFO_LTABTYPE_MASK;
 
     if ( type < XEN_DOMCTL_PFINFO_L1TAB || type > XEN_DOMCTL_PFINFO_L4TAB )
+    {
+        *ptr = src;
         return 0;
+    }
 
-    local_page = malloc(PAGE_SIZE);
-    if ( !local_page )
+    if ( idx >= MAX_BATCH_SIZE )
     {
-        ERROR("Unable to allocate scratch page");
-        rc = -1;
-        goto out;
+        ERROR("idx %u out of range", idx);
+        errno = ERANGE;
+        return -1;
     }
 
-    rc = normalise_pagetable(ctx, *page, local_page, type);
-    *page = local_page;
+    dst = ctx->x86.pv.save.normalised_pages + (idx * PAGE_SIZE);
+    rc = normalise_pagetable(ctx, src, dst, type);
+    *ptr = dst;
 
- out:
     return rc;
 }
 
@@ -1031,8 +1033,16 @@ static int x86_pv_normalise_page(struct xc_sr_context *ctx, xen_pfn_t type,
  */
 static int x86_pv_setup(struct xc_sr_context *ctx)
 {
+    xc_interface *xch = ctx->xch;
     int rc;
 
+    ctx->x86.pv.save.normalised_pages = malloc(MAX_BATCH_SIZE * PAGE_SIZE);
+    if ( !ctx->x86.pv.save.normalised_pages )
+    {
+        PERROR("Failed to allocate normalised_pages");
+        return -1;
+    }
+
     rc = x86_pv_domain_info(ctx);
     if ( rc )
         return rc;
@@ -1118,6 +1128,7 @@ static int x86_pv_check_vm_state(struct xc_sr_context *ctx)
 
 static int x86_pv_cleanup(struct xc_sr_context *ctx)
 {
+    free(ctx->x86.pv.save.normalised_pages);
     free(ctx->x86.pv.p2m_pfns);
 
     if ( ctx->x86.pv.p2m )

