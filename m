Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1708992E9F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812038.1224752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWs-0004by-9C; Mon, 07 Oct 2024 14:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812038.1224752; Mon, 07 Oct 2024 14:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWs-0004Vq-43; Mon, 07 Oct 2024 14:16:06 +0000
Received: by outflank-mailman (input) for mailman id 812038;
 Mon, 07 Oct 2024 14:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxoWp-0002dC-KI
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:03 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aea8827a-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:16:02 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fad15b3eeeso47337221fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:16:02 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c119esm3386204a12.55.2024.10.07.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:16:00 -0700 (PDT)
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
X-Inumbo-ID: aea8827a-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728310561; x=1728915361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpfgwl9+LkPM73G0fVQDQXvT2n2qaAQPOJ+RtwChmH0=;
        b=eIgGHE2YFTf0f7wq7yvQ6ztv3EUjegLUvcaB59N2JIxNkJtPLt8WVcJVXzeVrU9/jL
         YV7vKWyU15mtpHde3lSIN9pGjZslQGtlhO0I0eTRrJ3HHdDm9N+ozHiOfCNWqubnrjIr
         0J+uQR3b04WreMNgYY1msP6WfK0P8b/rYntoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310561; x=1728915361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpfgwl9+LkPM73G0fVQDQXvT2n2qaAQPOJ+RtwChmH0=;
        b=cGmHVgdbwTCsNPPdRvDGf2VEPPrka3ROSaDL2k4xbToJlQd3doo2nFk2JPsbPuQZV+
         qJN8kM/OXEIbRhxrTzuk7NeZVSHcqACo/oXc1bbKcuoAvQ6ZDvNPjt/U4l+7nCdNW1Au
         3BlvWxnqFUgtFZNfBaIVi4HZG1aEEQTR2TmABuLQ//HCITeLx+E9voFQOTgsVqJvOnNL
         o7LelKxjEJvSJYusOa3ch69khyd5Hv98YEE/K4VRBBHRfNdcKxKO5cTCfawy9o943JPp
         o99tfixy0BJ1Z4qMlHTCz6KKVT1a9IrieJpWm/fXgEejfr7rTowkF7HHtdQuvLfbNEDm
         kdGA==
X-Gm-Message-State: AOJu0Ywda0T2yn7L+IoiZJnzxHDbZ++cUysWl++n+2JUFK2lP8JBgCMZ
	tHzjmAVilYDbPLs8JDik7G1DqRNvi3KZKLkbYUNsJuViQPzmcxIBQZdMKrEuJ1Nmjetp56XnYB0
	p
X-Google-Smtp-Source: AGHT+IEF0VnaL/GsX6YzvLTL6b7/rr5ZLQnGRRxavwji5QCpcOUL3lClS1wbCjiH2SxtHUBATOzmmQ==
X-Received: by 2002:a05:651c:19a2:b0:2fa:c60a:ce6f with SMTP id 38308e7fff4ca-2faf3c1cf0emr57552911fa.16.1728310561379;
        Mon, 07 Oct 2024 07:16:01 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/6] x86/boot: Use trampoline_phys variable directly from C code
Date: Mon,  7 Oct 2024 15:15:38 +0100
Message-Id: <20241007141539.1899350-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- split the 2 variable changes into 2 commits.
---
 xen/arch/x86/boot/head.S  | 13 ++++---------
 xen/arch/x86/boot/reloc.c |  9 ++++++---
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index ade2c5c43d..32b658fa2b 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -510,22 +510,17 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        /* Get bottom-most low-memory stack address. */
-        mov     sym_esi(trampoline_phys), %ecx
-        add     $TRAMPOLINE_SPACE,%ecx
-
+        /* Boot video info to be filled from MB2. */
 #ifdef CONFIG_VIDEO
-        lea     sym_esi(boot_vid_info), %edx
+        lea     sym_esi(boot_vid_info), %ecx
 #else
-        xor     %edx, %edx
+        xor     %ecx, %ecx
 #endif
 
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
-        push    %edx                /* Boot video info to be filled from MB2. */
         mov     %ebx, %edx          /* Multiboot / PVH information address. */
-        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) using fastcall. */
+        /*      reloc(magic/eax, info/edx, video/stk) using fastcall. */
         call    reloc
-        add     $4, %esp
 
 #ifdef CONFIG_PVH_GUEST
         cmpb    $0, sym_esi(pvh_boot)
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 94b078d7b1..4cca61adec 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -19,6 +19,9 @@
 #include <xen/kconfig.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
+#include <xen/page-size.h>
+
+#include <asm/trampoline.h>
 
 #include <public/arch-x86/hvm/start_info.h>
 
@@ -346,10 +349,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
-            uint32_t video_info)
+void *reloc(uint32_t magic, uint32_t in, uint32_t video_info)
 {
-    memctx ctx = { trampoline };
+    /* Get bottom-most low-memory stack address. */
+    memctx ctx = { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPACE) };
 
     switch ( magic )
     {
-- 
2.34.1


