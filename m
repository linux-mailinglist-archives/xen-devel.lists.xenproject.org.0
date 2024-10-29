Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879AA9B46DB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827209.1241772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jUA-0007Tn-NH; Tue, 29 Oct 2024 10:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827209.1241772; Tue, 29 Oct 2024 10:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jUA-0007QR-Im; Tue, 29 Oct 2024 10:30:02 +0000
Received: by outflank-mailman (input) for mailman id 827209;
 Tue, 29 Oct 2024 10:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5jU8-0006t0-Bt
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:30:00 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde1b9c7-95e0-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 11:29:56 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so832132266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:29:56 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dfbc7e8sm458495466b.31.2024.10.29.03.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:29:55 -0700 (PDT)
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
X-Inumbo-ID: bde1b9c7-95e0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJkZTFiOWM3LTk1ZTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMTk3Nzk2LjQyOTgxOSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730197795; x=1730802595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=MUAQfGwpge00Py/t8zTeur+4TIm6FpmnHwOil5HPpJpZPj8IVadkF9xrruucWVsuoJ
         OuHf5yluAalHwULeoTkokmikoJYx8KAaUaKuXkeprS3Ce0K4+K33ERRUNVfEaLpjOWWc
         30qeMiYEyx228d0s+eOHtd70HaWMa7W7dfHLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197795; x=1730802595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=exwVeqKR1gxhdTejmyugiFo0auzRMV5dxmgiZjOz9/y35HblTyCa3iuaYP145RkJ7F
         WxPIkjS2AMh8JhX+1yqNDk/HpxLEORydq5N+ttcvO7mHNHy2Y0vjUQZKKlO8nUBJtQPy
         vpe7gcB3KLMbkdSYMPFnnbpHX9a2T3mvj55PAqENHKW0qEPeKoBbW5QtMzleb0ZIArmu
         szHIo5TPS+u8mZgJne6csJP1/sQ4Y/xkjgvcfTA7f5tn3SB0hTSq3VbkB8d/ABqIUJCi
         4SqTcFBhUM3x8u5zCLVNFWG59jinmhXR3e4XL6oM3VYWTvgYQorM7w4lbU9c6VSG/wMP
         vlVQ==
X-Gm-Message-State: AOJu0YzyTRNp9SJVMJsOFlO0iQXcqoDJfTAUdSbY84X98YNQdHA6lgeB
	aAK7+VqTFuKO2oG86fgSN65OXMRDbhFI8gjaLRc9G3wvZbz6dCj7mYSRN1yxgwdmWUZB1x4MLBi
	1
X-Google-Smtp-Source: AGHT+IHuaiAwnRmIeicovLku4Aje8nLcMMxOIYnEMOQVMXbzlJRUcAcOn3Plls0fiPUc9Ysx80nUYg==
X-Received: by 2002:a17:906:6a09:b0:a99:ffdb:6fef with SMTP id a640c23a62f3a-a9de61cef8amr1269099566b.46.1730197795470;
        Tue, 29 Oct 2024 03:29:55 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 4/5] x86/boot: Use trampoline_phys variable directly from C code
Date: Tue, 29 Oct 2024 10:29:41 +0000
Message-Id: <20241029102942.162912-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029102942.162912-1-frediano.ziglio@cloud.com>
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
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


