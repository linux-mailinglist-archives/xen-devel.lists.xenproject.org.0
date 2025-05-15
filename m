Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A3AB87C2
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985348.1371310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVv-0006J9-EF; Thu, 15 May 2025 13:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985348.1371310; Thu, 15 May 2025 13:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVv-0006Gq-6N; Thu, 15 May 2025 13:20:43 +0000
Received: by outflank-mailman (input) for mailman id 985348;
 Thu, 15 May 2025 13:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYVW-0001J6-J2
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:20:18 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56dac482-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:20:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315101958426.96570090883506;
 Thu, 15 May 2025 06:18:21 -0700 (PDT)
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
X-Inumbo-ID: 56dac482-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cSRlrUsmWPREwCa4N7HxQYaC3W2T0L4LVb4/dfh6vswe3ZI6TFU6gNvI9ytWa1hwNXVJIrWG+wo9Rw9Z8wQqjHM5KxqwW2HD8C5DKGiGPuADTiqbBybMoig7Q9D3zSCnCvvIRmU/6T9ZicKUV2m5RUhWe7+VX0LxQBNofluk8Lk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315103; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QN3ttUmNuXyhgf0DOzYzQqGUZSfR2qHn+gtTdXGDOj4=; 
	b=cGVrXtEzGtwsO/avZUTes4oe38HhvKafjkCnXhE+troKujn8WDlaID3bPogsE4inLTVnIyUbbv7g2cb0+go8vhTCAttKeoyO7v4EoW5LqKcZgmnGavbWbo7nKN3LZZv1b+/pVr9JEcN/umEUF8GtomvlThAN2uHKJiOG+lXlUdk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315103;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=QN3ttUmNuXyhgf0DOzYzQqGUZSfR2qHn+gtTdXGDOj4=;
	b=Y5uZ6lk30edG+ZiMmanVYVOH1SusoWp4P7ZNVXQFPxBItQGlHUdj6wgxh9mj2m/o
	RxI68POmnmFRm7AducGVJAM4gey4n0VG5zNP8Ow0wYiQY5OOJU+WKkWZOCxDWBTUFYK
	kq9SprP8dPJJYxBQjnpBH5t9eSraeJlYY6sH+FwM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 16/38] x86/hyperlaunch: move pvh_setup_cpus to domain builder
Date: Thu, 15 May 2025 09:17:22 -0400
Message-Id: <20250515131744.3843-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function pvh_setup_cpus() is a very general function that is usable by all
HVM domains, not just PVH. As such, renaming to hvm_setup_cpus during move.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c             | 45 +---------------------
 xen/arch/x86/hvm/dom_build.c              | 46 +++++++++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |  2 +
 3 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a900138b0311..7b9a2cccabce 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -808,49 +808,6 @@ static int __init pvh_load_kernel(
     return 0;
 }
 
-static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
-                                 paddr_t start_info)
-{
-    struct vcpu *v = d->vcpu[0];
-    int rc;
-    /*
-     * This sets the vCPU state according to the state described in
-     * docs/misc/pvh.pandoc.
-     */
-    vcpu_hvm_context_t cpu_ctx = {
-        .mode = VCPU_HVM_MODE_32B,
-        .cpu_regs.x86_32.ebx = start_info,
-        .cpu_regs.x86_32.eip = entry,
-        .cpu_regs.x86_32.cr0 = X86_CR0_PE | X86_CR0_ET,
-        .cpu_regs.x86_32.cs_limit = ~0u,
-        .cpu_regs.x86_32.ds_limit = ~0u,
-        .cpu_regs.x86_32.es_limit = ~0u,
-        .cpu_regs.x86_32.ss_limit = ~0u,
-        .cpu_regs.x86_32.tr_limit = 0x67,
-        .cpu_regs.x86_32.cs_ar = 0xc9b,
-        .cpu_regs.x86_32.ds_ar = 0xc93,
-        .cpu_regs.x86_32.es_ar = 0xc93,
-        .cpu_regs.x86_32.ss_ar = 0xc93,
-        .cpu_regs.x86_32.tr_ar = 0x8b,
-    };
-
-    domain_vcpus_create(d);
-
-    rc = arch_set_info_hvm_guest(v, &cpu_ctx);
-    if ( rc )
-    {
-        printk("Unable to setup Dom0 BSP context: %d\n", rc);
-        return rc;
-    }
-
-    update_domain_wallclock_time(d);
-
-    v->is_initialised = 1;
-    clear_bit(_VPF_down, &v->pause_flags);
-
-    return 0;
-}
-
 static int __init cf_check acpi_count_intr_ovr(
     struct acpi_subtable_header *header, const unsigned long end)
 {
@@ -1319,7 +1276,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
-    rc = pvh_setup_cpus(d, entry, start_info);
+    rc = hvm_setup_cpus(bd->d, entry, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 CPUs: %d\n", rc);
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 450e77d190a2..c182847147b0 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/domain-builder.h>
 #include <xen/iommu.h>
 #include <xen/init.h>
 #include <xen/softirq.h>
@@ -16,6 +17,8 @@
 
 #include <acpi/actables.h>
 
+#include <public/hvm/hvm_vcpu.h>
+
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
 #include <asm/domain-builder.h>
@@ -55,6 +58,49 @@ static void __init pvh_init_p2m(struct boot_domain *bd)
     } while ( preempted );
 }
 
+int __init hvm_setup_cpus(
+    struct domain *d, paddr_t entry, paddr_t start_info)
+{
+    struct vcpu *v = d->vcpu[0];
+    int rc;
+    /*
+     * This sets the vCPU state according to the state described in
+     * docs/misc/pvh.pandoc.
+     */
+    vcpu_hvm_context_t cpu_ctx = {
+        .mode = VCPU_HVM_MODE_32B,
+        .cpu_regs.x86_32.ebx = start_info,
+        .cpu_regs.x86_32.eip = entry,
+        .cpu_regs.x86_32.cr0 = X86_CR0_PE | X86_CR0_ET,
+        .cpu_regs.x86_32.cs_limit = ~0u,
+        .cpu_regs.x86_32.ds_limit = ~0u,
+        .cpu_regs.x86_32.es_limit = ~0u,
+        .cpu_regs.x86_32.ss_limit = ~0u,
+        .cpu_regs.x86_32.tr_limit = 0x67,
+        .cpu_regs.x86_32.cs_ar = 0xc9b,
+        .cpu_regs.x86_32.ds_ar = 0xc93,
+        .cpu_regs.x86_32.es_ar = 0xc93,
+        .cpu_regs.x86_32.ss_ar = 0xc93,
+        .cpu_regs.x86_32.tr_ar = 0x8b,
+    };
+
+    domain_vcpus_create(d);
+
+    rc = arch_set_info_hvm_guest(v, &cpu_ctx);
+    if ( rc )
+    {
+        printk("Unable to setup Dom0 BSP context: %d\n", rc);
+        return rc;
+    }
+
+    update_domain_wallclock_time(d);
+
+    v->is_initialised = 1;
+    clear_bit(_VPF_down, &v->pause_flags);
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
     int rc;
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 243ca09c045a..a27413edb380 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -4,6 +4,8 @@
 struct boot_domain;
 struct elf_dom_parms;
 
+int hvm_setup_cpus(struct domain *d, paddr_t entry, paddr_t start_info);
+
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
 
-- 
2.30.2


