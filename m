Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55F6CFF19
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516512.800745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzf-000812-Ld; Thu, 30 Mar 2023 08:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516512.800745; Thu, 30 Mar 2023 08:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzf-0007vk-IP; Thu, 30 Mar 2023 08:50:51 +0000
Received: by outflank-mailman (input) for mailman id 516512;
 Thu, 30 Mar 2023 08:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnze-0005Qp-0q
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:50:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f73eadf9-ced7-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 10:50:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D977C1FEAA;
 Thu, 30 Mar 2023 08:50:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A921A138FF;
 Thu, 30 Mar 2023 08:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 311oJ2dNJWQyIwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:50:47 +0000
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
X-Inumbo-ID: f73eadf9-ced7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRzyXcBYIsQ+I9/0pFucQzlw0RZGeyj+n+0oBfMcYu8=;
	b=uwJ0wMqxECH81+WhDgVDnotKmk4+W9GsPICIIaVOvf50oLbSUbloJd45kxpToZesOXFkex
	rxSTN/paBvGZpOPZC/8pVA2Qf8uKYBJM3AbsToTGAO6jLZNIS2rAxHWFiT7O41p8P8HLmZ
	LfLWrRUG6B9DQUXUoBCGGM0h31zRqXE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 06/13] tools/xenstore: switch write limiting to use millisecond time base
Date: Thu, 30 Mar 2023 10:50:04 +0200
Message-Id: <20230330085011.9170-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to keep struct wrl_timestampt, as it serves the same
purpose as the more simple time base provided by get_now().

Move some more stuff from xenstored_domain.h into xenstored_domain.c
as it is being used nowhere else.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   |  8 ++---
 tools/xenstore/xenstored_core.h   |  7 ++--
 tools/xenstore/xenstored_domain.c | 56 +++++++++++++------------------
 tools/xenstore/xenstored_domain.h | 21 ++----------
 4 files changed, 32 insertions(+), 60 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index c5433e5b3f..6be2a3aa42 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -192,7 +192,7 @@ void reopen_log(void)
 	}
 }
 
-static uint64_t get_now_msec(void)
+uint64_t get_now_msec(void)
 {
 	struct timespec now_ts;
 
@@ -510,7 +510,6 @@ fail:
 static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 {
 	struct connection *conn;
-	struct wrl_timestampt now;
 	uint64_t msecs;
 
 	if (fds)
@@ -530,13 +529,12 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 		xce_pollfd_idx = set_fd(xenevtchn_fd(xce_handle),
 					POLLIN|POLLPRI);
 
-	wrl_gettime_now(&now);
-	wrl_log_periodic(now);
 	msecs = get_now_msec();
+	wrl_log_periodic(msecs);
 
 	list_for_each_entry(conn, &connections, list) {
 		if (conn->domain) {
-			wrl_check_timeout(conn->domain, now, ptimeout);
+			wrl_check_timeout(conn->domain, msecs, ptimeout);
 			check_event_timeout(conn, msecs, ptimeout);
 			if (conn_can_read(conn) ||
 			    (conn_can_write(conn) &&
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 92d5b50f3c..84a611cbb5 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -47,10 +47,6 @@
 /* DEFAULT_BUFFER_SIZE should be large enough for each errno string. */
 #define DEFAULT_BUFFER_SIZE 16
 
-typedef int32_t wrl_creditt;
-#define WRL_CREDIT_MAX (1000*1000*1000)
-/* ^ satisfies non-overflow condition for wrl_xfer_credit */
-
 struct xs_state_connection;
 
 struct buffered_data
@@ -320,6 +316,9 @@ extern bool keep_orphans;
 
 extern unsigned int timeout_watch_event_msec;
 
+/* Get internal time in milliseconds. */
+uint64_t get_now_msec(void);
+
 /* Map the kernel's xenstore page. */
 void *xenbus_map(void);
 void unmap_xenbus(void *interface);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 0a8353dad5..2fb142c5b3 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -99,6 +99,8 @@ struct quota soft_quotas[ACC_N] = {
 	},
 };
 
+typedef int32_t wrl_creditt;
+
 struct domain
 {
 	/* The id of this domain */
@@ -139,7 +141,7 @@ struct domain
 
 	/* write rate limit */
 	wrl_creditt wrl_credit; /* [ -wrl_config_writecost, +_dburst ] */
-	struct wrl_timestampt wrl_timestamp;
+	uint64_t wrl_timestamp;
 	bool wrl_delay_logged;
 };
 
@@ -159,6 +161,17 @@ struct changed_domain
 
 static struct hashtable *domhash;
 
+/* Write rate limiting */
+
+/* Satisfies non-overflow condition for wrl_xfer_credit. */
+#define WRL_CREDIT_MAX (1000*1000*1000)
+#define WRL_FACTOR     1000 /* for fixed-point arithmetic */
+#define WRL_RATE        200
+#define WRL_DBURST       10
+#define WRL_GBURST     1000
+#define WRL_NEWDOMS       5
+#define WRL_LOGEVERY    120 /* seconds */
+
 static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
 static wrl_creditt wrl_config_rate           = WRL_RATE   * WRL_FACTOR;
 static wrl_creditt wrl_config_dburst         = WRL_DBURST * WRL_FACTOR;
@@ -178,19 +191,6 @@ do {						\
 		trace("wrl: " __VA_ARGS__);	\
 } while (0)
 
-void wrl_gettime_now(struct wrl_timestampt *now_wt)
-{
-	struct timespec now_ts;
-	int r;
-
-	r = clock_gettime(CLOCK_MONOTONIC, &now_ts);
-	if (r)
-		barf_perror("Could not find time (clock_gettime failed)");
-
-	now_wt->sec = now_ts.tv_sec;
-	now_wt->msec = now_ts.tv_nsec / 1000000;
-}
-
 static void wrl_xfer_credit(wrl_creditt *debit,  wrl_creditt debit_floor,
 			    wrl_creditt *credit, wrl_creditt credit_ceil)
 	/*
@@ -217,7 +217,7 @@ static void wrl_xfer_credit(wrl_creditt *debit,  wrl_creditt debit_floor,
 static void wrl_domain_new(struct domain *domain)
 {
 	domain->wrl_credit = 0;
-	wrl_gettime_now(&domain->wrl_timestamp);
+	domain->wrl_timestamp = get_now_msec();
 	wrl_ndomains++;
 	/* Steal up to DBURST from the reserve */
 	wrl_xfer_credit(&wrl_reserve, -wrl_config_newdoms_dburst,
@@ -236,7 +236,7 @@ static void wrl_domain_destroy(struct domain *domain)
 			&wrl_reserve, wrl_config_dburst);
 }
 
-static void wrl_credit_update(struct domain *domain, struct wrl_timestampt now)
+static void wrl_credit_update(struct domain *domain, uint64_t now)
 {
 	/*
 	 * We want to calculate
@@ -245,18 +245,12 @@ static void wrl_credit_update(struct domain *domain, struct wrl_timestampt now)
 	 * To avoid rounding errors from constantly adding small
 	 * amounts of credit, we only add credit for whole milliseconds.
 	 */
-	long seconds      = now.sec -  domain->wrl_timestamp.sec;
-	long milliseconds = now.msec - domain->wrl_timestamp.msec;
 	long msec;
 	int64_t denom, num;
 	wrl_creditt surplus;
 
-	seconds = MIN(seconds, 1000*1000); /* arbitrary, prevents overflow */
-	msec = seconds * 1000 + milliseconds;
-
-	if (msec < 0)
-                /* shouldn't happen with CLOCK_MONOTONIC */
-		msec = 0;
+	/* Prevent overflow by limiting to 32 bits. */
+	msec = MIN(now - domain->wrl_timestamp, 1000 * 1000 * 1000);
 
 	/* 32x32 -> 64 cannot overflow */
 	denom = (int64_t)msec * wrl_config_rate;
@@ -288,9 +282,7 @@ static void wrl_credit_update(struct domain *domain, struct wrl_timestampt now)
 		  (long)wrl_reserve, (long)surplus);
 }
 
-void wrl_check_timeout(struct domain *domain,
-		       struct wrl_timestampt now,
-		       int *ptimeout)
+void wrl_check_timeout(struct domain *domain, uint64_t now, int *ptimeout)
 {
 	uint64_t num, denom;
 	int wakeup;
@@ -327,13 +319,13 @@ void wrl_check_timeout(struct domain *domain,
 
 void wrl_apply_debit_actual(struct domain *domain)
 {
-	struct wrl_timestampt now;
+	uint64_t now;
 
 	if (!domain || !domain_is_unprivileged(domain->conn))
 		/* sockets and privileged domain escape the write rate limit */
 		return;
 
-	wrl_gettime_now(&now);
+	now = get_now_msec();
 	wrl_credit_update(domain, now);
 
 	domain->wrl_credit -= wrl_config_writecost;
@@ -348,14 +340,14 @@ void wrl_apply_debit_actual(struct domain *domain)
 		} else if (!wrl_log_last_warning) {
 			WRL_LOG(now, "rate limiting restarts\n");
 		}
-		wrl_log_last_warning = now.sec;
+		wrl_log_last_warning = now / 1000;
 	}
 }
 
-void wrl_log_periodic(struct wrl_timestampt now)
+void wrl_log_periodic(uint64_t now)
 {
 	if (wrl_log_last_warning &&
-	    (now.sec - wrl_log_last_warning) > WRL_LOGEVERY) {
+	    (now / 1000 - wrl_log_last_warning) > WRL_LOGEVERY) {
 		WRL_LOG(now, "not in force recently\n");
 		wrl_log_last_warning = 0;
 	}
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 8cd69d42ab..f9ee0bd141 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -145,27 +145,10 @@ void domain_reset_global_acc(void);
 bool domain_max_chk(const struct connection *conn, unsigned int what,
 		    unsigned int val);
 
-/* Write rate limiting */
-
-#define WRL_FACTOR   1000 /* for fixed-point arithmetic */
-#define WRL_RATE      200
-#define WRL_DBURST     10
-#define WRL_GBURST   1000
-#define WRL_NEWDOMS     5
-#define WRL_LOGEVERY  120 /* seconds */
-
-struct wrl_timestampt {
-	time_t sec;
-	int msec;
-};
-
 extern long wrl_ntransactions;
 
-void wrl_gettime_now(struct wrl_timestampt *now_ts);
-void wrl_check_timeout(struct domain *domain,
-                       struct wrl_timestampt now,
-                       int *ptimeout);
-void wrl_log_periodic(struct wrl_timestampt now);
+void wrl_check_timeout(struct domain *domain, uint64_t now, int *ptimeout);
+void wrl_log_periodic(uint64_t now);
 void wrl_apply_debit_direct(struct connection *conn);
 void wrl_apply_debit_trans_commit(struct connection *conn);
 
-- 
2.35.3


