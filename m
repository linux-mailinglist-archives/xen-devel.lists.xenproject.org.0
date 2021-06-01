Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BC3977D1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135062.251319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo74X-0007bO-Bl; Tue, 01 Jun 2021 16:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135062.251319; Tue, 01 Jun 2021 16:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo74X-0007YE-84; Tue, 01 Jun 2021 16:16:53 +0000
Received: by outflank-mailman (input) for mailman id 135062;
 Tue, 01 Jun 2021 16:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70L-0005Ec-2e
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:33 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3763927-e6a9-4fd4-87dd-f33d389b1d2a;
 Tue, 01 Jun 2021 16:11:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBY1BQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:34 +0200 (CEST)
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
X-Inumbo-ID: a3763927-e6a9-4fd4-87dd-f33d389b1d2a
ARC-Seal: i=1; a=rsa-sha256; t=1622563894; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YjCXDU33U/i7SQqbO4oNdvChTQ9Xikz/PPoCzCeAMh76/S2n131Zgf+Z3JnYi/7NNx
    KA+HmB0pkoYeKbsmfaN4f0YxSTLKBn4SRn8PyEkfFvZlEfO9zZ1ibzvMgLIWN3Cjep0n
    rVjyEPF962rtyZUnsGfo9K2TjKD1qr9BR/JNb4JGvbTNijZdz3LQIK7i1yTwovLRDmPA
    StjdkMifuaqae6kkRjuK11CdQCjRx2uiO/zgWjxwXOzNRj9whi4PZJ010WV6GS0d0JRn
    oOmrvGAhiQgLLJa1Fof4KZWWHRoCzkfL2twmWO8GKjfto+qZ/8jd4yev5v/PKQJIQC91
    e4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563894;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2CUXZ/FCQQr/mVtYU8Ymox8qVtJ5RlUVL8AFNCIqE5o=;
    b=THUtBBqNyXmXwLsoInTEjQ+V9nWHqPDGjuqPAISrGT9lYd7T5q41L8q5B1BLRWTM/I
    FiS25ENH56Ylj2qC08uGFoG+N4b/DNjRGKPleubnD6k6hHWgi7gQcoqO8AxmOtJUXNvH
    xA5CJM3d8/wbpx03aRuwm8VsViBPKCOlqvUqo2dyNlO7yoMncczD4BB3JBIN/AV+l1n3
    0NOvzBn8jKlMzz/mKgMlBP+rqOBO92pgFz6J6RuKGPyv7hm8Y3HYdZOn5Eum+fOOXHL5
    bIucAB9id0d5K0Dx1YHCG6M1oBO0g7MUac2fLh2UEFInYrY1jfsW2fiawKWkK4lorLQo
    TjuQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563894;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2CUXZ/FCQQr/mVtYU8Ymox8qVtJ5RlUVL8AFNCIqE5o=;
    b=RWo97elgVniK6V+b74Q743JkQM6rkfWGvLM8ZCp9/ufrKvHqYbyY6zYv61duUXW4kg
    zcR3QjEg6a0pfDoKfYCAVgj+k+Ds83eGyMDu0RgbQ7rDFbG2jRup97m+lJrrchp8X6cP
    Ta1jf2uej1BJd7ajNHqubxbVrpgR43h2CZ7dBuCTK/WIjpdXSLpOFuvo6v1AsZiV/Age
    ECYdURZB7iJZsHS8/3dPuncfBeJ6MeGK72NH8yDp4jQFs8ZwfYNTIgnvO1YeyppeaZmQ
    ePsN8GOjb26s8I6E5HSUoQR6TkA3zuXc32CR6XQ0jsLvdhSvKVbVeGjLZkbhChJ5RBCL
    cdOQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 21/38] tools/guest: restore: move map_errs array
Date: Tue,  1 Jun 2021 18:11:01 +0200
Message-Id: <20210601161118.18986-22-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move map_errs array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index c7291bb5ca..cea549d129 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -241,6 +241,7 @@ struct xc_sr_restore_arrays {
     uint32_t types[MAX_BATCH_SIZE];
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    int map_errs[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index aadf322428..b534d80cbc 100644
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
 

