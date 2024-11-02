Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE529BA1C2
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829618.1244647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4F-0003C0-J6; Sat, 02 Nov 2024 17:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829618.1244647; Sat, 02 Nov 2024 17:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4F-00039i-ER; Sat, 02 Nov 2024 17:37:43 +0000
Received: by outflank-mailman (input) for mailman id 829618;
 Sat, 02 Nov 2024 17:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Hun-0004r4-9v
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:57 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca29640c-993f-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 18:27:53 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568375366826.8780724690604;
 Sat, 2 Nov 2024 10:26:15 -0700 (PDT)
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
X-Inumbo-ID: ca29640c-993f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhMjk2NDBjLTk5M2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTY4NDc0LjMzNzU3OSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GXqqM1eguA2Hqrwqld2IRWlUOBtvX8mk9HblxiZfWXdP/aj1BP9a5wi1WfnGxKZ2tOsCAkQtzlqjToD4/DvxrcTcyE6fnSZqvLufchVowmN0iXbypL/XgzczSpDoqhiiLp8SEUX+NsxVio4QOl4yakoYWF/skV8Qvn2nGrDoIhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568385; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DlW8869YgbQ7b/dFXUZq70NRQ3QZ7VjwhbTQzGdmgBI=; 
	b=I+2RzWb/pZzKdYO+rh73X4evInsrClFR8eSFoAeooQNTxy2IxTEu4ikeU9zssfOedLlBXEktKUA4cXhDXbz67mTFeW2Jt4twun0AalK3AEdlbLE/KqvUTvUqQf1PzB7t0rKQ2YjcGgM7EuuTCSvQuTCioSSThYBqrRwPxfQ4nhw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568385;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=DlW8869YgbQ7b/dFXUZq70NRQ3QZ7VjwhbTQzGdmgBI=;
	b=sv3Zz7Ca7Dka+jjB3+AIr+geIunMXPPzH8L9winziOCf+Sj/eAN1BeNDCzdSDOvk
	nYerP8gDK/GMTZpH4xNbclrpFd+8WcAscOZD/JOE5ULW54tuGiXZANtSVuX7ljKmD1J
	0/sxtHVm4koGvK2vxj8vssW/vDssFhaK91W7NLn0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 11/12] x86/boot: introduce domid field to struct boot_domain
Date: Sat,  2 Nov 2024 13:25:50 -0400
Message-Id: <20241102172551.17233-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
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
index 6e25a9f726c7..7b78bd9c7c8d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -338,6 +338,9 @@ static struct boot_info *__init multiboot_fill_boot_info(
     /* Variable 'i' should be one entry past the last module. */
     bi->mods[i].type = BOOTMOD_XEN;
 
+    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
+        bi->domains[i].domid = DOMID_INVALID;
+
     return bi;
 }
 
@@ -992,7 +995,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -1008,15 +1010,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


