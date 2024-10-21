Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E779A5847
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822921.1236874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gbN-0003v5-MI; Mon, 21 Oct 2024 00:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822921.1236874; Mon, 21 Oct 2024 00:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gbN-0003t9-JK; Mon, 21 Oct 2024 00:48:53 +0000
Received: by outflank-mailman (input) for mailman id 822921;
 Mon, 21 Oct 2024 00:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gbM-0003Iq-IA
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:48:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c3ef1cb-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:48:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471605922769.1616730146538;
 Sun, 20 Oct 2024 17:46:45 -0700 (PDT)
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
X-Inumbo-ID: 3c3ef1cb-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BhUoykAv0QlunbmRcqPYtKySMSy9xrRdYPBOvgw+GZZoRmHyK+RxdEaVSNZulXOvG8GWJnzZfbxicwxeQrimZxXInJj5/IjX+j7O4u3q2zrFxqI7tFFY1v+4qLZX3fJzrTXPGTNaabmNcBBgkiDRbW0MHPOlu7/qQ9pYxDt8n04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471608; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZZjD4AlskBmTFJGQxv1B5HnCBYZoGhPGwEpU4WRgfog=; 
	b=J4BdJMqbiXxa8CxKKbS0+qX2U82cCngXxAn/5huTQX5nIdswpSqg6v39DWkEl3ZDSDVnkQq2Dzm0pLycnG58dopQYIkbolxn6P2SYmoK1uLM16yZsBiNZIWx4iQtr1p5UFNxo7wt5R3mfm67MnH8EJeam4abPptQCKh7afAlj58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471608;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ZZjD4AlskBmTFJGQxv1B5HnCBYZoGhPGwEpU4WRgfog=;
	b=pu8QZfI1ARA9IDzbkIbj6C4cE6Dfp4G1OSyvl9bi6+qcrVINLMqRMxlDc9B6GPIn
	cpPQgjVrSyn43aq07GYq9WlaMpPh4Q3rwrB9Ryx6ziu7nCA6R5PGsiSiNhXGfg8DTkF
	+2MvNfe/0Spzvwe6MFUGO8IfXc5r+PS86SAHH+cM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 19/38] x86/boot: convert create_dom0 to use boot info
Date: Sun, 20 Oct 2024 20:45:54 -0400
Message-Id: <20241021004613.18793-20-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit changes create_dom0 to no longer take the individual components and
take struct boot_info instead. Internally, it is changed to locate the kernel
and ramdisk details from struct boot_info.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- change headroom back to unsigned long
- make mod_idx unsigned int
---
 xen/arch/x86/setup.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4a482c8aefa4..347b27ad7c6c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -962,10 +962,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
-                                         const char *loader)
+static struct domain *__init create_dom0(const struct boot_info *bi,
+                                         const char *kextra)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -980,9 +978,22 @@ static struct domain *__init create_dom0(const module_t *image,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    unsigned long headroom;
+    unsigned int mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    module_t *image, *initrd;
     struct domain *d;
     domid_t domid;
 
+    /* Map boot_module to mb1 module for dom0 */
+    image = bi->mods[0].mod;
+    headroom = bi->mods[0].headroom;
+
+    /* Map boot_module to mb1 module for initrd */
+    if ( mod_idx < 0 )
+        initrd = NULL;
+    else
+        initrd = bi->mods[mod_idx].mod;
+
     if ( opt_dom0_pvh )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
@@ -1011,7 +1022,7 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( image->string || kextra )
     {
         if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
+            safe_strcpy(cmdline, cmdline_cook(__va(image->string), bi->loader));
 
         if ( kextra )
             /* kextra always includes exactly one leading space. */
@@ -2123,10 +2134,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
-                       initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
-                                                  : NULL,
-                       kextra, bi->loader);
+    dom0 = create_dom0(bi, kextra);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


