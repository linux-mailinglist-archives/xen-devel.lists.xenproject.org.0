Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4B745CBD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 15:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558085.871898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGJAU-0005q1-PZ; Mon, 03 Jul 2023 13:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558085.871898; Mon, 03 Jul 2023 13:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGJAU-0005ms-Ml; Mon, 03 Jul 2023 13:00:38 +0000
Received: by outflank-mailman (input) for mailman id 558085;
 Mon, 03 Jul 2023 13:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukTE=CV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qGJAT-0005ml-Ks
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 13:00:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9997a690-19a1-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 15:00:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3FD2218F3;
 Mon,  3 Jul 2023 13:00:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A656138FC;
 Mon,  3 Jul 2023 13:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2xVZJHLGomSYCgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Jul 2023 13:00:34 +0000
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
X-Inumbo-ID: 9997a690-19a1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688389234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g/qfo8Cb33qUzg9p/sYx93BIkx/lh9MH46SOSdnmyf8=;
	b=E0ValWnb8323NYs3nZ1reUyn9xcW6UnT/WjrnwfuddpLUbUcW8umrJK2eBg3GMgbEVZlc5
	e7Op8WL+1NzVEDBRQL2foLY3SM64CFvRMXs5yP/7PJD1wYpI7+kCyTD72S180Jsu1OyMFY
	Lwnv8tdJ/g8zVtBTGNEHkHjIPCjEI1g=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: fix secondary processor fpu initialization
Date: Mon,  3 Jul 2023 15:00:32 +0200
Message-Id: <20230703130032.22916-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving the call of fpu__init_cpu() from cpu_init() to start_secondary()
broke Xen PV guests, as those don't call start_secondary() for APs.

Fix that by adding the call of fpu__init_cpu() to cpu_bringup(), which
is the Xen PV replacement of start_secondary().

Fixes: b81fac906a8f ("x86/fpu: Move FPU initialization into arch_cpu_finalize_init()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/smp_pv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index d5ae5de2daa2..cef78b8c89f4 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -63,6 +63,7 @@ static void cpu_bringup(void)
 	cr4_init();
 	cpuhp_ap_sync_alive();
 	cpu_init();
+	fpu__init_cpu();
 	touch_softlockup_watchdog();
 
 	/* PVH runs in ring 0 and allows us to do native syscalls. Yay! */
-- 
2.35.3


