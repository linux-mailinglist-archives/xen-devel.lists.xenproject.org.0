Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC73C764F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155598.287325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mwj-0007GF-TU; Tue, 13 Jul 2021 18:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155598.287325; Tue, 13 Jul 2021 18:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mwj-0007Ds-Pt; Tue, 13 Jul 2021 18:15:53 +0000
Received: by outflank-mailman (input) for mailman id 155598;
 Tue, 13 Jul 2021 18:15:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoP-0002kr-Uz
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:18 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a456ae3-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6KtB3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:20 +0200 (CEST)
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
X-Inumbo-ID: 0a456ae3-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199580;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=KXZqlmH3BT1hKTi/gqEWtzOcR1ftjdBkrbLwzUIkCqY=;
    b=oKqOBiKczsL0VEbHMdRM8eTatQ/c4qBBN8C0orirKp84TgFzaCoDVbKJ0AUObahCKe
    95ZFIub0tYsWfzbruWy8YloWi0pQ0nSO2CYou6qBqpvPb8Awad8daxuLnIPsEaajCePl
    JbNGT7tsFG5VGue0N1+n9BuLOFWacdo+9iYRAd4nWtr7T6AHOrzE+PHOQiNnRDLaroc1
    5RDxgwO8K8ebJFuTegEI8OpOmFmgLdv3oihSV9QDCZgFH/OPXdfeWxuyZW42ADWcluKh
    Fa9c9G0XoI12PgCVI+B27SsKbFQ8jH2iEC180ksQr64zSOorfX1ClajKSrofVkKRzlgu
    tDAA==
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
Subject: [PATCH v20210713 21/31] tools: restore: split handle_page_data
Date: Tue, 13 Jul 2021 20:05:55 +0200
Message-Id: <20210713180605.12096-22-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_page_data must be able to read directly into mapped guest memory.
This will avoid unneccesary memcpy calls for data that can be consumed verbatim.

Split the various steps of record processing:
- move processing to handle_buffered_page_data
- adjust xenforeignmemory_map to set errno in case of failure
- adjust verify mode to set errno in case of failure

This change is preparation for future changes in handle_page_data,
no change in behavior is intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |   4 +
 tools/libs/guest/xg_sr_restore.c | 320 ++++++++++++++++++++-----------
 2 files changed, 207 insertions(+), 117 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 077d8f2890..020b41ea8b 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -262,6 +262,10 @@ struct xc_sr_context
             int *map_errs;
             xen_pfn_t *pp_pfns;
             xen_pfn_t *pp_mfns;
+            void **guest_data;
+
+            void *guest_mapping;
+            uint32_t nr_mapped_pages;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 8f6da97d09..777d005fbd 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -183,121 +183,18 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     return rc;
 }
 
-/*
- * Given a list of pfns, their types, and a block of page data from the
- * stream, populate and record their types, map the relevant subset and copy
- * the data into the guest.
- */
-static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
-                             xen_pfn_t *pfns, uint32_t *types, void *page_data)
+static int handle_static_data_end_v2(struct xc_sr_context *ctx)
 {
-    xc_interface *xch = ctx->xch;
-    int rc;
-    void *mapping = NULL, *guest_page = NULL;
-    unsigned int i, /* i indexes the pfns from the record. */
-        j,          /* j indexes the subset of pfns we decide to map. */
-        nr_pages = 0;
-
-    rc = populate_pfns(ctx, count, pfns, types);
-    if ( rc )
-    {
-        ERROR("Failed to populate pfns for batch of %u pages", count);
-        goto err;
-    }
-
-    for ( i = 0; i < count; ++i )
-    {
-        ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
-
-        if ( page_type_has_stream_data(types[i]) )
-            ctx->restore.mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
-    }
-
-    /* Nothing to do? */
-    if ( nr_pages == 0 )
-        goto done;
-
-    mapping = guest_page = xenforeignmemory_map(
-        xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, ctx->restore.mfns, ctx->restore.map_errs);
-    if ( !mapping )
-    {
-        rc = -1;
-        PERROR("Unable to map %u mfns for %u pages of data",
-               nr_pages, count);
-        goto err;
-    }
-
-    for ( i = 0, j = 0; i < count; ++i )
-    {
-        if ( !page_type_has_stream_data(types[i]) )
-            continue;
-
-        if ( ctx->restore.map_errs[j] )
-        {
-            rc = -1;
-            ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], ctx->restore.mfns[j], types[i], ctx->restore.map_errs[j]);
-            goto err;
-        }
-
-        /* Undo page normalisation done by the saver. */
-        rc = ctx->restore.ops.localise_page(ctx, types[i], page_data);
-        if ( rc )
-        {
-            ERROR("Failed to localise pfn %#"PRIpfn" (type %#"PRIx32")",
-                  pfns[i], types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-            goto err;
-        }
-
-        if ( ctx->restore.verify )
-        {
-            /* Verify mode - compare incoming data to what we already have. */
-            if ( memcmp(guest_page, page_data, PAGE_SIZE) )
-                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
-                      pfns[i], types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-        }
-        else
-        {
-            /* Regular mode - copy incoming data into place. */
-            memcpy(guest_page, page_data, PAGE_SIZE);
-        }
-
-        ++j;
-        guest_page += PAGE_SIZE;
-        page_data += PAGE_SIZE;
-    }
-
- done:
-    rc = 0;
-
- err:
-    if ( mapping )
-        xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
-
-    return rc;
-}
+    int rc = 0;
 
-/*
- * Validate a PAGE_DATA record from the stream, and pass the results to
- * process_page_data() to actually perform the legwork.
- */
-static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
-{
+#if defined(__i386__) || defined(__x86_64__)
     xc_interface *xch = ctx->xch;
-    struct xc_sr_rec_page_data_header *pages = rec->data;
-    unsigned int i, pages_of_data = 0;
-    int rc = -1;
-
-    xen_pfn_t pfn;
-    uint32_t type;
-
     /*
      * v2 compatibility only exists for x86 streams.  This is a bit of a
      * bodge, but it is less bad than duplicating handle_page_data() between
      * different architectures.
      */
-#if defined(__i386__) || defined(__x86_64__)
+
     /* v2 compat.  Infer the position of STATIC_DATA_END. */
     if ( ctx->restore.format_version < 3 && !ctx->restore.seen_static_data_end )
     {
@@ -315,12 +212,26 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         ERROR("No STATIC_DATA_END seen");
         goto err;
     }
+
+    rc = 0;
+err:
 #endif
 
-    if ( rec->length < sizeof(*pages) )
+    return rc;
+}
+
+static bool verify_rec_page_hdr(struct xc_sr_context *ctx, uint32_t rec_length,
+                                 struct xc_sr_rec_page_data_header *pages)
+{
+    xc_interface *xch = ctx->xch;
+    bool ret = false;
+
+    errno = EINVAL;
+
+    if ( rec_length < sizeof(*pages) )
     {
         ERROR("PAGE_DATA record truncated: length %u, min %zu",
-              rec->length, sizeof(*pages));
+              rec_length, sizeof(*pages));
         goto err;
     }
 
@@ -330,13 +241,28 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    if ( rec->length < sizeof(*pages) + (pages->count * sizeof(uint64_t)) )
+    if ( rec_length < sizeof(*pages) + (pages->count * sizeof(uint64_t)) )
     {
         ERROR("PAGE_DATA record (length %u) too short to contain %u"
-              " pfns worth of information", rec->length, pages->count);
+              " pfns worth of information", rec_length, pages->count);
         goto err;
     }
 
+    ret = true;
+
+err:
+    return ret;
+}
+
+static bool verify_rec_page_pfns(struct xc_sr_context *ctx, uint32_t rec_length,
+                                 struct xc_sr_rec_page_data_header *pages)
+{
+    xc_interface *xch = ctx->xch;
+    uint32_t i, pages_of_data = 0;
+    xen_pfn_t pfn;
+    uint32_t type;
+    bool ret = false;
+
     for ( i = 0; i < pages->count; ++i )
     {
         pfn = pages->pfn[i] & PAGE_DATA_PFN_MASK;
@@ -363,19 +289,177 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         ctx->restore.types[i] = type;
     }
 
-    if ( rec->length != (sizeof(*pages) +
+    if ( rec_length != (sizeof(*pages) +
                          (sizeof(uint64_t) * pages->count) +
                          (PAGE_SIZE * pages_of_data)) )
     {
         ERROR("PAGE_DATA record wrong size: length %u, expected "
-              "%zu + %zu + %lu", rec->length, sizeof(*pages),
+              "%zu + %zu + %lu", rec_length, sizeof(*pages),
               (sizeof(uint64_t) * pages->count), (PAGE_SIZE * pages_of_data));
         goto err;
     }
 
-    rc = process_page_data(ctx, pages->count, ctx->restore.pfns,
-                           ctx->restore.types, &pages->pfn[pages->count]);
+    ret = true;
+
+err:
+    return ret;
+}
+
+/*
+ * Populate pfns, if required
+ * Fill guest_data with either mapped address or NULL
+ * The caller must unmap guest_mapping
+ */
+static int map_guest_pages(struct xc_sr_context *ctx,
+                           struct xc_sr_rec_page_data_header *pages)
+{
+    xc_interface *xch = ctx->xch;
+    uint32_t i, p;
+    int rc;
+
+    rc = populate_pfns(ctx, pages->count, ctx->restore.pfns, ctx->restore.types);
+    if ( rc )
+    {
+        ERROR("Failed to populate pfns for batch of %u pages", pages->count);
+        goto err;
+    }
+
+    ctx->restore.nr_mapped_pages = 0;
+
+    for ( i = 0; i < pages->count; i++ )
+    {
+        ctx->restore.ops.set_page_type(ctx, ctx->restore.pfns[i], ctx->restore.types[i]);
+
+        if ( page_type_has_stream_data(ctx->restore.types[i]) == false )
+        {
+            ctx->restore.guest_data[i] = NULL;
+            continue;
+        }
+
+        ctx->restore.mfns[ctx->restore.nr_mapped_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, ctx->restore.pfns[i]);
+    }
+
+    /* Nothing to do? */
+    if ( ctx->restore.nr_mapped_pages == 0 )
+        goto done;
+
+    ctx->restore.guest_mapping = xenforeignmemory_map(xch->fmem, ctx->domid,
+            PROT_READ | PROT_WRITE, ctx->restore.nr_mapped_pages,
+            ctx->restore.mfns, ctx->restore.map_errs);
+    if ( !ctx->restore.guest_mapping )
+    {
+        rc = -1;
+        PERROR("Unable to map %u mfns for %u pages of data",
+               ctx->restore.nr_mapped_pages, pages->count);
+        goto err;
+    }
+
+    /* Verify mapping, and assign address to pfn data */
+    for ( i = 0, p = 0; i < pages->count; i++ )
+    {
+        if ( !page_type_has_stream_data(ctx->restore.types[i]) )
+            continue;
+
+        if ( ctx->restore.map_errs[p] == 0 )
+        {
+            ctx->restore.guest_data[i] = ctx->restore.guest_mapping + (p * PAGE_SIZE);
+            p++;
+            continue;
+        }
+
+        errno = ctx->restore.map_errs[p];
+        rc = -1;
+        PERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed",
+              ctx->restore.pfns[i], ctx->restore.mfns[p], ctx->restore.types[i]);
+        goto err;
+    }
+
+done:
+    rc = 0;
+
+err:
+    return rc;
+}
+
+/*
+ * Handle PAGE_DATA record from an existing buffer
+ * Given a list of pfns, their types, and a block of page data from the
+ * stream, populate and record their types, map the relevant subset and copy
+ * the data into the guest.
+ */
+static int handle_buffered_page_data(struct xc_sr_context *ctx,
+                                     struct xc_sr_record *rec)
+{
+    xc_interface *xch = ctx->xch;
+    struct xc_sr_rec_page_data_header *pages = rec->data;
+    void *p;
+    uint32_t i;
+    int rc = -1, idx;
+
+    rc = handle_static_data_end_v2(ctx);
+    if ( rc )
+        goto err;
+
+    /* First read and verify the header */
+    if ( !verify_rec_page_hdr(ctx, rec->length, pages) )
+    {
+        rc = -1;
+        goto err;
+    }
+
+    /* Then read and verify the pfn numbers */
+    if ( !verify_rec_page_pfns(ctx, rec->length, pages) )
+    {
+        rc = -1;
+        goto err;
+    }
+
+    /* Map the target pfn */
+    rc = map_guest_pages(ctx, pages);
+    if ( rc )
+        goto err;
+
+    for ( i = 0, idx = 0; i < pages->count; i++ )
+    {
+        if ( !ctx->restore.guest_data[i] )
+            continue;
+
+        p = &pages->pfn[pages->count] + (idx * PAGE_SIZE);
+        rc = ctx->restore.ops.localise_page(ctx, ctx->restore.types[i], p);
+        if ( rc )
+        {
+            ERROR("Failed to localise pfn %#"PRIpfn" (type %#"PRIx32")",
+                  ctx->restore.pfns[i], ctx->restore.types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+            goto err;
+
+        }
+
+        if ( ctx->restore.verify )
+        {
+            if ( memcmp(ctx->restore.guest_data[i], p, PAGE_SIZE) )
+            {
+                errno = EIO;
+                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
+                      ctx->restore.pfns[i], ctx->restore.types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+                goto err;
+            }
+        }
+        else
+        {
+            memcpy(ctx->restore.guest_data[i], p, PAGE_SIZE);
+        }
+
+        idx++;
+    }
+
+    rc = 0;
+
  err:
+    if ( ctx->restore.guest_mapping )
+    {
+        xenforeignmemory_unmap(xch->fmem, ctx->restore.guest_mapping, ctx->restore.nr_mapped_pages);
+        ctx->restore.guest_mapping = NULL;
+    }
     return rc;
 }
 
@@ -636,7 +720,7 @@ static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_recor
         break;
 
     case REC_TYPE_PAGE_DATA:
-        rc = handle_page_data(ctx, rec);
+        rc = handle_buffered_page_data(ctx, rec);
         break;
 
     case REC_TYPE_VERIFY:
@@ -716,9 +800,10 @@ static int setup(struct xc_sr_context *ctx)
     ctx->restore.map_errs = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.map_errs));
     ctx->restore.pp_pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_pfns));
     ctx->restore.pp_mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_mfns));
+    ctx->restore.guest_data = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.guest_data));
     if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns ||
          !ctx->restore.map_errs || !ctx->restore.pp_pfns ||
-         !ctx->restore.pp_mfns )
+         !ctx->restore.pp_mfns || !ctx->restore.guest_data )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -755,6 +840,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.guest_data);
     free(ctx->restore.pp_mfns);
     free(ctx->restore.pp_pfns);
     free(ctx->restore.map_errs);

