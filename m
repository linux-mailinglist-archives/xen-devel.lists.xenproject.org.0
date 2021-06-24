Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCB3B31B9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 16:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146858.270376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwQdC-0006Mc-5b; Thu, 24 Jun 2021 14:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146858.270376; Thu, 24 Jun 2021 14:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwQdC-0006KP-2G; Thu, 24 Jun 2021 14:47:02 +0000
Received: by outflank-mailman (input) for mailman id 146858;
 Thu, 24 Jun 2021 14:47:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwQdA-0006KJ-FR
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 14:47:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwQd9-0002Dh-37; Thu, 24 Jun 2021 14:46:59 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwQd8-000486-Qr; Thu, 24 Jun 2021 14:46:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=XCk4lQYg4y7RtUs31wkreOLsu7v4xKjO1fVnBgQiBnI=; b=Iz6av1pTXigGNWzHmUoHkt75Ma
	Lik//fCZyrpXmjwZKn2Of2WY34tTTZxOaeqF2C9HjsuOmCqeV3FzN76ySatBmMojx8FBmMlAaR7DS
	i+RwO+3omLZ8i01DXN1tT3Bc1+Otzu6rjGm7X0UXUmPcQlIMY1vr8J67k70WSULxKvRo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] tools/xenstored: Remove redundant check in socket_can_process()
Date: Thu, 24 Jun 2021 15:46:55 +0100
Message-Id: <20210624144655.12900-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Commit 3adfb50315d9 ("tools/xenstored: Introduce a wrapper for
conn->funcs->can_{read, write}") consolidated the check
!conn->is_ignored in two new wrappers.

This means the check in socket_can_process() is now redundant. In
fact it should have been removed in orignal commit (as it was done
for the domain helpers).

Reported-by: Raphael Ning <raphning@amazon.com
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 9ffd2ac66d3e..cf7297a96cb1 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1752,7 +1752,7 @@ static bool socket_can_process(struct connection *conn, int mask)
 		return false;
 	}
 
-	return (fds[conn->pollfd_idx].revents & mask) && !conn->is_ignored;
+	return (fds[conn->pollfd_idx].revents & mask);
 }
 
 static bool socket_can_write(struct connection *conn)
-- 
2.17.1


