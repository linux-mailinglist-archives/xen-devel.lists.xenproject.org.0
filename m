Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C143B11F43
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057790.1425495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIKp-0006vk-3F; Fri, 25 Jul 2025 13:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057790.1425495; Fri, 25 Jul 2025 13:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIKo-0006tt-Vf; Fri, 25 Jul 2025 13:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1057790;
 Fri, 25 Jul 2025 13:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufIKn-0006ft-TZ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:19:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 032de031-695a-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 15:19:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9FC91F7A0;
 Fri, 25 Jul 2025 13:19:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A617134E8;
 Fri, 25 Jul 2025 13:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id r5VKIGiEg2jSPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:19:36 +0000
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
X-Inumbo-ID: 032de031-695a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/rhJqj1Rq5FR9jY2WqwJfa3ZKn4d5Db8TqETdaGs2I=;
	b=MjXlZAhb9OxJGnEf8g1JwMdOgy6izUIzlgflENKaRuVZITtKlTle9yWSS84uDpwVTqhqIV
	TEZVFrUWfLCLaqDAD9itv+gh2U6VxVWMHiDk+iBSTyr1yEsEKVxl2jlqOj7SkI11epi5cN
	+7fFabyAHVQRU7JWPoTLRNeXyBkGnZw=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/rhJqj1Rq5FR9jY2WqwJfa3ZKn4d5Db8TqETdaGs2I=;
	b=MjXlZAhb9OxJGnEf8g1JwMdOgy6izUIzlgflENKaRuVZITtKlTle9yWSS84uDpwVTqhqIV
	TEZVFrUWfLCLaqDAD9itv+gh2U6VxVWMHiDk+iBSTyr1yEsEKVxl2jlqOj7SkI11epi5cN
	+7fFabyAHVQRU7JWPoTLRNeXyBkGnZw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 1/7] tools/libs/store: add get- and set-feature related functions
Date: Fri, 25 Jul 2025 15:19:22 +0200
Message-ID: <20250725131928.19286-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add functions for getting and setting Xenstore features to libxenstore:

xs_get_features_supported(): return the features supported by the
running Xenstore implementation as defined in xs_wire.h via the
XENSTORE_SERVER_FEATURE_* macros.

xs_get_features_domain(): return the features offered for a specific
domain.

xs_set_features_domain(): set the features available for a specific
domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/include/xenstore.h         | 13 +++++++++
 tools/libs/store/Makefile        |  2 +-
 tools/libs/store/libxenstore.map |  6 ++++
 tools/libs/store/xs.c            | 49 ++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index a442252849..423422dc50 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -264,6 +264,19 @@ bool xs_path_is_subpath(const char *parent, const char *child);
  */
 bool xs_is_domain_introduced(struct xs_handle *h, unsigned int domid);
 
+/* Get the features supported by Xenstore.
+ * Returned as a bitmap of XENSTORE_SERVER_FEATURE_* values.
+ */
+bool xs_get_features_supported(struct xs_handle *h, unsigned int *features);
+
+/* Get the features available for a given domain. */
+bool xs_get_features_domain(struct xs_handle *h, unsigned int domid,
+			    unsigned int *features);
+
+/* Set the features available for a given domain. */
+bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
+			    unsigned int features);
+
 char *xs_control_command(struct xs_handle *h, const char *cmd,
 			 void *data, unsigned int len);
 /* Deprecated: use xs_control_command() instead. */
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 0649cf8307..fed43b0008 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR = 4
-MINOR = 0
+MINOR = 1
 version-script := libxenstore.map
 
 ifeq ($(CONFIG_Linux),y)
diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
index 7e6c7bdd30..cd9df86749 100644
--- a/tools/libs/store/libxenstore.map
+++ b/tools/libs/store/libxenstore.map
@@ -39,3 +39,9 @@ VERS_4.0 {
 		xs_strings_to_perms;
 	local: *; /* Do not expose anything by default */
 };
+VERS_4.1 {
+	global:
+		xs_get_features_supported;
+		xs_get_features_domain;
+		xs_set_features_domain;
+} VERS_4.0;
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index cf3266807f..8f4b90a3cf 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1407,6 +1407,55 @@ out:
 	return port;
 }
 
+static bool xs_uint(char *reply, unsigned int *uintval)
+{
+	if (!reply)
+		return false;
+
+	*uintval = strtoul(reply, NULL, 10);
+	free(reply);
+
+	return true;
+}
+
+bool xs_get_features_supported(struct xs_handle *h, unsigned int *features)
+{
+	struct xsd_sockmsg msg = { .type = XS_GET_FEATURE };
+	struct iovec iov[1];
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+
+	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), features);
+}
+
+bool xs_get_features_domain(struct xs_handle *h, unsigned int domid,
+			    unsigned int *features)
+{
+	return xs_uint(single_with_domid(h, XS_GET_FEATURE, domid), features);
+}
+
+bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
+			    unsigned int features)
+{
+	struct xsd_sockmsg msg = { .type = XS_SET_FEATURE };
+	char domid_str[MAX_STRLEN(domid)];
+	char feat_str[MAX_STRLEN(features)];
+	struct iovec iov[3];
+
+	snprintf(domid_str, sizeof(domid_str), "%u", domid);
+	snprintf(feat_str, sizeof(feat_str), "%u", features);
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = domid_str;
+	iov[1].iov_len  = strlen(domid_str) + 1;
+	iov[2].iov_base = feat_str;
+	iov[2].iov_len  = strlen(feat_str) + 1;
+
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
+}
+
 char *xs_control_command(struct xs_handle *h, const char *cmd,
 			 void *data, unsigned int len)
 {
-- 
2.43.0


