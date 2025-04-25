Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AE2A9CED4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 18:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968404.1358010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8MHe-0001sD-Qk; Fri, 25 Apr 2025 16:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968404.1358010; Fri, 25 Apr 2025 16:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8MHe-0001pr-NC; Fri, 25 Apr 2025 16:52:14 +0000
Received: by outflank-mailman (input) for mailman id 968404;
 Fri, 25 Apr 2025 16:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1RGh=XL=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1u8MHd-0001pl-S8
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 16:52:13 +0000
Received: from outbound.pv.icloud.com
 (p-west1-cluster2-host6-snip6-9.eps.apple.com [2a01:b747:3003:201::3e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a154a7c6-21f5-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 18:52:11 +0200 (CEST)
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com
 [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id 4291618003CD;
 Fri, 25 Apr 2025 16:52:07 +0000 (UTC)
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
X-Inumbo-ID: a154a7c6-21f5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=sig1; bh=AqzuCv7+leJbc7/y3U+HHR7PKYTwzl5TYrhzClUu/M8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme;
	b=By6Pwu5UAqN3o6dCZpLQHR6dw2MIX3VpyTvCFCXwIntjo69dXfCSXTK7i6ck+6tes
	 gaAMyYl5TaAGIEGAPDCXaSaLnkSNPkpCco+BJ+Vzc/pLOwJuE1RFARK3CD+a160S2v
	 nNB4S3PnpdrSoyx6jhWIXDcmcdtFODyLhzHNeX8yoQ54PySl2lug6BMVjECAiXK0R7
	 2WuJaPEr2HIQGJG9yEzD8NFpD0bQVJFX8ClKXkG5VZaBlgnPhXXFgusX74f/9huLdf
	 +6g0DVHUUwYyZ/iCFexBEuXVGR9OWZLDufwKgrlMkAIInzPVMykuMEil4jTFVtGMBX
	 I6wd9RnfX5Srw==
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <agarciav@amd.com>,
	"Alexander M . Merritt" <alexander@edera.dev>
Subject: [PATCH] x86/hyperv: use dynamically allocated page for hypercalls
Date: Fri, 25 Apr 2025 09:51:48 -0700
Message-Id: <20250425165148.60408-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3K8K5Ww8Fd96YwjzHVva5w5J6pviM2be
X-Proofpoint-ORIG-GUID: 3K8K5Ww8Fd96YwjzHVva5w5J6pviM2be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=795 clxscore=1030
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504250119

Previously Xen placed the hypercall page at the highest possible MFN,
but this caused problems on systems where there is more than 36 bits
of physical address space.

In general, it also seems unreliable to assume that the highest possible
MFN is not already reserved for some other purpose.

Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
Cc: Alejandro Vallejo <agarciav@amd.com>
Cc: Alexander M. Merritt <alexander@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 xen/arch/x86/guest/hyperv/hyperv.c            | 39 ++++++++++---------
 xen/arch/x86/include/asm/fixmap.h             |  3 --
 xen/arch/x86/include/asm/guest/hyperv-hcall.h | 12 +++---
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h  |  2 +
 xen/arch/x86/include/asm/guest/hyperv.h       |  3 --
 xen/arch/x86/xen.lds.S                        |  4 --
 6 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 6989af38f1..637b4bf335 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -16,6 +16,7 @@
 
 #include "private.h"
 
+void __read_mostly *hv_hcall_page;
 struct ms_hyperv_info __read_mostly ms_hyperv;
 DEFINE_PER_CPU_READ_MOSTLY(void *, hv_input_page);
 DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
@@ -80,13 +81,11 @@ const struct hypervisor_ops *__init hyperv_probe(void)
     return &ops;
 }
 
-static void __init setup_hypercall_page(void)
+static int __init setup_hypercall_page(void)
 {
     union hv_x64_msr_hypercall_contents hypercall_msr;
     union hv_guest_os_id guest_id;
-    unsigned long mfn;
-
-    BUILD_BUG_ON(HV_HYP_PAGE_SHIFT != PAGE_SHIFT);
+    unsigned long mfn, start;
 
     rdmsrl(HV_X64_MSR_GUEST_OS_ID, guest_id.raw);
     if ( !guest_id.raw )
@@ -98,10 +97,22 @@ static void __init setup_hypercall_page(void)
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     if ( !hypercall_msr.enable )
     {
-        mfn = HV_HCALL_MFN;
+        hv_hcall_page = alloc_xenheap_page();
+        if ( !hv_hcall_page )
+        {
+            printk("Hyper-V: Failed to allocate hypercall trampoline page\n");
+            return -ENOMEM;
+        }
+
+        printk("Hyper-V: Allocated hypercall page @ %p.\n", hv_hcall_page);
+
+        mfn = virt_to_mfn(hv_hcall_page);
         hypercall_msr.enable = 1;
         hypercall_msr.guest_physical_address = mfn;
         wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
+
+        start = (unsigned long) hv_hcall_page;
+        modify_xen_mappings(start, start + PAGE_SIZE, PAGE_HYPERVISOR_RX);
     }
     else
         mfn = hypercall_msr.guest_physical_address;
@@ -109,9 +120,9 @@ static void __init setup_hypercall_page(void)
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     BUG_ON(!hypercall_msr.enable);
 
-    set_fixmap_x(FIX_X_HYPERV_HCALL, mfn << PAGE_SHIFT);
-
     hcall_page_ready = true;
+
+    return 0;
 }
 
 static int setup_hypercall_pcpu_arg(void)
@@ -165,9 +176,8 @@ static int setup_vp_assist(void)
 
 static void __init cf_check setup(void)
 {
-    ASM_CONSTANT(HV_HCALL_PAGE, __fix_x_to_virt(FIX_X_HYPERV_HCALL));
-
-    setup_hypercall_page();
+    if ( setup_hypercall_page() )
+        panic("Hyper-V hypercall page setup failed\n");
 
     if ( setup_hypercall_pcpu_arg() )
         panic("Hyper-V hypercall percpu arg setup failed\n");
@@ -187,14 +197,6 @@ static int cf_check ap_setup(void)
     return setup_vp_assist();
 }
 
-static void __init cf_check e820_fixup(void)
-{
-    uint64_t s = HV_HCALL_MFN << PAGE_SHIFT;
-
-    if ( !e820_add_range(s, s + PAGE_SIZE, E820_RESERVED) )
-        panic("Unable to reserve Hyper-V hypercall range\n");
-}
-
 static int cf_check flush_tlb(
     const cpumask_t *mask, const void *va, unsigned int flags)
 {
@@ -211,7 +213,6 @@ static const struct hypervisor_ops __initconst_cf_clobber ops = {
     .name = "Hyper-V",
     .setup = setup,
     .ap_setup = ap_setup,
-    .e820_fixup = e820_fixup,
     .flush_tlb = flush_tlb,
 };
 
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c..7384a2d07c 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -98,9 +98,6 @@ static inline unsigned long virt_to_fix(const unsigned long vaddr)
 enum fixed_addresses_x {
     /* Index 0 is reserved since fix_x_to_virt(0) == FIXADDR_X_TOP. */
     FIX_X_RESERVED,
-#ifdef CONFIG_HYPERV_GUEST
-    FIX_X_HYPERV_HCALL,
-#endif
     __end_of_fixed_addresses_x
 };
 
diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
index b76dbf9ccc..b73edca7c6 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
@@ -20,13 +20,13 @@ static inline uint64_t hv_do_hypercall(uint64_t control, paddr_t input_addr,
                                        paddr_t output_addr)
 {
     uint64_t status;
-    register unsigned long r8 asm ( "r8" ) = output_addr;
 
     /* See TLFS for volatile registers */
-    asm volatile ( "call hv_hcall_page"
+    asm volatile ( "mov %[output_addr], %%r8\n"
+                   "call *%[target_addr]"
                    : "=a" (status), "+c" (control),
                      "+d" (input_addr) ASM_CALL_CONSTRAINT
-                   : "r" (r8)
+                   : [output_addr] "r" (output_addr), [target_addr] "r" (hv_hcall_page)
                    : "memory" );
 
     return status;
@@ -37,13 +37,13 @@ static inline uint64_t hv_do_fast_hypercall(uint16_t code,
 {
     uint64_t status;
     uint64_t control = code | HV_HYPERCALL_FAST_BIT;
-    register unsigned long r8 asm ( "r8" ) = input2;
 
     /* See TLFS for volatile registers */
-    asm volatile ( "call hv_hcall_page"
+    asm volatile ( "mov %[input2], %%r8\n"
+                   "call *[target_addr]"
                    : "=a" (status), "+c" (control),
                      "+d" (input1) ASM_CALL_CONSTRAINT
-                   : "r" (r8) );
+                   : [input2] "r" (input2), [target_addr] "r" (hv_hcall_page) );
 
     return status;
 }
diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
index 79cfc90dd8..01fc76f20c 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
@@ -13,6 +13,8 @@
 #include <xen/page-size.h>
 #include <xen/types.h>
 
+extern void *hv_hcall_page;
+
 /*
  * While not explicitly listed in the TLFS, Hyper-V always runs with a page size
  * of 4096. These definitions are used when communicating with Hyper-V using
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index c05efdce71..5792e77104 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -10,9 +10,6 @@
 
 #include <xen/types.h>
 
-/* Use top-most MFN for hypercall page */
-#define HV_HCALL_MFN   (((1ull << paddr_bits) - 1) >> HV_HYP_PAGE_SHIFT)
-
 /*
  * The specification says: "The partition reference time is computed
  * by the following formula:
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 53bafc98a5..3d0c8e6ffc 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -359,10 +359,6 @@ SECTIONS
 
   DWARF2_DEBUG_SECTIONS
 
-#ifdef CONFIG_HYPERV_GUEST
-  hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
-#endif
-
   DISCARD_SECTIONS
 
 #ifndef EFI
-- 
2.39.5 (Apple Git-154)


