Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50116B16040
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063873.1429593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5pw-0004Zo-Vi; Wed, 30 Jul 2025 12:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063873.1429593; Wed, 30 Jul 2025 12:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5pw-0004XB-Sh; Wed, 30 Jul 2025 12:23:12 +0000
Received: by outflank-mailman (input) for mailman id 1063873;
 Wed, 30 Jul 2025 12:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh5pv-0004Wg-2T
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:23:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4118d99-6d3f-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 14:23:09 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3022C1F809;
 Wed, 30 Jul 2025 12:23:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCE921388B;
 Wed, 30 Jul 2025 12:23:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2DMlLKsOimiBJAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 12:23:07 +0000
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
X-Inumbo-ID: f4118d99-6d3f-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RvzpvscIfRPKd3JiWmPzwVWKEvqs5MYVlope2mMG6j0=;
	b=YXRYHwC3P+BZUNFtbCK7G3wnPHpnCx47CT1okInYIozum7w6TP+csPAMGLPChbYew7mNNG
	WxN4QKiq74K9vt5d0A5PnUGaL8vOEpSeddpDPcpXt9n0wsBJURiHtD0Tioe4qr3y/kXkK7
	MFFSgDN2DO4WLQZUw/3gSP/5pax32FU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=YXRYHwC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RvzpvscIfRPKd3JiWmPzwVWKEvqs5MYVlope2mMG6j0=;
	b=YXRYHwC3P+BZUNFtbCK7G3wnPHpnCx47CT1okInYIozum7w6TP+csPAMGLPChbYew7mNNG
	WxN4QKiq74K9vt5d0A5PnUGaL8vOEpSeddpDPcpXt9n0wsBJURiHtD0Tioe4qr3y/kXkK7
	MFFSgDN2DO4WLQZUw/3gSP/5pax32FU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 0/9] Enable Xenstore-stubdom Live Update
Date: Wed, 30 Jul 2025 14:22:56 +0200
Message-ID: <20250730122305.4050-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3022C1F809
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,changelog.md:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,xen.org,vates.tech,citrix.com,amd.com,kernel.org,gmail.com,xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.51

With this series applied I was able to perform Live Update of Xenstore
running in a PVH stubdom.

One relevant change in this series is how the Xenstore state is being
read after activating the new binary. Instead of using mmap() the
state records are read one by one via fread(). This might have a
small performance impact for the daemon live update case, but it
should be neglectable.

Changes in V2:
- rebase
- former patches 1 and 2 have been committed already
- former patch 5 moved to start of the series (has all needed Acks)
- new patches 8 and 9

Changes in V3:
- minor changes in patches 1 and 5

Juergen Gross (9):
  xenstored: use fread() instead of mmap() for reading live update state
  libevtchn: add O_CLOEXEC support for Mini-OS
  libxengnttab: set the cloexec flag on Mini-OS
  xenstored: don't use xenevtchn_fdopen() in stubdom
  tools/libxenevtchn: add xenevtchn_bind() under Mini-OS
  xenstored: rebind event channels after live update in stubdom
  tools/xenstored: make stubdom_init() live update aware
  SUPPORT.md: add xenstorepvh-stubdom live update
  CHANGELOG.md: add xenstorepvh-stubdom live update

 CHANGELOG.md               |  1 +
 SUPPORT.md                 |  2 +-
 tools/include/xenevtchn.h  | 13 +++++
 tools/libs/evtchn/minios.c | 23 +++++++--
 tools/libs/gnttab/minios.c |  1 +
 tools/xenstored/core.c     |  5 +-
 tools/xenstored/core.h     |  8 +++-
 tools/xenstored/domain.c   | 25 ++++++----
 tools/xenstored/domain.h   |  2 +-
 tools/xenstored/lu.c       | 97 +++++++++++++++++++++++---------------
 tools/xenstored/minios.c   | 22 +++++++--
 tools/xenstored/posix.c    | 10 ++++
 12 files changed, 150 insertions(+), 59 deletions(-)

-- 
2.43.0


