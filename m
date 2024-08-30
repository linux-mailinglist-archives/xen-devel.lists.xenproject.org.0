Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E04966BA7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786770.1196556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bZ-0004ak-IQ; Fri, 30 Aug 2024 21:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786770.1196556; Fri, 30 Aug 2024 21:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bZ-0004Vz-9g; Fri, 30 Aug 2024 21:56:29 +0000
Received: by outflank-mailman (input) for mailman id 786770;
 Fri, 30 Aug 2024 21:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9V4-00065G-Cw
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:46 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4583564-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:45 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054477221407.77333741442715;
 Fri, 30 Aug 2024 14:47:57 -0700 (PDT)
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
X-Inumbo-ID: c4583564-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054479; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ru3p5X5v6TlDJEMWI+9LyYX324Xjv8m84ceJlv3IYp+7xQzTqB/gdRUrXVNf6MFRUQok2KtkRl0zCj0kzNQJuhfKPwvXF9dOMLPtrz0oAy+QeIbYkSPshMJoxPWxAKM9HKF1/rLZlGV2SMRDdZo+RYyEP9ECLLymkgau2zf6bAA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054479; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bVRjWgn0rJXMNoedI0B0emnthNEBUMt5tP4JhrqFCck=; 
	b=PoQmeXORo1oDLnmlw1vnvJyFufOxxOybxKsklwFZN730rSXEQ6rEE98TEymWkStYuD+Cl/wgsTAFFX3eP5c94pZuY+VhSS2vWYeF9KVEjsE/F2fIzVhutZ5JIdzbjkiNApzQTzgVDcrxvMyP8EmLhLHE9a44cqO+si9ILezEWi4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054479;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=bVRjWgn0rJXMNoedI0B0emnthNEBUMt5tP4JhrqFCck=;
	b=d75Ha3abZDe4oPlyicA6qJ2en6+xikcXvyGnaiCzezvMag0Y8fSQyflJRJesYTxd
	qOLkUE2Fukh2HCjJMkHpl/XybwFizBZuF8AGBv7IrqEsDIhizSCz0i28Amfo4Zgwdn5
	7yF4NBqr5n1v+OSjEbaRc9/chi1Oy2h/7iqCZtoE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 16/44] x86/boot: introduce consumed flag for struct boot_module
Date: Fri, 30 Aug 2024 17:47:01 -0400
Message-Id: <20240830214730.1621-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Allow the tracking of when a boot module has been consumed by a handler in the
hypervisor independent of when it is claimed. The instances where the
hypervisor does nothing beyond claiming, the dom0 kernel, dom0 ramdisk, and a
placeholder for itself, are updated as being consumed at the time of being
claimed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 1 +
 xen/arch/x86/setup.c                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 99f8c9b83b25..740308693629 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -26,6 +26,7 @@ struct boot_module {
 
     uint32_t flags;
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
+#define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
 
     paddr_t start;
     size_t size;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0b6bde9ce7e3..da75dfce083d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -320,6 +320,7 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
 
     /* map the last mb module for xen entry */
     boot_mods[info.nr_mods].type = BOOTMOD_XEN;
+    boot_mods[info.nr_mods].flags |= BOOTMOD_FLAG_X86_CONSUMED;
     boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];
 
     boot_info = &info;
@@ -1212,6 +1213,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     bitmap_fill(module_map, boot_info->nr_mods);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
     boot_info->mods[0].type = BOOTMOD_KERNEL;
+    boot_info->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
     if ( pvh_boot )
     {
@@ -2100,6 +2102,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     initrdidx = find_first_bit(module_map, boot_info->nr_mods);
     boot_info->mods[initrdidx].type = BOOTMOD_RAMDISK;
+    boot_info->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
     if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


