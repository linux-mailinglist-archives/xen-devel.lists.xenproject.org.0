Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19F3B9039
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148404.274378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytVp-0000rY-9I; Thu, 01 Jul 2021 10:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148404.274378; Thu, 01 Jul 2021 10:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytVp-0000p4-4w; Thu, 01 Jul 2021 10:01:37 +0000
Received: by outflank-mailman (input) for mailman id 148404;
 Thu, 01 Jul 2021 10:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytSP-0004XT-Tc
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:58:05 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8574b62-670a-4575-96ac-f040367c0885;
 Thu, 01 Jul 2021 09:56:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uo5NH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:50 +0200 (CEST)
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
X-Inumbo-ID: f8574b62-670a-4575-96ac-f040367c0885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133410;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=bOrjMbCsuneuqIIJGmLTblCtP85a/JTG2OAkzH1Hjtw=;
    b=UySDWzQOP77+pL/xjXP2xA3spFqJTyKI8ZU213fh6F8cBA86GlpSiFZxX8QijfCNiw
    Jfo3XaYQmD3whcWUQshSBLK4zqALkCB4lyYz3Bo1T5nVTNxYygD7FHny+M4MHwX1P8Iy
    paU6qPJ8lEqBgUoarSRb2cuD4xtDMc5TZdUK99UpSZvbM6gCxi5CXpysGzLtvDFuY60l
    ogE8q5SN6+rVMh8z4U/iK+rg3FX6AhHwq5kBEYSci+saoI7LuxBgqUFB6YL28x2wKA78
    g1FYYIEd8SOTGJW+Q8Zq7QqZy5EjvlO9Katji2gV5+5mRz1AmE+b6g97qYL6rykTniZ2
    juEg==
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
Subject: [PATCH v20210701 24/40] tools: restore: move mfns array
Date: Thu,  1 Jul 2021 11:56:19 +0200
Message-Id: <20210701095635.15648-25-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index d798b79745..9d7efff03d 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -239,6 +239,8 @@ struct sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
     uint32_t types[MAX_BATCH_SIZE];
+    /* process_page_data */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 8ea125cf73..d7ea52b89e 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -205,7 +205,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
                              xen_pfn_t *pfns, uint32_t *types, void *page_data)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
+    xen_pfn_t *mfns = ctx->restore.m->mfns;
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
@@ -213,7 +213,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         j,          /* j indexes the subset of pfns we decide to map. */
         nr_pages = 0;
 
-    if ( !mfns || !map_errs )
+    if ( !map_errs )
     {
         rc = -1;
         ERROR("Failed to allocate %zu bytes to process page data",
@@ -299,7 +299,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
     free(map_errs);
-    free(mfns);
 
     return rc;
 }

