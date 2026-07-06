Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l09bNPJvS2qiRQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9B70E6C5
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BJ4QBv44;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BJ4QBv44;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355176.1609926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfGZ-0000dt-GT; Mon, 06 Jul 2026 09:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355176.1609926; Mon, 06 Jul 2026 09:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfGZ-0000c2-DJ; Mon, 06 Jul 2026 09:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1355176;
 Mon, 06 Jul 2026 09:05:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wgfGY-0000bw-2c
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:05:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfGW-00GoLn-Jh
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:05:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4b6fcb-2eae-0a2a0a5409dd-0a2a45049f56-28
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:05:24 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4b6fd4-a01d-0a2a45040019-c387df8381b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:05:24 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97A8875B75;
 Mon,  6 Jul 2026 09:05:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53B4E779AC;
 Mon,  6 Jul 2026 09:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SLocE9NvS2ohUAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Jul 2026 09:05:23 +0000
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
	t=1783328723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zacrbbynQxWf15K/coYPDw3/uNvpPtxY4/1d6we4GT4=;
	b=BJ4QBv44PDgVER4kwCS/b1nh4sq6yis710wO99W8RDT8rvD0kkaiaxKmpwoRFPSN973CPw
	bcmBeJ4YrX4Dq/LezoeAarIReHs11qScq+Tm1taVz+GmXUKWqxqPtHlw89wzf4Z2vciLFx
	6EFzlRcobGwarPo3ytmnAT7qmEFh8cM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783328723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zacrbbynQxWf15K/coYPDw3/uNvpPtxY4/1d6we4GT4=;
	b=BJ4QBv44PDgVER4kwCS/b1nh4sq6yis710wO99W8RDT8rvD0kkaiaxKmpwoRFPSN973CPw
	bcmBeJ4YrX4Dq/LezoeAarIReHs11qScq+Tm1taVz+GmXUKWqxqPtHlw89wzf4Z2vciLFx
	6EFzlRcobGwarPo3ytmnAT7qmEFh8cM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/2] stubdom: remove c-stubdom
Date: Mon,  6 Jul 2026 11:05:19 +0200
Message-ID: <20260706090521.1992123-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.51
X-purgate-ID: tlsNG-ebf023/1783328724-2D9A31CC-7CEBA26D/0/0
X-purgate-type: clean
X-purgate-size: 653
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.com,vates.tech,ens-lyon.org,gmail.com,xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:samuel.thibault@ens-lyon.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5A9B70E6C5

Remove the example stunbdom "c-stubdom".

Changes in V2:
- add patch 2

Juergen Gross (2):
  stubdom: remove c-stubdom
  CHANGELOG: add entry for removed c-stubdom

 CHANGELOG.md         |  1 +
 stubdom/Makefile     | 19 -------------------
 stubdom/c/Makefile   | 13 -------------
 stubdom/c/main.c     |  8 --------
 stubdom/c/minios.cfg |  2 --
 stubdom/configure    | 44 --------------------------------------------
 stubdom/configure.ac |  1 -
 7 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 stubdom/c/Makefile
 delete mode 100644 stubdom/c/main.c
 delete mode 100644 stubdom/c/minios.cfg

-- 
2.54.0


