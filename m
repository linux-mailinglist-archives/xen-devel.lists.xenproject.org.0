Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B77E9C57
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631562.985022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHx-0000y8-1W; Mon, 13 Nov 2023 12:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631562.985022; Mon, 13 Nov 2023 12:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHw-0000vN-TQ; Mon, 13 Nov 2023 12:43:36 +0000
Received: by outflank-mailman (input) for mailman id 631562;
 Mon, 13 Nov 2023 12:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2WHv-0000Xf-CD
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:43:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4235acd8-8222-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 13:43:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4D061F6E6;
 Mon, 13 Nov 2023 12:43:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79B9E1358C;
 Mon, 13 Nov 2023 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 49hYHPYZUmVlcQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 12:43:34 +0000
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
X-Inumbo-ID: 4235acd8-8222-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699879414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXFEuOQILoQ662ByGndYuFK8T/I1cGHZaW2+4BFFJh0=;
	b=dPpPJ73dgn+aVMAN0urQUULQx/TSKIU4NIB5XuDlkZa0GebmigrBe93oXM66rffQVaded0
	gw/X9KX2p578k+3REdcOxjJtpUk8jSCj3CnrWDTdju4s7+An6/mwGkodHoKkfb29mXzhCP
	VdT7SGyZweX0ISXzNvbRA7L3264TOyY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 4/5] tools/xenstored: remove "-N" command line option
Date: Mon, 13 Nov 2023 13:43:08 +0100
Message-Id: <20231113124309.10862-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231113124309.10862-1-jgross@suse.com>
References: <20231113124309.10862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "-N" (do not daemonize) command line option is of questionable use:
its sole purpose seems to be to aid debugging of xenstored by making it
easier to start xenstored under gdb, or to see any debug messages
easily.

Debug messages can as well be sent to syslog(), while gdb can be
attached to the daemon easily. The only not covered case is an error
while initializing xenstored, but this could be handled e.g. by saving
a core dump, which can be analyzed later.

The call of talloc_enable_leak_report_full() done only with "-N"
specified is no longer needed, as the same can be achieved via
"xenstore-control memreport".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Slightly RFC, as this is making debugging a little bit harder in
specific cases. OTOH I didn't use this option since years, in spite of
having done a _lot_ of xenstore hacking.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 5a6378316a..c3cfef0965 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2652,7 +2652,6 @@ static void usage(void)
 "\n"
 "  -F, --pid-file <file>   giving a file for the daemon's pid to be written,\n"
 "  -H, --help              to output this message,\n"
-"  -N, --no-fork           to request that the daemon does not fork,\n"
 "  -T, --trace-file <file> giving the file for logging, and\n"
 "      --trace-control=+<switch> activate a specific <switch>\n"
 "      --trace-control=-<switch> deactivate a specific <switch>\n"
@@ -2699,7 +2698,6 @@ static struct option options[] = {
 	{ "event", 1, NULL, 'e' },
 	{ "master-domid", 1, NULL, 'm' },
 	{ "help", 0, NULL, 'H' },
-	{ "no-fork", 0, NULL, 'N' },
 	{ "priv-domid", 1, NULL, 'p' },
 	{ "entry-size", 1, NULL, 'S' },
 	{ "trace-file", 1, NULL, 'T' },
@@ -2822,7 +2820,6 @@ int main(int argc, char *argv[])
 {
 	int opt;
 	int sock_pollfd_idx = -1;
-	bool dofork = true;
 	bool live_update = false;
 	const char *pidfile = NULL;
 	int timeout;
@@ -2831,7 +2828,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "E:F:H::KNS:t:A:M:Q:q:T:RW:w:U",
+				  "E:F:H::KS:t:A:M:Q:q:T:RW:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
@@ -2843,9 +2840,6 @@ int main(int argc, char *argv[])
 		case 'H':
 			usage();
 			return 0;
-		case 'N':
-			dofork = false;
-			break;
 		case 'R':
 			recovery = false;
 			break;
@@ -2911,18 +2905,13 @@ int main(int argc, char *argv[])
 	/* Errors ignored here, will be reported when we open files */
 	mkdir(xenstore_daemon_rundir(), 0755);
 
-	if (dofork) {
-		openlog("xenstored", 0, LOG_DAEMON);
-		if (!live_update)
-			daemonize();
-	}
+	openlog("xenstored", 0, LOG_DAEMON);
+	if (!live_update)
+		daemonize();
+
 	if (pidfile)
 		write_pidfile(pidfile);
 
-	/* Talloc leak reports go to stderr, which is closed if we fork. */
-	if (!dofork)
-		talloc_enable_leak_report_full();
-
 	/* Don't kill us with SIGPIPE. */
 	signal(SIGPIPE, SIG_IGN);
 
@@ -2942,11 +2931,10 @@ int main(int argc, char *argv[])
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
-	if (dofork && !live_update)
+	if (!live_update)
 		finish_daemonize();
 #ifndef __MINIOS__
-	if (dofork)
-		xprintf = trace;
+	xprintf = trace;
 #endif
 
 	signal(SIGHUP, trigger_reopen_log);
-- 
2.35.3


