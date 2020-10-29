Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEA29F2E0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14419.35679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbG-0003jr-Fv; Thu, 29 Oct 2020 17:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14419.35679; Thu, 29 Oct 2020 17:20:34 +0000
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
	id 1kYBbG-0003iE-37; Thu, 29 Oct 2020 17:20:34 +0000
Received: by outflank-mailman (input) for mailman id 14419;
 Thu, 29 Oct 2020 17:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbD-0003MD-My
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:31 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 127c0127-9c7d-4b89-ac04-0ef80a5d7e3d;
 Thu, 29 Oct 2020 17:20:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKB3fD
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:11 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbD-0003MD-My
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:31 +0000
X-Inumbo-ID: 127c0127-9c7d-4b89-ac04-0ef80a5d7e3d
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 127c0127-9c7d-4b89-ac04-0ef80a5d7e3d;
	Thu, 29 Oct 2020 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992017;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=dcpi0RoPHtdIFCl+PLBz0qXMYWjsEXHpQRt3CZZau4g=;
	b=ijoHKnN8B92cG0ZgPu+XVZgFz9yoj6EfYeXfeeqipGOTC7DUSV/ZsxvS0dcUoQdIH/
	fSBwyISTh/Aot3bYwGit11QA9Pl/9Vp8ibtLeNxWx3L8zlc0317d/sQtFm/XdF94Dg9P
	NHSkcedeLi2U/fdgBKfsU5W8EQ2Ik/GGOOOi8/+8xHHXMgFATvfSxvgYvc1CPT2pd1sR
	JGLquTspeeNgz6TJWQG3sx0/bZL1G4OB5Or0/y/AWd8oSLRfyIm1tgc6GLlz0mj4g/vm
	kHLpuxTcAywspG3wZ7Z2oeqz0g+YWuXSmD2OuLzHOHmCVL9gRk+pbJkULyA17Q+c338t
	oL+A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKB3fD
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:11 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 08/23] tools/guest: save: move mfns array
Date: Thu, 29 Oct 2020 18:19:48 +0100
Message-Id: <20201029172004.17219-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h | 2 ++
 tools/libs/guest/xg_sr_save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index c78a07b8f8..0c2bef8f78 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -213,6 +213,8 @@ static inline int update_blob(struct xc_sr_blob *blob,
 
 struct xc_sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Mfns of the batch pfns. */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 597e638c59..cdab288c3f 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
     /* Types of the batch pfns. */
     types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
@@ -118,7 +116,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !types || !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -277,7 +275,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(guest_data);
     free(errors);
     free(types);
-    free(mfns);
 
     return rc;
 }

