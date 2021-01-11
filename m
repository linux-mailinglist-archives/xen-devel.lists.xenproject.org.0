Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7E2F1D11
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65250.115676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kp-0007Jh-H0; Mon, 11 Jan 2021 17:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65250.115676; Mon, 11 Jan 2021 17:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kp-0007Hm-8I; Mon, 11 Jan 2021 17:50:31 +0000
Received: by outflank-mailman (input) for mailman id 65250;
 Mon, 11 Jan 2021 17:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1EH-0002a6-1c
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:45 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc93e4e6-b6a0-4a48-bf8b-551f3d685d1b;
 Mon, 11 Jan 2021 17:42:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgcM3g
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:38 +0100 (CET)
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
X-Inumbo-ID: dc93e4e6-b6a0-4a48-bf8b-551f3d685d1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386964;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=hpVNJcvCo1Nci9xkIIy9iyHUvD/MXxHiNddZBiksKp8=;
	b=AJ/0Gz9JuTh/Mutcz2aOwA6itMJPhZNDCcb9u5IqGaAJJiurN/qln08K0LFS8J8hC5
	qNBTiuYIZuHo3eoDNHODUDeEpLUzYNrWyKRk4UHNVnoW03TNaCCYESy2HZOQkUYTTn6w
	Y65rCIko0uvtjRFvEVeg8s5NAaF5wPkhEYApwIfBv1zLheaFLG0WBi8B3+N4UPX8zgPi
	hnkv0oAJD55sfvIyg2lQXIhDjR/oPEkKblM/1X1YoJtDkj3xyIHciAxDM41hHdcYqB1y
	88OpIsoq3CE3/MfU3L9bjSCiop4Iu971eEWKnJurekrakYuuHyOW3wrVY6etv5ESouK+
	Cn6g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 26/39] tools/guest: restore: move map_errs array
Date: Mon, 11 Jan 2021 18:42:11 +0100
Message-Id: <20210111174224.24714-27-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move map_errs array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 5731a5c186..eba3a49877 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -229,6 +229,7 @@ struct xc_sr_restore_arrays {
     uint32_t types[MAX_BATCH_SIZE];
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    int map_errs[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 3ba089f862..94c329032f 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -206,21 +206,13 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->restore.m->mfns;
-    int *map_errs = malloc(count * sizeof(*map_errs));
+    int *map_errs = ctx->restore.m->map_errs;
     int rc;
     void *mapping = NULL, *guest_page = NULL;
     unsigned int i, /* i indexes the pfns from the record. */
         j,          /* j indexes the subset of pfns we decide to map. */
         nr_pages = 0;
 
-    if ( !map_errs )
-    {
-        rc = -1;
-        ERROR("Failed to allocate %zu bytes to process page data",
-              count * (sizeof(*mfns) + sizeof(*map_errs)));
-        goto err;
-    }
-
     rc = populate_pfns(ctx, count, pfns, types);
     if ( rc )
     {
@@ -298,8 +290,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     if ( mapping )
         xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
-    free(map_errs);
-
     return rc;
 }
 

