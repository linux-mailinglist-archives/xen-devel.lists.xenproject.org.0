Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBF7BBAA0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613689.954394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qom49-0006Ma-TU; Fri, 06 Oct 2023 14:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613689.954394; Fri, 06 Oct 2023 14:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qom49-0006KF-Pd; Fri, 06 Oct 2023 14:44:33 +0000
Received: by outflank-mailman (input) for mailman id 613689;
 Fri, 06 Oct 2023 14:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LN/y=FU=citrix.com=prvs=63610b956=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qom48-0006K9-Gn
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:44:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9fcf772-6456-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 16:44:29 +0200 (CEST)
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
X-Inumbo-ID: d9fcf772-6456-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696603469;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yNK5TfQTNvUmT9IcZE7wifs6J1Tcp6mxFKGvaGLUBiY=;
  b=BrWq+PcLP1s2g8x5+6MDj8XGfQjUy8xYdkJc9anxnXIuYa8IcTYcyd6t
   V41vVj5i1+dkpnmbQ88TX9MeEt7F0gmccTbms6Iel3wFYe5vfNtyiG5ES
   xaYh3WV/uhbAcaASQlDpw9MpDdvOYklHkN6rqQw2evzXEeFKDvPx1Bw2c
   c=;
X-CSE-ConnectionGUID: OXgx/E9PRjqQzm8apXeeUQ==
X-CSE-MsgGUID: ZGIi8VZtRRGnwBLrU3w6iw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127601295
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:jium6a9ysMeF3dFQdf2oDrUDCH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zcdWWqOPKmINGHxKt4kPti1pE4AupbWyNNkSApoqHg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagV5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklpx
 fMIbx1cViqBntukxeKyUtlhi/kaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPwRjA/
 ziXogwVBDkoG/2emQS37kiWqenQtwfhZdkNSryno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdVKGuk+wAiIw7jT5UCSAW1sZiVIbtU9qMYtRDsCz
 FaRg9TzCDpgsbuYRGic8LjSpjS3UQASKWIBfi4FCwgY+d7ooII0ph3KR9dnVqWyi7XdOTz22
 SHMkyE4iJ0al8tN3KK+lXjlqT+xopnCTiYu+x7aGGmi62tRf5W5boal7Vza6/doL4uDSFSF+
 n8elKC28+QmHZyL0iuXT40lHqyt5vuDGC3RhxhoBZZJyti20yf9J8YKumg4fRo4dJlcEdP0X
 KPNkSRh648UESqSV61uWpC0W80y/aXtKO2wA5g4ceFyjohNmB6vpX8/OxPBjz62ySDAgollZ
 83GLZjE4WIyTPQ/lWXoHY/xxJd2nkgDKXXvqYcXJvhN+YKZYWacT7BNGlaHZeBRAEis+16Nr
 Yg32ydn0XxivAzCjsr/q9R7wagidyRTOHwPg5U/mhS/CgRnAno9LPTa3KksfYdo94wMyLaWo
 yrlCxYAlgau7ZEiFeltQik8AI4DoL4l9S5rVcDSFQnAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3Zasmjvg/vomxHBbGk9dAKSfherV7WV8ZTSGRlLsEIqs2g0oOMQzYDAwFVUXrv5ZFm/
 OX7vu4ZKLJaLzlf4A/tQKrH5zuMUbI1wYqeg2OgzgFvRXjR
IronPort-HdrOrdr: A9a23:mjiJXa5PSUMScJb4UQPXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-Talos-CUID: 9a23:61HVD26BzgXLMFrfp9ss034bCocII0Xnzm7pMUroAH5ZRbCocArF
X-Talos-MUID: 9a23:XzZkIgSnD7kNfBRzRXTeqxBjZPla/56UJ0YSu7EchpKbay1vbmI=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="127601295"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Henry Wang <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common Kconfig option
Date: Fri, 6 Oct 2023 15:44:05 +0100
Message-ID: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Adds a new compile-time flag to allow disabling PDX compression and
compiles out compression-related code/data. It also shorts the pdx<->pfn
conversion macros and creates stubs for masking functions.

While at it, removes the old arch-defined CONFIG_HAS_PDX flag.  Despite the
illusion of choice, it was not optional.

There are ARM and PPC platforms with sparse RAM banks - leave compression
active by default there.  OTOH, there are no known production x86 systems with
sparse RAM banks, so disable compression.  This decision can be revisited if
such a platform comes along.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

v5:
 * Fix typos
 * Fix what would be a MISRA violation from mismatch paddr_t/unsigned long
 * Rebase over PPC's use of "select HAS_PDX"
 * Rework Kconfig text for non-developers to follow

It is hard to overstate how much of a performace improvement this is on x86.
The compiletime delta is:

  add/remove: 1/24 grow/shrink: 16/401 up/down: 2317/-32367 (-30050)

with 5 memory reads removed from every fastpath involving pagetable
manipulation - which is many.  Prior more-targeted optimisations have netted
gains of 10% by avoiding this pagetable overhead at specific points in the
context switch path.

Oleksii: I've not touched RISCV yet, because I don't know how the platforms
typically look.  I'm happy to default it active in RISCV too if that's the
right thing to do.

But for everyone else, it's probably very worthwhile looking for alternative
options to support multiple RAM banks...
---
 xen/arch/arm/Kconfig  |  1 -
 xen/arch/ppc/Kconfig  |  1 -
 xen/arch/x86/Kconfig  |  1 -
 xen/arch/x86/domain.c | 19 +++++++++++++------
 xen/common/Kconfig    | 18 +++++++++++++++---
 xen/common/Makefile   |  2 +-
 xen/common/pdx.c      | 16 ++++++++++++----
 xen/include/xen/pdx.h | 38 +++++++++++++++++++++++++++++++++++---
 8 files changed, 76 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 632dd9792e3c..2939db429b78 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,7 +14,6 @@ config ARM
 	select HAS_ALTERNATIVE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
-	select HAS_PDX
 	select HAS_PMAP
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index a6eae597afac..ab116ffb2a70 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -1,7 +1,6 @@
 config PPC
 	def_bool y
 	select HAS_DEVICE_TREE
-	select HAS_PDX
 
 config PPC64
 	def_bool y
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 92f3a627da3c..30df085d969e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -24,7 +24,6 @@ config X86
 	select HAS_PASSTHROUGH
 	select HAS_PCI
 	select HAS_PCI_MSI
-	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8e0af2278104..59a6a2368876 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -458,7 +458,7 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-#ifndef CONFIG_BIGMEM
+#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
 /*
  * The hole may be at or above the 44-bit boundary, so we need to determine
  * the total bit count until reaching 32 significant (not squashed out) bits
@@ -485,13 +485,20 @@ static unsigned int __init noinline _domain_struct_bits(void)
 struct domain *alloc_domain_struct(void)
 {
     struct domain *d;
-#ifdef CONFIG_BIGMEM
-    const unsigned int bits = 0;
-#else
+
     /*
-     * We pack the PDX of the domain structure into a 32-bit field within
-     * the page_info structure. Hence the MEMF_bits() restriction.
+     * Without CONFIG_BIGMEM, we pack the PDX of the domain structure into
+     * a 32-bit field within the page_info structure. Hence the MEMF_bits()
+     * restriction. With PDX compression in place the number of bits must
+     * be calculated at runtime, but it's fixed otherwise.
+     *
+     * On systems with CONFIG_BIGMEM there's no packing, and so there's no
+     * such restriction.
      */
+#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
+    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
+                                                          32 + PAGE_SHIFT;
+#else
     static unsigned int __read_mostly bits;
 
     if ( unlikely(!bits) )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0d248ab94108..4ba9884f52c9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,21 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config PDX_COMPRESSION
+	bool "PDX (Page inDeX) compression" if EXPERT && !X86
+	default ARM || PPC
+	help
+	  PDX compression is a technique designed to reduce the memory
+	  overhead of physical memory management on platforms with sparse RAM
+	  banks.
+
+	  If your platform does have sparse RAM banks, enabling PDX
+	  compression may reduce the memory overhead of Xen, but does carry a
+	  runtime performance cost.
+
+	  If your platform does not have sparse RAM banks, do not enable PDX
+	  compression.
+
 config ALTERNATIVE_CALL
 	bool
 
@@ -53,9 +68,6 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
-config HAS_PDX
-	bool
-
 config HAS_PMAP
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index e7e96b1087ae..69d6aa626c7f 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -30,7 +30,7 @@ obj-y += multicall.o
 obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
-obj-$(CONFIG_HAS_PDX) += pdx.o
+obj-y += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
 obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
 obj-y += preempt.o
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index d3d38965bde9..d3d63b075032 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -31,11 +31,16 @@ unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
 
 bool __mfn_valid(unsigned long mfn)
 {
-    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
+    bool invalid = mfn >= max_page;
+
+#ifdef CONFIG_PDX_COMPRESSION
+    invalid |= mfn & pfn_hole_mask;
+#endif
+
+    if ( unlikely(evaluate_nospec(invalid)) )
         return false;
-    return likely(!(mfn & pfn_hole_mask)) &&
-           likely(test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT,
-                           pdx_group_valid));
+
+    return test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT, pdx_group_valid);
 }
 
 void set_pdx_range(unsigned long smfn, unsigned long emfn)
@@ -49,6 +54,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+#ifdef CONFIG_PDX_COMPRESSION
+
 /*
  * Diagram to make sense of the following variables. The masks and shifts
  * are done on mfn values in order to convert to/from pdx:
@@ -176,6 +183,7 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
 }
 
+#endif /* CONFIG_PDX_COMPRESSION */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index f3fbc4273aa4..bd535009ea8f 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -67,8 +67,6 @@
  * region involved.
  */
 
-#ifdef CONFIG_HAS_PDX
-
 extern unsigned long max_pdx;
 
 #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
@@ -100,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
+#ifdef CONFIG_PDX_COMPRESSION
+
 extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
 extern unsigned int pfn_pdx_hole_shift;
 extern unsigned long pfn_hole_mask;
@@ -206,7 +206,39 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
  */
 void pfn_pdx_hole_setup(unsigned long mask);
 
-#endif /* HAS_PDX */
+#else /* !CONFIG_PDX_COMPRESSION */
+
+/* Without PDX compression we can skip some computations */
+
+/* pdx<->pfn == identity */
+#define pdx_to_pfn(x) (x)
+#define pfn_to_pdx(x) (x)
+
+/* directmap is indexed by by maddr */
+#define maddr_to_directmapoff(x) (x)
+#define directmapoff_to_maddr(x) (x)
+
+static inline bool pdx_is_region_compressible(paddr_t base,
+                                              unsigned long npages)
+{
+    return true;
+}
+
+static inline uint64_t pdx_init_mask(uint64_t base_addr)
+{
+    return 0;
+}
+
+static inline uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+{
+    return 0;
+}
+
+static inline void pfn_pdx_hole_setup(unsigned long mask)
+{
+}
+
+#endif /* CONFIG_PDX_COMPRESSION */
 #endif /* __XEN_PDX_H__ */
 
 /*

base-commit: 295514ff7550626de4fb5e43b51deb25d9331cd5
prerequisite-patch-id: a3880342434550d7612ebc2e760dcd098dabd1d9
-- 
2.30.2


