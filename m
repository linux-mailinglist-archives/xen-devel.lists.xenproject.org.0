Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502E7E9C55
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631561.985011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHr-0000d3-JR; Mon, 13 Nov 2023 12:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631561.985011; Mon, 13 Nov 2023 12:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHr-0000Za-FU; Mon, 13 Nov 2023 12:43:31 +0000
Received: by outflank-mailman (input) for mailman id 631561;
 Mon, 13 Nov 2023 12:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2WHq-0000Xf-DH
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:43:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eda6225-8222-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 13:43:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A8C01F6E6;
 Mon, 13 Nov 2023 12:43:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7CB31358C;
 Mon, 13 Nov 2023 12:43:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /SveLvAZUmVecQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 12:43:28 +0000
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
X-Inumbo-ID: 3eda6225-8222-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699879409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRSn0Gy55koV3sSKwt+Dit5JVjBiMtzOaatQj6/2xAg=;
	b=WtjyZt1bUbqDzRzKi3TNDcyZqzHxw9u3RrlgA8p60wWhpGOKSU0L0qGLWZYnQFwLPoLYQU
	h9pVfu6r4ys9aKoOoLiW0FPZ64AQleEjI8JRBAO/+1kO2aiLxKWWYVaVLULmhO8dKkiAQ1
	Uxx7/oChtkx6c6uAWxIQJrWmd9lc7l4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/5] tools/xenstored: remove the "-P" command line option
Date: Mon, 13 Nov 2023 13:43:07 +0100
Message-Id: <20231113124309.10862-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231113124309.10862-1-jgross@suse.com>
References: <20231113124309.10862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "-P" command line option just results in printing the PID of the
xenstored daemon to stdout before stdout is being closed. The same
information can be retrieved from the PID file via the "-F" option.

Remove the redundant "-P" option.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 3e31e74933..5a6378316a 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2653,7 +2653,6 @@ static void usage(void)
 "  -F, --pid-file <file>   giving a file for the daemon's pid to be written,\n"
 "  -H, --help              to output this message,\n"
 "  -N, --no-fork           to request that the daemon does not fork,\n"
-"  -P, --output-pid        to request that the pid of the daemon is output,\n"
 "  -T, --trace-file <file> giving the file for logging, and\n"
 "      --trace-control=+<switch> activate a specific <switch>\n"
 "      --trace-control=-<switch> deactivate a specific <switch>\n"
@@ -2702,7 +2701,6 @@ static struct option options[] = {
 	{ "help", 0, NULL, 'H' },
 	{ "no-fork", 0, NULL, 'N' },
 	{ "priv-domid", 1, NULL, 'p' },
-	{ "output-pid", 0, NULL, 'P' },
 	{ "entry-size", 1, NULL, 'S' },
 	{ "trace-file", 1, NULL, 'T' },
 	{ "trace-control", 1, NULL, 1 },
@@ -2825,7 +2823,6 @@ int main(int argc, char *argv[])
 	int opt;
 	int sock_pollfd_idx = -1;
 	bool dofork = true;
-	bool outputpid = false;
 	bool live_update = false;
 	const char *pidfile = NULL;
 	int timeout;
@@ -2834,7 +2831,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "E:F:H::KNPS:t:A:M:Q:q:T:RW:w:U",
+				  "E:F:H::KNS:t:A:M:Q:q:T:RW:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
@@ -2849,9 +2846,6 @@ int main(int argc, char *argv[])
 		case 'N':
 			dofork = false;
 			break;
-		case 'P':
-			outputpid = true;
-			break;
 		case 'R':
 			recovery = false;
 			break;
@@ -2947,11 +2941,6 @@ int main(int argc, char *argv[])
 		dom0_init();
 	}
 
-	if (outputpid) {
-		printf("%ld\n", (long)getpid());
-		fflush(stdout);
-	}
-
 	/* redirect to /dev/null now we're ready to accept connections */
 	if (dofork && !live_update)
 		finish_daemonize();
-- 
2.35.3


