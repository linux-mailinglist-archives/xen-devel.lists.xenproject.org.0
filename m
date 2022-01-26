Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41DE49CF0C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 16:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260996.451430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkhk-00079L-25; Wed, 26 Jan 2022 15:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260996.451430; Wed, 26 Jan 2022 15:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkhj-00077K-VO; Wed, 26 Jan 2022 15:59:27 +0000
Received: by outflank-mailman (input) for mailman id 260996;
 Wed, 26 Jan 2022 15:59:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCkhi-00077D-Tr
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 15:59:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCkhh-0005gv-Fh; Wed, 26 Jan 2022 15:59:25 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCkhh-0004wO-6t; Wed, 26 Jan 2022 15:59:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=eBX7D1PxumbG6dEKxGfJrObnb724MkaIC0aw1q7qAAA=; b=Z1lqUu
	AliszOIcbnQ0/8hqxh4xIUMZ+CAy/rSy2faCYqaiPIOPojibOf0SnCDL8fjSDkR5BOo3H7uPs7UXV
	gexj0xPc6sf3VnkSp5RkeVmeCraPKUw7o/LCxEOoUOjfUTuNErNtVSI8YCa6MVWhAZpZ9A/rXOyAr
	fVTpsumwdlg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] xen: Replace arch_mfn_in_directmap() with arch_mfns_in_directmap()
Date: Wed, 26 Jan 2022 15:59:19 +0000
Message-Id: <20220126155919.36706-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The name of arch_mfn_in_directmap() suggests that it will check against
that the passed MFN should be in the directmap.

However, the current callers are passing the next MFN and the
implementation will return true for up to one MFN past the directmap.

It would be more meaningful to test the exact MFN rather than the
next one.

That said, the current expectation is the memory will be direct-mapped
from 0 up to a given MFN. This may not be a valid assumption on all
the architectures.

For instance, on Arm32 only the xenheap that will be direct-mapped.
This may not be allocated a the beginning of the RAM.

So take the opportunity to rework the parameters and pass the
number of pages we want to check. This also requires to rename
the helper to better match the implementation.

Note that the implementation of the helper on arm32 is left as-is
for now.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

Changes in v2:
    - Pass a region instead the last MFN.
    - Rename the helper to arch_mfns_in_directmap()
    - This was https://lore.kernel.org/xen-devel/20211216152220.3317-1-julien@xen.org/

Looking at the history, it looks like the check in init_node_heap()
was <= and it was simply moved to a new helper without any adjustment
as part of c6fdc9696a "boot allocator: use arch helper for virt_to_mfn
on DIRECTMAP_VIRT region".
---
 xen/arch/arm/include/asm/arm32/mm.h | 2 +-
 xen/arch/arm/include/asm/arm64/mm.h | 2 +-
 xen/arch/x86/include/asm/mm.h       | 6 +++---
 xen/common/page_alloc.c             | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 68612499bf6c..6b039d9ceaa2 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -5,7 +5,7 @@
  * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
  * For convenience always return false.
  */
-static inline bool arch_mfn_in_directmap(unsigned long mfn)
+static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
     return false;
 }
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index d0a3be7e15a4..aa2adac63189 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -5,7 +5,7 @@
  * On ARM64, all the RAM is currently direct mapped in Xen.
  * Hence return always true.
  */
-static inline bool arch_mfn_in_directmap(unsigned long mfn)
+static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
     return true;
 }
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 5dbcee869624..9b9de4c6bef7 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -635,13 +635,13 @@ void write_32bit_pse_identmap(uint32_t *l2);
 
 /*
  * x86 maps part of physical memory via the directmap region.
- * Return whether the input MFN falls in that range.
+ * Return whether the range of MFN falls in the directmap region.
  */
-static inline bool arch_mfn_in_directmap(unsigned long mfn)
+static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
     unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
-    return mfn <= (virt_to_mfn(eva - 1) + 1);
+    return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 38eea879c04a..f8749b0787a6 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -588,7 +588,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         needed = 0;
     }
     else if ( *use_tail && nr >= needed &&
-              arch_mfn_in_directmap(mfn + nr) &&
+              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
@@ -597,7 +597,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
                       PAGE_SIZE - sizeof(**avail) * NR_ZONES;
     }
     else if ( nr >= needed &&
-              arch_mfn_in_directmap(mfn + needed) &&
+              arch_mfns_in_directmap(mfn, needed) &&
               (!xenheap_bits ||
                !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-- 
2.32.0


