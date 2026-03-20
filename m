Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGG5F2dhvWl09QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:01:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6F2DC32F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258097.1552269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bM3-00022v-UV; Fri, 20 Mar 2026 15:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258097.1552269; Fri, 20 Mar 2026 15:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bM3-00020Z-R2; Fri, 20 Mar 2026 15:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1258097;
 Fri, 20 Mar 2026 15:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bM2-0001ko-AF
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:01:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af1bc027-246d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 16:01:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EE745BDF7;
 Fri, 20 Mar 2026 15:01:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F22F42866;
 Fri, 20 Mar 2026 15:01:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9A8BGkdhvWklXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:01:27 +0000
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
X-Inumbo-ID: af1bc027-246d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVitA9QfI8pYjyiyMqwV+9bQQuTZeeXyuUjW3egkMps=;
	b=XMIYwrezHJdLyDJW9qER38yfhWsvXSWgU+GReSZpkCKggxJ9IZQAajLEvXY3cM4MKxSoW4
	nB3WiWT4+tDWAzyKTSBdi9Hb2QSMilpKn4MNBfh+1XdrKcCQO7ok/PCiy4p9C2WNUzkA41
	+fyC6JGkYpIV2w2drra6jQxVx6HjqQE=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=SYGII5VN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVitA9QfI8pYjyiyMqwV+9bQQuTZeeXyuUjW3egkMps=;
	b=SYGII5VNzDgDbiK2Vqew2klU16gwU52rMGPw6CFurDToIEB2TK6GRb9r3TYQkHnaAKaQ8F
	eWETWH/RVOe/qHU59/t/ULFJacm9+dHal6FXW6zar9IiaNTU8uwKz+2xjWjWdLleIx/9E9
	qwiyFGfJUwvVL04tmVo0qyiu9XeC+7M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 01/12] tools/libs/store: add get- and set-quota related functions
Date: Fri, 20 Mar 2026 16:01:09 +0100
Message-ID: <20260320150120.874878-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320150120.874878-1-jgross@suse.com>
References: <20260320150120.874878-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[libxenstore.map:query timed out];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D6E6F2DC32F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add functions for getting and setting Xenstore quota to libxenstore:

xs_get_quota_names(): get the names of the supported quota.

xs_get_global_quota(): get the value of one global quota.

xs_set_global_quota(): set the value of one global quota.

xs_get_domain_quota(): get the value of one quota of a domain.

xs_set_domain_quota(): set the value of one quota of a domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- make string parameters const (Anthony Perard)
- add function descriptions to header (Anthony Perard)
---
 tools/include/xenstore.h         |  37 +++++++++++
 tools/libs/store/Makefile        |   2 +-
 tools/libs/store/libxenstore.map |   8 +++
 tools/libs/store/xs.c            | 111 +++++++++++++++++++++++++++++++
 4 files changed, 157 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index 423422dc50..bf6d767a22 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -277,6 +277,43 @@ bool xs_get_features_domain(struct xs_handle *h, unsigned int domid,
 bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
 			    unsigned int features);
 
+/* Get names of supported quota.
+ * Returns an array of quota names supported by Xenstore. On return
+ * num will contain the number of quota names in the array.
+ * Will return NULL on failure.
+ * The returned array should be freed via free() after usage, this will
+ * free the array AND the strings of the quota names.
+ */
+const char **xs_get_quota_names(struct xs_handle *h, unsigned int *num);
+
+/* Get the value of one global quota.
+ * Returns the global quota value specified by "quota" in "value".
+ * Return false on failure.
+ */
+bool xs_get_global_quota(struct xs_handle *h, const char *quota,
+			 unsigned int *value);
+
+/* Set the value of one global quota.
+ * Sets the global quota value specified by "quota" to "value".
+ * Return false on failure.
+ */
+bool xs_set_global_quota(struct xs_handle *h, const char *quota,
+			 unsigned int value);
+
+/* Get the value of one domain quota.
+ * Returns a domain's quota value specified by "quota" in "value".
+ * Return false on failure.
+ */
+bool xs_get_domain_quota(struct xs_handle *h, unsigned int domid,
+			 const char *quota, unsigned int *value);
+
+/* Set the value of one domain quota.
+ * Sets a domain's quota value specified by "quota" to "value".
+ * Return false on failure.
+ */
+bool xs_set_domain_quota(struct xs_handle *h, unsigned int domid,
+			 const char *quota, unsigned int value);
+
 char *xs_control_command(struct xs_handle *h, const char *cmd,
 			 void *data, unsigned int len);
 /* Deprecated: use xs_control_command() instead. */
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index fed43b0008..b52d1f35ad 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR = 4
-MINOR = 1
+MINOR = 2
 version-script := libxenstore.map
 
 ifeq ($(CONFIG_Linux),y)
diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
index cd9df86749..a08ddd549f 100644
--- a/tools/libs/store/libxenstore.map
+++ b/tools/libs/store/libxenstore.map
@@ -45,3 +45,11 @@ VERS_4.1 {
 		xs_get_features_domain;
 		xs_set_features_domain;
 } VERS_4.0;
+VERS_4.2 {
+	global:
+		xs_get_quota_names;
+		xs_get_global_quota;
+		xs_set_global_quota;
+		xs_get_domain_quota;
+		xs_set_domain_quota;
+} VERS_4.1;
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 8f4b90a3cf..06462445e0 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1456,6 +1456,117 @@ bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
 	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
+const char **xs_get_quota_names(struct xs_handle *h, unsigned int *num)
+{
+	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
+	struct iovec iov[1];
+	const char **quota;
+	char *reply;
+	char *c;
+	unsigned int i;
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+
+	reply = xs_talkv(h, iov, ARRAY_SIZE(iov), NULL);
+	if (!reply)
+		return NULL;
+
+	*num = 1;
+	for (c = reply; *c; c++)
+		if (*c == ' ')
+			(*num)++;
+
+	quota = malloc(*num * sizeof(char *) + strlen(reply) + 1);
+	c = (char *)(quota + *num);
+	strcpy(c, reply);
+	for (i = 0; i < *num; i++) {
+		quota[i] = c;
+		c = strchr(c, ' ');
+		if (c) {
+			*c = 0;
+			c++;
+		}
+	}
+
+	return quota;
+}
+
+bool xs_get_global_quota(struct xs_handle *h, const char *quota,
+			 unsigned int *value)
+{
+	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
+	struct iovec iov[2];
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (char *)quota;
+	iov[1].iov_len  = strlen(quota) + 1;
+
+	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), value);
+}
+
+bool xs_set_global_quota(struct xs_handle *h, const char *quota,
+			 unsigned int value)
+{
+	struct xsd_sockmsg msg = { .type = XS_SET_QUOTA };
+	char val_str[MAX_STRLEN(value)];
+	struct iovec iov[3];
+
+	snprintf(val_str, sizeof(val_str), "%u", value);
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = (char *)quota;
+	iov[1].iov_len  = strlen(quota) + 1;
+	iov[2].iov_base = val_str;
+	iov[2].iov_len  = strlen(val_str) + 1;
+
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
+}
+
+bool xs_get_domain_quota(struct xs_handle *h, unsigned int domid,
+			 const char *quota, unsigned int *value)
+{
+	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
+	char domid_str[MAX_STRLEN(domid)];
+	struct iovec iov[3];
+
+	snprintf(domid_str, sizeof(domid_str), "%u", domid);
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = domid_str;
+	iov[1].iov_len  = strlen(domid_str) + 1;
+	iov[2].iov_base = (char *)quota;
+	iov[2].iov_len  = strlen(quota) + 1;
+
+	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), value);
+}
+
+bool xs_set_domain_quota(struct xs_handle *h, unsigned int domid,
+			 const char *quota, unsigned int value)
+{
+	struct xsd_sockmsg msg = { .type = XS_SET_QUOTA };
+	char domid_str[MAX_STRLEN(domid)];
+	char val_str[MAX_STRLEN(value)];
+	struct iovec iov[4];
+
+	snprintf(domid_str, sizeof(domid_str), "%u", domid);
+	snprintf(val_str, sizeof(val_str), "%u", value);
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = domid_str;
+	iov[1].iov_len  = strlen(domid_str) + 1;
+	iov[2].iov_base = (char *)quota;
+	iov[2].iov_len  = strlen(quota) + 1;
+	iov[3].iov_base = val_str;
+	iov[3].iov_len  = strlen(val_str) + 1;
+
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
+}
+
 char *xs_control_command(struct xs_handle *h, const char *cmd,
 			 void *data, unsigned int len)
 {
-- 
2.53.0


