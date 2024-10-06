Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B09921EC
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811417.1224260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFw-0007sw-Io; Sun, 06 Oct 2024 21:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811417.1224260; Sun, 06 Oct 2024 21:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFw-0007nL-Df; Sun, 06 Oct 2024 21:57:36 +0000
Received: by outflank-mailman (input) for mailman id 811417;
 Sun, 06 Oct 2024 21:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZBh-00051E-1d
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:53:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6090b9fa-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:53:11 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251431236817.04787703317;
 Sun, 6 Oct 2024 14:50:31 -0700 (PDT)
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
X-Inumbo-ID: 6090b9fa-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251433; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lh3KVpki89otWeudeeH6H/BP6+EEsTgz29UixmIvZK3bmD+A6DB8m3RwBdWQBfD0FQuvqxhv1FwG0ltWi2p72FXxgFj+KLlvTplusBSft0Gc/7sGjYpY4nd4oYXabOEHYR0mNcyW2zB0VcFcF/apDbg7H4wEot5txFDJJlHqOS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251433; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+2Ke8GYb62UIWjB0JwnvDHRLpWBMoxBl4a1CfrQFltM=; 
	b=ZJx3+cenL9JK8a0gyApg0qIYO++s67R+A6jg2cO3jLc43JiFQc42ILx2UIzB/3gz2/zgwCZb7uHA+dcOO22i/Bz5v62BLnQiiAwG3cG9VMTG1IrBICEFaLXiC+cBlUiNoQbC86YO1SAe8OZ6VvxBOadWrCOk53p4Kq8KKnU8idU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251433;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+2Ke8GYb62UIWjB0JwnvDHRLpWBMoxBl4a1CfrQFltM=;
	b=dXz6sbI74T6TmjMqwbyo0edtylcAQ1m5W7glp/4Ut07IYu/gKqsVxbwiqH8fMTh+
	QXmApr0nQCL3juUMcSxtbxKBL4dQ9p0REa7JEd4M6uMPM+qg0ZISkrgbq9pFlMaxdKE
	GdjJ6EIN3bmi56XcgKrEFTX2nYUCk/vSeds20n2g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 23/44] x86/boot: remove module_map usage from xsm policy loading
Date: Sun,  6 Oct 2024 17:49:34 -0400
Message-Id: <20241006214956.24339-24-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c  | 2 +-
 xen/include/xsm/xsm.h | 9 +++------
 xen/xsm/xsm_core.c    | 6 ++----
 xen/xsm/xsm_policy.c  | 5 +----
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 90acd4180441..b0946216ea3f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1865,7 +1865,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, bi);
+    xsm_multiboot_init(bi);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9e511ef8878c..791936e5285b 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -781,11 +781,9 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(
-    unsigned long *module_map, const struct boot_info *bi);
+int xsm_multiboot_init(struct boot_info *bi);
 int xsm_multiboot_policy_init(
-    unsigned long *module_map, const struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size);
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
@@ -831,8 +829,7 @@ static const inline struct xsm_ops *silo_init(void)
 #include <xsm/dummy.h>
 
 #ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (
-    unsigned long *module_map, const struct boot_info *bi)
+static inline int xsm_multiboot_init(struct boot_info *bi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 69d3800d4c39..0e74b96a4cc7 100644
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
             bootstrap_map(NULL);
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 921bb254b9d1..a22367a62e93 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -32,8 +32,7 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size)
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size)
 {
     int i;
     int rc = 0;
@@ -42,7 +41,6 @@ int __init xsm_multiboot_policy_init(
 
     /*
      * Try all modules and see whichever could be the binary policy.
-     * Adjust module_map for the module that is the binary policy.
      */
     for ( i = bi->nr_modules-1; i >= 1; i-- )
     {
@@ -60,7 +58,6 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
             bi->mods[i].type = BOOTMOD_XSM_POLICY;
             break;
 
-- 
2.30.2


