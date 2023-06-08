Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5FD728225
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 16:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545312.851674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7GEl-0003fx-2G; Thu, 08 Jun 2023 14:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545312.851674; Thu, 08 Jun 2023 14:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7GEk-0003dU-UC; Thu, 08 Jun 2023 14:03:38 +0000
Received: by outflank-mailman (input) for mailman id 545312;
 Thu, 08 Jun 2023 14:03:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g9tS=B4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q7GEj-0003dO-GO
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 14:03:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b68ee0-0605-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 16:03:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 921EA21A14;
 Thu,  8 Jun 2023 14:03:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B625138E6;
 Thu,  8 Jun 2023 14:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 21U+BbffgWRCbwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Jun 2023 14:03:35 +0000
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
X-Inumbo-ID: 42b68ee0-0605-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686233015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xLZHfs84yXjkQpWBr2AnjtulNIQynm+15xDEC6bGzuQ=;
	b=B1BzVMJKO7TeqDYmcc2zaHSMN6eIb/lygNZttFSrSJoMUQLDWuQmBUvxa3GM+u6Ar6tK8D
	fxHuEZv/8kO6nBmS7dq40Wp9OJc49L42sD6N3s2LIzcNQx7M1ECOJ0ObJASujCtaIrUlpM
	8COeN5AFtNL1FH3j3PVvtFzlinSONV0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 0/3] x86/paravirt: Get rid of paravirt patching
Date: Thu,  8 Jun 2023 16:03:30 +0200
Message-Id: <20230608140333.4083-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a small series getting rid of paravirt patching by switching
completely to alternative patching for the same functionality.

The basic idea is to add the capability to switch from indirect to
direct calls via a special alternative patching option.

This removes _some_ of the paravirt macro maze, but most of it needs
to stay due to the need of hiding the call instructions from the
compiler in order to avoid needless register save/restore.

What is going away is the nasty stacking of alternative and paravirt
patching and (of course) the special .parainstructions linker section.

I have tested the series on bare metal and as Xen PV domain to still
work.

RFC because I'm quite sure there will be some objtool work needed
(at least removing the specific paravirt handling).

Juergen Gross (3):
  x86/paravirt: move some functions and defines to alternative
  x86/alternative: add indirect call patching
  x86/paravirt: switch mixed paravirt/alternative calls to alternative_2

 arch/x86/include/asm/alternative.h        | 26 +++++-
 arch/x86/include/asm/paravirt.h           | 39 ++-------
 arch/x86/include/asm/paravirt_types.h     | 68 +++-------------
 arch/x86/include/asm/qspinlock_paravirt.h |  4 +-
 arch/x86/include/asm/text-patching.h      | 12 ---
 arch/x86/kernel/alternative.c             | 99 +++++++++++------------
 arch/x86/kernel/callthunks.c              | 17 ++--
 arch/x86/kernel/kvm.c                     |  4 +-
 arch/x86/kernel/module.c                  | 20 ++---
 arch/x86/kernel/paravirt.c                | 54 ++-----------
 arch/x86/kernel/vmlinux.lds.S             | 13 ---
 arch/x86/tools/relocs.c                   |  2 +-
 arch/x86/xen/irq.c                        |  2 +-
 13 files changed, 111 insertions(+), 249 deletions(-)

-- 
2.35.3


