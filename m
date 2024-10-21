Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A99A5857
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822987.1237024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gj4-0003ir-1h; Mon, 21 Oct 2024 00:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822987.1237024; Mon, 21 Oct 2024 00:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gj3-0003cs-T3; Mon, 21 Oct 2024 00:56:49 +0000
Received: by outflank-mailman (input) for mailman id 822987;
 Mon, 21 Oct 2024 00:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZl-000738-Ag
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0192cad4-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:47:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172947159069489.25305881589452;
 Sun, 20 Oct 2024 17:46:30 -0700 (PDT)
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
X-Inumbo-ID: 0192cad4-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471592; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RtaK8huPFpAEWBdzWn/hxL55Dfn4Yd1PxHRIcSw/jQmn+GesVOzy7JzmKjWQPQ448pVa7mU5aRGFDyA0g6pTn4e0n98f7FdRZjmpqj7oe5LT8VSSReOBaJkZ3/ZKTXA3npbR+6Ha0QqAy/Be1+3BbTE0BzjNPUVvYOUPqq4PHwA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471592; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0R4FqS7cm2ZwHrj01Lkx0kaLT9LesczGLcvq3CBN3bk=; 
	b=At3Wtwyx59FEnmOhNzEYotwOQThLmtlEoZTLH7P+1Lu/pIP/bO3xap8x9Fpr3bN2bApOz70Nh/gX/g4rSuq3nh5f0rI8F+6n63xRhAbUU24EZQlwkMepCqdqqPr3rTBdS7+23/Qc5Whovt+KTbsDWZsl8abZ4GXbEcJpTeL05vs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471592;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0R4FqS7cm2ZwHrj01Lkx0kaLT9LesczGLcvq3CBN3bk=;
	b=qU11rr3Lls/dnbh0qxnLqRQ45dQuNB1Wr+5plXknMMvooG3vCQNqSvedlCtc9H/S
	pkwUcGf9DpAGnIOBQb08Lv/Wqj9LOSUvIF5h1oo1m4VS4+EIIeq4uHfiWTh+rDwQTOa
	ao3Ds7XEWHbROB121FjM137gQNDvmodzEpVBTHTU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 06/38] x86/boot: introduce boot module flags
Date: Sun, 20 Oct 2024 20:45:41 -0400
Message-Id: <20241021004613.18793-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The existing startup code employs various ad-hoc state tracking about certain
boot module types by each area of the code. A boot module flags bitfield is
added to enable tracking these different states. The first state to be
transition by this commit is module relocation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- replaced bitmask flags field with the bitfield, relocated
- slight update to commit message to mention bitfield
- dropped Rb and Ab due to approach change

Changes since v5:
- removed trailing blank line.
---
 xen/arch/x86/include/asm/bootinfo.h | 6 ++++++
 xen/arch/x86/setup.c                | 7 +++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index ec005a97d6d5..e8fba66eedc5 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -40,6 +40,12 @@ struct boot_module {
      */
     unsigned long headroom;
     enum bootmod_type type;
+
+    /*
+     * Module State Flags:
+     *   relocated: indicates module has been relocated in memory.
+     */
+    bool relocated:1;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 496f0900890d..17f74384b5c1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1378,7 +1378,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             panic("Bootloader didn't honor module alignment request\n");
         bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
         bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
-        bi->mods[i].mod->reserved = 0;
     }
 
     /*
@@ -1492,7 +1491,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             struct boot_module *bm = &bi->mods[j];
             unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
 
-            if ( bm->mod->reserved )
+            if ( bm->relocated )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1511,7 +1510,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                             bm->mod->mod_end);
                 bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
                 bm->mod->mod_end += bm->headroom;
-                bm->mod->reserved = 1;
+                bm->relocated = true;
             }
         }
 
@@ -1537,7 +1536,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].mod->reserved )
+    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-- 
2.30.2


