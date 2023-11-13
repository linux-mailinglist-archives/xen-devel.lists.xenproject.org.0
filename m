Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A27E9C54
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631559.984991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHh-0008Qo-1u; Mon, 13 Nov 2023 12:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631559.984991; Mon, 13 Nov 2023 12:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHg-0008OZ-VC; Mon, 13 Nov 2023 12:43:20 +0000
Received: by outflank-mailman (input) for mailman id 631559;
 Mon, 13 Nov 2023 12:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2WHf-00089i-Ig
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:43:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38436a19-8222-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 13:43:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C32B01F7AB;
 Mon, 13 Nov 2023 12:43:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88CD61358C;
 Mon, 13 Nov 2023 12:43:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XFYgIOUZUmVBcQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 12:43:17 +0000
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
X-Inumbo-ID: 38436a19-8222-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699879397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QB3Q3bk7SIJemBIbBb4h+zwgDJi8hqayh+CtPWg6tiE=;
	b=KtcnXZVgZu36wWLzu28Mmx1APh/eqyos7/+GdRQgihEm0ADrOENBXjx7WBCOPMyT6mjJ+X
	06x4IiD4AtS/F4tD8NiZd3rRnDU+Trnqh5n15mjJuTd/QASiD6LfTUrY9l+gyivuvXJbgc
	vUKpfMN9qqogJVVjhzfRE0Uiy616Iwk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/5] tools/xenstored: remove "-D" command line parameter
Date: Mon, 13 Nov 2023 13:43:05 +0100
Message-Id: <20231113124309.10862-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231113124309.10862-1-jgross@suse.com>
References: <20231113124309.10862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the "-D" command parameter, which is disabling initialization of
the mandatory domain data handling.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index edd07711db..8bd4098cb6 100644
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


