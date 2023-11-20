Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A621C7F1237
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636630.992228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52c5-0004I3-Ar; Mon, 20 Nov 2023 11:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636630.992228; Mon, 20 Nov 2023 11:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52c5-0004FE-7B; Mon, 20 Nov 2023 11:38:49 +0000
Received: by outflank-mailman (input) for mailman id 636630;
 Mon, 20 Nov 2023 11:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52c3-0004F8-MR
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:38:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da66d84-8799-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 12:38:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED66B2190B;
 Mon, 20 Nov 2023 11:38:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F58413499;
 Mon, 20 Nov 2023 11:38:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5o/GGUVFW2WqPQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:38:45 +0000
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
X-Inumbo-ID: 5da66d84-8799-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NLwENRVTo357k+tumrzZ4ap5+XiZP8RkIEcBvoKnH9Y=;
	b=LejPns590LIlN0YhxaZ+zPC9xbLNuvEWDg4Iu1GJgQsVt6r3rl9oXRpEQ97pb8KiBKTMJR
	TzOlEQ+r6YZpEtX/jQoMJxClhc56yQOO/p9x/5G4KMJQIeL9Tn3qm6Fa3m5KxWKUxvC00Z
	E5TXq4zyJMjtu6BGls2MP0TT8+rB1ZU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
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
Subject: [PATCH v3 00/13] xen/spinlock: make recursive spinlocks a dedicated type
Date: Mon, 20 Nov 2023 12:38:29 +0100
Message-Id: <20231120113842.5897-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_TWELVE(0.00)[18];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
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

Juergen Gross (13):
  xen/spinlock: fix coding style issues
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
 xen/common/spinlock.c         | 296 +++++++++++++++++++++++-----------
 xen/drivers/char/console.c    |  48 ++----
 xen/drivers/passthrough/pci.c |   8 +-
 xen/include/xen/console.h     |   5 +-
 xen/include/xen/sched.h       |  10 +-
 xen/include/xen/spinlock.h    | 176 ++++++++++++--------
 24 files changed, 449 insertions(+), 298 deletions(-)

-- 
2.35.3


