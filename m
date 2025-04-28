Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CAFA9FA0C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 21:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971050.1359554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Uc2-0007zz-4R; Mon, 28 Apr 2025 19:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971050.1359554; Mon, 28 Apr 2025 19:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Uc2-0007yY-1N; Mon, 28 Apr 2025 19:57:58 +0000
Received: by outflank-mailman (input) for mailman id 971050;
 Mon, 28 Apr 2025 19:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+tr=XO=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1u9Uc0-0007yS-DN
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 19:57:56 +0000
Received: from outbound.pv.icloud.com
 (p-west1-cluster5-host11-snip4-1.eps.apple.com [57.103.66.212])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11edcb19-246b-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 21:57:53 +0200 (CEST)
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com
 [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id 84DF71800104;
 Mon, 28 Apr 2025 19:57:50 +0000 (UTC)
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
X-Inumbo-ID: 11edcb19-246b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=sig1; bh=K0UfcYv3WTxscxADpnQTE6dbrKfwyxSj8fcNiZp5ugY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme;
	b=F8LQiHpkmcozGsUIVn0NIxyofOPJWv//v7r9N5BL+Sudz3AqKGZZqH2exQohR0+e4
	 VaGy+Gd3dwXx2YGtXGG9Q2qBF6b+DtM8GIS5Ba1tXS9Km3K9rOawH2/L9mHACDrRVy
	 i1yq0ufi+Asv1W4Kb///+CoYUEGNbpVqhqwl8w1Tq1wSiYxYtq0Ks9CgfjlVufgsw3
	 3fITBz1OzcrLaz82KZSNrqUwpZXg/Alsz64ANpOWiqLDKxY5QUKgSpFleLhNzuhW9J
	 Bv6a2T0vTK+hy8OT9DojJCArqMR7epyZyPdFp9GnUS0mX3ZIudz9lBm+CBKMqaSWmH
	 hCXBfUF16dXeA==
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <agarciav@amd.com>,
	"Alexander M . Merritt" <alexander@edera.dev>
Subject: [PATCH v3] x86/hyperv: use dynamically allocated page for hypercalls
Date: Mon, 28 Apr 2025 12:57:36 -0700
Message-Id: <20250428195736.2516-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gHF_yi7tNRx97wpQoDcPOQrznhtP2YMB
X-Proofpoint-ORIG-GUID: gHF_yi7tNRx97wpQoDcPOQrznhtP2YMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=843 clxscore=1030
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2503100000 definitions=main-2504280161

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
Changes from v2:
- Style fixes
- Change hypercall page notice to print the MFN instead, and use
  dprintk

Changes from v1:
- Continue to use fixmap infrastructure
- Use panic in Hyper-V setup() function instead of returning -ENOMEM
  on hypercall page allocation failure

 xen/arch/x86/guest/hyperv/hyperv.c      | 19 +++++++++----------
 xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 6989af38f1..f69f596441 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -98,10 +98,18 @@ static void __init setup_hypercall_page(void)
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     if ( !hypercall_msr.enable )
     {
-        mfn = HV_HCALL_MFN;
+        void *hcall_page = alloc_xenheap_page();
+
+        if ( !hcall_page )
+            panic("Hyper-V: Failed to allocate hypercall trampoline page\n");
+
+        mfn = virt_to_mfn(hcall_page);
         hypercall_msr.enable = 1;
         hypercall_msr.guest_physical_address = mfn;
         wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
+
+        dprintk(XENLOG_INFO,
+                "Hyper-V: Allocated hypercall page at MFN %lx\n", mfn);
     }
     else
         mfn = hypercall_msr.guest_physical_address;
@@ -187,14 +195,6 @@ static int cf_check ap_setup(void)
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
@@ -211,7 +211,6 @@ static const struct hypervisor_ops __initconst_cf_clobber ops = {
     .name = "Hyper-V",
     .setup = setup,
     .ap_setup = ap_setup,
-    .e820_fixup = e820_fixup,
     .flush_tlb = flush_tlb,
 };
 
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
-- 
2.39.5 (Apple Git-154)


