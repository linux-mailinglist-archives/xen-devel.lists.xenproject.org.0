Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073AD3C7655
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155639.287405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MxN-00026f-Gv; Tue, 13 Jul 2021 18:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155639.287405; Tue, 13 Jul 2021 18:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MxN-00022K-Be; Tue, 13 Jul 2021 18:16:33 +0000
Received: by outflank-mailman (input) for mailman id 155639;
 Tue, 13 Jul 2021 18:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoC-0002UL-HN
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:04 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ecee7c7-15e0-4e66-8c9d-84abd882dd66;
 Tue, 13 Jul 2021 18:06:26 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6KtB4
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
X-Inumbo-ID: 2ecee7c7-15e0-4e66-8c9d-84abd882dd66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199580;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XpbwYZI6TX0rUOJJRsTgz/BUclsrX9blWzzFnveyZbk=;
    b=VFXG3isBNY/F8rK3W7hVJ+jAumS2jr7OBkfKi/kQyVsjO9MhFxPG8EMZfthuBNd0Ca
    gbpfcdPvvHMeIQHpGU/CA6KyiBijdWqraaSFTSTv8ilxhYhOW2etctIm7X0rw1bjnYeJ
    HF7sjJrjjJRZ8yAyP6V7IGOgwGVL225GxXMcRUx9u/o7ebMtgdKiKilfu7ptuaeQzNyw
    ASF81BzLfIQz43rTpRcVUjR3E1eTo06QJbAI18HBifHDclpJORK7cTmIoMiOq+mlA9QV
    UEwW+0OEye86Y/oW/Vd1w8Oc/WRKUhE96FpEuQt1THvSdlvDkUfj0+VI24fHNFpIjEct
    7LnQ==
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
Subject: [PATCH v20210713 22/31] tools: restore: write data directly into guest
Date: Tue, 13 Jul 2021 20:05:56 +0200
Message-Id: <20210713180605.12096-23-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read incoming migration stream directly into the guest memory.
This avoids the memory allocation and copying, and the resulting
performance penalty.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |   3 +
 tools/libs/guest/xg_sr_restore.c | 155 ++++++++++++++++++++++++++++++-
 2 files changed, 153 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 020b41ea8b..8981c21acd 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -263,6 +263,8 @@ struct xc_sr_context
             xen_pfn_t *pp_pfns;
             xen_pfn_t *pp_mfns;
             void **guest_data;
+            struct iovec *iov;
+            struct xc_sr_rec_page_data_header *pages;
 
             void *guest_mapping;
             uint32_t nr_mapped_pages;
@@ -311,6 +313,7 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+            void *verify_buf;
         } restore;
     };
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 777d005fbd..d4012bcffd 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -381,6 +381,129 @@ err:
     return rc;
 }
 
+/*
+ * Handle PAGE_DATA record from the stream.
+ * Given a list of pfns, their types, and a block of page data from the
+ * stream, populate and record their types, map the relevant subset and copy
+ * the data into the guest.
+ */
+static int handle_incoming_page_data(struct xc_sr_context *ctx,
+                                     struct xc_sr_rhdr *rhdr)
+{
+    xc_interface *xch = ctx->xch;
+    struct xc_sr_rec_page_data_header *pages = ctx->restore.pages;
+    uint64_t *pfn_nums = &pages->pfn[0];
+    uint32_t i;
+    int rc, iov_idx;
+
+    rc = handle_static_data_end_v2(ctx);
+    if ( rc )
+        goto err;
+
+    /* First read and verify the header */
+    rc = read_exact(ctx->fd, pages, sizeof(*pages));
+    if ( rc )
+    {
+        PERROR("Could not read rec_pfn header");
+        goto err;
+    }
+
+    if ( !verify_rec_page_hdr(ctx, rhdr->length, pages) )
+    {
+        rc = -1;
+        goto err;
+    }
+
+    /* Then read and verify the incoming pfn numbers */
+    rc = read_exact(ctx->fd, pfn_nums, sizeof(*pfn_nums) * pages->count);
+    if ( rc )
+    {
+        PERROR("Could not read rec_pfn data");
+        goto err;
+    }
+
+    if ( !verify_rec_page_pfns(ctx, rhdr->length, pages) )
+    {
+        rc = -1;
+        goto err;
+    }
+
+    /* Finally read and verify the incoming pfn data */
+    rc = map_guest_pages(ctx, pages);
+    if ( rc )
+        goto err;
+
+    /* Prepare read buffers, either guest or throw-away memory */
+    for ( i = 0, iov_idx = 0; i < pages->count; i++ )
+    {
+        struct iovec *iov;
+
+        if ( !ctx->restore.guest_data[i] )
+            continue;
+
+        iov = &ctx->restore.iov[iov_idx];
+        iov->iov_len = PAGE_SIZE;
+        if ( ctx->restore.verify )
+            iov->iov_base = ctx->restore.verify_buf + (i * PAGE_SIZE);
+        else
+            iov->iov_base = ctx->restore.guest_data[i];
+        iov_idx++;
+    }
+
+    if ( !iov_idx )
+        goto done;
+
+    rc = readv_exact(ctx->fd, ctx->restore.iov, iov_idx);
+    if ( rc )
+    {
+        PERROR("read of %d pages failed", iov_idx);
+        goto err;
+    }
+
+    /* Post-processing of pfn data */
+    for ( i = 0, iov_idx = 0; i < pages->count; i++ )
+    {
+        void *addr;
+
+        if ( !ctx->restore.guest_data[i] )
+            continue;
+
+        addr = ctx->restore.iov[iov_idx].iov_base;
+        rc = ctx->restore.ops.localise_page(ctx, ctx->restore.types[i], addr);
+        if ( rc )
+        {
+            ERROR("Failed to localise pfn %#"PRIpfn" (type %#"PRIx32")",
+                  ctx->restore.pfns[i],
+                  ctx->restore.types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+            goto err;
+
+        }
+
+        if ( ctx->restore.verify )
+        {
+            if ( memcmp(ctx->restore.guest_data[i], addr, PAGE_SIZE) )
+            {
+                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
+                      ctx->restore.pfns[i],
+                      ctx->restore.types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+            }
+        }
+
+        iov_idx++;
+    }
+
+done:
+    rc = 0;
+
+err:
+    if ( ctx->restore.guest_mapping )
+    {
+        xenforeignmemory_unmap(xch->fmem, ctx->restore.guest_mapping, ctx->restore.nr_mapped_pages);
+        ctx->restore.guest_mapping = NULL;
+    }
+    return rc;
+}
+
 /*
  * Handle PAGE_DATA record from an existing buffer
  * Given a list of pfns, their types, and a block of page data from the
@@ -726,6 +849,15 @@ static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_recor
     case REC_TYPE_VERIFY:
         DPRINTF("Verify mode enabled");
         ctx->restore.verify = true;
+        if ( !ctx->restore.verify_buf )
+        {
+            ctx->restore.verify_buf = malloc(MAX_BATCH_SIZE * PAGE_SIZE);
+            if ( !ctx->restore.verify_buf )
+            {
+                PERROR("Unable to allocate verify_buf");
+                rc = -1;
+            }
+        }
         break;
 
     case REC_TYPE_CHECKPOINT:
@@ -752,11 +884,19 @@ static int process_incoming_record_header(struct xc_sr_context *ctx, struct xc_s
     struct xc_sr_record rec;
     int rc;
 
-    rc = read_record_data(ctx, ctx->fd, rhdr, &rec);
-    if ( rc )
-        return rc;
+    switch ( rhdr->type )
+    {
+    case REC_TYPE_PAGE_DATA:
+        rc = handle_incoming_page_data(ctx, rhdr);
+        break;
+    default:
+        rc = read_record_data(ctx, ctx->fd, rhdr, &rec);
+        if ( rc == 0 )
+            rc = process_buffered_record(ctx, &rec);;
+        break;
+    }
 
-    return process_buffered_record(ctx, &rec);
+    return rc;
 }
 
 
@@ -801,9 +941,12 @@ static int setup(struct xc_sr_context *ctx)
     ctx->restore.pp_pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_pfns));
     ctx->restore.pp_mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_mfns));
     ctx->restore.guest_data = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.guest_data));
+    ctx->restore.iov = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.iov));
+    ctx->restore.pages = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pages->pfn) + sizeof(*ctx->restore.pages));
     if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns ||
          !ctx->restore.map_errs || !ctx->restore.pp_pfns ||
-         !ctx->restore.pp_mfns || !ctx->restore.guest_data )
+         !ctx->restore.pp_mfns || !ctx->restore.guest_data ||
+         !ctx->restore.iov || !ctx->restore.pages )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -840,6 +983,8 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.pages);
+    free(ctx->restore.iov);
     free(ctx->restore.guest_data);
     free(ctx->restore.pp_mfns);
     free(ctx->restore.pp_pfns);

