Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51787B86E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692891.1080523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOH-0005fv-4R; Thu, 14 Mar 2024 07:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692891.1080523; Thu, 14 Mar 2024 07:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOH-0005cj-1b; Thu, 14 Mar 2024 07:20:37 +0000
Received: by outflank-mailman (input) for mailman id 692891;
 Thu, 14 Mar 2024 07:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOF-0005cd-Ke
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:20:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58d593b5-e1d3-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:20:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19B0A1F801;
 Thu, 14 Mar 2024 07:20:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D17913977;
 Thu, 14 Mar 2024 07:20:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Bu7nID+l8mUqDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:20:31 +0000
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
X-Inumbo-ID: 58d593b5-e1d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3JjqpskdWWqkFNyb/N4nRGDuK7ct4tF8cPaLgVVji5c=;
	b=A8aTLtBvZYM/5v7bsN1qa/KcvDXg1P6fZiEPFCsPSLxORnmMwM8VjfVx+rkpoxla/h06fN
	exz3nSjgNV2SZsAqHwXI04RCVypdZLvutjBjOKEkT8ZbiArc45zhHWCLyIzgcbjrIq6QVM
	dazuz8Yt7XyIil9G8QnsIqFZyiydKC4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3JjqpskdWWqkFNyb/N4nRGDuK7ct4tF8cPaLgVVji5c=;
	b=A8aTLtBvZYM/5v7bsN1qa/KcvDXg1P6fZiEPFCsPSLxORnmMwM8VjfVx+rkpoxla/h06fN
	exz3nSjgNV2SZsAqHwXI04RCVypdZLvutjBjOKEkT8ZbiArc45zhHWCLyIzgcbjrIq6QVM
	dazuz8Yt7XyIil9G8QnsIqFZyiydKC4=
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
Subject: [PATCH v5 00/13] xen/spinlock: make recursive spinlocks a dedicated type
Date: Thu, 14 Mar 2024 08:20:16 +0100
Message-Id: <20240314072029.16937-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=A8aTLtBv
X-Spamd-Result: default: False [-1.81 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 19B0A1F801
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Instead of being able to use normal spinlocks as recursive ones, too,
make recursive spinlocks a special lock type.

This will make the spinlock structure smaller in production builds and
add type-safety.

This allows to increase the maximum number of physical cpus from 4095
to 65535 without increasing the size of the lock structure in production
builds (the size of recursive spinlocks in debug builds will grow to
12 bytes due to that change).

Note that rwlock handling is still limiting the number of cpus to 4095,
this is being taken care off in patch 12, which raises the rwlock limit
to 16384 cpus.

Iommu code imposes a limit of 16383 cpus.

Changes in V2:
- addressed comments by Jan Beulich
- lots of additional cleanups
- reorganized complete series

Changes in V3:
- addressed comments by Jan Beulich

Changes in V4:
- former patch 1 has already been applied
- fixed a coding style issue in patch 1

Changes in V5:
- new patches 1 + 10 + 12 + 13
- due to the recent Ghost-race patches the macro layer for calling
  spinlock functions is kept
- addressed comments

Juergen Gross (13):
  xen/spinlock: remove misra rule 21.1 violations
  xen/spinlock: introduce new type for recursive spinlocks
  xen/spinlock: rename recursive lock functions
  xen/spinlock: add rspin_[un]lock_irq[save|restore]()
  xen/spinlock: make struct lock_profile rspinlock_t aware
  xen/spinlock: add explicit non-recursive locking functions
  xen/spinlock: add another function level
  xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
  xen/spinlock: split recursive spinlocks from normal ones
  xen/spinlock: let all is_locked and trylock variants return bool
  xen/spinlock: support higher number of cpus
  xen/rwlock: raise the number of possible cpus
  xen: allow up to 16383 cpus

 xen/arch/Kconfig              |   2 +-
 xen/arch/arm/domain.c         |   4 +-
 xen/arch/arm/mm.c             |   4 +-
 xen/arch/x86/domain.c         |  20 +--
 xen/arch/x86/include/asm/mm.h |   2 +-
 xen/arch/x86/mm.c             |  12 +-
 xen/arch/x86/mm/mem_sharing.c |  16 +--
 xen/arch/x86/mm/mm-locks.h    |   6 +-
 xen/arch/x86/mm/p2m-pod.c     |   6 +-
 xen/arch/x86/mm/p2m.c         |   4 +-
 xen/arch/x86/tboot.c          |   4 +-
 xen/common/domain.c           |   6 +-
 xen/common/domctl.c           |   4 +-
 xen/common/grant_table.c      |  10 +-
 xen/common/ioreq.c            |  54 ++++----
 xen/common/memory.c           |   4 +-
 xen/common/numa.c             |   4 +-
 xen/common/page_alloc.c       |  30 ++---
 xen/common/spinlock.c         | 235 +++++++++++++++++++++++++---------
 xen/drivers/char/console.c    |  38 +++---
 xen/drivers/passthrough/pci.c |   8 +-
 xen/include/xen/rwlock.h      |  18 +--
 xen/include/xen/sched.h       |  10 +-
 xen/include/xen/spinlock.h    | 174 ++++++++++++++++++-------
 24 files changed, 440 insertions(+), 235 deletions(-)

-- 
2.35.3


