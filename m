Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F203B368309
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115611.220635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZayC-0000cf-3Q; Thu, 22 Apr 2021 15:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115611.220635; Thu, 22 Apr 2021 15:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZayB-0000bm-Vn; Thu, 22 Apr 2021 15:10:19 +0000
Received: by outflank-mailman (input) for mailman id 115611;
 Thu, 22 Apr 2021 15:10:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGUy=JT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZay9-0000Ws-Ss
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:10:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c23aae1-91cf-4201-9b32-06884c40c148;
 Thu, 22 Apr 2021 15:10:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 347DEB173;
 Thu, 22 Apr 2021 15:10:11 +0000 (UTC)
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
X-Inumbo-ID: 4c23aae1-91cf-4201-9b32-06884c40c148
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619104211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BkJA52UJuORwrXbRo8O+/xjjRU0ufo7MZuM5MyCQmjA=;
	b=CajF134GHN/RbxqiBB/w3atAlNOGdArNwDekAEHKBqOq4v1nRKEOWd8ExSJVO7QyBQRCth
	ZYn38ypxpyNUQTUfJkWfB0bemGaMLUEISnXe/il8XYc243is2loOvk16Dkjt14VllIaXmm
	lVEWuVR4bDQVCE/f9TeGxpHMvzi/l98=
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
Subject: [PATCH 2/3] xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
Date: Thu, 22 Apr 2021 17:10:06 +0200
Message-Id: <20210422151007.2205-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210422151007.2205-1-jgross@suse.com>
References: <20210422151007.2205-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XENFEAT_mmu_pt_update_preserve_ad is always set in Xen 4.0 and newer.
Remove coding assuming it might be zero.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 12 ++----------
 arch/x86/xen/mmu_pv.c       |  4 ++--
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index dc0a337f985b..e754927feac7 100644
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
@@ -1303,13 +1302,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
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
index cf2ade864c30..359c711336a8 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2100,8 +2100,8 @@ static const struct pv_mmu_ops xen_mmu_ops __initconst = {
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


