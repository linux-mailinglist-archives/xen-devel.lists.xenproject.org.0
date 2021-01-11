Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC92F1CC5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65119.115366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Df-0003PL-8Y; Mon, 11 Jan 2021 17:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65119.115366; Mon, 11 Jan 2021 17:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1De-0003O5-Tu; Mon, 11 Jan 2021 17:43:06 +0000
Received: by outflank-mailman (input) for mailman id 65119;
 Mon, 11 Jan 2021 17:43:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Dd-0002a6-0S
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:05 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f774d96-6266-4425-9a26-9e1d13d2a17f;
 Mon, 11 Jan 2021 17:42:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgYM3W
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:34 +0100 (CET)
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
X-Inumbo-ID: 1f774d96-6266-4425-9a26-9e1d13d2a17f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386961;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=GFx6OzeDNwjLW8Klv9SCvRUyVj29OFUNKKJQYpW77rw=;
	b=DiCSwWPwtDaN9wTrbKCAOrN8wOQJTHKUH50tL4BIcvajjNQA6FwTHQ5edmkZBvTOt0
	7kMJ/ifub+prNeokctYyoBD+j5M9xPWcNpvAe4PFgzE9pi0iKaJzbYUbU3rNROFgg+JG
	VsD6rG+LSoI6TgrUBrjAv9Q/NXN46bYhEXDUvapnaEzehI931NgB2NbPvjVRjc5BJsgR
	AW1aSoynd5eILKl/ifMl/NIdki1H/Ean4i/m5R5jr+eX2rPZbOJWXyy4T7myOizbUwOA
	VHsGHC3gx5dlXraJvG8Urrxc0KbdRi7VUUan1UVw9P0btw6UTbaAJ+IcZfuHUsqifc9M
	kIdw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 17/39] tools/guest: save: move types array
Date: Mon, 11 Jan 2021 18:42:02 +0100
Message-Id: <20210111174224.24714-18-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h | 2 ++
 tools/libs/guest/xg_sr_save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 0c2bef8f78..3cbadb607b 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -215,6 +215,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     /* write_batch: Mfns of the batch pfns. */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    /* write_batch: Types of the batch pfns. */
+    xen_pfn_t types[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index fd6437afc0..ff70f62b1e 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
     errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
@@ -116,7 +114,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -274,7 +272,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(local_pages);
     free(guest_data);
     free(errors);
-    free(types);
 
     return rc;
 }

