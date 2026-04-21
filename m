Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hmU1GHkq52nx4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CB437C85
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288420.1568703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kV-000391-LS; Tue, 21 Apr 2026 07:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288420.1568703; Tue, 21 Apr 2026 07:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kV-000377-Hf; Tue, 21 Apr 2026 07:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1288420;
 Tue, 21 Apr 2026 07:42:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5kU-00036B-DG
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5kR-00Aiof-Fk
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a55-2eae-0a2a0a5409dd-0a2a4502a498-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:20 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a5c-af86-0a2a45020019-c387df83c1e6-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:20 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59AF35BCE1;
 Tue, 21 Apr 2026 07:42:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B2A7593AF;
 Tue, 21 Apr 2026 07:42:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 53KPBVsq52n9NQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ReIly1atvh5rbm6DWS8EB7RxMnUs54f1iHdpQVFl9VA=;
	b=IFWssi8NDTX1FX3vbVE7W0gyiQmMrE0DPQaWlgYJLSoTyNvF9Q8GrWE5K7KLX1Hiu/zyNl
	RPhXtKLGMt8bc23G5M0gJaPmXMNjlIQynNxIGFQToS0XnPUlBMU7mg7clvvwD+Iyhib0h7
	Upqb4LsW3JHhH6Cwzs4WjOgKtjkHqZY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ReIly1atvh5rbm6DWS8EB7RxMnUs54f1iHdpQVFl9VA=;
	b=sNJz12Ks7Ia8ZjR5xXJWOPjYBd7aqAtUctmXudA44EQj5AveCbAzLXwER1TQBKv5dmu5Dm
	wH7rRKVB2RxfLWbwobfY0XHGPGpHhFg9gBZRM0ogEIs1no0zRZVkroU9VqhNGoM7RcAcMm
	vBhjpl0qwvG0NmXvgizRbwzjfYO5Hqw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 1/9] tools/xenstored: allow domU to get own features
Date: Tue, 21 Apr 2026 09:42:03 +0200
Message-ID: <20260421074211.308473-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-720697/1776757340-81772161-E6BDC29E/0/0
X-purgate-type: clean
X-purgate-size: 3357
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C94CB437C85
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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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
index 34cb266e8a..93244d0ac4 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2031,8 +2031,7 @@ static struct {
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
index 1684f6dee7..b0b339f569 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1323,10 +1323,17 @@ int do_get_feature(const void *ctx, struct connection *conn,
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
 		domid = parse_domid(vec[0]);
 		if (errno)
 			return errno;
@@ -1334,8 +1341,7 @@ int do_get_feature(const void *ctx, struct connection *conn,
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


