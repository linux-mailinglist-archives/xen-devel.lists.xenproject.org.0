Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD83FFC48
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177912.323689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4tM-000768-TJ; Fri, 03 Sep 2021 08:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177912.323689; Fri, 03 Sep 2021 08:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4tM-00073L-Q2; Fri, 03 Sep 2021 08:49:44 +0000
Received: by outflank-mailman (input) for mailman id 177912;
 Fri, 03 Sep 2021 08:49:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FOYs=NZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mM4tK-0006nG-Mc
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:49:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0641ded-0c93-11ec-aefe-12813bfff9fa;
 Fri, 03 Sep 2021 08:49:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9E082001B;
 Fri,  3 Sep 2021 08:49:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 71D981374A;
 Fri,  3 Sep 2021 08:49:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eKY/GqThMWFjdAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 03 Sep 2021 08:49:40 +0000
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
X-Inumbo-ID: e0641ded-0c93-11ec-aefe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630658980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDxNZDOT6mQUMNCs/5bHO5A+JEd2XgxBAJXhmBdSbbw=;
	b=VbpC8r2iK1pOQ9eNi1TouFnvGAEG3Q2l//bLETrWhVa1Mvebnw9WTw+3fU42jh0vUotgsp
	luWP3rWesmgxuuRQkhvF72sZKVDy7LzQ6MpzomsIjNTl9HKI+OUwVrQXGEPTWdiRmsnWai
	o6EzteyS0M7u3UJpASPIGqLHXQUgGIo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] xen: reset legacy rtc flag for PV domU
Date: Fri,  3 Sep 2021 10:49:37 +0200
Message-Id: <20210903084937.19392-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210903084937.19392-1-jgross@suse.com>
References: <20210903084937.19392-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Xen PV guest doesn't have a legacy RTC device, so reset the legacy
RTC flag. Otherwise the following WARN splat will occur at boot:

[    1.333404] WARNING: CPU: 1 PID: 1 at /home/gross/linux/head/drivers/rtc/rtc-mc146818-lib.c:25 mc146818_get_time+0x1be/0x210
[    1.333404] Modules linked in:
[    1.333404] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc7-default+ #282
[    1.333404] RIP: e030:mc146818_get_time+0x1be/0x210
[    1.333404] Code: c0 64 01 c5 83 fd 45 89 6b 14 7f 06 83 c5 64 89 6b 14 41 83 ec 01 b8 02 00 00 00 44 89 63 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b 48 c7 c7 30 0e ef 82 4c 89 e6 e8 71 2a 24 00 48 c7 c0 ff ff
[    1.333404] RSP: e02b:ffffc90040093df8 EFLAGS: 00010002
[    1.333404] RAX: 00000000000000ff RBX: ffffc90040093e34 RCX: 0000000000000000
[    1.333404] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 000000000000000d
[    1.333404] RBP: ffffffff82ef0e30 R08: ffff888005013e60 R09: 0000000000000000
[    1.333404] R10: ffffffff82373e9b R11: 0000000000033080 R12: 0000000000000200
[    1.333404] R13: 0000000000000000 R14: 0000000000000002 R15: ffffffff82cdc6d4
[    1.333404] FS:  0000000000000000(0000) GS:ffff88807d440000(0000) knlGS:0000000000000000
[    1.333404] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.333404] CR2: 0000000000000000 CR3: 000000000260a000 CR4: 0000000000050660
[    1.333404] Call Trace:
[    1.333404]  ? wakeup_sources_sysfs_init+0x30/0x30
[    1.333404]  ? rdinit_setup+0x2b/0x2b
[    1.333404]  early_resume_init+0x23/0xa4
[    1.333404]  ? cn_proc_init+0x36/0x36
[    1.333404]  do_one_initcall+0x3e/0x200
[    1.333404]  kernel_init_freeable+0x232/0x28e
[    1.333404]  ? rest_init+0xd0/0xd0
[    1.333404]  kernel_init+0x16/0x120
[    1.333404]  ret_from_fork+0x1f/0x30

Cc: <stable@vger.kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 753f63734c13..349f780a1567 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1214,6 +1214,11 @@ static void __init xen_dom0_set_legacy_features(void)
 	x86_platform.legacy.rtc = 1;
 }
 
+static void __init xen_domu_set_legacy_features(void)
+{
+	x86_platform.legacy.rtc = 0;
+}
+
 /* First C function to be called on Xen boot */
 asmlinkage __visible void __init xen_start_kernel(void)
 {
@@ -1359,6 +1364,8 @@ asmlinkage __visible void __init xen_start_kernel(void)
 		add_preferred_console("xenboot", 0, NULL);
 		if (pci_xen)
 			x86_init.pci.arch_init = pci_xen_init;
+		x86_platform.set_legacy_features =
+				xen_domu_set_legacy_features;
 	} else {
 		const struct dom0_vga_console_info *info =
 			(void *)((char *)xen_start_info +
-- 
2.26.2


