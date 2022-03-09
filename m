Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3E4D2DDD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287732.487906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNq-00080Y-Lc; Wed, 09 Mar 2022 11:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287732.487906; Wed, 09 Mar 2022 11:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNq-0007xo-Ga; Wed, 09 Mar 2022 11:21:34 +0000
Received: by outflank-mailman (input) for mailman id 287732;
 Wed, 09 Mar 2022 11:21:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuNp-0007im-5J
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:21:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNo-0002kn-PP; Wed, 09 Mar 2022 11:21:32 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNo-0004wn-Hu; Wed, 09 Mar 2022 11:21:32 +0000
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
	bh=NfNSrIckdE3c1nYMf9yFQfxMFGcsuGH78c6BN9VFgpI=; b=QqRZkqbbN4TKLagpHWGkx8ciZi
	fpZhsQ23TTWc33JIMoCrCdAyH9uK+TsoLvXfZK4sYPJJ2nhg+eQceoIh5Nc01MbA3TopF8WpEE0se
	Sk9dkXqp5h3foYY0GLlT0A0a+rX265+Co5wYI26N6znioRNEyPn/3DBs5HHbuTbWpEw0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	Julien GralL <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH early-RFC 3/5] xen/arm: mm: Introduce helpers to prepare/enable/disable the identity mapping
Date: Wed,  9 Mar 2022 11:20:46 +0000
Message-Id: <20220309112048.17377-4-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309112048.17377-1-julien@xen.org>
References: <20220309112048.17377-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien GralL <jgrall@amazon.com>

In follow-up patches we will need to have part of Xen identity mapped in
order to safely switch the TTBR.

On some platform, the identity mapping may have to start at 0. If we always
keep the identity region mapped, NULL pointer ference would lead to access
to valid mapping.

It would be possible to relocate Xen to avoid clashing with address 0.
However the identity mapping is only meant to be used in very limited
places. Therefore it would be better to keep the identity region invalid
for most of the time.

Two new helpers are introduced:
    - prepare_identity_mapping() will setup the page-tables so it is
      easy to create the mapping afterwards.
    - update_identity_mapping() will create/remove the identity mapping

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/mm.h |  2 +
 xen/arch/arm/mm.c             | 73 +++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 045a8ba4bb63..76973ea9a0ff 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -177,6 +177,8 @@ extern unsigned long total_pages;
 
 /* Boot-time pagetable setup */
 extern void setup_pagetables(unsigned long boot_phys_offset);
+/* Enable/disable the identity mapping */
+extern void update_identity_mapping(bool enable);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 75ed9a3ce249..5c4dece16f7f 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -138,6 +138,12 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
 static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
 #endif
 
+#ifdef CONFIG_ARM_64
+static DEFINE_PAGE_TABLE(xen_first_id);
+static DEFINE_PAGE_TABLE(xen_second_id);
+static DEFINE_PAGE_TABLE(xen_third_id);
+#endif
+
 /* Common pagetable leaves */
 /* Second level page tables.
  *
@@ -573,6 +579,70 @@ void __init remove_early_mappings(void)
     BUG_ON(rc);
 }
 
+/*
+ * The identity mapping may start at physical address 0. So don't want
+ * to keep it mapped longer than necessary.
+ *
+ * When this is called, we are still using the boot_pgtable.
+ *
+ * XXX: Handle Arm32 properly.
+ */
+static void prepare_identity_mapping(void)
+{
+    paddr_t id_addr = virt_to_maddr(_start);
+    lpae_t pte;
+    DECLARE_OFFSETS(id_offsets, id_addr);
+
+    printk("id_addr 0x%lx\n", id_addr);
+#ifdef CONFIG_ARM_64
+    if ( id_offsets[0] != 0 )
+        panic("Cannot handled ID mapping above 512GB\n");
+#endif
+
+    /* Link first ID table */
+    pte = pte_of_xenaddr((vaddr_t)xen_first_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&boot_pgtable[id_offsets[0]], pte);
+
+    /* Link second ID table */
+    pte = pte_of_xenaddr((vaddr_t)xen_second_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&xen_first_id[id_offsets[1]], pte);
+
+    /* Link third ID table */
+    pte = pte_of_xenaddr((vaddr_t)xen_third_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&xen_second_id[id_offsets[2]], pte);
+
+    /* The mapping in the third table will be created at a later stage */
+
+    /*
+     * Link the identity mapping in the runtime Xen page tables. No need to
+     * use write_pte here as they are not live yet.
+     */
+    xen_pgtable[id_offsets[0]] = boot_pgtable[id_offsets[0]];
+}
+
+void update_identity_mapping(bool enable)
+{
+    paddr_t id_addr = virt_to_maddr(_start);
+    int rc;
+
+    if ( enable )
+        rc = map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
+                              PAGE_HYPERVISOR_RX);
+    else
+        rc = destroy_xen_mappings(id_addr, id_addr + PAGE_SIZE);
+
+    BUG_ON(rc);
+}
+
 /*
  * After boot, Xen page-tables should not contain mapping that are both
  * Writable and eXecutables.
@@ -609,6 +679,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+    /* XXX: Find a better place to call it */
+    prepare_identity_mapping();
+
 #ifdef CONFIG_ARM_64
     pte = pte_of_xenaddr((uintptr_t)xen_first);
     pte.pt.table = 1;
-- 
2.32.0


