Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BD7CA828
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 14:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617510.960137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMsm-0001yY-9X; Mon, 16 Oct 2023 12:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617510.960137; Mon, 16 Oct 2023 12:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMsm-0001wE-6k; Mon, 16 Oct 2023 12:39:40 +0000
Received: by outflank-mailman (input) for mailman id 617510;
 Mon, 16 Oct 2023 12:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsMsl-0001w4-6z
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 12:39:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1108a001-6c21-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 14:39:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9FCDA1F37F;
 Mon, 16 Oct 2023 12:39:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27145133B7;
 Mon, 16 Oct 2023 12:39:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8jQZCAcvLWX4IgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 12:39:35 +0000
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
X-Inumbo-ID: 1108a001-6c21-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697459975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TrHQ0ELhL7iWzaPXNchammsXfJ1VpjNzr9oy6lA6Krc=;
	b=YzXXQasXeVaCM4rll76gJ/cRr0gpD70UiJXXyCcxaVKzwc9L4AXNbvBrVwebwOapoEgD/V
	kOvKYPLYE1drK+oaVua+5/yuA0E3o3tYXm/4BGroCwxVwrDXMIXbHrdl6BnhOJf4Kxonoe
	BdcUCorSEAPEtsoXqKVKuI5f9GWDvX4=
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
Subject: [PATCH v2 0/4] x86/paravirt: Get rid of paravirt patching
Date: Mon, 16 Oct 2023 14:39:29 +0200
Message-Id: <20231016123933.17284-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spam-Score: 4.05
X-Spamd-Result: default: False [4.05 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.85)[-0.851];
	 NEURAL_SPAM_LONG(3.00)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[18];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

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

Changes in V2:
- split last patch into 2
- rebase of patch 2 as suggested by Peter
- addressed Peter's comments for patch 3

Juergen Gross (4):
  x86/paravirt: move some functions and defines to alternative
  x86/alternative: add indirect call patching
  x86/paravirt: switch mixed paravirt/alternative calls to alternative_2
  x86/paravirt: remove no longer needed paravirt patching code

 arch/x86/include/asm/alternative.h        |  26 ++++-
 arch/x86/include/asm/paravirt.h           |  79 +++++----------
 arch/x86/include/asm/paravirt_types.h     |  73 +++-----------
 arch/x86/include/asm/qspinlock_paravirt.h |   4 +-
 arch/x86/include/asm/text-patching.h      |  12 ---
 arch/x86/kernel/alternative.c             | 116 ++++++++++------------
 arch/x86/kernel/callthunks.c              |  17 ++--
 arch/x86/kernel/kvm.c                     |   4 +-
 arch/x86/kernel/module.c                  |  20 +---
 arch/x86/kernel/paravirt.c                |  54 ++--------
 arch/x86/kernel/vmlinux.lds.S             |  13 ---
 arch/x86/tools/relocs.c                   |   2 +-
 arch/x86/xen/irq.c                        |   2 +-
 13 files changed, 137 insertions(+), 285 deletions(-)

-- 
2.35.3


