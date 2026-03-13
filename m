Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJyJGkXBs2mEagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C527EF61
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253347.1549624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFa-0003jM-S3; Fri, 13 Mar 2026 07:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253347.1549624; Fri, 13 Mar 2026 07:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFa-0003hm-Oi; Fri, 13 Mar 2026 07:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1253347;
 Fri, 13 Mar 2026 07:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFZ-0003h2-U2
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4c34d4d-1eb0-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:47:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D0BC4E3F0;
 Fri, 13 Mar 2026 07:47:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA916403F6;
 Fri, 13 Mar 2026 07:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KjFkMC7Bs2mpGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:47:58 +0000
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
X-Inumbo-ID: f4c34d4d-1eb0-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/8] tools/xenstored: allow domU to get own features
Date: Fri, 13 Mar 2026 08:47:44 +0100
Message-ID: <20260313074751.2904215-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
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
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 632C527EF61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expand the XS_GET_FEATURE command to allow an unprivileged domain to
read its own available features. While this information is available
via the related field in the shared page used for communication with
Xenstore, user land components of the domU would need special support
in the related kernel driver to obtain that data. With supporting the
XS_GET_FEATURE for that purpose, only an up to date libxenstore is
needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore.txt   |  9 +++++----
 tools/xenstored/core.c   |  3 +--
 tools/xenstored/domain.c | 16 +++++++++++-----
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 4eccbc2f7f..8a2c19d116 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -427,13 +427,14 @@ SET_FEATURE		<domid>|<value>|
 	to set a bit for a feature not being supported by the running
 	Xenstore will be denied. Providing no <domid> with the
 	GET_FEATURE command will return the features which are supported
-	by Xenstore.
+	by Xenstore for the domain issuing the command.
 
 	SET_FEATURE for a domain will be rejected after the INTRODUCE
-	command for this domain has been sent to xenstored.
+	command for this domain has been sent to xenstored. This has the
+	effect that dom0 will always have all supported features enabled.
 
-	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
-	than by dom0.
+	xenstored prevents the use of GET_FEATURE with a domid specified
+	and SET_FEATURE other than by dom0.
 
 GET_QUOTA		[[<domid>|]<quota>|]	<value>|
 SET_QUOTA		[<domid>|]<quota>|<value>|
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index e283d47184..09f1390f14 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2030,8 +2030,7 @@ static struct {
 	    { "SET_TARGET",    do_set_target,   XS_FLAG_PRIV },
 	[XS_RESET_WATCHES]     = { "RESET_WATCHES",     do_reset_watches },
 	[XS_DIRECTORY_PART]    = { "DIRECTORY_PART",    send_directory_part },
-	[XS_GET_FEATURE]       =
-	    { "GET_FEATURE",   do_get_feature,  XS_FLAG_PRIV },
+	[XS_GET_FEATURE]       = { "GET_FEATURE",       do_get_feature },
 	[XS_SET_FEATURE]       =
 	    { "SET_FEATURE",   do_set_feature,  XS_FLAG_PRIV },
 	[XS_GET_QUOTA]         =
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index c0bc8a3eb7..ebeced3228 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1293,17 +1293,23 @@ int do_get_feature(const void *ctx, struct connection *conn,
 	char *result;
 
 	n_args = get_strings(in, vec, ARRAY_SIZE(vec));
-	if (n_args > 1)
-		return EINVAL;
 
-	if (n_args == 1) {
+	if (!n_args) {
+		features = conn->domain ? conn->domain->features
+					: XENSTORE_FEATURES;
+	} else {
+		if (domain_is_unprivileged(conn))
+			return EACCES;
+
+		if (n_args > 1)
+			return EINVAL;
+
 		domid = atoi(vec[0]);
 		domain = find_or_alloc_existing_domain(domid);
 		if (!domain)
 			return ENOENT;
 		features = domain->features;
-	} else
-		features = XENSTORE_FEATURES;
+	}
 
 	result = talloc_asprintf(ctx, "%u", features);
 	if (!result)
-- 
2.53.0


