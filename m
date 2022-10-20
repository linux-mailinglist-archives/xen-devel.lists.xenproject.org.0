Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47FE605F92
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426677.675279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUDH-0002pq-AH; Thu, 20 Oct 2022 11:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426677.675279; Thu, 20 Oct 2022 11:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUDH-0002mV-7U; Thu, 20 Oct 2022 11:59:51 +0000
Received: by outflank-mailman (input) for mailman id 426677;
 Thu, 20 Oct 2022 11:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgfI=2V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olUDF-0002mN-MB
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:59:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf798bc-506e-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:59:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53C0920A44;
 Thu, 20 Oct 2022 11:59:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1077413494;
 Thu, 20 Oct 2022 11:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zs6/AjQ4UWNSFAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Oct 2022 11:59:48 +0000
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
X-Inumbo-ID: adf798bc-506e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666267188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oySpgM5g+r0WCk6Eq8kGRfyxgEAOWxWakiY/c8kh3qw=;
	b=JGPhQj1ZV+Sm3I4LVtq4L2JrCJZGFxiejo9qvyBgS68IuVh2HOzZyizIwaITr4r3lBXAam
	rB78ZqWe8tgRiWX2mcORmHaemwL1xdxp0yjq8zNmUfeecmJtUvLa7dUoD6pFb8YPEHLFd4
	/SlQGRy9MJC4I/CPIUhDGbvRjCNvmiM=
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
Subject: [PATCH v2] x86/xen: simplify sysenter and syscall setup
Date: Thu, 20 Oct 2022 13:59:46 +0200
Message-Id: <20221020115946.18772-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_enable_sysenter() and xen_enable_syscall() can be simplified a lot.

While at it, switch to use cpu_feature_enabled() instead of
boot_cpu_has().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use cpu_feature_enabled() (Borislav Petkov)
---
 arch/x86/xen/setup.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index cfa99e8f054b..4f4309500559 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -910,17 +910,9 @@ static int register_callback(unsigned type, const void *func)
 
 void xen_enable_sysenter(void)
 {
-	int ret;
-	unsigned sysenter_feature;
-
-	sysenter_feature = X86_FEATURE_SYSENTER32;
-
-	if (!boot_cpu_has(sysenter_feature))
-		return;
-
-	ret = register_callback(CALLBACKTYPE_sysenter, xen_entry_SYSENTER_compat);
-	if(ret != 0)
-		setup_clear_cpu_cap(sysenter_feature);
+	if (cpu_feature_enabled(X86_FEATURE_SYSENTER32) &&
+	    register_callback(CALLBACKTYPE_sysenter, xen_entry_SYSENTER_compat))
+		setup_clear_cpu_cap(X86_FEATURE_SYSENTER32);
 }
 
 void xen_enable_syscall(void)
@@ -934,12 +926,9 @@ void xen_enable_syscall(void)
 		   mechanism for syscalls. */
 	}
 
-	if (boot_cpu_has(X86_FEATURE_SYSCALL32)) {
-		ret = register_callback(CALLBACKTYPE_syscall32,
-					xen_entry_SYSCALL_compat);
-		if (ret != 0)
-			setup_clear_cpu_cap(X86_FEATURE_SYSCALL32);
-	}
+	if (cpu_feature_enabled(X86_FEATURE_SYSCALL32) &&
+	    register_callback(CALLBACKTYPE_syscall32, xen_entry_SYSCALL_compat))
+		setup_clear_cpu_cap(X86_FEATURE_SYSCALL32);
 }
 
 static void __init xen_pvmmu_arch_setup(void)
-- 
2.35.3


