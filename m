Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F84B6FB5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273328.468477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzjq-0002S0-4j; Tue, 15 Feb 2022 15:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273328.468477; Tue, 15 Feb 2022 15:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzjq-0002PQ-1C; Tue, 15 Feb 2022 15:27:34 +0000
Received: by outflank-mailman (input) for mailman id 273328;
 Tue, 15 Feb 2022 15:27:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ8a=S6=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nJzjo-0002Eg-UI
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:27:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cabc574d-8e73-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 16:27:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2450A1396;
 Tue, 15 Feb 2022 07:27:31 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FD3A3F66F;
 Tue, 15 Feb 2022 07:27:30 -0800 (PST)
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
X-Inumbo-ID: cabc574d-8e73-11ec-8eb8-a37418f5ba1a
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] xen/vpci: msix: move read/write call to MSI-X PBA entry to arch file
Date: Tue, 15 Feb 2022 15:25:18 +0000
Message-Id: <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644937405.git.rahul.singh@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

{read,write}{l,q} function argument is different for ARM and x86.
ARM {read,wrie}(l,q} function argument is pointer whereas X86
{read,wrie}(l,q} function argument is address itself.

{read,write}{l,q} is only used in common file to access the MSI-X PBA
structure. To avoid impacting other x86 code and to make the code common
move the read/write call to MSI-X PBA to arch specific file.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v1:
 - Added in this version
---
 xen/arch/x86/hvm/vmsi.c | 47 +++++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/msix.c | 43 ++-----------------------------------
 xen/include/xen/vpci.h  |  6 ++++++
 3 files changed, 55 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 761ce674d7..f124a1d07d 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -1033,4 +1033,51 @@ void vpci_msix_arch_register(struct vpci_msix *msix, struct domain *d)
 
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 }
+
+bool vpci_msix_arch_pba_read(unsigned long addr, unsigned int len,
+                             unsigned long *data)
+{
+    /*
+     * Access to PBA.
+     *
+     * TODO: note that this relies on having the PBA identity mapped to the
+     * guest address space. If this changes the address will need to be
+     * translated.
+     */
+    switch ( len )
+    {
+    case 4:
+        *data = readl(addr);
+        break;
+
+    case 8:
+        *data = readq(addr);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    return true;
+}
+
+void vpci_msix_arch_pba_write(unsigned long addr, unsigned int len,
+                              unsigned long data)
+{
+    switch ( len )
+    {
+    case 4:
+        writel(data, addr);
+        break;
+
+    case 8:
+        writeq(data, addr);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
 #endif /* CONFIG_HAS_VPCI */
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 5b315757ef..b6720f1a1a 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -170,31 +170,7 @@ bool vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
         return true;
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
-    {
-        /*
-         * Access to PBA.
-         *
-         * TODO: note that this relies on having the PBA identity mapped to the
-         * guest address space. If this changes the address will need to be
-         * translated.
-         */
-        switch ( len )
-        {
-        case 4:
-            *data = readl(addr);
-            break;
-
-        case 8:
-            *data = readq(addr);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            break;
-        }
-
-        return true;
-    }
+        return vpci_msix_arch_pba_read(addr, len, data);
 
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
@@ -247,22 +223,7 @@ bool vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
     {
         /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
         if ( is_hardware_domain(d) )
-        {
-            switch ( len )
-            {
-            case 4:
-                writel(data, addr);
-                break;
-
-            case 8:
-                writeq(data, addr);
-                break;
-
-            default:
-                ASSERT_UNREACHABLE();
-                break;
-            }
-        }
+            vpci_msix_arch_pba_write(addr, len, data);
 
         return true;
     }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 1c36845abf..a61daf9d53 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -231,6 +231,12 @@ bool vpci_msix_write(struct vpci_msix *msix, unsigned long addr,
 bool vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
                     unsigned int len, unsigned long *data);
 
+bool vpci_msix_arch_pba_read(unsigned long addr, unsigned int len,
+                             unsigned long *data);
+
+void vpci_msix_arch_pba_write(unsigned long addr, unsigned int len,
+                              unsigned long data);
+
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
-- 
2.25.1


