Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0864794DB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248839.429245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIyQ-0000PA-TQ; Fri, 17 Dec 2021 19:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248839.429245; Fri, 17 Dec 2021 19:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIyQ-0000Mq-QJ; Fri, 17 Dec 2021 19:32:58 +0000
Received: by outflank-mailman (input) for mailman id 248839;
 Fri, 17 Dec 2021 19:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIyP-0007M8-ET
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:32:57 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 218b60b9-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:32:56 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769528258456.9306457825601;
 Fri, 17 Dec 2021 11:32:08 -0800 (PST)
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
X-Inumbo-ID: 218b60b9-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I6IAsMH+jipuMqQCj76mdQ7T9EyWFmW64zRMD1bJXD7ClPf7PcMXJZ9QGGzZaAadxhBVhcFjcvTiogX2AfkRuESNdmj6y6aH7g2v2ZgvsbtEuJ1hVU3UxUjLU0x5pwlzpSlM8zPq1BZUjhYmhPFPjEwSesElfzwFvywscOSWzL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769530; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=g9oPwlQgKMT2hXPARb/PayeIcKtxhGTeD4xffzn8NTM=; 
	b=hQ1/+LhqdE9UaRKlKfiz7YCM+E0fa6PSB4/dDcWWebRhbXW5Nxw9iQHq65Zwh6gt70WQisAhSZwFr6Q91bOxe/ga50Gmk1vMdwXO/So8yf5Ef28X11udIxdutVmdxAMoqSu+5VrCvtJ0Vk/P7F9cfsvWp55kq/pBNXR+rUHbKxw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769530;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=g9oPwlQgKMT2hXPARb/PayeIcKtxhGTeD4xffzn8NTM=;
	b=Khcyh8d1Ra5MFSxWdiC+y3TVEtTDzTTg71udOgNLXTO2ntt5u2DeyIJnoPyQK63/
	uo58/IngQ158gWI7eUfLhCtf2+y6ChkQHnjnfmCK9rhIhc9guXD9kt47q2kntshBaPp
	mOhFXF5YzkxX4xi4+NSQZ8BxoxN6b4tlpVVZBtgo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 03/10] multiboot: moving headroom to per module_t
Date: Fri, 17 Dec 2021 18:34:29 -0500
Message-Id: <20211217233437.13791-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hyperlaunch will require multiple modules to be allocated headroom. Therefore a
headroom variable has been added to module_t for tracking headroom on a per
module_t basis. To provide backwards compatibility with multiboot, the
reserved field was bitfield split to allow it to continue to be used to flag
module was relocated and to add to track the headroom needed when being
relocated.

RFC Note: The approach taken here was to produce something that was acceptable
but likely not the ultimate solution. A more complete solution would likely be
one that looked to unify a cross-architecture approach to represent the
material provided by bootloaders.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/boot/reloc.c   |  1 +
 xen/arch/x86/setup.c        | 17 ++++++++---------
 xen/include/xen/multiboot.h |  3 ++-
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 4f4039bb7c..9c68777db3 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -250,6 +250,7 @@ static multiboot_info_t *mbi2_reloc(u32 mbi_in)
             mbi_out_mods[mod_idx].mod_end = get_mb2_data(tag, module, mod_end);
             ptr = get_mb2_string(tag, module, cmdline);
             mbi_out_mods[mod_idx].string = copy_string(ptr);
+            mbi_out_mods[mod_idx].headroom = 0;
             mbi_out_mods[mod_idx].reserved = 0;
             ++mod_idx;
             break;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 190d7aefb5..4bf84c17e4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -855,7 +855,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page, module_map[1];
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1158,7 +1158,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    mod->headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1321,8 +1321,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         /* Is the region suitable for relocating the multiboot modules? */
         for ( j = mbi->mods_count - 1; j >= 0; j-- )
         {
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            unsigned long size = PAGE_ALIGN(mod[j].headroom + mod[j].mod_end);
 
             if ( mod[j].reserved )
                 continue;
@@ -1335,14 +1334,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 continue;
 
             if ( s < end &&
-                 (headroom ||
+                 (mod[j].headroom ||
                   ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
             {
-                move_memory(end - size + headroom,
+                move_memory(end - size + mod[j].headroom,
                             (uint64_t)mod[j].mod_start << PAGE_SHIFT,
                             mod[j].mod_end, 0);
                 mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += headroom;
+                mod[j].mod_end += mod[j].headroom;
                 mod[j].reserved = 1;
             }
         }
@@ -1369,7 +1368,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( mod->headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < mbi->mods_count; ++i )
     {
@@ -1902,7 +1901,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, modules_headroom,
+    dom0 = create_dom0(mod, mod->headroom,
                        initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
                        kextra, loader);
     if ( !dom0 )
diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
index d1b43e1183..0ae37dfa2b 100644
--- a/xen/include/xen/multiboot.h
+++ b/xen/include/xen/multiboot.h
@@ -108,7 +108,8 @@ typedef struct {
     u32 mod_start;
     u32 mod_end;
     u32 string;
-    u32 reserved;
+    u32 reserved:1;
+    u32 headroom:31;
 } module_t;
 
 /* The memory map. Be careful that the offset 0 is base_addr_low
-- 
2.20.1


