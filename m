Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1443A9B92
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142991.263812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVG1-0003jE-Jd; Wed, 16 Jun 2021 13:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142991.263812; Wed, 16 Jun 2021 13:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVG1-0003fF-FV; Wed, 16 Jun 2021 13:07:01 +0000
Received: by outflank-mailman (input) for mailman id 142991;
 Wed, 16 Jun 2021 13:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1p-0006lZ-1E
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:21 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f7850ed-248e-4334-9e79-bd485c10ed00;
 Wed, 16 Jun 2021 12:51:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpdtm5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:39 +0200 (CEST)
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
X-Inumbo-ID: 1f7850ed-248e-4334-9e79-bd485c10ed00
ARC-Seal: i=1; a=rsa-sha256; t=1623847900; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jXnxuKXXi9YSOUvEDsqfQ/lU2hM8dPHWhZy85fULVb+ZPaiZ+lpuA9lAo88wEyIQ7X
    SqoIxwwxav2z+uy+BRdlvTVehdwmPUH7zW9Z0B47ZwVMyaFPIJiLpeEYq8oYVr9Y+J+R
    UKpIVVoTxy9VjrObf2j9mE7OJV1+mTk3+aj5O81tvzpZrH+GxtvQhXA06cTEXUBZrJfP
    uGqfrmV4onf5fDnNXXS+n2Gix+snjS+G5/MKkvSoiBWwto7+qeFd1/HPOnNyorIYh/2Q
    Mo7VfqwgETTUTBQh9FADRR+NH5D1dQwg+9gbsYTQq43ijBiinc3TQNW6mjsD7S/Q7bU5
    Y2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847900;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SqZyfuP6OhwWmlaC4WpxM23i9gjc0SfkH6LfRu5qTXI=;
    b=ZhoNi07QQy07VhaFaQT6l33vJ2GGOtub+4UaWcd2qHkgHyqF6oVMrF/d5JS6P0vtYH
    V5DcIu5wxkZ+exkhZApDDJ+pW8QX9GULXdNtiwwBybAsggfmdn/ALuRtNAGdIR66HWNF
    tfswfypCnwNjmtF1h23SRCaDjyTAnhnS1Kb0Dca4vh/AlhE0+b9Pc3eNfscTugUctrl8
    g72PFUTY61N7p2SDAh6AnwQWrkX944K3FioBAZpuJ3B7jxDiemHGzo20SIF/hIj66Gbb
    MkTx6cO+9awO2ezgU8VBrxQCIqXPq0NFNt7Z7Aq9cxcfIXkTjiG8iU0Bx9rt4lu1RkU5
    FOKw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847900;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SqZyfuP6OhwWmlaC4WpxM23i9gjc0SfkH6LfRu5qTXI=;
    b=WgvLDIHXTCDnHlevSZ58X7Z9r2oezcfXPemDhnz2t28Br521maZfAbtHKs5lVmssTI
    SZiiQv0THduwxlXrLR/07iQtBMgI4Cri3E3rbgrxCmgvndBi/esg4hyXQhdFo+v2XSve
    g3aHDuDOPUzuapJI0Tv81UKB5fBD9OJH1L807eZ+6wZtU5okXhff9U6c0IkM2YI6WHMj
    YE4Aa8GDPPpwh+VvxjxCGb7WTBXVhQw9u1yQ6BlmQsjbmLCnrrcrn0tXRUbErFbdfdO9
    FDE6mTEeRhFLsE0uTzSS4HO8jv0EimfRw4t1V9MkgypbiDlf+wLgHJqcky8HmR7XHj6F
    xgLw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 14/36] tools: save: move errors array
Date: Wed, 16 Jun 2021 14:51:07 +0200
Message-Id: <20210616125129.26563-15-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move errors array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 1df684acb9..558b5fbf06 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -229,6 +229,8 @@ struct sr_save_arrays {
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     /* write_batch: Types of the batch pfns. */
     xen_pfn_t types[MAX_BATCH_SIZE];
+    /* write_batch: Errors from attempting to map the gfns. */
+    int errors[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 0883c1fac0..9ebbf00ce7 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
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

