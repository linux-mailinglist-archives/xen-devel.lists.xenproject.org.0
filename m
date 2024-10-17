Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1D9A2A96
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820968.1234714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U8O-0006GU-84; Thu, 17 Oct 2024 17:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820968.1234714; Thu, 17 Oct 2024 17:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U8O-0006ET-59; Thu, 17 Oct 2024 17:18:00 +0000
Received: by outflank-mailman (input) for mailman id 820968;
 Thu, 17 Oct 2024 17:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Txe-0008TH-Dk
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:06:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3453d31c-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:06:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184644453447.45974491621405;
 Thu, 17 Oct 2024 10:04:04 -0700 (PDT)
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
X-Inumbo-ID: 3453d31c-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n+mu8ezXWcs5uab9RtWpeEcNuIZz3J4tj/l91FTvYbwJ5O3gPGdos+RdqiEBiO4+AAz5Um26RWduIIRTMlGlzxSMqd/H+6HEfGUgM9pGc5FpxxHQbtdy70IF6LRi/FtOLcKyCuj3lAQPtTNT3jQp5/eJLJ5bHvu80OLijnnQYWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184646; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=INdU8Vy7H1JFe+GjwDiltbnyksHVP3i84VMPvIn3WAY=; 
	b=IM5m2bZpAHgXSJckzMrAzCyhZWgH94E41bX95fRmC1Nh/rFlgOkfiFKqMhbNMYmTayRi6tYLsTxx6F92p5lrHYyrqN2foBzpUrx70z8xUJyAG9IYG50HoxEaxOxo4NZ3b50zaRMCVk+07NCPvEyFg2QvweEoZ5jUNwOxen9KvuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184646;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=INdU8Vy7H1JFe+GjwDiltbnyksHVP3i84VMPvIn3WAY=;
	b=QkiSudRVf/AxMqRDYQidDSOMYr8nhOeZb8TFC7qKG464V2iRvWqCaW/XQKvPGnyz
	PJKp78zHMrtgPjIfktdSC9X5jy/ZGptWpLFV6094lX+sA4Uh89W+wUbC2MAlu8oLnzJ
	4gLy8aB2swQ/A8SUN+vBw4kT+jqcACMg7aeIRT9s=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 23/44] x86/boot: remove module_map usage from xsm policy loading
Date: Thu, 17 Oct 2024 13:03:03 -0400
Message-Id: <20241017170325.3842-24-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
 xen/xsm/xsm_policy.c  | 9 ++-------
 4 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e1763d7e6548..91110ba96f73 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1863,7 +1863,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
index 6f034f70428d..50b665759aad 100644
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
index 921bb254b9d1..453c81df4a2d 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -32,18 +32,14 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, struct boot_info *bi,
-    void **policy_buffer, size_t *policy_size)
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size)
 {
     int i;
     int rc = 0;
     u32 *_policy_start;
     unsigned long _policy_len;
 
-    /*
-     * Try all modules and see whichever could be the binary policy.
-     * Adjust module_map for the module that is the binary policy.
-     */
+    /* Try all modules and see whichever could be the binary policy. */
     for ( i = bi->nr_modules-1; i >= 1; i-- )
     {
         if ( bi->mods[i].type != BOOTMOD_UNKNOWN )
@@ -60,7 +56,6 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
             bi->mods[i].type = BOOTMOD_XSM_POLICY;
             break;
 
-- 
2.30.2


