Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7E3DA1BF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 13:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161896.297085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m93rd-0001dT-4k; Thu, 29 Jul 2021 11:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161896.297085; Thu, 29 Jul 2021 11:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m93rd-0001a7-1d; Thu, 29 Jul 2021 11:06:09 +0000
Received: by outflank-mailman (input) for mailman id 161896;
 Thu, 29 Jul 2021 11:06:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m93rc-0001a1-2n
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 11:06:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m93ra-0004vC-Rn; Thu, 29 Jul 2021 11:06:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m93ra-0006L1-Hy; Thu, 29 Jul 2021 11:06:06 +0000
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
	bh=vKEQbEF5cQrLwWH1JPPMZRyXbyae15aLjwRBtJ1sUbo=; b=HXBNouiWvG2SZ0EJi4i0Ms6fps
	fhDp/v2rL45Bf0EndbHT0gZKQMZMRTPH6IwZPyIIndvapzdowcmzAU46FXXuiCxVkeygCrgra3ef/
	nj72W869BZNxXxvqDnFul/Tqq1Iq/8STGvMq+KsCgnR3mHb3uTgj/hKPUiFmdN2VDlAg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Propagate correctly the error message from lu_start()
Date: Thu, 29 Jul 2021 12:06:02 +0100
Message-Id: <20210729110602.24815-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

lu_start() will only set errno when it returns NULL. For all the
other cases, the value is unknown.

This means that when lu_start() returns an error message, it may not
be propagated to the client.

The check that errno is a non-zero value is now dropped and instead
the value is returned when no error message is provided. This
relies on errno to always be set when ret == NULL.

Fixes: af216a99fb ("tools/xenstore: add the basic framework for doing the live update")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index ff9863c17fa4..6b68b79faac7 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -795,10 +795,8 @@ static int do_control_lu(void *ctx, struct connection *conn,
 				return EINVAL;
 		}
 		ret = lu_start(ctx, conn, force, to);
-		if (errno)
-			return errno;
 		if (!ret)
-			return 0;
+			return errno;
 	} else {
 		errno = 0;
 		ret = lu_arch(ctx, conn, vec, num);
-- 
2.17.1


