Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4B9A2A9E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820978.1234735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9W-0007Su-Rj; Thu, 17 Oct 2024 17:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820978.1234735; Thu, 17 Oct 2024 17:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9W-0007Qx-P3; Thu, 17 Oct 2024 17:19:10 +0000
Received: by outflank-mailman (input) for mailman id 820978;
 Thu, 17 Oct 2024 17:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tzm-0008TH-Lk
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:09:06 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 823c5b74-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:09:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17291846641131020.5415294818473;
 Thu, 17 Oct 2024 10:04:24 -0700 (PDT)
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
X-Inumbo-ID: 823c5b74-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184666; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G9sG10XUydhECPLFpPpP4Gj5/KgVJVQcXfRjaOC5oWlrL8zFzWaAKfK73gv8k9j2jB3VDy+Nu9C2t6YdRKkUX0h5zMc7s+Ytqgp/7KOQjjjW+XAVR2unke/Z4+ucXODc71ln7P+KH8v/02qJNBj7HtvFh8Xc1SAuya0TqqBhcX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184666; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BJ5VYIncE7+0Abn8b+L/cjX/uv1rXkaBhM0DRTxUuNQ=; 
	b=OEDj4ZGTx7P0jgg7gqEkpX71lswsW2r7WLNGdghPKfLb+dwez9x0cc5YaEUnA8it8pjzUdylnM+UzdsSL/dlURZB1BoF4cjRfOvzuUtnOJPmz46LCgaeNVBjRlx3BMJuGroGj7pUNuyEpN9pKindfkcMydSUbNHs48Phhw7WM3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184666;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=BJ5VYIncE7+0Abn8b+L/cjX/uv1rXkaBhM0DRTxUuNQ=;
	b=IXRNGp/QEirmwMm1/AiJDtxtQJ802FfZ9h8qYsp9jINm9o7ywTzn36Mg3zvorEXe
	0YnSOm1w+xfCCh9bf1Pa1YtAc5TDnW8KbXRa2ztLVfUTBeNGZ/r2hlZR+qdfxPtrmLb
	WikeVFtcw3/ErWtTF8l5Jd/a66LwvC+LTCoM87sw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 39/44] x86/boot: introduce domid field to struct boot_domain
Date: Thu, 17 Oct 2024 13:03:19 -0400
Message-Id: <20241017170325.3842-40-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
index ccb5052e18be..e74526e20b5b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -318,6 +318,9 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
     bi->mods[bi->nr_modules].flags = BOOTMOD_FLAG_X86_CONSUMED;
 
+    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
+        bi->domains[i].domid = DOMID_INVALID;
+
     return bi;
 }
 
@@ -958,7 +961,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     };
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
-    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -974,15 +976,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


