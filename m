Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A57F2BEA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 12:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637748.993773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7k-00044v-Jg; Tue, 21 Nov 2023 11:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637748.993773; Tue, 21 Nov 2023 11:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7k-00042O-GX; Tue, 21 Nov 2023 11:41:00 +0000
Received: by outflank-mailman (input) for mailman id 637748;
 Tue, 21 Nov 2023 11:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5P7j-00041h-0A
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 11:40:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6032bb1-8862-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 12:40:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43D6A1F8BD;
 Tue, 21 Nov 2023 11:40:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14154138E3;
 Tue, 21 Nov 2023 11:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y5GFA0iXXGUTdAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 11:40:56 +0000
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
X-Inumbo-ID: d6032bb1-8862-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700566856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kffZ5HEaRzPIhSAhjp1pFj/sXobLeFjpgKZB+hLBr4=;
	b=VwCJsnSN0JL+V5uN5KeTb6BHohyex6hn1ExTYCjDQfgLxoYXV6NOxR3FlZX0U8uqKQVQDA
	B4qDzPuWsQqgoMdxGqaPRy9xkVYwQoiQWrLeh1ClWZVm7TTjGq1glG9FF3ldwqV82pB+XT
	ZK/r4a6h+yBnDyjF/vjUuL8I9rnu/Gg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 1/5] tools/xenstored: remove "-D" command line parameter
Date: Tue, 21 Nov 2023 12:40:44 +0100
Message-Id: <20231121114048.31294-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121114048.31294-1-jgross@suse.com>
References: <20231121114048.31294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
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
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Remove the "-D" command parameter, which is disabling initialization of
the mandatory domain data handling.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstored/core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 311764eb0c..3465b7ecf1 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2661,7 +2661,6 @@ static void usage(void)
 "\n"
 "where options may include:\n"
 "\n"
-"  -D, --no-domain-init    to state that xenstored should not initialise dom0,\n"
 "  -F, --pid-file <file>   giving a file for the daemon's pid to be written,\n"
 "  -H, --help              to output this message,\n"
 "  -N, --no-fork           to request that the daemon does not fork,\n"
@@ -2708,7 +2707,6 @@ static void usage(void)
 
 
 static struct option options[] = {
-	{ "no-domain-init", 0, NULL, 'D' },
 	{ "entry-nb", 1, NULL, 'E' },
 	{ "pid-file", 1, NULL, 'F' },
 	{ "event", 1, NULL, 'e' },
@@ -2841,7 +2839,6 @@ int main(int argc, char *argv[])
 	int sock_pollfd_idx = -1;
 	bool dofork = true;
 	bool outputpid = false;
-	bool no_domain_init = false;
 	bool live_update = false;
 	const char *pidfile = NULL;
 	int timeout;
@@ -2850,12 +2847,9 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "DE:F:H::KNPS:t:A:M:Q:q:T:RVW:w:U",
+				  "E:F:H::KNPS:t:A:M:Q:q:T:RVW:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
-		case 'D':
-			no_domain_init = true;
-			break;
 		case 'E':
 			hard_quotas[ACC_NODES].val = get_optval_uint(optarg);
 			break;
@@ -2964,7 +2958,7 @@ int main(int argc, char *argv[])
 	init_pipe(reopen_log_pipe);
 
 	/* Listen to hypervisor. */
-	if (!no_domain_init && !live_update) {
+	if (!live_update) {
 		domain_init(-1);
 		dom0_init();
 	}
-- 
2.35.3


