Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543CF662A6A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473753.734565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMm-0003Uu-G6; Mon, 09 Jan 2023 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473753.734565; Mon, 09 Jan 2023 15:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMm-0003Or-5h; Mon, 09 Jan 2023 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 473753;
 Mon, 09 Jan 2023 15:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMk-0001Ok-UG
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e24e44e0-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:12 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id qk9so21190192ejc.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:13 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:12 -0800 (PST)
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
X-Inumbo-ID: e24e44e0-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIal1kdq10TTB4IAGmI/j0NwEpx7kAoI5BB7eBhw2c4=;
        b=X6IzhvtXWr5L9CiA8iGBX4kCz93hvBhLwnP8ZtqJPSMr76fMAiVYmZ3vg8QaDnCgvr
         bzwQrLc6TMtZ/rCzBEcamajk03RWeXoiecRRdaQr6BEVq3QVGvSmZ3MlC0e+BqMEXQ7D
         T3ddrQktmO/+w4+jQGLGio6IxcQVEM0hiT1o2QhyTMbxG3FPcUJvpUhCOiiiZ1nmG2zy
         bWsy+dUeI8em63dtTOkABTf/0UGzBUa4PbGPuqqMPH8LUaRugXDXzCjoX2PE26OrEKSj
         JJrl2u/i6PzGKJf7mUVVvJtbgD75uTEaqsktxMjEgNXnnnV3vZceIWP0OvdthFtZUK+2
         +LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIal1kdq10TTB4IAGmI/j0NwEpx7kAoI5BB7eBhw2c4=;
        b=7WHJDpAeOZNYZgFBgcO2Ydv7njRYvGPPJSxFo6KwTfzCSiRZkk5IJCd3XawluLW62k
         sQbZXDk3wSiJlz4G6XrwUhJY+TUVhFwo7fc6cygYAqy5aBBigi7oarrOYH7V7j0C65g0
         RtE+afdI2tqnGWvJz7lqx4jzy3XPB0WIOMm905b82uunhuiQ7xyAy71dz8lOobbOcYbF
         k6+cfQAQ+FbmPKIqXbf219Z8lyvccXKssLaUMbnFaTNCN40oWMm8VG5XHY1aFybdxhlR
         uz7IWUuhd/2hdG3TgvJ8e4oCn57RIKY5MpycTAFF5JN8pPM6/eJuQwre1vedPNSTgNnC
         34EA==
X-Gm-Message-State: AFqh2kppSZQifeejXVtBRYlcnubmeDriv9urXX878EWBIaldsb2QSY5K
	US5CYU3zDW8VkI759ReQt6EekzcLzDObng==
X-Google-Smtp-Source: AMrXdXsjwJwsKL7IqSx/UEmA78Tx6k+7Bgr/10WtTZ8nfNqziQbzWADBp4e3VxAIHznhJt2Cos4E5A==
X-Received: by 2002:a17:906:4892:b0:84d:489b:f1b1 with SMTP id v18-20020a170906489200b0084d489bf1b1mr3172007ejq.75.1673279232532;
        Mon, 09 Jan 2023 07:47:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 7/8] xen/riscv: print hello message from C env
Date: Mon,  9 Jan 2023 17:46:54 +0200
Message-Id: <837bb553a539713d4aa15bb169142018bf508afe.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S |  4 +---
 xen/arch/riscv/setup.c        | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index c1f33a1934..d444dd8aad 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -5,6 +5,4 @@ ENTRY(start)
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
-_start_hang:
-        wfi
-        j       _start_hang
+        tail    start_xen
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 41ef4912bd..586060c7e5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,18 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 
+#include <asm/early_printk.h>
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
+
+void __init noreturn start_xen(void)
+{
+    early_printk("Hello from C env\n");
+
+    for ( ;; )
+        asm volatile ("wfi");
+
+    unreachable();
+}
-- 
2.38.1


