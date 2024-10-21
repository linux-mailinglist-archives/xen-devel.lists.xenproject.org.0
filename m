Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF919A5844
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822908.1236855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gb8-0002uk-8x; Mon, 21 Oct 2024 00:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822908.1236855; Mon, 21 Oct 2024 00:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gb8-0002rB-4n; Mon, 21 Oct 2024 00:48:38 +0000
Received: by outflank-mailman (input) for mailman id 822908;
 Mon, 21 Oct 2024 00:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gb6-0001i1-JM
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:48:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3353eecb-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:48:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471603538750.0207690703996;
 Sun, 20 Oct 2024 17:46:43 -0700 (PDT)
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
X-Inumbo-ID: 3353eecb-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X4s3eIQ14tZWKHqkKLPMrGe3CIVkwuXN4KvYLbrgervkjM3mcQH/HYkgGTnNVovltcXzbN5fZb1yu2knYvzvSEPzc6rEWDz5my1pWEX/n2JdzZrnMqcHWimuaCBCEgBSzIXaN4uwSEjNPXVeaGLp+K+5jPcgeAkZ5Y1czBOnWeA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471606; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yhLw3VJzc36B+i3/OvCwWtKAEdp06v39PF++zo/ehfw=; 
	b=Xf46jjNQrPvREwCQYthNg3zmsjbrIFGOko19Y0ng6aUd/Ez9iFvm9VX0C2kiS3dPKagfAvkb0FkLWh62JfOt2ePQY6UZvUnhfqhTKG2Py5r9qbXHFVSeqDHXsh3jcyZlshODibl+IfN88UbAlPjZIl6Dli3vne5+VOvRyZfdolQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471606;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=yhLw3VJzc36B+i3/OvCwWtKAEdp06v39PF++zo/ehfw=;
	b=n9QYn8gCMsKqiePXlsaqdnDbpcy+na+8vvwFTe1IrpXYDS63W4CfZuW558Pm2hH9
	njZcUjN8/V5+T1fZsFWtm7w2ALp4b9uPdRBY0jg20J99bacE33InNQL/yTKMs5Cqjax
	N0ZOs4VD7G79iuvqX+siyEoEGAPMvXn3+b4I1kEw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 17/38] x86/boot: remove module_map usage from xsm policy loading
Date: Sun, 20 Oct 2024 20:45:52 -0400
Message-Id: <20241021004613.18793-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- adjust comment to coding style
---
 xen/arch/x86/setup.c  | 2 +-
 xen/include/xsm/xsm.h | 9 +++------
 xen/xsm/xsm_core.c    | 6 ++----
 xen/xsm/xsm_policy.c  | 4 +---
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7fdbe57ca1c3..84d6981f4e77 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1882,7 +1882,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, bi);
+    xsm_multiboot_init(bi);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index f155d10e718c..791936e5285b 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -781,11 +781,9 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(
-    unsigned long *module_map, struct boot_info *bi);
+int xsm_multiboot_init(struct boot_info *bi);
 int xsm_multiboot_policy_init(
-    unsigned long *module_map, struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size);
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
@@ -831,8 +829,7 @@ static const inline struct xsm_ops *silo_init(void)
 #include <xsm/dummy.h>
 
 #ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (
-    unsigned long *module_map, struct boot_info *bi)
+static inline int xsm_multiboot_init(struct boot_info *bi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 234b39de7a1d..d58042a1fa4a 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -140,8 +140,7 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 }
 
 #ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_init(
-    unsigned long *module_map, struct boot_info *bi)
+int __init xsm_multiboot_init(struct boot_info *bi)
 {
     int ret = 0;
     void *policy_buffer = NULL;
@@ -151,8 +150,7 @@ int __init xsm_multiboot_init(
 
     if ( XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, bi, &policy_buffer,
-                                        &policy_size);
+        ret = xsm_multiboot_policy_init(bi, &policy_buffer, &policy_size);
         if ( ret )
         {
             bootstrap_map_bm(NULL);
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 9fb8563eb571..f1c94702f6e0 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -32,8 +32,7 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size)
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size)
 {
     int rc = 0;
     u32 *_policy_start;
@@ -57,7 +56,6 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(boot_module_index(bi, bm), module_map);
             bm->type = BOOTMOD_XSM_POLICY;
             break;
 
-- 
2.30.2


