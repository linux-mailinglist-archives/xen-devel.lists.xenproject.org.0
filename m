Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E764EB48
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464572.723066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eq-0000Wp-MN; Fri, 16 Dec 2022 12:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464572.723066; Fri, 16 Dec 2022 12:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eq-0000Gd-9j; Fri, 16 Dec 2022 12:17:44 +0000
Received: by outflank-mailman (input) for mailman id 464572;
 Fri, 16 Dec 2022 12:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ek-0007Lt-2H
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-00034G-OC; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DE-0004sN-I6; Fri, 16 Dec 2022 11:49:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=9j1baKWOTDAmSEXXRPz5vlDNPs8x5yzHk136j/q4JZg=; b=x83k0fXRB6Jd3aoaqIjCeiTXkZ
	7qIX6P/MiqvL54Or2V6+svj4lDwUZZCmBuqxYrvv3ob8rabbm6oXC3e1YeRuKe+CMfYZghExbqb80
	kDwukK5Zdqncp5eH8pALQ1iPRGFB4ocn6dI8WO4JRZ75DOghEq/3Qh1IyTnBGkN+9KEc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 11/22] x86: add a boot option to enable and disable the direct map
Date: Fri, 16 Dec 2022 11:48:42 +0000
Message-Id: <20221216114853.8227-12-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

Also add a helper function to retrieve it. Change arch_mfns_in_direct_map
to check this option before returning.

This is added as a boot command line option, not a Kconfig to allow
the user to experiment the feature without rebuild the hypervisor.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    TODO:
        * Do we also want to provide a Kconfig option?

    Changes since Hongyan's version:
        * Reword the commit message
        * opt_directmap is only modified during boot so mark it as
          __ro_after_init
---
 docs/misc/xen-command-line.pandoc | 12 ++++++++++++
 xen/arch/arm/include/asm/mm.h     |  5 +++++
 xen/arch/x86/include/asm/mm.h     | 17 ++++++++++++++++-
 xen/arch/x86/mm.c                 |  3 +++
 xen/arch/x86/setup.c              |  2 ++
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b7ee97be762e..a63e4612acac 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -760,6 +760,18 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### directmap (x86)
+> `= <boolean>`
+
+> Default: `true`
+
+Enable or disable the direct map region in Xen.
+
+By default, Xen creates the direct map region which maps physical memory
+in that region. Setting this to no will remove the direct map, blocking
+exploits that leak secrets via speculative memory access in the direct
+map.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 68adcac9fa8d..2366928d71aa 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -406,6 +406,11 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+static inline bool arch_has_directmap(void)
+{
+    return true;
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index db29e3e2059f..cf8b20817c6c 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -464,6 +464,8 @@ static inline int get_page_and_type(struct page_info *page,
     ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
     ASSERT(page_get_owner(_p) == (_d))
 
+extern bool opt_directmap;
+
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
@@ -620,13 +622,26 @@ extern const char zero_page[];
 /* Build a 32bit PSE page table using 4MB pages. */
 void write_32bit_pse_identmap(uint32_t *l2);
 
+static inline bool arch_has_directmap(void)
+{
+    return opt_directmap;
+}
+
 /*
  * x86 maps part of physical memory via the directmap region.
  * Return whether the range of MFN falls in the directmap region.
+ *
+ * When boot command line sets directmap=no, we will not have a direct map at
+ * all so this will always return false.
  */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
-    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
+    unsigned long eva;
+
+    if ( !arch_has_directmap() )
+        return false;
+
+    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 041bd4cfde17..e76e135b96fc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -157,6 +157,9 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
+bool __ro_after_init opt_directmap = true;
+boolean_param("directmap", opt_directmap);
+
 /* Frame table size in pages. */
 unsigned long max_page;
 unsigned long total_pages;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1c2e09711eb0..2cb051c6e4e7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1423,6 +1423,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     if ( highmem_start )
         xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
 
+    printk("Booting with directmap %s\n", arch_has_directmap() ? "on" : "off");
+
     /*
      * Walk every RAM region and map it in its entirety (on x86/64, at least)
      * and notify it to the boot allocator.
-- 
2.38.1


