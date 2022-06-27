Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013E55B98C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 14:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356571.584812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nzb-0007RH-9b; Mon, 27 Jun 2022 12:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356571.584812; Mon, 27 Jun 2022 12:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nzb-0007PG-4p; Mon, 27 Jun 2022 12:37:27 +0000
Received: by outflank-mailman (input) for mailman id 356571;
 Mon, 27 Jun 2022 12:37:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5nzZ-0006ub-Cy
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 12:37:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5nzZ-0002wr-AH; Mon, 27 Jun 2022 12:37:25 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5nzZ-0007Ql-1x; Mon, 27 Jun 2022 12:37:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=XVUKUMHdJRQ1Ho4SEl/UvW5XaMba3R7x8iHBIEdv7MQ=; b=cBxr+PMKesl+cgeA7NVj/ZjhnM
	yMapaeUAmT1aPLWjPzz/FQXUImz5I+zHRw/LQnFdfmLIQsABQAf9gQ5L4S2e8LvrkVZl2QbpI9xy+
	e6nJcdbauKwR4Rio2piVqIpHA0j2R5kFcwrE1m1+eKvmusYp9P1SFwH9VFvCJsvDia10=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/2] public/io: xs_wire: Allow Xenstore to report EPERM
Date: Mon, 27 Jun 2022 13:36:35 +0100
Message-Id: <20220627123635.3416-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220627123635.3416-1-julien@xen.org>
References: <20220627123635.3416-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

C Xenstored is using EPERM when the client is not allowed to change
the owner (see GET_PERMS). However, the xenstore protocol doesn't
describe EPERM so EINVAL will be sent to the client.

When writing test, it would be useful to differentiate between EINVAL
(e.g. parsing error) and EPERM (i.e. no permission). So extend
xsd_errors[] to support return EPERM.

Looking at previous time xsd_errors was extended (8b2c441a1b), it was
considered to be safe to add a new error because at least Linux driver
and libxenstore treat an unknown error code as EINVAL.

This statement doesn't cover other possible OSes, however I am not
aware of any breakage.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

Changes in v2:
    - Define EPERM at the end of xsd_errors
---
 xen/include/public/io/xs_wire.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index dd4c9c9b972d..211770911d9b 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -91,7 +91,8 @@ __attribute__((unused))
     XSD_ERROR(EBUSY),
     XSD_ERROR(EAGAIN),
     XSD_ERROR(EISCONN),
-    XSD_ERROR(E2BIG)
+    XSD_ERROR(E2BIG),
+    XSD_ERROR(EPERM),
 };
 #endif
 
-- 
2.32.0


