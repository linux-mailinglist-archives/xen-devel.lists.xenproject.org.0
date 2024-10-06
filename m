Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0E9921D9
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811373.1224076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZF3-0005th-4z; Sun, 06 Oct 2024 21:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811373.1224076; Sun, 06 Oct 2024 21:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZF2-0005lg-VV; Sun, 06 Oct 2024 21:56:40 +0000
Received: by outflank-mailman (input) for mailman id 811373;
 Sun, 06 Oct 2024 21:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZDf-0007Zk-SN
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:55:15 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa2c19d8-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:55:15 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251449609589.5889422713361;
 Sun, 6 Oct 2024 14:50:49 -0700 (PDT)
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
X-Inumbo-ID: aa2c19d8-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251451; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JlJUmd0TOekQy0zfycMfgmBcPBdofA2dqliJymIVQFL4guAVAhMwdknmlbB5pQFcGubRX2o1mtocpOSuZavS7KMhdjQDcYp0T/wyR6oIUJsxC29I+gG9nDqKLRxMFE5/ihFvvOqN+8nFGxsgcEMZI6CqyV2DhoH/hV44zkHE9nw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251451; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sVdP9gq2A9htJd3rJlMgvzdj4EwJQkEQZWlBQ/0O9Lc=; 
	b=Fsw7UTLm80y0oFSb8nqGBJxXqxI5UIhHEatx3rbFUx+xw0UD7UuCf0V8g8YEORL+bDEnPTfqsqMEKnCp8cBehSc49+gr2QApxMiWF8HGu+8bp5uMKzEwUDpYHVjryQW1II7ucjZOyjThWlJNQ+vXRCJHwjJEXjXbpF95+iBCfLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251451;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=sVdP9gq2A9htJd3rJlMgvzdj4EwJQkEQZWlBQ/0O9Lc=;
	b=g+kwgIWsDoyxniQekARXJ3vbglybUrJHSapjlxf9/RclvFxM/JnH0NAs9oGnS7Ru
	KCHC64QE3x7O1CDPrPcUvVVydjEo4WzyGwT7pxS9Y2Nmbt0yboHEIfUgakeBsA4T+9X
	8/jZhdsc64Pa8U1kHA/6gvmtxFMFx/9Vqh2092Hg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 39/44] x86/boot: introduce domid field to struct boot_domain
Date: Sun,  6 Oct 2024 17:49:50 -0400
Message-Id: <20241006214956.24339-40-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
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
index ad4a1f473f6d..a1204b2bd594 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -318,6 +318,9 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
     bi->mods[bi->nr_modules].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
+    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
+        bi->domains[i].domid = DOMID_INVALID;
+
     return bi;
 }
 
@@ -959,7 +962,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -975,15 +977,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


