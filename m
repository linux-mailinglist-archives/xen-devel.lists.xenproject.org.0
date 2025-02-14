Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA677A35851
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888528.1297882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqcC-0000Fj-IF; Fri, 14 Feb 2025 08:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888528.1297882; Fri, 14 Feb 2025 08:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqcC-0000DQ-Fe; Fri, 14 Feb 2025 08:00:00 +0000
Received: by outflank-mailman (input) for mailman id 888528;
 Fri, 14 Feb 2025 07:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiqcA-0000DI-TS
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:59:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aedd68ac-eaa9-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:59:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 390351F451;
 Fri, 14 Feb 2025 07:59:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0177413285;
 Fri, 14 Feb 2025 07:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L8g3Ovv3rmdXHAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Feb 2025 07:59:55 +0000
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
X-Inumbo-ID: aedd68ac-eaa9-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739519997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vl42sO+5tmTPqeo1iMS87UANmhyjUCvI0bsY48G3xH8=;
	b=NaxdaKETD89REe6+zWdTKRrZKJfxGwWBd1s0J2O8nqi4oi82y0Uj69jiadBW5WcVZgXG6b
	jQr6vDFKxJr0FKpUMq3UY0N67EevVoMemWMXVkwCDNJ/u5WTkDEXNmXcLN421R40gzxSTx
	AE9U5n0dKSa4w1KPI5ig5Nk/pBTfwkc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=DDwhNG9o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739519996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vl42sO+5tmTPqeo1iMS87UANmhyjUCvI0bsY48G3xH8=;
	b=DDwhNG9oNfUmq8eCdhdieU+vhk41r8ul7PAso9e/ktTQHDcuNx8ftuYovRuh1tZjmZCvFh
	bLVSceznziO1updZV2ERfD9elmWiQ+Aqu4BoQDxRkoNm24V1SDFYKY+KkojTRKpZSst9/g
	vhKzegdr1UmcQqhrCp7YbCrSWYwR//g=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.14-rc3
Date: Fri, 14 Feb 2025 08:59:55 +0100
Message-ID: <20250214075955.17913-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 390351F451
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc3-tag

xen: branch for v6.14-rc3

It contains 3 patches related to the xen-swiotlb driver:

- 2 fixes for issues coming up due to another fix in 6.12
- 1 addition of an __init annotation


Thanks.

Juergen

 arch/x86/xen/mmu_pv.c     | 71 +++++++++++++++++++++++++++++++++++++++++------
 drivers/xen/swiotlb-xen.c | 22 +++++++++------
 2 files changed, 75 insertions(+), 18 deletions(-)

Jan Beulich (1):
      Xen/swiotlb: mark xen_swiotlb_fixup() __init

Juergen Gross (2):
      xen/swiotlb: relax alignment requirements
      x86/xen: allow larger contiguous memory regions in PV guests

