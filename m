Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717566A4E11
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 23:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502959.775025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWm23-0000tc-61; Mon, 27 Feb 2023 22:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502959.775025; Mon, 27 Feb 2023 22:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWm23-0000rX-35; Mon, 27 Feb 2023 22:31:43 +0000
Received: by outflank-mailman (input) for mailman id 502959;
 Mon, 27 Feb 2023 22:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rpa=6X=intel.com=rick.p.edgecombe@srs-se1.protection.inumbo.net>)
 id 1pWm21-0000rM-BH
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 22:31:41 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ef011ee-b6ee-11ed-a550-8520e6686977;
 Mon, 27 Feb 2023 23:31:38 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:31:16 -0800
Received: from leonqu-mobl1.amr.corp.intel.com (HELO
 rpedgeco-desk.amr.corp.intel.com) ([10.209.72.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:31:15 -0800
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
X-Inumbo-ID: 7ef011ee-b6ee-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677537098; x=1709073098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h3g9dfsaSYOQw9Djcf7aO6npKOb7bN/WODuQBbF8SE0=;
  b=UohwRZyMt5jHpGvmzcjT/9r1WsmhmngxM5CQcdKhDLYw3lPvkOaqOAB4
   Lobbb2sp00Ed4/N/L6MyT83TqOak49CFR4rTDI8aAYwMF0q5hTi/1SjBJ
   1trB6wUlKlhljkiqS5sIeciTEY0fD7uSfPcVNasfTKTz+iOAFGp/N3bfS
   lvCWSmEKZ4AEscYsgzHgpSE0Jsp8uAxn7UTp+orzuhp5rUA4DuT3b0dKv
   W38SCcfnC29I8ibZ1Iu4w7up2mz8IYiLAAydzNje9pu/1Yo4e/NqDytZ9
   SOW6QIriqgNP8pmGK5vUO3n5KqhJORqQMqRrVI7aQo06oQbBVwruzbSgM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313657267"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="313657267"
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848024459"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="848024459"
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Florian Weimer <fweimer@redhat.com>,
	"H . J . Lu" <hjl.tools@gmail.com>,
	Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <keescook@chromium.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nadav Amit <nadav.amit@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijiang Yang <weijiang.yang@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	John Allen <john.allen@amd.com>,
	kcc@google.com,
	eranian@google.com,
	rppt@kernel.org,
	jamorris@linux.microsoft.com,
	dethoma@microsoft.com,
	akpm@linux-foundation.org,
	Andrew.Cooper3@citrix.com,
	christina.schimpe@intel.com,
	david@redhat.com,
	debug@rivosinc.com
Cc: rick.p.edgecombe@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v7 11/41] mm: Introduce pte_mkwrite_kernel()
Date: Mon, 27 Feb 2023 14:29:27 -0800
Message-Id: <20230227222957.24501-12-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The x86 Control-flow Enforcement Technology (CET) feature includes a new
type of memory called shadow stack. This shadow stack memory has some
unusual properties, which requires some core mm changes to function
properly.

One of these changes is to allow for pte_mkwrite() to create different
types of writable memory (the existing conventionally writable type and
also the new shadow stack type). Future patches will convert pte_mkwrite()
to take a VMA in order to facilitate this, however there are places in the
kernel where pte_mkwrite() is called outside of the context of a VMA.
These are for kernel memory. So create a new variant called
pte_mkwrite_kernel() and switch the kernel users over to it. Have
pte_mkwrite() and pte_mkwrite_kernel() be the same for now. Future patches
will introduce changes to make pte_mkwrite() take a VMA.

Only do this for architectures that need it because they call pte_mkwrite()
in arch code without an associated VMA. Since it will only currently be
used in arch code, so do not include it in arch_pgtable_helpers.rst.

Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-arch@vger.kernel.org
Cc: linux-mm@kvack.org
Tested-by: Pengfei Xu <pengfei.xu@intel.com>
Tested-by: John Allen <john.allen@amd.com>
Tested-by: Kees Cook <keescook@chromium.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

---
Hi Non-x86 Arch’s,

x86 has a feature that allows for the creation of a special type of
writable memory (shadow stack) that is only writable in limited specific
ways. Previously, changes were proposed to core MM code to teach it to
decide when to create normally writable memory or the special shadow stack
writable memory, but David Hildenbrand suggested[0] to change
pXX_mkwrite() to take a VMA, so awareness of shadow stack memory can be
moved into x86 code.

Since pXX_mkwrite() is defined in every arch, it requires some tree-wide
changes. So that is why you are seeing some patches out of a big x86
series pop up in your arch mailing list. There is no functional change.
After this refactor, the shadow stack series goes on to use the arch
helpers to push shadow stack memory details inside arch/x86.

Testing was just 0-day build testing.

Hopefully that is enough context. Thanks!

[0] https://lore.kernel.org/lkml/0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com/#t

v6:
 - New patch
---
 arch/arm64/include/asm/pgtable.h | 7 ++++++-
 arch/arm64/mm/trans_pgd.c        | 4 ++--
 arch/s390/include/asm/pgtable.h  | 7 ++++++-
 arch/s390/mm/pageattr.c          | 2 +-
 arch/x86/include/asm/pgtable.h   | 7 ++++++-
 arch/x86/xen/mmu_pv.c            | 2 +-
 6 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b6ba466e2e8a..cccf8885792e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -180,13 +180,18 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
 	return pmd;
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)
+static inline pte_t pte_mkwrite_kernel(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
 	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
 	return pte;
 }
 
+static inline pte_t pte_mkwrite(pte_t pte)
+{
+	return pte_mkwrite_kernel(pte);
+}
+
 static inline pte_t pte_mkclean(pte_t pte)
 {
 	pte = clear_pte_bit(pte, __pgprot(PTE_DIRTY));
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 4ea2eefbc053..5c07e68d80ea 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -40,7 +40,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 * read only (code, rodata). Clear the RDONLY bit from
 		 * the temporary mappings we use during restore.
 		 */
-		set_pte(dst_ptep, pte_mkwrite(pte));
+		set_pte(dst_ptep, pte_mkwrite_kernel(pte));
 	} else if (debug_pagealloc_enabled() && !pte_none(pte)) {
 		/*
 		 * debug_pagealloc will removed the PTE_VALID bit if
@@ -53,7 +53,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 */
 		BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-		set_pte(dst_ptep, pte_mkpresent(pte_mkwrite(pte)));
+		set_pte(dst_ptep, pte_mkpresent(pte_mkwrite_kernel(pte)));
 	}
 }
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 2c70b4d1263d..d4943f2d3f00 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1005,7 +1005,7 @@ static inline pte_t pte_wrprotect(pte_t pte)
 	return set_pte_bit(pte, __pgprot(_PAGE_PROTECT));
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)
+static inline pte_t pte_mkwrite_kernel(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(_PAGE_WRITE));
 	if (pte_val(pte) & _PAGE_DIRTY)
@@ -1013,6 +1013,11 @@ static inline pte_t pte_mkwrite(pte_t pte)
 	return pte;
 }
 
+static inline pte_t pte_mkwrite(pte_t pte)
+{
+	return pte_mkwrite_kernel(pte);
+}
+
 static inline pte_t pte_mkclean(pte_t pte)
 {
 	pte = clear_pte_bit(pte, __pgprot(_PAGE_DIRTY));
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 85195c18b2e8..4ee5fe5caa23 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -96,7 +96,7 @@ static int walk_pte_level(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		if (flags & SET_MEMORY_RO)
 			new = pte_wrprotect(new);
 		else if (flags & SET_MEMORY_RW)
-			new = pte_mkwrite(pte_mkdirty(new));
+			new = pte_mkwrite_kernel(pte_mkdirty(new));
 		if (flags & SET_MEMORY_NX)
 			new = set_pte_bit(new, __pgprot(_PAGE_NOEXEC));
 		else if (flags & SET_MEMORY_X)
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 56eea96502c6..3607f2572f9e 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -364,11 +364,16 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte_set_flags(pte, _PAGE_ACCESSED);
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)
+static inline pte_t pte_mkwrite_kernel(pte_t pte)
 {
 	return pte_set_flags(pte, _PAGE_RW);
 }
 
+static inline pte_t pte_mkwrite(pte_t pte)
+{
+	return pte_mkwrite_kernel(pte);
+}
+
 static inline pte_t pte_mkhuge(pte_t pte)
 {
 	return pte_set_flags(pte, _PAGE_PSE);
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index ee29fb558f2e..a23f04243c19 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -150,7 +150,7 @@ void make_lowmem_page_readwrite(void *vaddr)
 	if (pte == NULL)
 		return;		/* vaddr missing */
 
-	ptev = pte_mkwrite(*pte);
+	ptev = pte_mkwrite_kernel(*pte);
 
 	if (HYPERVISOR_update_va_mapping(address, ptev, 0))
 		BUG();
-- 
2.17.1


