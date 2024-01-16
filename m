Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4482F09A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667805.1039436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ1-0007FL-Ln; Tue, 16 Jan 2024 14:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667805.1039436; Tue, 16 Jan 2024 14:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ1-0007A6-I7; Tue, 16 Jan 2024 14:37:15 +0000
Received: by outflank-mailman (input) for mailman id 667805;
 Tue, 16 Jan 2024 14:37:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPkZ0-00077K-HD
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:37:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkZ0-0002vu-0l; Tue, 16 Jan 2024 14:37:14 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkYz-0000Te-Oi; Tue, 16 Jan 2024 14:37:13 +0000
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
	bh=thlQxTTR/2J0TcN6DCYxzWx3fz1JwxED7pOaGuRoX08=; b=SgvlFM/MpSkQPUAJkDG4HFWQUY
	sghrtjogXA8iZevCApX76/SAWy21G9vPCX8E2NXXV4vve/PhlyHU0KsaPcw72EoouACxYTOk+bSx7
	oJlvbFRnnALqf/n+23KmE2/McMoiZV8BGbiupJhrT4O98tAt4YOLsZOfll5Qe/Ro397U=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 repost 1/4] arm/mmu: Move init_ttbr to a new section .data.idmap
Date: Tue, 16 Jan 2024 14:37:06 +0000
Message-Id: <20240116143709.86584-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116143709.86584-1-julien@xen.org>
References: <20240116143709.86584-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

With the upcoming work to color Xen, the binary will not be anymore
physically contiguous. This will be a problem during boot as the
assembly code will need to work out where each piece of Xen reside.

An easy way to solve the issue is to have all code/data accessed
by the secondary CPUs while the MMU is off within a single page.

Right now, init_ttbr is used by secondary CPUs to find there page-tables
before the MMU is on. Yet it is currently in .data which is unlikely
to be within the same page as the rest of the idmap.

Create a new section .data.idmap that will be used for variables
accessed by the early boot code. The first one is init_ttbr.

The idmap is currently part of the text section and therefore will
be mapped read-only executable. This means that we need to temporarily
remap init_ttbr in order to update it.

Introduce a new function set_init_ttbr() for this purpose so the code
is not duplicated between arm64 and arm32.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mmu/smpboot.c | 34 +++++++++++++++++++++++++++++-----
 xen/arch/arm/xen.lds.S     |  1 +
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index b6fc0aae07f1..f1cf9252710c 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -9,6 +9,10 @@
 
 #include <asm/setup.h>
 
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+
 /*
  * Static start-of-day pagetables that we use before the allocators
  * are up. These are used by all CPUs during bringup before switching
@@ -44,7 +48,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_second);
 DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
 
 /* Non-boot CPUs use this to find the correct pagetables. */
-uint64_t init_ttbr;
+uint64_t __section(".data.idmap") init_ttbr;
 
 /* Clear a translation table and clean & invalidate the cache */
 static void clear_table(void *table)
@@ -68,6 +72,27 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
+static void set_init_ttbr(lpae_t *root)
+{
+    /*
+     * init_ttbr is part of the identity mapping which is read-only. So
+     * We need to re-map the region so it can be updated
+     */
+    void *ptr = map_domain_page(virt_to_mfn(&init_ttbr));
+
+    ptr += PAGE_OFFSET(&init_ttbr);
+
+    *(uint64_t *)ptr = virt_to_maddr(root);
+
+    /*
+     * init_ttbr will be accessed with the MMU off, so ensure the update
+     * is visible by cleaning the cache.
+     */
+    clean_dcache(ptr);
+
+    unmap_domain_page(ptr);
+}
+
 #ifdef CONFIG_ARM_64
 int prepare_secondary_mm(int cpu)
 {
@@ -77,8 +102,8 @@ int prepare_secondary_mm(int cpu)
      * Set init_ttbr for this CPU coming up. All CPUs share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit.
      */
-    init_ttbr = virt_to_maddr(xen_pgtable);
-    clean_dcache(init_ttbr);
+    set_init_ttbr(xen_pgtable);
+
     return 0;
 }
 #else
@@ -109,8 +134,7 @@ int prepare_secondary_mm(int cpu)
     clear_boot_pagetables();
 
     /* Set init_ttbr for this CPU coming up */
-    init_ttbr = __pa(first);
-    clean_dcache(init_ttbr);
+    set_init_ttbr(first);
 
     return 0;
 }
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 20598c6963ce..470c8f22084f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -36,6 +36,7 @@ SECTIONS
        *(.text.header)
        *(.text.idmap)
        *(.rodata.idmap)
+       *(.data.idmap)
        _idmap_end = .;
 
        *(.text.cold)
-- 
2.40.1


