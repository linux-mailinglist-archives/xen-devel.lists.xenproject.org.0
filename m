Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DC773A1E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579747.907848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLk0-0004uV-RA; Tue, 08 Aug 2023 12:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579747.907848; Tue, 08 Aug 2023 12:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLk0-0004sq-NA; Tue, 08 Aug 2023 12:23:12 +0000
Received: by outflank-mailman (input) for mailman id 579747;
 Tue, 08 Aug 2023 12:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTLjz-0004sj-ML
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:23:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566fc8bb-35e6-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 14:23:10 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A4AE04EE0740;
 Tue,  8 Aug 2023 14:23:09 +0200 (CEST)
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
X-Inumbo-ID: 566fc8bb-35e6-11ee-b280-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 1/2] x86/vmsi: rename variables to address MISRA C:2012 Rule 5.3
Date: Tue,  8 Aug 2023 14:22:50 +0200
Message-Id: <605687eff99db7181ef6c05bce671e20f194b46b.1691488505.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691488505.git.nicola.vetrini@bugseng.com>
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variables 'irq_desc' shadow the homonymous global variable,
declared in 'xen/arch/x86/include/asm/irq.h', therefore they are renamed
'irqd' for consistency with ARM code. Other variables of the same type
in the file are also renamed 'irqd' for consistency.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Renamed the local variables instead of the global.
- Edited subject from x86/irq to x86/vmsi

Renaming everything to 'desc' would have been the most obvious choice,
but given that there's also 'msi_desc' used in the same functions, 'irqd'
is less error-prone in my opinion.
---
 xen/arch/x86/hvm/vmsi.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 3cd4923060..55d5e26a04 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -281,7 +281,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     unsigned int nr_entry, index;
     int r = X86EMUL_UNHANDLEABLE;
     unsigned long flags;
-    struct irq_desc *desc;
+    struct irq_desc *irqd;
 
     if ( (len != 4 && len != 8) || (address & (len - 1)) )
         return r;
@@ -330,21 +330,21 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     if ( !msi_desc || msi_desc->irq < 0 )
         goto out;
     
-    desc = irq_to_desc(msi_desc->irq);
-    if ( !desc )
+    irqd = irq_to_desc(msi_desc->irq);
+    if ( !irqd )
         goto out;
 
-    spin_lock_irqsave(&desc->lock, flags);
+    spin_lock_irqsave(&irqd->lock, flags);
 
-    if ( !desc->msi_desc )
+    if ( !irqd->msi_desc )
         goto unlock;
 
-    ASSERT(msi_desc == desc->msi_desc);
+    ASSERT(msi_desc == irqd->msi_desc);
    
-    guest_mask_msi_irq(desc, !!(val & PCI_MSIX_VECTOR_BITMASK));
+    guest_mask_msi_irq(irqd, !!(val & PCI_MSIX_VECTOR_BITMASK));
 
 unlock:
-    spin_unlock_irqrestore(&desc->lock, flags);
+    spin_unlock_irqrestore(&irqd->lock, flags);
     if ( len == 4 )
         r = X86EMUL_OKAY;
 
@@ -462,7 +462,7 @@ static void del_msixtbl_entry(struct msixtbl_entry *entry)
 
 int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
 {
-    struct irq_desc *irq_desc;
+    struct irq_desc *irqd;
     struct msi_desc *msi_desc;
     struct pci_dev *pdev;
     struct msixtbl_entry *entry, *new_entry;
@@ -482,14 +482,14 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
     if ( !new_entry )
         return -ENOMEM;
 
-    irq_desc = pirq_spin_lock_irq_desc(pirq, NULL);
-    if ( !irq_desc )
+    irqd = pirq_spin_lock_irq_desc(pirq, NULL);
+    if ( !irqd )
     {
         xfree(new_entry);
         return r;
     }
 
-    msi_desc = irq_desc->msi_desc;
+    msi_desc = irqd->msi_desc;
     if ( !msi_desc )
         goto out;
 
@@ -508,7 +508,7 @@ found:
     r = 0;
 
 out:
-    spin_unlock_irq(&irq_desc->lock);
+    spin_unlock_irq(&irqd->lock);
     xfree(new_entry);
 
     if ( !r )
@@ -533,7 +533,7 @@ out:
 
 void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
 {
-    struct irq_desc *irq_desc;
+    struct irq_desc *irqd;
     struct msi_desc *msi_desc;
     struct pci_dev *pdev;
     struct msixtbl_entry *entry;
@@ -544,11 +544,11 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
     if ( !msixtbl_initialised(d) )
         return;
 
-    irq_desc = pirq_spin_lock_irq_desc(pirq, NULL);
-    if ( !irq_desc )
+    irqd = pirq_spin_lock_irq_desc(pirq, NULL);
+    if ( !irqd )
         return;
 
-    msi_desc = irq_desc->msi_desc;
+    msi_desc = irqd->msi_desc;
     if ( !msi_desc )
         goto out;
 
@@ -559,14 +559,14 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
             goto found;
 
 out:
-    spin_unlock_irq(&irq_desc->lock);
+    spin_unlock_irq(&irqd->lock);
     return;
 
 found:
     if ( !atomic_dec_and_test(&entry->refcnt) )
         del_msixtbl_entry(entry);
 
-    spin_unlock_irq(&irq_desc->lock);
+    spin_unlock_irq(&irqd->lock);
 }
 
 void msixtbl_init(struct domain *d)
@@ -664,12 +664,12 @@ static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
 static void vpci_mask_pirq(struct domain *d, int pirq, bool mask)
 {
     unsigned long flags;
-    struct irq_desc *desc = domain_spin_lock_irq_desc(d, pirq, &flags);
+    struct irq_desc *irqd = domain_spin_lock_irq_desc(d, pirq, &flags);
 
-    if ( !desc )
+    if ( !irqd )
         return;
-    guest_mask_msi_irq(desc, mask);
-    spin_unlock_irqrestore(&desc->lock, flags);
+    guest_mask_msi_irq(irqd, mask);
+    spin_unlock_irqrestore(&irqd->lock, flags);
 }
 
 void vpci_msi_arch_mask(struct vpci_msi *msi, const struct pci_dev *pdev,
-- 
2.34.1


