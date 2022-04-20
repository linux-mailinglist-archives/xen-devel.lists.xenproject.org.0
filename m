Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1634508BA1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309354.525552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy2-0005IW-ML; Wed, 20 Apr 2022 15:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309354.525552; Wed, 20 Apr 2022 15:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy2-000545-1N; Wed, 20 Apr 2022 15:10:06 +0000
Received: by outflank-mailman (input) for mailman id 309354;
 Wed, 20 Apr 2022 15:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBxz-0003l9-70
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f280d0b4-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:10:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1094E215FC;
 Wed, 20 Apr 2022 15:10:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDE5413AD5;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iEbyNEciYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:59 +0000
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
X-Inumbo-ID: f280d0b4-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPIngja7rfH6/X0ahWtYB7L7nX8NRl4zj/+cjR7xZr0=;
	b=izW36Q/K4I+x9+ssoIZTIP6kcaOBnqGIAchacXhFrguclN9mlcwDy5Y3j6XIl58RxItKh2
	yFKJRHgSaBRlN10cFBSOt7Ea7MtSQEgQQW0NFvI/a+0rlT0kNILSRJWUf2qg0/waqA7ALN
	NEaH3ZeHIDVzSTHBGCrCGbqlRrM0AMs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 07/18] xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
Date: Wed, 20 Apr 2022 17:09:31 +0200
Message-Id: <20220420150942.31235-8-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/gntdev-dmabuf.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index d5bfd7b867fc..91073b4e4a20 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -24,15 +24,6 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
-#ifndef GRANT_INVALID_REF
-/*
- * Note on usage of grant reference 0 as invalid grant reference:
- * grant reference 0 is valid, but never exposed to a driver,
- * because of the fact it is already in use/reserved by the PV console.
- */
-#define GRANT_INVALID_REF	0
-#endif
-
 struct gntdev_dmabuf {
 	struct gntdev_dmabuf_priv *priv;
 	struct dma_buf *dmabuf;
@@ -532,7 +523,7 @@ static void dmabuf_imp_end_foreign_access(u32 *refs, int count)
 	int i;
 
 	for (i = 0; i < count; i++)
-		if (refs[i] != GRANT_INVALID_REF)
+		if (refs[i] != INVALID_GRANT_REF)
 			gnttab_end_foreign_access(refs[i], 0UL);
 }
 
@@ -567,7 +558,7 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storage(int count)
 	gntdev_dmabuf->nr_pages = count;
 
 	for (i = 0; i < count; i++)
-		gntdev_dmabuf->u.imp.refs[i] = GRANT_INVALID_REF;
+		gntdev_dmabuf->u.imp.refs[i] = INVALID_GRANT_REF;
 
 	return gntdev_dmabuf;
 
-- 
2.34.1


