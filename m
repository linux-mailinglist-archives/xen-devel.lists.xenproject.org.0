Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D52D3F98
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 11:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48083.85060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmwRN-0005hl-CX; Wed, 09 Dec 2020 10:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48083.85060; Wed, 09 Dec 2020 10:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmwRN-0005hM-9W; Wed, 09 Dec 2020 10:11:21 +0000
Received: by outflank-mailman (input) for mailman id 48083;
 Wed, 09 Dec 2020 10:11:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmwRL-0005hH-28
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 10:11:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0210185-84b6-4c17-a603-10f535e9e90c;
 Wed, 09 Dec 2020 10:11:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC6CFAC94;
 Wed,  9 Dec 2020 10:11:16 +0000 (UTC)
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
X-Inumbo-ID: c0210185-84b6-4c17-a603-10f535e9e90c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607508676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lp/BX/zYvTTJSC9VfCvCXfJRULVfbr1TBpetvpV+Cfo=;
	b=CDXncT75s8PkuuzKBjWJ+/rdiXZ+WdhzCg1/7T/SWjXNpddihYd5xSJe/k16ukZGzghXAm
	oQ5wTadzIhPc0MvnfNb9/0We/IXiQU3HkCllxc5/dTlKxjXA97f89OJGtaIHvVw/Sf4Cfm
	cO4sAMeS2KWjwBa/YpnQ4QkFWy+NO7Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/xenbus: make xs_talkv() interruptible for SIGKILL
Date: Wed,  9 Dec 2020 11:11:14 +0100
Message-Id: <20201209101114.31522-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case a process waits for any Xenstore action in the xenbus driver
it should be interruptible via SIGKILL.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xenbus/xenbus_xs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 3a06eb699f33..1f4d3593e89e 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -205,8 +205,15 @@ static bool test_reply(struct xb_req_data *req)
 
 static void *read_reply(struct xb_req_data *req)
 {
+	int ret;
+
 	do {
-		wait_event(req->wq, test_reply(req));
+		ret = wait_event_interruptible(req->wq, test_reply(req));
+
+		if (ret == -ERESTARTSYS && fatal_signal_pending(current)) {
+			req->msg.type = XS_ERROR;
+			return ERR_PTR(-EINTR);
+		}
 
 		if (!xenbus_ok())
 			/*
-- 
2.26.2


