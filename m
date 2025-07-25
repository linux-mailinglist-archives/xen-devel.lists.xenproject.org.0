Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B0B11F42
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057794.1425515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIL0-0007WX-MM; Fri, 25 Jul 2025 13:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057794.1425515; Fri, 25 Jul 2025 13:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIL0-0007Uk-IB; Fri, 25 Jul 2025 13:19:50 +0000
Received: by outflank-mailman (input) for mailman id 1057794;
 Fri, 25 Jul 2025 13:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufIKz-0007Aq-RK
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:19:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09d9fe66-695a-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 15:19:48 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3F232128E;
 Fri, 25 Jul 2025 13:19:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF2C6134E8;
 Fri, 25 Jul 2025 13:19:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W2URLXOEg2jfPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:19:47 +0000
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
X-Inumbo-ID: 09d9fe66-695a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb7PraGRfp4jOfNUeV5ucZ1QqsNlsA8+/YfJexfVTTw=;
	b=gi6fg0Gcvd/rKw5jdaGGmJTR7cBBEFuVTV7iJP5SuRA+tiBLJ9Tqca55JiVLc/1R9kWgS+
	le/Fwjszc6V+Z+njDdHkuqUN29AAPCKTC0RHI443BnN+7qmBYdMimKbTpR4YGjpyFEun7L
	CwfS1+w359YaJTf/So+T3HVGElaGNz4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb7PraGRfp4jOfNUeV5ucZ1QqsNlsA8+/YfJexfVTTw=;
	b=gi6fg0Gcvd/rKw5jdaGGmJTR7cBBEFuVTV7iJP5SuRA+tiBLJ9Tqca55JiVLc/1R9kWgS+
	le/Fwjszc6V+Z+njDdHkuqUN29AAPCKTC0RHI443BnN+7qmBYdMimKbTpR4YGjpyFEun7L
	CwfS1+w359YaJTf/So+T3HVGElaGNz4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 3/7] tools/xenstored: add missing migration record definitions
Date: Fri, 25 Jul 2025 15:19:24 +0200
Message-ID: <20250725131928.19286-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add all the missing migration record structures and defines to the
xenstore_state.h header file.

Update the version of the migration stream to "2". In order to allow
receiving version 1 streams, change the version check of the header
to reject only streams with a version higher than the current known
one.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/control.c        |  2 +-
 tools/xenstored/lu.c             |  2 +-
 tools/xenstored/xenstore_state.h | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index 953c01b735..2611a6fade 100644
--- a/tools/xenstored/control.c
+++ b/tools/xenstored/control.c
@@ -298,7 +298,7 @@ static struct cmd_s cmds[] = {
 	 */
 	{ "live-update", do_control_lu,
 		"[-c <cmdline>] [-F] [-t <timeout>] [-v <version>] <file>\n"
-		"    Default timeout is 60 seconds, default version is 1.", 7 },
+		"    Default timeout is 60 seconds, default version is 2.", 7 },
 #endif
 	{ "logfile", do_control_logfile, "<file>" },
 	{ "memreport", do_control_memreport, "[<file>]" },
diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index 330820a8a2..2c6adecb56 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -136,7 +136,7 @@ void lu_read_state(void)
 
 	pre = state.buf;
 	if (memcmp(pre->ident, XS_STATE_IDENT, sizeof(pre->ident)) ||
-	    pre->version != htobe32(XS_STATE_VERSION) ||
+	    !pre->version || be32toh(pre->version) > XS_STATE_VERSION ||
 	    pre->flags != XS_STATE_FLAGS)
 		barf("Unknown record identifier");
 	for (head = state.buf + sizeof(*pre);
diff --git a/tools/xenstored/xenstore_state.h b/tools/xenstored/xenstore_state.h
index bad966caf4..3fd97d60d8 100644
--- a/tools/xenstored/xenstore_state.h
+++ b/tools/xenstored/xenstore_state.h
@@ -27,8 +27,10 @@
 #ifndef htobe32
 #if __BYTE_ORDER == __LITTLE_ENDIAN
 #define htobe32(x) __builtin_bswap32(x)
+#define be32toh(x) __builtin_bswap32(x)
 #else
 #define htobe32(x) (x)
+#define be32toh(x) (x)
 #endif
 #endif
 
@@ -36,7 +38,7 @@ struct xs_state_preamble {
     char ident[8];
 #define XS_STATE_IDENT    "xenstore"  /* To be used without the NUL byte. */
     uint32_t version;                 /* Version in big endian format. */
-#define XS_STATE_VERSION  0x00000001
+#define XS_STATE_VERSION  0x00000002
     uint32_t flags;                   /* Endianess. */
 #if __BYTE_ORDER == __LITTLE_ENDIAN
 #define XS_STATE_FLAGS    0x00000000  /* Little endian. */
@@ -59,6 +61,9 @@ struct xs_state_record_header {
 #define XS_STATE_TYPE_WATCH      0x00000003
 #define XS_STATE_TYPE_TA         0x00000004
 #define XS_STATE_TYPE_NODE       0x00000005
+#define XS_STATE_TYPE_GLB_QUOTA  0x00000006
+#define XS_STATE_TYPE_DOMAIN     0x00000007
+#define XS_STATE_TYPE_WATCH_EXT  0x00000008
     uint32_t length;         /* Length of record in bytes. */
 };
 
@@ -98,6 +103,15 @@ struct xs_state_watch {
     uint8_t data[];         /* Path bytes, token bytes, 0-7 pad bytes. */
 };
 
+struct xs_state_watch_ext {
+    uint32_t conn_id;       /* Connection this watch is associated with. */
+    uint16_t path_length;   /* Number of bytes of path watched (incl. 0). */
+    uint16_t token_length;  /* Number of bytes of watch token (incl. 0). */
+    uint16_t depth;         /* Number of directory levels below watched path */
+                            /* to consider for a match. */
+    uint8_t data[];         /* Path bytes, token bytes, 0-7 pad bytes. */
+};
+
 /* Transaction: */
 struct xs_state_transaction {
     uint32_t conn_id;       /* Connection this TA is associated with. */
@@ -129,4 +143,19 @@ struct xs_state_node {
     struct xs_state_node_perm perms[];
     /* Path and data follows, plus 0-7 pad bytes. */
 };
+
+/* Global quota data: */
+struct xs_state_glb_quota {
+    uint16_t n_dom_quota;   /* Number of quota values applying to domains. */
+    uint16_t n_glob_quota;  /* Number of quota values applying globally only. */
+    uint32_t quota_val[];   /* Array of quota values (domain ones first). */
+};
+
+/* Domain data: */
+struct xs_state_domain {
+    uint16_t domain_id;     /* Domain-id identifying the domain. */
+    uint16_t n_quota;       /* Number of quota values. */
+    uint32_t features;      /* Server features available to the domain. */
+    uint32_t quota_val[];   /* Array of quota values. */
+};
 #endif /* XENSTORE_STATE_H */
-- 
2.43.0


