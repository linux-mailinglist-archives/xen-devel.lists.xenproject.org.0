Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C7E3DA1C0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 13:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161903.297096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m93sP-0002BI-Eu; Thu, 29 Jul 2021 11:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161903.297096; Thu, 29 Jul 2021 11:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m93sP-000293-BW; Thu, 29 Jul 2021 11:06:57 +0000
Received: by outflank-mailman (input) for mailman id 161903;
 Thu, 29 Jul 2021 11:06:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m93sN-00028t-Cu
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 11:06:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m93sM-0004vm-OW; Thu, 29 Jul 2021 11:06:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m93sM-0006OX-FT; Thu, 29 Jul 2021 11:06:54 +0000
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
	bh=9cjgZZnC+CjNZwAhAzGV3zUaO4AAHfmbwNPumDCV3o4=; b=j6Dgly8XOB/Pf8F23GKD7B3X/p
	XvW8vrQhnShAqewJk7w84qdrAzhBXXWIlA1h2fyHS+vssbDs1xGhYFt+CVebPBDXXLowa6ynrVAky
	KKlfMLWqv5p3xqfgxd8lS09A+kHsTS1ie03qDE1I9J2XMeJsLrUVQNqrU17PzvGvmhQU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Don't assume errno will not be overwritten in lu_arch()
Date: Thu, 29 Jul 2021 12:06:47 +0100
Message-Id: <20210729110647.25500-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

At the moment, do_control_lu() will set errno to 0 before calling
lu_arch() and then check errno. The expectation is nothing in lu_arch()
will change the value unless there is an error.

However, per errno(3), a function that succeeds is allowed to change
errno. In fact, syslog() will overwrite errno if the logs are rotated
at the time it is called.

To prevent any further issue, errno is now always set before
returning NULL.

Additionally, errno is only checked when returning NULL so the client
can see the error message if there is any.

Reported-by: Michael Kurth <mku@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 6b68b79faac7..6fcb42095b59 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -324,6 +324,7 @@ static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
 	lu_status->kernel_size = size;
 	lu_status->kernel_off = 0;
 
+	errno = 0;
 	return NULL;
 }
 
@@ -339,6 +340,7 @@ static const char *lu_binary_save(const void *ctx, struct connection *conn,
 	memcpy(lu_status->kernel + lu_status->kernel_off, data, size);
 	lu_status->kernel_off += size;
 
+	errno = 0;
 	return NULL;
 }
 
@@ -798,9 +800,8 @@ static int do_control_lu(void *ctx, struct connection *conn,
 		if (!ret)
 			return errno;
 	} else {
-		errno = 0;
 		ret = lu_arch(ctx, conn, vec, num);
-		if (errno)
+		if (!ret && errno)
 			return errno;
 	}
 
-- 
2.17.1


