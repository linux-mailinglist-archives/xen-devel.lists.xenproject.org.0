Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B099BD1719
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 07:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141645.1475848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8B2m-0007wg-2P; Mon, 13 Oct 2025 05:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141645.1475848; Mon, 13 Oct 2025 05:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8B2l-0007uI-UJ; Mon, 13 Oct 2025 05:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1141645;
 Sun, 12 Oct 2025 19:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LX1y=4V=linux.dev=thorsten.blum@srs-se1.protection.inumbo.net>)
 id 1v82B8-0002Ve-Nk
 for xen-devel@lists.xenproject.org; Sun, 12 Oct 2025 19:56:27 +0000
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5f7011-a7a5-11f0-980a-7dc792cee155;
 Sun, 12 Oct 2025 21:56:10 +0200 (CEST)
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
X-Inumbo-ID: 7f5f7011-a7a5-11f0-980a-7dc792cee155
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760298968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nwPjdHOW4dMG1T40eFmU0S20/6YP0v1nsjLRSvlumqM=;
	b=lRmFaMe/r96b5PSFLPOJlOmLetbJZ5sVbbBssHGRKkAyQv/yvLbnRCzsuX14hXf4VIeW68
	injMi22daXCMaSkVYEwO0MpJJUwnNbVwLTQDBzwV21Xdf2XMKxxRg/EcnZHLjLplUFFD8B
	JHNxIzUMnUusoY1mx9gg9/NAtYYNfgw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/xen/xenbus: Replace deprecated strcpy in xenbus_transaction_end
Date: Sun, 12 Oct 2025 21:55:09 +0200
Message-ID: <20251012195514.39003-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead. Fix the function comment
and use bool instead of int while we're at it.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/xen/xenbus/xenbus_xs.c | 9 +++------
 include/xen/xenbus.h           | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 528682bf0c7f..970302b3dcc6 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -546,16 +546,13 @@ int xenbus_transaction_start(struct xenbus_transaction *t)
 EXPORT_SYMBOL_GPL(xenbus_transaction_start);
 
 /* End a transaction.
- * If abandon is true, transaction is discarded instead of committed.
+ * If abort is true, transaction is discarded instead of committed.
  */
-int xenbus_transaction_end(struct xenbus_transaction t, int abort)
+int xenbus_transaction_end(struct xenbus_transaction t, bool abort)
 {
 	char abortstr[2];
 
-	if (abort)
-		strcpy(abortstr, "F");
-	else
-		strcpy(abortstr, "T");
+	strscpy(abortstr, abort ? "F" : "T");
 
 	return xs_error(xs_single(t, XS_TRANSACTION_END, abortstr, NULL));
 }
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 7dab04cf4a36..c94caf852aea 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -158,7 +158,7 @@ int xenbus_exists(struct xenbus_transaction t,
 		  const char *dir, const char *node);
 int xenbus_rm(struct xenbus_transaction t, const char *dir, const char *node);
 int xenbus_transaction_start(struct xenbus_transaction *t);
-int xenbus_transaction_end(struct xenbus_transaction t, int abort);
+int xenbus_transaction_end(struct xenbus_transaction t, bool abort);
 
 /* Single read and scanf: returns -errno or num scanned if > 0. */
 __scanf(4, 5)
-- 
2.51.0


