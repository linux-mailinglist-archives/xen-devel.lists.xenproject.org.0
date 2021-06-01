Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B663977AC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134998.251131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zu-0002hP-6I; Tue, 01 Jun 2021 16:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134998.251131; Tue, 01 Jun 2021 16:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zu-0002Zn-0M; Tue, 01 Jun 2021 16:12:06 +0000
Received: by outflank-mailman (input) for mailman id 134998;
 Tue, 01 Jun 2021 16:12:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zr-0005X1-WB
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:04 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1163992d-2102-4ff6-ab5b-775defa88b61;
 Tue, 01 Jun 2021 16:11:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBW1BM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:32 +0200 (CEST)
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
X-Inumbo-ID: 1163992d-2102-4ff6-ab5b-775defa88b61
ARC-Seal: i=1; a=rsa-sha256; t=1622563893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lWWIEL9HC5km8WOt/x3R4+rqn5v1bNFWvkPAbSkrUqYNkp40AlmE6jjiYWVCydo/ob
    csPuquEqrRfkmBqzA2eOKcigfbX13plTo6qbUGjDiRI4GKM2sgI7cI78zMFo42m/q9CX
    6s0EkpCc7ePlmNhxXycWZKTN2DRHoWSNS2/2Ej/YhTGanXeMyP4FO7OlGTrncwoukc5u
    YZufV3hndVO0e3fWcdoXqwWNQNmfD0tDw8Y/AKVi5AQRnOy9MZ+fsStZIlvZJgzYNR9/
    neFvRkC/JRKGOI0Jd7M4pbOdnqmClisEC8v9ruyrOb4GKHSfBOTUTk3EX4+8mrw36AR2
    daKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563893;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Dd4NjKNzHYeI+VwgjA8Sp8NfOu58WGHDpSZRBu7+Wsk=;
    b=G5Ov9oYy7ggp6gy5d/idYUXaeC4ExsmevB8T8+Tk5hYvfGjjVfWqU9hg5pih+WPZU0
    UGGfxm+qTKuIzEXYbk7ZnS4k2cTZzxigRIp6WwHub37qlKRhSfhSiS3xy33pvf+2cRtH
    K9WYQoZa3WTI5Ka+VX7PLWfRAieXMU6UA3YotYlavahITjflfpyO1Orc/sC1sDvN3xfK
    ySNUQy3fxfLW3LxQNQvgi/JznZAl/TsSTlPo1K4bQAGSRqxPtk2V4XjMN76VbF+p1+iB
    U+GkoeB0ngJ02Nu+7FSHlXkNI/VSwwZP7fEFfWrCltKyiXlmzvKexU0P++hfxYLx4lpa
    qWaw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563893;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Dd4NjKNzHYeI+VwgjA8Sp8NfOu58WGHDpSZRBu7+Wsk=;
    b=l5ArMBsKjU3Cb1YbyVURF8KFBTeNuE4kMQPXKk54t54hF8bKl8uN5LntfGydG/oOXT
    sjjbN7zNm6V+sjUOlxEFhYY5Wowydxq/jH4fHpbS8zrvVRWcXMn/8DX9l/gS3cD9h7K8
    4C2uaU6MIHe9c/qQHO6OqvNinsxN7g38ru7a3wM3G3qi1EYxD+D6AUtXVxNGjKeErbVi
    K0myJDlx3iOOWToTjmcUqVEJb6Z4P1SXAbYvjOU5ROPMfRNw0heamWJ5zde9HcmjWVcx
    fwSjDvdVkySrA3GUophNuENcxZIwwoBjv6AzQP9iQeeBywPAESZtn31N+0BhWGUY2/OO
    kmvg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 17/38] tools/guest: save: move local_pages array
Date: Tue,  1 Jun 2021 18:10:57 +0200
Message-Id: <20210601161118.18986-18-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move local_pages array into preallocated space.

Adjust the code to use the src page as is in case of HVM.
In case of PV the page may need to be normalised, use an private memory
area for this purpose.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h       | 22 ++++++++++---------
 tools/libs/saverestore/save.c         | 25 +++------------------
 tools/libs/saverestore/save_x86_hvm.c |  5 +++--
 tools/libs/saverestore/save_x86_pv.c  | 31 ++++++++++++++++++---------
 4 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 098aa39667..0e03b0731c 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -45,16 +45,12 @@ struct xc_sr_save_ops
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
@@ -62,7 +58,7 @@ struct xc_sr_save_ops
      * @returns 0 for success, -1 for failure, with errno appropriately set.
      */
     int (*normalise_page)(struct xc_sr_context *ctx, xen_pfn_t type,
-                          void **page);
+                          void *src, unsigned int idx, void **ptr);
 
     /**
      * Set up local environment to save a domain. (Typically querying
@@ -383,6 +379,12 @@ struct xc_sr_context
 
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
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index c4fd9a15f0..c4876ba24c 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
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
diff --git a/tools/libs/saverestore/save_x86_hvm.c b/tools/libs/saverestore/save_x86_hvm.c
index 91c2cb99ab..26f49ee267 100644
--- a/tools/libs/saverestore/save_x86_hvm.c
+++ b/tools/libs/saverestore/save_x86_hvm.c
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
 
diff --git a/tools/libs/saverestore/save_x86_pv.c b/tools/libs/saverestore/save_x86_pv.c
index 92f77fad0f..159ff59480 100644
--- a/tools/libs/saverestore/save_x86_pv.c
+++ b/tools/libs/saverestore/save_x86_pv.c
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

