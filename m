Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E819D64C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 14:05:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKL36-0000TQ-2c; Fri, 03 Apr 2020 12:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jKL33-0000TK-Vx
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 12:03:46 +0000
X-Inumbo-ID: 2a2da74d-75a3-11ea-bcfe-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a2da74d-75a3-11ea-bcfe-12813bfff9fa;
 Fri, 03 Apr 2020 12:03:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6169AC0C;
 Fri,  3 Apr 2020 12:03:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] tools/xenstore: fix a use after free problem in xenstored
Date: Fri,  3 Apr 2020 14:03:40 +0200
Message-Id: <20200403120340.13406-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object
twice") introduced a potential use after free problem in
domain_cleanup(): after calling talloc_unlink() for domain->conn
domain->conn is set to NULL. The problem is that domain is registered
as talloc child of domain->conn, so it might be freed by the
talloc_unlink() call.

With Xenstore being single threaded there are normally no concurrent
memory allocations running and freeing a virtual memory area normally
doesn't result in that area no longer being accessible. A problem
could occur only in case either a signal received results in some
memory allocation done in the signal handler (SIGHUP is a primary
candidate leading to reopening the log file), or in case the talloc
framework would do some internal memory allocation during freeing of
the memory (which would lead to clobbering of the freed domain
structure).

Fixes: 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object twice")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index baddaba5df..5858185211 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -214,6 +214,7 @@ static void domain_cleanup(void)
 {
 	xc_dominfo_t dominfo;
 	struct domain *domain;
+	struct connection *conn;
 	int notify = 0;
 
  again:
@@ -230,8 +231,10 @@ static void domain_cleanup(void)
 				continue;
 		}
 		if (domain->conn) {
-			talloc_unlink(talloc_autofree_context(), domain->conn);
+			/* domain is a talloc child of domain->conn. */
+			conn = domain->conn;
 			domain->conn = NULL;
+			talloc_unlink(talloc_autofree_context(), conn);
 			notify = 0; /* destroy_domain() fires the watch */
 			goto again;
 		}
-- 
2.16.4


