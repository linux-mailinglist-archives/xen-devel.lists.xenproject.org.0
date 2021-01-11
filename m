Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F268C2F1D01
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65187.115521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Js-0005Il-VX; Mon, 11 Jan 2021 17:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65187.115521; Mon, 11 Jan 2021 17:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Js-0005Ho-Qj; Mon, 11 Jan 2021 17:49:32 +0000
Received: by outflank-mailman (input) for mailman id 65187;
 Mon, 11 Jan 2021 17:49:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Dx-0002a6-0z
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:25 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b76640f9-f262-4169-ad96-c449ff821832;
 Mon, 11 Jan 2021 17:42:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgbM3e
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
X-Inumbo-ID: b76640f9-f262-4169-ad96-c449ff821832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386963;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=+/YrJrdWLFQBmx4Fjz9uQTzJVj46LYQgpP9ngHfsNNY=;
	b=EnxLFPwEv2/XQJXwLr2piJLbqYbFvRE4H44Mx69GcQbr7cl6y7wB/KPBov3VJfs3kS
	tydYFH711mfkBqqg3l1T8JZnSOWdM6oxPDpl7VPN9w0/WbxFFbHW4XCKdInQXJmqJ9Q4
	NfotRExH8dbh9rPrlrM5htopRJTfb4Iq9FgsopDVPM5GRZRP7HHXA3DqTzNSTujNGE0v
	aX5EoikmexJVPvmZcvLhPHhMka5dcYWbz3lojr8sGg2QF2gMnfJJAnkH0aol4wZ3sMWK
	dc7bwrbPawa/ifINxldGlgtJWiMu7u7eqeXY1ariVvxVwg8Fn/dwFdta3ryrz2QOtOSH
	OtKQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 24/39] tools/guest: restore: move types array
Date: Mon, 11 Jan 2021 18:42:09 +0100
Message-Id: <20210111174224.24714-25-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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
 

