Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000482F1CC9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65126.115413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Dp-0003lm-Dp; Mon, 11 Jan 2021 17:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65126.115413; Mon, 11 Jan 2021 17:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Dp-0003kq-4A; Mon, 11 Jan 2021 17:43:17 +0000
Received: by outflank-mailman (input) for mailman id 65126;
 Mon, 11 Jan 2021 17:43:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Dn-0002a6-0c
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:15 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae37d0f9-1ed7-404d-990b-9dd57752af9e;
 Mon, 11 Jan 2021 17:42:43 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgaM3a
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
X-Inumbo-ID: ae37d0f9-1ed7-404d-990b-9dd57752af9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386962;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=g3ZelcGSjw7rs1gaHm22yYHUe41hlhOJJiVowIjc/+E=;
	b=IP+qvxhGOsnUThtQwruu/ikD8nT1XWd9joTyUDpNIImVoJ5GTelpbLIUCA8Dfl68l5
	Kn8oXL04us+WkYQAlGh2e8fUhuFtR0XfbztJleTr0QSH5AiKyz/eT8evL0ZEae3WAgen
	MPo0W+KEu8gFn8NPYbIreUmGGPqql8TXyppV1vqdYTRMtc5yaxon0WgCu3PKNq4yXj6O
	VucDprYFpgctBcr2HAFEEht2NS5MDScLk4pMDDqFZ5bt9CMkgR+ttlCvQfEwpfrj5dyz
	HQlprG9Ry5KZVwZDoD6iW0A0D2e3GF6xlCLcmbxynPPHM6a3IW/WTjaFK8wcMGB24G4P
	R36Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 20/39] tools/guest: save: move rec_pfns array
Date: Mon, 11 Jan 2021 18:42:05 +0100
Message-Id: <20210111174224.24714-21-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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
index 1d04bd0a44..0e34c4b051 100644
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

