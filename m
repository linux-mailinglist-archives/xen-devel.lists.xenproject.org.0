Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668330837F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77629.140777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J47-0007CL-I5; Fri, 29 Jan 2021 01:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77629.140777; Fri, 29 Jan 2021 01:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J47-00079R-01; Fri, 29 Jan 2021 01:59:15 +0000
Received: by outflank-mailman (input) for mailman id 77629;
 Fri, 29 Jan 2021 01:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Ivq-0004da-MA
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:42 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33856721-8e4d-4188-87f0-896a28741d34;
 Fri, 29 Jan 2021 01:49:26 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id v15so5733970ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:26 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:24 -0800 (PST)
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
X-Inumbo-ID: 33856721-8e4d-4188-87f0-896a28741d34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PS2Y4AZ7CaGH+jvzxCns83I8qf6IAANHgkaElFlh7Pc=;
        b=EASIFe7e8W285IsdY5ZsU7pbUZs9uMYhdtdtxWmhjdtTisYMCkSRGfbznqaQ2Ss/j0
         f9Zxgw9kY6ZU9fGoi6+ytoKQQYDoCDDzMz10IS8l76SUDqZR0NAqyyg6VpqMbVoPYdY3
         AgduovJ8Qf7ydKEt6gUIfHPPVQQapvnYEnJHUl0hN7HbchI4HnFNUiRD4ezwn0AFS8hM
         GqmbN9/zY1RFINlLXLhQnIJEr9uXBDbD1iSrzqDgLnsS5TDWnXtO8GwYGpOPdoHfqxut
         fyMaaEqernNgTbuEpu3SA4EdloVgmfViTBdJDbGuPI4jqyUa1metkLoqwRb63TzmiTK5
         l8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PS2Y4AZ7CaGH+jvzxCns83I8qf6IAANHgkaElFlh7Pc=;
        b=j6LkuprbaVMMpMLJe4e75A6tHXw4xOmhRdLPjrbB9zHJWedWLF/WMqGWK2b9t+ihru
         UXKfXwzMRygLZHPtZiGutrjF60fUkUx1MGayCh7F5CG3MP4vbvd0DasUtjwlFL3G6Hep
         n7bnVHFklUY1YfPrutuYYGPfRvl6EmfnInKJz3G+0W1kEvI88weGD0Gjvt7vmvZekDUp
         t6LgsOf3idlf19hGwbwu9PgC4BogxmI5Ig68vx7vfouUfongQAkVzmHS3LuM3HMACCBO
         BKtHyhPkmi9YwmfbRRi2VXWmxDgY4ytqx56GJvQj46Z4GNvdFteU1Cp+W/o8gO4Gj4sP
         /VXw==
X-Gm-Message-State: AOAM533zSAM7J2CxBLyaHp/9z9B3VbgMLuFLOAYfkefKJmgpvv2zibcM
	t6kIlXSGkLzLshEvKDgiaMm2n0bAbN2rQg==
X-Google-Smtp-Source: ABdhPJx2qq2uckNQzPqI5wsNqwcjBbwhtIIclwaWFXnk/F0UcG378prNRgIXR7dY0+QNWH8NaOfKTQ==
X-Received: by 2002:a2e:850c:: with SMTP id j12mr1224965lji.298.1611884965401;
        Thu, 28 Jan 2021 17:49:25 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 19/24] xen/arm: io: Abstract sign-extension
Date: Fri, 29 Jan 2021 03:48:47 +0200
Message-Id: <1611884932-1851-20-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In order to avoid code duplication (both handle_read() and
handle_ioserv() contain the same code for the sign-extension)
put this code to a common helper to be used for both.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch

Changes V2 -> V3:
   - no changes

Changes V3 -> V4:
   - no changes here, but in new patch:
     "xen/arm: io: Harden sign extension check"

Changes V4 -> V5:
   - add Stefano-s R-b

Changes V5 -> V6:
   - no changes

---
---
 xen/arch/arm/io.c           | 18 ++----------------
 xen/arch/arm/ioreq.c        | 17 +----------------
 xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 7ac0303..729287e 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -25,6 +25,7 @@
 #include <asm/current.h>
 #include <asm/ioreq.h>
 #include <asm/mmio.h>
+#include <asm/traps.h>
 
 #include "decode.h"
 
@@ -40,26 +41,11 @@ static enum io_state handle_read(const struct mmio_handler *handler,
      * setting r).
      */
     register_t r = 0;
-    uint8_t size = (1 << dabt.size) * 8;
 
     if ( !handler->ops->read(v, info, &r, handler->priv) )
         return IO_ABORT;
 
-    /*
-     * Sign extend if required.
-     * Note that we expect the read handler to have zeroed the bits
-     * outside the requested access size.
-     */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
-    {
-        /*
-         * We are relying on register_t using the same as
-         * an unsigned long in order to keep the 32-bit assembly
-         * code smaller.
-         */
-        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
-        r |= (~0UL) << size;
-    }
+    r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
 
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 43f5d6b..308650b 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
     const union hsr hsr = { .bits = regs->hsr };
     const struct hsr_dabt dabt = hsr.dabt;
     /* Code is similar to handle_read */
-    uint8_t size = (1 << dabt.size) * 8;
     register_t r = v->io.req.data;
 
     /* We are done with the IO */
@@ -37,21 +36,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
     if ( dabt.write )
         return IO_HANDLED;
 
-    /*
-     * Sign extend if required.
-     * Note that we expect the read handler to have zeroed the bits
-     * outside the requested access size.
-     */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
-    {
-        /*
-         * We are relying on register_t using the same as
-         * an unsigned long in order to keep the 32-bit assembly
-         * code smaller.
-         */
-        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
-        r |= (~0UL) << size;
-    }
+    r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
 
diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index c4a3d0f..c6b3cc7 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -84,6 +84,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
         (unsigned long)abort_guest_exit_end == regs->pc;
 }
 
+/* Check whether the sign extension is required and perform it */
+static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
+{
+    uint8_t size = (1 << dabt.size) * 8;
+
+    /*
+     * Sign extend if required.
+     * Note that we expect the read handler to have zeroed the bits
+     * outside the requested access size.
+     */
+    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    {
+        /*
+         * We are relying on register_t using the same as
+         * an unsigned long in order to keep the 32-bit assembly
+         * code smaller.
+         */
+        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
+        r |= (~0UL) << size;
+    }
+
+    return r;
+}
+
 #endif /* __ASM_ARM_TRAPS__ */
 /*
  * Local variables:
-- 
2.7.4


