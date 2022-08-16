Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C3595382
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 09:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388004.624527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNqjo-0002oG-Ou; Tue, 16 Aug 2022 07:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388004.624527; Tue, 16 Aug 2022 07:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNqjo-0002lL-LY; Tue, 16 Aug 2022 07:11:44 +0000
Received: by outflank-mailman (input) for mailman id 388004;
 Tue, 16 Aug 2022 07:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQK8=YU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNqjm-0002lF-WD
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 07:11:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7027b00-1d32-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 09:11:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BE7534BCC;
 Tue, 16 Aug 2022 07:11:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD685139B7;
 Tue, 16 Aug 2022 07:11:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TFETKStD+2IqPQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Aug 2022 07:11:39 +0000
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
X-Inumbo-ID: a7027b00-1d32-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660633900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=h6M793SMY2ynvWE6o2wfHm041bnCM3HfZCKa0vLCTLw=;
	b=Mnw1d5F8tJcd+2r4BZoh0xSWKXDiI7+4lg4EXt0O0JeuEibB9/ttLcmvqnCvzkQjQlsIfq
	cPQBqndN4J06ZB89+uOr1tOMexHZu+bnr/pcckpzdReiYrI3/3W8a1mPM1ePMASQ73nmRN
	4hOH/RWI+ptWU2HuqYTQwWApTd3Hm34=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org
Subject: [PATCH] x86/entry: fix entry_INT80_compat for Xen PV guests
Date: Tue, 16 Aug 2022 09:11:37 +0200
Message-Id: <20220816071137.4893-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c89191ce67ef ("x86/entry: Convert SWAPGS to swapgs and remove
the definition of SWAPGS") missed one use case of SWAPGS in
entry_INT80_compat. Removing of the SWAPGS macro led to asm just
using "swapgs", as it is accepting instructions in capital letters,
too.

This in turn leads to splats in Xen PV guests like:

[   36.145223] general protection fault, maybe for address 0x2d: 0000 [#1] PREEMPT SMP NOPTI
[   36.145794] CPU: 2 PID: 1847 Comm: ld-linux.so.2 Not tainted 5.19.1-1-default #1 openSUSE Tumbleweed f3b44bfb672cdb9f235aff53b57724eba8b9411b
[   36.146608] Hardware name: HP ProLiant ML350p Gen8, BIOS P72 11/14/2013
[   36.148126] RIP: e030:entry_INT80_compat+0x3/0xa3

Fix that by open coding this single instance of the SWAPGS macro.

Cc: <stable@vger.kernel.org> # 5.19
Fixes: c89191ce67ef ("x86/entry: Convert SWAPGS to swapgs and remove the definition of SWAPGS")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/entry/entry_64_compat.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
index 682338e7e2a3..4dd19819053a 100644
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -311,7 +311,7 @@ SYM_CODE_START(entry_INT80_compat)
 	 * Interrupts are off on entry.
 	 */
 	ASM_CLAC			/* Do this early to minimize exposure */
-	SWAPGS
+	ALTERNATIVE "swapgs", "", X86_FEATURE_XENPV
 
 	/*
 	 * User tracing code (ptrace or signal handlers) might assume that
-- 
2.35.3


