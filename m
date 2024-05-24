Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2048CE63D
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 15:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729576.1134783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAV78-0007dB-GN; Fri, 24 May 2024 13:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729576.1134783; Fri, 24 May 2024 13:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAV78-0007bi-De; Fri, 24 May 2024 13:37:42 +0000
Received: by outflank-mailman (input) for mailman id 729576;
 Fri, 24 May 2024 13:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nTfd=M3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sAV77-0007bc-17
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 13:37:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c95effc4-19d2-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 15:37:38 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18B6E33B2B;
 Fri, 24 May 2024 13:37:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A616313A3D;
 Fri, 24 May 2024 13:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wr10GiCYUGbAMAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 24 May 2024 13:37:36 +0000
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
X-Inumbo-ID: c95effc4-19d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716557858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JKHA+2p18tBMJqJgM8JceeW8T9TO/bDEUGloQ6VEz/o=;
	b=qy9drsJUa5/BPf+w/P64RE3ruc3tnU95RQyGeW1R9ZlSldD9XjEEq2sjg2K/d1+7QpWChl
	KokgJFTHZr5Ml2tJ8s1R4b/RwfJDtqakOR0hejgPG4URnIl1F7EToQCOvT8CCr/lmD6kNf
	t5+nawkWosh5PgIj4fCVhH88h7vs/xg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716557858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JKHA+2p18tBMJqJgM8JceeW8T9TO/bDEUGloQ6VEz/o=;
	b=qy9drsJUa5/BPf+w/P64RE3ruc3tnU95RQyGeW1R9ZlSldD9XjEEq2sjg2K/d1+7QpWChl
	KokgJFTHZr5Ml2tJ8s1R4b/RwfJDtqakOR0hejgPG4URnIl1F7EToQCOvT8CCr/lmD6kNf
	t5+nawkWosh5PgIj4fCVhH88h7vs/xg=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.10-rc1
Date: Fri, 24 May 2024 15:37:33 +0200
Message-Id: <20240524133733.27825-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.15 / 50.00];
	BAYES_HAM(-2.35)[96.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.15
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.10a-rc1-tag

xen: branch for v6.10-rc1

It contains the following patches:

- a small cleanup in the drivers/xen/xenbus Makefile
- a fix of the Xen xenstore driver to improve connecting to a late started
  Xenstore
- an enhancement for better support of ballooning in PVH guests
- a cleanup using try_cmpxchg() instead of open coding it

Thanks.

Juergen

 arch/x86/xen/enlighten.c          | 33 +++++++++++++++++++++++++++++++++
 arch/x86/xen/p2m.c                | 11 +++++------
 drivers/xen/xenbus/Makefile       | 14 ++++++--------
 drivers/xen/xenbus/xenbus_probe.c | 36 +++++++++++++++++++++++-------------
 4 files changed, 67 insertions(+), 27 deletions(-)

Andy Shevchenko (1):
      xen/xenbus: Use *-y instead of *-objs in Makefile

Henry Wang (1):
      drivers/xen: Improve the late XenStore init protocol

Roger Pau Monne (1):
      xen/x86: add extra pages to unpopulated-alloc if available

Uros Bizjak (1):
      locking/x86/xen: Use try_cmpxchg() in xen_alloc_p2m_entry()

