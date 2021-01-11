Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D42F1CCA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65130.115425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Du-0003wC-QV; Mon, 11 Jan 2021 17:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65130.115425; Mon, 11 Jan 2021 17:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Du-0003uy-KZ; Mon, 11 Jan 2021 17:43:22 +0000
Received: by outflank-mailman (input) for mailman id 65130;
 Mon, 11 Jan 2021 17:43:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Ds-0002a6-0n
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:20 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dbb824f-9d9a-4145-870e-648cb008d29b;
 Mon, 11 Jan 2021 17:42:43 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgaM3b
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:36 +0100 (CET)
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
X-Inumbo-ID: 6dbb824f-9d9a-4145-870e-648cb008d29b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386962;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=8FX6A6TfSliLbBh9NN6xeSNcW9/ugcxkL/SigGC9sjw=;
	b=Xg90vn+9QomGIc6YZHB2XRiFhDv1USjP0F5KDc6J/C7rIBuSG5MqKNtRRXsr3cY4qN
	1xSS4NwGHKOItoeJ92yFwq/kaN6oSniK+ZZCnFp+lrjuowqRhdOysauOYmRY3EG4KQQg
	pyj5O6kfT6EbkU4o/Y5AuXZ409YRnJSSDM3zlKl5OFNpTfIL7TwDG+eA618Y3fhn93Mn
	dNFklOHr33zDwOCIHz20TvgvDT6CI0BSwtpUG/iE7cbalUsvSkodlHYy206qmAA9T/dz
	6x95/0HdKOPEBiiCsRPNvDoJC/dIrKjVNQjlWwAMoloxsJzmsWCi6FXxU7SNEwkhO/B+
	877Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 21/39] tools/guest: save: move guest_data array
Date: Mon, 11 Jan 2021 18:42:06 +0100
Message-Id: <20210111174224.24714-22-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move guest_data array into preallocated space.

Because this was allocated with calloc:
Adjust the loop to clear unused entries as needed.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  2 ++
 tools/libs/guest/xg_sr_save.c   | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 81158a4f4d..33e66678c6 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -223,6 +223,8 @@ struct xc_sr_save_arrays {
     struct iovec iov[MAX_BATCH_SIZE + 4];
     /* write_batch */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Pointers to page data to send. Mapped gfns or local allocations. */
+    void *guest_data[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 0e34c4b051..a571246894 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -90,7 +90,7 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
+    void **guest_data = ctx->save.m->guest_data;
     void **local_pages = NULL;
     int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -105,12 +105,10 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
 
-    if ( !guest_data || !local_pages )
+    if ( !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -166,7 +164,10 @@ static int write_batch(struct xc_sr_context *ctx)
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
             if ( page_type_has_stream_data(types[i]) == false )
+            {
+                guest_data[i] = NULL;
                 continue;
+            }
 
             if ( errors[p] )
             {
@@ -183,6 +184,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
             if ( rc )
             {
+                guest_data[i] = NULL;
                 if ( rc == -1 && errno == EAGAIN )
                 {
                     set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
@@ -256,7 +258,6 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
     free(local_pages);
-    free(guest_data);
 
     return rc;
 }

