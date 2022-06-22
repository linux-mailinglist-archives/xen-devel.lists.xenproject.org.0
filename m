Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2245550EB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 18:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354197.581272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42wS-0002ty-2p; Wed, 22 Jun 2022 16:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354197.581272; Wed, 22 Jun 2022 16:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42wR-0002rk-Vc; Wed, 22 Jun 2022 16:10:55 +0000
Received: by outflank-mailman (input) for mailman id 354197;
 Wed, 22 Jun 2022 16:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o42wQ-0002LP-HP
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 16:10:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e346282f-f245-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 18:10:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D4FE1F8E1;
 Wed, 22 Jun 2022 16:10:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C084013AC7;
 Wed, 22 Jun 2022 16:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +DmlLQs/s2JzCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 16:10:51 +0000
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
X-Inumbo-ID: e346282f-f245-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655914252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3utwreIcXrsHaZ2aPHJW+ToYT/lkMci89t36LS1rRtk=;
	b=rX2V6UHCEbDokFsQZRoynOuusc4yhrQefn8Slx89yncv7CUS9rWToPJogg9VgkkRvxO5zF
	N7BA+/1Vos8rc9Z+chjfuoz3ATNTNR2xeetaKfYJXvrv6KH3E/uFe1jwy76fiUCBiELIRh
	sXBNDkiFiCrv7gLrbWjiPv+yKlln+t4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/2] x86: fix setup of brk area
Date: Wed, 22 Jun 2022 18:10:48 +0200
Message-Id: <20220622161048.4483-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622161048.4483-1-jgross@suse.com>
References: <20220622161048.4483-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
put the brk area into the .bss segment, causing it not to be cleared
initially. As the brk area is used to allocate early page tables, these
might contain garbage in not explicitly written entries.

This is especially a problem for Xen PV guests, as the hypervisor will
validate page tables (check for writable page tables and hypervisor
private bits) before accepting them to be used. There have been reports
of early crashes of PV guests due to illegal page table contents.

Fix that by letting clear_bss() clear the brk area, too.

Fixes: e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/head64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index e7e233209a8c..6a3cfaf6b72a 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -430,6 +430,8 @@ void __init clear_bss(void)
 {
 	memset(__bss_start, 0,
 	       (unsigned long) __bss_stop - (unsigned long) __bss_start);
+	memset(__brk_base, 0,
+	       (unsigned long) __brk_limit - (unsigned long) __brk_base);
 }
 
 static unsigned long get_cmd_line_ptr(void)
-- 
2.35.3


