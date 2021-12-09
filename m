Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B340A46E943
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243063.420359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJfP-0001vb-3t; Thu, 09 Dec 2021 13:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243063.420359; Thu, 09 Dec 2021 13:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJfO-0001ti-W8; Thu, 09 Dec 2021 13:40:58 +0000
Received: by outflank-mailman (input) for mailman id 243063;
 Thu, 09 Dec 2021 13:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3cQP=Q2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mvJfN-0001tc-O5
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:40:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2fccbab-58f5-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 14:40:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51D48210FD;
 Thu,  9 Dec 2021 13:40:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26F0F13343;
 Thu,  9 Dec 2021 13:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j09WCGgHsmGyCgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Dec 2021 13:40:56 +0000
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
X-Inumbo-ID: a2fccbab-58f5-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639057256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YbZDTmvbJsDpQkhk6H8P3268LVh9Xsxbf1w5AhlmObI=;
	b=r+O/hDnR13U0QNwkyS5QRiAYTes+U4BEY78Ve115nBV/9l1NutUHd1QAFKZEnSSCtZvhcU
	y4qHRezYlRDhx9VEhPFBtu2XlBtXOVSlui9TjXonuDPEg5PTJzNkukkwHMfYHFn1nn/7ZI
	vS99sYwla0P+/5KAuLjwf9bychgefNU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@citrix.com,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] tools/libs/ctrl: Save errno only once in *PRINTF() and *ERROR()
Date: Thu,  9 Dec 2021 14:40:54 +0100
Message-Id: <20211209134054.20757-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All *PRINTF() and *ERROR() macros are based on xc_reportv() which is
saving and restoring errno in order to not modify it. There is no need
to save and restore in those macros, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- style corrections (Jan Beulich)
---
 tools/libs/ctrl/xc_private.h | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 2e483590e6..abac9072a0 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -122,28 +122,18 @@ void xc_report_progress_step(xc_interface *xch,
 
 /* anamorphic macros:  struct xc_interface *xch  must be in scope */
 
-#define IPRINTF(_f, _a...)  do { int IPRINTF_errno = errno; \
-        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a); \
-        errno = IPRINTF_errno; \
-        } while (0)
-#define DPRINTF(_f, _a...) do { int DPRINTF_errno = errno; \
-        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a); \
-        errno = DPRINTF_errno; \
-        } while (0)
-#define DBGPRINTF(_f, _a...)  do { int DBGPRINTF_errno = errno; \
-        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a); \
-        errno = DBGPRINTF_errno; \
-        } while (0)
-
-#define ERROR(_m, _a...)  do { int ERROR_errno = errno; \
-        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a ); \
-        errno = ERROR_errno; \
-        } while (0)
-#define PERROR(_m, _a...) do { int PERROR_errno = errno; \
-        xc_report_error(xch,XC_INTERNAL_ERROR,_m " (%d = %s)", \
-        ## _a , errno, xc_strerror(xch, errno)); \
-        errno = PERROR_errno; \
-        } while (0)
+#define IPRINTF(_f, _a...) \
+        xc_report(xch, xch->error_handler, XTL_INFO, 0, _f, ## _a)
+#define DPRINTF(_f, _a...) \
+        xc_report(xch, xch->error_handler, XTL_DETAIL, 0, _f, ## _a)
+#define DBGPRINTF(_f, _a...) \
+        xc_report(xch, xch->error_handler, XTL_DEBUG, 0, _f, ## _a)
+
+#define ERROR(_m, _a...) \
+        xc_report_error(xch, XC_INTERNAL_ERROR, _m, ## _a )
+#define PERROR(_m, _a...) \
+        xc_report_error(xch, XC_INTERNAL_ERROR, _m " (%d = %s)", \
+                        ## _a, errno, xc_strerror(xch, errno))
 
 /*
  * HYPERCALL ARGUMENT BUFFERS
-- 
2.26.2


