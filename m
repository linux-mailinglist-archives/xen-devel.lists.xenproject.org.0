Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D5B14A40
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062192.1427834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfr2-0000m4-2y; Tue, 29 Jul 2025 08:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062192.1427834; Tue, 29 Jul 2025 08:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfr1-0000jW-TZ; Tue, 29 Jul 2025 08:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1062192;
 Tue, 29 Jul 2025 08:38:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugfr0-0000jJ-Dq
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:38:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6926ab0c-6c57-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:38:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B35A921285;
 Tue, 29 Jul 2025 08:38:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 894A113A8A;
 Tue, 29 Jul 2025 08:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HCz4H4iIiGigPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 08:38:32 +0000
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
X-Inumbo-ID: 6926ab0c-6c57-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753778312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x1Gw4lEIK4w6Dy0CFcEd1xYx5fwhWSSWD/vqp3z6LW0=;
	b=n2Vvuj+czmYUmrs1ZJnppRXgHt/T0YTjQfYjFBlkLHPKXu5ZPg+86b+SvdZs10en1I/of8
	rFcfN7k4h1dCUBgrqwcjqWuipZdhi3U9KVbb/u1NoNK/HC8pZR3nr174YmusiUIhDoHTVx
	qq6kw7+XFntMX9sqfG9Nsnb/3per8rI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=n2Vvuj+c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753778312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x1Gw4lEIK4w6Dy0CFcEd1xYx5fwhWSSWD/vqp3z6LW0=;
	b=n2Vvuj+czmYUmrs1ZJnppRXgHt/T0YTjQfYjFBlkLHPKXu5ZPg+86b+SvdZs10en1I/of8
	rFcfN7k4h1dCUBgrqwcjqWuipZdhi3U9KVbb/u1NoNK/HC8pZR3nr174YmusiUIhDoHTVx
	qq6kw7+XFntMX9sqfG9Nsnb/3per8rI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 0/2] x86: don't use a memory page for mapping the shared info page
Date: Tue, 29 Jul 2025 10:38:27 +0200
Message-ID: <20250729083829.11038-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B35A921285
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This is a small add-on series after the live-update series sent some
time ago.

I realized that having the shared info page in the normal RAM area is
a bad idea when considering kexec, as the new kernel might want it at
a different location.

So this series is moving the shared info page away from the RAM areas,
resulting in a net win of one memory page.

Changes in V2:
- addressed comments by Jan

Juergen Gross (2):
  mm: provide a way to do very early page table allocations
  x86: don't use a memory page for mapping the shared info page

 arch/x86/mm.c     | 20 ++++++++++++--------
 arch/x86/setup.c  | 15 ++++++++-------
 arch/x86/x86_32.S |  7 +------
 arch/x86/x86_64.S |  7 +------
 hypervisor.c      | 18 ++++++++++++++----
 5 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.43.0


