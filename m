Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400EB29F2E2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14422.35695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbK-0003sO-CG; Thu, 29 Oct 2020 17:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14422.35695; Thu, 29 Oct 2020 17:20:38 +0000
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
	id 1kYBbJ-0003r6-Vg; Thu, 29 Oct 2020 17:20:37 +0000
Received: by outflank-mailman (input) for mailman id 14422;
 Thu, 29 Oct 2020 17:20:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbI-0003MC-LV
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:36 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ebe0a0c-9949-4068-aaaa-4cbe193ab190;
 Thu, 29 Oct 2020 17:20:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKC3fG
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:12 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbI-0003MC-LV
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:36 +0000
X-Inumbo-ID: 7ebe0a0c-9949-4068-aaaa-4cbe193ab190
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7ebe0a0c-9949-4068-aaaa-4cbe193ab190;
	Thu, 29 Oct 2020 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992018;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=B++RYJANjQEZHzQRb6RRsob3izlvX5G7HJ1Rv0O4H+A=;
	b=WIz+NE+7xF6vT1cRZSz/As+Y7vlWr2VKQ6uf3nNZG8WvVgAUUTZT7tN/CK97UqIslb
	dShQsjixmwuLu5ZMK/YCZeDfuEZtOXVgZC0QWtSvXW2PY/zWQ3GL1jQg7YHhBT+mFcA/
	f4pN6z29cyCwuxEpRk3Qqnhw9XshKX7KuRzSzU5S22JLyID9gmOHm1He3ku455uoCkV3
	jUZ7fAKBG0G8pAZkOQwxg+cAKl5KnbphW/+6/yk/YaNKY/ig5wyy0hof4QQu09GS8DPL
	HjF5XWtQfMyum2eozgsQjJjs/7dLgJIv2cyQeQ3BtxDzJHdemmzBF6QzIk3Phrj37LhR
	aCzQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKC3fG
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:12 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 11/23] tools/guest: save: move iov array
Date: Thu, 29 Oct 2020 18:19:51 +0100
Message-Id: <20201029172004.17219-12-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
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
index cdc27a9cde..385a591332 100644
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
 

