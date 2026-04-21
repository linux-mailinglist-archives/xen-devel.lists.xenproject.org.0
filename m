Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFcIFJMq52mo4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:43:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D8437CB6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288474.1568774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5lC-0006bx-TQ; Tue, 21 Apr 2026 07:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288474.1568774; Tue, 21 Apr 2026 07:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5lC-0006aF-PF; Tue, 21 Apr 2026 07:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1288474;
 Tue, 21 Apr 2026 07:43:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5lA-0006S1-TK
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:43:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5l8-00Aj5S-OP
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:43:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a86-2eae-0a2a0a5409dd-0a2a4508ca2e-16
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:43:04 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a87-63b5-0a2a45080019-c387df83b932-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:43:04 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A62D75BCE1;
 Tue, 21 Apr 2026 07:43:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82738593AF;
 Tue, 21 Apr 2026 07:43:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /KPLHocq52k/NwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:43:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZ9uOpSwscCXmBP1ykyoRIThmyiK1apA4EI7JRD8j+A=;
	b=IdV5N36UKXP0qHpVN6dZ7oBh+lkURsr51AQY0rFjUcfwnp6kWvC+9fE4t2dldDvVJJxQxs
	Bhr80nK9N8iTISLqK/3vV0tpo8N9yF73kX+7FtMD7J32LBvDFMe8mUsKnwe5aTPx/C6hYX
	nDmGs9zRUp5LkfAG9HCNLH3hwP2fnQk=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IdV5N36U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZ9uOpSwscCXmBP1ykyoRIThmyiK1apA4EI7JRD8j+A=;
	b=IdV5N36UKXP0qHpVN6dZ7oBh+lkURsr51AQY0rFjUcfwnp6kWvC+9fE4t2dldDvVJJxQxs
	Bhr80nK9N8iTISLqK/3vV0tpo8N9yF73kX+7FtMD7J32LBvDFMe8mUsKnwe5aTPx/C6hYX
	nDmGs9zRUp5LkfAG9HCNLH3hwP2fnQk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 9/9] tools/xs-clients: support depth with xenstore-watch
Date: Tue, 21 Apr 2026 09:42:11 +0200
Message-ID: <20260421074211.308473-10-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-c1860d/1776757384-3A169DB1-67D82FDA/0/0
X-purgate-type: clean
X-purgate-size: 3919
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: F14D8437CB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a "-d <depth>" parameter to xenstore-watch, allowing to specify
the depth parameter of the XS_WATCH command.

Using "-d" without support of depth by xenstored will refuse to set
the watch(es).

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- add new flag to man page (Jason Andryuk)
---
 docs/man/xenstore-watch.1.pod      |  9 +++++++++
 tools/xs-clients/xenstore_client.c | 19 +++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/docs/man/xenstore-watch.1.pod b/docs/man/xenstore-watch.1.pod
index de28d380b7..716c5521bc 100644
--- a/docs/man/xenstore-watch.1.pod
+++ b/docs/man/xenstore-watch.1.pod
@@ -17,6 +17,15 @@ event happening.
 
 Show the usage information for xenstore-watch and exit the program.
 
+=item B<-d> B<depth>
+
+Limit the number of sub-directories below the specified I<PATH>s to be
+watched. A B<depth> of 0 will watch only the specified nodes, a B<depth>
+of 1 will watch the specified nodes and their direct children, etc.
+
+Using this option requires xenstored to support the Xenstore watch depth
+feature. In case it is not supported, the B<-d> usage will be rejected.
+
 =item B<-n> B<NR>
 
 Stop waiting after having received B<NR> watch events.
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


