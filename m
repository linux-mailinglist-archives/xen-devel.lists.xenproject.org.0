Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F983A9BB1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143103.263967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHU-00039S-1L; Wed, 16 Jun 2021 13:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143103.263967; Wed, 16 Jun 2021 13:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHT-00034c-QW; Wed, 16 Jun 2021 13:08:31 +0000
Received: by outflank-mailman (input) for mailman id 143103;
 Wed, 16 Jun 2021 13:08:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1u-0006lZ-1Q
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:26 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d87af7a-fcd5-438d-ab62-34ee038e5189;
 Wed, 16 Jun 2021 12:51:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpetm6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:40 +0200 (CEST)
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
X-Inumbo-ID: 1d87af7a-fcd5-438d-ab62-34ee038e5189
ARC-Seal: i=1; a=rsa-sha256; t=1623847900; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qqndapM6fq0DVojuSeYOeqUo244Ivu4gAa4rSpcedg8YERJY7/OLOi6XWeyI845Uxs
    zBNVMAcdUAhMd6qaxhh+NdNE9aHaxpZ/yVg0zLAzoilDVYcabOyCyJ4SY++Z8/y9UQyT
    loToNlG4zIBEAs24WvEu4K32b/t/1n+2dtiYP/uRptnyEbDXBSBqPsUTXrPnXcoOTsh+
    7o8BM2E12cQJFOKnv00bClK3RshwRq+wqM/CwNwGh//cxCHz1lUvok+q1DnrKHRFLnbh
    EYA63dif5twORXHM4K5DTPS3ruswNOpHA3eTc8ef7wDr8f+z5wzkJfRtEuOvhdQwW+A/
    42yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847900;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XGzxV8H0rtxBrYjtA99frZPaR/R3Z7Ebv988Uk2fYO0=;
    b=W22pArx+bx+xlzcrGw3A+cdqm96bzRnLx2oAT6Prjp36W5Ol69D4zNnOAYiBX1MMmy
    eFP93tipOYV9IjoT9DUsifnqz9j7wSRECx17AZWitUD3OMldAzlWRW/+B9ZH4DbO7P3e
    Na+g+TncdD9xx3yqFin3mtGg1eXeFAmx1Hwl3BOvgdqT7+mAvqNUjXJa7LL4eFoQNzg9
    Qeq9iqt48s1dEck9LA5s+3NBikUwuO753UDcUCaTJK0XLMRPdsmO1G+HWmMiFo0H5z3K
    m0Ot/vrEdZ4eFrDFFzmIWm8iR0WHBpNUF2FHxmoaK4Mqg156xJsQ4+6q8JT4KC6XWNfa
    LiuA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847900;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XGzxV8H0rtxBrYjtA99frZPaR/R3Z7Ebv988Uk2fYO0=;
    b=X8IO+QK3/HCFVRHjeCoMJqDkTfz+7zRmaDSFeq5Ll3aHQwW8Bw1dU7zILDykfzwXAP
    3FK3+F9Ba+uUAXuUc9hcDbQLz3Y5DHR2a6oXhgkN161wz3XXqU6V97ilZt1GbMG2x461
    qDPeQtbrMnXylsNaBavhbRE+tBlh5GzZA3a7L+QWL8LkrMiF/5wZZmJpK5t+jxfHvNZO
    u38EflqMHcHDHyJSJMQPlJinDy8aLCiRsPl7hZ4SXQpQEtTzqzpelTvLL91ZcISCF/ho
    anmnlZHdWGVSD6zTDMJQJkhAtWIqWv/XQuDmpIeiXBr2dpItR5DZNrHYvJV0Uxc+nf5B
    3e3w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 15/36] tools: save: move iov array
Date: Wed, 16 Jun 2021 14:51:08 +0200
Message-Id: <20210616125129.26563-16-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move iov array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 558b5fbf06..ae87954364 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -231,6 +231,8 @@ struct sr_save_arrays {
     xen_pfn_t types[MAX_BATCH_SIZE];
     /* write_batch: Errors from attempting to map the gfns. */
     int errors[MAX_BATCH_SIZE];
+    /* write_batch: iovec[] for writev(). */
+    struct iovec iov[MAX_BATCH_SIZE + 4];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 9ebbf00ce7..1a5f3d29ea 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -97,7 +97,7 @@ static int write_batch(struct xc_sr_context *ctx)
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
-    struct iovec *iov = NULL; int iovcnt = 0;
+    struct iovec *iov = ctx->save.m->iov; int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
         .type = REC_TYPE_PAGE_DATA,
@@ -109,10 +109,8 @@ static int write_batch(struct xc_sr_context *ctx)
     guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
-    /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !guest_data || !local_pages || !iov )
+    if ( !guest_data || !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -266,7 +264,6 @@ static int write_batch(struct xc_sr_context *ctx)
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
-    free(iov);
     free(local_pages);
     free(guest_data);
 

