Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769E9A23D7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 15:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820594.1234149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbO-00086i-1t; Thu, 17 Oct 2024 13:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820594.1234149; Thu, 17 Oct 2024 13:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbN-00080G-TJ; Thu, 17 Oct 2024 13:31:41 +0000
Received: by outflank-mailman (input) for mailman id 820594;
 Thu, 17 Oct 2024 13:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1QbM-0007Yl-9d
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 13:31:40 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c4da06-8c8c-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 15:31:38 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so125863266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 06:31:38 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29817036sm299115166b.124.2024.10.17.06.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 06:31:36 -0700 (PDT)
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
X-Inumbo-ID: 22c4da06-8c8c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729171897; x=1729776697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=hfvgJ7F4jiCfxikslPkJ6i1P5OKOMRuqlMUEX4FX+0Ov9iSWe8x1Qzzy0Qw2W/6/1i
         5aK9JJfMm81DG9KzAWWB8Ho4/YAuuFgLzG5hG1xxbhj2jPvDAZr55HlSlLl4JoMacuc+
         +Y6A2mNiJuNAtldy3g4k8xC1d1r8cJLLuE4w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171897; x=1729776697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=Q3g1m7wEbR09fKNOvAI3qk9VL5bcO5BgeOrXcxeQokydv22z6MIVx3w9OHkdIwPESR
         cDQ4NP4RihatTWQdnTDE53HXdRDaRpsQagid+cF9YFLnQLJP4IXHtbxOhv82EtMlIR5w
         PqymYiCTBAnWfh1u8fR8gTocNfNPmUl6WXcn7Ty4F7KkL4cJADk/VpkO0hafupcwNd2R
         touddLFHnCbCRw8UiB2NHKWldr9gelo/a7/2vaw+AJP7WwfB2WbUUVZLCb07IP4Ueyi1
         uYoVZc596uArrTzmCmXFEZ3/rvo+KNtt1INpc/EBBb4fJPas+T5OsLlPjAnQDUqiAHZ3
         REag==
X-Gm-Message-State: AOJu0YxPFToJvw5H5wEiw5qRQWpCKYM9OcrxLFPhAgjjaiN6jbgMfEFk
	a7B5BBsfNpzh24g6FGcxmfD3I+5WS+cB0i55JcmsMayjOm7I4VeeZYkbZ+aBHiihI6Q7M0Cy7wl
	H
X-Google-Smtp-Source: AGHT+IG1sYUmoX/vjQ7f1uakOXeaM56klxTlFbUCF5mFMb9u+u+inCKeGcvEet19Mzb6gBceym8AIQ==
X-Received: by 2002:a17:907:96a1:b0:a99:e82a:87ee with SMTP id a640c23a62f3a-a99e82a8932mr1790616066b.57.1729171897068;
        Thu, 17 Oct 2024 06:31:37 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 4/5] x86/boot: Use trampoline_phys variable directly from C code
Date: Thu, 17 Oct 2024 14:31:22 +0100
Message-Id: <20241017133123.1946204-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
- split the 2 variable changes into 2 commits.

Changes since v2:
- revert commit order;
- avoid useless casts.
---
 xen/arch/x86/boot/head.S  | 6 +-----
 xen/arch/x86/boot/reloc.c | 8 ++++++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 5da7ac138f..dcda91cfda 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -510,13 +510,9 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        /* Get bottom-most low-memory stack address. */
-        mov     sym_esi(trampoline_phys), %ecx
-        add     $TRAMPOLINE_SPACE,%ecx
-
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
         mov     %ebx, %edx          /* Multiboot / PVH information address. */
-        /*      reloc(magic/eax, info/edx, trampoline/ecx) using fastcall. */
+        /*      reloc(magic/eax, info/edx) using fastcall. */
         call    reloc
 
 #ifdef CONFIG_PVH_GUEST
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 707d9c5f15..e50e161b27 100644
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
 
@@ -344,9 +347,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline)
+void *reloc(uint32_t magic, uint32_t in)
 {
-    memctx ctx = { trampoline };
+    /* Get bottom-most low-memory stack address. */
+    memctx ctx = { trampoline_phys + TRAMPOLINE_SPACE };
 
     switch ( magic )
     {
-- 
2.34.1


