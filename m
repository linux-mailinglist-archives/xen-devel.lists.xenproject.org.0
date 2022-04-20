Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CE508B9D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309356.525569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy4-0005mK-In; Wed, 20 Apr 2022 15:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309356.525569; Wed, 20 Apr 2022 15:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy3-0005UD-SE; Wed, 20 Apr 2022 15:10:07 +0000
Received: by outflank-mailman (input) for mailman id 309356;
 Wed, 20 Apr 2022 15:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBy0-0003l9-78
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f29a7f35-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:10:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F52C1F74E;
 Wed, 20 Apr 2022 15:10:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1721D13AD5;
 Wed, 20 Apr 2022 15:10:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJqaBEgiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:10:00 +0000
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
X-Inumbo-ID: f29a7f35-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27ryrQ9/V3A+L0L1cMkzg+znNHks8+NEi42Ak1eCxTQ=;
	b=tZ70zY2Z8ae+EH5HDjSsCrE0+Obr0+3PLdmMlwpcYTQS6O/gxKd5Wt0smGPntpM64zeZns
	oDNx8gIE1hM6kQMNo7Cc4s/LzaDVNqHIV/dBcgmK7lqMVFb+cnuA2Tt5XNHncoqPC6Byia
	RGfEx698LwhJYEYLJteROadnU2YJOEo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 08/18] xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
Date: Wed, 20 Apr 2022 17:09:32 +0200
Message-Id: <20220420150942.31235-9-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xen-front-pgdir-shbuf.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
index a959dee21134..fa2921d4fbfc 100644
--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -21,15 +21,6 @@
 
 #include <xen/xen-front-pgdir-shbuf.h>
 
-#ifndef GRANT_INVALID_REF
-/*
- * FIXME: usage of grant reference 0 as invalid grant reference:
- * grant reference 0 is valid, but never exposed to a PV driver,
- * because of the fact it is already in use/reserved by the PV console.
- */
-#define GRANT_INVALID_REF	0
-#endif
-
 /**
  * This structure represents the structure of a shared page
  * that contains grant references to the pages of the shared
@@ -83,7 +74,7 @@ grant_ref_t
 xen_front_pgdir_shbuf_get_dir_start(struct xen_front_pgdir_shbuf *buf)
 {
 	if (!buf->grefs)
-		return GRANT_INVALID_REF;
+		return INVALID_GRANT_REF;
 
 	return buf->grefs[0];
 }
@@ -142,7 +133,7 @@ void xen_front_pgdir_shbuf_free(struct xen_front_pgdir_shbuf *buf)
 		int i;
 
 		for (i = 0; i < buf->num_grefs; i++)
-			if (buf->grefs[i] != GRANT_INVALID_REF)
+			if (buf->grefs[i] != INVALID_GRANT_REF)
 				gnttab_end_foreign_access(buf->grefs[i], 0UL);
 	}
 	kfree(buf->grefs);
@@ -355,7 +346,7 @@ static void backend_fill_page_dir(struct xen_front_pgdir_shbuf *buf)
 	}
 	/* Last page must say there is no more pages. */
 	page_dir = (struct xen_page_directory *)ptr;
-	page_dir->gref_dir_next_page = GRANT_INVALID_REF;
+	page_dir->gref_dir_next_page = INVALID_GRANT_REF;
 }
 
 /**
@@ -384,7 +375,7 @@ static void guest_fill_page_dir(struct xen_front_pgdir_shbuf *buf)
 
 		if (grefs_left <= XEN_NUM_GREFS_PER_PAGE) {
 			to_copy = grefs_left;
-			page_dir->gref_dir_next_page = GRANT_INVALID_REF;
+			page_dir->gref_dir_next_page = INVALID_GRANT_REF;
 		} else {
 			to_copy = XEN_NUM_GREFS_PER_PAGE;
 			page_dir->gref_dir_next_page = buf->grefs[i + 1];
-- 
2.34.1


