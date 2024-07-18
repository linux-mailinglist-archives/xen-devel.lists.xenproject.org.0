Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A048F9350E2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760593.1170487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJI-0007gv-6d; Thu, 18 Jul 2024 16:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760593.1170487; Thu, 18 Jul 2024 16:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJH-0007Y8-Vj; Thu, 18 Jul 2024 16:48:51 +0000
Received: by outflank-mailman (input) for mailman id 760593;
 Thu, 18 Jul 2024 16:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJG-0007PV-Ja
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:50 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b65fb3d-4525-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 18:48:49 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77cb7c106dso111662166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:49 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:47 -0700 (PDT)
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
X-Inumbo-ID: 9b65fb3d-4525-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321328; x=1721926128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HmR6V9jK0R+Cz/LsyATivEHCG9ldcpQ0RPlbouApH8=;
        b=MUZbOyrwIUoWfEkrkGIJ26qKi7ehHwW+c/q5FMoibEuvpwbYDnfd/q5f4Lm+WlGPuh
         IM+3qSGm5a/2Ne4DwZwO8mVucJpfmPK46V8oA8v8cU5LXOpQXKGgq2PR2Rf1urjYH05K
         M+on5Q8bslfbwLFebI88/Z9J3AFQ/m7BK4Di0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321328; x=1721926128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HmR6V9jK0R+Cz/LsyATivEHCG9ldcpQ0RPlbouApH8=;
        b=fRQsrOpa0nQZ1g2etcNQg7HLHO3lN6n0YQfnjROgUYb0Xt0P8IhPJQUMVYkZ91udR5
         eg4NosrYFp2kP8chfdIi2La4rw5k9nR5UH4ZiLz788sbav0IYD+uFtXzXjh/DaNBi2vy
         4O8X0XtpCrCX+5hvQkEN85Hq/CPvraWQlvWq+YiRzZpOd57nfB9Fbc9PpsnEaAZ/nrgP
         n8PMdcYHhSVQ3CE40UdZ30lMQA1H33MwU0YKgU496ak85owyTfwd0gHG855IIqvW89Ym
         fA2YL3OwNkxD89q1BSlXSLKVFALeTLQGBRiAeLHmIBvuXizInxDMa4coERyzac5mHgAE
         Czkg==
X-Gm-Message-State: AOJu0Yy1YUPO2g/nUJJ8G2QMVe/7dhaagqkAuN6au898nKKKd+JniQQ8
	ILYvJRNpGoaWrUpNPt6OhxkOowNaI8cC9i6kU6hKWKD8vRYOqXwjdWdsP79efYv8qgJpiYmnNJY
	d
X-Google-Smtp-Source: AGHT+IE6n8Rs0jIbLNVdEx1ZWBkGqND8epNKrtfnBbw0omr3FF26zxYxVCEy3PN/i+QatkEf27EzAA==
X-Received: by 2002:a17:906:504a:b0:a72:76c8:ef68 with SMTP id a640c23a62f3a-a7a013553cbmr358012066b.69.1721321328273;
        Thu, 18 Jul 2024 09:48:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/6] tools/libxs: Rework xs_talkv() to take xsd_sockmsg within the iovec
Date: Thu, 18 Jul 2024 17:48:38 +0100
Message-Id: <20240718164842.3650702-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We would like to writev() the whole outgoing message, which is hard given the
current need to prepend the locally-constructed xsd_sockmsg.

Instead, have the caller provide xsd_sockmsg in iovec[0].  This in turn drops
the t and type parameters from xs_talkv().

Note that xs_talkv() may alter the iovec structure.  This may happen when
writev() is really used under the covers, and it's preforable to having the
lower levels need to duplciate the iovec to edit it upon encountering a short
write.  xs_directory_part() is the only function impacted by this, and it's
easy to rearrange.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 187 ++++++++++++++++++++++++------------------
 1 file changed, 107 insertions(+), 80 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 81a790cfe60f..1b5a913a1594 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -561,25 +561,32 @@ static void *read_reply(
 	return body;
 }
 
-/* Send message to xs, get malloc'ed reply.  NULL and set errno on error. */
-static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
-		      enum xsd_sockmsg_type type,
-		      const struct iovec *iovec,
+/*
+ * Send message to xenstore, get malloc'ed reply.  NULL and set errno on error.
+ *
+ * @iovec describes the entire outgoing message, starting with the xsd_sockmsg
+ * header.  xs_talkv() calculates the outgoing message length, updating
+ * xsd_sockmsg in element 0.  xs_talkv() might edit the iovec structure in
+ * place (e.g. following short writes).
+ */
+static void *xs_talkv(struct xs_handle *h,
+		      struct iovec *iovec,
 		      unsigned int num_vecs,
 		      unsigned int *len)
 {
-	struct xsd_sockmsg msg;
+	struct xsd_sockmsg *msg = iovec[0].iov_base;
+	enum xsd_sockmsg_type reply_type;
 	void *ret = NULL;
 	int saved_errno;
 	unsigned int i, msg_len;
 	struct sigaction ignorepipe, oldact;
 
-	msg.tx_id = t;
-	msg.req_id = 0;
-	msg.type = type;
+	/* Element 0 must be xsd_sockmsg */
+	assert(num_vecs >= 1);
+	assert(iovec[0].iov_len == sizeof(*msg));
 
 	/* Calculate the payload length by summing iovec elements */
-	for (i = 0, msg_len = 0; i < num_vecs; i++) {
+	for (i = 1, msg_len = 0; i < num_vecs; i++) {
 		if ((iovec[i].iov_len > XENSTORE_PAYLOAD_MAX) ||
 		    ((msg_len += iovec[i].iov_len) > XENSTORE_PAYLOAD_MAX)) {
 			errno = E2BIG;
@@ -587,7 +594,7 @@ static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
 		}
 	}
 
-	msg.len = msg_len;
+	msg->len = msg_len;
 
 	ignorepipe.sa_handler = SIG_IGN;
 	sigemptyset(&ignorepipe.sa_mask);
@@ -596,28 +603,25 @@ static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
 
 	mutex_lock(&h->request_mutex);
 
-	if (!xs_write_all(h->fd, &msg, sizeof(msg)))
-		goto fail;
-
 	for (i = 0; i < num_vecs; i++)
 		if (!xs_write_all(h->fd, iovec[i].iov_base, iovec[i].iov_len))
 			goto fail;
 
-	ret = read_reply(h, &msg.type, len);
+	ret = read_reply(h, &reply_type, len);
 	if (!ret)
 		goto fail;
 
 	mutex_unlock(&h->request_mutex);
 
 	sigaction(SIGPIPE, &oldact, NULL);
-	if (msg.type == XS_ERROR) {
+	if (reply_type == XS_ERROR) {
 		saved_errno = get_error(ret);
 		free(ret);
 		errno = saved_errno;
 		return NULL;
 	}
 
-	if (msg.type != type) {
+	if (reply_type != msg->type) {
 		free(ret);
 		saved_errno = EBADF;
 		goto close_fd;
@@ -650,11 +654,15 @@ static void *xs_single(struct xs_handle *h, xs_transaction_t t,
 		       const char *string,
 		       unsigned int *len)
 {
-	struct iovec iovec;
+	struct xsd_sockmsg msg = { .type = type, .tx_id = t };
+	struct iovec iov[2];
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (void *)string;
+	iov[1].iov_len  = strlen(string) + 1;
 
-	iovec.iov_base = (void *)string;
-	iovec.iov_len = strlen(string) + 1;
-	return xs_talkv(h, t, type, &iovec, 1, len);
+	return xs_talkv(h, iov, ARRAY_SIZE(iov), len);
 }
 
 static bool xs_bool(char *reply)
@@ -691,21 +699,25 @@ static char **xs_directory_common(char *strings, unsigned int len,
 static char **xs_directory_part(struct xs_handle *h, xs_transaction_t t,
 				const char *path, unsigned int *num)
 {
+	struct xsd_sockmsg msg = { .type = XS_DIRECTORY_PART, .tx_id = t };
 	unsigned int off, result_len;
 	char gen[24], offstr[8];
-	struct iovec iovec[2];
+	struct iovec iov[3];
 	char *result = NULL, *strings = NULL;
 
 	memset(gen, 0, sizeof(gen));
-	iovec[0].iov_base = (void *)path;
-	iovec[0].iov_len = strlen(path) + 1;
 
 	for (off = 0;;) {
 		snprintf(offstr, sizeof(offstr), "%u", off);
-		iovec[1].iov_base = (void *)offstr;
-		iovec[1].iov_len = strlen(offstr) + 1;
-		result = xs_talkv(h, t, XS_DIRECTORY_PART, iovec, 2,
-				  &result_len);
+
+		iov[0].iov_base = &msg;
+		iov[0].iov_len  = sizeof(msg);
+		iov[1].iov_base = (void *)path;
+		iov[1].iov_len  = strlen(path) + 1;
+		iov[2].iov_base = (void *)offstr;
+		iov[2].iov_len  = strlen(offstr) + 1;
+
+		result = xs_talkv(h, iov, ARRAY_SIZE(iov), &result_len);
 
 		/* If XS_DIRECTORY_PART isn't supported return E2BIG. */
 		if (!result) {
@@ -774,15 +786,17 @@ void *xs_read(struct xs_handle *h, xs_transaction_t t,
 bool xs_write(struct xs_handle *h, xs_transaction_t t,
 	      const char *path, const void *data, unsigned int len)
 {
-	struct iovec iovec[2];
+	struct xsd_sockmsg msg = { .type = XS_WRITE, .tx_id = t };
+	struct iovec iov[3];
 
-	iovec[0].iov_base = (void *)path;
-	iovec[0].iov_len = strlen(path) + 1;
-	iovec[1].iov_base = (void *)data;
-	iovec[1].iov_len = len;
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (void *)path;
+	iov[1].iov_len  = strlen(path) + 1;
+	iov[2].iov_base = (void *)data;
+	iov[2].iov_len  = len;
 
-	return xs_bool(xs_talkv(h, t, XS_WRITE, iovec,
-				ARRAY_SIZE(iovec), NULL));
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
 /* Create a new directory.
@@ -846,34 +860,37 @@ bool xs_set_permissions(struct xs_handle *h,
 			struct xs_permissions *perms,
 			unsigned int num_perms)
 {
+	struct xsd_sockmsg msg = { .type = XS_SET_PERMS, .tx_id = t };
 	unsigned int i;
-	struct iovec iov[1+num_perms];
+	struct iovec iov[2 + num_perms];
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (void *)path;
+	iov[1].iov_len  = strlen(path) + 1;
 
-	iov[0].iov_base = (void *)path;
-	iov[0].iov_len = strlen(path) + 1;
-	
 	for (i = 0; i < num_perms; i++) {
 		char buffer[MAX_STRLEN(unsigned int)+1];
 
 		if (!xenstore_perm_to_string(&perms[i], buffer, sizeof(buffer)))
 			goto unwind;
 
-		iov[i+1].iov_base = strdup(buffer);
-		iov[i+1].iov_len = strlen(buffer) + 1;
+		iov[i + 2].iov_base = strdup(buffer);
+		iov[i + 2].iov_len  = strlen(buffer) + 1;
 		if (!iov[i+1].iov_base)
 			goto unwind;
 	}
 
-	if (!xs_bool(xs_talkv(h, t, XS_SET_PERMS, iov, 1+num_perms, NULL)))
+	if (!xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL)))
 		goto unwind;
 	for (i = 0; i < num_perms; i++)
-		free(iov[i+1].iov_base);
+		free(iov[i + 2].iov_base);
 	return true;
 
 unwind:
 	num_perms = i;
 	for (i = 0; i < num_perms; i++)
-		free_no_errno(iov[i+1].iov_base);
+		free_no_errno(iov[i + 2].iov_base);
 	return false;
 }
 
@@ -890,7 +907,8 @@ bool xs_restrict(struct xs_handle *h, unsigned domid)
  */
 bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 {
-	struct iovec iov[2];
+	struct xsd_sockmsg msg = { .type = XS_WATCH };
+	struct iovec iov[3];
 
 #ifdef USE_PTHREAD
 #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
@@ -948,13 +966,14 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 	mutex_unlock(&h->request_mutex);
 #endif
 
-	iov[0].iov_base = (void *)path;
-	iov[0].iov_len = strlen(path) + 1;
-	iov[1].iov_base = (void *)token;
-	iov[1].iov_len = strlen(token) + 1;
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (void *)path;
+	iov[1].iov_len  = strlen(path) + 1;
+	iov[2].iov_base = (void *)token;
+	iov[2].iov_len  = strlen(token) + 1;
 
-	return xs_bool(xs_talkv(h, XBT_NULL, XS_WATCH, iov,
-				ARRAY_SIZE(iov), NULL));
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
 
@@ -1067,20 +1086,22 @@ char **xs_read_watch(struct xs_handle *h, unsigned int *num)
  */
 bool xs_unwatch(struct xs_handle *h, const char *path, const char *token)
 {
-	struct iovec iov[2];
+	struct xsd_sockmsg sockmsg = { .type = XS_UNWATCH };
+	struct iovec iov[3];
 	struct xs_stored_msg *msg, *tmsg;
 	bool res;
 	char *s, *p;
 	unsigned int i;
 	char *l_token, *l_path;
 
-	iov[0].iov_base = (char *)path;
-	iov[0].iov_len = strlen(path) + 1;
-	iov[1].iov_base = (char *)token;
-	iov[1].iov_len = strlen(token) + 1;
+	iov[0].iov_base = &sockmsg;
+	iov[0].iov_len  = sizeof(sockmsg);
+	iov[1].iov_base = (char *)path;
+	iov[1].iov_len  = strlen(path) + 1;
+	iov[2].iov_base = (char *)token;
+	iov[2].iov_len  = strlen(token) + 1;
 
-	res = xs_bool(xs_talkv(h, XBT_NULL, XS_UNWATCH, iov,
-			       ARRAY_SIZE(iov), NULL));
+	res = xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 
 	if (!h->unwatch_filter) /* Don't filter the watch list */
 		return res;
@@ -1173,43 +1194,47 @@ bool xs_introduce_domain(struct xs_handle *h,
 			 unsigned int domid, unsigned long mfn,
 			 unsigned int eventchn)
 {
+	struct xsd_sockmsg msg = { .type = XS_INTRODUCE };
 	char domid_str[MAX_STRLEN(domid)];
 	char mfn_str[MAX_STRLEN(mfn)];
 	char eventchn_str[MAX_STRLEN(eventchn)];
-	struct iovec iov[3];
+	struct iovec iov[4];
 
 	snprintf(domid_str, sizeof(domid_str), "%u", domid);
 	snprintf(mfn_str, sizeof(mfn_str), "%lu", mfn);
 	snprintf(eventchn_str, sizeof(eventchn_str), "%u", eventchn);
 
-	iov[0].iov_base = domid_str;
-	iov[0].iov_len = strlen(domid_str) + 1;
-	iov[1].iov_base = mfn_str;
-	iov[1].iov_len = strlen(mfn_str) + 1;
-	iov[2].iov_base = eventchn_str;
-	iov[2].iov_len = strlen(eventchn_str) + 1;
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = domid_str;
+	iov[1].iov_len  = strlen(domid_str) + 1;
+	iov[2].iov_base = mfn_str;
+	iov[2].iov_len  = strlen(mfn_str) + 1;
+	iov[3].iov_base = eventchn_str;
+	iov[3].iov_len  = strlen(eventchn_str) + 1;
 
-	return xs_bool(xs_talkv(h, XBT_NULL, XS_INTRODUCE, iov,
-				ARRAY_SIZE(iov), NULL));
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
 bool xs_set_target(struct xs_handle *h,
 			 unsigned int domid, unsigned int target)
 {
+	struct xsd_sockmsg msg = { .type = XS_SET_TARGET };
 	char domid_str[MAX_STRLEN(domid)];
 	char target_str[MAX_STRLEN(target)];
-	struct iovec iov[2];
+	struct iovec iov[3];
 
 	snprintf(domid_str, sizeof(domid_str), "%u", domid);
 	snprintf(target_str, sizeof(target_str), "%u", target);
 
-	iov[0].iov_base = domid_str;
-	iov[0].iov_len = strlen(domid_str) + 1;
-	iov[1].iov_base = target_str;
-	iov[1].iov_len = strlen(target_str) + 1;
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = domid_str;
+	iov[1].iov_len  = strlen(domid_str) + 1;
+	iov[2].iov_base = target_str;
+	iov[2].iov_len  = strlen(target_str) + 1;
 
-	return xs_bool(xs_talkv(h, XBT_NULL, XS_SET_TARGET, iov,
-				ARRAY_SIZE(iov), NULL));
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
 static void * single_with_domid(struct xs_handle *h,
@@ -1305,15 +1330,17 @@ int xs_suspend_evtchn_port(int domid)
 char *xs_control_command(struct xs_handle *h, const char *cmd,
 			 void *data, unsigned int len)
 {
-	struct iovec iov[2];
+	struct xsd_sockmsg msg = { .type = XS_CONTROL };
+	struct iovec iov[3];
 
-	iov[0].iov_base = (void *)cmd;
-	iov[0].iov_len = strlen(cmd) + 1;
-	iov[1].iov_base = data;
-	iov[1].iov_len = len;
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (void *)cmd;
+	iov[1].iov_len  = strlen(cmd) + 1;
+	iov[2].iov_base = data;
+	iov[2].iov_len  = len;
 
-	return xs_talkv(h, XBT_NULL, XS_CONTROL, iov,
-			ARRAY_SIZE(iov), NULL);
+	return xs_talkv(h, iov, ARRAY_SIZE(iov), NULL);
 }
 
 char *xs_debug_command(struct xs_handle *h, const char *cmd,
-- 
2.39.2


