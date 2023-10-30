Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F158B7DBBB3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625144.974112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTCg-0004me-2e; Mon, 30 Oct 2023 14:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625144.974112; Mon, 30 Oct 2023 14:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTCf-0004kB-VV; Mon, 30 Oct 2023 14:25:17 +0000
Received: by outflank-mailman (input) for mailman id 625144;
 Mon, 30 Oct 2023 14:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ec4L=GM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qxTCe-0004k5-4J
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:25:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 229487ea-7730-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 15:25:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3DA0021CAD;
 Mon, 30 Oct 2023 14:25:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB99E138F8;
 Mon, 30 Oct 2023 14:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S2xyLMa8P2W0QAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Oct 2023 14:25:10 +0000
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
X-Inumbo-ID: 229487ea-7730-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698675911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y2ADXZuRUSMr2od9G+oNY1AaP5CziwipA6lK0SssnIw=;
	b=h4OOWOe06DQ9hnKJPsEwywmZI2lFAj/geZAZMPADqRPLqQggbHPr0WJDCOBES0ID1ErhY/
	ei7JimsZMOQJkqo38O3ifbz/+A0vBIOqslQrabGE9kxAmHBtet/L6RnMg2aWqskon4wXWT
	OaKHVj4gP5to5B2P53gNeadd+lriP70=
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
	Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/5] x86/paravirt: Get rid of paravirt patching
Date: Mon, 30 Oct 2023 15:25:03 +0100
Message-Id: <20231030142508.1407-1-jgross@suse.com>
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

Note that objtool might need some changes to cope with the new
indirect call patching mechanism. Additionally some paravirt handling
can probably be removed from it.

Changes in V4:
- addressed Boris' comments in patch 1
- fixed bugs found by kernel test robot (patch 2)

Changes in V3:
- split v2 patch 3 into 2 patches as requested by Peter and Ingo

Changes in V2:
- split last patch into 2
- rebase of patch 2 as suggested by Peter
- addressed Peter's comments for patch 3

Juergen Gross (5):
  x86/paravirt: move some functions and defines to alternative
  x86/alternative: add indirect call patching
  x86/paravirt: introduce ALT_NOT_XEN
  x86/paravirt: switch mixed paravirt/alternative calls to alternative_2
  x86/paravirt: remove no longer needed paravirt patching code

 arch/x86/include/asm/alternative.h        |  30 +++++-
 arch/x86/include/asm/paravirt.h           |  79 ++++----------
 arch/x86/include/asm/paravirt_types.h     |  73 +++----------
 arch/x86/include/asm/qspinlock_paravirt.h |   4 +-
 arch/x86/include/asm/text-patching.h      |  12 ---
 arch/x86/kernel/alternative.c             | 121 ++++++++++------------
 arch/x86/kernel/callthunks.c              |  17 ++-
 arch/x86/kernel/kvm.c                     |   4 +-
 arch/x86/kernel/module.c                  |  20 +---
 arch/x86/kernel/paravirt.c                |  54 ++--------
 arch/x86/kernel/vmlinux.lds.S             |  13 ---
 arch/x86/tools/relocs.c                   |   2 +-
 arch/x86/xen/irq.c                        |   2 +-
 13 files changed, 146 insertions(+), 285 deletions(-)

-- 
2.35.3


