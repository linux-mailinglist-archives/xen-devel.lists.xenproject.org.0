Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FIXAiHhsmmXQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:52:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7953274E9B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252573.1549229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iKF-00013N-NI; Thu, 12 Mar 2026 15:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252573.1549229; Thu, 12 Mar 2026 15:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iKF-00010p-JB; Thu, 12 Mar 2026 15:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1252573;
 Thu, 12 Mar 2026 15:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iKE-0007Yh-V1
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f33052-1e2b-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 16:51:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E1A2E5BF6E;
 Thu, 12 Mar 2026 15:51:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B640B40047;
 Thu, 12 Mar 2026 15:51:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2H/xKhXhsmk0TgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:49 +0000
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
X-Inumbo-ID: 61f33052-1e2b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbkAscoNejZs6bhgSJdq6eOm+4nfCFdywVAJjLWBgu4=;
	b=Q6dm5VnkAtxVDfcyUHMZrNEsdbVHl3rRihInZ1jKFkTlcJYiSuIvSJX6ujXxqNJNNoXdEO
	nXRaNR/hjr5ljGR5CbqwCCu+HSTCtSucFqVGG3XqZM6I8IwiZjW/FYz3hPxb6qpBNVV1rZ
	9hekkPrDq4+/+uno9hwh8kqB8ZcKBlA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Q6dm5Vnk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbkAscoNejZs6bhgSJdq6eOm+4nfCFdywVAJjLWBgu4=;
	b=Q6dm5VnkAtxVDfcyUHMZrNEsdbVHl3rRihInZ1jKFkTlcJYiSuIvSJX6ujXxqNJNNoXdEO
	nXRaNR/hjr5ljGR5CbqwCCu+HSTCtSucFqVGG3XqZM6I8IwiZjW/FYz3hPxb6qpBNVV1rZ
	9hekkPrDq4+/+uno9hwh8kqB8ZcKBlA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 8/8] tools/xs-clients: fix output of "xenstore-list -p /"
Date: Thu, 12 Mar 2026 16:51:02 +0100
Message-ID: <20260312155102.2862824-9-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312155102.2862824-1-jgross@suse.com>
References: <20260312155102.2862824-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E7953274E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When calling "xenstore-list -p /" it will prepend all listed keys
with "//" instead of "/".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xs-clients/xenstore_client.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/xs-clients/xenstore_client.c b/tools/xs-clients/xenstore_client.c
index 3b02d3a196..29d840df84 100644
--- a/tools/xs-clients/xenstore_client.c
+++ b/tools/xs-clients/xenstore_client.c
@@ -568,13 +568,17 @@ perform(enum mode mode, int optind, int argc, char **argv, struct xs_handle *xsh
         case MODE_list: {
             unsigned int i, num;
             char **list = xs_directory(xsh, xth, argv[optind], &num);
+            const char *pref = argv[optind];
+
             if (list == NULL) {
                 warnx("could not list path %s", argv[optind]);
                 return 1;
             }
+            if (prefix && !strcmp(pref, "/"))
+                pref = "";
             for (i = 0; i < num; i++) {
                 if (prefix)
-                    output("%s/", argv[optind]);
+                    output("%s/", pref);
                 output("%s\n", list[i]);
             }
             free(list);
-- 
2.53.0


