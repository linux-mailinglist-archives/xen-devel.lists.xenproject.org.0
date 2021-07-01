Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4F3B903A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148406.274388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytVw-0001Fb-LA; Thu, 01 Jul 2021 10:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148406.274388; Thu, 01 Jul 2021 10:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytVw-0001CU-Gt; Thu, 01 Jul 2021 10:01:44 +0000
Received: by outflank-mailman (input) for mailman id 148406;
 Thu, 01 Jul 2021 10:01:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytS0-0004XT-Su
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:40 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 675c9bdf-ecdf-4f97-98b0-3206d03c9de6;
 Thu, 01 Jul 2021 09:56:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ul5N5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:47 +0200 (CEST)
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
X-Inumbo-ID: 675c9bdf-ecdf-4f97-98b0-3206d03c9de6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133407;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=IfTAu6csmKih3Ul30va1DloKz84aTf69Oy5gDcqna/s=;
    b=XsemlVKcnJEPbQEhuTh/f1/P0zNwYk0GDD5ZFuuNMui6+I/UoY1e6NDIuYcO19mwvm
    s/eXT+Fh3UD049CqyU/fJmDpnjQzCe+OQpFcvEcaUeFZSf+A0l9zGa4BMziPLBXkIu09
    Su8fRSH5+dNneKXI21FBmwHRoZubAnptMo/D6E0GoSJ1iExRZ+kINd8RCJU6m74/I2XF
    iO76syePZoRLpr71rO453SjEadeizZOC7cpU9DcxFXrhYuYBQVKvbLrgj3OEayRwWCEp
    93dHtlIrraIEWffntlkPa6bGCK+AOa3T05EswFZrM8BMVd6j1+c81mWtqOB4TQi63TGb
    seUw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 17/40] tools: save: move types array
Date: Thu,  1 Jul 2021 11:56:12 +0200
Message-Id: <20210701095635.15648-18-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 1415a182d2..5bd2913cb6 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -227,6 +227,8 @@ struct sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     /* write_batch: Mfns of the batch pfns. */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    /* write_batch: Types of the batch pfns. */
+    xen_pfn_t types[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 6b09784be8..0883c1fac0 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
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

