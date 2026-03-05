Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFS+A62KqWki+gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA1212CCF
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246672.1545811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97z-00019L-GG; Thu, 05 Mar 2026 13:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246672.1545811; Thu, 05 Mar 2026 13:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97z-00016c-8Q; Thu, 05 Mar 2026 13:52:35 +0000
Received: by outflank-mailman (input) for mailman id 1246672;
 Thu, 05 Mar 2026 13:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy97x-0008Mq-Di
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eb9b55a-189a-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:52:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D7F03ED7C;
 Thu,  5 Mar 2026 13:52:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D11D3EA68;
 Thu,  5 Mar 2026 13:52:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UhAgAqCKqWl0TgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:32 +0000
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
X-Inumbo-ID: 8eb9b55a-189a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qd6amYjyhOJLEFPf+RpsHO3ExuRDdjesrhezg6H1Mlk=;
	b=BUNgof1yRMbXZPLtFr0mlbJ4W+odssS1nSsOsSdr9HWD54zQjx/twYgJACUW7C+J9NVv0/
	3tpZNRqR/+w/2Z+FEV5BJRlOtpE/zXiDzsPYVHAmyeFAUefpxyqOAgZbnMRiawMlWoevD0
	phu2C9hM4VCXPdPQ3bM0ocuE5763JCo=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qd6amYjyhOJLEFPf+RpsHO3ExuRDdjesrhezg6H1Mlk=;
	b=BUNgof1yRMbXZPLtFr0mlbJ4W+odssS1nSsOsSdr9HWD54zQjx/twYgJACUW7C+J9NVv0/
	3tpZNRqR/+w/2Z+FEV5BJRlOtpE/zXiDzsPYVHAmyeFAUefpxyqOAgZbnMRiawMlWoevD0
	phu2C9hM4VCXPdPQ3bM0ocuE5763JCo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for live update
Date: Thu,  5 Mar 2026 14:52:01 +0100
Message-ID: <20260305135208.2208663-5-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.79
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 66EA1212CCF
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Communicate the global quota settings via the GLOBAL_QUOTA_DATA
record to the new Xenstore instance.

This avoids to lose global quota settings done via xenstore-control.

In theory it would be possible to drop any quota related command line
parameters in the live update case, but they don't do any harm, as
the record data is applied on top of the command line data.

For soft-quota just prepend "soft-" to the quota name.

Use sub-functions for building and analyzing the quota part of the
migration stream, as they will be reused for per-domain quotas.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 123 +++++++++++++++++++++++++++++++++++++++
 tools/xenstored/domain.h |   2 +
 tools/xenstored/lu.c     |   6 ++
 3 files changed, 131 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index acdcaa769e..694ae58973 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1332,6 +1332,27 @@ int do_set_feature(const void *ctx, struct connection *conn,
 	return 0;
 }
 
+static bool parse_quota_name(const char *name, unsigned int *qidx,
+			     unsigned int *idx)
+{
+	unsigned int q;
+
+	if (strncmp(name, "soft-", 5)) {
+		*idx = Q_IDX_HARD;
+	} else {
+		*idx = Q_IDX_SOFT;
+		name += 5;
+	}
+	for (q = 0; q < ACC_N; q++) {
+		if (quota_adm[q].name && !strcmp(quota_adm[q].name, name)) {
+			*qidx = q;
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static int close_xgt_handle(void *_handle)
 {
 	xengnttab_close(*(xengnttab_handle **)_handle);
@@ -2001,6 +2022,61 @@ void read_state_connection(const void *ctx, const void *state)
 	}
 }
 
+static unsigned int get_quota_size(struct quota *quota, unsigned int *len)
+{
+	unsigned int q;
+	unsigned int n = 0;
+
+	for (q = 0; q < ACC_N; q++) {
+		if (!quota_adm[q].name)
+			continue;
+		if (quota[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {
+			n++;
+			*len += strlen(quota_adm[q].name) + 1;
+		}
+		if (quota[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
+			n++;
+			*len += strlen(quota_adm[q].name) + 5 + 1;
+		}
+	}
+
+	return n;
+}
+
+static void build_quota_data(struct quota *quota, uint32_t *val, char *name)
+{
+	unsigned int q;
+	unsigned int n = 0;
+
+	for (q = 0; q < ACC_N; q++) {
+		if (!quota_adm[q].name)
+			continue;
+		if (quota[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {
+			val[n++] = quota[q].val[Q_IDX_HARD];
+			strcpy(name, quota_adm[q].name);
+			name += strlen(name) + 1;
+		}
+		if (quota[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
+			val[n++] = quota[q].val[Q_IDX_SOFT];
+			strcpy(name, "soft-");
+			strcpy(name + 5, quota_adm[q].name);
+			name += strlen(name) + 1;
+		}
+	}
+}
+
+static void parse_quota_data(const uint32_t *val, const char *name,
+			     unsigned int n, struct quota *quota)
+{
+	unsigned int i, q, idx;
+
+	for (i = 0; i < n; i++) {
+		if (!parse_quota_name(name, &q, &idx))
+			quota[q].val[idx] = val[i];
+		name += strlen(name) + 1;
+	}
+}
+
 static int dump_state_domain(const void *k, void *v, void *arg)
 {
 	struct domain *domain = v;
@@ -2049,6 +2125,53 @@ void read_state_domain(const void *ctx, const void *state, unsigned int version)
 		domain->features = sd->features;
 }
 
+const char *dump_state_glb_quota(FILE *fp)
+{
+	struct xs_state_record_header *head;
+	struct xs_state_glb_quota *glb;
+	void *record;
+	unsigned int n_quota;
+	unsigned int len = sizeof(*glb);
+	size_t ret;
+
+	n_quota = get_quota_size(quotas, &len);
+	len += n_quota * sizeof(glb->quota_val[0]);
+	len = ROUNDUP(len, 3);
+
+	record = talloc_size(NULL, len + sizeof(*head));
+	if (!record)
+		return "Dump global quota allocation error";
+
+	head = record;
+	head->type = XS_STATE_TYPE_GLB_QUOTA;
+	head->length = len;
+
+	glb = (struct xs_state_glb_quota *)(head + 1);
+	glb->n_dom_quota = n_quota;
+	glb->n_glob_quota = 0;
+
+	build_quota_data(quotas, glb->quota_val,
+			 (char *)(glb->quota_val + n_quota));
+
+	ret = fwrite(record, len + sizeof(*head), 1, fp);
+
+	talloc_free(record);
+
+	if (ret != 1 || dump_state_align(fp))
+		return "Dump global quota error";
+
+	return NULL;
+}
+
+void read_state_glb_quota(const void *ctx, const void *state)
+{
+	const struct xs_state_glb_quota *glb = state;
+	unsigned int n_quota = glb->n_dom_quota + glb->n_glob_quota;
+	const char *name = (const char *)(glb->quota_val + n_quota);
+
+	parse_quota_data(glb->quota_val, name, n_quota, quotas);
+}
+
 struct domain_acc {
 	unsigned int domid;
 	int nodes;
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index a6db358fdc..62ce3b3166 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -173,10 +173,12 @@ void wrl_apply_debit_trans_commit(struct connection *conn);
 
 const char *dump_state_connections(FILE *fp);
 const char *dump_state_domains(FILE *fp);
+const char *dump_state_glb_quota(FILE *fp);
 
 void read_state_connection(const void *ctx, const void *state);
 void read_state_domain(const void *ctx, const void *state,
 		       unsigned int version);
+void read_state_glb_quota(const void *ctx, const void *state);
 
 struct hashtable *domain_check_acc_init(void);
 void domain_check_acc_add(const struct node *node, struct hashtable *domains);
diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index fa8395eb1e..eaffdbc69e 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -192,6 +192,9 @@ void lu_read_state(void)
 		case XS_STATE_TYPE_DOMAIN:
 			read_state_domain(ctx, state.buf, version);
 			break;
+		case XS_STATE_TYPE_GLB_QUOTA:
+			read_state_glb_quota(ctx, state.buf);
+			break;
 		default:
 			xprintf("live-update: unknown state record %08x\n",
 				head.type);
@@ -319,6 +322,9 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 	}
 
 	ret = dump_state_global(fp);
+	if (ret)
+		goto out;
+	ret = dump_state_glb_quota(fp);
 	if (ret)
 		goto out;
 	ret = dump_state_connections(fp);
-- 
2.53.0


