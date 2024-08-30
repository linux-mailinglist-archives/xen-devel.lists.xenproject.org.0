Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A3966B88
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786695.1196366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Vi-0002Vw-S7; Fri, 30 Aug 2024 21:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786695.1196366; Fri, 30 Aug 2024 21:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Vi-0002Sx-Or; Fri, 30 Aug 2024 21:50:26 +0000
Received: by outflank-mailman (input) for mailman id 786695;
 Fri, 30 Aug 2024 21:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Vh-0000Zf-8P
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db15f88e-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:50:23 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054482625863.6026282912172;
 Fri, 30 Aug 2024 14:48:02 -0700 (PDT)
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
X-Inumbo-ID: db15f88e-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054484; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZpQugvle45rdXeAfWV4kID5LyxhjVsZlWkEtcWbbKHNTJ6+e9VOPH12tT2oLZN5emnI68vHZva7ndgNSiupWfe4RHjHJzhnNkfGgXFTXr3Fiqyq6rOWIOl3zQ26SbwSixa9Ba4ih70XLObXQ/rN4tIKy9GBpoV06Yg1kkOyJy+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054484; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eet/JYMlrz1AXMqNeYAuxYWhlWnTzhzkBPRDYkxgQbw=; 
	b=Q0HBGubFwAyK2Z2xulPWBWP9X2bwB3YDmZvqXYGhleo6vL37DEs3hAKcMmC8HNLWKnOHtddDHsGFwHW1Xtpyb7O8Dr8kjaZlFj1hzSVOIRnwcAjbLC2/jgYX7cDRyS7dLYw0hKJCQQDQ6jok50SS5VfHX/+aNOKEvMOmxqbn9mo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054484;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=eet/JYMlrz1AXMqNeYAuxYWhlWnTzhzkBPRDYkxgQbw=;
	b=oIpDnyve5SvNNVceia88lUtSdHiR3zWs3MlNAlJ+EVtl/HShQfvig0ZsXlY3SPCd
	8Ad13IouLhb+4CmMKSFYzxW7pVpLXfCF2f3X8uL88S815QfP8e851eH4OWRSme1KFlv
	BdTnjPqR76Ke5Q8+3Pkz+FTujWmLJoKZFHEW0Kt4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 21/44] x86/boot: convert ramdisk locating to struct boot_module
Date: Fri, 30 Aug 2024 17:47:06 -0400
Message-Id: <20240830214730.1621-22-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Locate the first unclaimed struct boot_module and mark it as ramdisk. If there
are any remaining unclaimed struct boot_module instances, report to the
console.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 28b39d23f644..189c45302fab 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2100,20 +2100,30 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, boot_info->nr_mods);
-    boot_info->mods[initrdidx].type = BOOTMOD_RAMDISK;
-    boot_info->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
-    if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
-        printk(XENLOG_WARNING
-               "Multiple initrd candidates, picking module #%u\n",
-               initrdidx);
+    /*
+     * At this point all capabilities that consume boot modules should have
+     * claimed their boot modules. Find the first unclaimed boot module and
+     * claim it as the initrd ramdisk. Do a second search to see if there are
+     * any remaining unclaimed boot modules, and report them as unusued initrd
+     * candidates.
+     */
+    initrdidx = first_boot_module_index(boot_info, BOOTMOD_UNKNOWN);
+    if ( initrdidx >= 0 )
+    {
+        boot_info->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        boot_info->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+        if ( first_boot_module_index(boot_info, BOOTMOD_UNKNOWN) >= 0 )
+            printk(XENLOG_WARNING
+                   "Multiple initrd candidates, picking module #%u\n",
+                   initrdidx);
+    }
 
     /*
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
     dom0 = create_dom0(boot_info->mods[0].early_mod, boot_info->mods[0].headroom,
-                       initrdidx < boot_info->nr_mods ?
+                       (initrdidx >= 0 && initrdidx < boot_info->nr_mods) ?
                             boot_info->mods[initrdidx].early_mod : NULL,
                        kextra, boot_info->boot_loader_name);
     if ( !dom0 )
-- 
2.30.2


