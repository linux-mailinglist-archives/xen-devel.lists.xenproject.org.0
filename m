Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310336A8373
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 14:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504922.777379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuA-00005N-J8; Thu, 02 Mar 2023 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504922.777379; Thu, 02 Mar 2023 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuA-0008TH-Es; Thu, 02 Mar 2023 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 504922;
 Thu, 02 Mar 2023 13:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXiu9-0008Qd-Dk
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 13:23:29 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a480313-b8fd-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 14:23:26 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id t14so17578814ljd.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 05:23:26 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05651c048800b00290679ebac1sm2109551ljc.9.2023.03.02.05.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:23:25 -0800 (PST)
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
X-Inumbo-ID: 6a480313-b8fd-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677763406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrA0iYFCR4ncdpexRkMJ+7MgkO9AgTh8mz6kQeU8h+o=;
        b=AjsUzrH84OxVO8RIOWzgeLAumthUbfkJTRGXH9QgOM04DUyXL8Bu/z0aM2yYZ5ARDd
         nuJ29lbO39yywp/bKKMsG72zud/brTiOP/jZODaw7zo5+nghlqWKvyxHFowACD3zwMp4
         tmIgQFVrgBmypuafzS1Mgtz3FaQbN9ElRqB1tOAn6SUHuazbvwiBuHeHme0aVSZzdJPn
         40vbTVDS2f0/5G6RD6/fEdF9Rf0A5n2uac2WFpwvjArWRyLF3emy9usYkdVtACUaWCZW
         c5aYzmPNmEUBSyQGaZw2uTp0Yyn3K+Gihg5jtB0ch7snHDMBT0eSKgkV7m8FY4iTx1Yk
         SGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrA0iYFCR4ncdpexRkMJ+7MgkO9AgTh8mz6kQeU8h+o=;
        b=71g7sYaei5SkeBK8blC7yDz3Tfk8OCDAYqPqPwF3babGKax3f5pAJPBSrHTxrbZoHy
         dm7Rd4917/TTMKeD9LWaLzMbwrXQGWj7zwGf95F8/PjJsiFnj3DiS3QOxwVmL1xjhDBO
         cwmeHduaDJcYPdbH1/xchHhvwTA4Co7wsuejHWCw1obdXMVPkQnAKP++KZuqpma/y8B7
         h8EdY+3UR0JE/ww5cZPTHdEe3nmit2Hlpvqvi5X/7wGVUpjY4GQWQx5sLPJ82CwH/J/d
         kAIfAot+iA3Ni+u8eGNNbOdKJ8RYXyvjmDAambX/1dpzOfgvG4aew7LEZ4MDytlHwIZr
         n0Dg==
X-Gm-Message-State: AO0yUKWJKvnGQ9lfkBUf6RGLlYFf111eB+uqQDyTY1sKA84TGpFBzsVL
	hoF8xzKzE+aOnO5Uo8/tzBXUVB2U2UY=
X-Google-Smtp-Source: AK7set+8wFX5A2EYqKw+8A7DbB1spXHihKRDg6dn1++XEl/b6f6lpLTLXFNYNt1l5kSZCqjsJBtxvQ==
X-Received: by 2002:a2e:b0d3:0:b0:295:b2f0:a858 with SMTP id g19-20020a2eb0d3000000b00295b2f0a858mr2852131ljl.10.1677763406277;
        Thu, 02 Mar 2023 05:23:26 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 1/3] xen/riscv: read/save hart_id and dtb_base passed by bootloader
Date: Thu,  2 Mar 2023 15:23:18 +0200
Message-Id: <3edbb40e86e480b2b71d596ff61c05336004b14c.1677762812.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677762812.git.oleksii.kurochko@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v1:
 * read/save/pass of hart_id and  dtb_base passed by a bootloader
   were moved to head.S. 
 * Update start_xen() to recieve hard_id & dtb_base
---
 xen/arch/riscv/riscv64/head.S | 24 ++++++++++++++++++++++++
 xen/arch/riscv/setup.c        |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index ffd95f9f89..851b4691a5 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,3 +1,4 @@
+#include <asm/asm.h>
 #include <asm/riscv_encoding.h>
 
         .section .text.header, "ax", %progbits
@@ -6,8 +7,31 @@ ENTRY(start)
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
+        /* Save HART ID and DTB base */
+        lla     a6, _bootcpu_id
+        REG_S   a0, (a6)
+        lla     a6, _dtb_base
+        REG_S   a1, (a6)
+
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
+        lla     a6, _bootcpu_id
+        REG_L   a0, (a6)
+        lla     a6, _dtb_base
+        REG_L   a1, (a6)
+
         tail    start_xen
+
+        /*
+         * Boot cpu id is passed by a bootloader
+         */
+_bootcpu_id:
+        RISCV_PTR 0x0
+
+        /*
+         * DTB base is passed by a bootloader
+         */
+_dtb_base:
+        RISCV_PTR 0x0
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 1c87899e8e..d9723fe1c0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,7 +7,8 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
-void __init noreturn start_xen(void)
+void __init noreturn start_xen(unsigned long bootcpu_id,
+                               unsigned long dtb_base)
 {
     early_printk("Hello from C env\n");
 
-- 
2.39.0


