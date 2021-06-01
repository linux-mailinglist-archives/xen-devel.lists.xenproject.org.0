Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606403977A0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134987.251062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6ze-0007rF-En; Tue, 01 Jun 2021 16:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134987.251062; Tue, 01 Jun 2021 16:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6ze-0007jB-6Z; Tue, 01 Jun 2021 16:11:50 +0000
Received: by outflank-mailman (input) for mailman id 134987;
 Tue, 01 Jun 2021 16:11:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zc-0005X1-Vp
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:49 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.169])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d95e56a8-658a-4556-a121-5a0a161d398a;
 Tue, 01 Jun 2021 16:11:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBU1BH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:30 +0200 (CEST)
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
X-Inumbo-ID: d95e56a8-658a-4556-a121-5a0a161d398a
ARC-Seal: i=1; a=rsa-sha256; t=1622563890; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YMR9cnE/7YTMLEsOAkqAaGI/s9hiUMB9XThQFl0NtmytdriDfkpznVZNJ5H9zOIuiq
    SB8U1oZikyG0GXcnyYvjvaZRxAuL3+gCuMuEmkQaZ1gEb/uQD0mOeMp4hp5vQzR5g4qo
    M0KlcQlZC7TOpXMC7c4KbAqv78NQVVKI8tPgcuEaQhleMUPT9fGdNWoqvTElzXAtGVhv
    RjXsCkmW1+AsTMos6fUsYcGOC4Kxc6ej5G806z2FT0lnR2IALlSb3llwuWSBBNR1FAeJ
    vBFExwNHFwD3xwMx7kxBWkXxq1x/he6LIftLl9Auo+UVXlCrsIBVTQsdthOhqVnAWRPs
    s5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563890;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yKL38YLQb6Sra5wh9hHuxAm/2IobWvLNV1y2lL6e8b0=;
    b=p4YmyBC9+RbKz2QbG/UltqPdFVcJhVy/agk4dz6I7fPe7w3g6b6vqEe8wxX4sy14pj
    J4vyp4A1cZLShGuGGjICkoGxWxRFfh4oHKSHJkKY2jbETn+dZof6QF/c6BkAlJcOU2hG
    XCiORVT+sP7B52ZB4dtFUuf7zk130chphDl/xshi/hocRl9hidJhfzxpUr556VozCdas
    3CEOdVaBPMQoIAAZXMbOOwO6ki+kqTeuioRDUJ23Wbq2iqSvrgD/eI05OH/2Q2AHqrel
    Mx1BHxjZ/I049hSpuB7QSpaZj/1UML+CqyA4WNUIc9CiDNH5LfcjWs3Dvbe6SqEk0CQB
    DRWQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563890;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yKL38YLQb6Sra5wh9hHuxAm/2IobWvLNV1y2lL6e8b0=;
    b=S/4senCq7s40tD0AErAmsIDsxFNOWSmL/5lyhGIVEG0hbn0AEHz82+rBKNT56SRWk0
    FJgKATfvzGEbtKO1w5ojKjm0dFnC1PRzjpm3QDphUcTB6qR7Um+HIZIqNex2mCLOCJiB
    IRC8nSEJNg644oKCgOk6RDlO9QTkYvmkUKodUsUR8xVVzFafNXDBXCNB3aTuKUyoaefD
    0Xczd9EvaQbhMSzQ9aBhouWjurTZ2dS/C6ZIOks6z3acGTFR4TqS+kQm6D+25FpGDgrM
    GsfxPSk+56+oKsmQEaPGLMBAEU9sFT1Nw1xxHVeLCFG0YZ0PrhHsrG+cXSdYlBy7ESdD
    JM2Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 12/38] tools/guest: save: move types array
Date: Tue,  1 Jun 2021 18:10:52 +0200
Message-Id: <20210601161118.18986-13-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 2335e6d27b..81d4a79b13 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -227,6 +227,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     /* write_batch: Mfns of the batch pfns. */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    /* write_batch: Types of the batch pfns. */
+    xen_pfn_t types[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 1719ff08ba..be65286570 100644
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

