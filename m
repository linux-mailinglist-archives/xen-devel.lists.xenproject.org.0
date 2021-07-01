Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A03B904B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148507.274566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWq-00015B-RV; Thu, 01 Jul 2021 10:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148507.274566; Thu, 01 Jul 2021 10:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWq-0000wq-Cx; Thu, 01 Jul 2021 10:02:40 +0000
Received: by outflank-mailman (input) for mailman id 148507;
 Thu, 01 Jul 2021 10:02:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytSe-0004XT-UD
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:58:20 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bd39e47-8d61-453f-8021-3b2516e0ff03;
 Thu, 01 Jul 2021 09:56:57 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uo5NK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:50 +0200 (CEST)
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
X-Inumbo-ID: 1bd39e47-8d61-453f-8021-3b2516e0ff03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133411;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fv8u8kOPgs+5gp4rBj+tXUjGXKsfh+8d1IsW+dkfVk4=;
    b=S+Xl4Z1zszliY0TzkrzXrYIBAHGDew/2RqvBacfbRbmSaLzzwduoKo4x79mMCm/5g/
    nDuK2IfnqsEdrhAxeKKyVqZJ2Mhv5EI6ybX2QNeiJypMRtsZUGbvjXJBthCOmhe13XmN
    lOjt8ppHej1Y/J8H/BBSmEx+9MBpvruf8K7hKVnI2cP0fPOXESbiD/qXoYUNb/+mhW/A
    xqUUq/CwFuevuGKoDO9vuZsYBvzHrDVFapY3ZH+xnZedCUQQvUK3u97yncGPW5rz7vEJ
    8nlvmt+H4eGDZ/ti0AXEwA4ibB7rn7Dg9iiSJ0oJzsLY/y+NoryAToCjPJyYWveR0HPV
    U7gA==
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
Subject: [PATCH v20210701 25/40] tools: restore: move map_errs array
Date: Thu,  1 Jul 2021 11:56:20 +0200
Message-Id: <20210701095635.15648-26-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move map_errs array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 9d7efff03d..7684c35e22 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -241,6 +241,7 @@ struct sr_restore_arrays {
     uint32_t types[MAX_BATCH_SIZE];
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    int map_errs[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index d7ea52b89e..578ee1accb 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
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
 

