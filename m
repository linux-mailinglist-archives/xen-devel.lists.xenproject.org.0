Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJk3D3oq52nx4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7133437C8F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288427.1568721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kh-0003mQ-35; Tue, 21 Apr 2026 07:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288427.1568721; Tue, 21 Apr 2026 07:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kg-0003ko-VM; Tue, 21 Apr 2026 07:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1288427;
 Tue, 21 Apr 2026 07:42:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5kf-0003gn-Hj
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5ke-00G0bm-UF
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a65-bab6-0a2a0a5309dd-0a2a45019d0a-16
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:32 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a68-c1f2-0a2a45010019-c387df83e64e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:32 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB1465BCF7;
 Tue, 21 Apr 2026 07:42:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC07E593AF;
 Tue, 21 Apr 2026 07:42:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id APu2LGYq52kkNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:30 +0000
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
	t=1776757351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9/LjZwHaY/WSjnhzdGz7a4hIoUeCs2d8a5kulnUVaQ=;
	b=MT5Vwtx8VnnpCB53Z/CnAwrgEqwRk9i24LthB00dDjMTWQ9SNq2bgjdjm7feZnNRAiHVVt
	RK3tAGFDWBFkTvzsITlv61UlxJ/KA0wDdSpOoHxer31hi+xjMTku84rrtA85d8sWnk7Vu+
	vYnM8nNWHTMhMES9JoDJPnh+x3RKOpc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9/LjZwHaY/WSjnhzdGz7a4hIoUeCs2d8a5kulnUVaQ=;
	b=JrZj0EOd5dpSIXt79POy8P1Iy1+QvB0uZZkMM4VevCpvEjKbZwX0Gfd4EQb7sXXT+T0tIQ
	1qkcc8nD/q4wfLHp3nSofVLaJ/YMpy3ptV6b/N7LJIklEVK+tArHQVfak7nCux7BgUh3Mx
	7TkN66RnfXeMpAJx09dWl5kOUhOnoQo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 3/9] tools/libs/store: add support to use watches with a depth parameter
Date: Tue, 21 Apr 2026 09:42:05 +0200
Message-ID: <20260421074211.308473-4-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-d62444/1776757352-B6A61FF4-E1024CFE/0/0
X-purgate-type: clean
X-purgate-size: 8639
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E7133437C8F
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
V2:
- undo unmotivated change of variable scope (Jason Andryuk)
---
 docs/man/xl.cfg.5.pod.in         |   6 ++
 tools/include/xenstore.h         |  16 +++++
 tools/libs/store/libxenstore.map |   2 +
 tools/libs/store/xs.c            | 102 +++++++++++++++++++++++++++----
 xen/include/public/io/xs_wire.h  |   2 +
 5 files changed, 116 insertions(+), 12 deletions(-)

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
index bf6d767a22..9422ed5657 100644
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
index 06462445e0..cb3508a86a 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -984,16 +984,8 @@ bool xs_restrict(struct xs_handle *h, unsigned domid)
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
 #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
 /* NetBSD doesn't have PTHREAD_STACK_MIN. */
@@ -1001,8 +993,8 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 # define PTHREAD_STACK_MIN 0
 #endif
 
-#define READ_THREAD_STACKSIZE 					\
-	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
+#define READ_THREAD_STACKSIZE					\
+	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?	\
 	 PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
 
 	/* We dynamically create a reader thread on demand. */
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


