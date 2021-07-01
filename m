Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A2C3B904C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148501.274554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWp-0000qO-KI; Thu, 01 Jul 2021 10:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148501.274554; Thu, 01 Jul 2021 10:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWp-0000mW-Cv; Thu, 01 Jul 2021 10:02:39 +0000
Received: by outflank-mailman (input) for mailman id 148501;
 Thu, 01 Jul 2021 10:02:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytS7-0004r4-HY
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:47 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb93b39-fa31-4fd4-b68b-bf10d2e2264c;
 Thu, 01 Jul 2021 09:57:00 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uq5NR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:52 +0200 (CEST)
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
X-Inumbo-ID: 8fb93b39-fa31-4fd4-b68b-bf10d2e2264c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133412;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BF1RLVhIB1BINrph0oGFlHcI4RXAoWr7u8tCO2/nmZw=;
    b=Cm3516N0bw8SQ/Ki/WWHQi6r4HjWgWgj5xxASFu1AZkoJQIACx2212nqjH5dm0ouAN
    UvTL56YGB12xLGngtgO7Az7s7a42jOWIGQskDHHUIrFgjpuMeBoaEMSyx1a0VfOGmOMq
    Z2ub8mBu2XLoZEi8bS6dkMpseRQLeAmSaZMqtUk5T/kPT2foO1GwRkZdXm9yDLcUtva9
    x1CEB4cO5XD7bbpMeFKoEfEEjfiq2Sd8jiCdKYPNt68JF7f7/oveqdvlzywL5Y2OcNZu
    IVRw2HRHEelfUAnd7qpBFvdaJsJVXojGDv3QKlEdlsMXUFEyTEmtGi1kttrzo1ycKubo
    JbQw==
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
Subject: [PATCH v20210701 29/40] tools: restore: split handle_page_data
Date: Thu,  1 Jul 2021 11:56:24 +0200
Message-Id: <20210701095635.15648-30-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
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
 tools/libs/saverestore/common.h  |   9 +
 tools/libs/saverestore/restore.c | 343 ++++++++++++++++++++-----------
 2 files changed, 231 insertions(+), 121 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 580eafacc8..96bd0ab80e 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -242,9 +242,14 @@ struct sr_restore_arrays {
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
+    void *guest_data[MAX_BATCH_SIZE];
+
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
     xen_pfn_t pp_pfns[MAX_BATCH_SIZE];
+
+    /* Must be the last member */
+    struct xc_sr_rec_page_data_header pages;
 };
 
 struct xc_sr_context
@@ -335,7 +340,11 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+            void *verify_buf;
+
             struct sr_restore_arrays *m;
+            void *guest_mapping;
+            uint32_t nr_mapped_pages;
         } restore;
     };
 
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index e75380155d..7643de58e0 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -186,123 +186,18 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
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
-    xen_pfn_t *mfns = ctx->restore.m->mfns;
-    int *map_errs = ctx->restore.m->map_errs;
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
-        if ( page_type_has_stream_data(types[i]) == true )
-            mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
-    }
-
-    /* Nothing to do? */
-    if ( nr_pages == 0 )
-        goto done;
-
-    mapping = guest_page = xenforeignmemory_map(
-        xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, mfns, map_errs);
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
-        if ( page_type_has_stream_data(types[i]) == false )
-            continue;
-
-        if ( map_errs[j] )
-        {
-            rc = -1;
-            ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[j], types[i], map_errs[j]);
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
-    xen_pfn_t *pfns = ctx->restore.m->pfns, pfn;
-    uint32_t *types = ctx->restore.m->types, type;
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
@@ -320,12 +215,26 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
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
 
@@ -335,13 +244,35 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    if ( rec->length < sizeof(*pages) + (pages->count * sizeof(uint64_t)) )
+    if ( pages->count > MAX_BATCH_SIZE )
+    {
+        ERROR("pfn count %u in PAGE_DATA record too large", pages->count);
+        errno = E2BIG;
+        goto err;
+    }
+
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
@@ -364,23 +295,183 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
              * have a page worth of data in the record. */
             pages_of_data++;
 
-        pfns[i] = pfn;
-        types[i] = type;
+        ctx->restore.m->pfns[i] = pfn;
+        ctx->restore.m->types[i] = type;
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
 
-    rc = process_page_data(ctx, pages->count, pfns, types,
-                           &pages->pfn[pages->count]);
+    ret = true;
+
+err:
+    return ret;
+}
+
+/*
+ * Populate pfns, if required
+ * Fill m->guest_data with either mapped address or NULL
+ * The caller must unmap guest_mapping
+ */
+static int map_guest_pages(struct xc_sr_context *ctx,
+                           struct xc_sr_rec_page_data_header *pages)
+{
+    xc_interface *xch = ctx->xch;
+    struct sr_restore_arrays *m = ctx->restore.m;
+    uint32_t i, p;
+    int rc;
+
+    rc = populate_pfns(ctx, pages->count, m->pfns, m->types);
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
+        ctx->restore.ops.set_page_type(ctx, m->pfns[i], m->types[i]);
+
+        if ( page_type_has_stream_data(m->types[i]) == false )
+        {
+            m->guest_data[i] = NULL;
+            continue;
+        }
+
+        m->mfns[ctx->restore.nr_mapped_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, m->pfns[i]);
+    }
+
+    /* Nothing to do? */
+    if ( ctx->restore.nr_mapped_pages == 0 )
+        goto done;
+
+    ctx->restore.guest_mapping = xenforeignmemory_map(xch->fmem, ctx->domid,
+            PROT_READ | PROT_WRITE, ctx->restore.nr_mapped_pages,
+            m->mfns, m->map_errs);
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
+        if ( page_type_has_stream_data(m->types[i]) == false )
+            continue;
+
+        if ( m->map_errs[p] == 0 )
+        {
+            m->guest_data[i] = ctx->restore.guest_mapping + (p * PAGE_SIZE);
+            p++;
+            continue;
+        }
+
+        errno = m->map_errs[p];
+        rc = -1;
+        PERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed",
+              m->pfns[i], m->mfns[p], m->types[i]);
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
+    struct sr_restore_arrays *m = ctx->restore.m;
+    void *p;
+    uint32_t i;
+    int rc = -1, idx;
+
+    rc = handle_static_data_end_v2(ctx);
+    if ( rc )
+        goto err;
+
+    /* First read and verify the header */
+    if ( verify_rec_page_hdr(ctx, rec->length, pages) == false )
+    {
+        rc = -1;
+        goto err;
+    }
+
+    /* Then read and verify the pfn numbers */
+    if ( verify_rec_page_pfns(ctx, rec->length, pages) == false )
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
+        if ( !m->guest_data[i] )
+            continue;
+
+        p = &pages->pfn[pages->count] + (idx * PAGE_SIZE);
+        rc = ctx->restore.ops.localise_page(ctx, m->types[i], p);
+        if ( rc )
+        {
+            ERROR("Failed to localise pfn %#"PRIpfn" (type %#"PRIx32")",
+                  m->pfns[i], m->types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+            goto err;
+
+        }
+
+        if ( ctx->restore.verify )
+        {
+            if ( memcmp(m->guest_data[i], p, PAGE_SIZE) )
+            {
+                errno = EIO;
+                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
+                      m->pfns[i], m->types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+                goto err;
+            }
+        }
+        else
+        {
+            memcpy(m->guest_data[i], p, PAGE_SIZE);
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
 
@@ -641,12 +732,21 @@ static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_recor
         break;
 
     case REC_TYPE_PAGE_DATA:
-        rc = handle_page_data(ctx, rec);
+        rc = handle_buffered_page_data(ctx, rec);
         break;
 
     case REC_TYPE_VERIFY:
         DPRINTF("Verify mode enabled");
         ctx->restore.verify = true;
+        if ( !ctx->restore.verify_buf )
+        {
+            ctx->restore.verify_buf = malloc(MAX_BATCH_SIZE * PAGE_SIZE);
+            if ( !ctx->restore.verify_buf )
+            {
+                rc = -1;
+                PERROR("Unable to allocate verify_buf");
+            }
+        }
         break;
 
     case REC_TYPE_CHECKPOINT:
@@ -725,7 +825,8 @@ static int setup(struct xc_sr_context *ctx)
     }
     ctx->restore.allocated_rec_num = DEFAULT_BUF_RECORDS;
 
-    ctx->restore.m = malloc(sizeof(*ctx->restore.m));
+    ctx->restore.m = malloc(sizeof(*ctx->restore.m) +
+            (sizeof(*ctx->restore.m->pages.pfn) * MAX_BATCH_SIZE));
     if ( !ctx->restore.m ) {
         ERROR("Unable to allocate memory for arrays");
         rc = -1;

