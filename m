Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93A29F2EF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14439.35775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBba-0004Rx-1V; Thu, 29 Oct 2020 17:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14439.35775; Thu, 29 Oct 2020 17:20:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbZ-0004Q5-Oo; Thu, 29 Oct 2020 17:20:53 +0000
Received: by outflank-mailman (input) for mailman id 14439;
 Thu, 29 Oct 2020 17:20:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbX-0003MD-Nw
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:51 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8acf577a-2151-4411-8110-51fcf5b5d3c3;
 Thu, 29 Oct 2020 17:20:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKE3fO
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:14 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbX-0003MD-Nw
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:51 +0000
X-Inumbo-ID: 8acf577a-2151-4411-8110-51fcf5b5d3c3
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8acf577a-2151-4411-8110-51fcf5b5d3c3;
	Thu, 29 Oct 2020 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992020;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=+/YrJrdWLFQBmx4Fjz9uQTzJVj46LYQgpP9ngHfsNNY=;
	b=KgAiCTG6MTTv88AsoblIMcLuAeIHAYJP7vdff65WN3i7lIBdymfh1dFxmBOfxnULbH
	9XrbAvJwsQqAwevBUO1V1rtPijyqQZDN1pvm9RCfmDunnbV7ZPjknZuyopbMi823g37e
	k0u0nDAAmE6c03KnaivQqqL4nvuD53P67c2LhoeoWqIko6wSE96tShAK2NrIWlMnEmY3
	5n+PNyTU60TPWdfAwkytJxmBevM+1vXpcJj48p08Rg0jKpaZGT6juwBBfnQivxhGMdUV
	2Pd7oGzcugqF7srBMib1aR2QPn/21M+FdvDSd/7Zba5/gXuYv+k+Aru3WjYLO/2NmtwC
	My3w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKE3fO
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:14 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 16/23] tools/guest: restore: move types array
Date: Thu, 29 Oct 2020 18:19:56 +0100
Message-Id: <20201029172004.17219-17-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 516d9b9fb5..0ceecb289d 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -226,6 +226,7 @@ struct xc_sr_save_arrays {
 struct xc_sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
+    uint32_t types[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 7d1447e86c..7729071e41 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
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
 

