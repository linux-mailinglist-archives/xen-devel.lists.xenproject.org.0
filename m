Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPcuLiARvGnbrwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:07:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23F02CD667
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257292.1551714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3ExL-0003Kf-W1; Thu, 19 Mar 2026 15:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257292.1551714; Thu, 19 Mar 2026 15:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3ExL-0003IC-Su; Thu, 19 Mar 2026 15:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1257292;
 Thu, 19 Mar 2026 15:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3ExK-0003I6-Tk
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 15:06:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a0b8fbe-23a5-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 16:06:37 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C7295BDB7;
 Thu, 19 Mar 2026 15:06:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0E124273B;
 Thu, 19 Mar 2026 15:06:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id n6+sNfwQvGlTIAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Mar 2026 15:06:36 +0000
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
X-Inumbo-ID: 3a0b8fbe-23a5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773932797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igSCQ4R7W3BM61Lrna0U8D/RNVuugNOT+EHqmQFTBoc=;
	b=sYrczV8iG+iM9wjce9AeFVYPvSIjtxxk8A1Hezmi2ituXo0aQYRQYqk2juKLknJXI2zHxX
	9gbH7iCCYotK7y+Mnoy5u8btnat0WsZf/D/6zjcRh4YVi6ks8OsFh0JcS3BSLbSKcas1PD
	cVWoCLzH+QzA7DH7H8GNjMnhjKQEVVA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sYrczV8i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773932797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igSCQ4R7W3BM61Lrna0U8D/RNVuugNOT+EHqmQFTBoc=;
	b=sYrczV8iG+iM9wjce9AeFVYPvSIjtxxk8A1Hezmi2ituXo0aQYRQYqk2juKLknJXI2zHxX
	9gbH7iCCYotK7y+Mnoy5u8btnat0WsZf/D/6zjcRh4YVi6ks8OsFh0JcS3BSLbSKcas1PD
	cVWoCLzH+QzA7DH7H8GNjMnhjKQEVVA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 9/8] tools/xs-clients: support depth with xenstore-watch
Date: Thu, 19 Mar 2026 16:06:23 +0100
Message-ID: <20260319150626.436719-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E23F02CD667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a "-d <depth>" parameter to xenstore-watch, allowing to specify
the depth parameter of the XS_WATCH command.

Using "-d" without support of depth by xenstored will refuse to set
the watch(es).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xs-clients/xenstore_client.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/xs-clients/xenstore_client.c b/tools/xs-clients/xenstore_client.c
index 9a25704b91..4a14cb334f 100644
--- a/tools/xs-clients/xenstore_client.c
+++ b/tools/xs-clients/xenstore_client.c
@@ -445,7 +445,7 @@ do_watch(struct xs_handle *xsh, int max_events)
 static int
 perform(enum mode mode, int optind, int argc, char **argv, struct xs_handle *xsh,
         xs_transaction_t xth, int prefix, int tidy, int upto, int recurse, int nr_watches,
-        int raw)
+        int raw, int depth)
 {
     switch (mode) {
     case MODE_ls:
@@ -627,8 +627,11 @@ perform(enum mode mode, int optind, int argc, char **argv, struct xs_handle *xsh
             for (; argv[optind]; optind++) {
                 const char *w = argv[optind];
 
-                if (!xs_watch(xsh, w, w))
+                if (depth < 0 && !xs_watch(xsh, w, w))
                     errx(1, "Unable to add watch on %s\n", w);
+                if (depth >= 0 && !xs_watch_depth(xsh, w, w, depth))
+                    errx(1, "Unable to add watch on %s with depth %d\n", w,
+                         depth);
             }
             do_watch(xsh, nr_watches);
         }
@@ -676,6 +679,7 @@ main(int argc, char **argv)
     int nr_watches = -1;
     int transaction;
     int raw = 0;
+    int depth = -1;
     struct winsize ws;
     enum mode mode;
 
@@ -709,10 +713,11 @@ main(int argc, char **argv)
 	    {"recurse", 0, 0, 'r'}, /* MODE_chmod */
 	    {"number",  1, 0, 'n'}, /* MODE_watch */
 	    {"raw",     0, 0, 'R'}, /* MODE_read || MODE_write */
+	    {"depth",   1, 0, 'd'}, /* MODE_watch */
 	    {0, 0, 0, 0}
 	};
 
-	c = getopt_long(argc - switch_argv, argv + switch_argv, "hfspturn:R",
+	c = getopt_long(argc - switch_argv, argv + switch_argv, "hfspturn:Rd:",
 			long_options, &index);
 	if (c == -1)
 	    break;
@@ -766,6 +771,12 @@ main(int argc, char **argv)
 	    else
 		usage(1, mode, switch_argv, argv[0]);
 	    break;
+	case 'd':
+	    if ( mode == MODE_watch )
+		depth = atoi(optarg);
+	    else
+		usage(1, mode, switch_argv, argv[0]);
+	    break;
 	}
     }
 
@@ -819,7 +830,7 @@ again:
 	    errx(1, "couldn't start transaction");
     }
 
-    ret = perform(mode, optind, argc - switch_argv, argv + switch_argv, xsh, xth, prefix, tidy, upto, recurse, nr_watches, raw);
+    ret = perform(mode, optind, argc - switch_argv, argv + switch_argv, xsh, xth, prefix, tidy, upto, recurse, nr_watches, raw, depth);
 
     if (transaction && !xs_transaction_end(xsh, xth, ret)) {
 	if (ret == 0 && errno == EAGAIN) {
-- 
2.53.0


