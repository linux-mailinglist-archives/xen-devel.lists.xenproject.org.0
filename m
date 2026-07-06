Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fxl6CvFvS2qgRQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB670E6BE
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Do27AbWb;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Do27AbWb;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355178.1609943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfGl-00019Q-VJ; Mon, 06 Jul 2026 09:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355178.1609943; Mon, 06 Jul 2026 09:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfGl-00017O-Rg; Mon, 06 Jul 2026 09:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1355178;
 Mon, 06 Jul 2026 09:05:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wgfGk-00014b-KJ
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfGh-002h1q-9X
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:05:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4b6fdd-5cb7-0a2a0a5109dd-0a2a4508bb1a-6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:05:35 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4b6fde-edec-0a2a45080019-c387df82b648-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:05:35 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B68BB73AB0;
 Mon,  6 Jul 2026 09:05:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 768A8779AA;
 Mon,  6 Jul 2026 09:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vmOeG95vS2o8UAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Jul 2026 09:05:34 +0000
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
	t=1783328734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajjWNiczIP6Z1poS+/ClhoNHuHeLCP0QrxrWyRWCjB4=;
	b=Do27AbWb6ntaVEE2NqWP5ZjrmsIuz1W4/nmhpOIpZ3Iyq2LWxN2ZcMdOQ7GsOE8a5LMiG0
	TEPGZb3JszDB+DZZgADKUGB1ruy5gAwMuXcYDIIGDZByGjRxTUKY/3+2phkjknygDGRWD2
	lhgij46cI2fGnYcW7kIalHH+7K0NDjM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783328734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajjWNiczIP6Z1poS+/ClhoNHuHeLCP0QrxrWyRWCjB4=;
	b=Do27AbWb6ntaVEE2NqWP5ZjrmsIuz1W4/nmhpOIpZ3Iyq2LWxN2ZcMdOQ7GsOE8a5LMiG0
	TEPGZb3JszDB+DZZgADKUGB1ruy5gAwMuXcYDIIGDZByGjRxTUKY/3+2phkjknygDGRWD2
	lhgij46cI2fGnYcW7kIalHH+7K0NDjM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 2/2] CHANGELOG: add entry for removed c-stubdom
Date: Mon,  6 Jul 2026 11:05:21 +0200
Message-ID: <20260706090521.1992123-3-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706090521.1992123-1-jgross@suse.com>
References: <20260706090521.1992123-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.51
X-purgate-ID: tlsNG-c1860d/1783328735-4293D3FC-92DC7746/0/0
X-purgate-type: clean
X-purgate-size: 724
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3DB670E6BE

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ef4e6ae9c4..fc9840c5d2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - The kexec "v1" interface, which was declared obsolete in Xen 4.4 (2013).
      The only known user was the classic-xen fork of Linux.  This does not
      affect Xen kexec support in the kexec-tools package.
+   - The example stubdom "c-stubdom" has been removed.
 
 ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
-- 
2.54.0


