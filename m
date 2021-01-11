Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBD2F1D0A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65215.115593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KL-0005sM-7y; Mon, 11 Jan 2021 17:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65215.115593; Mon, 11 Jan 2021 17:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KL-0005rD-0k; Mon, 11 Jan 2021 17:50:01 +0000
Received: by outflank-mailman (input) for mailman id 65215;
 Mon, 11 Jan 2021 17:49:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Eb-0002a6-23
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:05 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7e6dcb0-eb1c-4ab7-b91a-f1c06ce0161b;
 Mon, 11 Jan 2021 17:42:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgeM3l
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:40 +0100 (CET)
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
X-Inumbo-ID: d7e6dcb0-eb1c-4ab7-b91a-f1c06ce0161b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386967;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=bBxHDLx7AeMPpHXep28OEFmN0H0Z0pHfYy9VAoYWQzc=;
	b=LSKiUnZR9jv5XVA8GywjywVeLB7puA+0qUSS5ltXOOAPGUWFcoYpwTEdALq5daYn7A
	pHB/oNTom8As00JgLtspLY4HpfvhEE/PRyYGbjSFheGTcSBt/l7TrHdTCH02Ck7dqyxC
	0fQz6TbMpq49jVf1Gz8MrRLX2P9pLdIZChRLfFD8ElmplysVGPUjawv0wHH0LWWueKEW
	653fGt35iyKz+LSqgHWut03GVsyesEoBZr7YpQEKc3WzcGahaRLiy/pB3PMVElI118JI
	lQrXdkSG1El3B8UmVJ9wMBBhsFxo8mVOk0lKsqoIkMsryY/mAAznnXMvj4SXPG2XJSWR
	FbQA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 31/39] tools/guest: restore: write data directly into guest
Date: Mon, 11 Jan 2021 18:42:16 +0100
Message-Id: <20210111174224.24714-32-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read incoming migration stream directly into the guest memory.
This avoids the memory allocation and copying, and the resulting
performance penalty.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |   1 +
 tools/libs/guest/xg_sr_restore.c | 132 ++++++++++++++++++++++++++++++-
 2 files changed, 129 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 7ec8867b88..f76af23bcc 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -231,6 +231,7 @@ struct xc_sr_restore_arrays {
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
     void *guest_data[MAX_BATCH_SIZE];
+    struct iovec iov[MAX_BATCH_SIZE];
 
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 060f3d1f4e..2f575d7dd9 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -392,6 +392,122 @@ err:
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
+    struct xc_sr_restore_arrays *m = ctx->restore.m;
+    struct xc_sr_rec_page_data_header *pages = &m->pages;
+    uint64_t *pfn_nums = m->pages.pfn;
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
+    if ( verify_rec_page_hdr(ctx, rhdr->length, pages) == false )
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
+    if ( verify_rec_page_pfns(ctx, rhdr->length, pages) == false )
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
+    /* Prepare read buffers, either guest or throw away memory */
+    for ( i = 0, iov_idx = 0; i < pages->count; i++ )
+    {
+        if ( !m->guest_data[i] )
+            continue;
+
+        m->iov[iov_idx].iov_len = PAGE_SIZE;
+        if ( ctx->restore.verify )
+            m->iov[iov_idx].iov_base = ctx->restore.verify_buf + i * PAGE_SIZE;
+        else
+            m->iov[iov_idx].iov_base = m->guest_data[i];
+        iov_idx++;
+    }
+
+    if ( !iov_idx )
+        goto done;
+
+    rc = readv_exact(ctx->fd, m->iov, iov_idx);
+    if ( rc )
+    {
+        PERROR("read of %d pages failed", iov_idx);
+        goto err;
+    }
+
+    /* Post-processing of pfn data */
+    for ( i = 0, iov_idx = 0; i < pages->count; i++ )
+    {
+        if ( !m->guest_data[i] )
+            continue;
+
+        rc = ctx->restore.ops.localise_page(ctx, m->types[i], m->iov[iov_idx].iov_base);
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
+            if ( memcmp(m->guest_data[i], m->iov[iov_idx].iov_base, PAGE_SIZE) )
+            {
+                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
+                      m->pfns[i], m->types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
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
@@ -773,11 +889,19 @@ static int process_incoming_record_header(struct xc_sr_context *ctx, struct xc_s
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
 
 

