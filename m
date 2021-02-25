Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BCB3254A9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89895.169838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKea-0006J5-8R; Thu, 25 Feb 2021 17:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89895.169838; Thu, 25 Feb 2021 17:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKea-0006Hf-2B; Thu, 25 Feb 2021 17:42:20 +0000
Received: by outflank-mailman (input) for mailman id 89895;
 Thu, 25 Feb 2021 17:42:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKeY-0006GB-GZ
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:42:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeX-0005rD-RK; Thu, 25 Feb 2021 17:42:17 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeX-00032g-J5; Thu, 25 Feb 2021 17:42:17 +0000
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
	 bh=53L5vgadSleOIYD3/pBTYYZNiwh9to3K/XeeeFHyx60=; b=Ozt6BqekBvI7kK5lApoC1yTg4
	+nbNKSPUsqRE18z9JlEmv01Q1xT3nZpyirFappNNH2i+mRlYe8QEInE1uKqg7sYADkZYOogd/a+8I
	d3NmCXx3WlX5wX2NVF5GemdLgFRwagXNx+5Qq9IO+3Zmts1TXwuTn8uFbMgmdx3+Ot4+w=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using xs_state_* structures
Date: Thu, 25 Feb 2021 17:41:31 +0000
Message-Id: <20210225174131.10115-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225174131.10115-1-julien@xen.org>
References: <20210225174131.10115-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Coverity will report unitialized values for every use of xs_state_*
structures in the save part. This can be prevented by using the [0]
rather than [] to define variable length array.

Coverity-ID: 1472398
Coverity-ID: 1472397
Coverity-ID: 1472396
Coverity-ID: 1472395
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

From my understanding, the tools and the hypervisor already rely on GNU
extensions. So the change should be fine.

If not, we can use the same approach as XEN_FLEX_ARRAY_DIM.
---
 tools/xenstore/include/xenstore_state.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
index ae0d053c8ffc..407d9e920c0f 100644
--- a/tools/xenstore/include/xenstore_state.h
+++ b/tools/xenstore/include/xenstore_state.h
@@ -86,7 +86,7 @@ struct xs_state_connection {
     uint16_t data_in_len;    /* Number of unprocessed bytes read from conn. */
     uint16_t data_resp_len;  /* Size of partial response pending for conn. */
     uint32_t data_out_len;   /* Number of bytes not yet written to conn. */
-    uint8_t  data[];         /* Pending data (read, written) + 0-7 pad bytes. */
+    uint8_t  data[0];         /* Pending data (read, written) + 0-7 pad bytes. */
 };
 
 /* Watch: */
@@ -94,7 +94,7 @@ struct xs_state_watch {
     uint32_t conn_id;       /* Connection this watch is associated with. */
     uint16_t path_length;   /* Number of bytes of path watched (incl. 0). */
     uint16_t token_length;  /* Number of bytes of watch token (incl. 0). */
-    uint8_t data[];         /* Path bytes, token bytes, 0-7 pad bytes. */
+    uint8_t data[0];        /* Path bytes, token bytes, 0-7 pad bytes. */
 };
 
 /* Transaction: */
@@ -125,7 +125,7 @@ struct xs_state_node {
 #define XS_STATE_NODE_TA_WRITTEN  0x0002
     uint16_t perm_n;        /* Number of permissions (0 in TA: node deleted). */
     /* Permissions (first is owner, has full access). */
-    struct xs_state_node_perm perms[];
+    struct xs_state_node_perm perms[0];
     /* Path and data follows, plus 0-7 pad bytes. */
 };
 #endif /* XENSTORE_STATE_H */
-- 
2.17.1


