Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF569BA1B3
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829570.1244577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Hta-0006ET-Uf; Sat, 02 Nov 2024 17:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829570.1244577; Sat, 02 Nov 2024 17:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Hta-0006CY-Qs; Sat, 02 Nov 2024 17:26:42 +0000
Received: by outflank-mailman (input) for mailman id 829570;
 Sat, 02 Nov 2024 17:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HtZ-0005zO-H2
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:26:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d21230b-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:26:38 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568363326833.7879973254649;
 Sat, 2 Nov 2024 10:26:03 -0700 (PDT)
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
X-Inumbo-ID: 9d21230b-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkMjEyMzBiLTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4Mzk5LjA2MDI4Mywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568371; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HFi/r/GDxbDE0VePkjwtbYsGJYlfYuTWJfm4B/wZotDKLu0nJs12lIsd+8QHmpHE/QogUi0ekV54vPIoyL9tkYPRHXuTtvxEZP3749r7uu4uk5mTbBMnZ07J6uALm/GkbKgxMRuR+OFV/XbbTvGqPAhKRJ0Tlk3YHQa3ntZa170=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568371; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cldlTjNG2X0IEi+ADcYbrRHkM0Zd7pCxKFfx6gZwAx4=; 
	b=iNk/IFq2UuGeGuMTxhzenE6No3ZT50h/u5jJwhMSESw3bzVnApGuoQhHS9HKu3jNwTt0pAfRFqEmLc3gT82Qs3xlLdoWqOSqgXFwUEC7O4Q2zQA9hmmIT1o/qd92HULNqWOOIrD1N9AaL0HTXlOh9jY/F9OZgWEWGPztLJ0OYJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568371;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=cldlTjNG2X0IEi+ADcYbrRHkM0Zd7pCxKFfx6gZwAx4=;
	b=IqvHUs8veLwEkrbCuInEwuyCIKtdaL/waH4FGQWUz0NYvmSGXPfnK1v/hhvFREn6
	0xk0qiMfTGKFUhBT3052KdVw7tWOtC/rqeqfJ+gZtRfMZ3yRODYMx+xr/3Gmh4ectZ8
	G/hxksDmuROJNr7jnTP/LPw3B/G0pISSVSwyeAFI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/12] x86/boot: introduce boot module flags
Date: Sat,  2 Nov 2024 13:25:42 -0400
Message-Id: <20241102172551.17233-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
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
index 37dfcc14fa7d..0fbf36739782 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -29,6 +29,12 @@ struct boot_module {
     module_t *mod;
 
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
index 92dbdfe12a3d..d061ece0541f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1392,7 +1392,6 @@ void asmlinkage __init noreturn __start_xen(void)
             panic("Bootloader didn't honor module alignment request\n");
         bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
         bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
-        bi->mods[i].mod->reserved = 0;
     }
 
     /*
@@ -1508,7 +1507,7 @@ void asmlinkage __init noreturn __start_xen(void)
             unsigned long headroom = j ? 0 : modules_headroom;
             unsigned long size = PAGE_ALIGN(headroom + bm->mod->mod_end);
 
-            if ( bm->mod->reserved )
+            if ( bm->relocated )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1526,7 +1525,7 @@ void asmlinkage __init noreturn __start_xen(void)
                             pfn_to_paddr(bm->mod->mod_start), bm->mod->mod_end);
                 bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
                 bm->mod->mod_end += headroom;
-                bm->mod->reserved = 1;
+                bm->relocated = true;
             }
         }
 
@@ -1552,7 +1551,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( modules_headroom && !bi->mods[0].mod->reserved )
+    if ( modules_headroom && !bi->mods[0].relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-- 
2.30.2


