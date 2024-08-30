Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA47966B92
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786723.1196417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Xw-0005cO-9d; Fri, 30 Aug 2024 21:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786723.1196417; Fri, 30 Aug 2024 21:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Xw-0005aU-5u; Fri, 30 Aug 2024 21:52:44 +0000
Received: by outflank-mailman (input) for mailman id 786723;
 Fri, 30 Aug 2024 21:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Xu-0005aM-So
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d0ecb87-671a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:52:41 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054502153808.9241274770283;
 Fri, 30 Aug 2024 14:48:22 -0700 (PDT)
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
X-Inumbo-ID: 2d0ecb87-671a-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HQc/8Mpes7nky1IqTnmc7WcSNsdXEdetXZNaGZMrV3ObGjL9HzhgtIDvnmOp0jZqs55UI4JZf4dO/NSgiLBX2P0CIWRYauWHowYmeNO6rXIBBPrwoCUivc5qBxeEYb6j9uW3nL+q9ct3+pqm8LZVA5fyB0EFIFA10NGe09Rw0as=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054504; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=feqDlwU7EGLLtvhfulZ1x0mRALgPHN///oYnW4IFKWA=; 
	b=a2pxoqUMt5aHGMs71XhzBzZq7qxLsNQYRpN8qfLkTQ4fy6OqBeJ1kItKz/3oP2fx5pz/HL8Xtmq3EspRq0t38yLYlqrDbCO1d8ICw/V0/P/uzKFbpZNXSxKzEswcoAThQJw4885YODAYop6k8RhAXQvG5hiz7dEsTkfBiu4PWEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054504;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=feqDlwU7EGLLtvhfulZ1x0mRALgPHN///oYnW4IFKWA=;
	b=P7jsgqlg6tmxb9gsrZXaupZa0AdgOxCLm/Cmg3KqyoABo6g2PbcZyShtGec57SSr
	ZtO5rJLvQi1ZXd4nesUHE/lhkUzJ6vELNpBoEqd1vLRugqzBZ9wRyyMTsCx4gKdz3Tw
	UfHQ2WTWo5VHV9UySk4SRuZMmnVZcoCl1Bxim+Jo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 39/44] x86/boot: introduce domid field to struct boot_domain
Date: Fri, 30 Aug 2024 17:47:24 -0400
Message-Id: <20240830214730.1621-40-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a domid field to struct boot_domain to hold the assigned domain id for the
domain. During initialization, ensure all instances of struct boot_domain have
the invalid domid to ensure that the domid must be set either by convention or
configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootdomain.h |  2 ++
 xen/arch/x86/setup.c                  | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 4285223ac5ab..d6264d554dba 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -11,6 +11,8 @@
 struct boot_module;
 
 struct boot_domain {
+    domid_t domid;
+
     struct boot_module *kernel;
     struct boot_module *ramdisk;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 77abed637ff2..43b588d4d105 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -322,6 +322,9 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
     boot_mods[info.nr_mods].type = BOOTMOD_XEN;
     boot_mods[info.nr_mods].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
+    for ( i=0; i < MAX_NR_BOOTDOMS; i++ )
+        boot_doms[i].domid = DOMID_INVALID;
+
     info.domains = boot_doms;
 
     boot_info = &info;
@@ -963,7 +966,6 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -979,15 +981,15 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
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
     if ( bd->kernel->cmdline || bi->kextra )
-- 
2.30.2


