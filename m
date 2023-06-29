Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09D742E2C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 22:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557072.870124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzO-00069x-BW; Thu, 29 Jun 2023 20:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557072.870124; Thu, 29 Jun 2023 20:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzO-00067p-7D; Thu, 29 Jun 2023 20:11:38 +0000
Received: by outflank-mailman (input) for mailman id 557072;
 Thu, 29 Jun 2023 20:11:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qExzM-0005or-7g
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 20:11:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzM-0006lD-43; Thu, 29 Jun 2023 20:11:36 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzL-0000KI-SW; Thu, 29 Jun 2023 20:11:36 +0000
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
	bh=E0WEULIH7RKlj8ag6umBkV++f/zxydmEZbbsLJob028=; b=hOoV+7GxYhfQWP2/hhMX5h/ZAj
	sZ2e3BkFuGve2UvNM9ypBgS2PvqyOkG170PkinZQ0knEMO/hWpf9HtK69rNnvBbVO98+x+cGb16xT
	oz74dMXH6TdVwMBa4WFYBuezAL/SGTwa7LHZVzr0teiZrFHXpXd470E1aMriWkZOZAp4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
Date: Thu, 29 Jun 2023 21:11:27 +0100
Message-Id: <20230629201129.12934-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629201129.12934-1-julien@xen.org>
References: <20230629201129.12934-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, we are mapping the size of the reserved area for Xen
(i.e. 2MB) even if the binary is smaller. We don't exactly know what's
after Xen, so it is not a good idea to map more than necessary for a
couple of reasons:
    * We would need to use break-before-make if the extra PTE needs to
      be updated to point to another region
    * The extra area mapped may be mapped again by Xen with different
      memory attribute. This would result to attribute mismatch.

Therefore, rework the logic in create_page_tables() to map only what's
necessary. To simplify the logic, we also want to make sure _end
is page-aligned. So align the symbol in the linker and add an assert
to catch any change.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---

    Changes in v2:
        - Fix typo
        - Add Michal's reviewed-by tag
---
 xen/arch/arm/arm32/head.S | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 1ad981b67460..5e3692eb3abf 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -459,6 +459,19 @@ create_page_tables:
         create_table_entry boot_pgtable, boot_second, r0, 1
         create_table_entry boot_second, boot_third, r0, 2
 
+        /*
+         * Find the size of Xen in pages and multiply by the size of a
+         * PTE. This will then be compared in the mapping loop below.
+         *
+         * Note the multiplication is just to avoid using an extra
+         * register/instruction per iteration.
+         */
+        mov_w r0, _start            /* r0 := vaddr(_start) */
+        mov_w r1, _end              /* r1 := vaddr(_end) */
+        sub   r0, r1, r0            /* r0 := effective size of Xen */
+        lsr   r0, r0, #PAGE_SHIFT   /* r0 := Number of pages for Xen */
+        lsl   r0, r0, #3            /* r0 := Number of pages * PTE size */
+
         /* Setup boot_third: */
         adr_l r4, boot_third
 
@@ -473,7 +486,7 @@ create_page_tables:
 1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
         add   r2, r2, #PAGE_SIZE     /* Next page */
         add   r1, r1, #8             /* Next slot */
-        cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
+        cmp   r1, r0                 /* Loop until we map all of Xen */
         blo   1b
 
         /*
-- 
2.40.1


