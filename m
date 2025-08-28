Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBBB3AEAE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100190.1453857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRs-0007WT-Oq; Thu, 28 Aug 2025 23:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100190.1453857; Thu, 28 Aug 2025 23:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRr-0007KJ-PX; Thu, 28 Aug 2025 23:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1100190;
 Thu, 28 Aug 2025 23:54:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRo-0006u2-F8
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRn-00B9v9-38;
 Thu, 28 Aug 2025 23:54:28 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRn-006h9D-38;
 Thu, 28 Aug 2025 23:54:28 +0000
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
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=Rhcq2vtZe5iZ0ZPpBFlvq+R2ujzAm7D2AbQfWm62IXc=; b=51YcAA8yiYU+z1bbNZhHTpCdMf
	zhlnclwQAdaMPYIsofXAGa7s/illQ4mpfmhHLE7/tQpZm4f9NpJFdlouwmJfl8F8G1NukL2kw+NPc
	CLxmyakVjxm5O4Z9en/rgnffkypUol0dtASQOyiOvuTGs3UPFcRzi/+5yQwe4WjejFI8=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 14/15] xen/domain: allocate d->irq_caps before arch-specific initialization
Date: Thu, 28 Aug 2025 16:54:08 -0700
Message-ID: <20250828235409.2835815-15-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Make sure that NS16550 emulator does not share virtual device IRQ with the
physical one. This is needed for enabling NS16550 emulator for PVH hwdom
(dom0).

To do that, move per-domain interrupt rangeset allocation before arch-specific
code. Add irqs_setup_access() to setup the initial rangeset.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
- Link to original patch in v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-4-dmukhin@ford.com/
---
 xen/arch/x86/dom0_build.c       | 1 -
 xen/arch/x86/hvm/dom0_build.c   | 7 +++++++
 xen/arch/x86/include/asm/irq.h  | 2 ++
 xen/arch/x86/irq.c              | 8 ++++++++
 xen/arch/x86/pv/dom0_build.c    | 3 +++
 xen/common/domain.c             | 8 ++++++--
 xen/common/emul/vuart/ns16x50.c | 9 +++++++++
 7 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 26202b33345c..9dc87efbf3e8 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -442,7 +442,6 @@ int __init dom0_setup_permissions(struct domain *d)
 
     rc |= iomem_permit_access(d, 0UL,
                               PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
-    rc |= irqs_permit_access(d, 1, nr_irqs_gsi - 1);
 
     /* Local APIC. */
     if ( mp_lapic_addr != 0 )
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 5551f9044836..245a42dec9aa 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1348,6 +1348,13 @@ int __init dom0_construct_pvh(const struct boot_domain *bd)
          */
         pvh_setup_mmcfg(d);
 
+        rc = irqs_setup_access(d);
+        if ( rc )
+        {
+            printk("%pd unable to setup IRQ rangeset: %d\n", d, rc);
+            return rc;
+        }
+
         /*
          * Setup permissions early so that calls to add MMIO regions to the
          * p2m as part of vPCI setup don't fail due to permission checks.
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 8c81f66434a8..8bffec3bbfee 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -231,4 +231,6 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi);
 
+int irqs_setup_access(struct domain *d);
+
 #endif /* _ASM_HW_IRQ_H */
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85aa0..079277be719d 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -3046,3 +3046,11 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 
     return ret;
 }
+
+int irqs_setup_access(struct domain *d)
+{
+    if ( is_hardware_domain(d) )
+        return irqs_permit_access(d, 1, nr_irqs_gsi - 1);
+
+    return 0;
+}
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 2b8b4d869ee7..1a092b802833 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1037,6 +1037,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
     rc = ioports_setup_access(d);
     BUG_ON(rc != 0);
 
+    rc = irqs_setup_access(d);
+    BUG_ON(rc != 0);
+
     rc = dom0_setup_permissions(d);
     BUG_ON(rc != 0);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 104e917f07e3..eb83e3198f37 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -950,6 +950,11 @@ struct domain *domain_create(domid_t domid,
     radix_tree_init(&d->pirq_tree);
 #endif
 
+    err = -ENOMEM;
+    d->irq_caps = rangeset_new(d, "Interrupts", 0);
+    if ( !d->irq_caps )
+        goto fail;
+
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
@@ -959,8 +964,7 @@ struct domain *domain_create(domid_t domid,
 
     err = -ENOMEM;
     d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
-    d->irq_caps   = rangeset_new(d, "Interrupts", 0);
-    if ( !d->iomem_caps || !d->irq_caps )
+    if ( !d->iomem_caps )
         goto fail;
 
     if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 8860f25ffdeb..aea38304b60c 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -794,6 +794,15 @@ static int ns16x50_init(void *arg)
         return rc;
     }
 
+    /* Disallow sharing physical IRQ */
+    rc = irq_deny_access(d, info->irq);
+    if ( rc )
+    {
+        ns16x50_err(info, "virtual IRQ#%d: conflict w/ physical IRQ: %d\n",
+                    info->irq, rc);
+        return rc;
+    }
+
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
     vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
-- 
2.51.0


