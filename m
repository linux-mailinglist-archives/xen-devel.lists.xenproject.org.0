Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07E57639B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 16:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368262.599466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCMGR-0001EU-Fj; Fri, 15 Jul 2022 14:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368262.599466; Fri, 15 Jul 2022 14:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCMGR-0001BW-CZ; Fri, 15 Jul 2022 14:25:55 +0000
Received: by outflank-mailman (input) for mailman id 368262;
 Fri, 15 Jul 2022 14:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oCMGQ-0001BP-Gq
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 14:25:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083c71fe-044a-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 16:25:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7E1134DD1;
 Fri, 15 Jul 2022 14:25:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F88F13754;
 Fri, 15 Jul 2022 14:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wkAkCvB40WK+QQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Jul 2022 14:25:52 +0000
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
X-Inumbo-ID: 083c71fe-044a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657895152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Tle2lhJhQp2g1mDXUt7ZR3944PM4JXbq65HXWxNQb9s=;
	b=Q72RTBuD7k4s6+lQaBTvP7XBaVckub1f8rXxhmEYqk15ECh+YhcXULfMBDLX5wgm3sUevt
	Sy7CZREhmcgK5mvyF/r2pt77ayU0bXXrwGbDnpImxAQ+rgRtXXPu8V7PVQ1DGDimwk99Ch
	U5mq93BlCh5EhiuDrT92+X1e6paGPnE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: brchuckz@netscape.net,
	jbeulich@suse.com,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"# 5 . 17" <stable@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 0/3] x86: make pat and mtrr independent from each other
Date: Fri, 15 Jul 2022 16:25:46 +0200
Message-Id: <20220715142549.25223-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today PAT can't be used without MTRR being available, unless MTRR is at
least configured via CONFIG_MTRR and the system is running as Xen PV
guest. In this case PAT is automatically available via the hypervisor,
but the PAT MSR can't be modified by the kernel and MTRR is disabled.

As an additional complexity the availability of PAT can't be queried
via pat_enabled() in the Xen PV case, as the lack of MTRR will set PAT
to be disabled. This leads to some drivers believing that not all cache
modes are available, resulting in failures or degraded functionality.

The same applies to a kernel built with no MTRR support: it won't
allow to use the PAT MSR, even if there is no technical reason for
that, other than setting up PAT on all cpus the same way (which is a
requirement of the processor's cache management) is relying on some
MTRR specific code.

Fix all of that by:

- moving the function needed by PAT from MTRR specific code one level
  up
- adding a PAT indirection layer supporting the 3 cases "no or disabled
  PAT", "PAT under kernel control", and "PAT under Xen control"
- removing the dependency of PAT on MTRR

Juergen Gross (3):
  x86: move some code out of arch/x86/kernel/cpu/mtrr
  x86: add wrapper functions for mtrr functions handling also pat
  x86: decouple pat and mtrr handling

 arch/x86/include/asm/memtype.h     |  13 ++-
 arch/x86/include/asm/mtrr.h        |  27 ++++--
 arch/x86/include/asm/processor.h   |  10 +++
 arch/x86/kernel/cpu/common.c       | 123 +++++++++++++++++++++++++++-
 arch/x86/kernel/cpu/mtrr/generic.c |  90 ++------------------
 arch/x86/kernel/cpu/mtrr/mtrr.c    |  58 ++++---------
 arch/x86/kernel/cpu/mtrr/mtrr.h    |   1 -
 arch/x86/kernel/setup.c            |  12 +--
 arch/x86/kernel/smpboot.c          |   8 +-
 arch/x86/mm/pat/memtype.c          | 127 +++++++++++++++++++++--------
 arch/x86/power/cpu.c               |   2 +-
 arch/x86/xen/enlighten_pv.c        |   4 +
 12 files changed, 289 insertions(+), 186 deletions(-)

-- 
2.35.3


