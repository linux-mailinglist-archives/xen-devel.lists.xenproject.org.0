Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD22F1CFE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65177.115484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jh-00054L-HP; Mon, 11 Jan 2021 17:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65177.115484; Mon, 11 Jan 2021 17:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jh-00053j-DY; Mon, 11 Jan 2021 17:49:21 +0000
Received: by outflank-mailman (input) for mailman id 65177;
 Mon, 11 Jan 2021 17:49:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1E7-0002aB-QN
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:35 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a997c43f-2cf2-4048-ad21-9913226509ea;
 Mon, 11 Jan 2021 17:42:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgbM3d
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:37 +0100 (CET)
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
X-Inumbo-ID: a997c43f-2cf2-4048-ad21-9913226509ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386963;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=8HnEje+bi5L28ovh7GxYhMDV/iYGgk+hVnPKuTzQjbY=;
	b=GE9mmUWcTDiEPzeGYU+3pbaO+hW4qhdcugMAYZOttT/JfHA96fscruSy2sEgN3Zxly
	QNMr/qFA3cBIu3q3rrhn0KAKjKCY4jLQ4vfoP3VkuE7zszrNiujFC8BxtETO8jyj6/8I
	I7svFKoJgjFyG/a79+Rfqs3fXQAKBlOAVfqoO2OmtmdRNZPkz4r2cBLpdQthwh8UXYzc
	QaI+O/cds4xSvnfUSAnBdvqWK88Zhuf/hfsQYqF0d5mumyUODz5gqOMf57LUcCny+TLa
	sWog8ftePycC9H/x4KRVpSH/dkfVWdpy2SAMUvauBMh2jnEai3WXLcyZJXARYqLHq6Xc
	dbUA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 23/39] tools/guest: restore: move pfns array
Date: Mon, 11 Jan 2021 18:42:08 +0100
Message-Id: <20210111174224.24714-24-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move pfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 2 ++
 tools/libs/guest/xg_sr_restore.c | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 2a020fef5c..516d9b9fb5 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -224,6 +224,8 @@ struct xc_sr_save_arrays {
 };
 
 struct xc_sr_restore_arrays {
+    /* handle_page_data */
+    xen_pfn_t pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 4a9ece9681..7d1447e86c 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -315,7 +315,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     unsigned int i, pages_of_data = 0;
     int rc = -1;
 
-    xen_pfn_t *pfns = NULL, pfn;
+    xen_pfn_t *pfns = ctx->restore.m->pfns, pfn;
     uint32_t *types = NULL, type;
 
     /*
@@ -363,9 +363,8 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    pfns = malloc(pages->count * sizeof(*pfns));
     types = malloc(pages->count * sizeof(*types));
-    if ( !pfns || !types )
+    if ( !types )
     {
         ERROR("Unable to allocate enough memory for %u pfns",
               pages->count);
@@ -412,7 +411,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
                            &pages->pfn[pages->count]);
  err:
     free(types);
-    free(pfns);
 
     return rc;
 }

