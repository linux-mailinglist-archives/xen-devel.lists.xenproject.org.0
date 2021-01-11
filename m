Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4EF2F1D07
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65212.115570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KG-0005jP-Hd; Mon, 11 Jan 2021 17:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65212.115570; Mon, 11 Jan 2021 17:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KG-0005ia-C1; Mon, 11 Jan 2021 17:49:56 +0000
Received: by outflank-mailman (input) for mailman id 65212;
 Mon, 11 Jan 2021 17:49:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Dx-0002aB-Pw
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:25 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36188cfa-b812-4452-af3b-079db4bd99db;
 Mon, 11 Jan 2021 17:42:43 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgZM3Z
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:35 +0100 (CET)
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
X-Inumbo-ID: 36188cfa-b812-4452-af3b-079db4bd99db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386962;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=/cvRceO7SbtREeOjnVN5rz6fZHSyQVbCjZybfBTyM84=;
	b=nUQAtuU+wR1P0jmqW7lQo/Cnb0tgui8VX0rAru7QgSisgF/Ro8yokJex/yVVgt86C8
	/ecUjcgbI8bnY29EGXEfnedolQeFjJYsapK5EM8tlCE8hkVK+BB6AZNUB2tdcE5jT+Y2
	x3o7mE3bg1c2RqKNCpf4+FS3vEu08h/+aA5RT8xgzIccdNfx0FfvieywksjEbyi7tgxa
	166IMNj+Xox1UpSte7Kf2NAwiNXG+1nG/82dcly1iAa3scKw9uDRp28b2CX+SPPsYzdX
	T9zdR3bMFzcn/zPjNlduJHnCsTpxwYrU61HQ4uSfdffqlQOJ1KP37kwD08t6tNbXD4WV
	+X5A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 19/39] tools/guest: save: move iov array
Date: Mon, 11 Jan 2021 18:42:04 +0100
Message-Id: <20210111174224.24714-20-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move iov array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h | 2 ++
 tools/libs/guest/xg_sr_save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 71b676c0e0..f315b4f526 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -219,6 +219,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t types[MAX_BATCH_SIZE];
     /* write_batch: Errors from attempting to map the gfns. */
     int errors[MAX_BATCH_SIZE];
+    /* write_batch: iovec[] for writev(). */
+    struct iovec iov[MAX_BATCH_SIZE + 4];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index a1bddd5dcb..1d04bd0a44 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
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
 

