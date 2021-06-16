Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E93A9B1B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142946.263679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1W-0002SQ-OC; Wed, 16 Jun 2021 12:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142946.263679; Wed, 16 Jun 2021 12:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1W-0002Mr-JF; Wed, 16 Jun 2021 12:52:02 +0000
Received: by outflank-mailman (input) for mailman id 142946;
 Wed, 16 Jun 2021 12:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1U-00075D-81
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:00 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21727138-bae6-4aea-a9cd-17eb42f3cbf2;
 Wed, 16 Jun 2021 12:51:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpgtmA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:42 +0200 (CEST)
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
X-Inumbo-ID: 21727138-bae6-4aea-a9cd-17eb42f3cbf2
ARC-Seal: i=1; a=rsa-sha256; t=1623847902; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jSZ2Z9L7tplcMdULHYPib6jr8P3O27PjFRi3DaMtcyaivK632dkPPGhq0kdpV3n4Ke
    Ll9sPl0CkDZrFVZWnOKuyHz/G5EsWAHZpZGc24pW4iQ448b2y0LUGLcrGVoYy3QwK/ld
    MkhJ8fFHOemkCAoMSLkdr6LSLIIa4D23B8mjii49uUAIefMR0sq0Nd6lxkFk8nI8bKkJ
    bRnZmGamDGiBnG7I1R2i3mj0vvMQJTTaqYYpjUxs7jC2Ku7iHEvtcE3XrJQe8vDa8Z95
    xiYUTFiCcNR57gDc/1xRquzvncRhqw+S43VFkrZKTidJknSPW7nU7wXcJGfqYYJnVPGK
    C8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847902;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+zNYdRT311M2lTYh9UyGXJAkdHDCHae4YkiiVz2nJTk=;
    b=YMS9icgO95j0umh569k+Un5aJGs6dFWpsZCBYy3KmGCN/UW8obv+2y6cx/La7dD8EA
    j9xVhhfqAYPfxa4A5EWAKt58F72chToPGPOxqRIueqKyb/mWALz3tmA84i1BIU5FBFXy
    lKdInWBa7Ra8ZqLT0OWQX03fnqNgwb5WkaGqZY4zwsFL58xCIoaKXUaGzpe2RgurAafj
    KNx6APWzvA+8bnh9bfjyZk1WVJ7Q476iDHVoT1paw6qrzSCWzf/J9WPQ5kVuGcTmLC7a
    BvM91e0QYYJj46/XgXFwIVIRu8DcL5ymi2leA/7xBJ2msDIn7WT3V/RW2w9AepFWPpRi
    4YMA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847902;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+zNYdRT311M2lTYh9UyGXJAkdHDCHae4YkiiVz2nJTk=;
    b=I565a8Paxp67rMuXqxcCzHUGgYOTV7Qh04/11K40ZE9TdvE5EZGK1CDOtZD1ZhJJJ0
    IRtgquJKznOCTY7oJjMdfm++zrGTTFCwgqk3iww144KlZPJqkf4py3rD52QldjONCo84
    Dyjjg04JTp9XmC2NITklkz8oIPs7FaUNv2OhCrJWzRZrXFcJ/jJ4IgVLAXhYFUBVCW6U
    UP3VvT1yX+BpZgmIgtqI1CN7vwASvmEzzyx0xEcuZYlVLoAZprvhhKnzRnAxQHgH5u1P
    YWBwFn4Ggkrw1ASXJi1sYOthJUYd+/2mTIPyAAZiXj/W4bdaMwgJgU7GDxYuAreEbyIl
    n8RQ==
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
Subject: [PATCH v20210616 19/36] tools: restore: move types array
Date: Wed, 16 Jun 2021 14:51:12 +0200
Message-Id: <20210616125129.26563-20-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 96ae0904fc..fe44302eac 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -238,6 +238,7 @@ struct sr_save_arrays {
 struct sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
+    uint32_t types[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index e18a03b381..d460a2b2b5 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -316,7 +316,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     int rc = -1;
 
     xen_pfn_t *pfns = ctx->restore.m->pfns, pfn;
-    uint32_t *types = NULL, type;
+    uint32_t *types = ctx->restore.m->types, type;
 
     /*
      * v2 compatibility only exists for x86 streams.  This is a bit of a
@@ -363,14 +363,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    types = malloc(pages->count * sizeof(*types));
-    if ( !types )
-    {
-        ERROR("Unable to allocate enough memory for %u pfns",
-              pages->count);
-        goto err;
-    }
-
     for ( i = 0; i < pages->count; ++i )
     {
         pfn = pages->pfn[i] & PAGE_DATA_PFN_MASK;
@@ -410,8 +402,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     rc = process_page_data(ctx, pages->count, pfns, types,
                            &pages->pfn[pages->count]);
  err:
-    free(types);
-
     return rc;
 }
 

