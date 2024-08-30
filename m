Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D730E966BAD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786794.1196587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bi-0006S0-2f; Fri, 30 Aug 2024 21:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786794.1196587; Fri, 30 Aug 2024 21:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bh-0006PL-R9; Fri, 30 Aug 2024 21:56:37 +0000
Received: by outflank-mailman (input) for mailman id 786794;
 Fri, 30 Aug 2024 21:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9UU-00065G-P4
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0b5679-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:09 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054471893456.85203276225536;
 Fri, 30 Aug 2024 14:47:51 -0700 (PDT)
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
X-Inumbo-ID: af0b5679-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054474; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lasNya4BFw/XtdtSGjwfRiCwlJ2VNmaP/DFwPqwMxuNlpnFaYBJBhFgki3cfogDxU9wZYf3sUP2yDsT6xSYk7Efsvn+j0zHp59BdR6GcpVpgSjjETUkRpT0qWonoxJ/5mPk6bV0H/C25eSmuy0/Im70MrNAskpaEUf5ZHQ6PKQQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054474; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5tRW/AonFx6PkMudQZ5UfviW7yOCGUwEDitNjDx5cYw=; 
	b=P2RZyBCBWzg0mXe89rpIkcQ59rMsls/HXUJftpwSGUiGPS0zBhrAevJorYsL+HSroAlas1NIBhfkBtsXAvV5LSEo9zqvPkEltsIp1t1HTaDRy/DRO7VaOwsE3LSi+VgN3NW7Z3ESgpgAE0e5L6ObQQSqIaONU0ZjLGzrEvCBtEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054474;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=5tRW/AonFx6PkMudQZ5UfviW7yOCGUwEDitNjDx5cYw=;
	b=BNiO0Zw2VJ1gTey+LPtH+bszYg/zKQgmqw12d7w3C7FDRgty38trREA9D0XrAzVf
	e9ushTYSMZsYQnQMMAeh8QBW4teIaKM+qgiPA9Jyp9CLFMc0RFnEVC4Zw/u5nldabKy
	SUysyMO272fQbZGub475DGGOCmYI4IeMOsVcrA28=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 11/44] x86/boot: introduce boot module flags
Date: Fri, 30 Aug 2024 17:46:56 -0400
Message-Id: <20240830214730.1621-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The existing startup code employs various ad-hoc state tracking about certain
boot module types by each area of the code. A boot module flags is added to
enable tracking these different states.  The first state to be transition by
this commit is module relocation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 4 ++++
 xen/arch/x86/setup.c                | 8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 1b1b640f83f7..baf6d74db754 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -23,6 +23,10 @@ struct boot_module {
     module_t *early_mod;
     unsigned long headroom;
     enum bootmod_type type;
+
+    uint32_t flags;
+#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
+
 };
 
 struct boot_info {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8d5450c981a8..47e4fcc2a8ce 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1377,7 +1377,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             panic("Bootloader didn't honor module alignment request\n");
         boot_info->mods[i].early_mod->mod_end -= boot_info->mods[i].early_mod->mod_start;
         boot_info->mods[i].early_mod->mod_start >>= PAGE_SHIFT;
-        boot_info->mods[i].early_mod->reserved = 0;
     }
 
     /*
@@ -1492,7 +1491,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             size = PAGE_ALIGN(bm->headroom + bm->early_mod->mod_end);
 
-            if ( boot_info->mods[j].early_mod->reserved )
+            if ( boot_info->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1511,7 +1510,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                             bm->early_mod->mod_end);
                 bm->early_mod->mod_start = (end - size) >> PAGE_SHIFT;
                 bm->early_mod->mod_end += bm->headroom;
-                bm->early_mod->reserved = 1;
+                bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
 
@@ -1537,7 +1536,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( boot_info->mods[0].headroom && !boot_info->mods[0].early_mod->reserved )
+    if ( boot_info->mods[0].headroom &&
+         !(boot_info->mods[0].flags & BOOTMOD_FLAG_X86_RELOCATED) )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-- 
2.30.2


