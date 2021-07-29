Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEF3DA052
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 11:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161854.297015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m92Qs-0007s9-7D; Thu, 29 Jul 2021 09:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161854.297015; Thu, 29 Jul 2021 09:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m92Qs-0007qO-4J; Thu, 29 Jul 2021 09:34:26 +0000
Received: by outflank-mailman (input) for mailman id 161854;
 Thu, 29 Jul 2021 09:34:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m92Qq-0007qI-RJ
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 09:34:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m92Qp-0003VB-La; Thu, 29 Jul 2021 09:34:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m92Qp-0005S5-CW; Thu, 29 Jul 2021 09:34:23 +0000
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
	bh=yiOsLu1k2NmHXYMw3AZjFVxhirU3QZVP5YSP964RDHM=; b=AAOVAfERjVSvX9C7PFnyfeaNip
	A+BW0nD6svUm174HneVe1t1I0sgYPVvab8+rKmengs8+1XyuqAzAL2dNtUxMcAVvp+IcOihxiCC/P
	9c/+qZrJ3GZDmDDqZ11yFtCOR1Yej5yXVyByZftmA6746KCj3E7oWJR4wT2KdUeFbADk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Fix off-by-one in dump_state_nodes()
Date: Thu, 29 Jul 2021 10:34:20 +0100
Message-Id: <20210729093420.14092-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The maximum path length supported by Xenstored protocol is
XENSTORE_ABS_PATH_MAX (i.e 3072). This doesn't take into account the
NUL at the end of the path.

However, the code to dump the nodes will allocate a buffer
of XENSTORE_ABS_PATH. As a result it may not be possible to live-update
if there is a node name of XENSTORE_ABS_PATH.

Fix it by allocating a buffer of XENSTORE_ABS_PATH_MAX + 1 characters.

Take the opportunity to pass the max length of the buffer as a
parameter of dump_state_node_tree(). This will be clearer that the
check in the function is linked to the allocation in dump_state_nodes().

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This was spotted when backporting Live-Update to 4.11 because the
commit 924bf8c793 "tools/xenstore: rework path length check" is
not present. On the latest upstream, this is looks more a latent bug
because I didn't manage to create such large node.

(4.11)

42sh# xenstore-write $(python -c "print('/' + 'A' * 3071)") ""
42sh# xenstore-control live-update /usr/local/sbin/xenstored
Starting live update failed:
Dump node path length error
---
 tools/xenstore/xenstored_core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 16c856730c55..0d4c73d6e20c 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2574,7 +2574,8 @@ const char *dump_state_node_perms(FILE *fp, const struct xs_permissions *perms,
 	return NULL;
 }
 
-static const char *dump_state_node_tree(FILE *fp, char *path)
+static const char *dump_state_node_tree(FILE *fp, char *path,
+					unsigned int path_max_len)
 {
 	unsigned int pathlen, childlen, p = 0;
 	struct xs_state_record_header head;
@@ -2642,10 +2643,10 @@ static const char *dump_state_node_tree(FILE *fp, char *path)
 	}
 	while (p < hdr->childlen) {
 		childlen = strlen(child) + 1;
-		if (pathlen + childlen > XENSTORE_ABS_PATH_MAX)
+		if (pathlen + childlen > path_max_len)
 			return "Dump node path length error";
 		strcpy(path + pathlen, child);
-		ret = dump_state_node_tree(fp, path);
+		ret = dump_state_node_tree(fp, path, path_max_len);
 		if (ret)
 			return ret;
 		p += childlen;
@@ -2661,13 +2662,13 @@ const char *dump_state_nodes(FILE *fp, const void *ctx)
 {
 	char *path;
 
-	path = talloc_size(ctx, XENSTORE_ABS_PATH_MAX);
+	path = talloc_size(ctx, XENSTORE_ABS_PATH_MAX + 1);
 	if (!path)
 		return "Path buffer allocation error";
 
 	strcpy(path, "/");
 
-	return dump_state_node_tree(fp, path);
+	return dump_state_node_tree(fp, path, XENSTORE_ABS_PATH_MAX + 1);
 }
 
 void read_state_global(const void *ctx, const void *state)
-- 
2.17.1


