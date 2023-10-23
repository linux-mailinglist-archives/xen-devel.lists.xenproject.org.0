Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D805F7D285F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 04:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620933.966841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qukSc-0003pp-AH; Mon, 23 Oct 2023 02:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620933.966841; Mon, 23 Oct 2023 02:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qukSc-0003le-5n; Mon, 23 Oct 2023 02:14:30 +0000
Received: by outflank-mailman (input) for mailman id 620933;
 Mon, 23 Oct 2023 02:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qukSZ-0001U7-W4
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 02:14:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e381d4df-7149-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 04:14:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ADC92F4;
 Sun, 22 Oct 2023 19:15:06 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DC3D3F738;
 Sun, 22 Oct 2023 19:14:22 -0700 (PDT)
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
X-Inumbo-ID: e381d4df-7149-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 7/8] xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
Date: Mon, 23 Oct 2023 10:13:44 +0800
Message-Id: <20231023021345.1731436-8-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023021345.1731436-1-Henry.Wang@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <penny.zheng@arm.com>

init_secondary_pagetables() is a function in the common code path
of both MMU and future MPU support. Since "page table" is a MMU
specific concept, rename init_secondary_pagetables() to a generic
name prepare_secondary_mm() as the preparation for MPU support.

Reword the in-code comment on top of prepare_secondary_mm() because
this function is now supposed to be MMU/MPU agnostic.

Take the opportunity to fix the incorrect coding style of the in-code
comments.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v8:
- Change the in-code comment on top of prepare_secondary_mm() because
  this function is now supposed to be MMU/MPU agnostic, mention this
  in the commit message.
- Add Julien's Reviewed-by tag.
v7:
- No change.
v6:
- Only rename init_secondary_pagetables() to prepare_secondary_mm().
---
 xen/arch/arm/arm32/head.S     | 2 +-
 xen/arch/arm/include/asm/mm.h | 5 ++---
 xen/arch/arm/mmu/smpboot.c    | 4 ++--
 xen/arch/arm/smpboot.c        | 2 +-
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 39218cf15f..c7b2efb8f0 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -257,7 +257,7 @@ GLOBAL(init_secondary)
 secondary_switched:
         /*
          * Non-boot CPUs need to move on to the proper pagetables, which were
-         * setup in init_secondary_pagetables.
+         * setup in prepare_secondary_mm.
          *
          * XXX: This is not compliant with the Arm Arm.
          */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index d23ebc7df6..cbcf3bf147 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -204,9 +204,8 @@ extern void setup_pagetables(unsigned long boot_phys_offset);
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
-/* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
- * new page table */
-extern int init_secondary_pagetables(int cpu);
+/* Prepare the memory subystem to bring-up the given secondary CPU */
+extern int prepare_secondary_mm(int cpu);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 8b6a09f843..12f1a5d761 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -67,7 +67,7 @@ static void clear_boot_pagetables(void)
 }
 
 #ifdef CONFIG_ARM_64
-int init_secondary_pagetables(int cpu)
+int prepare_secondary_mm(int cpu)
 {
     clear_boot_pagetables();
 
@@ -80,7 +80,7 @@ int init_secondary_pagetables(int cpu)
     return 0;
 }
 #else
-int init_secondary_pagetables(int cpu)
+int prepare_secondary_mm(int cpu)
 {
     lpae_t *first;
 
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index beb137d06e..ac451e9b3e 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -448,7 +448,7 @@ int __cpu_up(unsigned int cpu)
 
     printk("Bringing up CPU%d\n", cpu);
 
-    rc = init_secondary_pagetables(cpu);
+    rc = prepare_secondary_mm(cpu);
     if ( rc < 0 )
         return rc;
 
-- 
2.25.1


