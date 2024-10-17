Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9149A2AC0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821049.1234855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBE-0006qQ-QF; Thu, 17 Oct 2024 17:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821049.1234855; Thu, 17 Oct 2024 17:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UBE-0006n6-NG; Thu, 17 Oct 2024 17:20:56 +0000
Received: by outflank-mailman (input) for mailman id 821049;
 Thu, 17 Oct 2024 17:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tym-00014B-Dl
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:04 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cce03bf-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:08:01 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184654449478.7806231697002;
 Thu, 17 Oct 2024 10:04:14 -0700 (PDT)
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
X-Inumbo-ID: 5cce03bf-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184656; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BlgBeqvn+5njIBvSNaCrFnXfqcjRi9m0UBXa6PxjfXpvZzE0QwNpMivSL8ZtGGpLd38Xry+JuznYGJ4Ns18e8nif6bTgUCzlbp2pooTphmbOqBrZlsUHf2dCVxkZpAbhGlxcfEpgXczcQcR2dbjzGRsElEE6qHgqZQzNQHz+nYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184656; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F4Lz7sqO+ktRyIvGIcZPYbApzi/uegkQRLWv0yMSK6A=; 
	b=i1cQlB2zdS+kuEpuagXx7vqCgMt2tUD0HHdNwjMdZ5IzSWteDP7CpMl1tTLo67j27blkl4EfmBkJIgQMKVE9G5Uvt4RBkkepJIumO+TmmIy2SOEQ/Je2FAGk5EkLR1krxTpsfhyM1Vxr09ktOg4Tc9KCQ8MdFk0EZ9yIpiO4cQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184656;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=F4Lz7sqO+ktRyIvGIcZPYbApzi/uegkQRLWv0yMSK6A=;
	b=SWjNeTJDj4gjiqiwKRVV+QEHiABcJX5F7SYtw8CGejLsHocWv8fGgt+nbdPVaOLw
	5sN38TetRvO1d87E+6R56E6cnSllqkElbnrWU28tYq5E2uwaYjJT79y+DOcV1QnNSKj
	jEtIr/V/xUPFKYaBB8JKDQ2317HCBZMH3P4Nyx4I=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 31/44] x86/boot: convert dom0_construct_pvh to struct boot_module
Date: Thu, 17 Oct 2024 13:03:11 -0400
Message-Id: <20241017170325.3842-32-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/dom0_build.c             |  3 +--
 xen/arch/x86/hvm/dom0_build.c         | 11 +++++------
 xen/arch/x86/include/asm/dom0_build.h |  7 +++----
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 1d05ee53a6d8..71b2e3afc1a1 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -610,8 +610,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image->mod, image->headroom, initrd->mod,
-                                cmdline);
+        rc = dom0_construct_pvh(d, image, initrd, cmdline);
     else if ( is_pv_domain(d) )
         rc = dom0_construct_pv(d, image, initrd, cmdline);
     else
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3dd913bdb029..beaa1d492077 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1300,10 +1300,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct domain *d, const module_t *image,
-                              unsigned long image_headroom,
-                              module_t *initrd,
-                              const char *cmdline)
+int __init dom0_construct_pvh(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, const char *cmdline)
 {
     paddr_t entry, start_info;
     int rc;
@@ -1347,8 +1346,8 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image->mod, image->headroom, initrd->mod,
+                         bootstrap_map_bm(image), cmdline, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 2ce5ea3851af..8f7b37f3d308 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -17,10 +17,9 @@ int dom0_construct_pv(
     struct domain *d, const struct boot_module *image,
     struct boot_module *initrd, const char *cmdline);
 
-int dom0_construct_pvh(struct domain *d, const module_t *image,
-                       unsigned long image_headroom,
-                       module_t *initrd,
-                       const char *cmdline);
+int dom0_construct_pvh(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, const char *cmdline);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
-- 
2.30.2


