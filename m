Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C18966BB5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786843.1196657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c1-0002sh-ME; Fri, 30 Aug 2024 21:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786843.1196657; Fri, 30 Aug 2024 21:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c1-0002jz-Gu; Fri, 30 Aug 2024 21:56:57 +0000
Received: by outflank-mailman (input) for mailman id 786843;
 Fri, 30 Aug 2024 21:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Wt-0000Zf-HG
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0776c7e4-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:37 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054493481659.7029863364719;
 Fri, 30 Aug 2024 14:48:13 -0700 (PDT)
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
X-Inumbo-ID: 0776c7e4-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054495; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BUNATfUWScvd3LlCBz3oxWB4klY/a/ZFb0WrEEDkSF1GeZbYQ4cx7aKlbgUepwKpLrjCafVTI3ekJXbpJ8NMG4L8Aci498e7XlzGhrGpy4vhnpkkMOV4W1zNMwcu+9ApTU2BPuTbieZo3wytTXmmtAt5eP4ndwqAXkM77MEg1vk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054495; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eI2uOeGg/sx1MKwSvVvpZfm5vXW9RsarhqsgbbBK1us=; 
	b=SuKImHLz4umEcAcUr/53zbcU+rZYyhC59Ls2qWQlTDMotkWNlUjgsRg2cc43J6+Cr2OtYrl3qBPR6k/NE+7fL/mQax7RhPy7pS7Q3SsI64nioQ4XQbFEq1tkAg900G6jnlyYWlqH3jHvZX4OPrsg5OlbJacurXIZXnC0gNU5Ytw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054495;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=eI2uOeGg/sx1MKwSvVvpZfm5vXW9RsarhqsgbbBK1us=;
	b=uqc1l1dU+Rth/KAcN0NmNpMZpz42q7mguQYej0hai0CntRWZ1sIUhkcFCLPOgKrN
	AU+xWY0U7N3P2x9d8iPIWU4WzF5UCe33b7lbt1mNuukzkq6WTsPR9gTKMRa0O9tFnND
	h5TiCNPIIFMfJgxVBoGpDJYsIVOkVyg+p+ivSwyw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 31/44] x86/boot: convert dom0_construct_pvh to struct boot_module
Date: Fri, 30 Aug 2024 17:47:16 -0400
Message-Id: <20240830214730.1621-32-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             |  2 +-
 xen/arch/x86/hvm/dom0_build.c         | 11 +++++------
 xen/arch/x86/include/asm/dom0_build.h |  7 +++----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index c39588b346b0..71b2e3afc1a1 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -610,7 +610,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image->early_mod, image->headroom, initrd->early_mod, cmdline);
+        rc = dom0_construct_pvh(d, image, initrd, cmdline);
     else if ( is_pv_domain(d) )
         rc = dom0_construct_pv(d, image, initrd, cmdline);
     else
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index f3eddb684686..1579034ebfc0 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1285,10 +1285,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
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
@@ -1332,8 +1331,8 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image->early_mod, image->headroom, initrd->early_mod,
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


