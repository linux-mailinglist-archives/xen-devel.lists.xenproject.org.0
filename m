Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC76A951F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505763.778715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aZ-0000ks-Ds; Fri, 03 Mar 2023 10:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505763.778715; Fri, 03 Mar 2023 10:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aZ-0000gl-8q; Fri, 03 Mar 2023 10:24:35 +0000
Received: by outflank-mailman (input) for mailman id 505763;
 Fri, 03 Mar 2023 10:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2aY-0000IE-4A
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:24:34 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 969a1106-b9ad-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:24:32 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id h9so1835599ljq.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:24:32 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 j22-20020a2e3c16000000b00295a36fedadsm239600lja.26.2023.03.03.02.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:24:31 -0800 (PST)
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
X-Inumbo-ID: 969a1106-b9ad-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQMX7LcJmPbPR7mQNYR7UFrgssX/7qk0j9FHn0813I0=;
        b=EGZSPfb1qxBJ8gSajlUU26oC52NZvWutZSTIuKkylFl5aDMVqaxG2V7xo8amflWTNh
         grUC6q9Qd9QzTLGPewN4l8tWRkGnjgi3gi7Al44XLxrIcBHpeQ6hAyuGYI9DXG+awqSn
         Ea0lyaH18gC+PHbLqEY6IywAnE5pqetDU5sWbRdlxFYh5ke4HUsbDA8aweBzbwLIGVLB
         Ix3iyNGyu6lGxL8yJC0w/gig7vwVByLonKuFUyZ1pZFiRnWCSEwO+eN3lWxHoIBIlccW
         Hsp6RTnJBJXugZZsonrX0cpF9Ki5zsnzqbUzud34r9qvSzMYjpbA6AID0GDm0fjB1wVf
         V2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQMX7LcJmPbPR7mQNYR7UFrgssX/7qk0j9FHn0813I0=;
        b=LkG4y2ds3xsDiXnxlJaqlFlFHMKflnS3xSquVKu68BOBlt4Uwxi+4O5ybKxhfJHiOA
         sNSUUnhH4zdSkzz9RNLLRrqWmqTVao0W5YHVSGZnfXn5JJAUYDpddR2ymQl0ZiT/s9wB
         3vc6bh9uaHM3XeosssU4hsCJIfooO2rNs754vYi5q672kLrijNQMKPNWWpqUziSW92hQ
         B3u6I2sFOEnnghCmLw9WOnC9L3ZhqDaRIGpLOp8ja36Z6P+Hct9FSOzIiX9Ddn8LzKD7
         d5yJCvSA/pX9QyX3VK194X1rheF6Ijc4WLNI2vdWeuGWJO8QIEp1JIDIrCJPiS2/sfVc
         ZzzQ==
X-Gm-Message-State: AO0yUKW4C4UOUqOkSfDi8lgFIOtf9KkOmNCD1b+T+5eWzGXSKziBZ5R+
	NBBTv8tvIjGB3Bn9ubXIvkGN1MbSV5E=
X-Google-Smtp-Source: AK7set+q2kWlmMtFb/0gUj+GDQ7jyqmb93rbVx/KMuCSDOgzUyYIe7riMnOTcJ6H9ZQtPDODt9rKMg==
X-Received: by 2002:a05:651c:221f:b0:293:4e43:c276 with SMTP id y31-20020a05651c221f00b002934e43c276mr541225ljq.22.1677839072032;
        Fri, 03 Mar 2023 02:24:32 -0800 (PST)
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
Subject: [PATCH v3 3/3] xen/riscv: initialize .bss section
Date: Fri,  3 Mar 2023 12:24:24 +0200
Message-Id: <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677838213.git.oleksii.kurochko@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S | 9 +++++++++
 xen/arch/riscv/setup.c        | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index adf5d6c74a..8887f0cbd4 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,3 +1,4 @@
+#include <asm/asm.h>
 #include <asm/riscv_encoding.h>
 
         .section .text.header, "ax", %progbits
@@ -18,6 +19,14 @@ ENTRY(start)
         li      t0, SSTATUS_FS
         csrc    CSR_SSTATUS, t0
 
+        /* Clear the BSS */
+        la      t3, __bss_start
+        la      t4, __bss_end
+.L_clear_bss:
+        REG_S   zero, (t3)
+        add     t3, t3, __SIZEOF_POINTER__
+        bltu    t3, t4, .L_clear_bss
+
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d9723fe1c0..929565720b 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,6 +7,14 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+/*  
+ * To be sure that .bss isn't zero. It will simplify code of
+ * .bss initialization.
+ * TODO:
+ *   To be deleted when the first real .bss user appears
+ */
+int dummy_bss __attribute__((unused));
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                unsigned long dtb_base)
 {
-- 
2.39.0


