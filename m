Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E08614E87
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434975.687935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQQ-0003al-4C; Tue, 01 Nov 2022 15:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434975.687935; Tue, 01 Nov 2022 15:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQP-0003Ts-Vl; Tue, 01 Nov 2022 15:43:37 +0000
Received: by outflank-mailman (input) for mailman id 434975;
 Tue, 01 Nov 2022 15:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optDf-0007Tl-FT
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:30:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c1ccdb4-59fa-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 16:30:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 955E51F8CA;
 Tue,  1 Nov 2022 15:30:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D57F1346F;
 Tue,  1 Nov 2022 15:30:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h95oFZI7YWNzYQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:30:26 +0000
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
X-Inumbo-ID: 1c1ccdb4-59fa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zmqv1jjZI833QBU+Sj0Qlh8Q6xTSbx5Wk7y/ffO7mPc=;
	b=DQqxx27m1f+pKfkMF7ChunHMN3E8sERsgD7maErBhwwQX+N23pWIH5UC+abafJh0xEMkE1
	rVQ9phzVjpds2mp7buNQ0yxBAFSVS6CgWwp9DAUDUfErcov+WzUplR4ZcYKxQ3lq79PGrO
	7otG+23o+9ArqnZxWKOEJQeuP1yiabs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 18/20] tools/xenstore: make log macro globally available
Date: Tue,  1 Nov 2022 16:28:40 +0100
Message-Id: <20221101152842.4257-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the definition of the log() macro to xenstored_core.h in order
to make it usable from other source files, too.

While at it preserve errno from being modified.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- preserve errno (Julien Grall)
---
 tools/xenstore/xenstored_core.c | 14 --------------
 tools/xenstore/xenstored_core.h | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 9361ee7696..e79d82cbff 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -88,20 +88,6 @@ TDB_CONTEXT *tdb_ctx = NULL;
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type);
 
-#define log(...)							\
-	do {								\
-		char *s = talloc_asprintf(NULL, __VA_ARGS__);		\
-		if (s) {						\
-			trace("%s\n", s);				\
-			syslog(LOG_ERR, "%s\n",  s);			\
-			talloc_free(s);					\
-		} else {						\
-			trace("talloc failure during logging\n");	\
-			syslog(LOG_ERR, "talloc failure during logging\n"); \
-		}							\
-	} while (0)
-
-
 int quota_nb_entry_per_domain = 1000;
 int quota_nb_watch_per_domain = 128;
 int quota_max_entry_size = 2048; /* 2K */
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 3c4e27d0dd..3b96ecd018 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -267,6 +267,21 @@ void trace(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));
 void reopen_log(void);
 void close_log(void);
 
+#define log(...)							\
+	do {								\
+		int _saved_errno = errno;				\
+		char *s = talloc_asprintf(NULL, __VA_ARGS__);		\
+		if (s) {						\
+			trace("%s\n", s);				\
+			syslog(LOG_ERR, "%s\n",	s);			\
+			talloc_free(s);					\
+		} else {						\
+			trace("talloc failure during logging\n");	\
+			syslog(LOG_ERR, "talloc failure during logging\n"); \
+		}							\
+		errno = _saved_errno;					\
+	} while (0)
+
 extern int orig_argc;
 extern char **orig_argv;
 
-- 
2.35.3


