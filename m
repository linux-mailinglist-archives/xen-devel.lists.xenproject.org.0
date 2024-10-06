Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE99921E8
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811413.1224226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFl-0005vg-4S; Sun, 06 Oct 2024 21:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811413.1224226; Sun, 06 Oct 2024 21:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFk-0005n2-Us; Sun, 06 Oct 2024 21:57:24 +0000
Received: by outflank-mailman (input) for mailman id 811413;
 Sun, 06 Oct 2024 21:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCS-0007Zk-93
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d297a9e-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:53:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251438140394.0842588354635;
 Sun, 6 Oct 2024 14:50:38 -0700 (PDT)
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
X-Inumbo-ID: 7d297a9e-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251440; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GA8nJhzzWC/DSUASsPXxy+TDlmruTa7NuHPxxtbBHUHVWqDDhsoEAzW/9qpVTrGdRlV57dr01UmNYN9SuBw0EbyGJpOvAdm0PX4MjDA/d3mimfPqPv0vT90ZCqpCeLbd4M313Godt0fIFOpdvwaVug9U8EekJISc0fF5+u3hLPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251440; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Fh/7Uk3Vw+tb0Y+Dui/MHmomzSneFUYlu0DymL9u5VQ=; 
	b=Z/nNqAxRmVxwXoVkrDpkjmB5zZAn1jQlykm5+Ah2gWfVg/Yeuz8mUIi0H9kZhy+mCO7F3BZhQbCaBshxbfd5FXbMcmsjXGPiWLk4R2mr61Wx6+zcUl/68h8n8WBc80cTM+ZEj7mfAZUjABE43oNbTCbUDsi4X+Wwm3JybT4c0kM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251440;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Fh/7Uk3Vw+tb0Y+Dui/MHmomzSneFUYlu0DymL9u5VQ=;
	b=DZ871kCoeXOh6seUZdQULPWGkZLcXmSqefp2kAVtO/YRAwoH6FJZRCWH5HhYggc2
	YxnHzObonYO6S0gIL5jSJBv4iHnZyl6MuCIhmz4Ik6SZfPNHQGI2BkO8/YvszkSJIkq
	jVOcIxrGSI+tyA5q7nAOrBQSuAugCw8XaFfn8e+o=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 29/44] x86/boot: convert dom0_construct_pv image param to struct boot_module
Date: Sun,  6 Oct 2024 17:49:40 -0400
Message-Id: <20241006214956.24339-30-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes the type for the image parameter of dom0_construct_pv to be struct
boot_module. Removing the usage of early_mod field for kernel module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             |  3 +--
 xen/arch/x86/include/asm/dom0_build.h |  7 +++----
 xen/arch/x86/pv/dom0_build.c          | 14 ++++++--------
 3 files changed, 10 insertions(+), 14 deletions(-)

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
index 262edb6bf2f0..7b6afe64d799 100644
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


