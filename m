Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E71999F5B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816779.1230925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOQ-0002r0-PJ; Fri, 11 Oct 2024 08:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816779.1230925; Fri, 11 Oct 2024 08:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOQ-0002oe-Ks; Fri, 11 Oct 2024 08:53:02 +0000
Received: by outflank-mailman (input) for mailman id 816779;
 Fri, 11 Oct 2024 08:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szBOP-0001pW-2m
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:53:01 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3757dd8b-87ae-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 10:52:59 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so252160966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:52:59 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm186131566b.155.2024.10.11.01.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:52:58 -0700 (PDT)
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
X-Inumbo-ID: 3757dd8b-87ae-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728636779; x=1729241579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PONmpVj452UNcuxdCaXQokIwfePg1HbIGVi4eT66zNs=;
        b=C7ffj/P5FiOg6xnw0n5tFedXMCE1+QR4Rs83uJwo8ORWiWUJ6OxCyHttoAveZve9Jz
         Zn3s25prHxGxLeDckTBl199JdLMipVrvpKtdWxu3p+R5P7r9ZLwc0EBHDTkMMBnQCuoL
         jL9lIzez/4ecsr7cCxgtnwKSllOCwWq2P9mDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636779; x=1729241579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PONmpVj452UNcuxdCaXQokIwfePg1HbIGVi4eT66zNs=;
        b=f0xW0/SNnmde5bNEjOvFIINwoH6HKHI0/B756qjDQgnN+vhXoBEtFT9X9dca+yRXYB
         nacIGwIUwwSZ0Lb9oJAGC8CsjMIwcMLQ0CvOvcV1lNGjP3NKLswuHWD6If+SggfIp4RI
         McE/E1RdnmqFFY8OtNe3U50x8a3Y8AWx7MtELpzL2bbDY8NFgC2UM3aM0KRaeb/pxFZH
         RQc14BBYw/sJjgFjgzHSA9MFP2EKgQugZ+bYzIcGjShtVZ7fCkpAYSYxhuQc99rPyid1
         6KH30KA/Q01LNxcxcd9ML+85qu3bEIMh2E36EJWWduwdZCpX/k1TxG2hTx9aKAJL/Ax7
         r3bA==
X-Gm-Message-State: AOJu0YwP2NmosvuwaGFo2P8FMRflCREtBpluvlPGamRzO4jJ+3EiQMi9
	M2GpQVxec1LR5uD7au3mVjTAr9k/NG7pWxgrXckQ0hym8aMBZhaDkGWrucr+MWMQw9m0I4vu6pI
	R
X-Google-Smtp-Source: AGHT+IFcXAmr7qYJ0m5aasxdJqAhT3Ebj57sPRb/TvFys5xJg5FDBMrb/TWO2PyR5rR7fRjiGz+tXA==
X-Received: by 2002:a17:907:1c21:b0:a99:4dc1:b931 with SMTP id a640c23a62f3a-a99b95fb483mr158946266b.64.1728636778732;
        Fri, 11 Oct 2024 01:52:58 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/5] x86/boot: Use trampoline_phys variable directly from C code
Date: Fri, 11 Oct 2024 09:52:43 +0100
Message-Id: <20241011085244.432368-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011085244.432368-1-frediano.ziglio@cloud.com>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
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


