Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E133C4370AA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 06:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214572.373374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdlsf-0006n0-8H; Fri, 22 Oct 2021 04:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214572.373374; Fri, 22 Oct 2021 04:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdlsf-0006fO-1c; Fri, 22 Oct 2021 04:10:09 +0000
Received: by outflank-mailman (input) for mailman id 214572;
 Thu, 21 Oct 2021 18:15:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IF2L=PJ=intel.com=lucas.demarchi@srs-us1.protection.inumbo.net>)
 id 1mdcbK-00047r-L5
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 18:15:38 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deddc37e-329a-11ec-8389-12813bfff9fa;
 Thu, 21 Oct 2021 18:15:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
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
X-Inumbo-ID: deddc37e-329a-11ec-8389-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252606745"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="252606745"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="527582109"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/2] x86/mm: nuke PAGE_KERNEL_IO
Date: Thu, 21 Oct 2021 11:15:11 -0700
Message-Id: <20211021181511.1533377-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021181511.1533377-1-lucas.demarchi@intel.com>
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PAGE_KERNEL_IO is only defined for x86 and nowadays is the same as
PAGE_KERNEL. It was different for some time, OR'ing a `_PAGE_IOMAP` flag
in commit be43d72835ba ("x86: add _PAGE_IOMAP pte flag for IO
mappings").  This got removed in commit f955371ca9d3 ("x86: remove the
Xen-specific _PAGE_IOMAP PTE flag"), so today they are just the same.

With the last users outside arch/x86 being remove we can now remove
PAGE_KERNEL_IO.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 arch/x86/include/asm/fixmap.h        | 2 +-
 arch/x86/include/asm/pgtable_types.h | 7 -------
 arch/x86/mm/ioremap.c                | 2 +-
 arch/x86/xen/setup.c                 | 2 +-
 include/asm-generic/fixmap.h         | 2 +-
 5 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
index d0dcefb5cc59..5e186a69db10 100644
--- a/arch/x86/include/asm/fixmap.h
+++ b/arch/x86/include/asm/fixmap.h
@@ -173,7 +173,7 @@ static inline void __set_fixmap(enum fixed_addresses idx,
  * supported for MMIO addresses, so make sure that the memory encryption
  * mask is not part of the page attributes.
  */
-#define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_IO_NOCACHE
+#define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
 
 /*
  * Early memremap routines used for in-place encryption. The mappings created
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 40497a9020c6..a87224767ff3 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -199,10 +199,6 @@ enum page_cache_mode {
 #define __PAGE_KERNEL_WP	 (__PP|__RW|   0|___A|__NX|___D|   0|___G| __WP)
 
 
-#define __PAGE_KERNEL_IO		__PAGE_KERNEL
-#define __PAGE_KERNEL_IO_NOCACHE	__PAGE_KERNEL_NOCACHE
-
-
 #ifndef __ASSEMBLY__
 
 #define __PAGE_KERNEL_ENC	(__PAGE_KERNEL    | _ENC)
@@ -223,9 +219,6 @@ enum page_cache_mode {
 #define PAGE_KERNEL_LARGE_EXEC	__pgprot_mask(__PAGE_KERNEL_LARGE_EXEC | _ENC)
 #define PAGE_KERNEL_VVAR	__pgprot_mask(__PAGE_KERNEL_VVAR       | _ENC)
 
-#define PAGE_KERNEL_IO		__pgprot_mask(__PAGE_KERNEL_IO)
-#define PAGE_KERNEL_IO_NOCACHE	__pgprot_mask(__PAGE_KERNEL_IO_NOCACHE)
-
 #endif	/* __ASSEMBLY__ */
 
 /*         xwr */
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 026031b3b782..3102dda4b152 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -243,7 +243,7 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
 	 * make sure the memory encryption attribute is enabled in the
 	 * resulting mapping.
 	 */
-	prot = PAGE_KERNEL_IO;
+	prot = PAGE_KERNEL;
 	if ((io_desc.flags & IORES_MAP_ENCRYPTED) || encrypted)
 		prot = pgprot_encrypted(prot);
 
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 8bfc10330107..5dc0771a50f3 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -435,7 +435,7 @@ static unsigned long __init xen_set_identity_and_remap_chunk(
 	for (pfn = start_pfn; pfn <= max_pfn_mapped && pfn < end_pfn; pfn++)
 		(void)HYPERVISOR_update_va_mapping(
 			(unsigned long)__va(pfn << PAGE_SHIFT),
-			mfn_pte(pfn, PAGE_KERNEL_IO), 0);
+			mfn_pte(pfn, PAGE_KERNEL), 0);
 
 	return remap_pfn;
 }
diff --git a/include/asm-generic/fixmap.h b/include/asm-generic/fixmap.h
index 8cc7b09c1bc7..f1b0c6f3d0be 100644
--- a/include/asm-generic/fixmap.h
+++ b/include/asm-generic/fixmap.h
@@ -54,7 +54,7 @@ static inline unsigned long virt_to_fix(const unsigned long vaddr)
 #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
 #endif
 #ifndef FIXMAP_PAGE_IO
-#define FIXMAP_PAGE_IO PAGE_KERNEL_IO
+#define FIXMAP_PAGE_IO PAGE_KERNEL
 #endif
 #ifndef FIXMAP_PAGE_CLEAR
 #define FIXMAP_PAGE_CLEAR __pgprot(0)
-- 
2.33.1


