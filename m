Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DKFH07Bs2mEagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87727EF76
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253364.1549660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFv-0005DN-38; Fri, 13 Mar 2026 07:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253364.1549660; Fri, 13 Mar 2026 07:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFu-0005Ah-Vr; Fri, 13 Mar 2026 07:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1253364;
 Fri, 13 Mar 2026 07:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFt-0003TG-OP
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0192254f-1eb1-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:48:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E69B94E3F0;
 Fri, 13 Mar 2026 07:48:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5051403F6;
 Fri, 13 Mar 2026 07:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7LTxLkTBs2nAGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:20 +0000
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
X-Inumbo-ID: 0192254f-1eb1-11f1-b164-2bf370ae4941
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 5/8] tools/xenstored: add depth handling to XS_WATCH
Date: Fri, 13 Mar 2026 08:47:48 +0100
Message-ID: <20260313074751.2904215-6-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 6C87727EF76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In case XENSTORE_SERVER_FEATURE_WATCHDEPTH is set, allow XS_WATCH to
have "depth" as 3rd parameter.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c |  8 ++++++++
 tools/xenstored/domain.h |  2 ++
 tools/xenstored/watch.c  | 11 +++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index ebeced3228..866c0aa908 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -387,6 +387,14 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 	wrl_apply_debit_actual(conn->domain);
 }
 
+bool feature_available(const struct connection *conn, unsigned int feature)
+{
+	if (!conn->domain)
+		return XENSTORE_FEATURES & feature;
+
+	return conn->domain->features & feature;
+}
+
 static unsigned int domain_get_soft_quota(struct domain *d, enum accitem what)
 {
 	if (d && d->acc[what].val[Q_IDX_SOFT] != Q_VAL_DISABLED)
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 6a06b0d1af..15d8f1a5b2 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -192,4 +192,6 @@ struct hashtable *domain_check_acc_init(void);
 void domain_check_acc_add(const struct node *node, struct hashtable *domains);
 void domain_check_acc(struct hashtable *domains);
 
+bool feature_available(const struct connection *conn, unsigned int feature);
+
 #endif /* _XENSTORED_DOMAIN_H */
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index 3f1049911b..5de386370d 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -213,11 +213,18 @@ static struct watch *add_watch(struct connection *conn, const char *path,
 int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 {
 	struct watch *watch;
-	const char *vec[2];
+	const char *vec[3];
+	unsigned int n_pars;
 	int depth = -1;
 	bool relative;
 
-	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
+	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
+	if (n_pars == 3 &&
+	    feature_available(conn, XENSTORE_SERVER_FEATURE_WATCHDEPTH)) {
+		depth = atoi(vec[2]);
+		if (depth < 0)
+			return EINVAL;
+	} else if (n_pars != 2)
 		return EINVAL;
 
 	errno = check_watch_path(conn, ctx, &(vec[0]), &relative);
-- 
2.53.0


