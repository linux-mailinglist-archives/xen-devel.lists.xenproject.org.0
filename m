Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36D29F2E4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14427.35719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbP-000432-Cs; Thu, 29 Oct 2020 17:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14427.35719; Thu, 29 Oct 2020 17:20:43 +0000
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
	id 1kYBbP-00041n-5L; Thu, 29 Oct 2020 17:20:43 +0000
Received: by outflank-mailman (input) for mailman id 14427;
 Thu, 29 Oct 2020 17:20:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbN-0003MC-Li
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:41 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1211aba-36a0-4d14-9c12-d0ef84df3695;
 Thu, 29 Oct 2020 17:20:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKD3fH
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:13 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbN-0003MC-Li
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:41 +0000
X-Inumbo-ID: b1211aba-36a0-4d14-9c12-d0ef84df3695
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b1211aba-36a0-4d14-9c12-d0ef84df3695;
	Thu, 29 Oct 2020 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992018;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=VVfW+oAH1Frox7ej6KApgNQS/Q90zBjaSWimvZM/Rz8=;
	b=TkkWMSXeFN2eROBRvYQywqH0q0qV5fFJK7u/XrU/lNwp2dPTpeaAsEx2FJNQzWfMC3
	NDTxq9YTAmUp6nQDyAHjWRJlTn1XaODMO0lhzm9VrpQjQIRTKfJZCWLEEeD8JXzXaRMn
	PTOkpnCh0HneHbEaPr0fXD3M1P3rF+rMwSa3EPUWjpv5kBbsu/2i+87lfSaYRGrBcY49
	+0wS65vNO5hVmAszhdW8WnhWK2GDZxJb7CmYSu6FgCH6AbHxVvUnhl3kkg+oVru0ibC0
	nGJrLNRSvHN2Y/hJ+6ctaCyIuZY/WuIiI+nrjkLctW/dX81kQV6CFfX2nGQLbnkLedsp
	oLxQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKD3fH
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:13 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 12/23] tools/guest: save: move rec_pfns array
Date: Thu, 29 Oct 2020 18:19:52 +0100
Message-Id: <20201029172004.17219-13-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move rec_pfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  2 ++
 tools/libs/guest/xg_sr_save.c   | 11 +----------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f315b4f526..81158a4f4d 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -221,6 +221,8 @@ struct xc_sr_save_arrays {
     int errors[MAX_BATCH_SIZE];
     /* write_batch: iovec[] for writev(). */
     struct iovec iov[MAX_BATCH_SIZE + 4];
+    /* write_batch */
+    uint64_t rec_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 385a591332..4d7fbe09ed 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -96,7 +96,7 @@ static int write_batch(struct xc_sr_context *ctx)
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
-    uint64_t *rec_pfns = NULL;
+    uint64_t *rec_pfns = ctx->save.m->rec_pfns;
     struct iovec *iov = ctx->save.m->iov; int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
@@ -201,14 +201,6 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
-    if ( !rec_pfns )
-    {
-        ERROR("Unable to allocate %zu bytes of memory for page data pfn list",
-              nr_pfns * sizeof(*rec_pfns));
-        goto err;
-    }
-
     hdr.count = nr_pfns;
 
     rec.length = sizeof(hdr);
@@ -259,7 +251,6 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    free(rec_pfns);
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )

