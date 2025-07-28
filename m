Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360A8B134A3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 08:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061023.1426560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugH08-0000DU-UD; Mon, 28 Jul 2025 06:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061023.1426560; Mon, 28 Jul 2025 06:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugH08-0000AS-R8; Mon, 28 Jul 2025 06:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1061023;
 Mon, 28 Jul 2025 06:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugH07-0000AM-RL
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 06:06:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f97e9af0-6b78-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 08:06:17 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96ED41F7FD;
 Mon, 28 Jul 2025 06:06:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E0251368A;
 Mon, 28 Jul 2025 06:06:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Y31tGVcTh2iYcAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 28 Jul 2025 06:06:15 +0000
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
X-Inumbo-ID: f97e9af0-6b78-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753682776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3n8KTJ9XQxHiiQiPEZNY8Dlf+2L80OyLJ/0a+7zM3BM=;
	b=jx5NMleALgYxKjWMjCvWq1BNj7/qQ10JXpksYyiZ7Tl0A/1kqtGXvt1OEIPwCAQ5fm2agJ
	KLpwgxV8s896L7rsMocR9bl5XYXeoMYZwfbAZyhDe/8Vk0TnVPQGjtRoOrkX4i8mrMOeyP
	7z2SekU2GIuO8L04TG7iXQNvADapHXs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753682775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3n8KTJ9XQxHiiQiPEZNY8Dlf+2L80OyLJ/0a+7zM3BM=;
	b=szmbmlG2MUPu/Jag4zu2tgYUm+uPmEGYHFBfkakCspELZQFmIQqspbxRHsvFqJkmrYjuPL
	oiVQRhs59yFMpkJRA4olyonL8NZm3U9Y+kHWktz2KMw0tL7+Gwfoi4TjW3Q+/1RAbx6VGb
	UcRRacw/OPqi4Xu2DFrL4af+m7OfVCc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.17-rc1
Date: Mon, 28 Jul 2025 08:06:14 +0200
Message-ID: <20250728060614.4875-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.17-rc1-tag

xen: branch for v6.17-rc1

It contains the following patches:

- A fix for a UAF in the xen gntdev-dmabuf driver
- A fix in the xen netfront driver avoiding spurious interrupts
- A fix in the gntdev driver avoiding a large stack allocation
- A cleanup removing some dead code
- A build warning fix
- A cleanup of the sysfs code in the xen-pciback driver

Thanks.

Juergen

 drivers/net/xen-netfront.c         |  5 ---
 drivers/xen/gntdev-common.h        |  4 +++
 drivers/xen/gntdev-dmabuf.c        | 28 ++++++---------
 drivers/xen/gntdev.c               | 71 +++++++++++++++++++++++++++-----------
 drivers/xen/manage.c               |  6 ----
 drivers/xen/time.c                 |  8 -----
 drivers/xen/xen-pciback/pci_stub.c | 12 +++----
 drivers/xen/xenbus/xenbus_client.c |  2 ++
 drivers/xen/xenbus/xenbus_xs.c     | 17 ---------
 include/xen/xen-ops.h              |  2 --
 include/xen/xenbus.h               |  2 --
 11 files changed, 72 insertions(+), 85 deletions(-)

Al Viro (1):
      xen: fix UAF in dmabuf_exp_from_pages()

Anthoine Bourgeois (1):
      xen/netfront: Fix TX response spurious interrupts

Dr. David Alan Gilbert (1):
      xen: Remove some deadcode (x)

Juergen Gross (1):
      xen/gntdev: remove struct gntdev_copy_batch from stack

Peng Jiang (1):
      xen/xenbus: fix W=1 build warning in xenbus_va_dev_error function

Ryan Chung (1):
      xen-pciback: Replace scnprintf() with sysfs_emit_at()

