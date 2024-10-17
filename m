Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9132C9A2AB7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821019.1234804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAb-00045n-70; Thu, 17 Oct 2024 17:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821019.1234804; Thu, 17 Oct 2024 17:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAb-00042l-4F; Thu, 17 Oct 2024 17:20:17 +0000
Received: by outflank-mailman (input) for mailman id 821019;
 Thu, 17 Oct 2024 17:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TyW-00014B-0C
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:07:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539bd735-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:07:46 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184651885979.0690248848649;
 Thu, 17 Oct 2024 10:04:11 -0700 (PDT)
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
X-Inumbo-ID: 539bd735-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184654; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HRGzO+0jOKUR/Meq44FRnVuwdp1uY7NXVVZifN8wuadlwVVxglBTFTCIXNOMEB8rFU0Cn23CGQAH8fS9dSLmSFCTH1d6yGrwoYAATRmAnrYE6secvf2XOSYFVcNJo7LjRPhGziCSf9co7ZcIuzcO87Bq5p8e9gtRbnPLhLiriMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184654; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cvWn5Yqu/hyHibZNnNCf1iWRt37Pr6iw0261tw9I/1o=; 
	b=EyN6YhRwhAIouOy4xuxaqLrgtitgsZssr8DVFkozYUmzorXPJYJOFamAt2THm7Jrte3xKEmQtoPsCR4lmvbixRAb3rRQIhzcdNxG+PfoXh6OF0p0/SzBfdFa/BGvCLx6PCpC8oVw8IdIgKxiAWfLv9/AuF94uJVewwyQvBh2+Xo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184654;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=cvWn5Yqu/hyHibZNnNCf1iWRt37Pr6iw0261tw9I/1o=;
	b=TRxOmHrFkMtsK4fC14yETXVYeGzzRVW+9ez0BTMeFHumoA0qnlqc2BDZXyeVWjas
	9aTmOPSvcY6ECR6hWek0Pysc2Vf6JgYRgWMuIp+D9UZI7TI/ds04UiThOcC2CjmnL6L
	WRTXqFpTlEbcBCf5LEOXbS08992Y2zOsx3gLtdN4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 29/44] x86/boot: convert dom0_construct_pv image param to struct boot_module
Date: Thu, 17 Oct 2024 13:03:09 -0400
Message-Id: <20241017170325.3842-30-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes the type for the image parameter of dom0_construct_pv to be struct
boot_module. Removing the usage of early_mod field for kernel module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- replaced bootstrap_map(NULL) with bootstrap_map_bm
---
 xen/arch/x86/dom0_build.c             |  3 +--
 xen/arch/x86/include/asm/dom0_build.h |  7 +++----
 xen/arch/x86/pv/dom0_build.c          | 16 +++++++---------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 1eff3192f72d..54db578dd29f 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -613,8 +613,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
         rc = dom0_construct_pvh(d, image->mod, image->headroom, initrd->mod,
                                 cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image->mod, image->headroom, initrd->mod,
-                               cmdline);
+        rc = dom0_construct_pv(d, image, initrd->mod, cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 107c1ff98367..a1f36f7d360d 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,10 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-int dom0_construct_pv(struct domain *d, const module_t *image,
-                      unsigned long image_headroom,
-                      module_t *initrd,
-                      const char *cmdline);
+int dom0_construct_pv(
+    struct domain *d, const struct boot_module *image,
+    module_t *initrd, const char *cmdline);
 
 int dom0_construct_pvh(struct domain *d, const module_t *image,
                        unsigned long image_headroom,
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 262edb6bf2f0..f59597e50a11 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,8 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
 }
 
 static int __init dom0_construct(struct domain *d,
-                                 const module_t *image,
-                                 unsigned long image_headroom,
+                                 const struct boot_module *image,
                                  module_t *initrd,
                                  const char *cmdline)
 {
@@ -374,9 +373,9 @@ static int __init dom0_construct(struct domain *d,
     unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map(image);
-    unsigned long image_len = image->mod_end;
-    void *image_start = image_base + image_headroom;
+    void *image_base = bootstrap_map_bm(image);
+    unsigned long image_len = image->size;
+    void *image_start = image_base + image->headroom;
     unsigned long initrd_len = initrd ? initrd->mod_end : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
@@ -830,7 +829,7 @@ static int __init dom0_construct(struct domain *d,
         printk("Failed to load the kernel binary\n");
         goto out;
     }
-    bootstrap_map(NULL);
+    bootstrap_map_bm(NULL);
 
     if ( UNSET_ADDR != parms.virt_hypercall )
     {
@@ -1052,8 +1051,7 @@ out:
 }
 
 int __init dom0_construct_pv(struct domain *d,
-                             const module_t *image,
-                             unsigned long image_headroom,
+                             const struct boot_module *image,
                              module_t *initrd,
                              const char *cmdline)
 {
@@ -1072,7 +1070,7 @@ int __init dom0_construct_pv(struct domain *d,
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
+    rc = dom0_construct(d, image, initrd, cmdline);
 
     if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
     {
-- 
2.30.2


