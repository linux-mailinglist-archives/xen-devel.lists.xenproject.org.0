Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98712F1CC7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65122.115390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Dk-0003b5-IR; Mon, 11 Jan 2021 17:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65122.115390; Mon, 11 Jan 2021 17:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Dk-0003Zn-A4; Mon, 11 Jan 2021 17:43:12 +0000
Received: by outflank-mailman (input) for mailman id 65122;
 Mon, 11 Jan 2021 17:43:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Di-0002a6-0W
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:10 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4beeb7a-ffbe-4a9c-b3de-c2e05f341f80;
 Mon, 11 Jan 2021 17:42:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgZM3X
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
X-Inumbo-ID: e4beeb7a-ffbe-4a9c-b3de-c2e05f341f80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386961;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=Njonc8T/80Z53NU5lA96pLqPEcrehrY0+bYK+0WpwhM=;
	b=M33zzIxUkVuiiaLsUl6OBcqpunXBuBlXxsX3d8kad4Gfu6kA90KNvVaRP8HkItXx5K
	veli27lY+Pou7k5lEwaErCGVYvFv2LtnVQMDmL9x77xZpf5dnslmmxjnWpV7BqFXMaGs
	glpfrUN/IYlAFPi9osJld3OMN+VMovk1iKlfizpW+eMX6VhcaZgsLTEMIfQRJdvCCG9+
	2GDX/St7eDAMz1cP1KKlU67+o5cP8LvuQsDpWdDAXaW53MeJtr3XhCDpsGoNdfZw8xAo
	anyS2Sn2jA4kszwb6IHWDE0obb9ddzuiRmhGLQGYzY/3Yr07sd/E0Ye4+j77W2qhIMn/
	3NeA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 18/39] tools/guest: save: move errors array
Date: Mon, 11 Jan 2021 18:42:03 +0100
Message-Id: <20210111174224.24714-19-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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
index ff70f62b1e..a1bddd5dcb 100644
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

