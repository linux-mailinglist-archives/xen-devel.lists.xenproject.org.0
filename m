Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F4D23403
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204299.1519002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJ2H-00042Y-GD; Thu, 15 Jan 2026 08:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204299.1519002; Thu, 15 Jan 2026 08:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJ2H-000409-D9; Thu, 15 Jan 2026 08:48:57 +0000
Received: by outflank-mailman (input) for mailman id 1204299;
 Thu, 15 Jan 2026 08:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vgJ2G-000403-0A
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:48:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c42980-f1ef-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 09:48:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 012EB5BCEB;
 Thu, 15 Jan 2026 08:48:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B147A3EA63;
 Thu, 15 Jan 2026 08:48:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PESNKPSpaGnEIAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Jan 2026 08:48:52 +0000
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
X-Inumbo-ID: 05c42980-f1ef-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768466934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T4gQhUuagqLQmvTbN6c66jJbuGTJE17NFmXSnIA/TI8=;
	b=oY/oDF+NuXX3VQAMqj48JB2uJpwCE02l/tyX1XP8NP8s8NDMfNclL60SpFFymmyPD8xbKm
	3zQFJ7U6Dsz2aQ7TBXM+KT0K5gugtITLCIqJaODaSpR2C3X3UjJBR5+hk/YzNFViJrRj7q
	gg7DeJg2TV0yKBcuSezRh2RRr5lGf+4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="oY/oDF+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768466934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T4gQhUuagqLQmvTbN6c66jJbuGTJE17NFmXSnIA/TI8=;
	b=oY/oDF+NuXX3VQAMqj48JB2uJpwCE02l/tyX1XP8NP8s8NDMfNclL60SpFFymmyPD8xbKm
	3zQFJ7U6Dsz2aQ7TBXM+KT0K5gugtITLCIqJaODaSpR2C3X3UjJBR5+hk/YzNFViJrRj7q
	gg7DeJg2TV0yKBcuSezRh2RRr5lGf+4=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v3 0/5] x86: Cleanups around slow_down_io()
Date: Thu, 15 Jan 2026 09:48:44 +0100
Message-ID: <20260115084849.31502-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[20];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 012EB5BCEB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

While looking at paravirt cleanups I stumbled over slow_down_io() and
the related REALLY_SLOW_IO define.

Do several cleanups, resulting in a deletion of REALLY_SLOW_IO and the
io_delay() paravirt function hook.

Patch 4 is removing the config options for selecting the default delay
mechanism and sets the default to "no delay". This is in preparation of
removing the io_delay() functionality completely, as suggested by Ingo
Molnar.

Patch 5 is adding an additional config option allowing to avoid
building io_delay.c (default is still to build it).

Changes in V2:
- patches 2 and 3 of V1 have been applied
- new patches 4 and 5

Changes in V3:
- rebase to tip/master kernel branch

Juergen Gross (5):
  x86/paravirt: Replace io_delay() hook with a bool
  block/floppy: Don't use REALLY_SLOW_IO for delays
  x86/io: Remove REALLY_SLOW_IO handling
  x86/io_delay: Switch io_delay() default mechanism to "none"
  x86/io_delay: Add config option for controlling build of io_delay.

 arch/x86/Kconfig                      |  8 +++
 arch/x86/Kconfig.debug                | 30 ----------
 arch/x86/include/asm/floppy.h         | 31 ++++++++--
 arch/x86/include/asm/io.h             | 19 ++++---
 arch/x86/include/asm/paravirt-base.h  |  6 ++
 arch/x86/include/asm/paravirt.h       | 11 ----
 arch/x86/include/asm/paravirt_types.h |  2 -
 arch/x86/kernel/Makefile              |  3 +-
 arch/x86/kernel/cpu/vmware.c          |  2 +-
 arch/x86/kernel/io_delay.c            | 81 +--------------------------
 arch/x86/kernel/kvm.c                 |  8 +--
 arch/x86/kernel/paravirt.c            |  3 +-
 arch/x86/kernel/setup.c               |  4 +-
 arch/x86/xen/enlighten_pv.c           |  6 +-
 drivers/block/floppy.c                |  2 -
 15 files changed, 60 insertions(+), 156 deletions(-)

-- 
2.51.0


