Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014377A2DDC
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 06:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603494.940509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhMaL-00070y-Nx; Sat, 16 Sep 2023 04:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603494.940509; Sat, 16 Sep 2023 04:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhMaL-0006yM-Kj; Sat, 16 Sep 2023 04:07:09 +0000
Received: by outflank-mailman (input) for mailman id 603494;
 Sat, 16 Sep 2023 04:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aGgT=FA=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qhMaJ-0006yF-KI
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 04:07:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7f258f56-5446-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 06:07:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 268731FB;
 Fri, 15 Sep 2023 21:07:42 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D91F3F67D;
 Fri, 15 Sep 2023 21:07:01 -0700 (PDT)
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
X-Inumbo-ID: 7f258f56-5446-11ee-8788-cb3800f73035
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] xen/arm64: head.S: Fix wrong enable_boot_cpu_mm() code movement
Date: Sat, 16 Sep 2023 12:06:49 +0800
Message-Id: <20230916040649.1232558-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some addressed comments on enable_boot_cpu_mm() were reintroduced
back during the code movement from arm64/head.S to arm64/mmu/head.S.
We should drop the unreachable code, move the 'mov lr, x5' closer to
'b remove_identity_mapping' so it is clearer that it will return,
and update the in-code comment accordingly.

Fixes: 6734327d76be ("xen/arm64: Split and move MMU-specific head.S to mmu/head.S")
Reported-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/arm64/mmu/head.S | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index a5271e3880..88075ef083 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -329,7 +329,6 @@ ENTRY(enable_boot_cpu_mm)
         load_paddr x0, boot_pgtable
 
         bl    enable_mmu
-        mov   lr, x5
 
         /*
          * The MMU is turned on and we are in the 1:1 mapping. Switch
@@ -338,19 +337,15 @@ ENTRY(enable_boot_cpu_mm)
         ldr   x0, =1f
         br    x0
 1:
+        mov   lr, x5
         /*
          * The 1:1 map may clash with other parts of the Xen virtual memory
          * layout. As it is not used anymore, remove it completely to
          * avoid having to worry about replacing existing mapping
-         * afterwards. Function will return to primary_switched.
+         * afterwards. Function will return to the virtual address requested
+         * by the caller.
          */
         b     remove_identity_mapping
-
-        /*
-         * Below is supposed to be unreachable code, as "ret" in
-         * remove_identity_mapping will use the return address in LR in advance.
-         */
-        b     fail
 ENDPROC(enable_boot_cpu_mm)
 
 /*
-- 
2.25.1


