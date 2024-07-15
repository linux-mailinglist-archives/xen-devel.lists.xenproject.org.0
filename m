Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8F930DB3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 07:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758656.1168067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTEYk-00065i-HV; Mon, 15 Jul 2024 05:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758656.1168067; Mon, 15 Jul 2024 05:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTEYk-00063M-EQ; Mon, 15 Jul 2024 05:47:38 +0000
Received: by outflank-mailman (input) for mailman id 758656;
 Mon, 15 Jul 2024 05:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nlhD=OP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sTEYi-00063G-Rf
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 05:47:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb99f81f-426d-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 07:47:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52C2C21B34;
 Mon, 15 Jul 2024 05:47:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D74013686;
 Mon, 15 Jul 2024 05:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jhETBfW3lGZjSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 15 Jul 2024 05:47:33 +0000
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
X-Inumbo-ID: bb99f81f-426d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721022453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J+GqE3zqQG29fe01QvbOYJpv81BAnAV5DjIOqhm9FCg=;
	b=Gyd6ytwoPxlYStNOG4uxRoKG4Ae9aUO2b4WvlDdQ3kUafMozj8kLjj3FmpbEwah0pNLc6V
	F8UwY/FtRwuxsDz2eGxqcDKyfyzurkCJirfrYTM0sJPhRj0BeA4AMBUumoQ/rkJiUX0v+H
	0TKe1+JNSyA7Q9N4JDhnFVlEdZbpRaw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Gyd6ytwo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721022453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J+GqE3zqQG29fe01QvbOYJpv81BAnAV5DjIOqhm9FCg=;
	b=Gyd6ytwoPxlYStNOG4uxRoKG4Ae9aUO2b4WvlDdQ3kUafMozj8kLjj3FmpbEwah0pNLc6V
	F8UwY/FtRwuxsDz2eGxqcDKyfyzurkCJirfrYTM0sJPhRj0BeA4AMBUumoQ/rkJiUX0v+H
	0TKe1+JNSyA7Q9N4JDhnFVlEdZbpRaw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.11-rc1
Date: Mon, 15 Jul 2024 07:47:32 +0200
Message-ID: <20240715054732.7508-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 52C2C21B34
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spamd-Bar: /

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.11-rc1-tag

xen: branch for v6.11-rc1

It contains the following patches:

- some trivial cleanups
- a fix for the Xen timer
- a patch for adding boot time selectable debug capability to the Xen multicall
  handling
- two fixes for the recently added  Xen irqfd handling

Thanks.

Juergen

 Documentation/admin-guide/kernel-parameters.txt |  11 +-
 arch/arm/xen/p2m.c                              |   2 +-
 arch/x86/xen/apic.c                             |   2 -
 arch/x86/xen/debugfs.c                          |   2 +-
 arch/x86/xen/debugfs.h                          |   7 --
 arch/x86/xen/enlighten.c                        |   2 -
 arch/x86/xen/enlighten_hvm.c                    |   2 -
 arch/x86/xen/enlighten_pv.c                     |   4 -
 arch/x86/xen/mmu.c                              |   3 +-
 arch/x86/xen/mmu.h                              |  28 -----
 arch/x86/xen/mmu_hvm.c                          |   2 +-
 arch/x86/xen/mmu_pv.c                           |  15 ++-
 arch/x86/xen/multicalls.c                       | 128 ++++++++++++++++----
 arch/x86/xen/multicalls.h                       |  69 -----------
 arch/x86/xen/p2m.c                              |   6 +-
 arch/x86/xen/pmu.c                              |   1 -
 arch/x86/xen/pmu.h                              |  22 ----
 arch/x86/xen/setup.c                            |   1 -
 arch/x86/xen/smp.c                              |   1 -
 arch/x86/xen/smp.h                              |  51 --------
 arch/x86/xen/smp_hvm.c                          |   2 -
 arch/x86/xen/smp_pv.c                           |   3 -
 arch/x86/xen/spinlock.c                         |  20 +---
 arch/x86/xen/suspend.c                          |   2 -
 arch/x86/xen/time.c                             |   2 +-
 arch/x86/xen/xen-ops.h                          | 148 +++++++++++++++++++++++-
 drivers/xen/evtchn.c                            |   1 +
 drivers/xen/manage.c                            |   2 +-
 drivers/xen/privcmd-buf.c                       |   1 +
 drivers/xen/privcmd.c                           |  36 ++++--
 drivers/xen/xen-pciback/pci_stub.c              |   1 +
 include/xen/events.h                            |   2 +
 kernel/locking/qspinlock.c                      |   2 +-
 33 files changed, 305 insertions(+), 276 deletions(-)

Chen Ni (2):
      x86/xen: Convert comma to semicolon
      xen/arm: Convert comma to semicolon

Christophe JAILLET (1):
      xen/manage: Constify struct shutdown_handler

Frediano Ziglio (1):
      x86/xen/time: Reduce Xen timer tick

Jeff Johnson (1):
      xen: add missing MODULE_DESCRIPTION() macros

Juergen Gross (4):
      xen: make multicall debug boot time selectable
      x86/xen: make some functions static
      x86/xen: eliminate some private header files
      x86/xen: remove deprecated xen_nopvspin boot parameter

Viresh Kumar (2):
      xen: privcmd: Switch from mutex to spinlock for irqfds
      xen: privcmd: Fix possible access to a freed kirqfd instance

