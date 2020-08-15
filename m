Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F4B2450D8
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 12:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6t5X-0007WO-Ku; Sat, 15 Aug 2020 10:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6t5W-0007V6-7x
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 10:06:58 +0000
X-Inumbo-ID: e2207bb1-e10c-40ff-9c88-89eac581cd9a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2207bb1-e10c-40ff-9c88-89eac581cd9a;
 Sat, 15 Aug 2020 10:06:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3EECB049;
 Sat, 15 Aug 2020 10:07:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v4 5/6] x86/paravirt: remove set_pte_at pv-op
Date: Sat, 15 Aug 2020 12:06:40 +0200
Message-Id: <20200815100641.26362-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200815100641.26362-1-jgross@suse.com>
References: <20200815100641.26362-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On x86 set_pte_at() is now always falling back to set_pte(). So instead
of having this fallback after the paravirt maze just drop the
set_pte_at paravirt operation and let set_pte_at() use the set_pte()
function directly.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h       |  8 +-------
 arch/x86/include/asm/paravirt_types.h |  2 --
 arch/x86/include/asm/pgtable.h        |  7 +++----
 arch/x86/kernel/paravirt.c            |  1 -
 arch/x86/xen/mmu_pv.c                 |  8 --------
 include/trace/events/xen.h            | 20 --------------------
 6 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index e02c409fa054..f0464b88ea1e 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -412,12 +412,6 @@ static inline void set_pte(pte_t *ptep, pte_t pte)
 	PVOP_VCALL2(mmu.set_pte, ptep, pte.pte);
 }
 
-static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep, pte_t pte)
-{
-	PVOP_VCALL4(mmu.set_pte_at, mm, addr, ptep, pte.pte);
-}
-
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
 	PVOP_VCALL2(mmu.set_pmd, pmdp, native_pmd_val(pmd));
@@ -510,7 +504,7 @@ static inline void set_pte_atomic(pte_t *ptep, pte_t pte)
 static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
 			     pte_t *ptep)
 {
-	set_pte_at(mm, addr, ptep, __pte(0));
+	set_pte(ptep, __pte(0));
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index f27c3febaa6e..0fad9f61c76a 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -242,8 +242,6 @@ struct pv_mmu_ops {
 
 	/* Pagetable manipulation functions */
 	void (*set_pte)(pte_t *ptep, pte_t pteval);
-	void (*set_pte_at)(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, pte_t pteval);
 	void (*set_pmd)(pmd_t *pmdp, pmd_t pmdval);
 
 	pte_t (*ptep_modify_prot_start)(struct vm_area_struct *vma, unsigned long addr,
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index b836138ce852..7414b416779b 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -63,7 +63,6 @@ extern pmdval_t early_pmd_flags;
 #include <asm/paravirt.h>
 #else  /* !CONFIG_PARAVIRT_XXL */
 #define set_pte(ptep, pte)		native_set_pte(ptep, pte)
-#define set_pte_at(mm, addr, ptep, pte)	native_set_pte_at(mm, addr, ptep, pte)
 
 #define set_pte_atomic(ptep, pte)					\
 	native_set_pte_atomic(ptep, pte)
@@ -1033,10 +1032,10 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
 	return res;
 }
 
-static inline void native_set_pte_at(struct mm_struct *mm, unsigned long addr,
-				     pte_t *ptep , pte_t pte)
+static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pte)
 {
-	native_set_pte(ptep, pte);
+	set_pte(ptep, pte);
 }
 
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index e56a144c13b3..6c3407ba6ee9 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -360,7 +360,6 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.release_p4d	= paravirt_nop,
 
 	.mmu.set_pte		= native_set_pte,
-	.mmu.set_pte_at		= native_set_pte_at,
 	.mmu.set_pmd		= native_set_pmd,
 
 	.mmu.ptep_modify_prot_start	= __ptep_modify_prot_start,
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 3273c985d3dd..eda78144c000 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -285,13 +285,6 @@ static void xen_set_pte(pte_t *ptep, pte_t pteval)
 	__xen_set_pte(ptep, pteval);
 }
 
-static void xen_set_pte_at(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, pte_t pteval)
-{
-	trace_xen_mmu_set_pte_at(mm, addr, ptep, pteval);
-	__xen_set_pte(ptep, pteval);
-}
-
 pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma,
 				 unsigned long addr, pte_t *ptep)
 {
@@ -2105,7 +2098,6 @@ static const struct pv_mmu_ops xen_mmu_ops __initconst = {
 	.release_pmd = xen_release_pmd_init,
 
 	.set_pte = xen_set_pte_init,
-	.set_pte_at = xen_set_pte_at,
 	.set_pmd = xen_set_pmd_hyper,
 
 	.ptep_modify_prot_start = __ptep_modify_prot_start,
diff --git a/include/trace/events/xen.h b/include/trace/events/xen.h
index a5ccfa67bc5c..3b61b587e137 100644
--- a/include/trace/events/xen.h
+++ b/include/trace/events/xen.h
@@ -153,26 +153,6 @@ DECLARE_EVENT_CLASS(xen_mmu__set_pte,
 
 DEFINE_XEN_MMU_SET_PTE(xen_mmu_set_pte);
 
-TRACE_EVENT(xen_mmu_set_pte_at,
-	    TP_PROTO(struct mm_struct *mm, unsigned long addr,
-		     pte_t *ptep, pte_t pteval),
-	    TP_ARGS(mm, addr, ptep, pteval),
-	    TP_STRUCT__entry(
-		    __field(struct mm_struct *, mm)
-		    __field(unsigned long, addr)
-		    __field(pte_t *, ptep)
-		    __field(pteval_t, pteval)
-		    ),
-	    TP_fast_assign(__entry->mm = mm;
-			   __entry->addr = addr;
-			   __entry->ptep = ptep;
-			   __entry->pteval = pteval.pte),
-	    TP_printk("mm %p addr %lx ptep %p pteval %0*llx (raw %0*llx)",
-		      __entry->mm, __entry->addr, __entry->ptep,
-		      (int)sizeof(pteval_t) * 2, (unsigned long long)pte_val(native_make_pte(__entry->pteval)),
-		      (int)sizeof(pteval_t) * 2, (unsigned long long)__entry->pteval)
-	);
-
 TRACE_DEFINE_SIZEOF(pmdval_t);
 
 TRACE_EVENT(xen_mmu_set_pmd,
-- 
2.26.2


