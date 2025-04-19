Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243BA945B0
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960064.1352176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOf-0001nQ-Qm; Sat, 19 Apr 2025 22:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960064.1352176; Sat, 19 Apr 2025 22:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOf-0001jz-Kz; Sat, 19 Apr 2025 22:10:49 +0000
Received: by outflank-mailman (input) for mailman id 960064;
 Sat, 19 Apr 2025 22:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GNu-0004yY-Fs
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:10:02 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0930067e-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:10:01 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100516695805.3400796738428;
 Sat, 19 Apr 2025 15:08:36 -0700 (PDT)
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
X-Inumbo-ID: 0930067e-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100518; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jCHtlTNbPugI4QsIOfMCSshNjkzTlnMLqAQ2vP1auU+C/EtHyN66loQ5UPnOLGrRs2fxULuzzTtaPiTNAkXIPy8FyenMkPZU2XsxZN286tyLGA/tjJnDHw1hL9XZZCgaI1B6knomTSeo60eLPRfS8SZoNuJF+DGR8NlrmN23xYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100518; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hhloariy0ivPaFgv7gJ7fUQsj5qmnZtQNfUz7swuU5o=; 
	b=dVWyCjoB36UUU+HPhr6g+dBMs7jIwim3s9O8c6XL8xOsoSSTARH3fK2aSancJeTn6c7fmvkRBw808Vhx2VoY6BquCbaqA1jh9rC47uWigznmrGbo26468PpzRqlA2hOjtasXa6vAePgcGzWY8qfJLjmfmHCxnVLw1tWqz7lp1J4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100518;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=hhloariy0ivPaFgv7gJ7fUQsj5qmnZtQNfUz7swuU5o=;
	b=Tdje/yajFWQNPQTzSYZLWr76M0NBIGJoB30uF9T8XUCB6fNMtxoDbWIXhQnPolJV
	+gBDPbBaXqzd+ONGwKI/A5rYrYyOrOwFP11GrY59pg6ryeOhFFmeFGDbx8MycfgyKic
	t+wmv7xTJm/eqI9dDJUzklKL9xn6yON+If3tpbow=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 08/38] x86/hyperlaunch: move initial hwdom setup to dom_construct_pvh
Date: Sat, 19 Apr 2025 18:07:50 -0400
Message-Id: <20250419220820.4234-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Relocate the initial block of hwdom setup code from dom0_construct_pvh() over
to dom_construct_pvh().

No functional change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c | 44 ------------------------------
 xen/arch/x86/hvm/dom_build.c  | 50 +++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 176b253d3c61..b4ffebdde00e 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1312,56 +1312,12 @@ static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
     return 0;
 }
 
-static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
-{
-    unsigned int i;
-    int rc;
-
-    for ( i = 0; i < pci_mmcfg_config_num; i++ )
-    {
-        rc = register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].address,
-                                         pci_mmcfg_config[i].start_bus_number,
-                                         pci_mmcfg_config[i].end_bus_number,
-                                         pci_mmcfg_config[i].pci_segment);
-        if ( rc )
-            printk("Unable to setup MMCFG handler at %#lx for segment %u\n",
-                   pci_mmcfg_config[i].address,
-                   pci_mmcfg_config[i].pci_segment);
-    }
-}
-
 int __init dom0_construct_pvh(const struct boot_domain *bd)
 {
     paddr_t entry, start_info;
     struct domain *d = bd->d;
     int rc;
 
-    printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
-
-    if ( bd->kernel == NULL )
-        panic("Missing kernel boot module for %pd construction\n", d);
-
-    if ( is_hardware_domain(d) )
-    {
-        /*
-         * MMCFG initialization must be performed before setting domain
-         * permissions, as the MCFG areas must not be part of the domain IOMEM
-         * accessible regions.
-         */
-        pvh_setup_mmcfg(d);
-
-        /*
-         * Setup permissions early so that calls to add MMIO regions to the
-         * p2m as part of vPCI setup don't fail due to permission checks.
-         */
-        rc = dom0_setup_permissions(d);
-        if ( rc )
-        {
-            printk("%pd unable to setup permissions: %d\n", d, rc);
-            return rc;
-        }
-    }
-
     /*
      * Craft dom0 physical memory map and set the paging allocation. This must
      * be done before the iommu initializion, since iommu initialization code
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 7206815d64a9..b6e534226434 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -8,15 +8,65 @@
  * Copyright (C) 2024 Apertus Solutions, LLC
  */
 
+#include <xen/acpi.h>
 #include <xen/init.h>
+#include <xen/types.h>
+
+#include <acpi/actables.h>
 
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
+#include <asm/hvm/io.h>
+#include <asm/pci.h>
+
+static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
+{
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < pci_mmcfg_config_num; i++ )
+    {
+        rc = register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].address,
+                                         pci_mmcfg_config[i].start_bus_number,
+                                         pci_mmcfg_config[i].end_bus_number,
+                                         pci_mmcfg_config[i].pci_segment);
+        if ( rc )
+            printk("Unable to setup MMCFG handler at %#lx for segment %u\n",
+                   pci_mmcfg_config[i].address,
+                   pci_mmcfg_config[i].pci_segment);
+    }
+}
 
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
+    int rc;
+
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", bd->domid);
 
+    if ( bd->kernel == NULL )
+        panic("Missing kernel boot module for %pd construction\n", bd->d);
+
+    if ( is_hardware_domain(bd->d) )
+    {
+        /*
+         * MMCFG initialization must be performed before setting domain
+         * permissions, as the MCFG areas must not be part of the domain IOMEM
+         * accessible regions.
+         */
+        pvh_setup_mmcfg(bd->d);
+
+        /*
+         * Setup permissions early so that calls to add MMIO regions to the
+         * p2m as part of vPCI setup don't fail due to permission checks.
+         */
+        rc = dom0_setup_permissions(bd->d);
+        if ( rc )
+        {
+            printk("%pd unable to setup permissions: %d\n", bd->d, rc);
+            return rc;
+        }
+    }
+
     return dom0_construct_pvh(bd);
 }
 
-- 
2.30.2


