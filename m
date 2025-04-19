Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4BA945C5
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960264.1352375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ0-0005un-RW; Sat, 19 Apr 2025 22:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960264.1352375; Sat, 19 Apr 2025 22:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ0-0005tB-LF; Sat, 19 Apr 2025 22:21:30 +0000
Received: by outflank-mailman (input) for mailman id 960264;
 Sat, 19 Apr 2025 22:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GOp-0004yY-VT
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:10:59 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2acc19f6-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:10:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100530991699.508073613059;
 Sat, 19 Apr 2025 15:08:50 -0700 (PDT)
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
X-Inumbo-ID: 2acc19f6-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100533; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TI47jSbImDojj0GoQCgsne6LcAcZPiY8E6rV68o5qK2N1XTsj8kbYgfM6Ox/0ew1TZEns4tb77pjlEZzYXJU2AsclfkUMh5YSR3DzPcLiPMlQipLLFePTvlAk9hH4QjxnedyQMP6vOzOC5MGYAStjz486RBGz/AjzRzniHCujlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100533; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oYA+q2bu6uUk9qzE25f2Pzdoh1C0vsI/Nr7Od6zvzCs=; 
	b=QjwyOaC4kX8OZDeQWWm7/p/Rkq21KDVq1D4NqliOJI7lQmEj/PrIIWmEkvQWtAj35nZMfuKjc7QLrNJEGjVFOKjPBWJGiMPcSRQCrCZSTVSAwgHoYwJo8ZltpXv32ab+Coo/zNm3PVXsz8NWwPm+7fT77CWz2ObYZCpfxIwBQQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100533;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=oYA+q2bu6uUk9qzE25f2Pzdoh1C0vsI/Nr7Od6zvzCs=;
	b=Y3y8tM7Hzyn6awXzgbx8ZPcZshgVrY8EL+1GoPXJS2W9iEy/J9M5beqXh2mH4QVR
	3+Oous/KS8lqEOelc35XwbVERRSWwJscnli7KwYPwTmWM0eHup1doyWyNAQmWEdUEc/
	HXI0ynDLq1yWnpzfyp/PrM//EaXlFmsdH2W37uA8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 14/38] x86/hyperlaunch: move pvh p2m init to domain builder
Date: Sat, 19 Apr 2025 18:07:56 -0400
Message-Id: <20250419220820.4234-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
index f59af0e72810..4a371dfd66d7 100644
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
@@ -1319,13 +1305,6 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
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
index b6e534226434..05064ae9ba96 100644
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


