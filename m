Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNI0K0XBs2lQagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294527EF60
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253351.1549642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFl-0004Jo-C7; Fri, 13 Mar 2026 07:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253351.1549642; Fri, 13 Mar 2026 07:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFl-0004GS-8p; Fri, 13 Mar 2026 07:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1253351;
 Fri, 13 Mar 2026 07:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFj-0003TG-DM
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb1de7e2-1eb0-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:48:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0BB825CEF2;
 Fri, 13 Mar 2026 07:48:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEF51403F6;
 Fri, 13 Mar 2026 07:48:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id x6BCNTnBs2m1GAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:09 +0000
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
X-Inumbo-ID: fb1de7e2-1eb0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOMNch7LDMhlMuA7/SnfhE7VtklPTC8Mp2JthrXp6FM=;
	b=mv1paiadsjWVfW8yV3KF2x9/U5KPiDFrjBM2mhfK5Q4HkuKa1iyPzd/jP/OfeK3S7RTIHN
	ukbOc+khzCJbf4bjLfGAPF1RU+38nrQ/DEQ3OlxjLMScnnRH2BACo660X1Ro5qIhc+ShkW
	zF2PEdbxVZbnAqRp3rGbN2H1t71x97M=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOMNch7LDMhlMuA7/SnfhE7VtklPTC8Mp2JthrXp6FM=;
	b=mv1paiadsjWVfW8yV3KF2x9/U5KPiDFrjBM2mhfK5Q4HkuKa1iyPzd/jP/OfeK3S7RTIHN
	ukbOc+khzCJbf4bjLfGAPF1RU+38nrQ/DEQ3OlxjLMScnnRH2BACo660X1Ro5qIhc+ShkW
	zF2PEdbxVZbnAqRp3rGbN2H1t71x97M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 3/8] tools/libs/store: add support to use watches with a depth parameter
Date: Fri, 13 Mar 2026 08:47:46 +0100
Message-ID: <20260313074751.2904215-4-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6294527EF60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new xs_watch_depth() function to libxenstore allowing to limit
the scope of a Xenstore watch. It can be used only in case Xenstore is
supporting the XENSTORE_SERVER_FEATURE_WATCHDEPTH feature.

For convenience add a xs_watch_try_depth() wrapper, which will call
xs_watch_depth() if supported and xs_watch() otherwise.

Cache the supported features of Xenstore in order not having to get
them from Xenstore for each call of one of the new functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xl.cfg.5.pod.in         |   6 ++
 tools/include/xenstore.h         |  16 +++++
 tools/libs/store/libxenstore.map |   2 +
 tools/libs/store/xs.c            | 116 ++++++++++++++++++++++++++-----
 xen/include/public/io/xs_wire.h  |   2 +
 5 files changed, 123 insertions(+), 19 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3aac0bc4fb..2f77016ecf 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -740,6 +740,12 @@ Xenstore is capable to reconnect to a guest.
 Xenstore will present an error value in case it disconnects due to an error
 condition.
 
+=item B<0x00000004>
+
+Xenstore supports to set watches with a limited depth (depth 0 matches
+only the watched node, depth 1 matches the node and its direct children,
+etc.).
+
 =back
 
 The features supported by the running Xenstore instance can be retrieved
diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index 6b661e5895..8a6afd97f5 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -177,6 +177,22 @@ bool xs_set_permissions(struct xs_handle *h, xs_transaction_t t,
  */
 bool xs_watch(struct xs_handle *h, const char *path, const char *token);
 
+/* Same as xs_watch(), but with limiting the matching for modified
+ * children to a specified depth (depth 0 only matches the node itself,
+ * depth 1 will additionally match direct children of the node, etc.).
+ * Only supported if the XENSTORE_SERVER_FEATURE_WATCHDEPTH (4) is set
+ * in the returned features of xs_get_features_supported().
+ */
+bool xs_watch_depth(struct xs_handle *h, const char *path, const char *token,
+		    unsigned int depth);
+
+/* If supported, same as xs_watch_depth(), use xs_watch() otherwise.
+ * As a result watches might trigger for nodes below the watched path, too.
+ * Not to be used for special watches!
+ */
+bool xs_watch_try_depth(struct xs_handle *h, const char *path,
+			const char *token, unsigned int depth);
+
 /* Return the FD to poll on to see if a watch has fired. */
 int xs_fileno(struct xs_handle *h);
 
diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
index a08ddd549f..7067068998 100644
--- a/tools/libs/store/libxenstore.map
+++ b/tools/libs/store/libxenstore.map
@@ -52,4 +52,6 @@ VERS_4.2 {
 		xs_set_global_quota;
 		xs_get_domain_quota;
 		xs_set_domain_quota;
+		xs_watch_depth;
+		xs_watch_try_depth;
 } VERS_4.1;
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index dda37f7526..0bea464a33 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -984,37 +984,29 @@ bool xs_restrict(struct xs_handle *h, unsigned domid)
 	return false;
 }
 
-/* Watch a node for changes (poll on fd to detect, or call read_watch()).
- * When the node (or any child) changes, fd will become readable.
- * Token is returned when watch is read, to allow matching.
- * Returns false on failure.
- */
-bool xs_watch(struct xs_handle *h, const char *path, const char *token)
+static bool xs_watch_helper(struct xs_handle *h)
 {
-	struct xsd_sockmsg msg = { .type = XS_WATCH };
-	struct iovec iov[3];
-
 #ifdef USE_PTHREAD
+	sigset_t set, old_set;
+	pthread_attr_t attr;
+	static size_t stack_size;
+#ifdef USE_DLSYM
+	size_t (*getsz)(pthread_attr_t *attr);
+#endif
+
 #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
 /* NetBSD doesn't have PTHREAD_STACK_MIN. */
 #ifndef PTHREAD_STACK_MIN
 # define PTHREAD_STACK_MIN 0
 #endif
 
-#define READ_THREAD_STACKSIZE 					\
-	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
+#define READ_THREAD_STACKSIZE					\
+	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?	\
 	 PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
 
 	/* We dynamically create a reader thread on demand. */
 	mutex_lock(&h->request_mutex);
 	if (!h->read_thr_exists) {
-		sigset_t set, old_set;
-		pthread_attr_t attr;
-		static size_t stack_size;
-#ifdef USE_DLSYM
-		size_t (*getsz)(pthread_attr_t *attr);
-#endif
-
 		if (pthread_attr_init(&attr) != 0) {
 			mutex_unlock(&h->request_mutex);
 			return false;
@@ -1050,16 +1042,89 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 	mutex_unlock(&h->request_mutex);
 #endif
 
+	return true;
+}
+
+/* Watch a node for changes (poll on fd to detect, or call read_watch()).
+ * When the node (or any child) changes, fd will become readable.
+ * Token is returned when watch is read, to allow matching.
+ * Returns false on failure.
+ */
+bool xs_watch(struct xs_handle *h, const char *path, const char *token)
+{
+	struct xsd_sockmsg msg = { .type = XS_WATCH };
+	struct iovec iov[3];
+
+	if (!xs_watch_helper(h))
+		return false;
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (void *)path;
+	iov[1].iov_len  = strlen(path) + 1;
+	iov[2].iov_base = (void *)token;
+	iov[2].iov_len  = strlen(token) + 1;
+
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
+}
+
+/* Same as xs_watch(), but with limiting the matching for modified
+ * children to a specified depth (depth 0 only matches the node itself,
+ * depth 1 will additionally match direct children of the node, etc.).
+ * Only supported if the XENSTORE_SERVER_FEATURE_WATCHDEPTH (4) is set
+ * in the returned features of xs_get_features_supported().
+ */
+bool xs_watch_depth(struct xs_handle *h, const char *path, const char *token,
+		    unsigned int depth)
+{
+	struct xsd_sockmsg msg = { .type = XS_WATCH };
+	struct iovec iov[4];
+	char depthstr[MAX_STRLEN(depth)];
+	static bool depth_supported;
+
+	if (!xs_watch_helper(h))
+		return false;
+
+	if (!depth_supported) {
+		unsigned int features;
+
+		if (!xs_get_features_supported(h, &features))
+			return false;
+		if (!(features & XENSTORE_SERVER_FEATURE_WATCHDEPTH))
+			return false;
+		depth_supported = true;
+	}
+
+	snprintf(depthstr, sizeof(depthstr), "%u", depth);
+
 	iov[0].iov_base = &msg;
 	iov[0].iov_len  = sizeof(msg);
 	iov[1].iov_base = (void *)path;
 	iov[1].iov_len  = strlen(path) + 1;
 	iov[2].iov_base = (void *)token;
 	iov[2].iov_len  = strlen(token) + 1;
+	iov[3].iov_base = depthstr;
+	iov[3].iov_len = strlen(depthstr) + 1;
 
 	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
+/* If supported, same as xs_watch_depth(), use xs_watch() otherwise.
+ * As a result watches might trigger for nodes below the watched path, too.
+ * Not to be used for special watches!
+ */
+bool xs_watch_try_depth(struct xs_handle *h, const char *path,
+			const char *token, unsigned int depth)
+{
+	unsigned int features;
+
+	if (xs_get_features_supported(h, &features) &&
+	    (features & XENSTORE_SERVER_FEATURE_WATCHDEPTH) &&
+	    xs_watch_depth(h, path, token, depth))
+		return true;
+
+	return xs_watch(h, path, token);
+}
 
 /* Clear the pipe token if there are no more pending watchs.
  * We suppose the watch_mutex is already taken.
@@ -1420,13 +1485,26 @@ static bool xs_uint(char *reply, unsigned int *uintval)
 
 bool xs_get_features_supported(struct xs_handle *h, unsigned int *features)
 {
+	static unsigned int own_features = 0;
+	static bool features_valid = false;
 	struct xsd_sockmsg msg = { .type = XS_GET_FEATURE };
 	struct iovec iov[1];
 
+	if (features_valid) {
+		*features = own_features;
+		return true;
+	}
+
 	iov[0].iov_base = &msg;
 	iov[0].iov_len  = sizeof(msg);
 
-	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), features);
+	if (!xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), &own_features))
+		return false;
+
+	features_valid = true;
+	*features = own_features;
+
+	return true;
 }
 
 bool xs_get_features_domain(struct xs_handle *h, unsigned int domid,
diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index d2e2b8b9eb..2e763bc877 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -124,6 +124,8 @@ struct xenstore_domain_interface {
 #define XENSTORE_SERVER_FEATURE_RECONNECTION 1
 /* The presence of the "error" field in the ring page */
 #define XENSTORE_SERVER_FEATURE_ERROR        2
+/* The XS_WATCH command can be used with a <depth> parameter */
+#define XENSTORE_SERVER_FEATURE_WATCHDEPTH   4
 
 /* Valid values for the connection field */
 #define XENSTORE_CONNECTED 0 /* the steady-state */
-- 
2.53.0


