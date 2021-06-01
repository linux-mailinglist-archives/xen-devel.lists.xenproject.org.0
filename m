Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C233D3977FD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135241.251396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7DA-0004kS-Un; Tue, 01 Jun 2021 16:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135241.251396; Tue, 01 Jun 2021 16:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7DA-0004iR-RN; Tue, 01 Jun 2021 16:25:48 +0000
Received: by outflank-mailman (input) for mailman id 135241;
 Tue, 01 Jun 2021 16:25:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo71O-0005Ec-4m
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:13:38 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d8b81a0-24c2-445e-8bf5-5522f279730a;
 Tue, 01 Jun 2021 16:11:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBf1Bg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:41 +0200 (CEST)
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
X-Inumbo-ID: 8d8b81a0-24c2-445e-8bf5-5522f279730a
ARC-Seal: i=1; a=rsa-sha256; t=1622563901; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G5OeYBgOp4rc5S5+iKFBIEWS9eGrgCUetx3c30jxXTFyLlPt/8S3E7GHAIjEv4nuOe
    u9KDm2Lh5jjV5HxFnlOSmwc685PVtVzjYSFo8qh1f7ni8HLEGO0SmnJWkAQvFGZ/aK/6
    vlW4V9mSThA4t7aKmtzIBgv2JCdcQyuiAQZQcxQ13FsHQ49PjXVYjJq/72QZai+xQ7w+
    ci0Yl2iUJjBTrBlySs2QCK3lXqMe11ZKuMtRZF49GCCacmEhqrEFI/kRowwBVR4ihxsG
    sPCBe4Ehxduhm1vqQT8UE/ksIMEvePcTXzDeXw8B9LdukU0AfyuPzn6oei6fW+Agl+1x
    KwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563901;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=99DJGLqeC4gMgdJU+sFS1vBiF6RF3t97LEFxoh+Df5c=;
    b=UPlmfzGfPdHX7Rpx679A7gEr/Rh5DevSimcqsb7MSgaF2sNDK7GQd1HHqZ4Mra+luv
    W5FmoVa2v2RTE0xaSuT194uFpMCLhVl+bAR8RdIu9ATCND2VOUVKi5icN+6uqcDVrnrw
    RvFsL9q/5Gk6aUikqd3KJaW9YIgLyxT0cFKaqHAcvBaYqb/WD8PTBc1UZ+QK/YY4l5kI
    HkdOCTnxDTMFO30J5SFhV7e7c8VL72uI6AlkUdKkNpY1E1DT8wkPUm7yhgfytUFO5VSs
    3TXXYCexthPQSFOzuV0N0GEI1Tr/4+QgLG1m2KT9RBQQX7vFiUWFuqI7OdidW5RgApKH
    DZCw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563901;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=99DJGLqeC4gMgdJU+sFS1vBiF6RF3t97LEFxoh+Df5c=;
    b=BdiS6ICEIgqUof7q6X9Ukl/wsn1WAeEdDuaC8qU4x4FNoezx3JP08F2ex9qfqxsWVJ
    3iC4+FLlKkgYhf1FeDz6nGTrzME52DIe0IfoxKakuNqJxOvmuO7zroWfjiVNQ+Av/msO
    XDWOM4nAtFa5R0FEPYFcZxdAaRA6V068au/gbTda0ZKWmLBAv1xBK2NR/Oyjp9vuaGD6
    Uj7p0TrjTbVin+AXEDQZEnmSPNc1uXsV2FP8flVPJIgNcDB6bp27m8QVq4a3i5ae59in
    KLBn9iESKOeKjfpUiqKq65yuF60AW95yhSWjRmQUpnCA80IVyrGo3z6C63H9BF5T42c2
    xaBw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 36/38] tools: use superpages during restore of HVM guest
Date: Tue,  1 Jun 2021 18:11:16 +0200
Message-Id: <20210601161118.18986-37-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During creating of a HVM domU meminit_hvm() tries to map superpages.
After save/restore or migration this mapping is lost, everything is
allocated in single pages. This causes a performance degradation after
migration.

Add neccessary code to preallocate a superpage for an incoming chunk of
pfns. In case a pfn was not populated on the sending side, it must be
freed on the receiving side to avoid over-allocation.

The existing code for x86_pv is moved unmodified into its own file.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_dom_x86.c            |   5 -
 tools/libs/guest/xg_private.h            |   5 +
 tools/libs/saverestore/common.c          |   2 -
 tools/libs/saverestore/common.h          |  29 +-
 tools/libs/saverestore/restore.c         |  62 +---
 tools/libs/saverestore/restore_x86_hvm.c | 369 ++++++++++++++++++++++-
 tools/libs/saverestore/restore_x86_pv.c  |  61 +++-
 7 files changed, 455 insertions(+), 78 deletions(-)

diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index d2eb89ce01..ec0d18fd60 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -44,11 +44,6 @@
 
 #define SUPERPAGE_BATCH_SIZE 512
 
-#define SUPERPAGE_2MB_SHIFT   9
-#define SUPERPAGE_2MB_NR_PFNS (1UL << SUPERPAGE_2MB_SHIFT)
-#define SUPERPAGE_1GB_SHIFT   18
-#define SUPERPAGE_1GB_NR_PFNS (1UL << SUPERPAGE_1GB_SHIFT)
-
 #define X86_CR0_PE 0x01
 #define X86_CR0_ET 0x10
 
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 25e46d7ce1..ad3d108c14 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -154,4 +154,9 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
+#define SUPERPAGE_2MB_SHIFT   9
+#define SUPERPAGE_2MB_NR_PFNS (1UL << SUPERPAGE_2MB_SHIFT)
+#define SUPERPAGE_1GB_SHIFT   18
+#define SUPERPAGE_1GB_NR_PFNS (1UL << SUPERPAGE_1GB_SHIFT)
+
 #endif /* XG_PRIVATE_H */
diff --git a/tools/libs/saverestore/common.c b/tools/libs/saverestore/common.c
index 9f1af4e671..09b2983898 100644
--- a/tools/libs/saverestore/common.c
+++ b/tools/libs/saverestore/common.c
@@ -1,5 +1,3 @@
-#include <assert.h>
-
 #include "common.h"
 
 #include <xen-tools/libs.h>
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index f3ee619844..b323c1b71a 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -3,6 +3,7 @@
 
 #include <unistd.h>
 #include <errno.h>
+#include <assert.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -219,6 +220,16 @@ struct xc_sr_restore_ops
      */
     int (*setup)(struct xc_sr_context *ctx);
 
+    /**
+     * Populate PFNs
+     *
+     * Given a set of pfns, obtain memory from Xen to fill the physmap for the
+     * unpopulated subset.
+     */
+    int (*populate_pfns)(struct xc_sr_context *ctx, unsigned count,
+                         const xen_pfn_t *original_pfns, const uint32_t *types);
+
+
     /**
      * Process an individual record from the stream.  The caller shall take
      * care of processing common records (e.g. END, PAGE_DATA).
@@ -366,6 +377,8 @@ struct xc_sr_context
 
             int send_back_fd;
             unsigned long p2m_size;
+            unsigned long max_pages;
+            unsigned long tot_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
 
             /* From Image Header. */
@@ -503,6 +516,14 @@ struct xc_sr_context
                     {
                         /* HVM context blob. */
                         struct xc_sr_blob context;
+
+                        /* Bitmap of currently allocated PFNs during restore. */
+                        struct xg_sr_bitmap attempted_1g;
+                        struct xg_sr_bitmap attempted_2m;
+                        struct xg_sr_bitmap allocated_pfns;
+                        xen_pfn_t prev_populated_pfn;
+                        xen_pfn_t iteration_tracker_pfn;
+                        unsigned long iteration;
                     } restore;
                 };
             } hvm;
@@ -567,14 +588,6 @@ int read_record_header(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhd
 int read_record_data(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr,
                      struct xc_sr_record *rec);
 
-/*
- * This would ideally be private in restore.c, but is needed by
- * x86_pv_localise_page() if we receive pagetables frames ahead of the
- * contents of the frames they point at.
- */
-int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
-                  const xen_pfn_t *original_pfns, const uint32_t *types);
-
 /* Handle a STATIC_DATA_END record. */
 int handle_static_data_end(struct xc_sr_context *ctx);
 
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 0682616f16..d4657e8e57 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -71,63 +71,6 @@ static int read_headers(struct xc_sr_context *ctx)
     return 0;
 }
 
-/*
- * Given a set of pfns, obtain memory from Xen to fill the physmap for the
- * unpopulated subset.  If types is NULL, no page type checking is performed
- * and all unpopulated pfns are populated.
- */
-int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
-                  const xen_pfn_t *original_pfns, const uint32_t *types)
-{
-    xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
-        *pfns = ctx->restore.m->pp_pfns;
-    unsigned int i, nr_pfns = 0;
-    int rc = -1;
-
-    for ( i = 0; i < count; ++i )
-    {
-        if ( (!types ||
-              (types && page_type_has_stream_data(types[i]) == true)) &&
-             !pfn_is_populated(ctx, original_pfns[i]) )
-        {
-            rc = pfn_set_populated(ctx, original_pfns[i]);
-            if ( rc )
-                goto err;
-            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
-            ++nr_pfns;
-        }
-    }
-
-    if ( nr_pfns )
-    {
-        rc = xc_domain_populate_physmap_exact(
-            xch, ctx->domid, nr_pfns, 0, 0, mfns);
-        if ( rc )
-        {
-            PERROR("Failed to populate physmap");
-            goto err;
-        }
-
-        for ( i = 0; i < nr_pfns; ++i )
-        {
-            if ( mfns[i] == INVALID_MFN )
-            {
-                ERROR("Populate physmap failed for pfn %u", i);
-                rc = -1;
-                goto err;
-            }
-
-            ctx->restore.ops.set_gfn(ctx, pfns[i], mfns[i]);
-        }
-    }
-
-    rc = 0;
-
- err:
-    return rc;
-}
-
 static int handle_static_data_end_v2(struct xc_sr_context *ctx)
 {
     int rc = 0;
@@ -270,7 +213,7 @@ static int map_guest_pages(struct xc_sr_context *ctx,
     uint32_t i, p;
     int rc;
 
-    rc = populate_pfns(ctx, pages->count, m->pfns, m->types);
+    rc = ctx->restore.ops.populate_pfns(ctx, pages->count, m->pfns, m->types);
     if ( rc )
     {
         ERROR("Failed to populate pfns for batch of %u pages", pages->count);
@@ -1077,6 +1020,9 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
         return -1;
     }
 
+    /* See xc_domain_getinfo */
+    ctx.restore.max_pages = ctx.dominfo.max_memkb >> (PAGE_SHIFT-10);
+    ctx.restore.tot_pages = ctx.dominfo.nr_pages;
     ctx.restore.p2m_size = nr_pfns;
     ctx.restore.ops = ctx.dominfo.hvm
         ? restore_ops_x86_hvm : restore_ops_x86_pv;
diff --git a/tools/libs/saverestore/restore_x86_hvm.c b/tools/libs/saverestore/restore_x86_hvm.c
index 73f17b7fcb..79bcf07e04 100644
--- a/tools/libs/saverestore/restore_x86_hvm.c
+++ b/tools/libs/saverestore/restore_x86_hvm.c
@@ -130,6 +130,25 @@ static int x86_hvm_localise_page(struct xc_sr_context *ctx,
     return 0;
 }
 
+static bool x86_hvm_expand_sp_bitmaps(struct xc_sr_context *ctx, unsigned long max_pfn)
+{
+    struct xg_sr_bitmap *bm;
+
+    bm = &ctx->x86.hvm.restore.attempted_1g;
+    if ( !xg_sr_bitmap_expand(bm, max_pfn >> SUPERPAGE_1GB_SHIFT) )
+        return false;
+
+    bm = &ctx->x86.hvm.restore.attempted_2m;
+    if ( !xg_sr_bitmap_expand(bm, max_pfn >> SUPERPAGE_2MB_SHIFT) )
+        return false;
+
+    bm = &ctx->x86.hvm.restore.allocated_pfns;
+    if ( !xg_sr_bitmap_expand(bm, max_pfn) )
+        return false;
+
+    return true;
+}
+
 /*
  * restore_ops function. Confirms the stream matches the domain.
  */
@@ -164,12 +183,20 @@ static int x86_hvm_setup(struct xc_sr_context *ctx)
 
     max_pfn = max(ctx->restore.p2m_size, ctx->dominfo.max_memkb >> (PAGE_SHIFT-10));
     if ( !xg_sr_bitmap_expand(&ctx->restore.populated_pfns, max_pfn) )
-    {
-        PERROR("Unable to allocate memory for populated_pfns bitmap");
-        return -1;
-    }
+        goto out;
+
+    if ( !x86_hvm_expand_sp_bitmaps(ctx, max_pfn) )
+        goto out;
+
+    /* No superpage in 1st 2MB due to VGA hole */
+    xg_sr_set_bit(0, &ctx->x86.hvm.restore.attempted_1g);
+    xg_sr_set_bit(0, &ctx->x86.hvm.restore.attempted_2m);
 
     return 0;
+
+out:
+    PERROR("Unable to allocate memory for pfn bitmaps");
+    return -1;
 }
 
 /*
@@ -250,6 +277,9 @@ static int x86_hvm_stream_complete(struct xc_sr_context *ctx)
 static int x86_hvm_cleanup(struct xc_sr_context *ctx)
 {
     xg_sr_bitmap_free(&ctx->restore.populated_pfns);
+    xg_sr_bitmap_free(&ctx->x86.hvm.restore.attempted_1g);
+    xg_sr_bitmap_free(&ctx->x86.hvm.restore.attempted_2m);
+    xg_sr_bitmap_free(&ctx->x86.hvm.restore.allocated_pfns);
     free(ctx->x86.hvm.restore.context.ptr);
 
     free(ctx->x86.restore.cpuid.ptr);
@@ -258,6 +288,336 @@ static int x86_hvm_cleanup(struct xc_sr_context *ctx)
     return 0;
 }
 
+/*
+ * Set a range of pfns as allocated
+ */
+static void pfn_set_long_allocated(struct xc_sr_context *ctx, xen_pfn_t base_pfn)
+{
+    xg_sr_set_long_bit(base_pfn, &ctx->x86.hvm.restore.allocated_pfns);
+}
+
+static void pfn_set_allocated(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    xg_sr_set_bit(pfn, &ctx->x86.hvm.restore.allocated_pfns);
+}
+
+struct x86_hvm_sp {
+    xen_pfn_t pfn;
+    xen_pfn_t base_pfn;
+    unsigned long index;
+    unsigned long count;
+};
+
+/*
+ * Try to allocate a 1GB page for this pfn, but avoid Over-allocation.
+ * If this succeeds, mark the range of 2MB pages as busy.
+ */
+static bool x86_hvm_alloc_1g(struct xc_sr_context *ctx, struct x86_hvm_sp *sp)
+{
+    xc_interface *xch = ctx->xch;
+    unsigned int order;
+    int i, done;
+    xen_pfn_t extent;
+
+    /* Only one attempt to avoid overlapping allocation */
+    if ( xg_sr_test_and_set_bit(sp->index, &ctx->x86.hvm.restore.attempted_1g) )
+        return false;
+
+    order = SUPERPAGE_1GB_SHIFT;
+    sp->count = SUPERPAGE_1GB_NR_PFNS;
+
+    /* Allocate only if there is room for another superpage */
+    if ( ctx->restore.tot_pages + sp->count > ctx->restore.max_pages )
+        return false;
+
+    extent = sp->base_pfn = (sp->pfn >> order) << order;
+    done = xc_domain_populate_physmap(xch, ctx->domid, 1, order, 0, &extent);
+    if ( done < 0 ) {
+        PERROR("populate_physmap failed.");
+        return false;
+    }
+    if ( done == 0 )
+        return false;
+
+    DPRINTF("1G %" PRI_xen_pfn "\n", sp->base_pfn);
+
+    /* Mark all 2MB pages as done to avoid overlapping allocation */
+    for ( i = 0; i < (SUPERPAGE_1GB_NR_PFNS/SUPERPAGE_2MB_NR_PFNS); i++ )
+        xg_sr_set_bit((sp->base_pfn >> SUPERPAGE_2MB_SHIFT) + i, &ctx->x86.hvm.restore.attempted_2m);
+
+    return true;
+}
+
+/* Allocate a 2MB page if x86_hvm_alloc_1g failed, avoid Over-allocation. */
+static bool x86_hvm_alloc_2m(struct xc_sr_context *ctx, struct x86_hvm_sp *sp)
+{
+    xc_interface *xch = ctx->xch;
+    unsigned int order;
+    int done;
+    xen_pfn_t extent;
+
+    /* Only one attempt to avoid overlapping allocation */
+    if ( xg_sr_test_and_set_bit(sp->index, &ctx->x86.hvm.restore.attempted_2m) )
+        return false;
+
+    order = SUPERPAGE_2MB_SHIFT;
+    sp->count = SUPERPAGE_2MB_NR_PFNS;
+
+    /* Allocate only if there is room for another superpage */
+    if ( ctx->restore.tot_pages + sp->count > ctx->restore.max_pages )
+        return false;
+
+    extent = sp->base_pfn = (sp->pfn >> order) << order;
+    done = xc_domain_populate_physmap(xch, ctx->domid, 1, order, 0, &extent);
+    if ( done < 0 ) {
+        PERROR("populate_physmap failed.");
+        return false;
+    }
+    if ( done == 0 )
+        return false;
+
+    DPRINTF("2M %" PRI_xen_pfn "\n", sp->base_pfn);
+    return true;
+}
+
+/* Allocate a single page if x86_hvm_alloc_2m failed. */
+static bool x86_hvm_alloc_4k(struct xc_sr_context *ctx, struct x86_hvm_sp *sp)
+{
+    xc_interface *xch = ctx->xch;
+    unsigned int order;
+    int done;
+    xen_pfn_t extent;
+
+    order = 0;
+    sp->count = 1UL;
+
+    /* Allocate only if there is room for another page */
+    if ( ctx->restore.tot_pages + sp->count > ctx->restore.max_pages ) {
+        errno = E2BIG;
+        return false;
+    }
+
+    extent = sp->base_pfn = (sp->pfn >> order) << order;
+    done = xc_domain_populate_physmap(xch, ctx->domid, 1, order, 0, &extent);
+    if ( done < 0 ) {
+        PERROR("populate_physmap failed.");
+        return false;
+    }
+    if ( done == 0 ) {
+        errno = ENOMEM;
+        return false;
+    }
+
+    DPRINTF("4K %" PRI_xen_pfn "\n", sp->base_pfn);
+    return true;
+}
+/*
+ * Attempt to allocate a superpage where the pfn resides.
+ */
+static int x86_hvm_allocate_pfn(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    bool success;
+    unsigned long idx_1g, idx_2m;
+    struct x86_hvm_sp sp = {
+        .pfn = pfn
+    };
+
+    if ( xg_sr_test_bit(pfn, &ctx->x86.hvm.restore.allocated_pfns) )
+        return 0;
+
+    idx_1g = pfn >> SUPERPAGE_1GB_SHIFT;
+    idx_2m = pfn >> SUPERPAGE_2MB_SHIFT;
+
+    sp.index = idx_1g;
+    success = x86_hvm_alloc_1g(ctx, &sp);
+
+    if ( success == false ) {
+        sp.index = idx_2m;
+        success = x86_hvm_alloc_2m(ctx, &sp);
+    }
+
+    if ( success == false ) {
+        sp.index = 0;
+        success = x86_hvm_alloc_4k(ctx, &sp);
+    }
+
+    if ( success == false )
+        return -1;
+
+    do {
+        if ( sp.count >= BITS_PER_LONG ) {
+            sp.count -= BITS_PER_LONG;
+            ctx->restore.tot_pages += BITS_PER_LONG;
+            pfn_set_long_allocated(ctx, sp.base_pfn + sp.count);
+        } else {
+            sp.count--;
+            ctx->restore.tot_pages++;
+            pfn_set_allocated(ctx, sp.base_pfn + sp.count);
+        }
+    } while ( sp.count );
+
+    return 0;
+}
+
+/*
+ * Deallocate memory.
+ * There was likely an optimistic superpage allocation.
+ * This means more pages may have been allocated past gap_end.
+ * This range is not freed now. Incoming higher pfns will release it.
+ */
+static int x86_hvm_punch_hole(struct xc_sr_context *ctx,
+                               xen_pfn_t gap_start, xen_pfn_t gap_end)
+{
+    xc_interface *xch = ctx->xch;
+    xen_pfn_t _pfn, pfn;
+    uint32_t domid, freed = 0;
+    int rc;
+
+    pfn = gap_start >> SUPERPAGE_1GB_SHIFT;
+    do
+    {
+        xg_sr_set_bit(pfn, &ctx->x86.hvm.restore.attempted_1g);
+    } while (++pfn <= gap_end >> SUPERPAGE_1GB_SHIFT);
+
+    pfn = gap_start >> SUPERPAGE_2MB_SHIFT;
+    do
+    {
+        xg_sr_set_bit(pfn, &ctx->x86.hvm.restore.attempted_2m);
+    } while (++pfn <= gap_end >> SUPERPAGE_2MB_SHIFT);
+
+    pfn = gap_start;
+
+    while ( pfn <= gap_end )
+    {
+        if ( xg_sr_test_and_clear_bit(pfn, &ctx->x86.hvm.restore.allocated_pfns) )
+        {
+            domid = ctx->domid;
+            _pfn = pfn;
+            rc = xc_domain_decrease_reservation_exact(xch, domid, 1, 0, &_pfn);
+            if ( rc )
+            {
+                PERROR("Failed to release pfn %" PRI_xen_pfn, pfn);
+                return -1;
+            }
+            ctx->restore.tot_pages--;
+            freed++;
+        }
+        pfn++;
+    }
+    if ( freed )
+        DPRINTF("freed %u between %" PRI_xen_pfn " %" PRI_xen_pfn "\n",
+                freed, gap_start, gap_end);
+    return 0;
+}
+
+static int x86_hvm_unpopulate_page(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    xg_sr_clear_bit(pfn, &ctx->restore.populated_pfns);
+    return x86_hvm_punch_hole(ctx, pfn, pfn);
+}
+
+static int x86_hvm_populate_page(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    xen_pfn_t gap_start, gap_end;
+    bool has_gap, first_iteration;
+    int rc;
+
+    /*
+     * Check for a gap between the previous populated pfn and this pfn.
+     * In case a gap exists, it is required to punch a hole to release memory,
+     * starting after the previous pfn and before this pfn.
+     *
+     * But: this can be done only during the first iteration, which is the
+     * only place there superpage allocations are attempted. All following
+     * iterations lack the info to properly maintain prev_populated_pfn.
+     */
+    has_gap = ctx->x86.hvm.restore.prev_populated_pfn + 1 < pfn;
+    first_iteration = ctx->x86.hvm.restore.iteration == 0;
+    if ( has_gap && first_iteration )
+    {
+        gap_start = ctx->x86.hvm.restore.prev_populated_pfn + 1;
+        gap_end = pfn - 1;
+
+        rc = x86_hvm_punch_hole(ctx, gap_start, gap_end);
+        if ( rc )
+            goto err;
+    }
+
+    rc = x86_hvm_allocate_pfn(ctx, pfn);
+    if ( rc )
+        goto err;
+    pfn_set_populated(ctx, pfn);
+    ctx->x86.hvm.restore.prev_populated_pfn = pfn;
+
+    rc = 0;
+err:
+    return rc;
+}
+
+/*
+ * Try to allocate superpages.
+ * This works without memory map because the pfns arrive in incremental order.
+ * All pfn numbers and their type are submitted.
+ * Only pfns with data will have also pfn content transmitted.
+ */
+static int x86_hvm_populate_pfns(struct xc_sr_context *ctx, unsigned count,
+                                 const xen_pfn_t *original_pfns,
+                                 const uint32_t *types)
+{
+    xc_interface *xch = ctx->xch;
+    xen_pfn_t pfn, min_pfn, max_pfn;
+    bool has_data, populated;
+    unsigned i = count;
+    int rc = 0;
+
+    min_pfn = count ? original_pfns[0] : 0;
+    max_pfn = count ? original_pfns[count - 1] : 0;
+    DPRINTF("batch of %u pfns between %" PRI_xen_pfn " %" PRI_xen_pfn "\n",
+            count, min_pfn, max_pfn);
+
+    if ( !x86_hvm_expand_sp_bitmaps(ctx, max_pfn) )
+    {
+        ERROR("Unable to allocate memory for pfn bitmaps");
+        return -1;
+    }
+
+    /*
+     * There is no indicator for a new iteration.
+     * Simulate it by checking if a lower pfn is coming in.
+     * In the end it matters only to know if this iteration is the first one.
+     */
+    if ( min_pfn < ctx->x86.hvm.restore.iteration_tracker_pfn )
+        ctx->x86.hvm.restore.iteration++;
+    ctx->x86.hvm.restore.iteration_tracker_pfn = min_pfn;
+
+    for ( i = 0; i < count; ++i )
+    {
+        pfn = original_pfns[i];
+
+        has_data = page_type_has_stream_data(types[i]);
+        populated = pfn_is_populated(ctx, pfn);
+
+        /*
+         * page has data, pfn populated: nothing to do
+         * page has data, pfn not populated: likely never seen before
+         * page has no data, pfn populated: likely ballooned out during migration
+         * page has no data, pfn not populated: nothing to do
+         */
+        if ( has_data && !populated )
+        {
+            rc = x86_hvm_populate_page(ctx, pfn);
+        } else if ( !has_data && populated )
+        {
+            rc = x86_hvm_unpopulate_page(ctx, pfn);
+        }
+        if ( rc )
+            break;
+    }
+
+    return rc;
+}
+
+
 struct xc_sr_restore_ops restore_ops_x86_hvm =
 {
     .pfn_is_valid    = x86_hvm_pfn_is_valid,
@@ -266,6 +626,7 @@ struct xc_sr_restore_ops restore_ops_x86_hvm =
     .set_page_type   = x86_hvm_set_page_type,
     .localise_page   = x86_hvm_localise_page,
     .setup           = x86_hvm_setup,
+    .populate_pfns   = x86_hvm_populate_pfns,
     .process_record  = x86_hvm_process_record,
     .static_data_complete = x86_static_data_complete,
     .stream_complete = x86_hvm_stream_complete,
diff --git a/tools/libs/saverestore/restore_x86_pv.c b/tools/libs/saverestore/restore_x86_pv.c
index bdaa0c0e76..f4f0f49dee 100644
--- a/tools/libs/saverestore/restore_x86_pv.c
+++ b/tools/libs/saverestore/restore_x86_pv.c
@@ -959,6 +959,64 @@ static void x86_pv_set_gfn(struct xc_sr_context *ctx, xen_pfn_t pfn,
         ((uint32_t *)ctx->x86.pv.p2m)[pfn] = mfn;
 }
 
+/*
+ * Given a set of pfns, obtain memory from Xen to fill the physmap for the
+ * unpopulated subset.  If types is NULL, no page type checking is performed
+ * and all unpopulated pfns are populated.
+ */
+static int x86_pv_populate_pfns(struct xc_sr_context *ctx, unsigned count,
+                                const xen_pfn_t *original_pfns,
+                                const uint32_t *types)
+{
+    xc_interface *xch = ctx->xch;
+    xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
+        *pfns = ctx->restore.m->pp_pfns;
+    unsigned int i, nr_pfns = 0;
+    int rc = -1;
+
+    for ( i = 0; i < count; ++i )
+    {
+        if ( (!types ||
+              (types && page_type_has_stream_data(types[i]) == true)) &&
+             !pfn_is_populated(ctx, original_pfns[i]) )
+        {
+            rc = pfn_set_populated(ctx, original_pfns[i]);
+            if ( rc )
+                goto err;
+            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
+            ++nr_pfns;
+        }
+    }
+
+    if ( nr_pfns )
+    {
+        rc = xc_domain_populate_physmap_exact(
+            xch, ctx->domid, nr_pfns, 0, 0, mfns);
+        if ( rc )
+        {
+            PERROR("Failed to populate physmap");
+            goto err;
+        }
+
+        for ( i = 0; i < nr_pfns; ++i )
+        {
+            if ( mfns[i] == INVALID_MFN )
+            {
+                ERROR("Populate physmap failed for pfn %u", i);
+                rc = -1;
+                goto err;
+            }
+
+            ctx->restore.ops.set_gfn(ctx, pfns[i], mfns[i]);
+        }
+    }
+
+    rc = 0;
+
+ err:
+    return rc;
+}
+
 /*
  * restore_ops function.  Convert pfns back to mfns in pagetables.  Possibly
  * needs to populate new frames if a PTE is found referring to a frame which
@@ -1003,7 +1061,7 @@ static int x86_pv_localise_page(struct xc_sr_context *ctx,
         }
     }
 
-    if ( to_populate && populate_pfns(ctx, to_populate, pfns, NULL) )
+    if ( to_populate && x86_pv_populate_pfns(ctx, to_populate, pfns, NULL) )
         return -1;
 
     for ( i = 0; i < (PAGE_SIZE / sizeof(uint64_t)); ++i )
@@ -1200,6 +1258,7 @@ struct xc_sr_restore_ops restore_ops_x86_pv =
     .set_gfn         = x86_pv_set_gfn,
     .localise_page   = x86_pv_localise_page,
     .setup           = x86_pv_setup,
+    .populate_pfns   = x86_pv_populate_pfns,
     .process_record  = x86_pv_process_record,
     .static_data_complete = x86_static_data_complete,
     .stream_complete = x86_pv_stream_complete,

