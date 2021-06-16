Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF9B3A93F3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 09:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142736.263299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltQ07-0006kB-Ki; Wed, 16 Jun 2021 07:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142736.263299; Wed, 16 Jun 2021 07:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltQ07-0006i7-Gz; Wed, 16 Jun 2021 07:30:15 +0000
Received: by outflank-mailman (input) for mailman id 142736;
 Wed, 16 Jun 2021 07:30:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltQ05-0006d2-Pk
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 07:30:13 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcca34ec-6c56-4ee8-928c-4016de194043;
 Wed, 16 Jun 2021 07:30:11 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0071A1FD64;
 Wed, 16 Jun 2021 07:30:11 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A8DBC118DD;
 Wed, 16 Jun 2021 07:30:10 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GDcVKIKoyWBfZAAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 16 Jun 2021 07:30:10 +0000
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
X-Inumbo-ID: fcca34ec-6c56-4ee8-928c-4016de194043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623828611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5lCFKLS4SrkKe1lJQmspLTLsY+q2DCNZBeEteAkDQg=;
	b=kBk7upbTudELxn7yk841qgv/oTl4rY+JGrnXx/ubDi7or2hFGGLcCc/8IfvwqRjNXUmSs8
	DvdYGZHd+Nl/PdO99VHbDn9iHrQb8dHkoOHCudS/c0YIIBoEVMTyWWWTMF6kIviO54rDko
	riExKLBpi2seQw6jy11YdqeHGxnRf+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623828610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5lCFKLS4SrkKe1lJQmspLTLsY+q2DCNZBeEteAkDQg=;
	b=eZR6UrR0IN/1H5lwf+BJwP8nIqhw0G0LC3nS3EHasCUSZUHuKQtAyH9P4xUtVldEvTR4+n
	TvEL48QavumVOcMtRU9RbokYzMc6wbMcBITMtPW4k48qrxHo53UDD6xeF7CaHeQbxnlpnt
	HO6SlWPPONAx2ISAbOkkl56EZ1vSlGs=
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
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/2] xen: rename wrong named pfn related variables
Date: Wed, 16 Jun 2021 09:30:07 +0200
Message-Id: <20210616073007.5215-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616073007.5215-1-jgross@suse.com>
References: <20210616073007.5215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some variables in Xen specific coding which names imply them
holding a PFN, while in reality they are containing numbers of PFNs.

Rename them accordingly.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/page.h |  4 ++--
 arch/x86/xen/p2m.c              | 31 ++++++++++++++++---------------
 arch/x86/xen/setup.c            |  2 +-
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 1a162e559753..3590d6bf42c7 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -51,7 +51,7 @@ extern unsigned long *machine_to_phys_mapping;
 extern unsigned long  machine_to_phys_nr;
 extern unsigned long *xen_p2m_addr;
 extern unsigned long  xen_p2m_size;
-extern unsigned long  xen_max_p2m_pfn;
+extern unsigned long  xen_p2m_max_size;
 
 extern int xen_alloc_p2m_entry(unsigned long pfn);
 
@@ -144,7 +144,7 @@ static inline unsigned long __pfn_to_mfn(unsigned long pfn)
 
 	if (pfn < xen_p2m_size)
 		mfn = xen_p2m_addr[pfn];
-	else if (unlikely(pfn < xen_max_p2m_pfn))
+	else if (unlikely(pfn < xen_p2m_max_size))
 		return get_phys_to_machine(pfn);
 	else
 		return IDENTITY_FRAME(pfn);
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 5e6e236977c7..babdc18dbef7 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
 EXPORT_SYMBOL_GPL(xen_p2m_addr);
 unsigned long xen_p2m_size __read_mostly;
 EXPORT_SYMBOL_GPL(xen_p2m_size);
-unsigned long xen_max_p2m_pfn __read_mostly;
-EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
+unsigned long xen_p2m_max_size __read_mostly;
+EXPORT_SYMBOL_GPL(xen_p2m_max_size);
 
 #ifdef CONFIG_XEN_MEMORY_HOTPLUG_LIMIT
 #define P2M_LIMIT CONFIG_XEN_MEMORY_HOTPLUG_LIMIT
@@ -121,7 +121,7 @@ static pte_t *p2m_identity_pte;
  * can avoid scanning the whole P2M (which may be sized to account for
  * hotplugged memory).
  */
-static unsigned long xen_p2m_last_pfn;
+static unsigned long xen_p2m_pfn_limit;
 
 static inline unsigned p2m_top_index(unsigned long pfn)
 {
@@ -239,7 +239,7 @@ void __ref xen_build_mfn_list_list(void)
 		p2m_mid_mfn_init(p2m_mid_missing_mfn, p2m_missing);
 	}
 
-	for (pfn = 0; pfn < xen_max_p2m_pfn && pfn < MAX_P2M_PFN;
+	for (pfn = 0; pfn < xen_p2m_max_size && pfn < MAX_P2M_PFN;
 	     pfn += P2M_PER_PAGE) {
 		topidx = p2m_top_index(pfn);
 		mididx = p2m_mid_index(pfn);
@@ -284,7 +284,7 @@ void xen_setup_mfn_list_list(void)
 	else
 		HYPERVISOR_shared_info->arch.pfn_to_mfn_frame_list_list =
 			virt_to_mfn(p2m_top_mfn);
-	HYPERVISOR_shared_info->arch.max_pfn = xen_p2m_last_pfn;
+	HYPERVISOR_shared_info->arch.max_pfn = xen_p2m_pfn_limit;
 	HYPERVISOR_shared_info->arch.p2m_generation = 0;
 	HYPERVISOR_shared_info->arch.p2m_vaddr = (unsigned long)xen_p2m_addr;
 	HYPERVISOR_shared_info->arch.p2m_cr3 =
@@ -302,7 +302,7 @@ void __init xen_build_dynamic_phys_to_machine(void)
 	for (pfn = xen_start_info->nr_pages; pfn < xen_p2m_size; pfn++)
 		xen_p2m_addr[pfn] = INVALID_P2M_ENTRY;
 
-	xen_max_p2m_pfn = xen_p2m_size;
+	xen_p2m_max_size = xen_p2m_size;
 }
 
 #define P2M_TYPE_IDENTITY	0
@@ -353,7 +353,7 @@ static void __init xen_rebuild_p2m_list(unsigned long *p2m)
 			pfn_pte(PFN_DOWN(__pa(p2m_identity)), PAGE_KERNEL_RO));
 	}
 
-	for (pfn = 0; pfn < xen_max_p2m_pfn; pfn += chunk) {
+	for (pfn = 0; pfn < xen_p2m_max_size; pfn += chunk) {
 		/*
 		 * Try to map missing/identity PMDs or p2m-pages if possible.
 		 * We have to respect the structure of the mfn_list_list
@@ -413,21 +413,22 @@ void __init xen_vmalloc_p2m_tree(void)
 	static struct vm_struct vm;
 	unsigned long p2m_limit;
 
-	xen_p2m_last_pfn = xen_max_p2m_pfn;
+	xen_p2m_pfn_limit = xen_p2m_max_size;
 
 	p2m_limit = (phys_addr_t)P2M_LIMIT * 1024 * 1024 * 1024 / PAGE_SIZE;
 	vm.flags = VM_ALLOC;
-	vm.size = ALIGN(sizeof(unsigned long) * max(xen_max_p2m_pfn, p2m_limit),
+	vm.size = ALIGN(sizeof(unsigned long) *
+			max(xen_p2m_max_size, p2m_limit),
 			PMD_SIZE * PMDS_PER_MID_PAGE);
 	vm_area_register_early(&vm, PMD_SIZE * PMDS_PER_MID_PAGE);
 	pr_notice("p2m virtual area at %p, size is %lx\n", vm.addr, vm.size);
 
-	xen_max_p2m_pfn = vm.size / sizeof(unsigned long);
+	xen_p2m_max_size = vm.size / sizeof(unsigned long);
 
 	xen_rebuild_p2m_list(vm.addr);
 
 	xen_p2m_addr = vm.addr;
-	xen_p2m_size = xen_max_p2m_pfn;
+	xen_p2m_size = xen_p2m_max_size;
 
 	xen_inv_extra_mem();
 }
@@ -438,7 +439,7 @@ unsigned long get_phys_to_machine(unsigned long pfn)
 	unsigned int level;
 
 	if (unlikely(pfn >= xen_p2m_size)) {
-		if (pfn < xen_max_p2m_pfn)
+		if (pfn < xen_p2m_max_size)
 			return xen_chk_extra_mem(pfn);
 
 		return IDENTITY_FRAME(pfn);
@@ -618,9 +619,9 @@ int xen_alloc_p2m_entry(unsigned long pfn)
 	}
 
 	/* Expanded the p2m? */
-	if (pfn >= xen_p2m_last_pfn) {
-		xen_p2m_last_pfn = ALIGN(pfn + 1, P2M_PER_PAGE);
-		HYPERVISOR_shared_info->arch.max_pfn = xen_p2m_last_pfn;
+	if (pfn >= xen_p2m_pfn_limit) {
+		xen_p2m_pfn_limit = ALIGN(pfn + 1, P2M_PER_PAGE);
+		HYPERVISOR_shared_info->arch.max_pfn = xen_p2m_pfn_limit;
 	}
 
 	return 0;
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 8bfc10330107..1caddd3fa0e1 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -816,7 +816,7 @@ char * __init xen_memory_setup(void)
 				n_pfns = PFN_DOWN(addr + chunk_size) - pfn_s;
 				extra_pages -= n_pfns;
 				xen_add_extra_mem(pfn_s, n_pfns);
-				xen_max_p2m_pfn = pfn_s + n_pfns;
+				xen_p2m_max_size = pfn_s + n_pfns;
 			} else
 				discard = true;
 		}
-- 
2.26.2


