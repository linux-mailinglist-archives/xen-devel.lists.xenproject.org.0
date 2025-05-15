Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E39AB8813
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985545.1371501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYjO-0002hO-IM; Thu, 15 May 2025 13:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985545.1371501; Thu, 15 May 2025 13:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYjO-0002eR-DN; Thu, 15 May 2025 13:34:38 +0000
Received: by outflank-mailman (input) for mailman id 985545;
 Thu, 15 May 2025 13:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYX1-0006hT-Ct
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:21:51 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e2ef4b1-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:21:49 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731517142646.630844721220456;
 Thu, 15 May 2025 06:19:31 -0700 (PDT)
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
X-Inumbo-ID: 8e2ef4b1-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315174; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HNLkXWqKxMVgiodQy1c4fQpDO8VNarf/emWmgTbK0HOaf1Pgp7C2fGzivi5cVMVRHW8RZxtWqrsWmw0h1mJi5frgcvpK2nf/M0y095HVPX6KJTNP7iPPrWVTLFKKeAkz8/DkFs/Ug81nX6TLw7O5DP/hAFDnN6B720E8HsObcs8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315174; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ctYdl98sf4D3+IQ7cSA7+ZkM59QI9KYHD8HOsUqDsmo=; 
	b=DSgn8DtJXWqa3DDKeKXt0KOBzMQvJyJAVJPk9bat94PaMNUJd40nUwHz7jaRGjdRWQU2bY5+5bweUux4b7y2X1nonJ6B2RrWlPPp7naqOupv5ItF+IqDoHQfPSqQvs3qVGnSQ/PrkT3+HtC4gqTEPcy88+xw8m4W8Mk+GgLhqDA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315174;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ctYdl98sf4D3+IQ7cSA7+ZkM59QI9KYHD8HOsUqDsmo=;
	b=pEmFQJXvjhLYrOQokSfnHu00kCFHYL79TA2G40G3CrRh1ShIDKvgbHzah9qbn/JE
	N5i11gA6Za0gWPmGE6xzCuebHLMI6Yrd9DWywlg8rftbciu41iGOHuBzeVAhdFbhvAw
	VDSe9HmD1xHl9oE5QhjQl33kMdoR/yER0AIOx554=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 25/38] x86/hyperlaunch: remove dom0-isms from arch_create_dom
Date: Thu, 15 May 2025 09:19:08 -0400
Message-Id: <20250515131912.5019-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Removes the dom0 naming from variables and isolates control/hardware
domain specific logic behind capabilities check.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/domain.c | 47 +++++++++++++++-------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 0a7b40c9a746..2c01705ebe4f 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -228,7 +228,7 @@ struct domain *__init arch_create_dom(
 {
     char *cmdline = NULL;
     size_t cmdline_size;
-    struct xen_domctl_createdomain dom0_cfg = {
+    struct xen_domctl_createdomain dom_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
@@ -244,21 +244,21 @@ struct domain *__init arch_create_dom(
     if ( opt_dom0_pvh ||
          (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
     {
-        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
+        dom_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
                             XEN_DOMCTL_CDF_hap : 0));
 
-        dom0_cfg.arch.emulation_flags |=
+        dom_cfg.arch.emulation_flags |=
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
     }
 
     if ( iommu_enabled && (bd->capabilities & DOMAIN_CAPS_HARDWARE) )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        dom_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg,
+    d = domain_create(bd->domid, &dom_cfg,
             ((bd->capabilities & DOMAIN_CAPS_CONTROL)  ? CDF_privileged : 0) |
             ((bd->capabilities & DOMAIN_CAPS_HARDWARE) ? CDF_hardware   : 0));
     if ( IS_ERR(d) )
@@ -289,25 +289,30 @@ struct domain *__init arch_create_dom(
                     cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
                     cmdline_size);
 
-        if ( bi->kextra )
-            /* kextra always includes exactly one leading space. */
-            strlcat(cmdline, bi->kextra, cmdline_size);
-
-        /* Append any extra parameters. */
-        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
-            strlcat(cmdline, " noapic", cmdline_size);
-
-        if ( (strlen(acpi_param) == 0) && acpi_disabled )
+        /* Params from Xen cmd line apply only to classic dom0 */
+        if ( has_dom0_caps(bd) )
         {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
-            safe_strcpy(acpi_param, "off");
+            if ( bi->kextra )
+                /* kextra always includes exactly one leading space. */
+                strlcat(cmdline, bi->kextra, cmdline_size);
+
+            /* Append any extra parameters. */
+            if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
+                strlcat(cmdline, " noapic", cmdline_size);
+
+            if ( (strlen(acpi_param) == 0) && acpi_disabled )
+            {
+                printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
+                safe_strcpy(acpi_param, "off");
+            }
+
+            if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
+            {
+                strlcat(cmdline, " acpi=", cmdline_size);
+                strlcat(cmdline, acpi_param, cmdline_size);
+            }
         }
 
-        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
-        {
-            strlcat(cmdline, " acpi=", cmdline_size);
-            strlcat(cmdline, acpi_param, cmdline_size);
-        }
         bd->kernel->cmdline_pa = 0;
         bd->cmdline = cmdline;
     }
-- 
2.30.2


