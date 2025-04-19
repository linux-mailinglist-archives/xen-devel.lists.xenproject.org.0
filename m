Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF7A945BC
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960203.1352286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYc-0001uA-Kp; Sat, 19 Apr 2025 22:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960203.1352286; Sat, 19 Apr 2025 22:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYc-0001od-Ga; Sat, 19 Apr 2025 22:21:06 +0000
Received: by outflank-mailman (input) for mailman id 960203;
 Sat, 19 Apr 2025 22:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GQR-0004yY-J2
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:12:39 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d1af9f-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:12:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100551247651.7571400527812;
 Sat, 19 Apr 2025 15:09:11 -0700 (PDT)
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
X-Inumbo-ID: 66d1af9f-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ISi6kBQih0IAqUVdGkDUx1hAdFnR6dedtv6RC9if7MCuq2fMCsDlSZpbnlS182rwCkBKeU3VebBPu2wofakdab4yM1s2GVHDIVDzDor2BlM7BJ2RbZS5WbSYpvzcuTMXDMrtBR0f2dpCclQW5b099M8MNe2r0nS92L5pP3D45R8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100554; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XAtBPUpKdfuodxySJ/eiFSVT2P5Oe98nw2jobpysUkU=; 
	b=aA5oUJGC+b2Wvnqb9OOqfbQ6q5zVdFFS0mTGWBC6z2S9L/EoM3xd10InFhHbAAxqW+S9tF5ekEOE1cqZtURmUm7v85QvavSuOP32fyPHfy4rUF+KPYl6rA7QDtDgkGaN1iymDu8Rrwnw2iqCoS+ANv6rVAt4H8VJoNuE5+ly8Zk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100553;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=XAtBPUpKdfuodxySJ/eiFSVT2P5Oe98nw2jobpysUkU=;
	b=jdo7Asr62vlVqo+jN4XqB//N3sLexMpHPSfc+IgIGC9oNVxfjR+8IOUpRPJ5A+XS
	SKrnrrLJ7JavfsvqALqByM458o7E2H1ssbmL7Z0V+JlLLBEJPqx+6EzTB7PwpQUVxOJ
	UJXkywCrNUt79BZbq65sZrAPTnZBMYyiGAOW0HY0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 26/38] x86/hyperlaunch: remove dom0-isms from arch_create_dom
Date: Sat, 19 Apr 2025 18:08:08 -0400
Message-Id: <20250419220820.4234-27-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
index a82c02250b4c..13f99111a3a9 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -216,7 +216,7 @@ struct domain *__init arch_create_dom(
     char *cmdline = NULL;
     size_t cmdline_size;
     unsigned int create_flags = 0;
-    struct xen_domctl_createdomain dom0_cfg = {
+    struct xen_domctl_createdomain dom_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
@@ -232,11 +232,11 @@ struct domain *__init arch_create_dom(
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
 
@@ -244,7 +244,7 @@ struct domain *__init arch_create_dom(
     {
         create_flags |= CDF_hardware;
         if ( iommu_enabled )
-            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+            dom_cfg.flags |= XEN_DOMCTL_CDF_iommu;
     }
 
     if ( bd->domid == DOMID_INVALID )
@@ -252,7 +252,7 @@ struct domain *__init arch_create_dom(
         bd->domid = get_initial_domain_id();
     if ( bd->capabilities & BUILD_CAPS_CONTROL )
         create_flags |= CDF_privileged | CDF_hardware;
-    d = domain_create(bd->domid, &dom0_cfg,
+    d = domain_create(bd->domid, &dom_cfg,
                       pv_shim ? 0 : create_flags);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
@@ -279,25 +279,30 @@ struct domain *__init arch_create_dom(
                     cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
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
+        /* Params from Xen cmd line apply only to control/hardware doms */
+        if ( bd->capabilities & (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE) )
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


