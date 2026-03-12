Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCmJMxfhsmmXQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CF274E7D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252560.1549211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iK5-00007M-40; Thu, 12 Mar 2026 15:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252560.1549211; Thu, 12 Mar 2026 15:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iK5-0008Vr-0F; Thu, 12 Mar 2026 15:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1252560;
 Thu, 12 Mar 2026 15:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iK4-0007Yh-1t
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b4c35ec-1e2b-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 16:51:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2ED94D422;
 Thu, 12 Mar 2026 15:51:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 989B34004A;
 Thu, 12 Mar 2026 15:51:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1XqzIwrhsmmETQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:38 +0000
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
X-Inumbo-ID: 5b4c35ec-1e2b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=536CC7FPa9EY0f440nvgYhoisCibNAKp2N047ggM1Lo=;
	b=h16lj+687PEh5/wSkXFmhFppRKRDh0gvc8nB2GhYxXlF6m9EQIbUI7NTA+QMfHC+Eu5NCW
	8ye203t+bNtyQjAJ4T9ZXf/GXJ6+NRF2spv9cZcqwBcTzTirxbfpp6iqlSuRpVOeE6wcWf
	kt6nn+5m0S+ZOSg7/xHGTK2cKVYG298=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=536CC7FPa9EY0f440nvgYhoisCibNAKp2N047ggM1Lo=;
	b=h16lj+687PEh5/wSkXFmhFppRKRDh0gvc8nB2GhYxXlF6m9EQIbUI7NTA+QMfHC+Eu5NCW
	8ye203t+bNtyQjAJ4T9ZXf/GXJ6+NRF2spv9cZcqwBcTzTirxbfpp6iqlSuRpVOeE6wcWf
	kt6nn+5m0S+ZOSg7/xHGTK2cKVYG298=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 6/8] tools/xs-clients: don't exit with error when using -h parameter
Date: Thu, 12 Mar 2026 16:51:00 +0100
Message-ID: <20260312155102.2862824-7-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312155102.2862824-1-jgross@suse.com>
References: <20260312155102.2862824-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 604CF274E7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "-h" parameter of the xenstore-* programs is explicitly meant to
show the usage information of the programs. This use case should not
result in an error of the program's exit code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xs-clients/xenstore_client.c | 40 +++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/xs-clients/xenstore_client.c b/tools/xs-clients/xenstore_client.c
index a104cf6487..1794451d43 100644
--- a/tools/xs-clients/xenstore_client.c
+++ b/tools/xs-clients/xenstore_client.c
@@ -214,37 +214,37 @@ output_raw(const char *data, int len)
 }
 
 static void
-usage(enum mode mode, int incl_mode, const char *progname)
+usage(int eval, enum mode mode, int incl_mode, const char *progname)
 {
     const char *mstr = NULL;
 
     switch (mode) {
     case MODE_unknown:
-	errx(1, "Usage: %s <mode> [-h] [...]", progname);
+	errx(eval, "Usage: %s <mode> [-h] [...]", progname);
     case MODE_read:
 	mstr = incl_mode ? "read " : "";
-	errx(1, "Usage: %s %s[-h] [-p] [-R] key [...]", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-p] [-R] key [...]", progname, mstr);
     case MODE_write:
 	mstr = incl_mode ? "write " : "";
-	errx(1, "Usage: %s %s[-h] [-R] key value [...]", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-R] key value [...]", progname, mstr);
     case MODE_rm:
 	mstr = incl_mode ? "rm " : "";
-	errx(1, "Usage: %s %s[-h] [-t] key [...]", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-t] key [...]", progname, mstr);
     case MODE_exists:
 	mstr = incl_mode ? "exists " : "";
 	/* fallthrough */
     case MODE_list:
 	mstr = mstr ? : incl_mode ? "list " : "";
-	errx(1, "Usage: %s %s[-h] [-p] key [...]", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-p] key [...]", progname, mstr);
     case MODE_ls:
 	mstr = mstr ? : incl_mode ? "ls " : "";
-	errx(1, "Usage: %s %s[-h] [-f] [-p] [path]", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-f] [-p] [path]", progname, mstr);
     case MODE_chmod:
 	mstr = incl_mode ? "chmod " : "";
-	errx(1, "Usage: %s %s[-h] [-u] [-r] key <mode [modes...]>", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-u] [-r] key <mode [modes...]>", progname, mstr);
     case MODE_watch:
 	mstr = incl_mode ? "watch " : "";
-	errx(1, "Usage: %s %s[-h] [-n NR] key", progname, mstr);
+	errx(eval, "Usage: %s %s[-h] [-n NR] key", progname, mstr);
     }
 }
 
@@ -685,7 +685,7 @@ main(int argc, char **argv)
 	command = command + strlen("xenstore-");
     }
     else if (argc < 2)
-	usage(MODE_unknown, 0, argv[0]);
+	usage(1, MODE_unknown, 0, argv[0]);
     else
     {
 	command = argv[1];
@@ -715,7 +715,7 @@ main(int argc, char **argv)
 
 	switch (c) {
 	case 'h':
-	    usage(mode, switch_argv, argv[0]);
+	    usage(0, mode, switch_argv, argv[0]);
 	    /* NOTREACHED */
         case 'f':
 	    if ( mode == MODE_ls ) {
@@ -723,44 +723,44 @@ main(int argc, char **argv)
 		desired_width = 0;
 		show_whole_path = 1;
 	    } else {
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    }
             break;
 	case 'p':
 	    if ( mode == MODE_read || mode == MODE_list || mode == MODE_ls )
 		prefix = 1;
 	    else
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    break;
 	case 't':
 	    if ( mode == MODE_rm )
 		tidy = 1;
 	    else
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    break;
 	case 'u':
 	    if ( mode == MODE_chmod )
 		upto = 1;
 	    else
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    break;
 	case 'r':
 	    if ( mode == MODE_chmod )
 		recurse = 1;
 	    else
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    break;
 	case 'n':
 	    if ( mode == MODE_watch )
 		nr_watches = atoi(optarg);
 	    else
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    break;
 	case 'R':
 	    if ( mode == MODE_read || mode == MODE_write )
 		raw = 1;
 	    else
-		usage(mode, switch_argv, argv[0]);
+		usage(1, mode, switch_argv, argv[0]);
 	    break;
 	}
     }
@@ -770,13 +770,13 @@ main(int argc, char **argv)
 	break;
     case MODE_write:
 	if ((argc - switch_argv - optind) % 2 == 1) {
-	    usage(mode, switch_argv, argv[0]);
+	    usage(1, mode, switch_argv, argv[0]);
 	    /* NOTREACHED */
 	}
 	/* DROP-THRU */
     default:
 	if (optind == argc - switch_argv) {
-	    usage(mode, switch_argv, argv[0]);
+	    usage(1, mode, switch_argv, argv[0]);
 	    /* NOTREACHED */
 	}
     }
-- 
2.53.0


