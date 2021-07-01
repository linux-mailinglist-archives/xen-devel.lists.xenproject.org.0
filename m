Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437F3B9025
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148362.274306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRk-0002dz-KA; Thu, 01 Jul 2021 09:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148362.274306; Thu, 01 Jul 2021 09:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRk-0002WF-6J; Thu, 01 Jul 2021 09:57:24 +0000
Received: by outflank-mailman (input) for mailman id 148362;
 Thu, 01 Jul 2021 09:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRi-0004r4-Gk
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:22 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3f38ebc-a56c-4e01-8323-f92017ee84eb;
 Thu, 01 Jul 2021 09:56:57 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619up5NL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:51 +0200 (CEST)
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
X-Inumbo-ID: b3f38ebc-a56c-4e01-8323-f92017ee84eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133411;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6ENQhbtthK4eIjkXxFO8V/gNE/sF6qih6TLZLeOb+b0=;
    b=tXgf/73seA2ReRIm8D/JvX4Ys0pziOMDW4aurCKsesPhuWp5kqvEKayk+88kKUk4FQ
    a1798geALsJt37Y5/f/RrZn6uJh2462CYxJwdMIfw8h7sXroDhjML12aaxRwKDgRoytd
    oQ9hwexHpCtTDxA70biVJOi8pSGynJ4nXJWgoxdOYJchetsXIMdXJioL0B9Y5ujMLWRG
    eZzZ3aTgGqEIWr0XgQvxepGEPbmx5vntjJEPKZDqHe9ZwHuTfwvgN9hxrxVNJZT/0qMF
    wnYCEkn4Ao6LrXPnvy4cn5BPloAViOynzk9AmdmLAiXfbZW4gkbxiuuJ2cLmWz8vsH6R
    ROIw==
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
Subject: [PATCH v20210701 26/40] tools: restore: move mfns array in populate_pfns
Date: Thu,  1 Jul 2021 11:56:21 +0200
Message-Id: <20210701095635.15648-27-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns mfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 7684c35e22..9d2ea96583 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -242,6 +242,8 @@ struct sr_restore_arrays {
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
+    /* populate_pfns */
+    xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 578ee1accb..7418abf1c5 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -138,12 +138,12 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                   const xen_pfn_t *original_pfns, const uint32_t *types)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
+    xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
         *pfns = malloc(count * sizeof(*pfns));
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !mfns || !pfns )
+    if ( !pfns )
     {
         ERROR("Failed to allocate %zu bytes for populating the physmap",
               2 * count * sizeof(*mfns));
@@ -191,7 +191,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
  err:
     free(pfns);
-    free(mfns);
 
     return rc;
 }

