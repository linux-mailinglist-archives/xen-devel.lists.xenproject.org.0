Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260963DB462
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 09:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162326.297735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9MmY-0006Kq-Gu; Fri, 30 Jul 2021 07:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162326.297735; Fri, 30 Jul 2021 07:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9MmY-0006Gn-Dn; Fri, 30 Jul 2021 07:18:10 +0000
Received: by outflank-mailman (input) for mailman id 162326;
 Fri, 30 Jul 2021 07:18:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9MmX-0006Du-13
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 07:18:09 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ed57977-2e82-49ba-a4c9-1248175ef1e7;
 Fri, 30 Jul 2021 07:18:08 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48B1B1FDB8;
 Fri, 30 Jul 2021 07:18:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F1E8613748;
 Fri, 30 Jul 2021 07:18:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gEHcOa6nA2FufQAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 07:18:06 +0000
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
X-Inumbo-ID: 0ed57977-2e82-49ba-a4c9-1248175ef1e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627629487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiGuhZ6peP0OyKJAWTTjdxww+zrMIYBBDWdPs4yyawo=;
	b=gNlUD5gMM0mE/D5nD9CzenbbL5/H0UE/NgIAm/XUY858kcCf+GMFVnQBd5kS+JFNWF9YSV
	bdFmmwQYVnVydNdb8UHm5qJgkxqtpOKqem8jj7kF/gUtSOXbsFS/JoxDlSu2teBMdPE+BQ
	1jrymsXmezVEAPqIsKDItGMIGbmiS58=
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
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 2/3] xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
Date: Fri, 30 Jul 2021 09:18:03 +0200
Message-Id: <20210730071804.4302-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210730071804.4302-1-jgross@suse.com>
References: <20210730071804.4302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XENFEAT_mmu_pt_update_preserve_ad is always set in Xen 4.0 and newer.
Remove coding assuming it might be zero.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/xen/enlighten_pv.c | 12 ++----------
 arch/x86/xen/mmu_pv.c       |  4 ++--
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 03149422dce2..753f63734c13 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -116,9 +116,8 @@ static void __init xen_banner(void)
 	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
 
 	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
-	printk(KERN_INFO "Xen version: %d.%d%s%s\n",
-	       version >> 16, version & 0xffff, extra.extraversion,
-	       xen_feature(XENFEAT_mmu_pt_update_preserve_ad) ? " (preserve-AD)" : "");
+	pr_info("Xen version: %d.%d%s (preserve-AD)\n",
+		version >> 16, version & 0xffff, extra.extraversion);
 }
 
 static void __init xen_pv_init_platform(void)
@@ -1302,13 +1301,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	xen_init_apic();
 #endif
 
-	if (xen_feature(XENFEAT_mmu_pt_update_preserve_ad)) {
-		pv_ops.mmu.ptep_modify_prot_start =
-			xen_ptep_modify_prot_start;
-		pv_ops.mmu.ptep_modify_prot_commit =
-			xen_ptep_modify_prot_commit;
-	}
-
 	machine_ops = xen_machine_ops;
 
 	/*
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index ade789e73ee4..1df5f01529e5 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2099,8 +2099,8 @@ static const struct pv_mmu_ops xen_mmu_ops __initconst = {
 	.set_pte = xen_set_pte_init,
 	.set_pmd = xen_set_pmd_hyper,
 
-	.ptep_modify_prot_start = __ptep_modify_prot_start,
-	.ptep_modify_prot_commit = __ptep_modify_prot_commit,
+	.ptep_modify_prot_start = xen_ptep_modify_prot_start,
+	.ptep_modify_prot_commit = xen_ptep_modify_prot_commit,
 
 	.pte_val = PV_CALLEE_SAVE(xen_pte_val),
 	.pgd_val = PV_CALLEE_SAVE(xen_pgd_val),
-- 
2.26.2


