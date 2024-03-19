Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9487F830
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 08:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695227.1084817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmTcA-0004K4-Qp; Tue, 19 Mar 2024 07:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695227.1084817; Tue, 19 Mar 2024 07:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmTcA-0004Hr-NQ; Tue, 19 Mar 2024 07:10:26 +0000
Received: by outflank-mailman (input) for mailman id 695227;
 Tue, 19 Mar 2024 07:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xTJq=KZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmTc9-0004Hl-8E
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 07:10:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0fa819d-e5bf-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 08:10:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DC69B5D25C;
 Tue, 19 Mar 2024 07:10:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B21B8136A5;
 Tue, 19 Mar 2024 07:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Gsr2KV46+WVJYwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 19 Mar 2024 07:10:22 +0000
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
X-Inumbo-ID: c0fa819d-e5bf-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710832223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=60bEIDwx+NXczuoY7AFrsSbeXmm714yJjf0EPnqnQ6o=;
	b=TZfk+EKd+rpUzJAX7/cgQaDnSlrl68A0hnx/FbOIrgbzVPuemZlRN07Up0duvO+pTt0O6j
	K0yWbLG/fJKaJuBQY8mmiLU4cSYusYP1y74CIKCkFWru0KJXiTgZmeJhUN1E4oNA63utdD
	j1SJ0FmvH+XZXkP1xN/LXeCuiwzbA/U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710832222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=60bEIDwx+NXczuoY7AFrsSbeXmm714yJjf0EPnqnQ6o=;
	b=kZtefftjM/Ld8PYQi5P+W736PuwztLTtFlY5/tF8FF/lwZUu/WRQ7NOzClDHOKOP1mecFC
	EsvdgpEzpgofq4DqqAkvoS0lHkVG5nuJv+TMbxwRlu2nZSS9eX7qt0dxVlQP2C7HCb3KXz
	LFZefv0pH38RoMN2DQ0hdy8kVzN51VE=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.9-rc1
Date: Tue, 19 Mar 2024 08:10:22 +0100
Message-Id: <20240319071022.7513-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.01
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_HI(-3.50)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.00)[87.14%]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=kZtefftj
X-Rspamd-Queue-Id: DC69B5D25C

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.9-rc1-tag

xen: branch for v6.9-rc1

It contains the following patches:

- 2 patches for Xen event channel handling fixing a regression wit a
  rare kernel config and adding some hardening.

- A patch for better support of running Xen dom0 in PVH mode.

- A cleanup patch for the xen grant-dma-iommu driver.


Thanks.

Juergen

 arch/x86/include/asm/xen/hypervisor.h |  5 +++
 arch/x86/platform/pvh/enlighten.c     |  3 ++
 arch/x86/xen/enlighten.c              | 32 +++++++++++++++++
 arch/x86/xen/enlighten_pvh.c          | 68 +++++++++++++++++++++++++++++++++++
 arch/x86/xen/setup.c                  | 44 -----------------------
 arch/x86/xen/xen-ops.h                | 14 ++++++++
 drivers/xen/balloon.c                 |  2 --
 drivers/xen/events/events_base.c      | 22 +++++++-----
 drivers/xen/evtchn.c                  |  6 ++++
 drivers/xen/grant-dma-iommu.c         |  6 ++--
 10 files changed, 143 insertions(+), 59 deletions(-)

Juergen Gross (2):
      xen/evtchn: avoid WARN() when unbinding an event channel
      xen/events: increment refcnt only if event channel is refcounted

Roger Pau Monne (1):
      x86/xen: attempt to inflate the memory balloon on PVH

Uwe Kleine-König (1):
      xen/grant-dma-iommu: Convert to platform remove callback returning void

