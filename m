Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E994DC24C3D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 12:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154187.1484288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnDG-0004M3-Do; Fri, 31 Oct 2025 11:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154187.1484288; Fri, 31 Oct 2025 11:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnDG-0004K0-BB; Fri, 31 Oct 2025 11:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1154187;
 Fri, 31 Oct 2025 11:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJ0r=5I=linux.dev=thorsten.blum@srs-se1.protection.inumbo.net>)
 id 1vEnDE-0004Ju-27
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 11:22:32 +0000
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [2001:41d0:203:375::b5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e577ca-b64b-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 12:22:30 +0100 (CET)
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
X-Inumbo-ID: e2e577ca-b64b-11f0-9d16-b5c5bf9af7f9
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761909748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nyjzKpu22Trt/0gzyWsVXEu/Jh7s7rdQVLQems4ZlKQ=;
	b=TJxTgbNAv6VQC/hclzu8aspYLQyOkrXQZO59TNSwY65Pe4LtclsZA/dkNjOxHW9lsO/Ia1
	2OLlRAqRn94pA94cVA1jijQmAdVFm8V8jNTYin0Qjy9afBu8cDrxvLaU0aJ8+vyAh+kQ7e
	6DXvLLY2U7vmg9GDTWFZ0H8BfGkuoQE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drivers/xen/xenbus: Replace deprecated strcpy in xenbus_transaction_end
Date: Fri, 31 Oct 2025 12:21:31 +0100
Message-ID: <20251031112145.103257-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; inline the read-only string instead. Fix the
function comment and use bool instead of int while we're at it.

Link: https://github.com/KSPP/linux/issues/88
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Use an inline ternary expression and remove 'char abortstr[2]' as
  suggested by Jürgen
- Link to v1: https://lore.kernel.org/lkml/20251012195514.39003-2-thorsten.blum@linux.dev/
---
 drivers/xen/xenbus/xenbus_xs.c | 14 ++++----------
 include/xen/xenbus.h           |  2 +-
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 528682bf0c7f..5d95a5f83119 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -546,18 +546,12 @@ int xenbus_transaction_start(struct xenbus_transaction *t)
 EXPORT_SYMBOL_GPL(xenbus_transaction_start);
 
 /* End a transaction.
- * If abandon is true, transaction is discarded instead of committed.
+ * If abort is true, transaction is discarded instead of committed.
  */
-int xenbus_transaction_end(struct xenbus_transaction t, int abort)
+int xenbus_transaction_end(struct xenbus_transaction t, bool abort)
 {
-	char abortstr[2];
-
-	if (abort)
-		strcpy(abortstr, "F");
-	else
-		strcpy(abortstr, "T");
-
-	return xs_error(xs_single(t, XS_TRANSACTION_END, abortstr, NULL));
+	return xs_error(xs_single(t, XS_TRANSACTION_END, abort ? "F" : "T",
+				  NULL));
 }
 EXPORT_SYMBOL_GPL(xenbus_transaction_end);
 
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
2.51.1


