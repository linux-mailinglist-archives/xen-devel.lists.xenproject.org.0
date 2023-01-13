Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A144D6693CC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477049.739589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2G-0004H2-II; Fri, 13 Jan 2023 10:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477049.739589; Fri, 13 Jan 2023 10:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2G-0004DT-C1; Fri, 13 Jan 2023 10:11:44 +0000
Received: by outflank-mailman (input) for mailman id 477049;
 Fri, 13 Jan 2023 10:11:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGH2F-00049S-JG
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:11:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2F-0006dD-Cp; Fri, 13 Jan 2023 10:11:43 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2F-0005Ty-4l; Fri, 13 Jan 2023 10:11:43 +0000
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
	bh=S5CSEJlBmASUGIMShN3J0tQmDdGXRbDxfQ6mQC3mU80=; b=ulnD1k8Awt/9sxbOaG9O+ol4Ir
	6x/Fwn9EklXfrM8GdEKuPGCMtMxAm8ZCiRDlyHOnDeEA9vE4g49APkobuRvJBI1pptfi60BIApyID
	VumJLZiqrePbqAEKDJFnWWtca5/DnEfFlAfECpa4qz0BiHTmIAZWPylwcHBl88IYJP8I=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 03/14] xen/arm32: flushtlb: Reduce scope of barrier for local TLB flush
Date: Fri, 13 Jan 2023 10:11:25 +0000
Message-Id: <20230113101136.479-4-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Per G5-9224 in ARM DDI 0487I.a:

"A DSB NSH is sufficient to ensure completion of TLB maintenance
 instructions that apply to a single PE. A DSB ISH is sufficient to
 ensure completion of TLB maintenance instructions that apply to PEs
 in the same Inner Shareable domain.
"

This is quoting the Armv8 specification because I couldn't find an
explicit statement in the Armv7 specification. Instead, I could find
bits in various places that confirm the same implementation.

Furthermore, Linux has been using 'nsh' since 2013 (62cbbc42e001
"ARM: tlb: reduce scope of barrier domains for TLB invalidation").

This means barrier after local TLB flushes could be reduced to
non-shareable.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

----

    Changes in v4:
        - Add Michal's reviewed-by tag

    Changes in v3:
        - Patch added
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 27 +++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 9085e6501153..7ae6a12f8155 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -15,30 +15,33 @@
  * For the Stage-2 page-tables the ISB ensures the completion of the DSB
  * (and therefore the TLB invalidation) before continuing. So we know
  * the TLBs cannot contain an entry for a mapping we may have removed.
+ *
+ * Note that for local TLB flush, using non-shareable (nsh) is sufficient
+ * (see G5-9224 in ARM DDI 0487I.a).
  */
-#define TLB_HELPER(name, tlbop) \
-static inline void name(void)   \
-{                               \
-    dsb(ishst);                 \
-    WRITE_CP32(0, tlbop);       \
-    dsb(ish);                   \
-    isb();                      \
+#define TLB_HELPER(name, tlbop, sh) \
+static inline void name(void)       \
+{                                   \
+    dsb(sh ## st);                  \
+    WRITE_CP32(0, tlbop);           \
+    dsb(sh);                        \
+    isb();                          \
 }
 
 /* Flush local TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb_local, TLBIALL);
+TLB_HELPER(flush_guest_tlb_local, TLBIALL, nsh);
 
 /* Flush inner shareable TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb, TLBIALLIS);
+TLB_HELPER(flush_guest_tlb, TLBIALLIS, ish);
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb_local, TLBIALLNSNH);
+TLB_HELPER(flush_all_guests_tlb_local, TLBIALLNSNH, nsh);
 
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb, TLBIALLNSNHIS);
+TLB_HELPER(flush_all_guests_tlb, TLBIALLNSNHIS, ish);
 
 /* Flush all hypervisor mappings from the TLB of the local processor. */
-TLB_HELPER(flush_xen_tlb_local, TLBIALLH);
+TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh);
 
 /* Flush TLB of local processor for address va. */
 static inline void __flush_xen_tlb_one_local(vaddr_t va)
-- 
2.38.1


