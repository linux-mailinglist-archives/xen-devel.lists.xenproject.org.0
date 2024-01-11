Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240782AE92
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 13:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666242.1036736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu2G-0001NZ-AZ; Thu, 11 Jan 2024 12:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666242.1036736; Thu, 11 Jan 2024 12:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu2G-0001Kq-6u; Thu, 11 Jan 2024 12:19:48 +0000
Received: by outflank-mailman (input) for mailman id 666242;
 Thu, 11 Jan 2024 12:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CYFo=IV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rNu2E-0001Hk-Rd
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 12:19:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ac0b74-b07b-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 13:19:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90A221FBA7;
 Thu, 11 Jan 2024 12:19:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B8DA13635;
 Thu, 11 Jan 2024 12:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OowEGeDcn2UCIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 11 Jan 2024 12:19:44 +0000
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
X-Inumbo-ID: b4ac0b74-b07b-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704975584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zAsSdZzhpnvzBzTmhbdd6Q4oWrx5BMkN+qXi6QhRV1I=;
	b=lrEmUO3uA25sEQr2plez6YkkiaG1pzvp5Pb67rNR/2UCNEtCbrmDydOj0rttzXXWHWdm2r
	jOpfVXCEJG7yOwUcBhHVOiYgclbv+GbBwWIpp0TI6tQwHjVDKysgnIcUbmJay7g9GvFAmN
	z36h2dp92uko9OlElUJd8JJeFpvrw8U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704975584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zAsSdZzhpnvzBzTmhbdd6Q4oWrx5BMkN+qXi6QhRV1I=;
	b=lrEmUO3uA25sEQr2plez6YkkiaG1pzvp5Pb67rNR/2UCNEtCbrmDydOj0rttzXXWHWdm2r
	jOpfVXCEJG7yOwUcBhHVOiYgclbv+GbBwWIpp0TI6tQwHjVDKysgnIcUbmJay7g9GvFAmN
	z36h2dp92uko9OlElUJd8JJeFpvrw8U=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.8-rc1
Date: Thu, 11 Jan 2024 13:19:43 +0100
Message-Id: <20240111121943.3342-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[43.69%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-0.99)[-0.994];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.8-rc1-tag

xen: branch for v6.8-rc1

It contains:

- a patch updating some Xen PV interface related headers
- a patch fixing some kernel-doc comments in the xenbus driver
- a patch fixing the Xen gntdev driver to not access the struct page
  of pages imported from a DMA-buf


Thanks.

Juergen

 drivers/xen/gntdev-dmabuf.c        | 50 ++++++++++++++++----------------
 drivers/xen/xenbus/xenbus_client.c | 59 ++++++++++++++++++++++----------------
 include/xen/interface/io/displif.h |  2 +-
 include/xen/interface/io/ring.h    |  2 +-
 include/xen/interface/io/sndif.h   |  2 +-
 5 files changed, 62 insertions(+), 53 deletions(-)

Juergen Gross (1):
      xen: update PV-device interface headers

Oleksandr Tyshchenko (1):
      xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import

Randy Dunlap (1):
      xen/xenbus: client: fix kernel-doc comments

