Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E8CAA1E2
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 07:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179785.1503225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRlpN-0003Wg-Ee; Sat, 06 Dec 2025 06:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179785.1503225; Sat, 06 Dec 2025 06:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRlpN-0003VF-Bl; Sat, 06 Dec 2025 06:31:33 +0000
Received: by outflank-mailman (input) for mailman id 1179785;
 Sat, 06 Dec 2025 06:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DYx7=6M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vRlpM-0003V9-FN
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 06:31:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 336ce4a8-d26d-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 07:31:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A8DA3372A;
 Sat,  6 Dec 2025 06:31:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 523B23EA63;
 Sat,  6 Dec 2025 06:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8E5EEsDNM2myDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 06 Dec 2025 06:31:28 +0000
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
X-Inumbo-ID: 336ce4a8-d26d-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1765002689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XBAJip0FsmIylKFdfJB0aH3CCt63ifrbVW2j78uVbz8=;
	b=UaxdNpIcIL5AITLM5Iv7eK1ARIEOPXU4KGgx3hWEMfJdxJRs80YcYtOlBstJJ3/z/tImTN
	nnKcoJX22/ETPkFhGu1b7Qt3158sVESJ19j21gTub6u9otZkBTiQEfYTwMrvCkRDye+Vl0
	jSRg+mbNsGzcmqM0FoZuT/ndmmPdpRg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1765002688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XBAJip0FsmIylKFdfJB0aH3CCt63ifrbVW2j78uVbz8=;
	b=ghFURnxlBuBmMYQaeQc2vBLd4o3vAhmPIJSnDT5k5SWLSfQMVnFt5rlXPjQDOJtVeOky1c
	gXYDkX6Oi3uMIEYFH/7gggH7sMrb79+cH1OFlHqTxtAKxqydi3FhjB6adMT8DUW9Dp7fo5
	lkcf5F7wtlmkwssIMdna1suHHcox6oU=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.19-rc1
Date: Sat,  6 Dec 2025 07:31:27 +0100
Message-ID: <20251206063127.23986-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.19-rc1-tag

xen: branch for v6.19-rc1

This round it contains only 3 small cleanup patches.

Thanks.

Juergen

 drivers/xen/grant-table.c      |  2 +-
 drivers/xen/xenbus/xenbus_xs.c | 16 +++++-----------
 include/xen/xenbus.h           |  2 +-
 3 files changed, 7 insertions(+), 13 deletions(-)

David Laight (1):
      drivers/xen: use min() instead of min_t()

Thorsten Blum (2):
      drivers/xen/xenbus: Simplify return statement in join()
      drivers/xen/xenbus: Replace deprecated strcpy in xenbus_transaction_end

