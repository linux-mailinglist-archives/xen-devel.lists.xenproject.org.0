Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPReKuhivWlh9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:08:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BB2DC565
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258182.1552350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bSS-0007Hv-O7; Fri, 20 Mar 2026 15:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258182.1552350; Fri, 20 Mar 2026 15:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bSS-0007Fk-Kz; Fri, 20 Mar 2026 15:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1258182;
 Fri, 20 Mar 2026 15:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bMX-0001Ve-1c
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:02:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e99463-246d-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 16:02:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95F194D27B;
 Fri, 20 Mar 2026 15:02:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7554842866;
 Fri, 20 Mar 2026 15:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WniTG21hvWnjXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:02:05 +0000
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
X-Inumbo-ID: c3e99463-246d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FYqa2/aDourOwOzPQpClM0FHHXiPvq6a2dggyIoDDM=;
	b=GBtKCSZwN71iawlNf2pdCyt1/RIcOJvcvlCzBXxiUw9lJ3UlgYmfNyl0TpI9JaBza2xR3j
	U1xys8D+qc99q0qW6tZAJkGgtHP6N1vAwlzKluHiAjEcQIW0hYZsydiSupsejnib/pRHOO
	UcDO6GqdG3/Nosj9LHy+qMiFcxLMPeg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FYqa2/aDourOwOzPQpClM0FHHXiPvq6a2dggyIoDDM=;
	b=GBtKCSZwN71iawlNf2pdCyt1/RIcOJvcvlCzBXxiUw9lJ3UlgYmfNyl0TpI9JaBza2xR3j
	U1xys8D+qc99q0qW6tZAJkGgtHP6N1vAwlzKluHiAjEcQIW0hYZsydiSupsejnib/pRHOO
	UcDO6GqdG3/Nosj9LHy+qMiFcxLMPeg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 08/12] tools/xenstored: implement the GET/SET_QUOTA commands
Date: Fri, 20 Mar 2026 16:01:16 +0100
Message-ID: <20260320150120.874878-9-jgross@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 249BB2DC565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the implementation of the GET_QUOTA and SET_QUOTA wire commands.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- refuse quota value Q_VAL_DISABLED (Anthony Perard)
- use talloc_strdup() (Anthony Perard)
- drop comments in domain.h (Anthony Perard)
---
 tools/xenstored/core.c   |   4 ++
 tools/xenstored/domain.c | 111 +++++++++++++++++++++++++++++++++++++++
 tools/xenstored/domain.h |   5 ++
 3 files changed, 120 insertions(+)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index dc63c97658..4786a2a82e 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2035,6 +2035,10 @@ static struct {
 	    { "GET_FEATURE",   do_get_feature,  XS_FLAG_PRIV },
 	[XS_SET_FEATURE]       =
 	    { "SET_FEATURE",   do_set_feature,  XS_FLAG_PRIV },
+	[XS_GET_QUOTA]         =
+	    { "GET_QUOTA",     do_get_quota,    XS_FLAG_PRIV },
+	[XS_SET_QUOTA]         =
+	    { "SET_QUOTA",     do_set_quota,    XS_FLAG_PRIV },
 };
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type)
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 7a8d285e64..1684f6dee7 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1399,6 +1399,117 @@ static bool parse_quota_name(const char *name, unsigned int *qidx,
 	return true;
 }
 
+int do_get_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in)
+{
+	const char *vec[2];
+	unsigned int n_pars;
+	unsigned int domid;
+	unsigned int q;
+	unsigned int idx;
+	char *resp;
+	const char *name;
+	const struct quota *quota;
+	const struct domain *domain;
+
+	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
+
+	if (n_pars > 2)
+		return EINVAL;
+
+	if (n_pars == 0) {
+		resp = talloc_strdup(ctx, "");
+		if (!resp)
+			return ENOMEM;
+		for (q = 0; q < ACC_N; q++) {
+			if (!quota_adm[q].name)
+				continue;
+			if (quotas[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {
+				resp = talloc_asprintf_append(resp, "%s%s",
+					*resp ? " " : "", quota_adm[q].name);
+				if (!resp)
+					return ENOMEM;
+			}
+			if (quotas[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
+				resp = talloc_asprintf_append(resp, "%s%s%s",
+					*resp ? " " : "", SOFT_PREFIX,
+					quota_adm[q].name);
+				if (!resp)
+					return ENOMEM;
+			}
+		}
+	} else {
+		if (n_pars == 1) {
+			quota = quotas;
+			name = vec[0];
+		} else {
+			domid = parse_domid(vec[0]);
+			if (errno)
+				return errno;
+			domain = find_or_alloc_existing_domain(domid);
+			if (!domain)
+				return ENOENT;
+			quota = domain->acc;
+			name = vec[1];
+		}
+
+		if (parse_quota_name(name, &q, &idx))
+			return EINVAL;
+
+		resp = talloc_asprintf(ctx, "%u", quota[q].val[idx]);
+		if (!resp)
+			return ENOMEM;
+	}
+
+	send_reply(conn, XS_GET_QUOTA, resp, strlen(resp) + 1);
+
+	return 0;
+}
+
+int do_set_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in)
+{
+	const char *vec[3];
+	unsigned int n_pars;
+	unsigned int domid;
+	unsigned int q;
+	unsigned int idx;
+	const char *name;
+	unsigned int val;
+	struct quota *quota;
+	struct domain *domain;
+
+	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
+
+	if (n_pars < 2 || n_pars > 3)
+		return EINVAL;
+
+	if (n_pars == 2) {
+		quota = quotas;
+		name = vec[0];
+		val = atoi(vec[1]);
+	} else {
+		domid = parse_domid(vec[0]);
+		if (errno)
+			return errno;
+		domain = find_or_alloc_existing_domain(domid);
+		if (!domain)
+			return ENOENT;
+		quota = domain->acc;
+		name = vec[1];
+		val = atoi(vec[2]);
+	}
+
+	if (parse_quota_name(name, &q, &idx) || val == Q_VAL_DISABLED)
+		return EINVAL;
+
+	quota[q].val[idx] = val;
+
+	send_ack(conn, XS_SET_QUOTA);
+
+	return 0;
+}
+
 static int close_xgt_handle(void *_handle)
 {
 	xengnttab_close(*(xengnttab_handle **)_handle);
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 8f23a82854..ca38b5e0ea 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -93,6 +93,11 @@ int do_get_feature(const void *ctx, struct connection *conn,
 int do_set_feature(const void *ctx, struct connection *conn,
 		   struct buffered_data *in);
 
+int do_get_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in);
+int do_set_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in);
+
 void domain_early_init(void);
 void domain_init(int evtfd);
 void init_domains(bool live_update);
-- 
2.53.0


