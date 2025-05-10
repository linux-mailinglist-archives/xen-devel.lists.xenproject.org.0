Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3AAB216D
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 08:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980610.1367241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDdIQ-000565-0F; Sat, 10 May 2025 06:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980610.1367241; Sat, 10 May 2025 06:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDdIP-00054N-Q1; Sat, 10 May 2025 06:02:49 +0000
Received: by outflank-mailman (input) for mailman id 980610;
 Sat, 10 May 2025 06:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uDdIN-00054F-Rk
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 06:02:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6246604d-2d64-11f0-9ffb-bf95429c2676;
 Sat, 10 May 2025 08:02:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 857641F397;
 Sat, 10 May 2025 06:02:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F8A1136A5;
 Sat, 10 May 2025 06:02:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PQZQEQDsHmjhMgAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 10 May 2025 06:02:40 +0000
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
X-Inumbo-ID: 6246604d-2d64-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746856960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5x0FrLrT9arD78nhtjUiXkm3MxmtAVjf5jKghGKlN54=;
	b=B0yilAF3iYnqGKxHn3iBP5eDc7zGo5ks3Fq6A7wtKy09l/DrrFLRmEunhCyEadEbkuh/ZE
	hqwRBLuuYfLVKiESDAoPmzocev/mYt97xsXIj1cw02maWwsvxlJ3iOJ7KgHwfWdp4Th54H
	MvoqfcdJsYfQH90L+SgJj3Ca4WzDnUg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=B0yilAF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746856960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5x0FrLrT9arD78nhtjUiXkm3MxmtAVjf5jKghGKlN54=;
	b=B0yilAF3iYnqGKxHn3iBP5eDc7zGo5ks3Fq6A7wtKy09l/DrrFLRmEunhCyEadEbkuh/ZE
	hqwRBLuuYfLVKiESDAoPmzocev/mYt97xsXIj1cw02maWwsvxlJ3iOJ7KgHwfWdp4Th54H
	MvoqfcdJsYfQH90L+SgJj3Ca4WzDnUg=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.15-rc6
Date: Sat, 10 May 2025 08:02:39 +0200
Message-ID: <20250510060239.18894-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 857641F397
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc6-tag

xen: branch for v6.15-rc6

It contains the following patches:

- A fix for the xenbus driver allowing to use a PVH Dom0 with Xenstore
  running in another domain.

- A fix for the xenbus driver addressing a rare race condition resulting
  in NULL dereferences and other problems.

- A fix for the xen-swiotlb driver fixing a problem seen on Arm platforms.

Thanks.

Juergen

 drivers/xen/swiotlb-xen.c                |  1 +
 drivers/xen/xenbus/xenbus.h              |  2 ++
 drivers/xen/xenbus/xenbus_comms.c        |  9 ++++-----
 drivers/xen/xenbus/xenbus_dev_frontend.c |  2 +-
 drivers/xen/xenbus/xenbus_probe.c        | 14 ++++++++------
 drivers/xen/xenbus/xenbus_xs.c           | 18 ++++++++++++++++--
 6 files changed, 32 insertions(+), 14 deletions(-)

Jason Andryuk (2):
      xenbus: Allow PVH dom0 a non-local xenstore
      xenbus: Use kref to track req lifetime

John Ernberg (1):
      xen: swiotlb: Use swiotlb bouncing if kmalloc allocation demands it

