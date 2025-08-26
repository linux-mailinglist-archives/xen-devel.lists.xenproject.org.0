Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83220B36C72
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094719.1449967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv5u-0005ej-AX; Tue, 26 Aug 2025 14:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094719.1449967; Tue, 26 Aug 2025 14:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv5u-0005bt-7W; Tue, 26 Aug 2025 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1094719;
 Tue, 26 Aug 2025 14:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uqv5s-0005bn-VE
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:56:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce0e3fa2-828c-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:56:11 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E8B761F38F;
 Tue, 26 Aug 2025 14:56:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D60013A31;
 Tue, 26 Aug 2025 14:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oQoeIQrLrWiwTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 26 Aug 2025 14:56:10 +0000
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
X-Inumbo-ID: ce0e3fa2-828c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756220171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AA3kVYdUWF6i6YoYHZrMeLM9qBHfEfgoU7R9Gv0EeKg=;
	b=t4LhYdgXQfChZMnlicIFotO/yGEHHCSbrCQ1PuJ5Fd+3D8gEIkyNZT/CYc4ja8p4xvS9K2
	g+69d3T7UwPZf9MKVWIQeYK9fqldA+4DBXTUVvKozTlFDYzJ1rCi57TV0c/b8hAP2EAi+a
	Fyllb7YDtgzUUZiVSvz7hb2LMDgXs1s=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756220170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AA3kVYdUWF6i6YoYHZrMeLM9qBHfEfgoU7R9Gv0EeKg=;
	b=HRzlIrhBzIxZLG8kB9H7WiFEX9kKQy0yEUoAAr2rNt3SnEQadq9gA5db1/VjOfn4qYNxAM
	6GsmMzob3eFdCeERCc8e9dC33LqpNtufTC/fMNOOXvvZcd8Po0n6NB7sgTmBWpxQu2X0+O
	dBi8MoCa3DJCZ2DdK/VZNOYA06F3HzA=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] xen: use X86_FEATURE_XENPV for PV specific code
Date: Tue, 26 Aug 2025 16:56:05 +0200
Message-ID: <20250826145608.10352-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Instead of using a global variable with the current guest type or the
XENFEAT_auto_translated_physmap Xen feature, use the already existing
X86_FEATURE_XENPV for guarding PV mode specific code.

This has the advantage of compile time code elimination in case of the
kernel having been configured without CONFIG_XEN_PV, and the usage of
static-keys for selecting the correct code path otherwise.

Juergen Gross (3):
  xen: rework xen_pv_domain()
  xen: replace XENFEAT_auto_translated_physmap with xen_pv_domain()
  drivers/xen/gntdev: use xen_pv_domain() instead of cached value

 arch/x86/include/asm/xen/page.h    | 14 ++++++-------
 arch/x86/xen/enlighten_pv.c        |  2 +-
 arch/x86/xen/mmu.c                 |  2 +-
 arch/x86/xen/p2m.c                 |  4 ++--
 drivers/xen/balloon.c              |  4 ++--
 drivers/xen/gntdev-dmabuf.c        |  7 +++----
 drivers/xen/gntdev-dmabuf.h        |  2 +-
 drivers/xen/gntdev.c               | 33 +++++++++++++-----------------
 drivers/xen/grant-table.c          |  6 +++---
 drivers/xen/privcmd.c              | 14 ++++++-------
 drivers/xen/unpopulated-alloc.c    |  4 ++--
 drivers/xen/xenbus/xenbus_client.c |  2 +-
 include/xen/grant_table.h          |  4 ++--
 include/xen/mem-reservation.h      |  4 ++--
 include/xen/xen-ops.h              |  7 ++++---
 include/xen/xen.h                  |  9 +++++++-
 16 files changed, 59 insertions(+), 59 deletions(-)

-- 
2.43.0


