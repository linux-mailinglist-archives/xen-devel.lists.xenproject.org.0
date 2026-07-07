Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CgNbN1C6TGomowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:35:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58147192A0
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:35:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="Sd/wpGV1";
	dkim=pass header.d=suse.com header.s=susede1 header.b="Sd/wpGV1";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356033.1610708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1Gz-00013Z-SW; Tue, 07 Jul 2026 08:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356033.1610708; Tue, 07 Jul 2026 08:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1Gz-00011Z-Pc; Tue, 07 Jul 2026 08:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1356033;
 Tue, 07 Jul 2026 08:35:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wh1Gy-00010I-KF
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:35:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1Gy-003q4B-0U
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:35:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba44-e002-0a2a0a5209dd-0a2a4503dd90-16
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:19 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba47-ec1a-0a2a45030019-c387df83cd70-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:19 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9732E7586F;
 Tue,  7 Jul 2026 08:35:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72BB9779AE;
 Tue,  7 Jul 2026 08:35:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SauMGke6TGreDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jul 2026 08:35:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783413319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rR6a7u62PrIE8LmzzOCco11yRON8r8BBfjyeOxn53M=;
	b=Sd/wpGV1rTZQA0hF2qVWLuH15AphoRdkudGmfveb7qfIrEceSNn98z4R7/5n0bCp3FZjHs
	XaiYV7enKkiX6jUsNyC6rsAx589aEgM3uobU6E8WLiZ6KZE7LAfK/BeEXvvD1Ny9fcYqbt
	KMyhfnP99ysy7tHvQo9UrPrPXWlTrJ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783413319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rR6a7u62PrIE8LmzzOCco11yRON8r8BBfjyeOxn53M=;
	b=Sd/wpGV1rTZQA0hF2qVWLuH15AphoRdkudGmfveb7qfIrEceSNn98z4R7/5n0bCp3FZjHs
	XaiYV7enKkiX6jUsNyC6rsAx589aEgM3uobU6E8WLiZ6KZE7LAfK/BeEXvvD1Ny9fcYqbt
	KMyhfnP99ysy7tHvQo9UrPrPXWlTrJ4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 3/5] stubdom: remove building of libxenguest and libxenctrl
Date: Tue,  7 Jul 2026 10:34:54 +0200
Message-ID: <20260707083459.226297-4-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707083459.226297-1-jgross@suse.com>
References: <20260707083459.226297-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.01
X-purgate-ID: tlsNG-33051d/1783413319-06D2B5D1-FD6C0340/0/0
X-purgate-type: clean
X-purgate-size: 784
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:samuel.thibault@ens-lyon.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C58147192A0

grub-pv was the last user of the stubdom variants of libxenguest and
libxenctrl.

Remove both libraries from the stubdom build system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2698bddc9d..40b6ececf1 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -256,9 +256,7 @@ $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
 # libraries under tools/libs
 #######
 
-STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest manage
-
-LIBDEP_guest := cross-zlib
+STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel manage
 
 #######
 # common handling
-- 
2.54.0


