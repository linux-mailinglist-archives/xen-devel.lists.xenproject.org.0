Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF473D436
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554874.866317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfh-0003N6-Ai; Sun, 25 Jun 2023 20:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554874.866317; Sun, 25 Jun 2023 20:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfh-0003LF-73; Sun, 25 Jun 2023 20:49:21 +0000
Received: by outflank-mailman (input) for mailman id 554874;
 Sun, 25 Jun 2023 20:49:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWff-00035f-Fe
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWff-0003MI-7s; Sun, 25 Jun 2023 20:49:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWff-00021M-0M; Sun, 25 Jun 2023 20:49:19 +0000
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
	bh=ZbAv0laYLu6yT3k2hkA4Gj70LOYt07z08AMTeISDAIs=; b=gBjp3U5esOIGtiVaIIWDIkasBy
	svhJkygMb8nct3CANun88vUSVtpOSUgtxsaM6oW3LjZYYHAPIee8zHCW8ho+240q28aZEQzi44pwg
	pxebZGE+aTsoDlUD6yB08cL3CV5xjnmRtJ/oAiFvf7zce6iRzGrBzhB/U/Y9AbW+SdJw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/9] xen/arm32: head: Don't map too much in boot_third
Date: Sun, 25 Jun 2023 21:49:01 +0100
Message-Id: <20230625204907.57291-4-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
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
      memory attribute. This would result to attribue mismatch.

Therefore, rework the logic in create_page_tables() to map only what's
necessary. To simplify the logic, we also want to make sure _end
is page-aligned. So align the symbol in the linker and add an assert
to catch any change.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index f9f7be9588b1..997c8a4fbbc1 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -462,6 +462,19 @@ create_page_tables:
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
 
@@ -476,7 +489,7 @@ create_page_tables:
 1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
         add   r2, r2, #PAGE_SIZE     /* Next page */
         add   r1, r1, #8             /* Next slot */
-        cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
+        cmp   r1, r0                 /* Loop until we map all of Xen */
         blo   1b
 
         /*
-- 
2.40.1


