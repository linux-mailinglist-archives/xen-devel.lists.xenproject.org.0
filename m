Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B523C9A0549
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819758.1233229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EQ-0001rL-IJ; Wed, 16 Oct 2024 09:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819758.1233229; Wed, 16 Oct 2024 09:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EQ-0001il-BQ; Wed, 16 Oct 2024 09:22:14 +0000
Received: by outflank-mailman (input) for mailman id 819758;
 Wed, 16 Oct 2024 09:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t10EO-0001Po-J4
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:12 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f614e4c-8ba0-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:22:11 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so8037730a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:22:10 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b735dsm1500429a12.81.2024.10.16.02.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:22:09 -0700 (PDT)
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
X-Inumbo-ID: 1f614e4c-8ba0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729070530; x=1729675330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=iB/9f9wBAY3N/x5wNuLAFz5HyvBqhfoP69DpAtB+YTjSD+hgcbnT3mrZL09hlppccu
         pOZSaKoWY3UQomWbJC/KofgALpRHQ7IWURh3/+RaRmqei4OQZLhLSFiajBdjN3hmSIkZ
         ye6eWKwQkaGP5S9LMd1qv67rgi3SPFDrTr3+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070530; x=1729675330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=IVj7+LxQuK28133+US90q3XzjRLoFXwpgsNPtRDfmzl8qbYNZAILupbv9Q8hs2cOwV
         GQ73t8iU27ukqu+VGHqI8EhXwe19mBSet8wqvBrUmNsflMApi1+05F4h/7ptKz8UKARa
         m6a6R93A28n6eLZ8sTSu1FZaikTGx/J47taiSghafIP8OB5v+Mkfq29OnxR9a+wZcRtM
         SnNZoSIHH79S96G8Vrl/Lcg3GGbvXivKNZvvE/69vQwXjQdRQ/7ZvzuwO3Zx5w1lzyI1
         jDAVA0N8M4wGY8OIUrPunJQyRhRpTuSTSlKN+RFGExWfn6Yu7Iri0Lld898qB1MsrA5H
         BoRQ==
X-Gm-Message-State: AOJu0YwreXkBHc8vWRpoF/1XYLu7Wcaug0W9qB5hrGK2ol09YO9o2KtW
	cx1Lrhl3WqS7T9gSqA8p+VHvY+ZAyJZAJaGQyCrvHCJ0TZilGD89p+lb0lJOKCIlfrWXs0qeg/6
	r
X-Google-Smtp-Source: AGHT+IGzaRIz7yNygNZTew088JJU8SGc3ar9cJeUqtLCi6t8UejaVf/0T3c5cDKAjN729sxrqbgPfg==
X-Received: by 2002:a05:6402:268a:b0:5c9:71c7:c6be with SMTP id 4fb4d7f45d1cf-5c9951212d1mr2752056a12.29.1729070530141;
        Wed, 16 Oct 2024 02:22:10 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 4/5] x86/boot: Use trampoline_phys variable directly from C code
Date: Wed, 16 Oct 2024 10:21:53 +0100
Message-Id: <20241016092154.1493035-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
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


