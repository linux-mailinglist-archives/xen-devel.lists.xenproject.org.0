Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7B82F09D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667808.1039471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ6-0008DL-Dg; Tue, 16 Jan 2024 14:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667808.1039471; Tue, 16 Jan 2024 14:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ6-00089w-A3; Tue, 16 Jan 2024 14:37:20 +0000
Received: by outflank-mailman (input) for mailman id 667808;
 Tue, 16 Jan 2024 14:37:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPkZ4-0007rR-0H
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:37:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkZ3-0002x4-Iy; Tue, 16 Jan 2024 14:37:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkZ3-0000Te-BJ; Tue, 16 Jan 2024 14:37:17 +0000
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
	bh=nSJb8H4AUwBfcQwQar1U/80V0XEGtzBfpVJPiZPhupE=; b=H/1jQx0a60F1WvaASINcygpe+i
	3DoLBQ9H1cGwWwHYkFWv9dkUr7+mzfSNUCck1NSj4+QqHRkqzYoaJAlPQk2bMH36rrKL7f9quC+Wk
	aO3jz/844pY4Kly63gIbysACvKzsYleORF1vlwL+QVYQU3SYGvxcJI25sLyoKJUq7OSA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 repost 4/4] [DO NOT COMMIT] xen/arm: Create a trampoline for secondary boot CPUs
Date: Tue, 16 Jan 2024 14:37:09 +0000
Message-Id: <20240116143709.86584-5-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116143709.86584-1-julien@xen.org>
References: <20240116143709.86584-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In order to confirm the early boot code is self-contained, allocate a
separate trampoline region for secondary to boot from it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/mmu/mm.c |  7 +++++++
 xen/arch/arm/mmu/smpboot.c  |  4 +++-
 xen/arch/arm/psci.c         |  5 ++++-
 xen/arch/arm/smpboot.c      | 15 ++++++++++++++-
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index d2651c948698..3c4988dc75d1 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -110,11 +110,18 @@ void __init arch_setup_page_tables(void)
     prepare_runtime_identity_mapping();
 }
 
+extern mfn_t trampoline_start;
+
 void update_identity_mapping(bool enable)
 {
     paddr_t id_addr = virt_to_maddr(_start);
     int rc;
 
+    if ( !mfn_eq(trampoline_start, INVALID_MFN) )
+    {
+        id_addr = mfn_to_maddr(trampoline_start);
+    }
+
     if ( enable )
         rc = map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
                               PAGE_HYPERVISOR_RX);
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index f1cf9252710c..d768dfe065a5 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,13 +72,15 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
+extern mfn_t trampoline_start;
+
 static void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
      * We need to re-map the region so it can be updated
      */
-    void *ptr = map_domain_page(virt_to_mfn(&init_ttbr));
+    void *ptr = map_domain_page(trampoline_start);
 
     ptr += PAGE_OFFSET(&init_ttbr);
 
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 695d2fa1f1b5..a00574d559d6 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -36,11 +36,14 @@ static uint32_t psci_cpu_on_nr;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
+extern mfn_t trampoline_start;
+
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
 
-    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
+    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
+                  mfn_to_maddr(trampoline_start) + PAGE_OFFSET(init_secondary),
                   &res);
 
     return PSCI_RET(res);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8d508a1bb258..ef84b73ebd46 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -293,10 +293,13 @@ unsigned int __init smp_get_max_cpus(void)
     return cpus;
 }
 
+mfn_t trampoline_start = INVALID_MFN_INITIALIZER;
+
 void __init
 smp_prepare_cpus(void)
 {
     int rc;
+    void *trampoline;
 
     cpumask_copy(&cpu_present_map, &cpu_possible_map);
 
@@ -304,6 +307,16 @@ smp_prepare_cpus(void)
     if ( rc )
         panic("Unable to allocate CPU sibling/core maps\n");
 
+    /* Create a trampoline to confirm early boot code is self-contained */
+    trampoline = alloc_xenheap_page();
+    BUG_ON(!trampoline);
+
+    memcpy(trampoline, _start, PAGE_SIZE);
+    clean_dcache_va_range(trampoline, PAGE_SIZE);
+    invalidate_icache();
+
+    printk("Trampoline 0x%lx\n", virt_to_maddr(trampoline));
+    trampoline_start = virt_to_mfn(trampoline);
 }
 
 /* Boot the current CPU */
@@ -439,7 +452,7 @@ static void set_smp_up_cpu(unsigned long mpidr)
      * smp_up_cpu is part of the identity mapping which is read-only. So
      * We need to re-map the region so it can be updated.
      */
-    void *ptr = map_domain_page(virt_to_mfn(&smp_up_cpu));
+    void *ptr = map_domain_page(trampoline_start);
 
     ptr += PAGE_OFFSET(&smp_up_cpu);
 
-- 
2.40.1


