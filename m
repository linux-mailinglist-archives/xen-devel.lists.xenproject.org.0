Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00861A945C2
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960253.1352342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYv-0004aR-Fk; Sat, 19 Apr 2025 22:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960253.1352342; Sat, 19 Apr 2025 22:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYv-0004TG-5g; Sat, 19 Apr 2025 22:21:25 +0000
Received: by outflank-mailman (input) for mailman id 960253;
 Sat, 19 Apr 2025 22:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GPo-0004yY-Qt
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:12:00 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fbae569-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:11:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100546108391.4594608164257;
 Sat, 19 Apr 2025 15:09:06 -0700 (PDT)
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
X-Inumbo-ID: 4fbae569-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kAFDjP5hC/DHyg5mi6B3pHJBMWipG3yLUNWg01uonydE8pTfNXXDcdtzsjd7XgIvtqBWlumi3KZ4KldEuVank4Zf1x3WEcRQ+ZUFYVBV0DPYpUZgP50P+XKJkRRLktcqHe00QGlc8gdd5Zz5sBrMVmC6cYAjnZzAV6lB/zZRNq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2KWTr4dpH7kEQOohwPUOqAsWDUBqr7T/oi51YKgyffE=; 
	b=FoRsKBowGPNcX9U26cYDOaPk1heW/XtkCmr5Nn54gMoJkfPALQ2aIu9qCH9hA5tJle8RYGw/2hTuQQJ6YhUi02FeKj8xrENcDS3dgIozCRwrW2O3GStzz7vmsgk4g5Ie9NgPB546PRG5EVOo9plLpO2y0BePs9rrjupmE+Bx6rg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100552;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2KWTr4dpH7kEQOohwPUOqAsWDUBqr7T/oi51YKgyffE=;
	b=KBYjqrE3I3JYg6L8aOmLkCsdtPMnvPTK4wDq2Ffu9BKz13Su1VI6XrULRGip/CFi
	FVxTm8YhlmRD2OONDaBReMycZUdNkYudxCy9RN47JhqcjWAywO1GaNjdr9qAihp42d6
	77/uzzeaJuTBxAryeHfDZiDHLR9beggrEY+LxikI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 20/38] x86/hyperlaunch: move populating p2m under domain builder
Date: Sat, 19 Apr 2025 18:08:02 -0400
Message-Id: <20250419220820.4234-21-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce hvm_populate_p2m() for populating domU p2m maps. Rename
pvh_populate_p2m() to dom0_pvh_populate_p2m() and export it. With these
adjustments, move the calls to populate the p2m maps under domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c             | 14 ++------
 xen/arch/x86/hvm/dom_build.c              | 39 +++++++++++++++++++++++
 xen/arch/x86/include/asm/dom0_build.h     |  1 +
 xen/arch/x86/include/asm/domain-builder.h |  2 ++
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 8ea4c7bd2792..73ce33fb17f1 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -88,9 +88,8 @@ static int __init modify_identity_mmio(struct domain *d, unsigned long pfn,
 }
 
 /* Populate a HVM memory range using the biggest possible order. */
-static int __init pvh_populate_memory_range(struct domain *d,
-                                            unsigned long start,
-                                            unsigned long nr_pages)
+int __init pvh_populate_memory_range(
+    struct domain *d, unsigned long start, unsigned long nr_pages)
 {
     static const struct {
         unsigned long align;
@@ -399,7 +398,7 @@ void __init dom0_pvh_setup_e820(struct domain *d, unsigned long nr_pages)
     ASSERT(cur_pages == nr_pages);
 }
 
-static int __init pvh_populate_p2m(struct domain *d)
+int __init dom0_pvh_populate_p2m(struct domain *d)
 {
     struct vcpu *v = d->vcpu[0];
     unsigned int i;
@@ -1262,13 +1261,6 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
     struct domain *d = bd->d;
     int rc;
 
-    rc = pvh_populate_p2m(d);
-    if ( rc )
-    {
-        printk("Failed to setup Dom0 physical memory map\n");
-        return rc;
-    }
-
     rc = pvh_load_kernel(bd, &entry, &start_info);
     if ( rc )
     {
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 658d3d170e64..9421dc431ba9 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -23,6 +23,8 @@
 #include <asm/dom0_build.h>
 #include <asm/domain-builder.h>
 #include <asm/hvm/io.h>
+#include <asm/hvm/support.h>
+#include <asm/p2m.h>
 #include <asm/paging.h>
 #include <asm/pci.h>
 
@@ -247,6 +249,33 @@ int __init hvm_setup_cpus(
     return 0;
 }
 
+static int __init hvm_populate_p2m(struct domain *d)
+{
+    unsigned int i;
+
+    /* Populate memory map. */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        int rc;
+        unsigned long addr, size;
+
+        if ( d->arch.e820[i].type != E820_RAM &&
+             d->arch.e820[i].type != E820_ACPI &&
+             PFN_DOWN(d->arch.e820[i].addr) != START_SPECIAL_REGION )
+                continue;
+
+        addr = PFN_DOWN(d->arch.e820[i].addr);
+        size = PFN_DOWN(d->arch.e820[i].size);
+
+        rc = pvh_populate_memory_range(d, addr, size);
+        if ( rc )
+            return rc;
+
+    }
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     int rc;
@@ -288,6 +317,16 @@ int __init dom_construct_pvh(struct boot_domain *bd)
     if ( is_hardware_domain(bd->d) )
         iommu_hwdom_init(bd->d);
 
+    if ( is_control_domain(bd->d) || is_hardware_domain(bd->d) )
+        rc = dom0_pvh_populate_p2m(bd->d);
+    else
+        rc = hvm_populate_p2m(bd->d);
+    if ( rc )
+    {
+        printk("Failed to setup HVM/PVH %pd physical memory map\n", bd->d);
+        return rc;
+    }
+
     return dom0_construct_pvh(bd);
 }
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 36f563bd9d5b..3819b3f4e7a4 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -21,6 +21,7 @@ void dom0_pv_restrict_pages(
 void dom0_pvh_setup_e820(struct domain *d, unsigned long nr_pages);
 
 int dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info);
+int dom0_pvh_populate_p2m(struct domain *d);
 
 int dom0_construct_pv(struct boot_domain *bd);
 int dom0_construct_pvh(struct boot_domain *bd);
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 7bc2fbe66bc2..fa6fa60841ab 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -10,6 +10,8 @@ int __init builder_get_cmdline(
 void builder_init(struct boot_info *bi);
 
 int hvm_setup_cpus(struct domain *d, paddr_t entry, paddr_t start_info);
+int pvh_populate_memory_range(
+    struct domain *d, unsigned long start, unsigned long nr_pages);
 
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
-- 
2.30.2


