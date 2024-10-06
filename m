Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18E9921E5
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811400.1224155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFP-0001oM-V6; Sun, 06 Oct 2024 21:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811400.1224155; Sun, 06 Oct 2024 21:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFP-0001kR-RL; Sun, 06 Oct 2024 21:57:03 +0000
Received: by outflank-mailman (input) for mailman id 811400;
 Sun, 06 Oct 2024 21:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZBx-0007Zk-GA
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:53:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab2c9e8-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:53:28 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251433564220.8251256642435;
 Sun, 6 Oct 2024 14:50:33 -0700 (PDT)
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
X-Inumbo-ID: 6ab2c9e8-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251435; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R7MHXd/ljkarvCOOawrZJvHqwLEN6qXibQo25E8vRWWTvGcMktXzk/FiWCfCVumdrbXZ6MlAZ7FW7qeEjGGgRt88e3BZTidR6zscT1XZ8+DCp+hD1m8ethNd5YMalhbK5/JOiBs55/bPxS8Q6ruNMneiPuZObqEMWE+kdPWEZiU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251435; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zja2KfbtQhgM7evcwk5V6CujBNK+2yO+oACiE8xCgoo=; 
	b=AjEgxvRqeUbeUw3EX5IDrUd2AlGGyVhk7JJgfAIqh6ky4LVswxRHCBtAYvw4x2bpgk3004DLWmBOXQBH5WIGjSBRyIxK6I8vjnu1fSMdHaxwy7lPuTGHPxbmizkcCAvYWb68Is6fQCrR6b8ORE8UFMVY4vMfKEMoFoMyGNGTe3M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251435;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=zja2KfbtQhgM7evcwk5V6CujBNK+2yO+oACiE8xCgoo=;
	b=aJC5SQJjPj2UiKQ5rMjoqsPbNa8Rq9bLZ/zJzlWjZ9Rbd65oCD3Gee5lDuQvBQVi
	IZJArVQjbtNEtmU3zOc+dxhdMQ0wCArin+jWhy2RQYV6fAU2clVOxTdIMsW6oEzthqU
	qJ2uKVU7q3Pa9Z0w/lxFw1lLGBpC06hApMeaUGmg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 25/44] x86/boot: convert create_dom0 to use boot info
Date: Sun,  6 Oct 2024 17:49:36 -0400
Message-Id: <20241006214956.24339-26-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit changes create_dom0 to no longer take the individual components and
take struct boot_info instead. Internally, it is changed to locate the kernel
and ramdisk details from struct boot_info.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0d2ee19998aa..c2bcddc50990 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -946,10 +946,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
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
 
@@ -964,9 +962,21 @@ static struct domain *__init create_dom0(const module_t *image,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    int headroom, mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
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
@@ -995,7 +1005,7 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( image->string || kextra )
     {
         if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
+            safe_strcpy(cmdline, cmdline_cook(__va(image->string), bi->loader));
 
         if ( kextra )
             /* kextra always includes exactly one leading space. */
@@ -2106,10 +2116,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
-                       (initrdidx >= 0 && initrdidx < bi->nr_modules) ?
-                            bi->mods[initrdidx].mod : NULL,
-                       kextra, bi->loader);
+    dom0 = create_dom0(bi, kextra);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


