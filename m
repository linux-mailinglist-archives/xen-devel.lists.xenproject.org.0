Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6F3A9DF5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143286.264192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlY-00078Z-VZ; Wed, 16 Jun 2021 14:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143286.264192; Wed, 16 Jun 2021 14:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlY-00071R-MI; Wed, 16 Jun 2021 14:43:40 +0000
Received: by outflank-mailman (input) for mailman id 143286;
 Wed, 16 Jun 2021 14:43:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlW-0006jG-Lk
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlV-0004EM-II; Wed, 16 Jun 2021 14:43:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlV-0007D0-9n; Wed, 16 Jun 2021 14:43:37 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=ntUe4oRZZR/IFXSXsYlm7XZxb7Y2yIuX7QXLhkAF0hE=; b=IDKUeY/nN0OTprDr81ImN5AMo
	ppaCwTSJm8FAjz1yN1Oo8Xho+UoCUB5Hxqcr0Ow7Vl4VFyAQtyAQaf3r0w2i48mZ+1l/+2WnTN8pe
	EfoouNnL+UYE25y6EOdvJJKnh+KpSuVQbHnNXJUD3LCaXFXr51N0x84BnFJLFEGA0ELOA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 07/10] tools/xenstored: delay_request: don't assume conn->in == in
Date: Wed, 16 Jun 2021 15:43:21 +0100
Message-Id: <20210616144324.31652-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

delay_request() is currently assuming that the request delayed is
always conn->in. This is currently correct, but it is a call for
a latent bug as the function allows the caller to specify any request.

To prevent any future surprise, check if the request delayed is the
current one.

Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution of a xenstore request")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 2e5760fe4599..a5084a5b173d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -306,7 +306,9 @@ int delay_request(struct connection *conn, struct buffered_data *in,
 	delayed_requests++;
 	list_add(&req->list, &conn->delayed);
 
-	conn->in = NULL;
+	/* Unlink the request from conn if this is the current one */
+	if (conn->in == in)
+		conn->in = NULL;
 
 	return 0;
 }
-- 
2.17.1


