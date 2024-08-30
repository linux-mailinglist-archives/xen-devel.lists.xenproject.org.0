Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5581966BA3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786759.1196518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bS-0002wb-U7; Fri, 30 Aug 2024 21:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786759.1196518; Fri, 30 Aug 2024 21:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bS-0002kK-Mc; Fri, 30 Aug 2024 21:56:22 +0000
Received: by outflank-mailman (input) for mailman id 786759;
 Fri, 30 Aug 2024 21:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9UM-00065G-PO
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa3bf009-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:01 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 172505447081714.54061475318008;
 Fri, 30 Aug 2024 14:47:50 -0700 (PDT)
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
X-Inumbo-ID: aa3bf009-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W+sWhKs2BNLPpb3UGBqNNQ3s/h+I85dvSqj/MVRDT2a5B2IcR6G/dUXEvuH598i1uSjBYpDqoak4a8XnMdVnH33X01k6etUA+eOsvpi92Ye9NyD/uhOrS78rt52nzgJ1guNzH3SDCBUW/KXVVvP4WKpPKt11maAxQQEePsZTXqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054472; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q0pSe2RfpDMnhePm+Qzlz8IPsCD571W7svuapogeYRE=; 
	b=Dr2m674YWJRHRI16wy+9BAmDVULJAzf01TaxRpWrAH+JuvG1KmL3xIPpogks/IgFqgCAojJ17pKTJEhPCZR/GNF9wj/JrS+Ffyoo/SIvsi28vFJPmWULj8MsIT+DpZHSHWVdtBZscxTWlJLre0cRKBTwAOWH3WVjCTIJPe18aQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054472;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Q0pSe2RfpDMnhePm+Qzlz8IPsCD571W7svuapogeYRE=;
	b=eWCZwr2S5GiGAD7qVm/FCN7HABPeVPVJae/4sfYLd200e0RqIwEMjN1MDQ1mVm3g
	/K+37OG7ZRnaXJBtMaIHTgK2PhWMFZ9yDctGj4zbjOed6BcJeRcG1VYYbhq1rQJuiHf
	iQX5dj6JmgNPB4MNOwpOdcOVUvVKOdxqzRsjW6tI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 10/44] x86/boot: introduce boot module types
Date: Fri, 30 Aug 2024 17:46:55 -0400
Message-Id: <20240830214730.1621-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces module types of xen, kernel, and ramdisk to allow boot
module detect code to tag the purpose of a boot module. This reduces the need
for hard coded order assumptions and global variables to be used by consumers
of boot modules, such as domain construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 9 +++++++++
 xen/arch/x86/setup.c                | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3e0e36df096b..1b1b640f83f7 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -11,9 +11,18 @@
 #include <xen/multiboot.h>
 #include <xen/types.h>
 
+/* Boot module binary type / purpose */
+enum bootmod_type {
+    BOOTMOD_UNKNOWN,
+    BOOTMOD_XEN,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+};
+
 struct boot_module {
     module_t *early_mod;
     unsigned long headroom;
+    enum bootmod_type type;
 };
 
 struct boot_info {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d4f557b4c50d..8d5450c981a8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -314,6 +314,7 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
         boot_mods[i].early_mod = &mods[i];
 
     /* map the last mb module for xen entry */
+    boot_mods[info.nr_mods].type = BOOTMOD_XEN;
     boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];
 
     boot_info = &info;
@@ -1197,6 +1198,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     bitmap_fill(module_map, boot_info->nr_mods);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    boot_info->mods[0].type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
     {
@@ -2085,6 +2087,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? "" : "not ");
 
     initrdidx = find_first_bit(module_map, boot_info->nr_mods);
+    boot_info->mods[initrdidx].type = BOOTMOD_RAMDISK;
     if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


