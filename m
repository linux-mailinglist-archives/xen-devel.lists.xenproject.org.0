Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH0WBX4q52nv4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD7437C96
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288437.1568739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kq-0004Ze-P5; Tue, 21 Apr 2026 07:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288437.1568739; Tue, 21 Apr 2026 07:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kq-0004XE-Kw; Tue, 21 Apr 2026 07:42:44 +0000
Received: by outflank-mailman (input) for mailman id 1288437;
 Tue, 21 Apr 2026 07:42:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5ko-0004Ra-PW
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5ko-00G0fB-5y
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a6c-bab6-0a2a0a5309dd-0a2a4502ea7e-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:42 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a71-af86-0a2a45020019-c387df82b406-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:42 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C321A6A7F6;
 Tue, 21 Apr 2026 07:42:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F420593AF;
 Tue, 21 Apr 2026 07:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vkPTJXEq52mdNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:41 +0000
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
	t=1776757361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTh41V/BJEBo815LhqNiJ9PaLEavgsQdAx4aeK8HTHQ=;
	b=KIp/c1/FL5788YEL97/5yCrDmrY9qzCmzNSl8AFX2Or3843M96TG5nj7SUP3C3LJQ+WRqV
	Xnr52EeuBeT/GvCkj6lUWZNRvOcVgN4kINR/ZKtQOCp6mvpi9/mb2PTtO9ooHdGppIkaqu
	3f8bmeujbUrlj7ILBQHefVqA+sqXRd8=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="KIp/c1/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTh41V/BJEBo815LhqNiJ9PaLEavgsQdAx4aeK8HTHQ=;
	b=KIp/c1/FL5788YEL97/5yCrDmrY9qzCmzNSl8AFX2Or3843M96TG5nj7SUP3C3LJQ+WRqV
	Xnr52EeuBeT/GvCkj6lUWZNRvOcVgN4kINR/ZKtQOCp6mvpi9/mb2PTtO9ooHdGppIkaqu
	3f8bmeujbUrlj7ILBQHefVqA+sqXRd8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 5/9] tools/xenstored: add depth handling to XS_WATCH
Date: Tue, 21 Apr 2026 09:42:07 +0200
Message-ID: <20260421074211.308473-6-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-720697/1776757362-80B78161-30122763/0/0
X-purgate-type: clean
X-purgate-size: 2390
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A6AD7437C96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In case XENSTORE_SERVER_FEATURE_WATCHDEPTH is set, allow XS_WATCH to
have "depth" as 3rd parameter.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c |  8 ++++++++
 tools/xenstored/domain.h |  2 ++
 tools/xenstored/watch.c  | 11 +++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index b0b339f569..7f2fa16cf2 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -390,6 +390,14 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
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
index ca38b5e0ea..b1cfb5cd82 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -188,4 +188,6 @@ struct hashtable *domain_check_acc_init(void);
 void domain_check_acc_add(const struct node *node, struct hashtable *domains);
 void domain_check_acc(struct hashtable *domains);
 
+bool feature_available(const struct connection *conn, unsigned int feature);
+
 #endif /* _XENSTORED_DOMAIN_H */
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index 42e24d3201..860c219f29 100644
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


