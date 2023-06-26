Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD373D67E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555060.866745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5N-0005kN-0w; Mon, 26 Jun 2023 03:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555060.866745; Mon, 26 Jun 2023 03:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5M-0005UX-CS; Mon, 26 Jun 2023 03:40:16 +0000
Received: by outflank-mailman (input) for mailman id 555060;
 Mon, 26 Jun 2023 03:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2w-0007ej-6M
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d0226451-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6C61FB;
 Sun, 25 Jun 2023 20:38:28 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2788C3F64C;
 Sun, 25 Jun 2023 20:37:41 -0700 (PDT)
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
X-Inumbo-ID: d0226451-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 50/52] xen/mpu: dump debug message in MPU system
Date: Mon, 26 Jun 2023 11:34:41 +0800
Message-Id: <20230626033443.2943270-51-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A set of helpers dump_xxx and show_registers are responsible for
dumping memory mapping info and register info when debugging.
In this commit, we implement them all in MPU system too.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/mpu/mm.h |  3 +++
 xen/arch/arm/mpu/mm.c             | 35 +++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/p2m.c            | 11 ++++++++++
 xen/arch/arm/p2m.c                |  4 ++++
 xen/arch/arm/traps.c              | 16 ++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 0abb0a6c92..d3dcf0024a 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -21,6 +21,9 @@ extern pr_t *alloc_mpumap(void);
 extern int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
                                  paddr_t base, paddr_t limit, uint8_t *index);
 
+/* Print a walk of a MPU memory mapping table */
+void dump_mpu_walk(pr_t *table, uint8_t nr_regions);
+
 #endif /* __ARCH_ARM_MM_MPU__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index c6b287b3aa..ef8a327037 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -898,6 +898,41 @@ pr_t *alloc_mpumap(void)
     return map;
 }
 
+void dump_mpu_walk(pr_t *table, uint8_t nr_regions)
+{
+    uint8_t i = 0;
+
+    for ( ; i < nr_regions; i++ )
+    {
+        paddr_t base, limit;
+
+        if ( region_is_valid(&table[i]) )
+        {
+            base = pr_get_base(&table[i]);
+            limit = pr_get_limit(&table[i]);
+
+            printk(XENLOG_INFO
+                   "Walking MPU memory mapping table: Region[%u]: 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+                   i, base, limit);
+        }
+    }
+}
+
+void dump_hyp_walk(vaddr_t addr)
+{
+    uint8_t i = 0;
+    pr_t region;
+
+    for ( i = 0; i < max_xen_mpumap; i++ )
+    {
+        read_protection_region(&region, i);
+        if ( region_is_valid(&region) )
+            printk(XENLOG_INFO
+                   "Walking hypervisor MPU memory region [%u]: 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+                   i, pr_get_base(&region), pr_get_limit(&region));
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index a68a06105f..87e350270d 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -481,6 +481,17 @@ void p2m_restore_state(struct vcpu *n)
     *last_vcpu_ran = n->vcpu_id;
 }
 
+void p2m_dump_info(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m_read_lock(p2m);
+    printk("p2m mappings for domain %d (vmid %d):\n",
+           d->domain_id, p2m->vmid);
+    printk("  Number of P2M Memory Region: %u \n", p2m->nr_regions);
+    p2m_read_unlock(p2m);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index e29b11334e..d3961997d0 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -51,8 +51,12 @@ void dump_p2m_lookup(struct domain *d, paddr_t addr)
     printk("P2M @ %p mfn:%#"PRI_mfn"\n",
            p2m->root, mfn_x(page_to_mfn(p2m->root)));
 
+#ifndef CONFIG_HAS_MPU
     dump_pt_walk(page_to_maddr(p2m->root), addr,
                  P2M_ROOT_LEVEL, P2M_ROOT_PAGES);
+#else
+    dump_mpu_walk((pr_t *)page_to_virt(p2m->root), p2m->nr_regions);
+#endif
 }
 
 mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index bffa147c36..0592eee91c 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -710,7 +710,11 @@ struct reg_ctxt {
 #endif
 
     /* Hypervisor-side state */
+#ifdef CONFIG_HAS_MPU
+    uint64_t vsctlr_el2;
+#else
     uint64_t vttbr_el2;
+#endif
 };
 
 static const char *mode_string(register_t cpsr)
@@ -908,7 +912,11 @@ static void _show_registers(const struct cpu_user_regs *regs,
 #endif
     }
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
+#ifndef CONFIG_HAS_MPU
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
+#else
+    printk(" VSCTLR_EL2: %016"PRIx64"\n", ctxt->vsctlr_el2);
+#endif
     printk("\n");
 
     printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
@@ -945,7 +953,11 @@ void show_registers(const struct cpu_user_regs *regs)
     if ( guest_mode(regs) && is_32bit_domain(current->domain) )
         ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
 #endif
+#ifndef CONFIG_HAS_MPU
     ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
+#else
+    ctxt.vsctlr_el2 = READ_SYSREG64(VSCTLR_EL2);
+#endif
 
     _show_registers(regs, &ctxt, guest_mode(regs), current);
 }
@@ -968,7 +980,11 @@ void vcpu_show_registers(const struct vcpu *v)
     ctxt.ifsr32_el2 = v->arch.ifsr;
 #endif
 
+#ifdef CONFIG_HAS_MPU
+    ctxt.vsctlr_el2 = v->domain->arch.p2m.vsctlr;
+#else
     ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+#endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
 }
-- 
2.25.1


