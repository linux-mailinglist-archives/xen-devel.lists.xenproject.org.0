Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A297EE91
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802197.1212391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslOK-0007Lk-BD; Mon, 23 Sep 2024 15:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802197.1212391; Mon, 23 Sep 2024 15:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslOK-0007JP-8O; Mon, 23 Sep 2024 15:54:24 +0000
Received: by outflank-mailman (input) for mailman id 802197;
 Mon, 23 Sep 2024 15:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sslOI-000730-Qk
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:54:22 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f56706-79c4-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:54:21 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53568ffc525so5123234e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:54:21 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613315e3sm1240926866b.209.2024.09.23.08.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 08:54:19 -0700 (PDT)
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
X-Inumbo-ID: 18f56706-79c4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727106860; x=1727711660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYwJGPHlrRxYAkIwiT1rq7m0wmSkPz2GGZv9Yo1GCoQ=;
        b=ldyx5mIrzb2djfX02qS8Vt3kMyMedjmgxh3gH6YW7wpd0bd19rLrxgarojN7YaCfiV
         fqo31y5T29MurrgAYlV1EAG9KUxOeOrYwrdWyyoQJNAns71A+ePZavAMuWU/6ivUM87g
         7Nsv/3bGTVsF+hpUODsEH6BHnmB34XlkAgS8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106860; x=1727711660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYwJGPHlrRxYAkIwiT1rq7m0wmSkPz2GGZv9Yo1GCoQ=;
        b=KFu6Gc3htI9qHtjPPIlDsNnHv586Qkn6aEjjUt6XPLNFwNLrGfQuP3R1QiKen0TdQg
         SH33d93rkU31MqKAEEeIOvI2DrQzTt5+7t2FwVj9QP7KoS4KzFzgyUggdHnpue310Vhh
         fI+6KaBhRbhVMwqte8FUIkrqQYH5JzxdDS//WpoMdFu6bjydz4m083egjomVl+9LxKeo
         kHC4Mf/s7QGlu7t0EgXkzrzW++OsX3CTe24LK3dU5gvhxsGeLulTVGDj+FZu4gA8JnUb
         BwJE/HVDk4ZOqUoqEm2dZjiSZ0X7++g3+Rt9pOly4WhMm3WMBc3uLOWIkkZTG4oWMVUY
         MIaw==
X-Gm-Message-State: AOJu0YzLIVc7+Zey0Y8yMrNzvndff1Y9f22/0ZQeZUD6WfP83JlMU5Vz
	p6SjDK97jSVT0BueZoHkE7vS7W7D4+mSI00NwziHV/5oPGI02TjTQfaGMjRNP7J825DmfaczzoM
	ULGZxIg==
X-Google-Smtp-Source: AGHT+IE13+2HF8paXNonRdWJY1840DGkVLW2sKKXETqMBn++YnaxMcz4ttxuni3k3jDsqPnGeY5dIQ==
X-Received: by 2002:a05:6512:ba4:b0:52e:9f17:841a with SMTP id 2adb3069b0e04-536ac2d051fmr6445237e87.6.1727106860059;
        Mon, 23 Sep 2024 08:54:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxs: Style consistency improvements
Date: Mon, 23 Sep 2024 16:54:16 +0100
Message-Id: <20240923155416.101538-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is mostly Linux sytle.  Make the file self-consistent.  Drop trailing
whitespace, and use tabs consistently.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>

From the SIGPIPE work, but not submitted at the time.
---
 tools/libs/store/xs.c | 74 ++++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 5d9c7151e8bb..e22f99b59f61 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1,4 +1,4 @@
-/* 
+/*
     Xen Store Daemon interface providing simple tree-like database.
     Copyright (C) 2005 Rusty Russell IBM Corporation
 
@@ -164,8 +164,10 @@ static void *read_thread(void *arg);
 
 static int read_message(struct xs_handle *h, int nonblocking);
 
-static bool setnonblock(int fd, int nonblock) {
+static bool setnonblock(int fd, int nonblock)
+{
 	int flags = fcntl(fd, F_GETFL);
+
 	if (flags == -1)
 		return false;
 
@@ -236,7 +238,7 @@ static int get_socket(const char *connect_to)
 		goto error;
 
 	addr.sun_family = AF_UNIX;
-	if(strlen(connect_to) >= sizeof(addr.sun_path)) {
+	if (strlen(connect_to) >= sizeof(addr.sun_path)) {
 		errno = EINVAL;
 		goto error;
 	}
@@ -276,9 +278,11 @@ static int get_dev(const char *connect_to)
 	return -1;
 }
 
-static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid) {
-    struct xs_handle *h = CONTAINER_OF(ah, *h, tc_ah);
-    return xentoolcore__restrict_by_dup2_null(h->fd);
+static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid)
+{
+	struct xs_handle *h = CONTAINER_OF(ah, *h, tc_ah);
+
+	return xentoolcore__restrict_by_dup2_null(h->fd);
 }
 
 static struct xs_handle *get_handle(const char *connect_to)
@@ -362,8 +366,10 @@ struct xs_handle *xs_domain_open(void)
 static const char *xs_domain_dev(void)
 {
 	char *s = getenv("XENSTORED_PATH");
+
 	if (s)
 		return s;
+
 #if defined(__RUMPUSER_XEN__) || defined(__RUMPRUN__)
 	return "/dev/xen/xenbus";
 #elif defined(__linux__)
@@ -394,7 +400,8 @@ struct xs_handle *xs_open(unsigned long flags)
 	return xsh;
 }
 
-static void close_free_msgs(struct xs_handle *h) {
+static void close_free_msgs(struct xs_handle *h)
+{
 	struct xs_stored_msg *msg, *tmsg;
 
 	XEN_TAILQ_FOREACH_SAFE(msg, &h->reply_list, list, tmsg) {
@@ -408,7 +415,8 @@ static void close_free_msgs(struct xs_handle *h) {
 	}
 }
 
-static void close_fds_free(struct xs_handle *h) {
+static void close_fds_free(struct xs_handle *h)
+{
 	if (h->watch_pipe[0] != -1) {
 		close(h->watch_pipe[0]);
 		close(h->watch_pipe[1]);
@@ -416,7 +424,7 @@ static void close_fds_free(struct xs_handle *h) {
 
 	xentoolcore__deregister_active_handle(&h->tc_ah);
         close(h->fd);
-        
+
 	free(h);
 }
 
@@ -448,7 +456,7 @@ void xs_daemon_close(struct xs_handle *h)
         close_fds_free(h);
 }
 
-void xs_close(struct xs_handle* xsh)
+void xs_close(struct xs_handle *xsh)
 {
 	if (xsh)
 		xs_daemon_close(xsh);
@@ -995,7 +1003,7 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 
 #define READ_THREAD_STACKSIZE 					\
 	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
-	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
+	 PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
 
 	/* We dynamically create a reader thread on demand. */
 	mutex_lock(&h->request_mutex);
@@ -1258,7 +1266,7 @@ bool xs_transaction_end(struct xs_handle *h, xs_transaction_t t,
 		strcpy(abortstr, "F");
 	else
 		strcpy(abortstr, "T");
-	
+
 	return xs_bool(xs_single(h, t, XS_TRANSACTION_END, abortstr, NULL));
 }
 
@@ -1293,7 +1301,7 @@ bool xs_introduce_domain(struct xs_handle *h,
 }
 
 bool xs_set_target(struct xs_handle *h,
-			 unsigned int domid, unsigned int target)
+		   unsigned int domid, unsigned int target)
 {
 	struct xsd_sockmsg msg = { .type = XS_SET_TARGET };
 	char domid_str[MAX_STRLEN(domid)];
@@ -1377,30 +1385,30 @@ bool xs_is_domain_introduced(struct xs_handle *h, unsigned int domid)
 
 int xs_suspend_evtchn_port(int domid)
 {
-    char path[128];
-    char *portstr;
-    int port;
-    unsigned int plen;
-    struct xs_handle *xs;
-
-    xs = xs_daemon_open();
-    if (!xs)
-        return -1;
+	char path[128];
+	char *portstr;
+	int port;
+	unsigned int plen;
+	struct xs_handle *xs;
+
+	xs = xs_daemon_open();
+	if (!xs)
+		return -1;
 
-    sprintf(path, "/local/domain/%d/device/suspend/event-channel", domid);
-    portstr = xs_read(xs, XBT_NULL, path, &plen);
-    xs_daemon_close(xs);
+	sprintf(path, "/local/domain/%d/device/suspend/event-channel", domid);
+	portstr = xs_read(xs, XBT_NULL, path, &plen);
+	xs_daemon_close(xs);
 
-    if (!portstr || !plen) {
-        port = -1;
-        goto out;
-    }
+	if (!portstr || !plen) {
+		port = -1;
+		goto out;
+	}
 
-    port = atoi(portstr);
+	port = atoi(portstr);
 
 out:
-    free(portstr);
-    return port;
+	free(portstr);
+	return port;
 }
 
 char *xs_control_command(struct xs_handle *h, const char *cmd,
@@ -1436,7 +1444,7 @@ static int read_message(struct xs_handle *h, int nonblocking)
 	 * whole amount requested.  Ie as soon as we have the start of
 	 * the message we block until we get all of it.
 	 */
-         
+
 	struct xs_stored_msg *msg = NULL;
 	char *body = NULL;
 	int saved_errno = 0;
-- 
2.39.5


