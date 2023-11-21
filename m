Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328E7F2BEC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 12:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637749.993783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7o-0004MG-TM; Tue, 21 Nov 2023 11:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637749.993783; Tue, 21 Nov 2023 11:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7o-0004KO-QY; Tue, 21 Nov 2023 11:41:04 +0000
Received: by outflank-mailman (input) for mailman id 637749;
 Tue, 21 Nov 2023 11:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5P7m-00041h-OV
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 11:41:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8c5c014-8862-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 12:41:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E633D218B5;
 Tue, 21 Nov 2023 11:41:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A84FE138E3;
 Tue, 21 Nov 2023 11:41:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id swa/J02XXGUhdAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 11:41:01 +0000
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
X-Inumbo-ID: d8c5c014-8862-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700566861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ixUKxwXwvgJI13MFOVkZeKVDZtbxXeO2DXr+/EHH4pk=;
	b=ffLet7GrL/rEYuhg/59te0ik6SbvshhL4c958B5cyyXDm7iAPHl4VwYaWcpyDQuEEWJU8P
	30QUKTQun4UuTRpeWTjsO8+XHhg5tI9X7mVfA+SzECMEBjaB0qCxOu3skfqbg5+neTghpj
	GspJTEabEIdCjU6uV4b+mp0HIp+x/MA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 2/5] tools/xenstored: remove "-V" command line option
Date: Tue, 21 Nov 2023 12:40:45 +0100
Message-Id: <20231121114048.31294-3-jgross@suse.com>
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
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

The "-V" (verbose) command line option is nearly completely redundant
with "io" tracing. Just the time of the printed data is a little bit
different, while the tracing is more informative.

Remove the verbose option.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstored/core.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 3465b7ecf1..194e24238b 100644
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


