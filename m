Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655EC5B4761
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 17:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404807.647399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kB-0004dy-H1; Sat, 10 Sep 2022 15:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404807.647399; Sat, 10 Sep 2022 15:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kB-0004bz-Cy; Sat, 10 Sep 2022 15:50:07 +0000
Received: by outflank-mailman (input) for mailman id 404807;
 Sat, 10 Sep 2022 15:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oX2k9-0004BJ-Sd
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 15:50:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba19b87-3120-11ed-9760-273f2230c3a0;
 Sat, 10 Sep 2022 17:50:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59B3B21B67;
 Sat, 10 Sep 2022 15:50:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA88A13441;
 Sat, 10 Sep 2022 15:50:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id huotMymyHGNQZAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 10 Sep 2022 15:50:01 +0000
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
X-Inumbo-ID: 3ba19b87-3120-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662825002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KvBcSJfTzw6ZlBSYvDzpGTuAHlQYr/2Q9gCeBjhjNFU=;
	b=a9Lx/Jn/nQKw+dBTWOaTD4U1zTAl9A1DBwroyPHCo87kHMYm8gCNgD7dkwAUhyuuOV0yDH
	cOmT4AcC18jYwqV9SwVBU7ZIxZcZamJXJRKzjsJAUOP2te6JeNOqLf96vv3pLhqH6dEsfb
	uBCfD5PeJxmYK7AXusnitYGYvi59W7o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a dedicated type
Date: Sat, 10 Sep 2022 17:49:56 +0200
Message-Id: <20220910154959.15971-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of being able to use normal spinlocks as recursive ones, too,
make recursive spinlocks a special lock type.

This will make the spinlock structure smaller in production builds and
add type-safety.

Juergen Gross (3):
  xen/spinlock: add explicit non-recursive locking functions
  xen/spinlock: split recursive spinlocks from normal ones
  xen/spinlock: support higher number of cpus

 xen/arch/arm/mm.c             |  4 +--
 xen/arch/x86/domain.c         | 12 +++----
 xen/arch/x86/include/asm/mm.h |  2 +-
 xen/arch/x86/mm.c             | 12 +++----
 xen/arch/x86/mm/mem_sharing.c |  8 ++---
 xen/arch/x86/mm/mm-locks.h    |  2 +-
 xen/arch/x86/mm/p2m-pod.c     |  6 ++--
 xen/arch/x86/mm/p2m.c         |  4 +--
 xen/arch/x86/numa.c           |  4 +--
 xen/arch/x86/tboot.c          |  4 +--
 xen/common/domain.c           |  6 ++--
 xen/common/domctl.c           |  4 +--
 xen/common/grant_table.c      | 10 +++---
 xen/common/ioreq.c            |  2 +-
 xen/common/memory.c           |  4 +--
 xen/common/page_alloc.c       | 18 +++++-----
 xen/common/spinlock.c         | 22 +++++++-----
 xen/drivers/char/console.c    | 24 ++++++-------
 xen/drivers/passthrough/pci.c |  4 +--
 xen/include/xen/sched.h       |  6 ++--
 xen/include/xen/spinlock.h    | 68 +++++++++++++++++++++++++----------
 21 files changed, 131 insertions(+), 95 deletions(-)

-- 
2.35.3


