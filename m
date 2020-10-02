Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94202816E2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2236.6656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONC7-0007EQ-Uw; Fri, 02 Oct 2020 15:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2236.6656; Fri, 02 Oct 2020 15:42:03 +0000
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
	id 1kONC7-0007DU-Px; Fri, 02 Oct 2020 15:42:03 +0000
Received: by outflank-mailman (input) for mailman id 2236;
 Fri, 02 Oct 2020 15:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONC6-0006vD-9v
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:42:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0fb1f41-52ea-41f8-ad4f-6c9b0555a9f3;
 Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79682B269;
 Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONC6-0006vD-9v
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:42:02 +0000
X-Inumbo-ID: f0fb1f41-52ea-41f8-ad4f-6c9b0555a9f3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f0fb1f41-52ea-41f8-ad4f-6c9b0555a9f3;
	Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNF+aRfDbKHMZCseaVDAhmaSRPG1QxwjSNnLmsmdBpU=;
	b=s3zAfuAk3ObNwVSkUaMaGpk4An9Odhdv0ughwfA6YdsIF1MFhYKHPsYLqpmhPVWfui+5p/
	TKm1nFm2CI/IkuxovkbX7hD3Rup6TTu9giyVecUuqTnPGZRkDFesJzFKGmQHfOg9p3BfSU
	5UAlA7q0eJySJUqoxPrndPrgGACaNs0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79682B269;
	Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] tools/libs/store: drop read-only functionality
Date: Fri,  2 Oct 2020 17:41:39 +0200
Message-Id: <20201002154141.11677-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002154141.11677-1-jgross@suse.com>
References: <20201002154141.11677-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today it is possible to open the connection in read-only mode via
xs_daemon_open_readonly(). This is working only with Xenstore running
as a daemon in the same domain as the user. Additionally it doesn't
add any security as accessing the socket used for that functionality
requires the same privileges as the socket used for full Xenstore
access.

So just drop the read-only semantics in all cases, leaving the
interface existing only for compatibility reasons. This in turn
requires to just ignore the XS_OPEN_READONLY flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/include/xenstore.h | 8 --------
 tools/libs/store/xs.c               | 7 ++-----
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/tools/libs/store/include/xenstore.h b/tools/libs/store/include/xenstore.h
index cbc7206a0f..158e69ef83 100644
--- a/tools/libs/store/include/xenstore.h
+++ b/tools/libs/store/include/xenstore.h
@@ -60,15 +60,12 @@ typedef uint32_t xs_transaction_t;
 /* Open a connection to the xs daemon.
  * Attempts to make a connection over the socket interface,
  * and if it fails, then over the  xenbus interface.
- * Mode 0 specifies read-write access, XS_OPEN_READONLY for
- * read-only access.
  *
  * * Connections made with xs_open(0) (which might be shared page or
  *   socket based) are only guaranteed to work in the parent after
  *   fork.
  * * xs_daemon_open*() and xs_domain_open() are deprecated synonyms
  *   for xs_open(0).
- * * XS_OPEN_READONLY has no bearing on any of this.
  *
  * Returns a handle or NULL.
  */
@@ -83,11 +80,6 @@ void xs_close(struct xs_handle *xsh /* NULL ok */);
  */
 struct xs_handle *xs_daemon_open(void);
 struct xs_handle *xs_domain_open(void);
-
-/* Connect to the xs daemon (readonly for non-root clients).
- * Returns a handle or NULL.
- * Deprecated, please use xs_open(XS_OPEN_READONLY) instead
- */
 struct xs_handle *xs_daemon_open_readonly(void);
 
 /* Close the connection to the xs daemon.
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 320734416f..4ac73ec317 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -302,7 +302,7 @@ struct xs_handle *xs_daemon_open(void)
 
 struct xs_handle *xs_daemon_open_readonly(void)
 {
-	return xs_open(XS_OPEN_READONLY);
+	return xs_open(0);
 }
 
 struct xs_handle *xs_domain_open(void)
@@ -314,10 +314,7 @@ struct xs_handle *xs_open(unsigned long flags)
 {
 	struct xs_handle *xsh = NULL;
 
-	if (flags & XS_OPEN_READONLY)
-		xsh = get_handle(xs_daemon_socket_ro());
-	else
-		xsh = get_handle(xs_daemon_socket());
+	xsh = get_handle(xs_daemon_socket());
 
 	if (!xsh)
 		xsh = get_handle(xs_domain_dev());
-- 
2.26.2


