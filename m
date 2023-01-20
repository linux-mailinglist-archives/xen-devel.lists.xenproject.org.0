Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCDA6757F1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481863.747122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssN-0000gM-Po; Fri, 20 Jan 2023 15:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481863.747122; Fri, 20 Jan 2023 15:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssM-0000OQ-VG; Fri, 20 Jan 2023 15:00:18 +0000
Received: by outflank-mailman (input) for mailman id 481863;
 Fri, 20 Jan 2023 15:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssJ-0006Kg-Bn
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 250e287b-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:14 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1306072wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:14 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:13 -0800 (PST)
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
X-Inumbo-ID: 250e287b-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0WSKOVdhD4de0NUU+Vb5gE8iDFJmgnw6gPb5txxrQY=;
        b=e8j5MC51WuX1KTMJ4V2AqT+Klh1/1PCd2GapwqibHdga4oR6gQyn4MNcchnerhVGQy
         Zo0jkGlnLaxnG+ETs5b9y+DQBzK5vWxFcda1YtMY9S4BZrHoICTqFCbL1BaWa6Omqtfw
         SvPbOzPgha6xA4ivGfslns5gFQLiBWOk+1mYqi9Z46CL+A5FGyCz7OULzqwtx6o7YS8H
         qkz+kVn3FQwxufSSfukNf8iR8vbH+EPKbkJ8KZNpSJhhDMoJ4++fZeJcsZH4rYKYGPcK
         BijLMuxwbQ/yG3/+e/uoj6hC+UbkWPJNad5TX+Uzc4+dIOMQgEbFRqx+l3zdPaIX5/J0
         xaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0WSKOVdhD4de0NUU+Vb5gE8iDFJmgnw6gPb5txxrQY=;
        b=kW0IVZ15cb8gnC1B8+qi/C3IAXdqpROwWvXzK3fnvDXKTG27mMWOsSW3l8FcAUR0mO
         B5+OZWKl5lxHoqB4IOEtkcpqAXbGJMaAqxd1Hlq2LjneMYtyJpXAOD9cUuS5Xr5LZFhS
         LQkC7VJ5EV1ebAGtX7teoSjZtHwApLAyoUXc3gvmTB1HBjYvr/M1jP9jlYCdNmNEZ5xj
         uH82L02b8e905xm092YkOdUJSqBxpasJ3W/56BgtHied6fCxMqpvwO2ZTWBq2X3qEoRI
         hnLNKq26bTMm8MFe4+mGjYIJGX/jPTEfcDbYeYO+hTYCPR/qzIaSdYs6zO3ANqYAjvN5
         V7bQ==
X-Gm-Message-State: AFqh2ko3t0cxle4JpI/SZT73rhHI0MFPjRxv+TFLjWshZhQK/t2t4GGv
	1VQG+XGXTtz0/iFZP9iF8NE0m+jrClEHSQ==
X-Google-Smtp-Source: AMrXdXuk77JOnphr6uSGPpR0kTywUv+ylWZkshdS4OpyJnEN1ImoV2Xg9Ua/LTaJTKstYoR4X1nNpQ==
X-Received: by 2002:a05:600c:1e09:b0:3d1:f16d:5848 with SMTP id ay9-20020a05600c1e0900b003d1f16d5848mr14355775wmb.26.1674226813902;
        Fri, 20 Jan 2023 07:00:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 11/14] xen/riscv: introduce setup_trap_handler()
Date: Fri, 20 Jan 2023 16:59:51 +0200
Message-Id: <b8d03f33aea498bb5fde4ccdc16f023bbe208e7f.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d09ffe1454..174e134c93 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,16 +1,27 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+static void setup_trap_handler(void)
+{
+    unsigned long addr = (unsigned long)&handle_exception;
+    csr_write(CSR_STVEC, addr);
+}
+
 void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
+    setup_trap_handler();
+    early_printk("exception handler has been setup\n");
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.0


