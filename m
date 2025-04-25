Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E0FA9D65A
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 01:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968822.1358300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shy-0003v1-71; Fri, 25 Apr 2025 23:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968822.1358300; Fri, 25 Apr 2025 23:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shy-0003sB-43; Fri, 25 Apr 2025 23:43:50 +0000
Received: by outflank-mailman (input) for mailman id 968822;
 Fri, 25 Apr 2025 23:43:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1RGh=XL=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1u8Shx-0002xk-39
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 23:43:49 +0000
Received: from outbound.pv.icloud.com
 (p-west1-cluster2-host11-snip4-10.eps.apple.com [57.103.64.161])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f624b3f-222f-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 01:43:44 +0200 (CEST)
Received: from localhost.localdomain (unknown [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id A36D71800386;
 Fri, 25 Apr 2025 23:43:39 +0000 (UTC)
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
X-Inumbo-ID: 1f624b3f-222f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=sig1; bh=WrHLjFWvrzfUqNQQfOkpQy6aR3OJ6DJQi4OTO3vSjJs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme;
	b=T7dtq+PVBSpO0rW/+tYxGYay8csiH376ubd77uI+tAw1mJgncG5RMlD3Uugi+R/A5
	 uYdNKc7xJESv8Z/adh3lEJU6KpP0dA8lSgLDKFNtDSQ0DfU37w8wydRlQemMmQ7qVn
	 ZwIa0s/Ia6uy67mdlMq2PerxlbJK8QEZ9s4khJgrJdgwTf0S+cfO1j54d6Js4hxGvl
	 /U6MxvrVe3tzPpX48sbYVTXZ0PGrWg9M9VoGXD+LrlRcCjTvheo2dCNEZRTi9nXQcl
	 zEO6SuIlvqUo3GIQORZCpdLGf66JpWaoYURe/b7M4A86uSIPWuEAkiyXkCh0jdl38f
	 WnmVepT/aS5Zw==
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <agarciav@amd.com>,
	"Alexander M . Merritt" <alexander@edera.dev>
Subject: [PATCH v2] x86/hyperv: use dynamically allocated page for hypercalls
Date: Fri, 25 Apr 2025 16:43:31 -0700
Message-Id: <20250425234331.65875-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iW6XCD6WDXn-nq0ocUMEoMboQ1uptbSx
X-Proofpoint-GUID: iW6XCD6WDXn-nq0ocUMEoMboQ1uptbSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030 phishscore=0
 malwarescore=0 mlxlogscore=855 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504250172

Previously Xen placed the hypercall page at the highest possible MFN,
but this caused problems on systems where there is more than 36 bits
of physical address space.

In general, it also seems unreliable to assume that the highest possible
MFN is not already reserved for some other purpose.

Changes from v1:
- Continue to use fixmap infrastructure
- Use panic in Hyper-V setup() function instead of returning -ENOMEM
  on hypercall page allocation failure

Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
Cc: Alejandro Vallejo <agarciav@amd.com>
Cc: Alexander M. Merritt <alexander@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
 xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 6989af38f1..0305374a06 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
     rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
     if ( !hypercall_msr.enable )
     {
-        mfn = HV_HCALL_MFN;
+        void *hcall_page = alloc_xenheap_page();
+        if ( !hcall_page )
+            panic("Hyper-V: Failed to allocate hypercall trampoline page");
+
+        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_page);
+
+        mfn = virt_to_mfn(hcall_page);
         hypercall_msr.enable = 1;
         hypercall_msr.guest_physical_address = mfn;
         wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
@@ -187,14 +193,6 @@ static int cf_check ap_setup(void)
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
@@ -211,7 +209,6 @@ static const struct hypervisor_ops __initconst_cf_clobber ops = {
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


