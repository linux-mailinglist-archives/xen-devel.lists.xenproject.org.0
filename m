Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520C966BA8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786771.1196562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9ba-0004h0-1Q; Fri, 30 Aug 2024 21:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786771.1196562; Fri, 30 Aug 2024 21:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bZ-0004a5-Mi; Fri, 30 Aug 2024 21:56:29 +0000
Received: by outflank-mailman (input) for mailman id 786771;
 Fri, 30 Aug 2024 21:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Xe-0000Zf-2K
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 230e677c-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:52:24 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054500033634.5246086156144;
 Fri, 30 Aug 2024 14:48:20 -0700 (PDT)
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
X-Inumbo-ID: 230e677c-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054502; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cn+G1qZky79yw/9hC9HKgKVZ45rI70UfgV6bSQszYWRKkXYJS+n7rUyXGKAg2S04DaXfEOBp+vhvvKhuaAp68kajkYA8KdnS9lThNTCR9JgK8q2UyREJ2JhZNeqeTy2URaIuUk34tH/M9n7lnCVB9R/8YHXPTbfqRmA7/7hDLHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054502; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HBxvAb1ltpAXzL9WPBIkhD8Kd9b/CO8vDcvLfbJPxj0=; 
	b=NyK2nyr1cr4+N2IXgM9Yf24qblL/EEcV4TKqcAuRuvryjSY29ISWJsD8GAoSbZt56VUNMyvzBKtdHR8s6H4XW/+RvPbLKKeL/RFlWFfj0pnm9Z+hk6yLvadUhEsc3/sqig33WELaZq5AI9yoUTOXOoFnuoboDQy7VPzAcoUoiPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054502;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HBxvAb1ltpAXzL9WPBIkhD8Kd9b/CO8vDcvLfbJPxj0=;
	b=cvoUht3bbrWsoWvlmhjW+xzwaNFHpd2V3oFWssLldYyD06/GXvJTdPTgHCRLSGhb
	Ct9SZN5YqudaQCtv31nY7Gad2C7AvK0BuFfCNzchQgqGMsHbtkfOC+dQD6/ECIgQRT5
	j5IChvDDZ2ZLRh0bPyJ9nxjzbzpstW/NHNciv9pw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 37/44] x86/boot: remove early_mod from struct boot_module
Date: Fri, 30 Aug 2024 17:47:22 -0400
Message-Id: <20240830214730.1621-38-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all references to early_mod fields removed, remove the
early_mod field from struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 2 --
 xen/arch/x86/setup.c                | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index edd5c435d032..59755ef42e53 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,7 +8,6 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
-#include <xen/multiboot.h>
 #include <xen/types.h>
 
 /* Boot module binary type / purpose */
@@ -22,7 +21,6 @@ enum bootmod_type {
 };
 
 struct boot_module {
-    module_t *early_mod;
     unsigned long headroom;
     enum bootmod_type type;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 46f6bf82fe63..a6fbaecee9ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -311,8 +311,6 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
 
     for ( i=0; i < info.nr_mods; i++ )
     {
-        boot_mods[i].early_mod = &mods[i];
-
         boot_mods[i].cmdline = (char *)(paddr_t)mods[i].string;
 
         boot_mods[i].start = (paddr_t)mods[i].mod_start;
@@ -322,7 +320,6 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
     /* map the last mb module for xen entry */
     boot_mods[info.nr_mods].type = BOOTMOD_XEN;
     boot_mods[info.nr_mods].flags |= BOOTMOD_FLAG_X86_CONSUMED;
-    boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];
 
     boot_info = &info;
 }
-- 
2.30.2


