Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D387F2BF2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 12:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637756.993813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P85-0005cO-NW; Tue, 21 Nov 2023 11:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637756.993813; Tue, 21 Nov 2023 11:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P85-0005Yn-KJ; Tue, 21 Nov 2023 11:41:21 +0000
Received: by outflank-mailman (input) for mailman id 637756;
 Tue, 21 Nov 2023 11:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5P83-00041h-UK
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 11:41:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2d1a7a6-8862-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 12:41:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9A96218F2;
 Tue, 21 Nov 2023 11:41:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82BEF138E3;
 Tue, 21 Nov 2023 11:41:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uB6RHl6XXGVOdAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 11:41:18 +0000
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
X-Inumbo-ID: e2d1a7a6-8862-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700566878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJ2+NXd89caogZEaF0ZqIYFijCKoRqJHe0UD7PTMHYc=;
	b=jtADvQ6zfkEcbVv5+hh18xK8b2WKli5edwLx66fXpH+4W/U6GzJIGcC3N9CXFnZ+MjgOXM
	ZuIiEaMTR8UhxkhUAhLwz+IJYjuiURGBgUQN93BlaaEhSkZZagk6nRtAAdVF9w8qTifMhO
	L1mc+aRECbRCthf3k/DbkZMUKYP/x2s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 5/5] tools/xenstored: remove "-N" command line option
Date: Tue, 21 Nov 2023 12:40:48 +0100
Message-Id: <20231121114048.31294-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121114048.31294-1-jgross@suse.com>
References: <20231121114048.31294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

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
index 43be89c4fc..f5766452fe 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2646,7 +2646,6 @@ static void usage(void)
 "\n"
 "  -F, --pid-file <file>   giving a file for the daemon's pid to be written,\n"
 "  -H, --help              to output this message,\n"
-"  -N, --no-fork           to request that the daemon does not fork,\n"
 "  -T, --trace-file <file> giving the file for logging, and\n"
 "      --trace-control=+<switch> activate a specific <switch>\n"
 "      --trace-control=-<switch> deactivate a specific <switch>\n"
@@ -2691,7 +2690,6 @@ static struct option options[] = {
 	{ "event", 1, NULL, 'e' },
 	{ "master-domid", 1, NULL, 'm' },
 	{ "help", 0, NULL, 'H' },
-	{ "no-fork", 0, NULL, 'N' },
 	{ "priv-domid", 1, NULL, 'p' },
 	{ "entry-size", 1, NULL, 'S' },
 	{ "trace-file", 1, NULL, 'T' },
@@ -2813,7 +2811,6 @@ int main(int argc, char *argv[])
 {
 	int opt;
 	int sock_pollfd_idx = -1;
-	bool dofork = true;
 	bool live_update = false;
 	const char *pidfile = NULL;
 	int timeout;
@@ -2822,7 +2819,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "E:F:H::KNS:t:A:M:Q:q:T:W:w:U",
+				  "E:F:H::KS:t:A:M:Q:q:T:W:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'E':
@@ -2834,9 +2831,6 @@ int main(int argc, char *argv[])
 		case 'H':
 			usage();
 			return 0;
-		case 'N':
-			dofork = false;
-			break;
 		case 'S':
 			hard_quotas[ACC_NODESZ].val = get_optval_uint(optarg);
 			break;
@@ -2899,18 +2893,13 @@ int main(int argc, char *argv[])
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
 
@@ -2930,11 +2919,10 @@ int main(int argc, char *argv[])
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


