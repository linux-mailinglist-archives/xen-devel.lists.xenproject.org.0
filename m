Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB592595C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752894.1161168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS4-0004lp-QV; Wed, 03 Jul 2024 10:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752894.1161168; Wed, 03 Jul 2024 10:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS4-0004fz-JL; Wed, 03 Jul 2024 10:43:04 +0000
Received: by outflank-mailman (input) for mailman id 752894;
 Wed, 03 Jul 2024 10:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOxS2-0003zy-MD
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:43:02 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04cf92dc-3929-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 12:43:01 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7241b2fe79so575648766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:43:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b92985desm414590066b.78.2024.07.03.03.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:42:59 -0700 (PDT)
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
X-Inumbo-ID: 04cf92dc-3929-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720003380; x=1720608180; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pLr0uyErdUGlpbnK/HxLvapfSaB11DzNANAbBgSYDg=;
        b=NCKRIFPiJ76VtuonhrfZH0ldTMo+Y7bFBAa3pw0jvXUcCk5cXj6Kisoxcf89HQAg73
         0zLnCNoSGKRJiZ1Zy0LCE5ta6PMgGwbnWpg7lvk+AhH5hv5MMMxR6t1RjjSrz0QJFSOP
         0ZBmIJfxi6LglSuXYTR7czr+td0C5oapkiXa3/E6h7ficUzzR3uF709l3u9WMXK+nZOa
         UvzootZCTA5yqr+s8EokIvppjGR/74Xk815vCDkEZg/d+c8VZXW4TiYbgjRttg4kiLAq
         IOj984Twlr1o2HHBHddIJUs0Q9FCFxeMMt2Ts0hAuD7nXWVsu/oJVC0cNSpWHXSeqeXX
         RTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003380; x=1720608180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pLr0uyErdUGlpbnK/HxLvapfSaB11DzNANAbBgSYDg=;
        b=rmLgeUhhP/4wQwWac5HxueJTFMnt7BQmUkKNbMnCoy9ET/zsUZgzfphv0pjAqA1JRP
         15tfyK/H3bLvZ7hXq1ZAAK1lHpvCfqLp1gthGv11MKGJf2oaht9mRBZAyjVGqTvdJ+/I
         g53I2PlCREMfbkkmoCWzeTZfNgUVjJugqPbDLY8quszCs3yaV3wpKTheYd38vSyg0o0c
         Cir7cBpDDZaU2Clhzc5906k4syvcJOTKG6EsNgt/7Jkzvk8EPbuX5gDbfBKc0Hg17Z8x
         oTJK/c0EMVDCJg+OXa1tLY4KmJOT911EH9J/HPDl7ejrw8nRpqXxR9VoscGk0EFjw0qg
         SbkQ==
X-Gm-Message-State: AOJu0YxQb8NaxdLmwDuZMRuHSUdgJ5ZaGXaJOfZawLdaKgR02I0WZXee
	KwLkOXA3snOnErrB8omUiiKFYTCktp5ETtBUlpSri3FKtNE/Une9KUYnihm5
X-Google-Smtp-Source: AGHT+IH3O6KWGvDg2t91/NyMVCFCqzBu4loX4h2mF+Jp6kwL5bKL+02NZHeN4ouuhErBQnF9C49v+g==
X-Received: by 2002:a17:907:7295:b0:a72:7bf4:694c with SMTP id a640c23a62f3a-a751443c582mr1021317066b.16.1720003379590;
        Wed, 03 Jul 2024 03:42:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 5/5] xen/riscv: map FDT
Date: Wed,  3 Jul 2024 12:42:51 +0200
Message-ID: <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720002425.git.oleksii.kurochko@gmail.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Except mapping of FDT, it is also printing command line passed by
a DTB and initialize bootinfo from a DTB.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S |  3 +++
 xen/arch/riscv/setup.c        | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..22fb36a861 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -41,6 +41,9 @@ FUNC(start)
 
         jal     setup_initial_pagetables
 
+        mv      a0, s1
+        jal     fdt_map
+
         /* Calculate proper VA after jump from 1:1 mapping */
         la      a0, .L_primary_switched
         sub     a0, a0, s2
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 4f06203b46..b346956e06 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,7 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/bug.h>
 #include <xen/compile.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 
@@ -33,15 +35,34 @@ static void test_macros_from_bug_h(void)
     printk("WARN is most likely working\n");
 }
 
+void __init fdt_map(paddr_t dtb_addr)
+{
+    device_tree_flattened = early_fdt_map(dtb_addr);
+    if ( !device_tree_flattened )
+    {
+        printk("wrong FDT\n");
+        die();
+    }
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
+    size_t fdt_size;
+    const char *cmdline;
+
     remove_identity_mapping();
 
     trap_init();
 
     test_macros_from_bug_h();
 
+    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
+
+    cmdline = boot_fdt_cmdline(device_tree_flattened);
+    printk("Command line: %s\n", cmdline);
+    cmdline_parse(cmdline);
+
     printk("All set up\n");
 
     for ( ;; )
-- 
2.45.2


