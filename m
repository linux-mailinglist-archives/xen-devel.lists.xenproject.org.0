Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EA9D6AC1
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842124.1257556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEulE-0006UY-Vi; Sat, 23 Nov 2024 18:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842124.1257556; Sat, 23 Nov 2024 18:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEulE-0006SP-RU; Sat, 23 Nov 2024 18:21:36 +0000
Received: by outflank-mailman (input) for mailman id 842124;
 Sat, 23 Nov 2024 18:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEulD-0005pL-As
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:21:35 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b5ba2c-a9c7-11ef-99a3-01e77a169b0f;
 Sat, 23 Nov 2024 19:21:31 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386055104491.61463410551505;
 Sat, 23 Nov 2024 10:20:55 -0800 (PST)
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
X-Inumbo-ID: c2b5ba2c-a9c7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyYjViYTJjLWE5YzctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMzg2MDkyLjAwODkwOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386059; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K1uAHTeIGO53ndbxGR7cK3NhvO+SlT0YVCMHCF/6G4dQGk0stnrh82Fb3T1qksxCO0/NTDxgdUc+A9jShaYCesweNCaQ181aebLdEM+++gSnXTfFWAWYeIfTnK5fyNKCU56BIFJ8/8+1B6lsl1+EYVQx9IrP18FkDDHwghuaUGQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386059; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GLAmJCFT18dTLQQRusDt7pLXOrCOqVBeVV2VQ8odAtI=; 
	b=cJp0c6uC6f9nfJP5dgY43HBqatEJ0qg8ZBFKOfL8VOMyE/hj/lQC7lMjDqzW/bHmudXnT4mOAa9mVkqFVKRLr8Br0b11119ttDajioKmBmhr0/U/mX30/NZ6jhKaI7QduZhSDi7JChJSS4PS5T8nzZWcPltFx5o9B9rGjIozNy0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386059;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GLAmJCFT18dTLQQRusDt7pLXOrCOqVBeVV2VQ8odAtI=;
	b=VLMLQ98dtFyNI0B5nEKpGCmeOPnUdRMmOWSidv9KwJX+Y6tmWvULyeji/8Vsuvco
	TuAL9LKgjV3YLCt+hqlCjIWVgzJdp3T049lHVaEcdkK1EUERc6JIVtB77eBVtpV3DRW
	W8ZsB82Z0dmQcL9UdwK+MzA8o0gddX5DdAk9rbJE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 02/15] x86/boot: introduce domid field to struct boot_domain
Date: Sat, 23 Nov 2024 13:20:31 -0500
Message-Id: <20241123182044.30687-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
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
Changes since v9 boot modules
- missing include for domid_t def
---
 xen/arch/x86/include/asm/bootdomain.h |  4 ++++
 xen/arch/x86/setup.c                  | 12 +++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 12c19ab37bd8..bcbf36b13f25 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -5,6 +5,8 @@
  * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
  */
 
+#include <public/xen.h>
+
 #ifndef __XEN_X86_BOOTDOMAIN_H__
 #define __XEN_X86_BOOTDOMAIN_H__
 
@@ -12,6 +14,8 @@ struct boot_module;
 struct domain;
 
 struct boot_domain {
+    domid_t domid;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 460157def8ea..a2178d5e8cc5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -339,6 +339,9 @@ static struct boot_info *__init multiboot_fill_boot_info(
     /* Variable 'i' should be one entry past the last module. */
     bi->mods[i].type = BOOTMOD_XEN;
 
+    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
+        bi->domains[i].domid = DOMID_INVALID;
+
     return bi;
 }
 
@@ -979,7 +982,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -995,15 +997,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


