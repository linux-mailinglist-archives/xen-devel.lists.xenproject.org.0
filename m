Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9AD59ACDB
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 11:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390678.628181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjb-0006Qc-Sc; Sat, 20 Aug 2022 09:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390678.628181; Sat, 20 Aug 2022 09:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjb-0006NR-P9; Sat, 20 Aug 2022 09:25:39 +0000
Received: by outflank-mailman (input) for mailman id 390678;
 Sat, 20 Aug 2022 09:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cfLG=YY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oPKjb-0006NL-6g
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 09:25:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cd3474e-206a-11ed-bd2e-47488cf2e6aa;
 Sat, 20 Aug 2022 11:25:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5923337A8;
 Sat, 20 Aug 2022 09:25:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 627FB13440;
 Sat, 20 Aug 2022 09:25:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WEGEFpCoAGPJMAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 20 Aug 2022 09:25:36 +0000
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
X-Inumbo-ID: 0cd3474e-206a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660987536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kJU1ufk7XsI6BxvM7y8ee3l2GxtzRVD+Tg1mt0G7ZYc=;
	b=J+NnjJlsSZkjxe4+QRQfV1WFaeKpYiRY31Xsi/w8OiVSq6NjuIY7p8QpDu1g83mJSEjP7U
	/WkFYpr2jvyeLB11aZ9DKc94f+Ghl4j9SAWsS5iXxO6dtpRNXWvJR9jrx4LohFq/zijX8q
	F/nJvM90ehANBi/p58aDfOujwRwNRrs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 00/10] x86: make pat and mtrr independent from each other
Date: Sat, 20 Aug 2022 11:25:23 +0200
Message-Id: <20220820092533.29420-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today PAT can't be used without MTRR being available, unless MTRR is at
least configured via CONFIG_MTRR and the system is running as Xen PV
guest. In this case PAT is automatically available via the hypervisor,
but the PAT MSR can't be modified by the kernel and MTRR is disabled.

The same applies to a kernel built with no MTRR support: it won't
allow to use the PAT MSR, even if there is no technical reason for
that, other than setting up PAT on all cpus the same way (which is a
requirement of the processor's cache management) is relying on some
MTRR specific code.

Fix all of that by:

- moving the function needed by PAT from MTRR specific code one level
  up
- reworking the init sequences of MTRR and PAT to be more similar to
  each other without calling PAT from MTRR code
- removing the dependency of PAT on MTRR

While working on that I discovered two minor bugs in MTRR code, which
are fixed, too.

Changes in V2:
- complete rework of the patches based on comments by Boris Petkov
- added several patches to the series

Juergen Gross (10):
  x86/mtrr: fix MTRR fixup on APs
  x86/mtrr: remove unused cyrix_set_all() function
  x86/mtrr: replace use_intel() with a local flag
  x86: move some code out of arch/x86/kernel/cpu/mtrr
  x86/mtrr: split generic_set_all()
  x86/mtrr: remove set_all callback from struct mtrr_ops
  x86/mtrr: simplify mtrr_bp_init()
  x86/mtrr: let cache_aps_delayed_init replace mtrr_aps_delayed_init
  x86/mtrr: add a stop_machine() handler calling only cache_cpu_init()
  x86: decouple pat and mtrr handling

 arch/x86/include/asm/cacheinfo.h   |  14 +++
 arch/x86/include/asm/memtype.h     |   5 +-
 arch/x86/include/asm/mtrr.h        |  12 +--
 arch/x86/kernel/cpu/cacheinfo.c    | 159 +++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/common.c       |   3 +-
 arch/x86/kernel/cpu/mtrr/cyrix.c   |  34 ------
 arch/x86/kernel/cpu/mtrr/generic.c | 120 ++++------------------
 arch/x86/kernel/cpu/mtrr/mtrr.c    | 158 +++++-----------------------
 arch/x86/kernel/cpu/mtrr/mtrr.h    |   5 -
 arch/x86/kernel/setup.c            |  14 +--
 arch/x86/kernel/smpboot.c          |   9 +-
 arch/x86/mm/pat/memtype.c          | 127 +++++++----------------
 arch/x86/power/cpu.c               |   3 +-
 13 files changed, 274 insertions(+), 389 deletions(-)

-- 
2.35.3


