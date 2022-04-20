Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA3F508BAB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309361.525627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByC-0007bS-Oj; Wed, 20 Apr 2022 15:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309361.525627; Wed, 20 Apr 2022 15:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByB-00079l-J2; Wed, 20 Apr 2022 15:10:15 +0000
Received: by outflank-mailman (input) for mailman id 309361;
 Wed, 20 Apr 2022 15:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBy2-0003l4-N6
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3288839-c0bb-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 17:10:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 326F31F752;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0350D13AD5;
 Wed, 20 Apr 2022 15:10:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wJc1O0giYGJILQAAMHmgww
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
X-Inumbo-ID: f3288839-c0bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CI5eCbbUh0HTvUxNvVm6rOMW68v7G6W10HjxAtg/ngA=;
	b=gjZEMURyKhH+ffoe/cJZIs+1qR6NiuC5LbjUsc6HQbUiY2YzhMqa9gcWbW4J8W52XRcuUB
	bxVKmzgppOt2rXgXD9zG+IZ7iT7xfDjw0J35R694tg4TxR9zrp0FyFGkwbXBgSna0vfc7P
	/KVWK5ggl/fmh28DGQ7IZcMIgPfHAnU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 12/18] xen/tpmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Wed, 20 Apr 2022 17:09:36 +0200
Message-Id: <20220420150942.31235-13-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify tpmfront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/char/tpm/xen-tpmfront.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 69df04ae2401..379291826261 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -253,20 +253,12 @@ static int setup_ring(struct xenbus_device *dev, struct tpm_private *priv)
 	struct xenbus_transaction xbt;
 	const char *message = NULL;
 	int rv;
-	grant_ref_t gref;
 
-	priv->shr = (void *)__get_free_page(GFP_KERNEL|__GFP_ZERO);
-	if (!priv->shr) {
-		xenbus_dev_fatal(dev, -ENOMEM, "allocating shared ring");
-		return -ENOMEM;
-	}
-
-	rv = xenbus_grant_ring(dev, priv->shr, 1, &gref);
+	rv = xenbus_setup_ring(dev, GFP_KERNEL, (void **)&priv->shr, 1,
+			       &priv->ring_ref);
 	if (rv < 0)
 		return rv;
 
-	priv->ring_ref = gref;
-
 	rv = xenbus_alloc_evtchn(dev, &priv->evtchn);
 	if (rv)
 		return rv;
@@ -331,11 +323,7 @@ static void ring_free(struct tpm_private *priv)
 	if (!priv)
 		return;
 
-	if (priv->ring_ref)
-		gnttab_end_foreign_access(priv->ring_ref,
-				(unsigned long)priv->shr);
-	else
-		free_page((unsigned long)priv->shr);
+	xenbus_teardown_ring((void **)&priv->shr, 1, &priv->ring_ref);
 
 	if (priv->irq)
 		unbind_from_irqhandler(priv->irq, priv);
-- 
2.34.1


