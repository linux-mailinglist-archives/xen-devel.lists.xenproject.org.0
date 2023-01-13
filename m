Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECFF6693C9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477050.739605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2H-0004jR-Te; Fri, 13 Jan 2023 10:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477050.739605; Fri, 13 Jan 2023 10:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2H-0004dF-O4; Fri, 13 Jan 2023 10:11:45 +0000
Received: by outflank-mailman (input) for mailman id 477050;
 Fri, 13 Jan 2023 10:11:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGH2G-0004RI-OW
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:11:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2G-0006dU-Lr; Fri, 13 Jan 2023 10:11:44 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2G-0005Ty-Dp; Fri, 13 Jan 2023 10:11:44 +0000
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
	bh=AlqTneJ4LSbMwjz1i6xFwfom8gh69DQnrqOXDMM4PVs=; b=0hhPFhOI2/yxluEn6Ulv0PJ20B
	bgPfex6S69Ngb71ds7CfOllSilwOFxXnG3J9b3nzTPOvxApEMOcQ1sHDxwVpmIdhm5rN1bwdOoPNW
	0TDJMTs17niug8uO9ojs6Ey8OdwyNwxHcCSt6cjoc9sG5skH3AdCaHWlvjsn+9j5SSKM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 04/14] xen/arm: flushtlb: Reduce scope of barrier for the TLB range flush
Date: Fri, 13 Jan 2023 10:11:26 +0000
Message-Id: <20230113101136.479-5-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, flush_xen_tlb_range_va{,_local}() are using system
wide memory barrier. This is quite expensive and unnecessary.

For the local version, a non-shareable barrier is sufficient.
For the SMP version, an inner-shareable barrier is sufficient.

Furthermore, the initial barrier only needs to a store barrier.

For the full explanation of the sequence see asm/arm{32,64}/flushtlb.h.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

----
    Changes in v4:
        - Add Michal's reviewed-by tag

    Changes in v3:
        - Patch added
---
 xen/arch/arm/include/asm/flushtlb.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index 125a141975e0..e45fb6d97b02 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -37,13 +37,14 @@ static inline void flush_xen_tlb_range_va_local(vaddr_t va,
 {
     vaddr_t end = va + size;
 
-    dsb(sy); /* Ensure preceding are visible */
+    /* See asm/arm{32,64}/flushtlb.h for the explanation of the sequence. */
+    dsb(nshst); /* Ensure prior page-tables updates have completed */
     while ( va < end )
     {
         __flush_xen_tlb_one_local(va);
         va += PAGE_SIZE;
     }
-    dsb(sy); /* Ensure completion of the TLB flush */
+    dsb(nsh); /* Ensure the TLB invalidation has completed */
     isb();
 }
 
@@ -56,13 +57,14 @@ static inline void flush_xen_tlb_range_va(vaddr_t va,
 {
     vaddr_t end = va + size;
 
-    dsb(sy); /* Ensure preceding are visible */
+    /* See asm/arm{32,64}/flushtlb.h for the explanation of the sequence. */
+    dsb(ishst); /* Ensure prior page-tables updates have completed */
     while ( va < end )
     {
         __flush_xen_tlb_one(va);
         va += PAGE_SIZE;
     }
-    dsb(sy); /* Ensure completion of the TLB flush */
+    dsb(ish); /* Ensure the TLB invalidation has completed */
     isb();
 }
 
-- 
2.38.1


