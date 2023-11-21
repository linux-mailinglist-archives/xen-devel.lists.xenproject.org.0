Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423057F2BE9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 12:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637750.993794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7u-0004hL-6T; Tue, 21 Nov 2023 11:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637750.993794; Tue, 21 Nov 2023 11:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7u-0004ei-25; Tue, 21 Nov 2023 11:41:10 +0000
Received: by outflank-mailman (input) for mailman id 637750;
 Tue, 21 Nov 2023 11:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5P7s-00041h-9O
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 11:41:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc2193b8-8862-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 12:41:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B38121923;
 Tue, 21 Nov 2023 11:41:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54EED138E3;
 Tue, 21 Nov 2023 11:41:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HSuRE1OXXGUvdAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 11:41:07 +0000
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
X-Inumbo-ID: dc2193b8-8862-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700566867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvlJrXDiW9tZqlu8RFLLAE1oGWnA1kYBF6QNlBpYHK8=;
	b=VxdGkqvuPNJlmjlQX3kaFIMfrMl7iNwUyfITgCky8ixUQquY5jBaz9zJZ8+1ag9g5a261G
	wdL9xFV+SmrI1ZV3lZl8vD0D/mqseJEoqDsuUpB9A+BeyEtNvNDikK7bVUlBmAXE5bTLBQ
	CIWw/Qn1KQDnqVnOB4OkL+AeM5PvJRg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 3/5] tools/xenstored: remove the "-P" command line option
Date: Tue, 21 Nov 2023 12:40:46 +0100
Message-Id: <20231121114048.31294-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121114048.31294-1-jgross@suse.com>
References: <20231121114048.31294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[15.98%]
X-Spam-Flag: NO

The "-P" command line option just results in printing the PID of the
xenstored daemon to stdout before stdout is being closed. The same
information can be retrieved from the PID file via the "-F" option.

Remove the redundant "-P" option.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstored/core.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 194e24238b..3ce50b313b 100644
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


