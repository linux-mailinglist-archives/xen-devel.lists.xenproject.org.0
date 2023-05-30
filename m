Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F671591E
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540876.842994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v80-0003XH-GA; Tue, 30 May 2023 08:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540876.842994; Tue, 30 May 2023 08:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v80-0003TO-Ad; Tue, 30 May 2023 08:54:52 +0000
Received: by outflank-mailman (input) for mailman id 540876;
 Tue, 30 May 2023 08:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v7y-0001Xf-LH
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:54:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a26dfdfb-fec7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:54:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D46721A40;
 Tue, 30 May 2023 08:54:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 310B61341B;
 Tue, 30 May 2023 08:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6Ne2Ctm5dWRnGwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:54:49 +0000
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
X-Inumbo-ID: a26dfdfb-fec7-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgrLaJJsHMjrdEFqr21l8LMXJwY+KaUuWrUY/uXgM0o=;
	b=u+ijtaE+RrDD0MS7PulMDnQ/laO0pERHqv3QbqW9HjAKQ2YFzUTjkoAlLK3aZoRryrXEXD
	Qc5oiOycsVBKZS7xuUWooDb8YEZNBaqHfS9Va7LifVA5j/4SGAhCdnoM36Kxa1n/V/ENCW
	ozJc5M4z6vKjHsABJxDcYbUV9ODKnQY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 05/16] tools/xenstore: make some write limit functions static
Date: Tue, 30 May 2023 10:54:07 +0200
Message-Id: <20230530085418.5417-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some wrl_*() functions are only used in xenstored_domain.c, so make
them static. In order to avoid the need of forward declarations, move
the whole function block to the start of the file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 456 +++++++++++++++---------------
 tools/xenstore/xenstored_domain.h |   3 -
 2 files changed, 228 insertions(+), 231 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 815f15cd1d..b21bdf6194 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -157,6 +157,234 @@ struct changed_domain
 
 static struct hashtable *domhash;
 
+static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
+static wrl_creditt wrl_config_rate           = WRL_RATE   * WRL_FACTOR;
+static wrl_creditt wrl_config_dburst         = WRL_DBURST * WRL_FACTOR;
+static wrl_creditt wrl_config_gburst         = WRL_GBURST * WRL_FACTOR;
+static wrl_creditt wrl_config_newdoms_dburst =
+	                         WRL_DBURST * WRL_NEWDOMS * WRL_FACTOR;
+
+long wrl_ntransactions;
+
+static long wrl_ndomains;
+static wrl_creditt wrl_reserve; /* [-wrl_config_newdoms_dburst, +_gburst ] */
+static time_t wrl_log_last_warning; /* 0: no previous warning */
+
+#define trace_wrl(...)				\
+do {						\
+	if (trace_flags & TRACE_WRL)		\
+		trace("wrl: " __VA_ARGS__);	\
+} while (0)
+
+void wrl_gettime_now(struct wrl_timestampt *now_wt)
+{
+	struct timespec now_ts;
+	int r;
+
+	r = clock_gettime(CLOCK_MONOTONIC, &now_ts);
+	if (r)
+		barf_perror("Could not find time (clock_gettime failed)");
+
+	now_wt->sec = now_ts.tv_sec;
+	now_wt->msec = now_ts.tv_nsec / 1000000;
+}
+
+static void wrl_xfer_credit(wrl_creditt *debit,  wrl_creditt debit_floor,
+			    wrl_creditt *credit, wrl_creditt credit_ceil)
+	/*
+	 * Transfers zero or more credit from "debit" to "credit".
+	 * Transfers as much as possible while maintaining
+	 * debit >= debit_floor and credit <= credit_ceil.
+	 * (If that's violated already, does nothing.)
+	 *
+	 * Sufficient conditions to avoid overflow, either of:
+	 *  |every argument| <= 0x3fffffff
+	 *  |every argument| <= 1E9
+	 *  |every argument| <= WRL_CREDIT_MAX
+	 * (And this condition is preserved.)
+	 */
+{
+	wrl_creditt xfer = MIN( *debit      - debit_floor,
+			        credit_ceil - *credit      );
+	if (xfer > 0) {
+		*debit -= xfer;
+		*credit += xfer;
+	}
+}
+
+static void wrl_domain_new(struct domain *domain)
+{
+	domain->wrl_credit = 0;
+	wrl_gettime_now(&domain->wrl_timestamp);
+	wrl_ndomains++;
+	/* Steal up to DBURST from the reserve */
+	wrl_xfer_credit(&wrl_reserve, -wrl_config_newdoms_dburst,
+			&domain->wrl_credit, wrl_config_dburst);
+}
+
+static void wrl_domain_destroy(struct domain *domain)
+{
+	wrl_ndomains--;
+	/*
+	 * Don't bother recalculating domain's credit - this just
+	 * means we don't give the reserve the ending domain's credit
+	 * for time elapsed since last update.
+	 */
+	wrl_xfer_credit(&domain->wrl_credit, 0,
+			&wrl_reserve, wrl_config_dburst);
+}
+
+static void wrl_credit_update(struct domain *domain, struct wrl_timestampt now)
+{
+	/*
+	 * We want to calculate
+	 *    credit += (now - timestamp) * RATE / ndoms;
+	 * But we want it to saturate, and to avoid floating point.
+	 * To avoid rounding errors from constantly adding small
+	 * amounts of credit, we only add credit for whole milliseconds.
+	 */
+	long seconds      = now.sec -  domain->wrl_timestamp.sec;
+	long milliseconds = now.msec - domain->wrl_timestamp.msec;
+	long msec;
+	int64_t denom, num;
+	wrl_creditt surplus;
+
+	seconds = MIN(seconds, 1000*1000); /* arbitrary, prevents overflow */
+	msec = seconds * 1000 + milliseconds;
+
+	if (msec < 0)
+                /* shouldn't happen with CLOCK_MONOTONIC */
+		msec = 0;
+
+	/* 32x32 -> 64 cannot overflow */
+	denom = (int64_t)msec * wrl_config_rate;
+	num  =  (int64_t)wrl_ndomains * 1000;
+	/* denom / num <= 1E6 * wrl_config_rate, so with
+	   reasonable wrl_config_rate, denom / num << 2^64 */
+
+	/* at last! */
+	domain->wrl_credit = MIN( (int64_t)domain->wrl_credit + denom / num,
+				  WRL_CREDIT_MAX );
+	/* (maybe briefly violating the DBURST cap on wrl_credit) */
+
+	/* maybe take from the reserve to make us nonnegative */
+	wrl_xfer_credit(&wrl_reserve,        0,
+			&domain->wrl_credit, 0);
+
+	/* return any surplus (over DBURST) to the reserve */
+	surplus = 0;
+	wrl_xfer_credit(&domain->wrl_credit, wrl_config_dburst,
+			&surplus,            WRL_CREDIT_MAX);
+	wrl_xfer_credit(&surplus,     0,
+			&wrl_reserve, wrl_config_gburst);
+	/* surplus is now implicitly discarded */
+
+	domain->wrl_timestamp = now;
+
+	trace_wrl("dom %4d %6ld msec %9ld credit  %9ld reserve %9ld discard\n",
+		  domain->domid, msec, (long)domain->wrl_credit,
+		  (long)wrl_reserve, (long)surplus);
+}
+
+void wrl_check_timeout(struct domain *domain,
+		       struct wrl_timestampt now,
+		       int *ptimeout)
+{
+	uint64_t num, denom;
+	int wakeup;
+
+	wrl_credit_update(domain, now);
+
+	if (domain->wrl_credit >= 0)
+		/* not blocked */
+		return;
+
+	if (!*ptimeout)
+		/* already decided on immediate wakeup,
+		   so no need to calculate our timeout */
+		return;
+
+	/* calculate  wakeup = now + -credit / (RATE / ndoms); */
+
+	/* credit cannot go more -ve than one transaction,
+	 * so the first multiplication cannot overflow even 32-bit */
+	num   = (uint64_t)(-domain->wrl_credit * 1000) * wrl_ndomains;
+	denom = wrl_config_rate;
+
+	wakeup = MIN( num / denom /* uint64_t */, INT_MAX );
+	if (*ptimeout==-1 || wakeup < *ptimeout)
+		*ptimeout = wakeup;
+
+	trace_wrl("domain %u credit=%ld (reserve=%ld) SLEEPING for %d\n",
+		  domain->domid, (long)domain->wrl_credit, (long)wrl_reserve,
+		  wakeup);
+}
+
+#define WRL_LOG(now, ...) \
+	(syslog(LOG_WARNING, "write rate limit: " __VA_ARGS__))
+
+void wrl_apply_debit_actual(struct domain *domain)
+{
+	struct wrl_timestampt now;
+
+	if (!domain || !domain_is_unprivileged(domain->conn))
+		/* sockets and privileged domain escape the write rate limit */
+		return;
+
+	wrl_gettime_now(&now);
+	wrl_credit_update(domain, now);
+
+	domain->wrl_credit -= wrl_config_writecost;
+	trace_wrl("domain %u credit=%ld (reserve=%ld)\n", domain->domid,
+		  (long)domain->wrl_credit, (long)wrl_reserve);
+
+	if (domain->wrl_credit < 0) {
+		if (!domain->wrl_delay_logged) {
+			domain->wrl_delay_logged = true;
+			WRL_LOG(now, "domain %ld is affected\n",
+				(long)domain->domid);
+		} else if (!wrl_log_last_warning) {
+			WRL_LOG(now, "rate limiting restarts\n");
+		}
+		wrl_log_last_warning = now.sec;
+	}
+}
+
+void wrl_log_periodic(struct wrl_timestampt now)
+{
+	if (wrl_log_last_warning &&
+	    (now.sec - wrl_log_last_warning) > WRL_LOGEVERY) {
+		WRL_LOG(now, "not in force recently\n");
+		wrl_log_last_warning = 0;
+	}
+}
+
+void wrl_apply_debit_direct(struct connection *conn)
+{
+	if (!conn)
+		/* some writes are generated internally */
+		return;
+
+	if (conn->transaction)
+		/* these are accounted for when the transaction ends */
+		return;
+
+	if (!wrl_ntransactions)
+		/* we don't conflict with anyone */
+		return;
+
+	wrl_apply_debit_actual(conn->domain);
+}
+
+void wrl_apply_debit_trans_commit(struct connection *conn)
+{
+	if (wrl_ntransactions <= 1)
+		/* our own transaction appears in the counter */
+		return;
+
+	wrl_apply_debit_actual(conn->domain);
+}
+
 static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
 {
 	return ((prod - cons) <= XENSTORE_RING_SIZE);
@@ -1446,234 +1674,6 @@ unsigned int domain_transaction_get(struct connection *conn)
 		: 0;
 }
 
-static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
-static wrl_creditt wrl_config_rate           = WRL_RATE   * WRL_FACTOR;
-static wrl_creditt wrl_config_dburst         = WRL_DBURST * WRL_FACTOR;
-static wrl_creditt wrl_config_gburst         = WRL_GBURST * WRL_FACTOR;
-static wrl_creditt wrl_config_newdoms_dburst =
-	                         WRL_DBURST * WRL_NEWDOMS * WRL_FACTOR;
-
-long wrl_ntransactions;
-
-static long wrl_ndomains;
-static wrl_creditt wrl_reserve; /* [-wrl_config_newdoms_dburst, +_gburst ] */
-static time_t wrl_log_last_warning; /* 0: no previous warning */
-
-#define trace_wrl(...)				\
-do {						\
-	if (trace_flags & TRACE_WRL)		\
-		trace("wrl: " __VA_ARGS__);	\
-} while (0)
-
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
-static void wrl_xfer_credit(wrl_creditt *debit,  wrl_creditt debit_floor,
-			    wrl_creditt *credit, wrl_creditt credit_ceil)
-	/*
-	 * Transfers zero or more credit from "debit" to "credit".
-	 * Transfers as much as possible while maintaining
-	 * debit >= debit_floor and credit <= credit_ceil.
-	 * (If that's violated already, does nothing.)
-	 *
-	 * Sufficient conditions to avoid overflow, either of:
-	 *  |every argument| <= 0x3fffffff
-	 *  |every argument| <= 1E9
-	 *  |every argument| <= WRL_CREDIT_MAX
-	 * (And this condition is preserved.)
-	 */
-{
-	wrl_creditt xfer = MIN( *debit      - debit_floor,
-			        credit_ceil - *credit      );
-	if (xfer > 0) {
-		*debit -= xfer;
-		*credit += xfer;
-	}
-}
-
-void wrl_domain_new(struct domain *domain)
-{
-	domain->wrl_credit = 0;
-	wrl_gettime_now(&domain->wrl_timestamp);
-	wrl_ndomains++;
-	/* Steal up to DBURST from the reserve */
-	wrl_xfer_credit(&wrl_reserve, -wrl_config_newdoms_dburst,
-			&domain->wrl_credit, wrl_config_dburst);
-}
-
-void wrl_domain_destroy(struct domain *domain)
-{
-	wrl_ndomains--;
-	/*
-	 * Don't bother recalculating domain's credit - this just
-	 * means we don't give the reserve the ending domain's credit
-	 * for time elapsed since last update.
-	 */
-	wrl_xfer_credit(&domain->wrl_credit, 0,
-			&wrl_reserve, wrl_config_dburst);
-}
-
-void wrl_credit_update(struct domain *domain, struct wrl_timestampt now)
-{
-	/*
-	 * We want to calculate
-	 *    credit += (now - timestamp) * RATE / ndoms;
-	 * But we want it to saturate, and to avoid floating point.
-	 * To avoid rounding errors from constantly adding small
-	 * amounts of credit, we only add credit for whole milliseconds.
-	 */
-	long seconds      = now.sec -  domain->wrl_timestamp.sec;
-	long milliseconds = now.msec - domain->wrl_timestamp.msec;
-	long msec;
-	int64_t denom, num;
-	wrl_creditt surplus;
-
-	seconds = MIN(seconds, 1000*1000); /* arbitrary, prevents overflow */
-	msec = seconds * 1000 + milliseconds;
-
-	if (msec < 0)
-                /* shouldn't happen with CLOCK_MONOTONIC */
-		msec = 0;
-
-	/* 32x32 -> 64 cannot overflow */
-	denom = (int64_t)msec * wrl_config_rate;
-	num  =  (int64_t)wrl_ndomains * 1000;
-	/* denom / num <= 1E6 * wrl_config_rate, so with
-	   reasonable wrl_config_rate, denom / num << 2^64 */
-
-	/* at last! */
-	domain->wrl_credit = MIN( (int64_t)domain->wrl_credit + denom / num,
-				  WRL_CREDIT_MAX );
-	/* (maybe briefly violating the DBURST cap on wrl_credit) */
-
-	/* maybe take from the reserve to make us nonnegative */
-	wrl_xfer_credit(&wrl_reserve,        0,
-			&domain->wrl_credit, 0);
-
-	/* return any surplus (over DBURST) to the reserve */
-	surplus = 0;
-	wrl_xfer_credit(&domain->wrl_credit, wrl_config_dburst,
-			&surplus,            WRL_CREDIT_MAX);
-	wrl_xfer_credit(&surplus,     0,
-			&wrl_reserve, wrl_config_gburst);
-	/* surplus is now implicitly discarded */
-
-	domain->wrl_timestamp = now;
-
-	trace_wrl("dom %4d %6ld msec %9ld credit %9ld reserve %9ld discard\n",
-		  domain->domid, msec, (long)domain->wrl_credit,
-		  (long)wrl_reserve, (long)surplus);
-}
-
-void wrl_check_timeout(struct domain *domain,
-		       struct wrl_timestampt now,
-		       int *ptimeout)
-{
-	uint64_t num, denom;
-	int wakeup;
-
-	wrl_credit_update(domain, now);
-
-	if (domain->wrl_credit >= 0)
-		/* not blocked */
-		return;
-
-	if (!*ptimeout)
-		/* already decided on immediate wakeup,
-		   so no need to calculate our timeout */
-		return;
-
-	/* calculate  wakeup = now + -credit / (RATE / ndoms); */
-
-	/* credit cannot go more -ve than one transaction,
-	 * so the first multiplication cannot overflow even 32-bit */
-	num   = (uint64_t)(-domain->wrl_credit * 1000) * wrl_ndomains;
-	denom = wrl_config_rate;
-
-	wakeup = MIN( num / denom /* uint64_t */, INT_MAX );
-	if (*ptimeout==-1 || wakeup < *ptimeout)
-		*ptimeout = wakeup;
-
-	trace_wrl("domain %u credit=%ld (reserve=%ld) SLEEPING for %d\n",
-		  domain->domid, (long)domain->wrl_credit, (long)wrl_reserve,
-		  wakeup);
-}
-
-#define WRL_LOG(now, ...) \
-	(syslog(LOG_WARNING, "write rate limit: " __VA_ARGS__))
-
-void wrl_apply_debit_actual(struct domain *domain)
-{
-	struct wrl_timestampt now;
-
-	if (!domain || !domid_is_unprivileged(domain->domid))
-		/* sockets and privileged domain escape the write rate limit */
-		return;
-
-	wrl_gettime_now(&now);
-	wrl_credit_update(domain, now);
-
-	domain->wrl_credit -= wrl_config_writecost;
-	trace_wrl("domain %u credit=%ld (reserve=%ld)\n", domain->domid,
-		  (long)domain->wrl_credit, (long)wrl_reserve);
-
-	if (domain->wrl_credit < 0) {
-		if (!domain->wrl_delay_logged) {
-			domain->wrl_delay_logged = true;
-			WRL_LOG(now, "domain %ld is affected\n",
-				(long)domain->domid);
-		} else if (!wrl_log_last_warning) {
-			WRL_LOG(now, "rate limiting restarts\n");
-		}
-		wrl_log_last_warning = now.sec;
-	}
-}
-
-void wrl_log_periodic(struct wrl_timestampt now)
-{
-	if (wrl_log_last_warning &&
-	    (now.sec - wrl_log_last_warning) > WRL_LOGEVERY) {
-		WRL_LOG(now, "not in force recently\n");
-		wrl_log_last_warning = 0;
-	}
-}
-
-void wrl_apply_debit_direct(struct connection *conn)
-{
-	if (!conn)
-		/* some writes are generated internally */
-		return;
-
-	if (conn->transaction)
-		/* these are accounted for when the transaction ends */
-		return;
-
-	if (!wrl_ntransactions)
-		/* we don't conflict with anyone */
-		return;
-
-	wrl_apply_debit_actual(conn->domain);
-}
-
-void wrl_apply_debit_trans_commit(struct connection *conn)
-{
-	if (wrl_ntransactions <= 1)
-		/* our own transaction appears in the counter */
-		return;
-
-	wrl_apply_debit_actual(conn->domain);
-}
-
 const char *dump_state_connections(FILE *fp)
 {
 	const char *ret = NULL;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 5123453f6c..89be643de4 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -163,9 +163,6 @@ struct wrl_timestampt {
 extern long wrl_ntransactions;
 
 void wrl_gettime_now(struct wrl_timestampt *now_ts);
-void wrl_domain_new(struct domain *domain);
-void wrl_domain_destroy(struct domain *domain);
-void wrl_credit_update(struct domain *domain, struct wrl_timestampt now);
 void wrl_check_timeout(struct domain *domain,
                        struct wrl_timestampt now,
                        int *ptimeout);
-- 
2.35.3


