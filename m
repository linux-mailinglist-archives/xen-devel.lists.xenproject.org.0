Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C342729F2E9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14431.35742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbU-0004F0-Ka; Thu, 29 Oct 2020 17:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14431.35742; Thu, 29 Oct 2020 17:20:48 +0000
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
	id 1kYBbU-0004Dd-E6; Thu, 29 Oct 2020 17:20:48 +0000
Received: by outflank-mailman (input) for mailman id 14431;
 Thu, 29 Oct 2020 17:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbS-0003MC-Lm
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:46 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b787c47-ec20-4ce7-921c-3bdab7e6f4a0;
 Thu, 29 Oct 2020 17:20:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKC3fF
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:12 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbS-0003MC-Lm
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:46 +0000
X-Inumbo-ID: 1b787c47-ec20-4ce7-921c-3bdab7e6f4a0
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1b787c47-ec20-4ce7-921c-3bdab7e6f4a0;
	Thu, 29 Oct 2020 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992019;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=zPzB2Ea/XkNgns/5zMr604KMV7uEET1uzQmhUGE8Zl4=;
	b=Zm9Fxmnh227rnoPh2z1h87SP3mDURpyMdE8IBX/J4SoKhSODhFYo5HRzA/FrCMbYsc
	6ghjx1ekd8+VgzU3ASVxKljdQfQWGHH76RCKJLsqq8FWPpPrpPrtNxucdE+1QbSotC+a
	u6zLoM5tQuXZs+rfR2ivsN6ESu/ViR2Vj4PokMlMEUE91BL8hoRGKKOrw+OraANLaMGS
	nfq5A0tZzB58TAsZ5KRyhjgRQxET7rs1li0pXSiQXHpffqUzK1lCkKqvEEQ6lfa9ZrAw
	FYqtoHipBWL7HJWaTVeVop0+vX7AlxlNFlAHr+XUpK+XOHUKsvzqC6LHx9aRoch730vT
	Zk6Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKC3fF
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:12 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 10/23] tools/guest: save: move errors array
Date: Thu, 29 Oct 2020 18:19:50 +0100
Message-Id: <20201029172004.17219-11-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move errors array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h | 2 ++
 tools/libs/guest/xg_sr_save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 3cbadb607b..71b676c0e0 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -217,6 +217,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     /* write_batch: Types of the batch pfns. */
     xen_pfn_t types[MAX_BATCH_SIZE];
+    /* write_batch: Errors from attempting to map the gfns. */
+    int errors[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 6678df95b8..cdc27a9cde 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -92,7 +92,7 @@ static int write_batch(struct xc_sr_context *ctx)
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
-    int *errors = NULL, rc = -1;
+    int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
     guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
@@ -114,7 +112,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !errors || !guest_data || !local_pages || !iov )
+    if ( !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -271,7 +269,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(iov);
     free(local_pages);
     free(guest_data);
-    free(errors);
 
     return rc;
 }

