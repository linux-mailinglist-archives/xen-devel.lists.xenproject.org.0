Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84729F2E5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14428.35729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbQ-000457-71; Thu, 29 Oct 2020 17:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14428.35729; Thu, 29 Oct 2020 17:20:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbP-00042z-TY; Thu, 29 Oct 2020 17:20:43 +0000
Received: by outflank-mailman (input) for mailman id 14428;
 Thu, 29 Oct 2020 17:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbN-0003MD-NO
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:41 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1223d891-298a-419b-987a-b0e4d644f04c;
 Thu, 29 Oct 2020 17:20:20 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKD3fI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:13 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbN-0003MD-NO
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:41 +0000
X-Inumbo-ID: 1223d891-298a-419b-987a-b0e4d644f04c
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1223d891-298a-419b-987a-b0e4d644f04c;
	Thu, 29 Oct 2020 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992019;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=lkN1X6kUoB//sxPm6COzYhXSiEgr2M3yddCJzpbrAss=;
	b=IHBp8bGT+CjzevJ5KObxjBTmwycrPlfQlA8m7+twU1iV2uRqoop2Pgp86SuPb6M/cm
	kSSc6cIZY/xBaOpru3unK+lnoGDj/kITm2y8d5m0RFzT9mhxW7OYZne+ho5+B3pq6NYC
	bjOhehhBO1yRDGmmET+BOmVJhifRB0L6+7E5bfset/Q47vIaIvevf7VcQ1SudJeTCrqk
	DlZ0NfrZOrb+DChRBUnjDC+id6rHlbZl/l9qcXpUPKqiFmwFpTJgIPlBaBKyxvJxmPhv
	5NcOZ+s4zN7JyXWCel/K14wpryXivD4jgQ7w+GpA53x6vc7H/KNfaTba6tQ/ORImRsAc
	N0Gg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKD3fI
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:13 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 13/23] tools/guest: save: move guest_data array
Date: Thu, 29 Oct 2020 18:19:53 +0100
Message-Id: <20201029172004.17219-14-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
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
index 4d7fbe09ed..658f834ae8 100644
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

