Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AA67182C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480319.744682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55g-0002zn-Pr; Wed, 18 Jan 2023 09:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480319.744682; Wed, 18 Jan 2023 09:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55g-0002wS-Mb; Wed, 18 Jan 2023 09:50:44 +0000
Received: by outflank-mailman (input) for mailman id 480319;
 Wed, 18 Jan 2023 09:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI55e-0001v4-LV
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:50:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9205c981-9715-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 10:50:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB1E1340AE;
 Wed, 18 Jan 2023 09:50:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89FB3139D2;
 Wed, 18 Jan 2023 09:50:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BPUoIPHAx2NqQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:50:41 +0000
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
X-Inumbo-ID: 9205c981-9715-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMY3vUVgw8qRRZJd+a0HyuTGexwRF66hbh+Hzn4a2aU=;
	b=NXR4GPBT/IDitpaZDDryrmiHoJRTV2X2AQ7BI6XajjqSMlB3CWatyJAYpMT8/n9jmVHKRf
	rNKf3SUKoQNUW1ZPEb1NPld5VGsyDukffxXwyf4mPif149q3AEcmE2+A6loJaAQWuwTHUF
	SDpbEsZ7PecSsO7TdczkSIJQdaPkCR0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 04/17] tools/xenstore: make log macro globally available
Date: Wed, 18 Jan 2023 10:50:03 +0100
Message-Id: <20230118095016.13091-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the definition of the log() macro to xenstored_core.h in order
to make it usable from other source files, too.

While at it preserve errno from being modified.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 14 --------------
 tools/xenstore/xenstored_core.h | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 1650821922..d30f35e642 100644
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
index 37006d508d..89055cbb21 100644
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


