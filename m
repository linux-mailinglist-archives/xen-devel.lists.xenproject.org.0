Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D636B9FCC07
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 17:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863240.1274670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBd-0002hc-0y; Thu, 26 Dec 2024 16:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863240.1274670; Thu, 26 Dec 2024 16:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBc-0002fw-SG; Thu, 26 Dec 2024 16:58:12 +0000
Received: by outflank-mailman (input) for mailman id 863240;
 Thu, 26 Dec 2024 16:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrBb-00026T-UU
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:58:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95e1c8de-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:58:11 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232272298956.4716909412124;
 Thu, 26 Dec 2024 08:57:52 -0800 (PST)
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
X-Inumbo-ID: 95e1c8de-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232274; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K/w2vq6EreekCze9dp3/gK9AfMDOPqxSLk8NTEMPVaWDFrRidtnoHkPyxzFJhB4EqZg7iaLym8Wc/wh3oQYwzt3vRHKk/VTGYYcabwdoESlrpwqSGHXL/WdEhbiBr2nFDEy0PJOjPlkxIogYb9Zk9BAoH6uxbeRaSCaX9B2H62A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232274; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vny6kTLP1Zgh9pS1XObMWkggVqw9oNCU0me6bh/qKT0=; 
	b=hs9xJUPpT3W3Ht3QPOx96+ehkJQ7DJUEdbcZOq9sEfsdQaSOFXncBapqHjcs9jOfILH+Ch2YA6NgQlV1IvnMuaBGKxmud6IDw+dMn41r4vpb2gF4I3bYqkSyhHtdRkPyOkNe2JBYbgF2wCA5CR9/tPQhxXlnneuu4X1Vxha37pk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232274;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Vny6kTLP1Zgh9pS1XObMWkggVqw9oNCU0me6bh/qKT0=;
	b=e8s+QPuhbtWMPbLkTZbRs3RyEPdv5D7OTNFrShJvzHQTVXp7eoLHI/kCC8r4IJxy
	Eyl/7RtSyk4+O9k8+YvASIR4R2YDEV00ljjs0nmg9uLLCY/86nPRywXwjRyHgGyc5MG
	yxkzb+NxgooyN0plEGEdDZ/uDY9xq4+C9yT5ewy4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 02/15] x86/boot: introduce domid field to struct boot_domain
Date: Thu, 26 Dec 2024 11:57:27 -0500
Message-Id: <20241226165740.29812-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a domid field to struct boot_domain to hold the assigned domain id for the
domain. During initialization, ensure all instances of struct boot_domain have
the invalid domid to ensure that the domid must be set either by convention or
configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1 dom0 device tree:
- made .domid part of the static init of xen_boot_info

Changes since v9 boot modules
- missing include for domid_t def
---
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/arch/x86/setup.c                  | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 8d0e5c78d426..67be575fe781 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -5,10 +5,14 @@
  * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
  */
 
+#include <public/xen.h>
+
 #ifndef __XEN_X86_BOOTDOMAIN_H__
 #define __XEN_X86_BOOTDOMAIN_H__
 
 struct boot_domain {
+    domid_t domid;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7e4529d6bfb2..27937a7f7aeb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -292,6 +292,7 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
+    .domains = { {.domid = DOMID_INVALID} },
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
@@ -991,7 +992,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -1007,15 +1007,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    bd->domid = get_initial_domain_id();
+    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
     init_dom0_cpuid_policy(d);
 
     if ( alloc_dom0_vcpu0(d) == NULL )
-        panic("Error creating d%uv0\n", domid);
+        panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
     if ( bd->kernel->cmdline_pa || bi->kextra )
-- 
2.30.2


