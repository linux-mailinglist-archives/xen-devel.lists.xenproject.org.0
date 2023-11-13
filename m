Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EEF7E9C53
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631560.985002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHm-0000HE-Ac; Mon, 13 Nov 2023 12:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631560.985002; Mon, 13 Nov 2023 12:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHm-0000FD-6t; Mon, 13 Nov 2023 12:43:26 +0000
Received: by outflank-mailman (input) for mailman id 631560;
 Mon, 13 Nov 2023 12:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2WHl-00089i-Db
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:43:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b9666bf-8222-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 13:43:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 553261F6E6;
 Mon, 13 Nov 2023 12:43:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27AEE1358C;
 Mon, 13 Nov 2023 12:43:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wMJQCOsZUmVMcQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 12:43:23 +0000
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
X-Inumbo-ID: 3b9666bf-8222-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699879403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5WOtX2yVjlS0aYlXkxj9AGdR0ePAmBESYfcA64cAHk=;
	b=L2D1MztA4LpEenUM4Ef9MdvKL9EPsFbbxcCTSaSKmTMjXjIN1p3wd9hekJ1YRejm21tPCP
	mwz337gjr3UMmqwy3xCGz6+qtTQMjg/tJVQDnn+CvIl/Q/PTWfsDptSvxva++NzGgurZqP
	lKM+lxMJvWZdh6yiGfMTRWOqzXEtl7E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/5] tools/xenstored: remove "-V" command line option
Date: Mon, 13 Nov 2023 13:43:06 +0100
Message-Id: <20231113124309.10862-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231113124309.10862-1-jgross@suse.com>
References: <20231113124309.10862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "-V" (verbose) command line option is nearly completely redundant
with "io" tracing. Just the time of the printed data is a little bit
different, while the tracing is more informative.

Remove the verbose option.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 8bd4098cb6..3e31e74933 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -76,7 +76,6 @@ static int sock = -1;
 int orig_argc;
 char **orig_argv;
 
-static bool verbose = false;
 LIST_HEAD(connections);
 int tracefd = -1;
 static bool recovery = true;
@@ -329,11 +328,6 @@ static bool write_messages(struct connection *conn)
 		return true;
 
 	if (out->inhdr) {
-		if (verbose)
-			xprintf("Writing msg %s (%.*s) out to %p\n",
-				sockmsg_string(out->hdr.msg.type),
-				out->hdr.msg.len,
-				out->buffer, conn);
 		ret = conn->funcs->write(conn, out->hdr.raw + out->used,
 					 sizeof(out->hdr) - out->used);
 		if (ret < 0)
@@ -2134,11 +2128,6 @@ static bool process_delayed_message(struct delayed_request *req)
 
 static void consider_message(struct connection *conn)
 {
-	if (verbose)
-		xprintf("Got message %s len %i from %p\n",
-			sockmsg_string(conn->in->hdr.msg.type),
-			conn->in->hdr.msg.len, conn);
-
 	conn->is_stalled = false;
 	/*
 	 * Currently, Live-Update is not supported if there is active
@@ -2701,8 +2690,7 @@ static void usage(void)
 "  -R, --no-recovery       to request that no recovery should be attempted when\n"
 "                          the store is corrupted (debug only),\n"
 "  -K, --keep-orphans      don't delete nodes owned by a domain when the\n"
-"                          domain is deleted (this is a security risk!)\n"
-"  -V, --verbose           to request verbose execution.\n");
+"                          domain is deleted (this is a security risk!)\n");
 }
 
 
@@ -2726,7 +2714,6 @@ static struct option options[] = {
 	{ "timeout", 1, NULL, 'w' },
 	{ "no-recovery", 0, NULL, 'R' },
 	{ "keep-orphans", 0, NULL, 'K' },
-	{ "verbose", 0, NULL, 'V' },
 	{ "watch-nb", 1, NULL, 'W' },
 #ifndef NO_LIVE_UPDATE
 	{ "live-update", 0, NULL, 'U' },
@@ -2847,7 +2834,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "E:F:H::KNPS:t:A:M:Q:q:T:RVW:w:U",
+				  "E:F:H::KNPS:t:A:M:Q:q:T:RW:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
@@ -2884,9 +2871,6 @@ int main(int argc, char *argv[])
 		case 'K':
 			keep_orphans = true;
 			break;
-		case 'V':
-			verbose = true;
-			break;
 		case 'W':
 			hard_quotas[ACC_WATCH].val = get_optval_uint(optarg);
 			break;
-- 
2.35.3


