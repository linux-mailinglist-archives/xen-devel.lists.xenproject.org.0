Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHiAEW+jjWlh5gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:54:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4D12C128
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228593.1534738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTP9-0008NP-TK; Thu, 12 Feb 2026 09:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228593.1534738; Thu, 12 Feb 2026 09:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTP9-0008KX-Q5; Thu, 12 Feb 2026 09:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1228593;
 Thu, 12 Feb 2026 09:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lKKS=AQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vqTP7-0008KQ-UE
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:54:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3fbcfd0-07f8-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 10:54:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED0A43E715;
 Thu, 12 Feb 2026 09:54:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0AC13EA62;
 Thu, 12 Feb 2026 09:54:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /jLiLVajjWmdfwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Feb 2026 09:54:30 +0000
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
X-Inumbo-ID: d3fbcfd0-07f8-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770890071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LxtsReFboMwCCMbjgL/hhFV3riAXKanj5BA7Uy+zhpg=;
	b=OOr0cC+XJGEuuIfgEy5BMDZ6STxBtSoworJyUPlmRlmjRGcPRxrFzGdIDG0I+trzSJbwbJ
	DofxZZLrmZDgdJVX7jruqpymOB7eS1q30vFOdgJ+EH9AwIanOKTHgITa50TlQh7lU4nCL4
	rNOPD42yLkPRNi/27DwYSJpV0Wb4M5M=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gvaVZe6t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770890070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LxtsReFboMwCCMbjgL/hhFV3riAXKanj5BA7Uy+zhpg=;
	b=gvaVZe6tODZ2wr19weMpOjL3cUzDZPhSg+4Dw2HqKQ72yLXSTYScpmH9VGYqon8TMff13q
	u8rZ7qv+wBf4R36Y66bARP9gQLY6pNWWCj7KvUxe3llJ8ui67yVaJUrGgvy3JEDf/+DTnJ
	AxN0ja5a8HsbSnRT4jr5rcGqF2jtYd8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xenstored: fix live update
Date: Thu, 12 Feb 2026 10:54:27 +0100
Message-ID: <20260212095427.143177-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 91F4D12C128
X-Rspamd-Action: no action

Commit e5b0a940557 ("tools/xenstored: Auto-introduce domains") broke
xenstored live update, as init_domains() will be skipped when live
update is detected to have happened. This will leave priv_domid and
store_domid set as invalid.

Fix that by calling init_domains() in live update case, too. In case
of live update skip introducing any found domains, as this will be done
when reading the live update state.

Fixes: e5b0a940557 ("tools/xenstored: Auto-introduce domains")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |  3 ++-
 tools/xenstored/domain.c | 20 +++++++++++++-------
 tools/xenstored/domain.h |  2 +-
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 64c478a801..d509736c32 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2763,7 +2763,7 @@ int main(int argc, char *argv[])
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
-		init_domains();
+		init_domains(false);
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
@@ -3109,6 +3109,7 @@ void read_state_global(const void *ctx, const void *state)
 	set_socket_fd(glb->socket_fd);
 
 	domain_init(glb->evtchn_fd);
+	init_domains(true);
 }
 
 static void add_buffered_data(struct buffered_data *bdata,
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 10ac1c1a8f..e453b3061f 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1344,7 +1344,7 @@ static bool init_domain(unsigned int domid)
 
 	return true;
 }
-void init_domains(void)
+void init_domains(bool live_update)
 {
 	unsigned int *domids = NULL;
 	unsigned int nr_domids = 0;
@@ -1356,12 +1356,15 @@ void init_domains(void)
 
 	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, &caps,
 					      &unique_id)) {
-		nr_domids++;
-		domids = talloc_realloc(NULL, domids, unsigned int, nr_domids);
-		if (!domids)
-			barf_perror("Failed to reallocate domids");
-
-		domids[nr_domids - 1] = domid;
+		if (!live_update) {
+			nr_domids++;
+			domids = talloc_realloc(NULL, domids,
+						unsigned int, nr_domids);
+			if (!domids)
+				barf_perror("Failed to reallocate domids");
+
+			domids[nr_domids - 1] = domid;
+		}
 
 		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL) {
 			/*
@@ -1397,6 +1400,9 @@ void init_domains(void)
 	snprintf(store_domain_path, sizeof(store_domain_path),
 		 "/local/domain/%u", store_domid);
 
+	if (live_update)
+		return;
+
 	/*
 	 * Privileged domid must be first to setup structures for firing the
 	 * special watches.
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 3b1fce74cf..28186ccac0 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -92,7 +92,7 @@ int do_set_feature(const void *ctx, struct connection *conn,
 
 void domain_early_init(void);
 void domain_init(int evtfd);
-void init_domains(void);
+void init_domains(bool live_update);
 void stubdom_init(bool live_update);
 void domain_deinit(void);
 void ignore_connection(struct connection *conn, unsigned int err);
-- 
2.53.0


