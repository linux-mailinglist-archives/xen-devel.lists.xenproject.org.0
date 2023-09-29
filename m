Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190E7B32EA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 14:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610532.949969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmD2A-0006Lt-TJ; Fri, 29 Sep 2023 12:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610532.949969; Fri, 29 Sep 2023 12:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmD2A-0006JN-Pv; Fri, 29 Sep 2023 12:55:54 +0000
Received: by outflank-mailman (input) for mailman id 610532;
 Fri, 29 Sep 2023 12:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qmD29-0006JH-8o
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 12:55:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84596abf-5ec7-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 14:55:50 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id EE0C14EE0739;
 Fri, 29 Sep 2023 14:55:49 +0200 (CEST)
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
X-Inumbo-ID: 84596abf-5ec7-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH] x86/msi: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Fri, 29 Sep 2023 14:55:42 +0200
Message-Id: <d8023a832f77dc872a92e71c4df2da39ddbe06b0.1695978595.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and make function declarations and
definitions consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/msi.h | 22 +++++++++++-----------
 xen/arch/x86/msi.c             |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index a53ade95c9..63582fdea4 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -82,12 +82,12 @@ struct hw_interrupt_type;
 struct msi_desc;
 /* Helper functions */
 extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
-extern void pci_disable_msi(struct msi_desc *desc);
+extern void pci_disable_msi(struct msi_desc *msi_desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
-extern int setup_msi_irq(struct irq_desc *, struct msi_desc *);
-extern int __setup_msi_irq(struct irq_desc *, struct msi_desc *,
-                           const struct hw_interrupt_type *);
+extern int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc);
+extern int __setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc,
+                           hw_irq_controller *handler);
 extern void teardown_msi_irq(int irq);
 extern int msi_free_vector(struct msi_desc *entry);
 extern int pci_restore_msi_state(struct pci_dev *pdev);
@@ -133,7 +133,7 @@ struct msi_desc {
 #define MSI_TYPE_HPET    1
 #define MSI_TYPE_IOMMU   2
 
-int msi_maskable_irq(const struct msi_desc *);
+int msi_maskable_irq(const struct msi_desc *entry);
 int msi_free_irq(struct msi_desc *entry);
 
 /*
@@ -220,13 +220,13 @@ struct arch_msix {
 };
 
 void early_msi_init(void);
-void msi_compose_msg(unsigned vector, const cpumask_t *mask,
+void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask,
                      struct msi_msg *msg);
 void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable);
-void cf_check mask_msi_irq(struct irq_desc *);
-void cf_check unmask_msi_irq(struct irq_desc *);
-void guest_mask_msi_irq(struct irq_desc *, bool mask);
-void cf_check ack_nonmaskable_msi_irq(struct irq_desc *);
-void cf_check set_msi_affinity(struct irq_desc *, const cpumask_t *);
+void cf_check mask_msi_irq(struct irq_desc *desc);
+void cf_check unmask_msi_irq(struct irq_desc *desc);
+void guest_mask_msi_irq(struct irq_desc *desc, bool mask);
+void cf_check ack_nonmaskable_msi_irq(struct irq_desc *desc);
+void cf_check set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask);
 
 #endif /* __ASM_MSI_H */
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index a78367d7cf..7f8e794254 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -37,7 +37,7 @@
 static s8 __read_mostly use_msi = -1;
 boolean_param("msi", use_msi);
 
-static void __pci_disable_msix(struct msi_desc *);
+static void __pci_disable_msix(struct msi_desc *entry);
 
 /* bitmap indicate which fixed map is free */
 static DEFINE_SPINLOCK(msix_fixmap_lock);
-- 
2.34.1


