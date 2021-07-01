Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D889B3B903F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148441.274432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWH-0003PX-DM; Thu, 01 Jul 2021 10:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148441.274432; Thu, 01 Jul 2021 10:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWH-0003Ky-7p; Thu, 01 Jul 2021 10:02:05 +0000
Received: by outflank-mailman (input) for mailman id 148441;
 Thu, 01 Jul 2021 10:02:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytTN-0004XT-Vj
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:59:06 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [85.215.255.122])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24312b3-d57c-445e-b1b2-eafe1123a619;
 Thu, 01 Jul 2021 09:57:05 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uw5Nm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:58 +0200 (CEST)
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
X-Inumbo-ID: d24312b3-d57c-445e-b1b2-eafe1123a619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133419;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4BSb6eeDkPifgS8HDSbSVDpKklU68Xf6WI9Hag1dmvM=;
    b=jBLrRaJpTQvsf6M1Gf2VBUS4pkLKBkyObynQud5Q4/eSVIM/iRSt15fDhO0tHwnAlv
    1FKyCbr7cEwRob38K+L9xBwQyGemJtmQDHZW1RGBJFV3r9uh2FchWrUoJmWK/peMHWaY
    Om7XyUXvaijdTNHWG5kOq0G0K1qv7u2zLFzoAYkDdWIkAbPjXkk9x6WEKk7tzQRtltFK
    u9snzNkHACAukU58d3VqFGSKIwnXOTNuP7q+2QhWLUBTAS5dUTFQECkZ4GMvuRDQ3KfV
    zAfJOSNmOWLmxW8r7SHCxOJSGXBfR5kLsYoDK7bb6YOi9NScjR25bpmL09IgfslKHBTl
    zchA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 40/40] tools/libxc: use superpages during restore of HVM guest
Date: Thu,  1 Jul 2021 11:56:35 +0200
Message-Id: <20210701095635.15648-41-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
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

v02:
- remove xg_ prefix from called functions
---
 tools/libs/guest/xg_dom_x86.c            |   5 -
 tools/libs/guest/xg_private.h            |   5 +
 tools/libs/saverestore/common.c          |   1 -
 tools/libs/saverestore/common.h          |  28 +-
 tools/libs/saverestore/restore.c         |  62 +---
 tools/libs/saverestore/restore_x86_hvm.c | 370 ++++++++++++++++++++++-
 tools/libs/saverestore/restore_x86_pv.c  |  61 +++-
 7 files changed, 455 insertions(+), 77 deletions(-)

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
index 28441ee13f..b7372e6bd5 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -179,4 +179,9 @@ struct xc_cpu_policy {
 };
 #endif /* x86 */
 
+#define SUPERPAGE_2MB_SHIFT   9
+#define SUPERPAGE_2MB_NR_PFNS (1UL << SUPERPAGE_2MB_SHIFT)
+#define SUPERPAGE_1GB_SHIFT   18
+#define SUPERPAGE_1GB_NR_PFNS (1UL << SUPERPAGE_1GB_SHIFT)
+
 #endif /* XG_PRIVATE_H */
diff --git a/tools/libs/saverestore/common.c b/tools/libs/saverestore/common.c
index e96173eea2..8dbd516b1b 100644
--- a/tools/libs/saverestore/common.c
+++ b/tools/libs/saverestore/common.c
@@ -1,5 +1,4 @@
 #include <assert.h>
-
 #include "common.h"
 
 #include <xen-tools/libs.h>
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index a610483fe7..3d392f1ac9 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -219,6 +219,16 @@ struct xc_sr_restore_ops
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
@@ -366,6 +376,8 @@ struct xc_sr_context
 
             int send_back_fd;
             unsigned long p2m_size;
+            unsigned long max_pages;
+            unsigned long tot_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
 
             /* From Image Header. */
@@ -503,6 +515,14 @@ struct xc_sr_context
                     {
                         /* HVM context blob. */
                         struct xc_sr_blob context;
+
+                        /* Bitmap of currently allocated PFNs during restore. */
+                        struct sr_bitmap attempted_1g;
+                        struct sr_bitmap attempted_2m;
+                        struct sr_bitmap allocated_pfns;
+                        xen_pfn_t prev_populated_pfn;
+                        xen_pfn_t iteration_tracker_pfn;
+                        unsigned long iteration;
                     } restore;
                 };
             } hvm;
@@ -567,14 +587,6 @@ int read_record_header(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhd
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
index baf8ea44e5..5ad3df49ba 100644
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
-              (types && page_type_to_populate(types[i]) == true)) &&
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
index 97e7e0f48c..f45635613f 100644
--- a/tools/libs/saverestore/restore_x86_hvm.c
+++ b/tools/libs/saverestore/restore_x86_hvm.c
@@ -130,6 +130,25 @@ static int x86_hvm_localise_page(struct xc_sr_context *ctx,
     return 0;
 }
 
+static bool x86_hvm_expand_sp_bitmaps(struct xc_sr_context *ctx, unsigned long max_pfn)
+{
+    struct sr_bitmap *bm;
+
+    bm = &ctx->x86.hvm.restore.attempted_1g;
+    if ( !sr_bitmap_expand(bm, max_pfn >> SUPERPAGE_1GB_SHIFT) )
+        return false;
+
+    bm = &ctx->x86.hvm.restore.attempted_2m;
+    if ( !sr_bitmap_expand(bm, max_pfn >> SUPERPAGE_2MB_SHIFT) )
+        return false;
+
+    bm = &ctx->x86.hvm.restore.allocated_pfns;
+    if ( !sr_bitmap_expand(bm, max_pfn) )
+        return false;
+
+    return true;
+}
+
 /*
  * restore_ops function. Confirms the stream matches the domain.
  */
@@ -164,12 +183,21 @@ static int x86_hvm_setup(struct xc_sr_context *ctx)
 
     max_pfn = max(ctx->restore.p2m_size, ctx->dominfo.max_memkb >> (PAGE_SHIFT-10));
     if ( !sr_bitmap_expand(&ctx->restore.populated_pfns, max_pfn) )
-    {
-        PERROR("Unable to allocate memory for populated_pfns bitmap");
-        return -1;
-    }
+        goto out;
+
+    if ( !x86_hvm_expand_sp_bitmaps(ctx, max_pfn) )
+        goto out;
+
+    /* FIXME: distinguish between PVH and HVM */
+    /* No superpage in 1st 2MB due to VGA hole */
+    sr_set_bit(0, &ctx->x86.hvm.restore.attempted_1g);
+    sr_set_bit(0, &ctx->x86.hvm.restore.attempted_2m);
 
     return 0;
+
+out:
+    PERROR("Unable to allocate memory for pfn bitmaps");
+    return -1;
 }
 
 /*
@@ -250,6 +278,9 @@ static int x86_hvm_stream_complete(struct xc_sr_context *ctx)
 static int x86_hvm_cleanup(struct xc_sr_context *ctx)
 {
     sr_bitmap_free(&ctx->restore.populated_pfns);
+    sr_bitmap_free(&ctx->x86.hvm.restore.attempted_1g);
+    sr_bitmap_free(&ctx->x86.hvm.restore.attempted_2m);
+    sr_bitmap_free(&ctx->x86.hvm.restore.allocated_pfns);
     free(ctx->x86.hvm.restore.context.ptr);
 
     free(ctx->x86.restore.cpuid.ptr);
@@ -258,6 +289,336 @@ static int x86_hvm_cleanup(struct xc_sr_context *ctx)
     return 0;
 }
 
+/*
+ * Set a range of pfns as allocated
+ */
+static void pfn_set_long_allocated(struct xc_sr_context *ctx, xen_pfn_t base_pfn)
+{
+    sr_set_long_bit(base_pfn, &ctx->x86.hvm.restore.allocated_pfns);
+}
+
+static void pfn_set_allocated(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    sr_set_bit(pfn, &ctx->x86.hvm.restore.allocated_pfns);
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
+    if ( sr_test_and_set_bit(sp->index, &ctx->x86.hvm.restore.attempted_1g) )
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
+        sr_set_bit((sp->base_pfn >> SUPERPAGE_2MB_SHIFT) + i, &ctx->x86.hvm.restore.attempted_2m);
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
+    if ( sr_test_and_set_bit(sp->index, &ctx->x86.hvm.restore.attempted_2m) )
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
+    if ( sr_test_bit(pfn, &ctx->x86.hvm.restore.allocated_pfns) )
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
+        sr_set_bit(pfn, &ctx->x86.hvm.restore.attempted_1g);
+    } while (++pfn <= gap_end >> SUPERPAGE_1GB_SHIFT);
+
+    pfn = gap_start >> SUPERPAGE_2MB_SHIFT;
+    do
+    {
+        sr_set_bit(pfn, &ctx->x86.hvm.restore.attempted_2m);
+    } while (++pfn <= gap_end >> SUPERPAGE_2MB_SHIFT);
+
+    pfn = gap_start;
+
+    while ( pfn <= gap_end )
+    {
+        if ( sr_test_and_clear_bit(pfn, &ctx->x86.hvm.restore.allocated_pfns) )
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
+    sr_clear_bit(pfn, &ctx->restore.populated_pfns);
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
+    bool to_populate, populated;
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
+        to_populate = page_type_to_populate(types[i]);
+        populated = pfn_is_populated(ctx, pfn);
+
+        /*
+         * page has data, pfn populated: nothing to do
+         * page has data, pfn not populated: likely never seen before
+         * page has no data, pfn populated: likely ballooned out during migration
+         * page has no data, pfn not populated: nothing to do
+         */
+        if ( to_populate && !populated )
+        {
+            rc = x86_hvm_populate_page(ctx, pfn);
+        } else if ( !to_populate && populated )
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
@@ -266,6 +627,7 @@ struct xc_sr_restore_ops restore_ops_x86_hvm =
     .set_page_type   = x86_hvm_set_page_type,
     .localise_page   = x86_hvm_localise_page,
     .setup           = x86_hvm_setup,
+    .populate_pfns   = x86_hvm_populate_pfns,
     .process_record  = x86_hvm_process_record,
     .static_data_complete = x86_static_data_complete,
     .stream_complete = x86_hvm_stream_complete,
diff --git a/tools/libs/saverestore/restore_x86_pv.c b/tools/libs/saverestore/restore_x86_pv.c
index c73a3cd99f..244f1da218 100644
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

