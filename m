Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80286C97B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687048.1069839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffqW-0006QL-RP; Thu, 29 Feb 2024 12:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687048.1069839; Thu, 29 Feb 2024 12:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffqW-0006NB-O2; Thu, 29 Feb 2024 12:49:08 +0000
Received: by outflank-mailman (input) for mailman id 687048;
 Thu, 29 Feb 2024 12:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rffqV-0003qK-E3
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:49:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecba23be-d700-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:49:06 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AED821CE4;
 Thu, 29 Feb 2024 12:49:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 431351329E;
 Thu, 29 Feb 2024 12:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id fCTdDkJ94GUnIgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 12:49:06 +0000
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
X-Inumbo-ID: ecba23be-d700-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGQ2M6ZDlC8Q8t5jjlaB/u1rTlT60Df0gemVV+Z+fCo=;
	b=edTSX6cs5QDWPPRpMv1IUgCzx8+cyhAx6s4yms/R3cnzLnkGloU9kkkrozDmdhivG/b3vj
	9sO/xt44uyr30u3BHbBZ/6GepJB+r3hJl4eU2VF92FNyehGkchIgJIADo74yvFWS0ZMY1i
	U6w/oKmdEo62ez9Ocb7P6XUEVbT0Yfs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGQ2M6ZDlC8Q8t5jjlaB/u1rTlT60Df0gemVV+Z+fCo=;
	b=edTSX6cs5QDWPPRpMv1IUgCzx8+cyhAx6s4yms/R3cnzLnkGloU9kkkrozDmdhivG/b3vj
	9sO/xt44uyr30u3BHbBZ/6GepJB+r3hJl4eU2VF92FNyehGkchIgJIADo74yvFWS0ZMY1i
	U6w/oKmdEo62ez9Ocb7P6XUEVbT0Yfs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v9 6/6] tools/xenstored: have a single do_control_memreport()
Date: Thu, 29 Feb 2024 13:48:30 +0100
Message-Id: <20240229124830.13680-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240229124830.13680-1-jgross@suse.com>
References: <20240229124830.13680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[48.12%]
X-Spam-Level: ****
X-Spam-Score: 4.89
X-Spam-Flag: NO

With 9pfs now available in Xenstore-stubdom, there is no reason to
have distinct do_control_memreport() variants for the daemon and the
stubdom implementations.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/xenstored/control.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index dae23a5ac0..9561289179 100644
--- a/tools/xenstored/control.c
+++ b/tools/xenstored/control.c
@@ -216,23 +216,11 @@ static int do_control_logfile(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-#ifdef __MINIOS__
-static int do_control_memreport(const void *ctx, struct connection *conn,
-				const char **vec, int num)
-{
-	if (num)
-		return EINVAL;
-
-	talloc_report_full(NULL, stdout);
-
-	send_ack(conn, XS_CONTROL);
-	return 0;
-}
-#else
 static int do_control_memreport(const void *ctx, struct connection *conn,
 				const char **vec, int num)
 {
 	FILE *fp;
+	const char *filename;
 	int fd;
 
 	if (num > 1)
@@ -255,8 +243,12 @@ static int do_control_memreport(const void *ctx, struct connection *conn,
 			if (!fp)
 				close(fd);
 		}
-	} else
-		fp = fopen(vec[0], "a");
+	} else {
+		filename = absolute_filename(ctx, vec[0]);
+		if (!filename)
+			return ENOMEM;
+		fp = fopen(filename, "a");
+	}
 
 	if (!fp)
 		return EBADF;
@@ -267,7 +259,6 @@ static int do_control_memreport(const void *ctx, struct connection *conn,
 	send_ack(conn, XS_CONTROL);
 	return 0;
 }
-#endif
 
 static int do_control_print(const void *ctx, struct connection *conn,
 			    const char **vec, int num)
@@ -310,11 +301,7 @@ static struct cmd_s cmds[] = {
 		"    Default timeout is 60 seconds.", 5 },
 #endif
 	{ "logfile", do_control_logfile, "<file>" },
-#ifdef __MINIOS__
-	{ "memreport", do_control_memreport, "" },
-#else
 	{ "memreport", do_control_memreport, "[<file>]" },
-#endif
 	{ "print", do_control_print, "<string>" },
 	{ "quota", do_control_quota,
 		"[set <name> <val>|<domid>|max [-r]]" },
-- 
2.35.3


