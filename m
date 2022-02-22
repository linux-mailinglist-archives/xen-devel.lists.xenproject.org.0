Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848534BF774
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 12:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276733.473006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMTdv-0002v5-NQ; Tue, 22 Feb 2022 11:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276733.473006; Tue, 22 Feb 2022 11:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMTdv-0002s0-K3; Tue, 22 Feb 2022 11:47:43 +0000
Received: by outflank-mailman (input) for mailman id 276733;
 Tue, 22 Feb 2022 11:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMTdu-0002ru-Bh
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 11:47:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c86a0d2-93d5-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 12:47:40 +0100 (CET)
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
X-Inumbo-ID: 3c86a0d2-93d5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645530460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=phlUwsbqZvFVhfGNXBd5y7pzy7ybOvyPQbyz9iOge1U=;
  b=MniVbrbiF/SdxGUhosJjO7MaO2tQKUcrSwGcDwUdw83W6SVeymO1HTGP
   KiXFGZ4d9G5ujFM6GA2YsOQdD2BxKQ4fU5vnUZWtsMoXrEJ9LTMx/IVGX
   7Mi8oobJf7zFMsoUbP+ajSkTqCUCh/dy+5VmSgkLa5XLlZTfGiQkh7r7R
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64714683
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6VkjBa4ujwyjwA84a0SU2AxRtD3HchMFZxGqfqrLsTDasY5as4F+v
 mdLDzuBaP3eZmPweNB/ad+19UwE6pTRz9ZiGQQ5qilgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSIb1YzArXymt5NeCMEIiZiIfRW0ZnIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RFNmMzMkSbC/FJEnsSUZEGwLypuinAXgFUimiV9e0u40GGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS0Cfc0JbM3QSjVkM+Eg9GdMB/pOYQSml/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEt4ji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpZJWG4P
 RKJ5VoJjHO2AJdMRfUsC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dRNdQtTdSBjX/gbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:e7ppQ6/l/7OFj9/9Y1xuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64714683"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and __initconst_cf_clobber
Date: Tue, 22 Feb 2022 11:47:11 +0000
Message-ID: <20220222114711.19209-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Most IOMMU hooks are already altcall for performance reasons.  Convert the
rest of them so we can harden all the hooks in Control Flow Integrity
configurations.  This necessitates the use of iommu_{v,}call() in debug builds
too.  Switch to using an ASSERT() as all forms should resolve to &iommu_ops.

Move the root iommu_ops from __read_mostly to __ro_after_init now that the
latter exists.

Since c/s 3330013e6739 ("VT-d / x86: re-arrange cache syncing"), vtd_ops is
not modified and doesn't need a forward declaration, so we can use
__initconst_cf_clobber for both VT-d and AMD.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2.1:
 * New
v2.2:
 * Add ASSERT().  Fix indirection of the passed pointer in enable_x2apic().
 * Adjust commit message.
---
 xen/arch/x86/include/asm/iommu.h            | 10 ++++------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
 xen/drivers/passthrough/iommu.c             |  7 ++++---
 xen/drivers/passthrough/vtd/iommu.c         |  3 +--
 xen/drivers/passthrough/x86/iommu.c         |  4 ++--
 5 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 8a96ba1f097f..d38c33408766 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -72,18 +72,16 @@ struct arch_iommu
 
 extern struct iommu_ops iommu_ops;
 
-#ifdef NDEBUG
 # include <asm/alternative.h>
 # define iommu_call(ops, fn, args...) ({      \
-    (void)(ops);                              \
+    ASSERT((ops) == &iommu_ops);              \
     alternative_call(iommu_ops.fn, ## args);  \
 })
 
 # define iommu_vcall(ops, fn, args...) ({     \
-    (void)(ops);                              \
+    ASSERT((ops) == &iommu_ops);              \
     alternative_vcall(iommu_ops.fn, ## args); \
 })
-#endif
 
 static inline const struct iommu_ops *iommu_get_ops(void)
 {
@@ -106,7 +104,7 @@ int iommu_setup_hpet_msi(struct msi_desc *);
 static inline int iommu_adjust_irq_affinities(void)
 {
     return iommu_ops.adjust_irq_affinities
-           ? iommu_ops.adjust_irq_affinities()
+           ? iommu_call(&iommu_ops, adjust_irq_affinities)
            : 0;
 }
 
@@ -122,7 +120,7 @@ int iommu_enable_x2apic(void);
 static inline void iommu_disable_x2apic(void)
 {
     if ( x2apic_enabled && iommu_ops.disable_x2apic )
-        iommu_ops.disable_x2apic();
+        iommu_vcall(&iommu_ops, disable_x2apic);
 }
 
 int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index e57f555d00d1..4b59a4efe9b6 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -628,7 +628,7 @@ static void cf_check amd_dump_page_tables(struct domain *d)
                               hd->arch.amd.paging_mode, 0, 0);
 }
 
-static const struct iommu_ops __initconstrel _iommu_ops = {
+static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index e220fea72c2f..c6b2c384d1dd 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -540,7 +540,7 @@ int __init iommu_setup(void)
 int iommu_suspend()
 {
     if ( iommu_enabled )
-        return iommu_get_ops()->suspend();
+        return iommu_call(iommu_get_ops(), suspend);
 
     return 0;
 }
@@ -548,7 +548,7 @@ int iommu_suspend()
 void iommu_resume()
 {
     if ( iommu_enabled )
-        iommu_get_ops()->resume();
+        iommu_vcall(iommu_get_ops(), resume);
 }
 
 int iommu_do_domctl(
@@ -578,7 +578,8 @@ void iommu_crash_shutdown(void)
         return;
 
     if ( iommu_enabled )
-        iommu_get_ops()->crash_shutdown();
+        iommu_vcall(iommu_get_ops(), crash_shutdown);
+
     iommu_enabled = false;
 #ifndef iommu_intremap
     iommu_intremap = iommu_intremap_off;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 56968a06a100..6a65ba1d8271 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -56,7 +56,6 @@ bool __read_mostly iommu_snoop = true;
 
 static unsigned int __read_mostly nr_iommus;
 
-static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
 
 static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
@@ -2794,7 +2793,7 @@ static int __init cf_check intel_iommu_quarantine_init(struct domain *d)
     return rc;
 }
 
-static struct iommu_ops __initdata vtd_ops = {
+static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
     .quarantine_init = intel_iommu_quarantine_init,
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index ad5f44e13d98..58a422fb5f88 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -27,7 +27,7 @@
 #include <asm/setup.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
-struct iommu_ops __read_mostly iommu_ops;
+struct iommu_ops __ro_after_init iommu_ops;
 bool __read_mostly iommu_non_coherent;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
@@ -129,7 +129,7 @@ int iommu_enable_x2apic(void)
     if ( !iommu_ops.enable_x2apic )
         return -EOPNOTSUPP;
 
-    return iommu_ops.enable_x2apic();
+    return iommu_call(&iommu_ops, enable_x2apic);
 }
 
 void iommu_update_ire_from_apic(
-- 
2.11.0


