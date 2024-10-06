Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079AA9921D6
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811363.1224009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEq-0003bf-7A; Sun, 06 Oct 2024 21:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811363.1224009; Sun, 06 Oct 2024 21:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEp-0003YT-R9; Sun, 06 Oct 2024 21:56:27 +0000
Received: by outflank-mailman (input) for mailman id 811363;
 Sun, 06 Oct 2024 21:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCh-0007Zk-W6
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86674351-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:15 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172825144047617.705943069105388;
 Sun, 6 Oct 2024 14:50:40 -0700 (PDT)
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
X-Inumbo-ID: 86674351-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251442; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e0rup5qfj8UW7i/iFGXqfPAnnPEy3E+3TfdmtqTQrdbEm5IkkHATQLHqFEN7CM8dPPO0zF6whz0yK3Wa+hz8A+wy6AvAZieBtXpz9ow4oK+ayqZaQPX6+58WG7K7RWfyNszYSTFOcF6ueT/lwWvwQBIxgPmELeN813NPLSzDpUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251442; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BmGSuaBaKd3qtvehAz6QI6DFDtdVzluTKF7yLA1UKrY=; 
	b=kkNQdQizSQsesked0oWY82g0FUM7tIdvouhlyEJ5KqKd7zarFB4eydo9erBXe0V8+GdZdNB38GqoHNolfptRPiogD6BkycLnAT68vjOGWBW0SXyyrPwa95vVLKBHi/rc/9UPkkOSxKyOjajuFPxknAk+MbH5qv6GrDqN3Y+fCiY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251442;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=BmGSuaBaKd3qtvehAz6QI6DFDtdVzluTKF7yLA1UKrY=;
	b=gVvarlnL2il/njaqrQD9NyndLOgMrI4ZUEKa6vlMFO/QAh/PrOe7tnQjame1K+Ju
	IAEWZxL1jlYKYxWaJ0M3/cRFKT7lvstpNAp/nqMrSEQPqZVmoz6RMiuqwFw6QRfviIq
	hklX0CL/hOXcvn+J9vye2DHC9zhTCEp7tVNJSltg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 31/44] x86/boot: convert dom0_construct_pvh to struct boot_module
Date: Sun,  6 Oct 2024 17:49:42 -0400
Message-Id: <20241006214956.24339-32-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
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


