Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC1B11F44
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057791.1425505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIKw-0007Ev-9v; Fri, 25 Jul 2025 13:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057791.1425505; Fri, 25 Jul 2025 13:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIKw-0007Bu-6S; Fri, 25 Jul 2025 13:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1057791;
 Fri, 25 Jul 2025 13:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufIKu-0007Aq-VV
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:19:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068493ed-695a-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 15:19:42 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 561D92170E;
 Fri, 25 Jul 2025 13:19:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 275E2134E8;
 Fri, 25 Jul 2025 13:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HVQ2CG6Eg2jYPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:19:42 +0000
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
X-Inumbo-ID: 068493ed-695a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjaK3DHae0L+tvH83IKYZFxcoyYS5iwSjWvHNKFN12w=;
	b=u63xHcK9oTeHakB3sAW52n2jzfehuPFKbkUx6X/FEavtXOSfFOyOh0XJgVCMdlOhp9LEo1
	JBFooOCjpDfOn7sZF3zMgIVR8zc8Zt3fp2OOOSQf+hXhJkTasUcfHP2+79ocwFXkoBWBT4
	zl3YtdGrhZajsDtFEaFFL4bHxDUmJlg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjaK3DHae0L+tvH83IKYZFxcoyYS5iwSjWvHNKFN12w=;
	b=u63xHcK9oTeHakB3sAW52n2jzfehuPFKbkUx6X/FEavtXOSfFOyOh0XJgVCMdlOhp9LEo1
	JBFooOCjpDfOn7sZF3zMgIVR8zc8Zt3fp2OOOSQf+hXhJkTasUcfHP2+79ocwFXkoBWBT4
	zl3YtdGrhZajsDtFEaFFL4bHxDUmJlg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/7] tools/xenstored: support specification of migration stream version
Date: Fri, 25 Jul 2025 15:19:23 +0200
Message-ID: <20250725131928.19286-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

In order to prepare xenstored supporting migration stream versions
other than 1, add a parameter to the live update command allowing to
specify the version of the migration stream.

This will allow going back from xenstored using version 2 per default
to a xenstored only accepting version 1.

For now only version 1 is supported.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/control.c           |  6 ++---
 tools/xenstored/lu.c                | 21 ++++++++++-----
 tools/xenstored/lu.h                |  1 +
 tools/xs-clients/xenstore_control.c | 41 ++++++++++++++++++++++-------
 4 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index 9561289179..953c01b735 100644
--- a/tools/xenstored/control.c
+++ b/tools/xenstored/control.c
@@ -289,7 +289,7 @@ static struct cmd_s cmds[] = {
 	 *    Mini-OS: -b <binary-size>
 	 *             -d <size> <data-bytes> (multiple of those)
 	 * 2. New command-line (optional): -c <cmdline>
-	 * 3. Start of update: -s [-F] [-t <timeout>]
+	 * 3. Start of update: -s [-F] [-t <timeout>] [-v <version>]
 	 * Any sub-operation needs to respond with the string "OK" in case
 	 * of success, any other response indicates failure.
 	 * A started live-update sequence can be aborted via "-a" (not
@@ -297,8 +297,8 @@ static struct cmd_s cmds[] = {
 	 * sub-operation).
 	 */
 	{ "live-update", do_control_lu,
-		"[-c <cmdline>] [-F] [-t <timeout>] <file>\n"
-		"    Default timeout is 60 seconds.", 5 },
+		"[-c <cmdline>] [-F] [-t <timeout>] [-v <version>] <file>\n"
+		"    Default timeout is 60 seconds, default version is 1.", 7 },
 #endif
 	{ "logfile", do_control_logfile, "<file>" },
 	{ "memreport", do_control_memreport, "[<file>]" },
diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index 4fccbbc195..330820a8a2 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -283,7 +283,7 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 		return "Dump state open error";
 
 	memcpy(pre.ident, XS_STATE_IDENT, sizeof(pre.ident));
-	pre.version = htobe32(XS_STATE_VERSION);
+	pre.version = htobe32(lu_status->version);
 	pre.flags = XS_STATE_FLAGS;
 	if (fwrite(&pre, sizeof(pre), 1, fp) != 1) {
 		ret = "Dump write error";
@@ -412,13 +412,16 @@ static bool do_lu_start(struct delayed_request *req)
 }
 
 static const char *lu_start(const void *ctx, struct connection *conn,
-			    bool force, unsigned int to)
+			    bool force, unsigned int to, unsigned int vers)
 {
 	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
 
 	if (!lu_status || lu_status->conn != conn)
 		return "Not in live-update session.";
 
+	if (!vers || vers > XS_STATE_VERSION)
+		return "Migration stream version not supported.";
+
 #ifdef __MINIOS__
 	if (lu_status->kernel_size != lu_status->kernel_off)
 		return "Kernel not complete.";
@@ -426,6 +429,7 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 
 	lu_status->force = force;
 	lu_status->timeout = to;
+	lu_status->version = vers;
 	lu_status->started_at = time(NULL);
 	lu_status->in = conn->in;
 
@@ -441,6 +445,7 @@ int do_control_lu(const void *ctx, struct connection *conn, const char **vec,
 	unsigned int i;
 	bool force = false;
 	unsigned int to = 0;
+	unsigned int vers = XS_STATE_VERSION;
 
 	if (num < 1)
 		return EINVAL;
@@ -457,15 +462,19 @@ int do_control_lu(const void *ctx, struct connection *conn, const char **vec,
 			return EINVAL;
 	} else if (!strcmp(vec[0], "-s")) {
 		for (i = 1; i < num; i++) {
-			if (!strcmp(vec[i], "-F"))
+			if (!strcmp(vec[i], "-F")) {
 				force = true;
-			else if (!strcmp(vec[i], "-t") && i < num - 1) {
+			} else if (!strcmp(vec[i], "-t") && i < num - 1) {
 				i++;
 				to = atoi(vec[i]);
-			} else
+			} else if (!strcmp(vec[i], "-v") && i < num - 1) {
+				i++;
+				vers = atoi(vec[i]);
+			} else {
 				return EINVAL;
+			}
 		}
-		ret = lu_start(ctx, conn, force, to);
+		ret = lu_start(ctx, conn, force, to, vers);
 		if (!ret)
 			return errno;
 	} else {
diff --git a/tools/xenstored/lu.h b/tools/xenstored/lu.h
index dacc9b6e42..512b8a6db2 100644
--- a/tools/xenstored/lu.h
+++ b/tools/xenstored/lu.h
@@ -26,6 +26,7 @@ struct live_update {
 	/* Start parameters. */
 	bool force;
 	unsigned int timeout;
+	unsigned int version;
 	time_t started_at;
 };
 
diff --git a/tools/xs-clients/xenstore_control.c b/tools/xs-clients/xenstore_control.c
index 548363ee70..4b523931ce 100644
--- a/tools/xs-clients/xenstore_control.c
+++ b/tools/xs-clients/xenstore_control.c
@@ -26,7 +26,8 @@ static int add_to_buf(char **buf, const char *val, int len)
     return len + vallen;
 }
 
-static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
+static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to,
+                             unsigned int vers)
 {
     int len = 0;
     char *buf = NULL, *ret;
@@ -40,6 +41,15 @@ static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
     free(ret);
     if (force)
         len = add_to_buf(&buf, "-F", len);
+    if (vers) {
+        if (asprintf(&ret, "%u", vers) < 0) {
+            free(buf);
+            return 1;
+        }
+        len = add_to_buf(&buf, "-v", len);
+        len = add_to_buf(&buf, ret, len);
+        free(ret);
+    }
     if (len < 0)
         return 1;
 
@@ -197,7 +207,8 @@ static int send_kernel_blob(struct xs_handle *xsh, const char *binary)
  * 3. start update (includes flags)
  */
 static int live_update_stubdom(struct xs_handle *xsh, const char *binary,
-                               const char *cmdline, bool force, unsigned int to)
+                               const char *cmdline, bool force, unsigned int to,
+                               unsigned int vers)
 {
     int rc;
 
@@ -211,7 +222,7 @@ static int live_update_stubdom(struct xs_handle *xsh, const char *binary,
             goto abort;
     }
 
-    rc = live_update_start(xsh, force, to);
+    rc = live_update_start(xsh, force, to, vers);
     if (rc)
         goto abort;
 
@@ -231,7 +242,8 @@ static int live_update_stubdom(struct xs_handle *xsh, const char *binary,
  * 3. start update (includes flags)
  */
 static int live_update_daemon(struct xs_handle *xsh, const char *binary,
-                              const char *cmdline, bool force, unsigned int to)
+                              const char *cmdline, bool force, unsigned int to,
+                              unsigned int vers)
 {
     int len = 0, rc;
     char *buf = NULL, *ret;
@@ -256,7 +268,7 @@ static int live_update_daemon(struct xs_handle *xsh, const char *binary,
             goto abort;
     }
 
-    rc = live_update_start(xsh, force, to);
+    rc = live_update_start(xsh, force, to, vers);
     if (rc)
         goto abort;
 
@@ -270,7 +282,7 @@ static int live_update_daemon(struct xs_handle *xsh, const char *binary,
 static int live_update(struct xs_handle *xsh, int argc, char **argv)
 {
     int rc = 0;
-    unsigned int i, to = 60;
+    unsigned int i, to = 60, vers = 0;
     char *binary = NULL, *cmdline = NULL, *val;
     bool force = false;
 
@@ -291,10 +303,19 @@ static int live_update(struct xs_handle *xsh, int argc, char **argv)
                 goto out;
             }
             to = atoi(argv[i]);
-        } else if (!strcmp(argv[i], "-F"))
+        } else if (!strcmp(argv[i], "-F")) {
             force = true;
-        else
+        } else if (!strcmp(argv[i], "-v")) {
+            i++;
+            if (i == argc) {
+                fprintf(stderr, "Missing version value\n");
+                rc = 2;
+                goto out;
+            }
+            vers = atoi(argv[i]);
+        } else {
             binary = argv[i];
+        }
     }
 
     if (!binary) {
@@ -305,9 +326,9 @@ static int live_update(struct xs_handle *xsh, int argc, char **argv)
 
     val = xs_read(xsh, XBT_NULL, "/tool/xenstored/domid", &i);
     if (val)
-        rc = live_update_stubdom(xsh, binary, cmdline, force, to);
+        rc = live_update_stubdom(xsh, binary, cmdline, force, to, vers);
     else
-        rc = live_update_daemon(xsh, binary, cmdline, force, to);
+        rc = live_update_daemon(xsh, binary, cmdline, force, to, vers);
 
     free(val);
 
-- 
2.43.0


