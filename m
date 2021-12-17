Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED54794F4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248885.429323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJ4o-0004ao-HM; Fri, 17 Dec 2021 19:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248885.429323; Fri, 17 Dec 2021 19:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJ4o-0004Xj-Cp; Fri, 17 Dec 2021 19:39:34 +0000
Received: by outflank-mailman (input) for mailman id 248885;
 Fri, 17 Dec 2021 19:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIzq-0008Bq-Nq
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:34:26 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5730ecc9-5f70-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 20:34:25 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769537988673.3922656446274;
 Fri, 17 Dec 2021 11:32:17 -0800 (PST)
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
X-Inumbo-ID: 5730ecc9-5f70-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; t=1639769539; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SN9tTyT2zwY2lOr0z0ysHo/VS/72rE5opud8fZhI77td4LQ144T48gZMOuw/PnS2bJuPu0i6LPr6AmLr353q/cnvg5FQJ4dZ7EwtbDjFvYbBmu6h2S77kH2jwes5PTRscxOqmA3g8BXmtTqLqoK8IlZ9y+AbrL2xW7EiFs1/MeA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769539; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jwECCbUo2nQZxRvb7JqeHbk/5gA0ySBH1Pa0syLScWY=; 
	b=CLXiw5Pjg2JnmotSAxt/N/xJsY6kXNuhQL8lxceZwp3IHFnXEkWx8PSQe5UnWhaolTtXRCnkAj1ch3rmdyEIh9smWojjI6sHWsObViLU28Cbsm4QO0d+di6rcYjQjO/L7uz5sBBlpFmfEGy3F0gVdLEIXfM7DG/ISIrWrxugm9A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769539;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jwECCbUo2nQZxRvb7JqeHbk/5gA0ySBH1Pa0syLScWY=;
	b=L258LMmqN+sntWZC+xo0y75MDFpm1U/v8NR/PlZiv3+LP0ZazyMffu3KprdcN5qF
	XjS/C+z4rmFYg4q/jE6ZXTUaMc3SgDxHYD6oR2uqkVYPb+YRsqRPrngK+aj8tQigM+j
	xawyLUYmZUj5xv8XL3Ms9aZzIR5gHQPTxltrYVA0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 10/10] hyperlaunch: integrate dtb parse and domain creation
Date: Fri, 17 Dec 2021 18:34:36 -0500
Message-Id: <20211217233437.13791-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces into x86 start_xen the detection and parsing of a
hyperlaunch DTB file and then using that information to construct the domains
contained in the hyperlaunch configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/setup.c | 54 ++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index bee221d5ee..c007c421b0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1020,6 +1020,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     bitmap_fill(module_map, mbi->mods_count);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
 
+    if ( hyperlaunch_mb_init(mod) )
+        printk(XENLOG_INFO "Hyperlaunch enabled\n");
+
     if ( pvh_boot )
     {
         /* pvh_init() already filled in e820_raw */
@@ -1142,6 +1145,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             panic("Bootloader didn't honor module alignment request\n");
         mod[i].mod_end -= mod[i].mod_start;
         mod[i].mod_start >>= PAGE_SHIFT;
+        mod[i].headroom = 0;
         mod[i].reserved = 0;
     }
 
@@ -1158,8 +1162,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
     }
 
-    mod->headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
-    bootstrap_map(NULL);
+    if ( hyperlaunch_enabled ) {
+        hyperlaunch_mb_headroom();
+    } else {
+        mod->headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+        bootstrap_map(NULL);
+    }
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
@@ -1890,22 +1898,34 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, mbi->mods_count);
-    if ( !hyperlaunch_enabled &&
-         bitmap_weight(module_map, mbi->mods_count) > 1 )
-        printk(XENLOG_WARNING
-               "Multiple initrd candidates, picking module #%u\n",
-               initrdidx);
+    if ( hyperlaunch_enabled )
+    {
+        uint32_t ndoms;
 
-    /*
-     * We're going to setup domain0 using the module(s) that we stashed safely
-     * above our heap. The second module, if present, is an initrd ramdisk.
-     */
-    dom0 = create_dom0(mod, mod->headroom,
-                       initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
-                       kextra, loader);
-    if ( !dom0 )
-        panic("Could not set up DOM0 guest OS\n");
+        printk(XENLOG_INFO "Hyperlaunch starting domain construction...\n");
+        ndoms = hyperlaunch_create_domains(&dom0, kextra, loader);
+        if ( ndoms == 0 )
+            panic("Hyperlaunch could not set up the domains\n");
+
+        printk(XENLOG_INFO "Hyperlaunch created %u domains\n", ndoms);
+    } else {
+        initrdidx = find_first_bit(module_map, mbi->mods_count);
+        if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
+            printk(XENLOG_WARNING
+                   "Multiple initrd candidates, picking module #%u\n",
+                   initrdidx);
+
+        /*
+         * We're going to setup domain0 using the module(s) that we stashed
+         * safely above our heap. The second module, if present, is an initrd
+         * ramdisk.
+         */
+        dom0 = create_dom0(mod, mod->headroom,
+                           initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
+                           kextra, loader);
+        if ( !dom0 )
+            panic("Could not set up DOM0 guest OS\n");
+    }
 
     heap_init_late();
 
-- 
2.20.1


