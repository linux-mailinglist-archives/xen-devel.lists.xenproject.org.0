Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB454AB87C4
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985349.1371316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVv-0006OL-Ut; Thu, 15 May 2025 13:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985349.1371316; Thu, 15 May 2025 13:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVv-0006J2-My; Thu, 15 May 2025 13:20:43 +0000
Received: by outflank-mailman (input) for mailman id 985349;
 Thu, 15 May 2025 13:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYVN-00017p-NM
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:20:09 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517e167a-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:20:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315099026106.2457133486572;
 Thu, 15 May 2025 06:18:19 -0700 (PDT)
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
X-Inumbo-ID: 517e167a-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315102; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S2Vv39itenXABDymFTOf14AheY3HTytBFZplCNisvLIHShGMmBofXiqLax7nQptNXe4cFQmL2Ejk42iJvnlxKuSqwh6kpbGlh+1qQrg6Nz8GoBwwQUUx7urzeCqI+XnTDNgKpT/76PISkpDN433+rQR9rY7lYBdXXH3RSQyIjCQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315102; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QHkJY28JGQK8XLqjv1ZElUqF+VLP60wun/RyWvaCxRs=; 
	b=T3tkbTTVhAwJ3Hvq50XB+RCf7+g7bD9h9whNyG3sZXNyc1t3F93mpVzQcL2bkjZnJA/E5JGTP6Ykor53dTw6ZMgudsoP+BCZVtLfQup4vFMesy73Ru/PKTkWtKY/Cc5U/mmiE9YxkrYiPyzMlPQFB4ynNWjMl/CCJL8COJMeNfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315102;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=QHkJY28JGQK8XLqjv1ZElUqF+VLP60wun/RyWvaCxRs=;
	b=JHgdMa78NkgkzzJH93iJWs5aBES1FyPQVGmkfwdO+Yg7uWTqUhCl2T5hpsVONnkz
	WFyValXx4uMVRFhlFEciR0pBV4cgM0+/LwIx/zEKistb72qvGNpP1q62LBM9f9DE97p
	bU+ARzQk5IxAHZYp6Bvec4j//dLykHC0zMEB439M=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 13/38] x86/hyperlaunch: move pvh p2m init to domain builder
Date: Thu, 15 May 2025 09:17:19 -0400
Message-Id: <20250515131744.3843-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Generalize pvh_init_p2m() for use on domU and relocate under the domain
builder. To support moving the function, dom0_pvh_setup_e820() was exported.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c         | 23 +----------------------
 xen/arch/x86/hvm/dom_build.c          | 25 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/dom0_build.h |  2 ++
 3 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 1e63e19589a1..378a1f29fb1b 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -323,7 +323,7 @@ static int __init pvh_setup_vmx_realmode_helpers(struct domain *d)
     return 0;
 }
 
-static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
+void __init dom0_pvh_setup_e820(struct domain *d, unsigned long nr_pages)
 {
     struct e820entry *entry, *entry_guest;
     unsigned int i;
@@ -399,20 +399,6 @@ static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
     ASSERT(cur_pages == nr_pages);
 }
 
-static void __init pvh_init_p2m(struct boot_domain *bd)
-{
-    unsigned long nr_pages = dom_compute_nr_pages(bd, NULL);
-    bool preempted;
-
-    pvh_setup_e820(bd->d, nr_pages);
-    do {
-        preempted = false;
-        paging_set_allocation(bd->d, dom_paging_pages(bd, nr_pages),
-                              &preempted);
-        process_pending_softirqs();
-    } while ( preempted );
-}
-
 static int __init pvh_populate_p2m(struct domain *d)
 {
     struct vcpu *v = d->vcpu[0];
@@ -1318,13 +1304,6 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
     struct domain *d = bd->d;
     int rc;
 
-    /*
-     * Craft dom0 physical memory map and set the paging allocation. This must
-     * be done before the iommu initializion, since iommu initialization code
-     * will likely add mappings required by devices to the p2m (ie: RMRRs).
-     */
-    pvh_init_p2m(bd);
-
     iommu_hwdom_init(d);
 
     rc = pvh_populate_p2m(d);
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index a5f259b6352d..eec65e3e805e 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -10,13 +10,16 @@
 
 #include <xen/acpi.h>
 #include <xen/init.h>
+#include <xen/softirq.h>
 #include <xen/types.h>
 
 #include <acpi/actables.h>
 
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
+#include <asm/domain-builder.h>
 #include <asm/hvm/io.h>
+#include <asm/paging.h>
 #include <asm/pci.h>
 
 static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
@@ -37,6 +40,20 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
+static void __init pvh_init_p2m(struct boot_domain *bd)
+{
+    unsigned long nr_pages = dom_compute_nr_pages(bd, NULL);
+    bool preempted;
+
+    dom0_pvh_setup_e820(bd->d, nr_pages);
+    do {
+        preempted = false;
+        paging_set_allocation(bd->d, dom_paging_pages(bd, nr_pages),
+                              &preempted);
+        process_pending_softirqs();
+    } while ( preempted );
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     int rc;
@@ -67,6 +84,14 @@ int __init dom_construct_pvh(struct boot_domain *bd)
         }
     }
 
+    /*
+     * Craft domain physical memory map and set the paging allocation. This
+     * must be done before the iommu initializion, since iommu initialization
+     * code will likely add mappings required by devices to the p2m (ie:
+     * RMRRs).
+     */
+    pvh_init_p2m(bd);
+
     return dom0_construct_pvh(bd);
 }
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 43a402af15b7..e5debd5adf9f 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -18,6 +18,8 @@ void calculate_dom0_pages(struct boot_domain *bd, unsigned long avail);
 void dom0_pv_restrict_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms);
 
+void dom0_pvh_setup_e820(struct domain *d, unsigned long nr_pages);
+
 int dom0_construct_pv(struct boot_domain *bd);
 int dom0_construct_pvh(struct boot_domain *bd);
 
-- 
2.30.2


