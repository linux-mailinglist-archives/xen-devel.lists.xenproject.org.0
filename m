Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F827C8262
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616350.958285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEgj-0000gm-8J; Fri, 13 Oct 2023 09:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616350.958285; Fri, 13 Oct 2023 09:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEgj-0000df-5f; Fri, 13 Oct 2023 09:42:33 +0000
Received: by outflank-mailman (input) for mailman id 616350;
 Fri, 13 Oct 2023 09:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrEgi-0000dZ-49
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:42:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d34b637c-69ac-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 11:42:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA3DE21891;
 Fri, 13 Oct 2023 09:42:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 608CD1358F;
 Fri, 13 Oct 2023 09:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0HxbFgQRKWUKGwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 09:42:28 +0000
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
X-Inumbo-ID: d34b637c-69ac-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697190148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fTzJIQp6znmn5VajoA1i/XMC/nPFDMfKldCpx9C01pE=;
	b=VJS41FxSwILxki8I8pxogPRsB2sz2LZ0NbOVKjuwvHg2l6kOHJzVQBiTA0BeDnW8/Ycga1
	tc1XJlQFikxGZCLTx71iwjWc6WzCbZm9fyqpYVTt+4TjeJpfqrDYj6jvTTNn62nxEPUFho
	eoHXkdW+SdbvFZ1pXVa/b8iNn0vTMvo=
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v2 00/13] xen/spinlock: make recursive spinlocks a dedicated type
Date: Fri, 13 Oct 2023 11:42:11 +0200
Message-Id: <20231013094224.7060-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.90
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[38.51%]
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
 xen/common/spinlock.c         | 292 +++++++++++++++++++++++-----------
 xen/drivers/char/console.c    |  48 ++----
 xen/drivers/passthrough/pci.c |   8 +-
 xen/include/xen/console.h     |   5 +-
 xen/include/xen/sched.h       |  10 +-
 xen/include/xen/spinlock.h    | 176 ++++++++++++--------
 24 files changed, 447 insertions(+), 296 deletions(-)

-- 
2.35.3


