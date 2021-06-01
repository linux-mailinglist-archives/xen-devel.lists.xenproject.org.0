Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AA3977D2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135067.251331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo74s-0008Q3-LD; Tue, 01 Jun 2021 16:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135067.251331; Tue, 01 Jun 2021 16:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo74s-0008NO-Gh; Tue, 01 Jun 2021 16:17:14 +0000
Received: by outflank-mailman (input) for mailman id 135067;
 Tue, 01 Jun 2021 16:17:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70a-0005Ec-32
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:48 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.174])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92920130-7184-433e-aa96-fa8bc703aa30;
 Tue, 01 Jun 2021 16:11:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBa1BV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:36 +0200 (CEST)
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
X-Inumbo-ID: 92920130-7184-433e-aa96-fa8bc703aa30
ARC-Seal: i=1; a=rsa-sha256; t=1622563897; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dudlQMcq6QurLVSYJAZ5weU9gLvgk7ga30PI1ni10/6v6vlW/RpnHiPHc344aQoT5n
    2nz6eoXiB/UvOMX5ayAh296N7uv2c6NzJkDR+WJMrih3YAByL9vZjGszF01V7WtxVgfV
    QHJATJaC2ppHIXC18mXOcO8fRGdVT/ZZkm0tW2YStIJv5Ok/vEcOBtskppeG10WX0pl1
    zER3j01QAJf8z25RLfcSf6e5zR7dBrvfE8o6auj+TTE4u3VXi8Xsb2XYg/I2ALhGf8vJ
    F3JMeO+47uR4o8kEUTblo+Z6kXw5H9UaPLNxYNn/YbCsbbiWlmTZsDh1oRwX4GugPjhC
    QpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563897;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=eDLBvLwdNBkdJsm65Hcts+kQfVHtshr8GV54yTNeA1Y=;
    b=JbEojE7DjUODPQOlO5CTL9kaucbAdMnMgmE0frwsA9qoL0+7NQivopCQV1UYoDI3io
    Bv4OKH8RLvhWhHozcxfNvNWB0httJNIpTZRT4KZzok7EPnsIeMYkwSi/q8zbQCbw3j//
    AltqW/84hmVILTF473mnzapNbVfMUmfJ0vZ3EaWLMoykCOdkzUL7zPrCIUsMVG1gY+zu
    YnyVvu57o/rPpQ46Mq2TXmP++9Vo67ER487wS1y1YZEC77u0hk7KJWirxRBhyHvIO/UV
    6glChkY0ZOmKCxYv4spTfEYEYAwrJRrXmUbDY2RGsQiPEDxMwqQn7sFTveRDeYDhDVBZ
    RxhA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563897;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=eDLBvLwdNBkdJsm65Hcts+kQfVHtshr8GV54yTNeA1Y=;
    b=M7R0KO8O/hmI94jXqEKM8+BNsOwtJDTsMT3JBfBJAiidLHe0/pK+fv7NWrqk7fr5es
    42Y1ZKKcFIWVjB/9F+GtXKa1vWrVXxKIBhrml9jbsCD3ImanI17KncC2trj677FlC+Ja
    6OGVucrVcpzSSpGtUp0UwiNm3x4iBGWpZqkas/bW8X8BQAov7/qkLmjzpGmLdQnt617a
    Pz39F4JDfz4TU3ldYRFayHtqh6kKdgpBzan401LwdvOzidPKERz6p9UNJl1FKj160qLb
    AhpS1NyKO2cLtYhyOZnY372E2XK0G+148UGj6Ati25SZjLtxmpAz8bPqEo9+5EBrlHzk
    0FAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 26/38] tools/guest: restore: write data directly into guest
Date: Tue,  1 Jun 2021 18:11:06 +0200
Message-Id: <20210601161118.18986-27-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read incoming migration stream directly into the guest memory.
This avoids the memory allocation and copying, and the resulting
performance penalty.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  |   1 +
 tools/libs/saverestore/restore.c | 132 ++++++++++++++++++++++++++++++-
 2 files changed, 129 insertions(+), 4 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 21fdcf234e..4218a8ecd6 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -243,6 +243,7 @@ struct xc_sr_restore_arrays {
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
     void *guest_data[MAX_BATCH_SIZE];
+    struct iovec iov[MAX_BATCH_SIZE];
 
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index f7b4a7124b..722f77b46a 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
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
 
 

