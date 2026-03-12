Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EtgITmwsmlGOwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:23:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C4271A56
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252252.1548995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f3t-0005ry-E0; Thu, 12 Mar 2026 12:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252252.1548995; Thu, 12 Mar 2026 12:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f3t-0005qN-AN; Thu, 12 Mar 2026 12:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1252252;
 Thu, 12 Mar 2026 12:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0f3s-0005q1-68
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:22:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b702ef6-1e0e-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 13:22:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53DBC5BCC3;
 Thu, 12 Mar 2026 12:22:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 257463FF78;
 Thu, 12 Mar 2026 12:22:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q/6SBxKwsmn8bQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 12:22:42 +0000
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
X-Inumbo-ID: 2b702ef6-1e0e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pb43MK7Il5S1H1egLvT8+n0qUAoOsACewtHiK/T0SMc=;
	b=mzmfuF2PUzt8Juq1v0lw/RidnvanOFxSfvoPt8fY4X1LVmFbis3ES6Vz7vrzjf2EHDDaqp
	KJAgAAYSm7QKAmbz1SedkMYadpUVjzvEjqtFfrk3Cs54fnbyZDMWWsb9r59wCgWvvd8xLh
	kwP0lcE96qEBaPK99qXBIk7wXFAdYWY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pb43MK7Il5S1H1egLvT8+n0qUAoOsACewtHiK/T0SMc=;
	b=mzmfuF2PUzt8Juq1v0lw/RidnvanOFxSfvoPt8fY4X1LVmFbis3ES6Vz7vrzjf2EHDDaqp
	KJAgAAYSm7QKAmbz1SedkMYadpUVjzvEjqtFfrk3Cs54fnbyZDMWWsb9r59wCgWvvd8xLh
	kwP0lcE96qEBaPK99qXBIk7wXFAdYWY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/4] docs: add some Xenstore related man pages
Date: Thu, 12 Mar 2026 13:22:36 +0100
Message-ID: <20260312122240.2784725-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.77
X-Spam-Level: 
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 265C4271A56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For some of the Xenstore client programs the man pages are missing.

Juergen Gross (4):
  docs: add man page for xenstore-exists
  docs: add man page for xenstore-list
  docs: add man page for xenstore-rm
  docs: add man page for xenstore-watch

 docs/man/xenstore-exists.1.pod | 17 +++++++++++++++++
 docs/man/xenstore-list.1.pod   | 24 ++++++++++++++++++++++++
 docs/man/xenstore-rm.1.pod     | 24 ++++++++++++++++++++++++
 docs/man/xenstore-watch.1.pod  | 25 +++++++++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 docs/man/xenstore-exists.1.pod
 create mode 100644 docs/man/xenstore-list.1.pod
 create mode 100644 docs/man/xenstore-rm.1.pod
 create mode 100644 docs/man/xenstore-watch.1.pod

-- 
2.53.0


