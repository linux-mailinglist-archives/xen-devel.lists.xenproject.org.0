Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKuKJhnhsmmWQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB03274E93
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252567.1549220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iKB-0000i3-EV; Thu, 12 Mar 2026 15:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252567.1549220; Thu, 12 Mar 2026 15:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iKB-0000dG-Ar; Thu, 12 Mar 2026 15:51:47 +0000
Received: by outflank-mailman (input) for mailman id 1252567;
 Thu, 12 Mar 2026 15:51:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iK9-0007Yh-63
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea2c491-1e2b-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 16:51:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58BCB4D427;
 Thu, 12 Mar 2026 15:51:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C2344004B;
 Thu, 12 Mar 2026 15:51:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gNM5CRDhsmkxTgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:44 +0000
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
X-Inumbo-ID: 5ea2c491-1e2b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQsTKa0///LGiIF+n+xK56M52snk+N3Xd7rOsp9V8tw=;
	b=iONHjMJft3B3v6PcKT8EAyXAXkdMfAeCCmQeTHPkzMOi2eOp4qLT28YW7sYTKjRXDRLyLM
	oTPrnZwSoAoPjTOY45re0Dg7AE0THktwK2wLWsjZEWbw79Tu6oAhMiN/FzLH1PrvlyYUwP
	Xd8BM57NLtOrlL65hqC0FQiy4ivqkVE=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iONHjMJf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQsTKa0///LGiIF+n+xK56M52snk+N3Xd7rOsp9V8tw=;
	b=iONHjMJft3B3v6PcKT8EAyXAXkdMfAeCCmQeTHPkzMOi2eOp4qLT28YW7sYTKjRXDRLyLM
	oTPrnZwSoAoPjTOY45re0Dg7AE0THktwK2wLWsjZEWbw79Tu6oAhMiN/FzLH1PrvlyYUwP
	Xd8BM57NLtOrlL65hqC0FQiy4ivqkVE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 7/8] tools/xs-clients: fix usage information of xenstore-exists
Date: Thu, 12 Mar 2026 16:51:01 +0100
Message-ID: <20260312155102.2862824-8-jgross@suse.com>
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
X-Rspamd-Queue-Id: 7DB03274E93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The usage information of xenstore-exists is just wrong, as the "-p"
option is not supported by xenstore-exists.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xs-clients/xenstore_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xs-clients/xenstore_client.c b/tools/xs-clients/xenstore_client.c
index 1794451d43..3b02d3a196 100644
--- a/tools/xs-clients/xenstore_client.c
+++ b/tools/xs-clients/xenstore_client.c
@@ -232,7 +232,7 @@ usage(int eval, enum mode mode, int incl_mode, const char *progname)
 	errx(eval, "Usage: %s %s[-h] [-t] key [...]", progname, mstr);
     case MODE_exists:
 	mstr = incl_mode ? "exists " : "";
-	/* fallthrough */
+	errx(eval, "Usage: %s %s[-h] key", progname, mstr);
     case MODE_list:
 	mstr = mstr ? : incl_mode ? "list " : "";
 	errx(eval, "Usage: %s %s[-h] [-p] key [...]", progname, mstr);
-- 
2.53.0


