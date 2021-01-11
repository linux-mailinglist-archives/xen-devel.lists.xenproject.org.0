Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC52F1D0F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65239.115655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Ki-00074x-DA; Mon, 11 Jan 2021 17:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65239.115655; Mon, 11 Jan 2021 17:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Ki-00073h-2F; Mon, 11 Jan 2021 17:50:24 +0000
Received: by outflank-mailman (input) for mailman id 65239;
 Mon, 11 Jan 2021 17:50:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1E2-0002a6-1S
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:30 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5170966b-0122-4145-8ec4-de86e372a3f2;
 Mon, 11 Jan 2021 17:42:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgaM3c
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:36 +0100 (CET)
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
X-Inumbo-ID: 5170966b-0122-4145-8ec4-de86e372a3f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386963;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=LAbTzMBle1Dy2szOHQ5Um5vr1FEev2MySdpTClRInrA=;
	b=HMIDeQQFo6fJA/sHBYZM6Nop5lPnT0l3SS0ZXoIi1FIakGyK6sN9ndy+ljRr5BVn0o
	oMpkrk51Vu0m2M8uc/M+DV831l7EZUykO8j+KdwwNQC1TU4i/cNWlN2edTlV1tOBsU2L
	Jtl623GeBmt3nbjz4KRmO7Dov+UUqpcqKw0vHFy3HPQTy63fzYs0cw0Wbq2aQb9lsXsO
	A8X0xVNAiLiEnPNOrv3UCf8wy6Uo3G8brF+ChGdGNYy8RSOl3QYlvu9lnjE3np/jMiU6
	niIc6Qpy41Tc+aDmWv7yFFEwMGHdMAS4/Yqp73oAghPzIKCe6G1ApebaQSI5yxHkULPg
	LcCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 22/39] tools/guest: save: move local_pages array
Date: Mon, 11 Jan 2021 18:42:07 +0100
Message-Id: <20210111174224.24714-23-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move local_pages array into preallocated space.

Adjust the code to use the src page as is in case of HVM.
In case of PV the page may need to be normalised, use an private memory
area for this purpose.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h       | 22 ++++++++++---------
 tools/libs/guest/xg_sr_save.c         | 25 +++------------------
 tools/libs/guest/xg_sr_save_x86_hvm.c |  5 +++--
 tools/libs/guest/xg_sr_save_x86_pv.c  | 31 ++++++++++++++++++---------
 4 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 33e66678c6..2a020fef5c 100644
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
@@ -371,6 +367,12 @@ struct xc_sr_context
 
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
index a571246894..e724ba9cb8 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -91,11 +91,10 @@ static int write_batch(struct xc_sr_context *ctx)
     xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
     void **guest_data = ctx->save.m->guest_data;
-    void **local_pages = NULL;
     int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
-    void *page, *orig_page;
+    void *src;
     uint64_t *rec_pfns = ctx->save.m->rec_pfns;
     struct iovec *iov = ctx->save.m->iov; int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
@@ -105,16 +104,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
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
         types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
@@ -176,11 +165,8 @@ static int write_batch(struct xc_sr_context *ctx)
                 goto err;
             }
 
-            orig_page = page = guest_mapping + (p * PAGE_SIZE);
-            rc = ctx->save.ops.normalise_page(ctx, types[i], &page);
-
-            if ( orig_page != page )
-                local_pages[i] = page;
+            src = guest_mapping + (p * PAGE_SIZE);
+            rc = ctx->save.ops.normalise_page(ctx, types[i], src, i, &guest_data[i]);
 
             if ( rc )
             {
@@ -195,8 +181,6 @@ static int write_batch(struct xc_sr_context *ctx)
                 else
                     goto err;
             }
-            else
-                guest_data[i] = page;
 
             rc = -1;
             ++p;
@@ -255,9 +239,6 @@ static int write_batch(struct xc_sr_context *ctx)
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
index 4964f1f7b8..8165306354 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -999,29 +999,31 @@ static xen_pfn_t x86_pv_pfn_to_gfn(const struct xc_sr_context *ctx,
  * save_ops function.  Performs pagetable normalisation on appropriate pages.
  */
 static int x86_pv_normalise_page(struct xc_sr_context *ctx, xen_pfn_t type,
-                                 void **page)
+                                  void *src, unsigned int idx, void **ptr)
 {
     xc_interface *xch = ctx->xch;
-    void *local_page;
     int rc;
+    void *dst;
 
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
+    dst = ctx->x86.pv.save.normalised_pages + idx * PAGE_SIZE;
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

