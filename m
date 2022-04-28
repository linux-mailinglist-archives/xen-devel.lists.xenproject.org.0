Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF837512E5A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316176.535006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVE-0006qY-HZ; Thu, 28 Apr 2022 08:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316176.535006; Thu, 28 Apr 2022 08:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVE-0006eF-2e; Thu, 28 Apr 2022 08:27:56 +0000
Received: by outflank-mailman (input) for mailman id 316176;
 Thu, 28 Apr 2022 08:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVA-0005SM-EB
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 172293ae-c6cd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:27:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE17421874;
 Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFF4713491;
 Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mGl2LQVQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:49 +0000
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
X-Inumbo-ID: 172293ae-c6cd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27ryrQ9/V3A+L0L1cMkzg+znNHks8+NEi42Ak1eCxTQ=;
	b=OuTXoWvhfYYiK6CpG+Xj3URKFgDVAutPiSkezySiwcZy5fZN/9LUWyECUUdJYzu/QyFtIK
	IlWEbdsvMavVm0S7cE2dMet6r3Ofm33wYWqZxXMaKMQ+q2ofTy2NzLxMYjglo8jdcdMQIn
	Gfl9iKNb3w0tnJ62vhff94o8tpqp+WM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 08/19] xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
Date: Thu, 28 Apr 2022 10:27:32 +0200
Message-Id: <20220428082743.16593-9-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
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


