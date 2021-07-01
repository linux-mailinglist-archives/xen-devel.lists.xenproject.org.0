Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1E3B9046
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148490.274520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWi-0007pd-80; Thu, 01 Jul 2021 10:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148490.274520; Thu, 01 Jul 2021 10:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWi-0007lJ-1X; Thu, 01 Jul 2021 10:02:32 +0000
Received: by outflank-mailman (input) for mailman id 148490;
 Thu, 01 Jul 2021 10:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytSU-0004XT-Tu
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:58:10 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ba2abb8-8840-41fd-a5d0-ee4432074b69;
 Thu, 01 Jul 2021 09:56:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619un5NF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:49 +0200 (CEST)
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
X-Inumbo-ID: 7ba2abb8-8840-41fd-a5d0-ee4432074b69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133410;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SEmlTCun49Bu0J5Hduo4Ou5xOCzHrO1gLgKtshkEibk=;
    b=leNKNgImZhFpMAUfRvKFT4UTuw7NNJ/AvWciHuO8ximTBy06TMcEBStzALzWRO3rBe
    H+ej4+CDkSuH0BtA0Sfuxbw1jSA2WpfBjAI+EgLyb/5ECI9CO3bPmHq5vXC3iGBjpihu
    Sn994HSbXw2wHckqAlMC5FzL2gMQv7wAaOY1B9I3GHZB8kFAV980UQu30b2xaCPlWHue
    UYLT52fitrn8J6w7JbF1QpSy03aY1an/h9nveX+G+mL04/Y9I9Skq+c5z5+c3fDLhuVR
    55Me5xHBvzm6+2jnIMSDcai8W1SaEc1vRc6+RZfdSWShl7Z3sgHxhHWYwKVIZfvgXYta
    wsyA==
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
Subject: [PATCH v20210701 23/40] tools: restore: move types array
Date: Thu,  1 Jul 2021 11:56:18 +0200
Message-Id: <20210701095635.15648-24-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
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
index 8089449011..d798b79745 100644
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
index c203ce503d..8ea125cf73 100644
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
 

