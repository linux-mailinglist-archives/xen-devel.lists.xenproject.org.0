Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA2nCpGlymmx+gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:32:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96235ED5E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268038.1557392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FWw-000740-Kr; Mon, 30 Mar 2026 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268038.1557392; Mon, 30 Mar 2026 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FWw-000721-HS; Mon, 30 Mar 2026 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1268038;
 Mon, 30 Mar 2026 16:31:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w7FWv-00071t-EM
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:31:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FWu-004nCd-QW
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:31:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69caa56f-bab6-0a2a0a5309dd-0a2a450388b4-28
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:31:56 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69caa57c-1947-0a2a45030019-c387df82a4f2-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:31:56 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DB994D522;
 Mon, 30 Mar 2026 16:31:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 211514A0A2;
 Mon, 30 Mar 2026 16:31:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QcD9Bnylymm0WwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 30 Mar 2026 16:31:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774888316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cCmmnfsjsR1FfBOfPVTo9rY5b6iLiQ5Z5igoSN4IYdM=;
	b=a0ukubFl7Z3WCJVnh5jv+V2cuLge4x6EkE6WIHA9vjM8fBKItg6FEm4BGCkpA10/fK8K0C
	vYBaBUz66kk8PAe5TMCP78N1iBVy48GZAnsSctZ2dI+Guv5SAkyzM9MvCH7NjsvN9ElqUp
	EuW8uxwlR70WF+0AznRjPRhlajZ4jD8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774888316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cCmmnfsjsR1FfBOfPVTo9rY5b6iLiQ5Z5igoSN4IYdM=;
	b=a0ukubFl7Z3WCJVnh5jv+V2cuLge4x6EkE6WIHA9vjM8fBKItg6FEm4BGCkpA10/fK8K0C
	vYBaBUz66kk8PAe5TMCP78N1iBVy48GZAnsSctZ2dI+Guv5SAkyzM9MvCH7NjsvN9ElqUp
	EuW8uxwlR70WF+0AznRjPRhlajZ4jD8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xenstored: remove unneeded check in create_node()
Date: Mon, 30 Mar 2026 18:31:53 +0200
Message-ID: <20260330163153.676464-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-33051d/1774888316-EB48872C-F3D4C910/0/0
X-purgate-type: clean
X-purgate-size: 727
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CF96235ED5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

create_node() is called only for issued xenstore commands. This means
that the "conn" parameter is never NULL.

Remove checking whether "conn" is not NULL.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 4786a2a82e..34cb266e8a 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -1524,7 +1524,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	if (!node)
 		return NULL;
 
-	if (conn && conn->transaction)
+	if (conn->transaction)
 		ta_node_created(conn->transaction);
 
 	node->data = data;
-- 
2.53.0


