Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27386693C8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477047.739572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2E-0003u5-Nu; Fri, 13 Jan 2023 10:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477047.739572; Fri, 13 Jan 2023 10:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2E-0003ss-IN; Fri, 13 Jan 2023 10:11:42 +0000
Received: by outflank-mailman (input) for mailman id 477047;
 Fri, 13 Jan 2023 10:11:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGH2D-0003d3-4M
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:11:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2C-0006co-RG; Fri, 13 Jan 2023 10:11:40 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2C-0005Ty-Io; Fri, 13 Jan 2023 10:11:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Epx2xru5giDtyGeSu7KBQPAEsvy0qbPPMNGZosRt7DU=; b=3Mip3amkdLbFQBIIeWWOi8/59R
	2/U5bDwI4Utqz8IJwqNI+hR53AZuSgf1FOa4i7zHxZiFnTxgTvyifsPRqIHqsD8/UwNQuIHkBfyYx
	M6XZ6XIciwCaoHVxsoDBgfSBm2OfvKyADnYrjYZ2YWo3VFY0O8Pl5Wjt7JqbtzSVRgeI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 01/14] xen/arm64: flushtlb: Reduce scope of barrier for local TLB flush
Date: Fri, 13 Jan 2023 10:11:23 +0000
Message-Id: <20230113101136.479-2-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Per D5-4929 in ARM DDI 0487H.a:
"A DSB NSH is sufficient to ensure completion of TLB maintenance
 instructions that apply to a single PE. A DSB ISH is sufficient to
 ensure completion of TLB maintenance instructions that apply to PEs
 in the same Inner Shareable domain.
"

This means barrier after local TLB flushes could be reduced to
non-shareable.

Note that the scope of the barrier in the workaround has not been
changed because Linux v6.1-rc8 is also using 'ish' and I couldn't
find anything in the Neoverse N1 suggesting that a 'nsh' would
be sufficient.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

----

    I have used an older version of the Arm Arm because the explanation
    in the latest (ARM DDI 0487I.a) is less obvious. I reckon the paragraph
    about DSB in D8.13.8 is missing the shareability. But this is implied
    in B2.3.11:

    "If the required access types of the DSB is reads and writes, the
     following instructions issued by PEe before the DSB are complete for
     the required shareability domain:

     [...]

     — All TLB maintenance instructions.
    "

    Changes in v4:
        - Fix typoes
        - Don't modify the shareability in the workaround
        - Add Michal's reviewed-by tag

    Changes in v3:
        - Patch added
---
 xen/arch/arm/include/asm/arm64/flushtlb.h | 25 ++++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 7c5431518741..a40693b08dd3 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -12,8 +12,9 @@
  * ARM64_WORKAROUND_REPEAT_TLBI:
  * Modification of the translation table for a virtual address might lead to
  * read-after-read ordering violation.
- * The workaround repeats TLBI+DSB operation for all the TLB flush operations.
- * While this is stricly not necessary, we don't want to take any risk.
+ * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
+ * operations. While this is strictly not necessary, we don't want to
+ * take any risk.
  *
  * For Xen page-tables the ISB will discard any instructions fetched
  * from the old mappings.
@@ -21,12 +22,16 @@
  * For the Stage-2 page-tables the ISB ensures the completion of the DSB
  * (and therefore the TLB invalidation) before continuing. So we know
  * the TLBs cannot contain an entry for a mapping we may have removed.
+ *
+ * Note that for local TLB flush, using non-shareable (nsh) is sufficient
+ * (see D5-4929 in ARM DDI 0487H.a). Although, the memory barrier in
+ * for the workaround is left as inner-shareable to match with Linux.
  */
-#define TLB_HELPER(name, tlbop)                  \
+#define TLB_HELPER(name, tlbop, sh)              \
 static inline void name(void)                    \
 {                                                \
     asm volatile(                                \
-        "dsb  ishst;"                            \
+        "dsb  "  # sh  "st;"                     \
         "tlbi "  # tlbop  ";"                    \
         ALTERNATIVE(                             \
             "nop; nop;",                         \
@@ -34,25 +39,25 @@ static inline void name(void)                    \
             "tlbi "  # tlbop  ";",               \
             ARM64_WORKAROUND_REPEAT_TLBI,        \
             CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
-        "dsb  ish;"                              \
+        "dsb  "  # sh  ";"                       \
         "isb;"                                   \
         : : : "memory");                         \
 }
 
 /* Flush local TLBs, current VMID only. */
-TLB_HELPER(flush_guest_tlb_local, vmalls12e1);
+TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh);
 
 /* Flush innershareable TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb, vmalls12e1is);
+TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish);
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb_local, alle1);
+TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh);
 
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb, alle1is);
+TLB_HELPER(flush_all_guests_tlb, alle1is, ish);
 
 /* Flush all hypervisor mappings from the TLB of the local processor. */
-TLB_HELPER(flush_xen_tlb_local, alle2);
+TLB_HELPER(flush_xen_tlb_local, alle2, nsh);
 
 /* Flush TLB of local processor for address va. */
 static inline void  __flush_xen_tlb_one_local(vaddr_t va)
-- 
2.38.1


