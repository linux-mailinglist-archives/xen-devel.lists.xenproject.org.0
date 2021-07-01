Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DAC3B901C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148348.274223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRR-00078n-7u; Thu, 01 Jul 2021 09:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148348.274223; Thu, 01 Jul 2021 09:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRR-00071t-2y; Thu, 01 Jul 2021 09:57:05 +0000
Received: by outflank-mailman (input) for mailman id 148348;
 Thu, 01 Jul 2021 09:57:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRO-0004r4-Fp
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:02 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c587559b-37c5-434a-b906-25f3b6bdca35;
 Thu, 01 Jul 2021 09:56:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ul5N8
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
X-Inumbo-ID: c587559b-37c5-434a-b906-25f3b6bdca35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133408;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JtFmFI89VrmWr2vsArcScvsm4YNWIztizbLrNUj8v3A=;
    b=KF+/i2w2jn0OOsptwi4M0yyQC9/LaijzHsOLKpPAEf0C//wVSKbRIk+XVjsQX7aMP5
    pqFw6zhfu/4rm4fwzY7XBLDKe5PvzWH4M8FtlsYYGhly0yYXTG18oArFTlndqyD+SzzY
    8ZflkpY0K5epQ2Ns/L1DGVkdHLE/nD1yHWF3SN+6aerEc29EbxuJYB8XtQJyQUbNdfqo
    wdVfiAXgkTDLT3ucJ3KGWEczM0iB0VgTqX1LXMoGKL4zS1o+SkqUFfiy1FY+piUdnnfn
    UbS0/7qxmjisfu+6SzRoywgIDRYJ3L+ACrbYCrQfWlGvW/j+EnHRwjtNSNIcF2olHkCQ
    CSPw==
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
Subject: [PATCH v20210701 18/40] tools: save: move errors array
Date: Thu,  1 Jul 2021 11:56:13 +0200
Message-Id: <20210701095635.15648-19-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
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
index 5bd2913cb6..25ee8fcb0f 100644
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

