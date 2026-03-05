Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFWbHLaKqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F80212CE6
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246687.1545831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy989-00026S-1l; Thu, 05 Mar 2026 13:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246687.1545831; Thu, 05 Mar 2026 13:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy988-00023B-Up; Thu, 05 Mar 2026 13:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1246687;
 Thu, 05 Mar 2026 13:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy988-0008Mq-1F
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95177d18-189a-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:52:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C8B83F925;
 Thu,  5 Mar 2026 13:52:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF2243EA68;
 Thu,  5 Mar 2026 13:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QQRMNaqKqWkITwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:42 +0000
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
X-Inumbo-ID: 95177d18-189a-11f1-b164-2bf370ae4941
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 06/11] tools/xenstored: add infrastructure for per-domain quotas
Date: Thu,  5 Mar 2026 14:52:03 +0100
Message-ID: <20260305135208.2208663-7-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 46F80212CE6
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Rspamd-Action: no action

Add the needed structures and helper functions for supporting quotas
per domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 59 ++++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 9bd3ac7aca..8e52351695 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -389,6 +389,9 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 
 static unsigned int domain_get_soft_quota(struct domain *d, enum accitem what)
 {
+	if (d && d->acc[what].val[Q_IDX_SOFT] != Q_VAL_DISABLED)
+		return d->acc[what].val[Q_IDX_SOFT];
+
 	return quotas[what].val[Q_IDX_SOFT];
 }
 
@@ -397,6 +400,9 @@ static bool domain_check_quota_val(struct domain *d, enum accitem what,
 {
 	unsigned int quota = quotas[what].val[Q_IDX_HARD];
 
+	if (d->acc[what].val[Q_IDX_HARD] != Q_VAL_DISABLED)
+		quota = d->acc[what].val[Q_IDX_HARD];
+
 	if (!quota || !domid_is_unprivileged(d->domid))
 		return false;
 
@@ -809,6 +815,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid,
 				   uint64_t unique_id)
 {
 	struct domain *domain;
+	unsigned int q;
 
 	domain = talloc_zero(context, struct domain);
 	if (!domain) {
@@ -822,6 +829,11 @@ static struct domain *alloc_domain(const void *context, unsigned int domid,
 	domain->introduced = false;
 	domain->features = XENSTORE_FEATURES;
 
+	for (q = 0; q < ACC_N; q++) {
+		domain->acc[q].val[Q_IDX_HARD] = quotas[q].val[Q_IDX_HARD];
+		domain->acc[q].val[Q_IDX_SOFT] = quotas[q].val[Q_IDX_SOFT];
+	}
+
 	if (hashtable_add(domhash, &domain->domid, domain)) {
 		talloc_free(domain);
 		errno = ENOMEM;
@@ -2079,25 +2091,38 @@ static int dump_state_domain(const void *k, void *v, void *arg)
 {
 	struct domain *domain = v;
 	FILE *fp = arg;
-	struct xs_state_domain sd;
-	struct xs_state_record_header head;
-
-	head.type = XS_STATE_TYPE_DOMAIN;
-	head.length = sizeof(sd);
-	memset(&sd, 0, sizeof(sd));
-	sd.domain_id = domain->domid;
+	struct xs_state_domain *sd;
+	struct xs_state_record_header *head;
+	void *record;
+	unsigned int n_quota;
+	unsigned int len = sizeof(*sd);
+	size_t ret;
 
-	if (lu_status->version > 1)
-		sd.features = domain->features;
+	n_quota = get_quota_size(domain->acc, &len);
+	len += n_quota * sizeof(sd->quota_val[0]);
+	len = ROUNDUP(len, 3);
 
-	if (fwrite(&head, sizeof(head), 1, fp) != 1)
-		return 1;
-	if (fwrite(&sd, sizeof(sd), 1, fp) != 1)
-		return 1;
-	if (dump_state_align(fp))
+	record = talloc_size(NULL, len + sizeof(*head));
+	if (!record)
 		return 1;
 
-	return 0;
+	head = record;
+	head->type = XS_STATE_TYPE_DOMAIN;
+	head->length = len;
+
+	sd = (struct xs_state_domain *)(head + 1);
+	sd->domain_id = domain->domid;
+	sd->n_quota = n_quota;
+	sd->features = (lu_status->version > 1) ? domain->features : 0;
+
+	build_quota_data(domain->acc, sd->quota_val,
+			 (char *)(sd->quota_val + n_quota));
+
+	ret = fwrite(record, len + sizeof(*head), 1, fp);
+
+	talloc_free(record);
+
+	return (ret != 1 || dump_state_align(fp)) ? 1 : 0;
 }
 
 const char *dump_state_domains(FILE *fp)
@@ -2114,6 +2139,8 @@ void read_state_domain(const void *ctx, const void *state, unsigned int version)
 {
 	const struct xs_state_domain *sd = state;
 	struct domain *domain;
+	unsigned int n_quota = sd->n_quota;
+	const char *name = (const char *)(sd->quota_val + n_quota);
 
 	domain = find_domain_struct(sd->domain_id);
 	if (!domain)
@@ -2121,6 +2148,8 @@ void read_state_domain(const void *ctx, const void *state, unsigned int version)
 
 	if (version > 1)
 		domain->features = sd->features;
+
+	parse_quota_data(sd->quota_val, name, n_quota, domain->acc);
 }
 
 const char *dump_state_glb_quota(FILE *fp)
-- 
2.53.0


