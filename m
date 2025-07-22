Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844DCB0DCEB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052683.1421464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDe2-0006ps-Qs; Tue, 22 Jul 2025 14:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052683.1421464; Tue, 22 Jul 2025 14:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDe2-0006mz-MP; Tue, 22 Jul 2025 14:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1052683;
 Tue, 22 Jul 2025 14:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ueDe1-0005Q3-0i
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:07:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22b44331-6705-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 16:07:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F021C211A8;
 Tue, 22 Jul 2025 14:06:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C68F013A32;
 Tue, 22 Jul 2025 14:06:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ktrtLgObf2jTIAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 22 Jul 2025 14:06:59 +0000
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
X-Inumbo-ID: 22b44331-6705-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753193220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEcsRHIDGTA5aOeJJG/B8yR+BciXZq054xn8sSP9ApI=;
	b=e0l5xblAWqYqqgs4NpIozYs553ooN/tLVfq4OpQxZfac/F0yGAVGFVCcLfu39DA0XlUzBQ
	VABDYnSyUetijL9Jfibv+Mz7+yTZqUjoROE9KNL/xuSd7FusaU8VdUxOF3Q62OzBDpf3G/
	8u5iL1BL67ZqU6nIxBJmrLIXKd5iW3s=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gwXXJlJc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753193219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEcsRHIDGTA5aOeJJG/B8yR+BciXZq054xn8sSP9ApI=;
	b=gwXXJlJcCAkY+2EOyJlF9cS3bQwOOAPoYrjcOjiBFmiX6ImkiF2GQR6OBlpdSwiJml771s
	0cqUtS+ORIu+HltNbC8zIDUqh2SkuVUB9qlxlGc3t5FyH5S61KBjwcUAKcDA3VuqqUh4G4
	IDJhRzEdIgYq95Z8Gx5M3XFz97Ev+V0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 5/7] tools/xenstored: support SET/GET_FEATURE commands
Date: Tue, 22 Jul 2025 16:06:26 +0200
Message-ID: <20250722140628.28947-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722140628.28947-1-jgross@suse.com>
References: <20250722140628.28947-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F021C211A8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Add support for XS_SET_FEATURE and XS_GET_FEATURE to xenstored.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
index f6d24bc13a..3969b82967 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1244,6 +1244,66 @@ int do_reset_watches(const void *ctx, struct connection *conn,
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


