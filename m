Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69EAF0D99
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030383.1404052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsah-0000aj-Ox; Wed, 02 Jul 2025 08:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030383.1404052; Wed, 02 Jul 2025 08:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsah-0000XY-L6; Wed, 02 Jul 2025 08:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1030383;
 Wed, 02 Jul 2025 08:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsag-00082Y-Bz
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 666ebd33-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:13:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9833B21185;
 Wed,  2 Jul 2025 08:13:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6196713A24;
 Wed,  2 Jul 2025 08:13:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Hv4UFhnqZGgBSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:13 +0000
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
X-Inumbo-ID: 666ebd33-571c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+d4EFCiQsZIMwefph0NEXLwyu90CHtSwhYQrb0OX2I0=;
	b=mq+0GDHUxAk6TqmYIJgE+FjaQSP+BiL2fITHf7ITOwZlnJy/Zx4wx1zEW/OF8Aktn4Nzwp
	BPOdRVbO+wS8SD1xLQfIipv1M423tRAWF5fYknrRtv+Bi29+FNjWfc6D6RfEnjP8q2pBk2
	sfR71alJrjHdlBmD/wH0F7Wa8u0/HTk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+d4EFCiQsZIMwefph0NEXLwyu90CHtSwhYQrb0OX2I0=;
	b=mq+0GDHUxAk6TqmYIJgE+FjaQSP+BiL2fITHf7ITOwZlnJy/Zx4wx1zEW/OF8Aktn4Nzwp
	BPOdRVbO+wS8SD1xLQfIipv1M423tRAWF5fYknrRtv+Bi29+FNjWfc6D6RfEnjP8q2pBk2
	sfR71alJrjHdlBmD/wH0F7Wa8u0/HTk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/9] Enable Xenstore-stubdom Live Update
Date: Wed,  2 Jul 2025 10:12:56 +0200
Message-ID: <20250702081305.14440-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

With this series applied I was able to perform Live Update of Xenstore
running in a PVH stubdom.

This series is based on a related Mini-OS patch series AND it needs
the Mini-OS commit id updated accordingly in Config.mk.

One relevant change in this series is how the Xenstore state is being
read after activating the new binary. Instead of using mmap() the
state records are read one by one via fread(). This might have a
small performance impact for the daemon live update case, but it
should be neglectable.

Juergen Gross (9):
  stubdom: configure kexec for PVH Xenstore stubdom
  tools/xenstore: perform kexec for stubdom live update
  libevtchn: add O_CLOEXEC support for Mini-OS
  libxengnttab: set the cloexec flag on Mini-OS
  xenstored: use read() instead of mmap() for reading live update state
  xenstored: don't use xenevtchn_fdopen() in stubdom
  tools/libxenevtchn: add xenevtchn_bind() under Mini-OS
  xenstored: rebind event channels after live update in stubdom
  tools/xenstored: make stubdom_init() live update aware

 stubdom/xenstorepvh-minios.cfg |  2 +
 tools/include/xenevtchn.h      | 11 ++++
 tools/libs/evtchn/minios.c     | 23 +++++++--
 tools/libs/gnttab/minios.c     |  1 +
 tools/xenstored/core.c         |  5 +-
 tools/xenstored/core.h         | 13 ++++-
 tools/xenstored/domain.c       | 25 +++++----
 tools/xenstored/domain.h       |  2 +-
 tools/xenstored/lu.c           | 93 +++++++++++++++++++++-------------
 tools/xenstored/lu_minios.c    | 33 +++++++++++-
 tools/xenstored/minios.c       | 22 ++++++--
 tools/xenstored/posix.c        | 10 ++++
 12 files changed, 183 insertions(+), 57 deletions(-)

-- 
2.43.0


