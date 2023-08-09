Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C268775485
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 09:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580726.909131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTe2Y-00081z-C1; Wed, 09 Aug 2023 07:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580726.909131; Wed, 09 Aug 2023 07:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTe2Y-00080C-7C; Wed, 09 Aug 2023 07:55:34 +0000
Received: by outflank-mailman (input) for mailman id 580726;
 Wed, 09 Aug 2023 07:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTe2W-0007py-Fv
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 07:55:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c34454b-368a-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 09:55:30 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 77E3C4EE0741;
 Wed,  9 Aug 2023 09:55:29 +0200 (CEST)
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
X-Inumbo-ID: 1c34454b-368a-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 1/2] x86/vmsi: rename variables to address MISRA C:2012 Rule 5.3
Date: Wed,  9 Aug 2023 09:55:08 +0200
Message-Id: <37bb5dc6f323bd2dc250c519523d05b66d17fdee.1691567429.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691567429.git.nicola.vetrini@bugseng.com>
References: <cover.1691567429.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variables 'irq_desc' shadow the homonymous global variable,
declared in 'xen/arch/x86/include/asm/irq.h', therefore they are renamed
'irqd' for consistency.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/vmsi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 3cd4923060..128f236362 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
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
-- 
2.34.1


