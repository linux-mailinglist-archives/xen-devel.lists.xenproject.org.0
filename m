Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPHgBXphvWl09QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:02:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0C2DC375
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258112.1552314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bMW-0003l8-DK; Fri, 20 Mar 2026 15:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258112.1552314; Fri, 20 Mar 2026 15:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bMW-0003iI-9K; Fri, 20 Mar 2026 15:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1258112;
 Fri, 20 Mar 2026 15:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bMU-0001ko-8s
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:02:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0859742-246d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 16:02:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D76A4D27B;
 Fri, 20 Mar 2026 15:02:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D3EF42866;
 Fri, 20 Mar 2026 15:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /qksAmhhvWneXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:02:00 +0000
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
X-Inumbo-ID: c0859742-246d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+PpHjFLzvQIrf2KVCkmF/XhxpN/XcwoIQUr9KmYFoI=;
	b=KOvbaB3/47LkpwEa0g8TBdgM8H2CK5iLpCFU8NDRvvyvpRfg2v20GO5UNslIn6e9Lvstuf
	DAWr2KkK3AF+mWQCKrpeSwLh3haqLt3IzsJzVAugaAIokFFn1bSUme1PZhyqYwCc3ztbFy
	kMuQPWkbBw6JjeVnkFv/XLqwTgJcTIE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+PpHjFLzvQIrf2KVCkmF/XhxpN/XcwoIQUr9KmYFoI=;
	b=EUb/g56efp1Yf5qeMEHjfrDKfGpmopQp0grGgajiCZG26XH05kKKOZaUZZD73DCEFfiqyi
	oAg7v+SU6ez7b7U3XkFtw0Ie1eNQLUieFrJu97ix/SzZGnjT7wTAAy49ND/WvKCrOtGQwh
	m4oZuXitluJ0EXPZVM2wbufGDBf1hgA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 07/12] tools/xenstored: use per-domain quota settings
Date: Fri, 20 Mar 2026 16:01:15 +0100
Message-ID: <20260320150120.874878-8-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320150120.874878-1-jgross@suse.com>
References: <20260320150120.874878-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 80D0C2DC375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Initialize the per-domain quota values with the global ones at domain
introduction. Use the per-domain quota settings when checking for
current values to exceed the quota.

Add per-domain quota support to live update.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
V2:
- fix commit message (Anthony Perard)
- rename "len" to "rec_len" in dump_state_domain() (Anthony Perard)
---
 tools/xenstored/domain.c | 60 ++++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index b82f2d5167..7a8d285e64 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -392,6 +392,9 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 
 static unsigned int domain_get_soft_quota(struct domain *d, enum accitem what)
 {
+	if (d && d->acc[what].val[Q_IDX_SOFT] != Q_VAL_DISABLED)
+		return d->acc[what].val[Q_IDX_SOFT];
+
 	return quotas[what].val[Q_IDX_SOFT];
 }
 
@@ -400,6 +403,9 @@ static bool domain_quota_val_exceeds(struct domain *d, enum accitem what,
 {
 	unsigned int quota = quotas[what].val[Q_IDX_HARD];
 
+	if (d->acc[what].val[Q_IDX_HARD] != Q_VAL_DISABLED)
+		quota = d->acc[what].val[Q_IDX_HARD];
+
 	if (!quota || !domid_is_unprivileged(d->domid))
 		return false;
 
@@ -824,6 +830,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid,
 				   uint64_t unique_id)
 {
 	struct domain *domain;
+	unsigned int q;
 
 	domain = talloc_zero(context, struct domain);
 	if (!domain) {
@@ -837,6 +844,11 @@ static struct domain *alloc_domain(const void *context, unsigned int domid,
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
@@ -2118,25 +2130,39 @@ static int dump_state_domain(const void *k, void *v, void *arg)
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
+	unsigned int rec_len;
+	size_t ret;
 
-	if (lu_status->version > 1)
-		sd.features = domain->features;
+	n_quota = get_quota_size(domain->acc, &rec_len);
+	rec_len += n_quota * sizeof(sd->quota_val[0]);
+	rec_len += sizeof(*sd);
+	rec_len = ROUNDUP(rec_len, 3);
 
-	if (fwrite(&head, sizeof(head), 1, fp) != 1)
-		return 1;
-	if (fwrite(&sd, sizeof(sd), 1, fp) != 1)
-		return 1;
-	if (dump_state_align(fp))
+	record = talloc_size(NULL, rec_len + sizeof(*head));
+	if (!record)
 		return 1;
 
-	return 0;
+	head = record;
+	head->type = XS_STATE_TYPE_DOMAIN;
+	head->length = rec_len;
+
+	sd = (struct xs_state_domain *)(head + 1);
+	sd->domain_id = domain->domid;
+	sd->n_quota = n_quota;
+	sd->features = (lu_status->version > 1) ? domain->features : 0;
+
+	build_quota_data(domain->acc, sd->quota_val,
+			 (char *)(sd->quota_val + n_quota));
+
+	ret = fwrite(record, rec_len + sizeof(*head), 1, fp);
+
+	talloc_free(record);
+
+	return (ret != 1 || dump_state_align(fp)) ? 1 : 0;
 }
 
 const char *dump_state_domains(FILE *fp)
@@ -2153,6 +2179,8 @@ void read_state_domain(const void *ctx, const void *state, unsigned int version)
 {
 	const struct xs_state_domain *sd = state;
 	struct domain *domain;
+	unsigned int n_quota = sd->n_quota;
+	const char *name = (const char *)(sd->quota_val + n_quota);
 
 	domain = find_domain_struct(sd->domain_id);
 	if (!domain)
@@ -2160,6 +2188,8 @@ void read_state_domain(const void *ctx, const void *state, unsigned int version)
 
 	if (version > 1)
 		domain->features = sd->features;
+
+	parse_quota_data(sd->quota_val, name, n_quota, domain->acc);
 }
 
 const char *dump_state_glb_quota(FILE *fp)
-- 
2.53.0


