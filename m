Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E792E2816E0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2235.6644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONC3-00078Y-Bb; Fri, 02 Oct 2020 15:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2235.6644; Fri, 02 Oct 2020 15:41:59 +0000
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
	id 1kONC3-00077c-5d; Fri, 02 Oct 2020 15:41:59 +0000
Received: by outflank-mailman (input) for mailman id 2235;
 Fri, 02 Oct 2020 15:41:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONC1-0006vD-9j
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4c67228-f86e-46c4-a739-4b1b0520460d;
 Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D3F0B265;
 Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONC1-0006vD-9j
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:57 +0000
X-Inumbo-ID: d4c67228-f86e-46c4-a739-4b1b0520460d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d4c67228-f86e-46c4-a739-4b1b0520460d;
	Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gcLMBVGwJcyyJDDSc6Pbxmq7yh49BQo92DhFtrzVoNM=;
	b=cXGOQcxRf2cFvKIIkdGEJ5gTvTQYqgbCwNcJpjgsizwJvcz+x7s2n3yA7QRwCR214ol4s5
	g06OLukDAvd++ZJxbOoRL8KLOxK6gl0AzQaQJb7XPTs5pmp49iVC07/ifS/gu7+6doJxe3
	Ry/QPwjF2Z2YjFj2uQmn8KcNSdl/Hrc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5D3F0B265;
	Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] tools/libs/store: ignore XS_OPEN_SOCKETONLY flag
Date: Fri,  2 Oct 2020 17:41:38 +0200
Message-Id: <20201002154141.11677-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002154141.11677-1-jgross@suse.com>
References: <20201002154141.11677-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When opening the connection to Xenstore via xs_open() it makes no
sense to limit the connection to the socket based one. So just ignore
the XS_OPEN_SOCKETONLY flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/include/xenstore.h | 2 --
 tools/libs/store/xs.c               | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/store/include/xenstore.h b/tools/libs/store/include/xenstore.h
index 25b31881c8..cbc7206a0f 100644
--- a/tools/libs/store/include/xenstore.h
+++ b/tools/libs/store/include/xenstore.h
@@ -66,8 +66,6 @@ typedef uint32_t xs_transaction_t;
  * * Connections made with xs_open(0) (which might be shared page or
  *   socket based) are only guaranteed to work in the parent after
  *   fork.
- * * Connections made with xs_open(XS_OPEN_SOCKETONLY) will be usable
- *   in either the parent or the child after fork, but not both.
  * * xs_daemon_open*() and xs_domain_open() are deprecated synonyms
  *   for xs_open(0).
  * * XS_OPEN_READONLY has no bearing on any of this.
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index aa1d24b8b9..320734416f 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -319,7 +319,7 @@ struct xs_handle *xs_open(unsigned long flags)
 	else
 		xsh = get_handle(xs_daemon_socket());
 
-	if (!xsh && !(flags & XS_OPEN_SOCKETONLY))
+	if (!xsh)
 		xsh = get_handle(xs_domain_dev());
 
 	if (xsh && (flags & XS_UNWATCH_FILTER))
-- 
2.26.2


