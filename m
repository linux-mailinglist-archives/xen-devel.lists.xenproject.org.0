Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFF94A8EC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773503.1183980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh20-0006GK-Ox; Wed, 07 Aug 2024 13:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773503.1183980; Wed, 07 Aug 2024 13:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh20-00068s-GI; Wed, 07 Aug 2024 13:48:48 +0000
Received: by outflank-mailman (input) for mailman id 773503;
 Wed, 07 Aug 2024 13:48:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbh1x-0005AD-UC
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:48:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c333feae-54c3-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 15:48:44 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so2004978a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 06:48:44 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f353sm7017710a12.15.2024.08.07.06.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:48:43 -0700 (PDT)
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
X-Inumbo-ID: c333feae-54c3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723038523; x=1723643323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtnPxebiV0FOs9Be6cyaf3Vp45b5Mwz7UfucVn6WbxI=;
        b=CqtN8RIhDHwMHJhKxxyFN4vudwuoTeLauX9/MSOXiLxERpzpwPer2QdK+72gXEo8w6
         XVRDtou9y0sEJYXW7bp5D+Ij60WXGsM+SBcjHlbubaHRCSidITyvn9HIs4B/NJ8MuxWF
         i93HU5eF7le5GT0Diecat8RDQeUHAQH9sPbRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038523; x=1723643323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtnPxebiV0FOs9Be6cyaf3Vp45b5Mwz7UfucVn6WbxI=;
        b=Qh3AcLAo46LZEfNYbgqgNHyBDrL5Gg4qlnbOgvzZ4GI4DCr4/fs9rR4SPNuDw3vbjU
         McnfEAIcmclCLIC9fV9sqUyb9TUfZb4NRvlceqR9L6blW9QMOsIYl8yAJYNB0vytVxpi
         IJ50NCmYrUqLrqv8FERWz5y5rpiinuzbABrwhN4Nm8KzQwH3wSypBMYAGIIy6mTXw8WO
         OlYqQ1xu0BVzKTNbw/PoaLeuzA6amosZ3k8VljoAcfoFwmMQE8geRSJrm8rmC8GKasiQ
         TNRX6jKSCa97C5QxDGXvXUcY+4sWFJ56FTrOLyeNta4rvXGBO5f1zsYujcooByXWbv8B
         0yXg==
X-Gm-Message-State: AOJu0Yy7aEzMgxx9eTWaLGf2gKzK7qdNI7gFyerFoJ/hkB/y9TxqhU6r
	/4QkOSjifTx+u+F7gWTnA+eUhfG5v3XR1aMzwqJQ7jK/rHErfaxt62nTuTIpCkyNK3StYj9U+Vr
	y
X-Google-Smtp-Source: AGHT+IG4FXzaPjOkx4vTqxbBk8DdOUhH9rRyVIw44LocTNgv3PCN99jLkRnGQYbczuJH1gfp0oL8Xw==
X-Received: by 2002:aa7:d501:0:b0:584:8feb:c3a1 with SMTP id 4fb4d7f45d1cf-5b7f36f8e9fmr13738466a12.1.1723038523464;
        Wed, 07 Aug 2024 06:48:43 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/5] x86: Force proper gdt_boot_base setting
Date: Wed,  7 Aug 2024 14:48:18 +0100
Message-ID: <20240807134819.8987-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of relocate the value at that position compute it
entirely and write it.
During EFI boots sym_offs(SYMBOL) are potentially relocated
causing the values to be corrupted.
For PVH and BIOS the change won't be necessary but keep the
code consistent.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 5b82221038..abfa3d82f7 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -132,8 +132,7 @@ multiboot2_header:
 gdt_boot_descr:
         .word   .Ltrampoline_gdt_end - trampoline_gdt - 1
 gdt_boot_base:
-        .long   sym_offs(trampoline_gdt)
-        .long   0 /* Needed for 64-bit lgdt */
+        .quad   0 /* Needed for 64-bit lgdt */
 
 vga_text_buffer:
         .long   0xb8000
@@ -392,15 +391,16 @@ __efi64_mb2_start:
 x86_32_switch:
         mov     %r15,%rdi
 
-        /* Store Xen image load base address in place accessible for 32-bit code. */
-        lea     __image_base__(%rip),%esi
-
         cli
 
         /* Initialize GDTR. */
-        add     %esi,gdt_boot_base(%rip)
+        lea     trampoline_gdt(%rip),%esi
+        movl    %esi,gdt_boot_base(%rip)
         lgdt    gdt_boot_descr(%rip)
 
+        /* Store Xen image load base address in place accessible for 32-bit code. */
+        lea     __image_base__(%rip),%esi
+
         /* Reload code selector. */
         pushq   $BOOT_CS32
         lea     cs32_switch(%rip),%edx
@@ -458,7 +458,8 @@ __pvh_start:
         movb    $-1, sym_esi(opt_console_xen)
 
         /* Prepare gdt and segments */
-        add     %esi, sym_esi(gdt_boot_base)
+        lea     sym_esi(trampoline_gdt), %ecx
+        movl    %ecx, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
 
         mov     $BOOT_DS, %ecx
@@ -562,7 +563,8 @@ trampoline_bios_setup:
          *
          * Initialize GDTR and basic data segments.
          */
-        add     %esi,sym_esi(gdt_boot_base)
+        lea     sym_esi(trampoline_gdt), %ecx
+        movl    %ecx, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
 
         mov     $BOOT_DS,%ecx
-- 
2.45.2


