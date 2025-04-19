Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6AA945BE
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960230.1352306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYo-0003IR-Jb; Sat, 19 Apr 2025 22:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960230.1352306; Sat, 19 Apr 2025 22:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYo-0003E0-9e; Sat, 19 Apr 2025 22:21:18 +0000
Received: by outflank-mailman (input) for mailman id 960230;
 Sat, 19 Apr 2025 22:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GPh-0007X1-96
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:11:53 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ab84614-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:11:51 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100533828780.5983240234141;
 Sat, 19 Apr 2025 15:08:53 -0700 (PDT)
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
X-Inumbo-ID: 4ab84614-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YyT+hDUYlCb//OFSIs83gn2wDuEFjsUp1Ztasps0AeWRFQogcX+gE3ZKa07J3ENGw734w3rK5ko3tc6OtcPg3N4MTEpjDL/i+PYnsQh5wiOsONFEbKLUOStFni+SsmvRwUIXqOWvjbCFF29iadspoU3w/gG1unpprEG1/2cX5H4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KU/isf+bIbWsd6Vdl793ESAiGNzLwhwJfrt1XINwyFs=; 
	b=UbReVHHFZ+LnnERADyahvt+K79WhHICItNe0YoacwUCX3PUCZj2Q0nE5Idp3xGOnI3GctaTtpGVzwmjLs5JbxuqHqINbjaG8IqHUdaLlAl2SrirYhKbUM7XGEoNcbK+arLvBxhUqvP4P0UDEbp9udk59iKVa2kvThpz16Pi15XQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100552;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KU/isf+bIbWsd6Vdl793ESAiGNzLwhwJfrt1XINwyFs=;
	b=hvTngnkgipf7LENnx6jqb4sQ8ammvGkyS75dOXseclLzVDBOYW7V3Vzhu3EV7iwd
	L7bbguvERst7FOJKSLnR17O6gs+Jeczpgoorr07P1he2PPJMJnG+y1V6fRvOezVBO4h
	FdqOa6o+E9hIIBeYQI5WmNlKttGwWniddXPN7lAw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 17/38] x86/hyperlaunch: move pvh_setup_cpus to domain builder
Date: Sat, 19 Apr 2025 18:07:59 -0400
Message-Id: <20250419220820.4234-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function pvh_setup_cpus() is a very general function that is usable by all
HVM domains, not just PVH. As such, renaming to hvm_setup_cpus during move.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c             | 45 +----------------------
 xen/arch/x86/hvm/dom_build.c              | 45 +++++++++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |  2 +
 3 files changed, 48 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2ed2d5fd7326..a3b6afc5318a 100644
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
-    alloc_dom_vcpus(d);
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
index 7fa007a6926d..078e42447b0a 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -16,6 +16,8 @@
 
 #include <acpi/actables.h>
 
+#include <public/hvm/hvm_vcpu.h>
+
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
 #include <asm/domain-builder.h>
@@ -55,6 +57,49 @@ static void __init pvh_init_p2m(struct boot_domain *bd)
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
+    alloc_dom_vcpus(d);
+
+    rc = arch_set_info_hvm_guest(v, &cpu_ctx);
+    if ( rc )
+    {
+        printk("Unable to setup %pd BSP context: %d\n", d, rc);
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
index af0a24b4edf5..7bc2fbe66bc2 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -9,6 +9,8 @@ int __init builder_get_cmdline(
 
 void builder_init(struct boot_info *bi);
 
+int hvm_setup_cpus(struct domain *d, paddr_t entry, paddr_t start_info);
+
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
 
-- 
2.30.2


