Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD5B11F47
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057800.1425535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufILC-0008TY-6T; Fri, 25 Jul 2025 13:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057800.1425535; Fri, 25 Jul 2025 13:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufILC-0008QC-2b; Fri, 25 Jul 2025 13:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1057800;
 Fri, 25 Jul 2025 13:20:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufILB-0007Aq-1l
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:20:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1091a018-695a-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 15:19:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3648E1F747;
 Fri, 25 Jul 2025 13:19:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06E34134E8;
 Fri, 25 Jul 2025 13:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hSt8On6Eg2jtPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:19:58 +0000
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
X-Inumbo-ID: 1091a018-695a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IhT3MMF1W91hB+KCaP9wYp31IAPZIGuXwTH5M+yqdlw=;
	b=QTwR1YaRTqqTLVrpB37qFF0qkT5y4MhhgVR80//WIdGEO8fpH40XyAF7Tf+mZWAOwNDJnF
	AzFIDnNo9PeimWpZ73+G+jzxx2Rx0wUviCj67z5a9Qi4vzf9i19LUGKWGDVQsPHNrVHaHR
	FI8U4bwESeHJilGlzdsWyqLJLv52yds=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QTwR1YaR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IhT3MMF1W91hB+KCaP9wYp31IAPZIGuXwTH5M+yqdlw=;
	b=QTwR1YaRTqqTLVrpB37qFF0qkT5y4MhhgVR80//WIdGEO8fpH40XyAF7Tf+mZWAOwNDJnF
	AzFIDnNo9PeimWpZ73+G+jzxx2Rx0wUviCj67z5a9Qi4vzf9i19LUGKWGDVQsPHNrVHaHR
	FI8U4bwESeHJilGlzdsWyqLJLv52yds=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 5/7] tools/xenstored: support SET/GET_FEATURE commands
Date: Fri, 25 Jul 2025 15:19:26 +0200
Message-ID: <20250725131928.19286-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3648E1F747
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Add support for XS_SET_FEATURE and XS_GET_FEATURE to xenstored.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.c   |  4 +++
 tools/xenstored/domain.c | 60 ++++++++++++++++++++++++++++++++++++++++
 tools/xenstored/domain.h |  8 ++++++
 3 files changed, 72 insertions(+)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 37e4dd5a5b..3022efdce1 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2031,6 +2031,10 @@ static struct {
 	    { "SET_TARGET",    do_set_target,   XS_FLAG_PRIV },
 	[XS_RESET_WATCHES]     = { "RESET_WATCHES",     do_reset_watches },
 	[XS_DIRECTORY_PART]    = { "DIRECTORY_PART",    send_directory_part },
+	[XS_GET_FEATURE]       =
+	    { "GET_FEATURE",   do_get_feature,  XS_FLAG_PRIV },
+	[XS_SET_FEATURE]       =
+	    { "SET_FEATURE",   do_set_feature,  XS_FLAG_PRIV },
 };
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type)
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 24ee99cbc6..2362216a7a 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1243,6 +1243,66 @@ int do_reset_watches(const void *ctx, struct connection *conn,
 	return 0;
 }
 
+int do_get_feature(const void *ctx, struct connection *conn,
+		   struct buffered_data *in)
+{
+	const char *vec[1];
+	unsigned int n_args;
+	unsigned int domid;
+	const struct domain *domain;
+	unsigned int features;
+	char *result;
+
+	n_args = get_strings(in, vec, ARRAY_SIZE(vec));
+	if (n_args > 1)
+		return EINVAL;
+
+	if (n_args == 1) {
+		domid = atoi(vec[0]);
+		domain = find_or_alloc_existing_domain(domid);
+		if (!domain)
+			return ENOENT;
+		features = domain->features;
+	} else
+		features = XENSTORE_FEATURES;
+
+	result = talloc_asprintf(ctx, "%u", features);
+	if (!result)
+		return ENOMEM;
+
+	send_reply(conn, XS_GET_FEATURE, result, strlen(result) + 1);
+
+	return 0;
+}
+
+int do_set_feature(const void *ctx, struct connection *conn,
+		   struct buffered_data *in)
+{
+	const char *vec[2];
+	unsigned int domid;
+	struct domain *domain;
+	unsigned int features;
+
+	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
+		return EINVAL;
+
+	domid = atoi(vec[0]);
+	features = atoi(vec[1]);
+	domain = find_or_alloc_existing_domain(domid);
+	if (!domain)
+		return ENOENT;
+	if (domain->introduced)
+		return EBUSY;
+	if (features & ~XENSTORE_FEATURES)
+		return EINVAL;
+
+	domain->features = features;
+
+	send_ack(conn, XS_SET_FEATURE);
+
+	return 0;
+}
+
 static int close_xgt_handle(void *_handle)
 {
 	xengnttab_close(*(xengnttab_handle **)_handle);
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 8bfaca8f90..94481fdcc0 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -82,6 +82,14 @@ int do_get_domain_path(const void *ctx, struct connection *conn,
 int do_reset_watches(const void *ctx, struct connection *conn,
 		     struct buffered_data *in);
 
+/* Get global or per domain server features */
+int do_get_feature(const void *ctx, struct connection *conn,
+		   struct buffered_data *in);
+
+/* Set per domain server features */
+int do_set_feature(const void *ctx, struct connection *conn,
+		   struct buffered_data *in);
+
 void domain_early_init(void);
 void domain_init(int evtfd);
 void dom0_init(void);
-- 
2.43.0


