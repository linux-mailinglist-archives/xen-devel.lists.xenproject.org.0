Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27D9921DD
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811378.1224089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFA-00079j-DS; Sun, 06 Oct 2024 21:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811378.1224089; Sun, 06 Oct 2024 21:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFA-00076U-9b; Sun, 06 Oct 2024 21:56:48 +0000
Received: by outflank-mailman (input) for mailman id 811378;
 Sun, 06 Oct 2024 21:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZA8-00051E-6z
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26c117ce-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:51:34 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172825141593795.75148855391808;
 Sun, 6 Oct 2024 14:50:15 -0700 (PDT)
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
X-Inumbo-ID: 26c117ce-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251418; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VyLnwAqb497h0jJeT27j0q1Yat7Xzb8keCeAJTth3TBPQxTDXAvYDpzDYOKZ8bQ/KoNYcMEA4RFc7E+LK2+UzqospI2GJterGyuBLiwuZd1pIAhCFqSi+ehlJ/TbQPtKvyYkun94tGktUFyR9r3S8K3M8gbGJta9wDDtu0IecPg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251418; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LLrOReDmzknWCbN9N+hIkJRPFFBTEgW6Ul0tsXA+CWE=; 
	b=e0kwamlqbiuM9scBH+TRRfT+uWH6AHfbLsmJ5gSg33fgjR/wS0NoZGmFfzEGFEodFOdFcn1tL+KulhnW4pWxxMxUJEO1hiVHIfXeDCmEzJW+EJZHOELAeLnX27Kijvoge/H/2mbtyOKh5+kLjXBiDOu/aZ6VYOGLTlMhSoOkjCs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251418;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=LLrOReDmzknWCbN9N+hIkJRPFFBTEgW6Ul0tsXA+CWE=;
	b=rBN8lRutmggRr/zlKN4avoLiM5bxkeFnquIdN8NtgvLXT7jZzuDxs4yxEkHTheJU
	CjQv+n5LMJCpT07tKRIh058llxRJvEaj2BC1IwWioA9lKv9/uxDvLb6Rs5AGyX9OMi2
	YbU7/kkvVuvQK2N3zqdtbk2j4zEijEZUJYUmEYP0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 10/44] x86/boot: introduce boot module flags
Date: Sun,  6 Oct 2024 17:49:21 -0400
Message-Id: <20241006214956.24339-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
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
index 6941a8975ea6..021ff0d93643 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -31,6 +31,10 @@ struct boot_module {
      */
     unsigned long headroom;
     enum bootmod_type type;
+
+    uint32_t flags;
+#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
+
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 69c45f115523..161415a8e667 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1354,7 +1354,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             panic("Bootloader didn't honor module alignment request\n");
         bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
         bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
-        bi->mods[i].mod->reserved = 0;
     }
 
     /*
@@ -1470,7 +1469,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
 
-            if ( bi->mods[j].mod->reserved )
+            if ( bi->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1489,7 +1488,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                             bm->mod->mod_end);
                 bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
                 bm->mod->mod_end += bm->headroom;
-                bm->mod->reserved = 1;
+                bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
 
@@ -1515,7 +1514,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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


