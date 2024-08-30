Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AC966BA0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786748.1196484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bJ-0000uT-HG; Fri, 30 Aug 2024 21:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786748.1196484; Fri, 30 Aug 2024 21:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bJ-0000ke-DH; Fri, 30 Aug 2024 21:56:13 +0000
Received: by outflank-mailman (input) for mailman id 786748;
 Fri, 30 Aug 2024 21:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9We-0000Zf-T1
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe975f19-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:23 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054491309423.19157704731253;
 Fri, 30 Aug 2024 14:48:11 -0700 (PDT)
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
X-Inumbo-ID: fe975f19-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054493; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Em5k1TM7/Bv3Y5RLflF8f0Tgx8xEUzNyQoJtPqZK8r8Xuh9OX4NnuyiVSzUd+2ZyqZuxSiLiC2iNI/mEV8ihfRua029wqL5VrzUrsd8vVSjRIuE3t0tLtqUBV+vKONvQzL6SWHyW1F+Zd6ypTvEI+RhgvPS5WBoek7faJphj+QI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054493; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MquSQeaVrCWxsat0mhr5L62hgcjXnVV+6k/kWhQHcXY=; 
	b=ReWpnUmzkfOtjl723Hc4Ke1Xm9ED7AJw3Q1GvRaCZBGRsIdZ1JSEkvHT5NbNI+y9aWKgaMSyTy2ABECAk003a6HLTjmMv6686E9wEnNnXm0YylMsO0IVH+bDo52/+SzabFbv3Ubvaph66VrGVvIdpY11LE3Y6ypyF/B7miH8QMk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054493;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=MquSQeaVrCWxsat0mhr5L62hgcjXnVV+6k/kWhQHcXY=;
	b=DtYQqFa9eEHPKSuvN8LbUWAdOUrEtAFwYQFxiTFu6R1hfxHjNiwlHKyXjSJNKxPR
	T3P3KvazzeiZ3dFpJQIdlTqtM4cUXoKno8uYlx0aBFUPn3EHHFMvRckonP7+hK/eeC1
	WkjwWUteZiAWE9wteux2wb/T4aCeJr8Qjoo9QVGs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 29/44] x86/boot: convert dom0_construct_pv image param to struct boot_module
Date: Fri, 30 Aug 2024 17:47:14 -0400
Message-Id: <20240830214730.1621-30-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes the type for the image parameter of dom0_construct_pv to be struct
boot_module. Removing the usage of early_mod field for kernel module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             | 2 +-
 xen/arch/x86/include/asm/dom0_build.h | 7 +++----
 xen/arch/x86/pv/dom0_build.c          | 9 ++++-----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index fb1b7e5d11cf..42043230faff 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -612,7 +612,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(d, image->early_mod, image->headroom, initrd->early_mod, cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image->early_mod, image->headroom, initrd->early_mod, cmdline);
+        rc = dom0_construct_pv(d, image, initrd->early_mod, cmdline);
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
index 57e58a02e707..db908ddb78b5 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,8 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
 }
 
 int __init dom0_construct_pv(struct domain *d,
-                             const module_t *image,
-                             unsigned long image_headroom,
+                             const struct boot_module *image,
                              module_t *initrd,
                              const char *cmdline)
 {
@@ -374,9 +373,9 @@ int __init dom0_construct_pv(struct domain *d,
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
-- 
2.30.2


