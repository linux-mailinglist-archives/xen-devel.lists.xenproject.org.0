Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90F92CE4C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756661.1165357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTlU-0003xP-TF; Wed, 10 Jul 2024 09:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756661.1165357; Wed, 10 Jul 2024 09:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTlU-0003um-PV; Wed, 10 Jul 2024 09:37:32 +0000
Received: by outflank-mailman (input) for mailman id 756661;
 Wed, 10 Jul 2024 09:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sRTlS-0003T0-It
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:37:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b99c61-3ea0-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 11:37:28 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43C6121AC7;
 Wed, 10 Jul 2024 09:37:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD3B2137D2;
 Wed, 10 Jul 2024 09:37:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BRWFNFdWjmabWwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 10 Jul 2024 09:37:27 +0000
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
X-Inumbo-ID: 05b99c61-3ea0-11ef-8776-851b0ebba9a2
Authentication-Results: smtp-out1.suse.de;
	none
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
Subject: [PATCH 1/2] x86/xen: make some functions static
Date: Wed, 10 Jul 2024 11:37:17 +0200
Message-ID: <20240710093718.14552-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710093718.14552-1-jgross@suse.com>
References: <20240710093718.14552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 43C6121AC7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 

Some functions and variables in arch/x86/xen are used locally only,
make them static.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu.h     |  4 ----
 arch/x86/xen/mmu_pv.c  | 11 ++++++-----
 arch/x86/xen/xen-ops.h |  1 -
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/mmu.h b/arch/x86/xen/mmu.h
index 6e4c6bd62203..11fa577af6b4 100644
--- a/arch/x86/xen/mmu.h
+++ b/arch/x86/xen/mmu.h
@@ -17,10 +17,6 @@ bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn);
 
 void set_pte_mfn(unsigned long vaddr, unsigned long pfn, pgprot_t flags);
 
-pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
-void  xen_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
-				  pte_t *ptep, pte_t pte);
-
 unsigned long xen_read_cr2_direct(void);
 
 extern void xen_init_mmu_ops(void);
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 54e0d311dcc9..8924129e284c 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -128,7 +128,7 @@ static DEFINE_SPINLOCK(xen_reservation_lock);
  * looking at another vcpu's cr3 value, it should use this variable.
  */
 DEFINE_PER_CPU(unsigned long, xen_cr3);	 /* cr3 stored as physaddr */
-DEFINE_PER_CPU(unsigned long, xen_current_cr3);	 /* actual vcpu cr3 */
+static DEFINE_PER_CPU(unsigned long, xen_current_cr3);	/* actual vcpu cr3 */
 
 static phys_addr_t xen_pt_base, xen_pt_size __initdata;
 
@@ -305,16 +305,17 @@ static void xen_set_pte(pte_t *ptep, pte_t pteval)
 	__xen_set_pte(ptep, pteval);
 }
 
-pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma,
-				 unsigned long addr, pte_t *ptep)
+static pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep)
 {
 	/* Just return the pte as-is.  We preserve the bits on commit */
 	trace_xen_mmu_ptep_modify_prot_start(vma->vm_mm, addr, ptep, *ptep);
 	return *ptep;
 }
 
-void xen_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
-				 pte_t *ptep, pte_t pte)
+static void xen_ptep_modify_prot_commit(struct vm_area_struct *vma,
+					unsigned long addr,
+					pte_t *ptep, pte_t pte)
 {
 	struct mmu_update u;
 
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 79cf93f2c92f..9f29229e25b8 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -23,7 +23,6 @@ void xen_copy_trap_info(struct trap_info *traps);
 
 DECLARE_PER_CPU_ALIGNED(struct vcpu_info, xen_vcpu_info);
 DECLARE_PER_CPU(unsigned long, xen_cr3);
-DECLARE_PER_CPU(unsigned long, xen_current_cr3);
 
 extern struct start_info *xen_start_info;
 extern struct shared_info xen_dummy_shared_info;
-- 
2.43.0


