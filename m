Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED744B6FB3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273323.468467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzjS-0001sg-RO; Tue, 15 Feb 2022 15:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273323.468467; Tue, 15 Feb 2022 15:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzjS-0001qa-OK; Tue, 15 Feb 2022 15:27:10 +0000
Received: by outflank-mailman (input) for mailman id 273323;
 Tue, 15 Feb 2022 15:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ8a=S6=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nJzjR-0001qG-67
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:27:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bc8d6a1d-8e73-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:27:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 545621396;
 Tue, 15 Feb 2022 07:27:07 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 609393F66F;
 Tue, 15 Feb 2022 07:27:06 -0800 (PST)
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
X-Inumbo-ID: bc8d6a1d-8e73-11ec-b215-9bbe72dcb22c
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] xen/vpci: msix: change return value of vpci_msix_{read,write}
Date: Tue, 15 Feb 2022 15:25:17 +0000
Message-Id: <a17cd73b221aaeaf6ab449f83aa7918d83642e54.1644937405.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644937405.git.rahul.singh@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return value is different for the MMIO handler on ARM and x86
architecture.

To make the code common for both architectures change the return value
of vpci_msix_{read, write} to bool. Architecture-specific return value
will be handled in arch code.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v1:
 - Added in this version
---
 xen/arch/x86/hvm/vmsi.c | 10 ++++++++--
 xen/drivers/vpci/msix.c | 24 ++++++++++++------------
 xen/include/xen/vpci.h  |  8 ++++----
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 17426f238c..761ce674d7 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -1002,7 +1002,10 @@ static int x86_msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
     const struct domain *d = v->domain;
     struct vpci_msix *msix = vpci_msix_find(d, addr);
 
-    return vpci_msix_write(msix, addr, len, data);
+    if( !vpci_msix_write(msix, addr, len, data) )
+        return X86EMUL_RETRY;
+
+    return X86EMUL_OKAY;
 }
 
 static int x86_msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
@@ -1011,7 +1014,10 @@ static int x86_msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
     const struct domain *d = v->domain;
     struct vpci_msix *msix = vpci_msix_find(d, addr);
 
-    return vpci_msix_read(msix, addr, len, data);
+    if ( !vpci_msix_read(msix, addr, len, data) )
+        return X86EMUL_RETRY;
+
+    return X86EMUL_OKAY;
 }
 
 static const struct hvm_mmio_ops vpci_msix_table_ops = {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index d89396a3b4..5b315757ef 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -155,8 +155,8 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
-                   unsigned int len, unsigned long *data)
+bool vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
+                    unsigned int len, unsigned long *data)
 {
     const struct vpci_msix_entry *entry;
     unsigned int offset;
@@ -164,10 +164,10 @@ int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
     *data = ~0ul;
 
     if ( !msix )
-        return X86EMUL_RETRY;
+        return false;
 
     if ( !access_allowed(msix->pdev, addr, len) )
-        return X86EMUL_OKAY;
+        return true;
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -193,7 +193,7 @@ int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
             break;
         }
 
-        return X86EMUL_OKAY;
+        return true;
     }
 
     spin_lock(&msix->pdev->vpci->lock);
@@ -227,21 +227,21 @@ int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
     }
     spin_unlock(&msix->pdev->vpci->lock);
 
-    return X86EMUL_OKAY;
+    return true;
 }
 
-int vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
-                    unsigned int len, unsigned long data)
+bool vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
+                     unsigned int len, unsigned long data)
 {
     const struct domain *d = msix->pdev->domain;
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
     if ( !msix )
-        return X86EMUL_RETRY;
+        return false;
 
     if ( !access_allowed(msix->pdev, addr, len) )
-        return X86EMUL_OKAY;
+        return true;
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -264,7 +264,7 @@ int vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
             }
         }
 
-        return X86EMUL_OKAY;
+        return true;
     }
 
     spin_lock(&msix->pdev->vpci->lock);
@@ -342,7 +342,7 @@ int vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
     }
     spin_unlock(&msix->pdev->vpci->lock);
 
-    return X86EMUL_OKAY;
+    return true;
 }
 
 static int init_msix(struct pci_dev *pdev)
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0381a2c911..1c36845abf 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -225,11 +225,11 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 
 void vpci_msix_arch_register(struct vpci_msix *msix, struct domain *d);
 
-int vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
-                    unsigned int len, unsigned long data);
+bool vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
+                     unsigned int len, unsigned long data);
 
-int vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
-                   unsigned int len, unsigned long *data);
+bool vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
+                    unsigned int len, unsigned long *data);
 
 #endif /* __XEN__ */
 
-- 
2.25.1


