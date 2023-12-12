Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5780E815
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652843.1018890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMS-0006ku-N7; Tue, 12 Dec 2023 09:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652843.1018890; Tue, 12 Dec 2023 09:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMS-0006iF-Ka; Tue, 12 Dec 2023 09:47:32 +0000
Received: by outflank-mailman (input) for mailman id 652843;
 Tue, 12 Dec 2023 09:47:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzMQ-0006i7-WC
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:47:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 767241fb-98d3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:47:29 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C6EB1F889;
 Tue, 12 Dec 2023 09:47:28 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D4AF8139E9;
 Tue, 12 Dec 2023 09:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id l+unMi8seGWefgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:47:27 +0000
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
X-Inumbo-ID: 767241fb-98d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e93iIacOyvg8IZOt/GLwCv5VvCaj135nkMbzbrK/9RI=;
	b=qgIaCxSvGV5Q6FcCqyfS9v2n2nHQy+kXTrNOyvYDDhH4Ue6iDl2s6/4Orq7D+FrQfLSYSt
	Nk7ucdP9+hSksJ+BJOO5LVH3cf2xBF6jMJMammmg7xp/HMUIjV8mgRjWCPHfbi740gk/WV
	XxTSOcwPysWkUKmp6y0DhrgwgLRhVjE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e93iIacOyvg8IZOt/GLwCv5VvCaj135nkMbzbrK/9RI=;
	b=qgIaCxSvGV5Q6FcCqyfS9v2n2nHQy+kXTrNOyvYDDhH4Ue6iDl2s6/4Orq7D+FrQfLSYSt
	Nk7ucdP9+hSksJ+BJOO5LVH3cf2xBF6jMJMammmg7xp/HMUIjV8mgRjWCPHfbi740gk/WV
	XxTSOcwPysWkUKmp6y0DhrgwgLRhVjE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v4 00/12] xen/spinlock: make recursive spinlocks a dedicated type
Date: Tue, 12 Dec 2023 10:47:13 +0100
Message-Id: <20231212094725.22184-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Score: 20.10
X-Spam-Level: ******
X-Spamd-Bar: ++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qgIaCxSv;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [6.09 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 6.09
X-Rspamd-Queue-Id: 4C6EB1F889
X-Spam-Flag: NO

Instead of being able to use normal spinlocks as recursive ones, too,
make recursive spinlocks a special lock type.

This will make the spinlock structure smaller in production builds and
add type-safety.

This allows to increase the maximum number of physical cpus from 8191
to 65535 without increasing the size of the lock structure in production
builds (the size of recursive spinlocks in debug builds will grow to
12 bytes due to that change).

Changes in V2:
- addressed comments by Jan Beulich
- lots of additional cleanups
- reorganized complete series

Changes in V3:
- addressed comments by Jan Beulich

Changes in V4:
- former patch 1 has already been applied
- fixed a coding style issue in patch 1

Juergen Gross (12):
  xen/spinlock: reduce lock profile ifdefs
  xen/spinlock: make spinlock initializers more readable
  xen/spinlock: introduce new type for recursive spinlocks
  xen/spinlock: rename recursive lock functions
  xen/spinlock: add rspin_[un]lock_irq[save|restore]()
  xen/spinlock: make struct lock_profile rspinlock_t aware
  xen/spinlock: add explicit non-recursive locking functions
  xen/spinlock: add another function level
  xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
  xen/spinlock: split recursive spinlocks from normal ones
  xen/spinlock: remove indirection through macros for spin_*() functions
  xen/spinlock: support higher number of cpus

 xen/arch/arm/domain.c         |   4 +-
 xen/arch/arm/mm.c             |   4 +-
 xen/arch/x86/domain.c         |  20 +--
 xen/arch/x86/include/asm/mm.h |   2 +-
 xen/arch/x86/mm.c             |  12 +-
 xen/arch/x86/mm/mem_sharing.c |  16 +-
 xen/arch/x86/mm/mm-locks.h    |   6 +-
 xen/arch/x86/mm/p2m-pod.c     |   6 +-
 xen/arch/x86/mm/p2m.c         |   4 +-
 xen/arch/x86/tboot.c          |   4 +-
 xen/arch/x86/traps.c          |  14 +-
 xen/common/domain.c           |   6 +-
 xen/common/domctl.c           |   4 +-
 xen/common/grant_table.c      |  10 +-
 xen/common/ioreq.c            |  54 +++----
 xen/common/memory.c           |   4 +-
 xen/common/numa.c             |   4 +-
 xen/common/page_alloc.c       |  30 ++--
 xen/common/spinlock.c         | 284 ++++++++++++++++++++++++----------
 xen/drivers/char/console.c    |  48 ++----
 xen/drivers/passthrough/pci.c |   8 +-
 xen/include/xen/console.h     |   5 +-
 xen/include/xen/sched.h       |  10 +-
 xen/include/xen/spinlock.h    | 166 +++++++++++++-------
 24 files changed, 437 insertions(+), 288 deletions(-)

-- 
2.35.3


