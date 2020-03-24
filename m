Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB7190A62
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:14:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGgYQ-0001HY-Lf; Tue, 24 Mar 2020 10:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGgYO-0001HR-PP
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:13:00 +0000
X-Inumbo-ID: 0a024d44-6db8-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a024d44-6db8-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 10:13:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38649AEE6;
 Tue, 24 Mar 2020 10:12:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Mar 2020 11:12:57 +0100
Message-Id: <20200324101257.20781-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] tools/xenstore: fix a use after free problem in
 xenstored
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


