Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN5bAanDs2mEagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:58:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA127F1D8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253419.1549688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xPT-0000WA-HG; Fri, 13 Mar 2026 07:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253419.1549688; Fri, 13 Mar 2026 07:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xPT-0000T6-EP; Fri, 13 Mar 2026 07:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1253419;
 Fri, 13 Mar 2026 07:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xGB-0003TG-If
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b5917f6-1eb1-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:48:37 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43F825CF3C;
 Fri, 13 Mar 2026 07:48:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AD62403F6;
 Fri, 13 Mar 2026 07:48:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ppJ+BVXBs2k1GQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:37 +0000
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
X-Inumbo-ID: 0b5917f6-1eb1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQy01lSorBeCu75rYkVAGdbd34BdLsmg0CaWqBI6wwU=;
	b=WAhxk8oYy6gXZ9sygI9gnvp/GZUEehkI3dIR1RA84eQnixk7QKXRsPC3ZI7CNRt+ywvdxg
	JBPjvp/cfbVAy2H+Bv5+ItFrO8Kt90uXE1/tr9ULU5MgT/JNCHwcPs99z0mE5q8lPiU0Nb
	SWoPcVXUSXyOpaOQWnpIbmgJ6PeTGrs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQy01lSorBeCu75rYkVAGdbd34BdLsmg0CaWqBI6wwU=;
	b=WAhxk8oYy6gXZ9sygI9gnvp/GZUEehkI3dIR1RA84eQnixk7QKXRsPC3ZI7CNRt+ywvdxg
	JBPjvp/cfbVAy2H+Bv5+ItFrO8Kt90uXE1/tr9ULU5MgT/JNCHwcPs99z0mE5q8lPiU0Nb
	SWoPcVXUSXyOpaOQWnpIbmgJ6PeTGrs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 8/8] tools/xenstored: make XENSTORE_SERVER_FEATURE_WATCHDEPTH available
Date: Fri, 13 Mar 2026 08:47:51 +0100
Message-ID: <20260313074751.2904215-9-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: ADBA127F1D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add XENSTORE_SERVER_FEATURE_WATCHDEPTH to the available features now
that all needed support has been added.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 1fe8abbea9..d02ac247c5 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -43,7 +43,8 @@
 #include <mini-os/xenbus.h>
 #endif
 
-#define XENSTORE_FEATURES	XENSTORE_SERVER_FEATURE_ERROR
+#define XENSTORE_FEATURES	(XENSTORE_SERVER_FEATURE_ERROR |	\
+				 XENSTORE_SERVER_FEATURE_WATCHDEPTH)
 
 static xenmanage_handle *xm_handle;
 xengnttab_handle **xgt_handle;
-- 
2.53.0


