Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05387966B8A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786705.1196387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Vx-0003Ox-Gv; Fri, 30 Aug 2024 21:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786705.1196387; Fri, 30 Aug 2024 21:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Vx-0003MY-Cy; Fri, 30 Aug 2024 21:50:41 +0000
Received: by outflank-mailman (input) for mailman id 786705;
 Fri, 30 Aug 2024 21:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Vw-0002pb-GT
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4722501-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:50:39 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054484953288.2781406902028;
 Fri, 30 Aug 2024 14:48:04 -0700 (PDT)
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
X-Inumbo-ID: e4722501-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054486; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fMBteAsI13MSUK4JhY2EasizYgJhcij4MN1c+5n7gd7nE0l0SsZ39qCofDWdb6+oc1ziSm+bhYHl7Tqhpp1jAWILiIsY4EJl5Iqzl+vFt1coeIA01Glqcj88pXe4SAZ6HMDk6EOg71np5el8QBgH6VBeFZYcdCWHCWNBiRRNPZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054486; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CWEMixDJY7x4MLnQ/ZkZHLIFrIhvLWgtbDqN9QKbuu4=; 
	b=QolIQEHusFGH/1c7zyLjewOEij4pwbIQ/uWsxESAEJNd6uDb3Lc9h36BVXidVBERvSGb8c2HLTynoBN+5KUbTUCjSPdhbZZjeKO/YTJhXY3Xuc+rqXejjtuLRYpCH9f4j2RhNRJ+IJ5W4d6a+/8JK0HC/9yzY6j199exdjt/Ups=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054486;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=CWEMixDJY7x4MLnQ/ZkZHLIFrIhvLWgtbDqN9QKbuu4=;
	b=gsUanQnsMQJRxhBKO4nK+31N6TJynts15cxFfqcmbWbFQv7dk50npWV3qnrlwqzs
	NVnQ+aBuuQU01qZX3glUcgQrcVwcvxaFnOqXRv602/idE0jzHlt0ER55B0y6X15ruBw
	jBhn8VggWGLyLrrlGqgRSlJ/3dLAq8PQHscyZxBI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 23/44] x86/boot: remove module_map usage from xsm policy loading
Date: Fri, 30 Aug 2024 17:47:08 -0400
Message-Id: <20240830214730.1621-24-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
index 541a956923d3..90c2ddb3728a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1878,7 +1878,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, boot_info);
+    xsm_multiboot_init(boot_info);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9e511ef8878c..3f05d09880d8 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -781,11 +781,9 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(
-    unsigned long *module_map, const struct boot_info *bi);
+int xsm_multiboot_init(const struct boot_info *bi);
 int xsm_multiboot_policy_init(
-    unsigned long *module_map, const struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size);
+    const struct boot_info *bi, void **policy_buffer, size_t *policy_size);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
@@ -831,8 +829,7 @@ static const inline struct xsm_ops *silo_init(void)
 #include <xsm/dummy.h>
 
 #ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (
-    unsigned long *module_map, const struct boot_info *bi)
+static inline int xsm_multiboot_init(const struct boot_info *bi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 9f87ec4f6754..f816c94fb5aa 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -140,8 +140,7 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 }
 
 #ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_init(
-    unsigned long *module_map, const struct boot_info *bi)
+int __init xsm_multiboot_init(const struct boot_info *bi)
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
index e4c94afd108d..ac09dd808b27 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -32,8 +32,7 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, const struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size)
+    const struct boot_info *bi, void **policy_buffer, size_t *policy_size)
 {
     int i;
     int rc = 0;
@@ -42,7 +41,6 @@ int __init xsm_multiboot_policy_init(
 
     /*
      * Try all modules and see whichever could be the binary policy.
-     * Adjust module_map for the module that is the binary policy.
      */
     for ( i = bi->nr_mods-1; i >= 1; i-- )
     {
@@ -60,7 +58,6 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
             bi->mods[i].type = BOOTMOD_XSM_POLICY;
             break;
 
-- 
2.30.2


