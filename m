Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C19921CF
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811350.1223970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZE6-0001wT-Rd; Sun, 06 Oct 2024 21:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811350.1223970; Sun, 06 Oct 2024 21:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZE6-0001uv-O5; Sun, 06 Oct 2024 21:55:42 +0000
Received: by outflank-mailman (input) for mailman id 811350;
 Sun, 06 Oct 2024 21:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZE4-0001uL-Uc
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:55:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8661ecd-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:55:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251453021201.06087713384034;
 Sun, 6 Oct 2024 14:50:53 -0700 (PDT)
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
X-Inumbo-ID: b8661ecd-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dOZopKojpuUEaMeIzR4cTDvLB32F4XuRU38OeKgMrGsk0EP3vccZK5qQVMoBnf2ReIHrI+Nv5QACJIoQsIomdVRObVZeGEWwkr+1CZG5+pYi1dBSm8WqLCzLqNz8cpfyVcJOJEA18a4xRj4nmSkwrXsl68cH+sFd5j8FV+EN910=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251454; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Q7gPOcTOOjpreqScRGkoQBD1OTSB+7KpnKBZPYI7Vk=; 
	b=MynRpxQF4nFVFgXCYoNdqz5jUW1TPLk1/qRCAoHrylXqVur0YP+igkswiBl1nzrFtaZvlZ/uVkZtzdo0d3VrRgcJvbq2Qq5fOqkgQI9uMh3/anlYuQkxCcKSqD1mfefIcdmA0htD23K1vi6kB6YA5L1E8LB9PfgpD8dzG3JUYFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251454;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7Q7gPOcTOOjpreqScRGkoQBD1OTSB+7KpnKBZPYI7Vk=;
	b=NGrYi0QQ/eIh0p1DkUfWvt/gg7u6JcMxuV8C1MdQDhWnvVc6fS+arIVZ/zrwJCN+
	CwtT8HnIIDP7Bpf061wiRdGCCXOVSpDGUtWrjuqglxLPfAzZ8QkBb0SNEb3fECLLeqG
	sGPPbsfr4EbW5wBaX7bA242Wpa9h4ZpEjYFszMXg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 42/44] x86/boot: convert construct_dom0 to struct boot_domain
Date: Sun,  6 Oct 2024 17:49:53 -0400
Message-Id: <20241006214956.24339-43-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A struct boot_domain now encapsulates the domain reference, kernel, ramdisk,
and command line for the domain being constructed. As a result of this
encapsulation, construct_dom0 can now take a single struct boot_domain instead
of these four parameters.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c        | 19 +++++++++----------
 xen/arch/x86/include/asm/setup.h |  4 +---
 xen/arch/x86/setup.c             |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 71b2e3afc1a1..e552f2e9abef 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -597,22 +597,21 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const struct boot_module *image,
-                          struct boot_module *initrd, const char *cmdline)
+int __init construct_dom0(struct boot_domain *bd)
 {
     int rc;
 
     /* Sanity! */
-    BUG_ON(!pv_shim && d->domain_id != 0);
-    BUG_ON(d->vcpu[0] == NULL);
-    BUG_ON(d->vcpu[0]->is_initialised);
+    BUG_ON(!pv_shim && bd->d->domain_id != 0);
+    BUG_ON(bd->d->vcpu[0] == NULL);
+    BUG_ON(bd->d->vcpu[0]->is_initialised);
 
     process_pending_softirqs();
 
-    if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, initrd, cmdline);
-    else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, initrd, cmdline);
+    if ( is_hvm_domain(bd->d) )
+        rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
+    else if ( is_pv_domain(bd->d) )
+        rc = dom0_construct_pv(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
@@ -620,7 +619,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
         return rc;
 
     /* Sanity! */
-    BUG_ON(!d->vcpu[0]->is_initialised);
+    BUG_ON(!bd->d->vcpu[0]->is_initialised);
 
     return 0;
 }
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 04bf0e62a9d7..6fdb392432ad 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,9 +26,7 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-int construct_dom0(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline);
+int construct_dom0(struct boot_domain *d);
 void setup_io_bitmap(struct domain *d);
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e6a231bd2d42..6ea825b64541 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1013,7 +1013,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         }
     }
 
-    if ( construct_dom0(bd->d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
+    if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     return bd->d;
-- 
2.30.2


