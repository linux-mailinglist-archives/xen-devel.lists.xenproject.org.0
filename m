Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1163A9B23
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142961.263768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1q-0006u9-H9; Wed, 16 Jun 2021 12:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142961.263768; Wed, 16 Jun 2021 12:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1q-0006p1-4X; Wed, 16 Jun 2021 12:52:22 +0000
Received: by outflank-mailman (input) for mailman id 142961;
 Wed, 16 Jun 2021 12:52:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1o-00075D-8h
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:20 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a55ae0b3-93b5-4fad-bf8e-247239aca60e;
 Wed, 16 Jun 2021 12:51:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpitmI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:44 +0200 (CEST)
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
X-Inumbo-ID: a55ae0b3-93b5-4fad-bf8e-247239aca60e
ARC-Seal: i=1; a=rsa-sha256; t=1623847904; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LTxVl9Oyg2idIwCSzLv4XMhSMg50poqnIqEXBORyknOrl2MMSI8beM3alR1r8dAiNq
    qQfKyOwHUDeig5sb4IxCh8JoJYfeG+8N8odQsng/yKsGvQqpo2ptViKYqtC/Xzo5G5nJ
    5rPBsCgXIsNDynCFvKqv9xIX/YbMCyuBZAXUeAXhABJPZ52VZOqtKnJLYd26Xzagk5rp
    GrkRAX8yk5p+ZOQr4/fqYvZmh3EJrfoEquOCGKFDnhps7jrTi+SHpFY/Mr9UDejr2Phi
    FMgXxfgo4wGBjdWZchBjwZ5wM1pbXDU/YG5JUvfGHbswerXw5v8Y7MkfGRcuvGFgxfNM
    lVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847904;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pnLF16VUG8E4Jp5fWe4D439r7jQrrghaZKOdiE+JFI0=;
    b=t1ElC85hwloXfK5N6nrxainkrTPKhRZHdvPq6dL7JDtPKhDFDmDwz3Jdbpi33IVN+B
    ZHt7hvT3IcBtT/zhhe7WP2SuBbMhqEkYjShsDFuy8JzXQymbXn5pP14l+PMIOu5Mk8IE
    L2s4nWXoAO+1H3V/NwRbw3zUSOozMY2Xso2gyVL32e2MECs7C4UG0nRY+j16xh9RYsqD
    FBhieSIpl/MZciH0KcH3f+lGdZos3fpLTm8jCl4ZGR0ou2t84iSShLXhEjuPhMB+o/Zp
    2luAbl6KpFxhKQszOy/tZXz4JDtMJXI1HFNEfGOaxS2O1/bf1FPK5g1SEZuI8nkmIAmo
    9OxA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847904;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pnLF16VUG8E4Jp5fWe4D439r7jQrrghaZKOdiE+JFI0=;
    b=gCyQuUTTqDyZMhlmYIN9tY4A0P4yNzjeUiLbPrNZBns0jWdbQR/4EIAVBkDiKWm6v8
    +z1bs71Tjm8IgH7dP9k/QuoUljLADS5U+d+ddz8KAqhkIAr2EM0kts06fWJPCuMigebL
    dSNE1S2V61S9fBxiFSRzcDSVsoE6QLr4/J6pZl25d+Wk9KJFGEUz9seNYkVFqSQ+iPpz
    4pZ1Ou9KKgvPt2LOwSndsnDCDNLwGLIKhag4y/LYr2TPWBRjBnpOQlI4u+BGiZa+/oXx
    RWEQH3fboZ+i1pDcrhdc3FyG1dW83flQhyrPENqhh4agYg3xlcQDOQFeIYmKHzDeqpxJ
    W5Sw==
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
Subject: [PATCH v20210616 23/36] tools: restore: move pfns array in populate_pfns
Date: Wed, 16 Jun 2021 14:51:16 +0200
Message-Id: <20210616125129.26563-24-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns' pfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 11 +----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 3cfb23861f..379887e149 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -244,6 +244,7 @@ struct sr_restore_arrays {
     int map_errs[MAX_BATCH_SIZE];
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
+    xen_pfn_t pp_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 0c29478ccb..f2234eac55 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -139,17 +139,10 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
-        *pfns = malloc(count * sizeof(*pfns));
+        *pfns = ctx->restore.m->pp_pfns;
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !pfns )
-    {
-        ERROR("Failed to allocate %zu bytes for populating the physmap",
-              2 * count * sizeof(*mfns));
-        goto err;
-    }
-
     for ( i = 0; i < count; ++i )
     {
         if ( (!types ||
@@ -190,8 +183,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     rc = 0;
 
  err:
-    free(pfns);
-
     return rc;
 }
 

