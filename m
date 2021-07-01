Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0E3B9047
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148491.274526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWi-0007xl-MC; Thu, 01 Jul 2021 10:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148491.274526; Thu, 01 Jul 2021 10:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWi-0007qw-E6; Thu, 01 Jul 2021 10:02:32 +0000
Received: by outflank-mailman (input) for mailman id 148491;
 Thu, 01 Jul 2021 10:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytSj-0004XT-UH
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:58:25 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bf55f4c-8ccb-4310-b27b-a0a9200a22e3;
 Thu, 01 Jul 2021 09:56:57 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619up5NN
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
X-Inumbo-ID: 2bf55f4c-8ccb-4310-b27b-a0a9200a22e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133411;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NzRIOkyxxUnksLPgAOMJtNoYSt71bd12f8S/qdAp4ys=;
    b=E3E63ORgeCjrZTaxjNFk+nyNw7JY0SiH/yHCVGqWhuC+TMeeeO3l/fAfSOgtVCoqjk
    GQ0o3YUjOVWcNJOMoO/SLpZLuQuE7110MjTbSJ8jSo9wfgkfQvE1z6FBr4+fZT+TK3Wx
    RNhXmirclaWDaJSgkxd6i/XqP7taUsITGTpjfgqjHXsbD7UxsCLi0o2MkJqQtmiS3pQY
    GkTWSjv1rNqGPCt1J7CZqv35cj7LRlB8qlC6uBqMkD9Pj1SMoVvEu2GxXwGjj26xvl8O
    tweDh0TQpuEb86rHI8sma/iiu6EhE03FQLd4yZQLNMr3j079ckgF1POvpg7OjQaU+k7d
    2qvg==
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
Subject: [PATCH v20210701 27/40] tools: restore: move pfns array in populate_pfns
Date: Thu,  1 Jul 2021 11:56:22 +0200
Message-Id: <20210701095635.15648-28-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
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
index 9d2ea96583..c319148f8f 100644
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
index 7418abf1c5..2a6ccce847 100644
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
 

