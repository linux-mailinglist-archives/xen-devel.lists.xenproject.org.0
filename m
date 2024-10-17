Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920579A2A4C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820898.1234633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TzF-000889-Lp; Thu, 17 Oct 2024 17:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820898.1234633; Thu, 17 Oct 2024 17:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TzF-00083w-Go; Thu, 17 Oct 2024 17:08:33 +0000
Received: by outflank-mailman (input) for mailman id 820898;
 Thu, 17 Oct 2024 17:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tvv-0006TN-ST
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f42e10c9-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:05:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184627400845.0097301540941;
 Thu, 17 Oct 2024 10:03:47 -0700 (PDT)
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
X-Inumbo-ID: f42e10c9-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SeayuwoQT0saTqC6G096y+49K1bclg5Ivg81bteWsoDLt/adFhxnFW3tKKpe/IWKuCK2jaI8RMq4NqZ3w5Hit3zXBubjRzMX+B0N8cy4mAOfWPTcJf/wEUf4YLj12lfiJYWtazTvbLq8IoUOlC37CmR00icW70Q4sFG8mfbUbXo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184629; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dgh7JemAIAyELVZo1MtAbdLIy6CYiHIimrr6e9LjQD8=; 
	b=TS19wJUP0AMUiHWHp2eIISwQGpgs2CJKJCRwnlx1rDwNRQwoqOWgZqqwCnXyLHBMQRtRuIO4V/X70VsAZvI6r8AhW49kWAwEttsFIPPDcFm4ZhOW1cd2yWnnDYQzZ5DZcOnwS3zRwDpAaJgBy/PA+ibqDTqhGQo3/0OG+L8IhTQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184629;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Dgh7JemAIAyELVZo1MtAbdLIy6CYiHIimrr6e9LjQD8=;
	b=K4K1/ZiQiOWJ4pIQWR8kcK25hcKKNHMCIIV0jXCjd2149ZUXycVc3sYYaeqwrsyM
	1sfKSVqt1NlVpU6FcdjYIInTnfaoX/QRYLCSXzdsuoMKKGXIy1JGrCnL9EoeLYbioUH
	rRXqtzfuNVbC3KFj5rGn2C969yTTnhPCXPclm8Xg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 10/44] x86/boot: introduce boot module flags
Date: Thu, 17 Oct 2024 13:02:50 -0400
Message-Id: <20241017170325.3842-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The existing startup code employs various ad-hoc state tracking about certain
boot module types by each area of the code. A boot module flags is added to
enable tracking these different states.  The first state to be transition by
this commit is module relocation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v5:
- removed trailing blank line.
---
 xen/arch/x86/include/asm/bootinfo.h | 3 +++
 xen/arch/x86/setup.c                | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 18281d80fa97..e8ba9390a51f 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -39,6 +39,9 @@ struct boot_module {
      */
     unsigned long headroom;
     enum bootmod_type type;
+
+    uint32_t flags;
+#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fed9bef16305..f87faa31a2cf 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1357,7 +1357,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             panic("Bootloader didn't honor module alignment request\n");
         bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
         bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
-        bi->mods[i].mod->reserved = 0;
     }
 
     /*
@@ -1471,7 +1470,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             struct boot_module *bm = &bi->mods[j];
             unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
 
-            if ( bi->mods[j].mod->reserved )
+            if ( bi->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1490,7 +1489,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                             bm->mod->mod_end);
                 bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
                 bm->mod->mod_end += bm->headroom;
-                bm->mod->reserved = 1;
+                bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
 
@@ -1516,7 +1515,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].mod->reserved )
+    if ( bi->mods[0].headroom &&
+         !(bi->mods[0].flags & BOOTMOD_FLAG_X86_RELOCATED) )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-- 
2.30.2


