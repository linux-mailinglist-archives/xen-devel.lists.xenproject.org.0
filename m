Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F809CDFC0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:22:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837621.1253552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwHN-0004rW-De; Fri, 15 Nov 2024 13:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837621.1253552; Fri, 15 Nov 2024 13:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwHN-0004oo-AX; Fri, 15 Nov 2024 13:22:29 +0000
Received: by outflank-mailman (input) for mailman id 837621;
 Fri, 15 Nov 2024 13:22:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBw8R-0006v7-Un
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:13:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d1fae5f-a353-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:13:12 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731676338126593.7092805148436;
 Fri, 15 Nov 2024 05:12:18 -0800 (PST)
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
X-Inumbo-ID: 5d1fae5f-a353-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVkMWZhZTVmLWEzNTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc2MzkzLjAxNzQ0Mywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731676340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z9e/3YKyb3RRCE5tGYsc88W9Ea4/y5BTZ3oXrdZPV627uueOKJIfQoXWXCMFUnWuXJRaa93jnkV9iCbSDdwMEp+7CAxy6JpkBkwNlu69osdrJvwNWSTgc8rdfaAQLpdZKWJ36LbgRPKDrIsb+JskwhwfK9kMQcncr5LUSqGYSNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731676340; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bhl7E1mvlo9SO98XxLqZrhL5BHZQCoyp4nD+tEiZihE=; 
	b=FLoJOgt4hMA0q6Qlkfk9BtOgxbNr2Q/7Mi6U2D1u83AIhqewpzbY5EFu7L5IEQWLMGb1lZEb2EM7c8296cVe+eHc8woy+PfGaqno6B8oJGeQGQ/TBbDQre2Wg9WQHUWiOY2tYq/BfPwYa+NKbm6Mqoj+ukZLmgWoUfBmeok4x0s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731676340;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=bhl7E1mvlo9SO98XxLqZrhL5BHZQCoyp4nD+tEiZihE=;
	b=kFxRu0P+j0A0IlvOO+Yih4j31JT3Is7P4+aOLfP+U96Cgq7qeuOazqT5niKeuB5I
	NY50+/gFKw8lxmNq+Lcw3oOe+h353PAGYNrcZr1dXptrundY8ScC/Jko8M/r3/gJFYK
	f0nNnMAukrhe2xQmleQ3BeowE/ChvTlmxdC1cS5M=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 5/6] x86/boot: introduce domid field to struct boot_domain
Date: Fri, 15 Nov 2024 08:12:03 -0500
Message-Id: <20241115131204.32135-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241115131204.32135-1-dpsmith@apertussolutions.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/include/asm/bootdomain.h |  2 ++
 xen/arch/x86/setup.c                  | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 12c19ab37bd8..3873f916f854 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -12,6 +12,8 @@ struct boot_module;
 struct domain;
 
 struct boot_domain {
+    domid_t domid;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2ccaa7dc965b..533a1e2bbe05 100644
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
 
@@ -977,7 +980,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -993,15 +995,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


