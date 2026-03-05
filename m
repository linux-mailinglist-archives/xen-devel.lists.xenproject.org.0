Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCq3JaGKqWki+gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4091212C77
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246665.1545780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97j-0000Bm-Jb; Thu, 05 Mar 2026 13:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246665.1545780; Thu, 05 Mar 2026 13:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97j-00009A-H1; Thu, 05 Mar 2026 13:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1246665;
 Thu, 05 Mar 2026 13:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy97i-00008m-DD
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85022a56-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:52:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1AC93F8EE;
 Thu,  5 Mar 2026 13:52:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B19693EA68;
 Thu,  5 Mar 2026 13:52:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bx85Ko+KqWlTTgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:15 +0000
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
X-Inumbo-ID: 85022a56-189a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naD83YlbZGL27ewgtMQ3AW6P3o75RusmiaznD0RxnhM=;
	b=VygA5v6MXLuua+lePOlwuediEZc3tkLnBhqqXs+sgQuVO8Bg2/VeOUKNjocjGp+y9+ZaDj
	5D4XhXoAMIOz535DM0Q58UpbWbl1AHxlXSzNfaDG0NvLVJQfN3v5HwGBwrHLpqmGWpNGjv
	vnQzk2Xt1G6ZoyZ0B6ZV/s1xsZLJD4s=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naD83YlbZGL27ewgtMQ3AW6P3o75RusmiaznD0RxnhM=;
	b=VygA5v6MXLuua+lePOlwuediEZc3tkLnBhqqXs+sgQuVO8Bg2/VeOUKNjocjGp+y9+ZaDj
	5D4XhXoAMIOz535DM0Q58UpbWbl1AHxlXSzNfaDG0NvLVJQfN3v5HwGBwrHLpqmGWpNGjv
	vnQzk2Xt1G6ZoyZ0B6ZV/s1xsZLJD4s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 01/11] tools/libs/store: add get- and set-quota related functions
Date: Thu,  5 Mar 2026 14:51:58 +0100
Message-ID: <20260305135208.2208663-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.78
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C4091212C77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid,libxenstore.map:url];
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

Add functions for getting and setting Xenstore quota to libxenstore:

xs_get_quota_names(): get the names of the supported quota.

xs_get_global_quota(): get the value of one global quota.

xs_set_global_quota(): set the value of one global quota.

xs_get_domain_quota(): get the value of one quota of a domain.

xs_set_domain_quota(): set the value of one quota of a domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/xenstore.h         |  19 ++++++
 tools/libs/store/Makefile        |   2 +-
 tools/libs/store/libxenstore.map |   8 +++
 tools/libs/store/xs.c            | 111 +++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index 423422dc50..6b661e5895 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -277,6 +277,25 @@ bool xs_get_features_domain(struct xs_handle *h, unsigned int domid,
 bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
 			    unsigned int features);
 
+/* Get names of supported quota. */
+char **xs_get_quota_names(struct xs_handle *h, unsigned int *num);
+
+/* Get the value of one global quota. */
+bool xs_get_global_quota(struct xs_handle *h, char *quota,
+			 unsigned int *value);
+
+/* Set the value of one global quota. */
+bool xs_set_global_quota(struct xs_handle *h, char *quota,
+			 unsigned int value);
+
+/* Get the value of one domain quota. */
+bool xs_get_domain_quota(struct xs_handle *h, unsigned int domid,
+			 char *quota, unsigned int *value);
+
+/* Set the value of one domain quota. */
+bool xs_set_domain_quota(struct xs_handle *h, unsigned int domid,
+			 char *quota, unsigned int value);
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
index 8f4b90a3cf..dda37f7526 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1456,6 +1456,117 @@ bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
 	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
 }
 
+char **xs_get_quota_names(struct xs_handle *h, unsigned int *num)
+{
+	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
+	struct iovec iov[1];
+	char **quota;
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
+bool xs_get_global_quota(struct xs_handle *h, char *quota,
+			 unsigned int *value)
+{
+	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
+	struct iovec iov[2];
+
+	iov[0].iov_base = &msg;
+	iov[0].iov_len  = sizeof(msg);
+	iov[1].iov_base = quota;
+	iov[1].iov_len  = strlen(quota) + 1;
+
+	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), value);
+}
+
+bool xs_set_global_quota(struct xs_handle *h, char *quota,
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
+	iov[1].iov_base = quota;
+	iov[1].iov_len  = strlen(quota) + 1;
+	iov[2].iov_base = val_str;
+	iov[2].iov_len  = strlen(val_str) + 1;
+
+	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
+}
+
+bool xs_get_domain_quota(struct xs_handle *h, unsigned int domid,
+			 char *quota, unsigned int *value)
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
+	iov[2].iov_base = quota;
+	iov[2].iov_len  = strlen(quota) + 1;
+
+	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), value);
+}
+
+bool xs_set_domain_quota(struct xs_handle *h, unsigned int domid,
+			 char *quota, unsigned int value)
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
+	iov[2].iov_base = quota;
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


