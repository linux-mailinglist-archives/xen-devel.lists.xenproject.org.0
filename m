Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F63AB87CA
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985377.1371380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYWB-0000t3-RX; Thu, 15 May 2025 13:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985377.1371380; Thu, 15 May 2025 13:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYWB-0000qG-KM; Thu, 15 May 2025 13:20:59 +0000
Received: by outflank-mailman (input) for mailman id 985377;
 Thu, 15 May 2025 13:20:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYWA-0006hT-Os
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:20:58 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e759868-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:20:56 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315104638519.7623353843491;
 Thu, 15 May 2025 06:18:24 -0700 (PDT)
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
X-Inumbo-ID: 6e759868-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eqRz7MHW8ElvQYgJIsqplWEPyVf9fWZE0cV0OUnLmlTni7ODxB3GuHX0lREvPxrEgvcEKBxmxm6yc2TuEjVvWOs6j94THdfkiKTcPv58hoDwqaqruDdFBoahpTCRUnsY0598Exg41v8cTP3U1Rb/3BZjhdI5codUIyHrwdxFoTY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315107; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TSv4qvsiTicFq/fqTWX6HfFCXcyJ+7TZ4TAASla3DBM=; 
	b=fRc+7y6ZQvxUxR6sV6OE5UVRxSyriCUoJRSH9mdnNb4ezz2PTTI8WwDipZ69Xu8M/9Ip1UpAIEPohtXLCuG9y/Xg0wNgV1RyT58GJPPL6aU3NPO7deyzjrFVu1ujXACLEfTIQlKr2M4mAeNN3RnJBVrjhWIGiV++fE+ZRY85NXU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315107;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TSv4qvsiTicFq/fqTWX6HfFCXcyJ+7TZ4TAASla3DBM=;
	b=OaP3wSLMZcMJpqZwDtCsr0O8oqiVhbqDiZsijHSm/KtJAdCOr/KdQ7oNImpa90jE
	dMr+C0vWBWAyuBBXWt1OYC16i1fi3s4q++5jwOF2WueKhtOkUa6+3kFNjujLlAgUaZe
	HRHRz+EWzTqhmEkc+FnFBcxfLr1yQVhZjlJaqORU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 19/38] x86/hyperlaunch: move populating p2m under domain builder
Date: Thu, 15 May 2025 09:17:25 -0400
Message-Id: <20250515131744.3843-20-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
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
index 9ea8acbb5a02..36d2e7e13948 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -89,9 +89,8 @@ static int __init modify_identity_mmio(struct domain *d, unsigned long pfn,
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
@@ -400,7 +399,7 @@ void __init dom0_pvh_setup_e820(struct domain *d, unsigned long nr_pages)
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
index e724d578c5d4..4bbd5d2b8e24 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -24,6 +24,8 @@
 #include <asm/dom0_build.h>
 #include <asm/domain-builder.h>
 #include <asm/hvm/io.h>
+#include <asm/hvm/support.h>
+#include <asm/p2m.h>
 #include <asm/paging.h>
 #include <asm/pci.h>
 
@@ -248,6 +250,33 @@ int __init hvm_setup_cpus(
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
@@ -289,6 +318,16 @@ int __init dom_construct_pvh(struct boot_domain *bd)
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
index a27413edb380..2de73117cb7f 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -5,6 +5,8 @@ struct boot_domain;
 struct elf_dom_parms;
 
 int hvm_setup_cpus(struct domain *d, paddr_t entry, paddr_t start_info);
+int pvh_populate_memory_range(
+    struct domain *d, unsigned long start, unsigned long nr_pages);
 
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
-- 
2.30.2


