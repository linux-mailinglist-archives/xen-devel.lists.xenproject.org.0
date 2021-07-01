Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE3E3B9027
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148369.274328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRp-0003jI-ML; Thu, 01 Jul 2021 09:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148369.274328; Thu, 01 Jul 2021 09:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRp-0003cV-8L; Thu, 01 Jul 2021 09:57:29 +0000
Received: by outflank-mailman (input) for mailman id 148369;
 Thu, 01 Jul 2021 09:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRn-0004r4-H2
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:27 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7318a437-6aec-4f53-a2a0-10214f3fbcac;
 Thu, 01 Jul 2021 09:56:57 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619un5NE
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
X-Inumbo-ID: 7318a437-6aec-4f53-a2a0-10214f3fbcac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133409;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=VXXP7tsnRC41xaA88qzwrHhQNrSFmDSbSlav6Il7DHM=;
    b=nek8SgSXMYp0YyFkVQajq+6uAJthx4pNaB9Z7RNljK3npjfWHTOJMlzeveUeT19Qxh
    C/fpM2lj2ShtHYL2QqLRL5+Qe7jOSTRRdMFpFspPLIy0nC5Dqcico76IlIqTmOHTTdQ2
    xKw2M4fnke3Z4OivG0VsFPM9ddzkhn7LgJhb2K5dcjmMm2ExIl+Ul5F5tG6TyxpS2c0M
    DIZQu4aL5NWfl2XkGcIukLAwSql3alv6ieqLDsyD87t5zbw9uZv3pZbrZHLI2XqEvire
    GsMFVQpwxh3d02bJrqCatpgwaFVPsd2R9skFSpklyDUoKVBpx4tonUlnlAM7p/JJZjTs
    Wsfw==
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
Subject: [PATCH v20210701 22/40] tools: save: move local_pages array
Date: Thu,  1 Jul 2021 11:56:17 +0200
Message-Id: <20210701095635.15648-23-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move local_pages array into preallocated space.

Adjust the code to use the src page as is in case of HVM.
In case of PV the page may need to be normalised, use a private memory
area for this purpose.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h       | 22 ++++++++++---------
 tools/libs/saverestore/save.c         | 25 +++------------------
 tools/libs/saverestore/save_x86_hvm.c |  5 +++--
 tools/libs/saverestore/save_x86_pv.c  | 31 ++++++++++++++++++---------
 4 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index c3570e0c9a..8089449011 100644
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
@@ -385,6 +381,12 @@ struct xc_sr_context
 
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
index ea04cb1a74..fa83648f9a 100644
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

