Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1F3A9B96
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143004.263823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGC-0004Nl-Tq; Wed, 16 Jun 2021 13:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143004.263823; Wed, 16 Jun 2021 13:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGC-0004Ld-OE; Wed, 16 Jun 2021 13:07:12 +0000
Received: by outflank-mailman (input) for mailman id 143004;
 Wed, 16 Jun 2021 13:07:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV2J-0006lZ-2P
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:51 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1066a928-1d2a-49f9-b44c-1f3a18eed590;
 Wed, 16 Jun 2021 12:51:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpjtmL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:45 +0200 (CEST)
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
X-Inumbo-ID: 1066a928-1d2a-49f9-b44c-1f3a18eed590
ARC-Seal: i=1; a=rsa-sha256; t=1623847905; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bANuIUngkLsBnEZY2I+0vBdL+kR3ZOiAGbA14jWxgDEHBCVpyWfW+yAuoW8rHW1Ez4
    fh3DD0wY3yoNJcHlGB+NEHaU99w4wtPbY8MCu/tDS0nQGTE3TRjco6g9xmErPuWMFTbD
    Md8EVmmNEdg3bLfhW8rwOocIF28q5DHxwsALxipzmD4IkN2sHG6exKiiEhLUXDdRkHoA
    TWuNWfD+zcAVreUHyVOxZkzhlzeCqrKHKrxAt+Zvrxummz3Oy785D8bZ/NF1j8yWXFey
    szCXCc5WJjS3ShjrdPjH0t/uNX1Ar/bNsRp+XmaXTFsCfddSRbzcDxL/w8kNKyLyq1wN
    e1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847905;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XvzNAYL4Bz6FS15Jp93i8O47PVWqmiH8eMe8cuJSWuw=;
    b=GtJEASD9ixYM8kwE/+pjHDoFO61iRoeMYDGQE7gtB1iAGP3z+P/F/7YErteofWL/2V
    B3iyQ698+k9IrcOJ5VrOKsd30fgH/qxo1NEPvLPlqM3oPvKnmOVzdHn3gabr+BHmySRd
    rqGfEhP5eYFtUjBG7HJ+me6ucNS2e8hTyBVTp/9/RaW2CWjTdrPdLPO1DU3+2GWteF8z
    kRirjomPtwCKL3FO6f+gkLgXPOw5T63Gds/4fg1pQPqANJAHGYXSDE4Dz1NiBNayEaHL
    ZxhtD1pX88KLyP2lYYsUZqmhRQ9GdaRzhm6vRjTiDx1xb4/v56mcW1ioc2ioXfrT5jvb
    fDYQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847905;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XvzNAYL4Bz6FS15Jp93i8O47PVWqmiH8eMe8cuJSWuw=;
    b=EXhLBPz/onKs0O5mn7+1kh6DniN7HJd6hIGmA5MmHqQsmZ8tEp9ubhaW9FSyISWoSp
    gFxMvmLF/lMcVsGZbnCQgGku0AYAEgde1LLnc8lQcOLNgjXl/GB8WcaCvzHDEobu/mfS
    j2c/Ivbks06pgF2QYlEyiazfcNYzxq5c4rv2ti/AzbaaNC1ufl4ehGV4UY5+CsZIkDSW
    lXbbQLt/MU1WTDgJvspuAHk7ADM0V45qGnG8g6/KZh9r+jS6oLaJQPb6yVUqfSUJS+l4
    rWUmEXNz8zwXYNOR0VXzUe/iCRzR1Vai6F81fsA7hh/zj3kiNJ4LhotGoa9CBsXl75El
    DteA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 26/36] tools: restore: write data directly into guest
Date: Wed, 16 Jun 2021 14:51:19 +0200
Message-Id: <20210616125129.26563-27-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index d479f1a918..5c440f28ec 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -243,6 +243,7 @@ struct sr_restore_arrays {
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
     void *guest_data[MAX_BATCH_SIZE];
+    struct iovec iov[MAX_BATCH_SIZE];
 
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 877fd19a9b..d0148606bf 100644
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
+    struct sr_restore_arrays *m = ctx->restore.m;
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
 
 

