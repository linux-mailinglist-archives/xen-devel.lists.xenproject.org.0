Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CA6693C7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477048.739583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2G-0004D0-7G; Fri, 13 Jan 2023 10:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477048.739583; Fri, 13 Jan 2023 10:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2G-00049y-2I; Fri, 13 Jan 2023 10:11:44 +0000
Received: by outflank-mailman (input) for mailman id 477048;
 Fri, 13 Jan 2023 10:11:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGH2E-0003t1-Eo
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:11:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2E-0006d1-3y; Fri, 13 Jan 2023 10:11:42 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2D-0005Ty-Rv; Fri, 13 Jan 2023 10:11:42 +0000
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
	bh=vzfTzczjLXV/PEg7iDoDX2AUbfuIDhGYbEkSsXpjSeE=; b=CTJBH7q+3tEciLNn32G6x2pXxh
	v7WFKd3NEiPWlcGbm5f5hXiAs+5kZBGlPmpt4OHD2dQ5i01kl1uVLr6RLXw2gNlSFpZV6vJvqON8B
	DEuBa1JY11p3Og8QqrJ90ogMAeJKUT9LkfpLCyqQgdad2QrArUn3iWit5t8QDS3DtDeM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat workaround for TLB flush by VA
Date: Fri, 13 Jan 2023 10:11:24 +0000
Message-Id: <20230113101136.479-3-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Looking at the Neoverse N1 errata document, it is not clear to me
why the TLBI repeat workaround is not applied for TLB flush by VA.

The TBL flush by VA helpers are used in flush_xen_tlb_range_va_local()
and flush_xen_tlb_range_va(). So if the range size if a fixed size smaller
than a PAGE_SIZE, it would be possible that the compiler remove the loop
and therefore replicate the sequence described in the erratum 1286807.

So the TLBI repeat workaround should also be applied for the TLB flush
by VA helpers.

Fixes: 22e323d115d8 ("xen/arm: Add workaround for Cortex-A76/Neoverse-N1 erratum #1286807")
Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

----
    This was spotted while looking at reducing the scope of the memory
    barriers. I don't have any HW affected.

    Changes in v4:
        - Add Michal's reviewed-by tag

    Changes in v3:
        - Patch added
---
 xen/arch/arm/include/asm/arm64/flushtlb.h | 31 +++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index a40693b08dd3..7f81cbbb93f9 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -44,6 +44,27 @@ static inline void name(void)                    \
         : : : "memory");                         \
 }
 
+/*
+ * FLush TLB by VA. This will likely be used in a loop, so the caller
+ * is responsible to use the appropriate memory barriers before/after
+ * the sequence.
+ *
+ * See above about the ARM64_WORKAROUND_REPEAT_TLBI sequence.
+ */
+#define TLB_HELPER_VA(name, tlbop)               \
+static inline void name(vaddr_t va)              \
+{                                                \
+    asm volatile(                                \
+        "tlbi "  # tlbop  ", %0;"                \
+        ALTERNATIVE(                             \
+            "nop; nop;",                         \
+            "dsb  ish;"                          \
+            "tlbi "  # tlbop  ", %0;",           \
+            ARM64_WORKAROUND_REPEAT_TLBI,        \
+            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
+        : : "r" (va >> PAGE_SHIFT) : "memory");  \
+}
+
 /* Flush local TLBs, current VMID only. */
 TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh);
 
@@ -60,16 +81,10 @@ TLB_HELPER(flush_all_guests_tlb, alle1is, ish);
 TLB_HELPER(flush_xen_tlb_local, alle2, nsh);
 
 /* Flush TLB of local processor for address va. */
-static inline void  __flush_xen_tlb_one_local(vaddr_t va)
-{
-    asm volatile("tlbi vae2, %0;" : : "r" (va>>PAGE_SHIFT) : "memory");
-}
+TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2);
 
 /* Flush TLB of all processors in the inner-shareable domain for address va. */
-static inline void __flush_xen_tlb_one(vaddr_t va)
-{
-    asm volatile("tlbi vae2is, %0;" : : "r" (va>>PAGE_SHIFT) : "memory");
-}
+TLB_HELPER_VA(__flush_xen_tlb_one, vae2is);
 
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
-- 
2.38.1


