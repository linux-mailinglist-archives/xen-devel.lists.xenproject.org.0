Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E42DAFA8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 16:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54314.94290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBsB-0001Mk-5e; Tue, 15 Dec 2020 15:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54314.94290; Tue, 15 Dec 2020 15:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBsB-0001ML-2N; Tue, 15 Dec 2020 15:04:19 +0000
Received: by outflank-mailman (input) for mailman id 54314;
 Tue, 15 Dec 2020 15:04:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpBs8-0001MG-MR
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:04:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2348941b-46a8-412d-b803-75683c9fd45f;
 Tue, 15 Dec 2020 15:04:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4C48AC7F;
 Tue, 15 Dec 2020 15:04:14 +0000 (UTC)
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
X-Inumbo-ID: 2348941b-46a8-412d-b803-75683c9fd45f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608044655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1ONxP5uPtKWFefZOyd/Uymh+C2zg0SXGzfp1xar6tXg=;
	b=eT/aDkZ+5/0+ZflH9JfPI+zJmA6sc3gawUouS0XEtySeQ77MT4yCRKtUYqHUsNIkilx8+q
	AGwEOoctpwnibcMFEdrJFs+38I+ab3eY/TuQQAdg7hnjNgiGLYg4yMzIqwvL9BaApF8x6E
	caZpu2LJ7eiTqzUs9M8+0I2LerOJiTY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] tools/xenstore: rework path length check
Date: Tue, 15 Dec 2020 16:04:11 +0100
Message-Id: <20201215150411.9987-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The different fixed limits for absolute and relative path lengths of
Xenstore nodes make it possible to create per-domain nodes via
absolute paths which are not accessible using relative paths, as the
two limits differ by 1024 characters.

Instead of this weird limits use only one limit, which applies to the
relative path length of per-domain nodes and to the absolute path
length of all other nodes. This means, the path length check is
applied to the path after removing a possible start of
"/local/domain/<n>/" with <n> being a domain id.

There has been the request to be able to limit the path lengths even
more, so an additional quota is added which can be applied to path
lengths. It is XENSTORE_REL_PATH_MAX (2048) per default, but can be
set to lower values. This is done via the new "-M" or "--path-max"
option when invoking xenstored.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This patch was originally thought to be part of XSA-323, but later it
was decided not to include it, as in C Xenstored this is no security
issue.
---
 tools/xenstore/xenstored_core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 746a1247b3..3082a36d3a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -102,6 +102,7 @@ int quota_nb_watch_per_domain = 128;
 int quota_max_entry_size = 2048; /* 2K */
 int quota_max_transaction = 10;
 int quota_nb_perms_per_node = 5;
+int quota_max_path_len = XENSTORE_REL_PATH_MAX;
 
 void trace(const char *fmt, ...)
 {
@@ -734,6 +735,9 @@ static bool valid_chars(const char *node)
 
 bool is_valid_nodename(const char *node)
 {
+	int local_off = 0;
+	unsigned int domid;
+
 	/* Must start in /. */
 	if (!strstarts(node, "/"))
 		return false;
@@ -746,7 +750,10 @@ bool is_valid_nodename(const char *node)
 	if (strstr(node, "//"))
 		return false;
 
-	if (strlen(node) > XENSTORE_ABS_PATH_MAX)
+	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
+		local_off = 0;
+
+	if (strlen(node) > local_off + quota_max_path_len)
 		return false;
 
 	return valid_chars(node);
@@ -806,6 +813,8 @@ static struct node *get_node_canonicalized(struct connection *conn,
 	if (!canonical_name)
 		canonical_name = &tmp_name;
 	*canonical_name = canonicalize(conn, ctx, name);
+	if (!*canonical_name)
+		return NULL;
 	return get_node(conn, ctx, *canonical_name, perm);
 }
 
@@ -1926,6 +1935,7 @@ static void usage(void)
 "  -W, --watch-nb <nb>     limit the number of watches per domain,\n"
 "  -t, --transaction <nb>  limit the number of transaction allowed per domain,\n"
 "  -A, --perm-nb <nb>      limit the number of permissions per node,\n"
+"  -M, --path-max <chars>  limit the allowed Xenstore node path length,\n"
 "  -R, --no-recovery       to request that no recovery should be attempted when\n"
 "                          the store is corrupted (debug only),\n"
 "  -I, --internal-db       store database in memory, not on disk\n"
@@ -1947,6 +1957,7 @@ static struct option options[] = {
 	{ "trace-file", 1, NULL, 'T' },
 	{ "transaction", 1, NULL, 't' },
 	{ "perm-nb", 1, NULL, 'A' },
+	{ "path-max", 1, NULL, 'M' },
 	{ "no-recovery", 0, NULL, 'R' },
 	{ "internal-db", 0, NULL, 'I' },
 	{ "verbose", 0, NULL, 'V' },
@@ -1969,7 +1980,7 @@ int main(int argc, char *argv[])
 	int timeout;
 
 
-	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:T:RVW:", options,
+	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:", options,
 				  NULL)) != -1) {
 		switch (opt) {
 		case 'D':
@@ -2014,6 +2025,10 @@ int main(int argc, char *argv[])
 		case 'A':
 			quota_nb_perms_per_node = strtol(optarg, NULL, 10);
 			break;
+			quota_max_path_len = strtol(optarg, NULL, 10);
+			quota_max_path_len = min(XENSTORE_REL_PATH_MAX,
+						 quota_max_path_len);
+			break;
 		case 'e':
 			dom0_event = strtol(optarg, NULL, 10);
 			break;
-- 
2.26.2


