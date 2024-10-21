Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9D9A585B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823024.1237065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjR-000778-KK; Mon, 21 Oct 2024 00:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823024.1237065; Mon, 21 Oct 2024 00:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjR-00073K-EI; Mon, 21 Oct 2024 00:57:13 +0000
Received: by outflank-mailman (input) for mailman id 823024;
 Mon, 21 Oct 2024 00:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gaF-0000Dk-3N
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1280206b-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:47:40 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471595370855.1759275725335;
 Sun, 20 Oct 2024 17:46:35 -0700 (PDT)
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
X-Inumbo-ID: 1280206b-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471597; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gbTJwubuLjGLXIHRQ/v0sQ4sKwXEXkxqBfrsPp1jvJhZptzb8RFMpfMyZIUj7q8mtwRlMDPURn4xa/J/zyPhbAhvl3fEEAdDO6Zhdl2enuFsVYsN7aSPY02HX8Fqr+1ifwzL3TKspy1J/y4H1CBgguS0CihiDM1EV2vFOMC+OSY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471597; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YvJ2m/YsYOZLoEyM2p3qJT9+gJiHXjraaWi+kBWIksU=; 
	b=gt0hBNrw1cMHJe7/URFosCDFGhah22QoJYaj+ufVmKPMIiBgu4n6SCJLqliVZQL3YTu/Rq0eyl/VdWvtADiNsUCJG6mv+h1i5G+yomkM7pX8AXC3JK+WuzY9TFTHhNhFKDZuQz+WYwYCucypXZ10xq8PGxHEau5eRBqIjdOhBX0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471597;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=YvJ2m/YsYOZLoEyM2p3qJT9+gJiHXjraaWi+kBWIksU=;
	b=npQB6TzqdDny8vKAgaIGczrXeIrX9nRV2oiiN7jZgbOrLzHYT2SNZc7jVV6ADErc
	cU9Yyt9vFu+QLm1U03yfj3Gyiibh+vIlVJ15tjtoAp2Hc12vjQmeSGcmiB3P2BPPZBd
	fQQXj0ANashdkWTbSFurktRqRzyoeZQBy78Tpoz4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 10/38] x86/boot: introduce consumed flag for struct boot_module
Date: Sun, 20 Oct 2024 20:45:45 -0400
Message-Id: <20241021004613.18793-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
Changes since v6:
- changed flag from bitmap to bitfield.

Changes since v5:
- first flag assignment can be = instead of |=
---
 xen/arch/x86/include/asm/bootinfo.h | 3 +++
 xen/arch/x86/setup.c                | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index dbd22db3d063..3eb9930904c0 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -44,8 +44,11 @@ struct boot_module {
     /*
      * Module State Flags:
      *   relocated: indicates module has been relocated in memory.
+     *   consumed:  indicates that the subystem that claimed the module has
+     *              finished with it.
      */
     bool relocated:1;
+    bool consumed:1;
 
     paddr_t start;
     size_t size;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b02391b887b1..a623f9cd9df9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -335,6 +335,7 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     bi->mods[i].start = mods[i].mod_start;
     bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
     bi->mods[i].type = BOOTMOD_XEN;
+    bi->mods[i].consumed = true;
 
     return bi;
 }
@@ -1211,6 +1212,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->mods[0].consumed = true;
 
     if ( pvh_boot )
     {
@@ -2094,7 +2096,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
     if ( initrdidx < bi->nr_modules )
+    {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->mods[initrdidx].consumed = true;
+    }
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


