Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECE2F3C0C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66105.117400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRhA-0004fc-Tt; Tue, 12 Jan 2021 21:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66105.117400; Tue, 12 Jan 2021 21:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRhA-0004bo-Aa; Tue, 12 Jan 2021 21:59:20 +0000
Received: by outflank-mailman (input) for mailman id 66105;
 Tue, 12 Jan 2021 21:59:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRct-0002PK-K1
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:55 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89569031-775c-4f8d-9bf7-33356974a3f3;
 Tue, 12 Jan 2021 21:53:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i9so22313wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:13 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:12 -0800 (PST)
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
X-Inumbo-ID: 89569031-775c-4f8d-9bf7-33356974a3f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mGbtY4ekbbtE/VZfKxRi6ik4jZjcmPPDvGdUbgYeomY=;
        b=R+KM6NJLAAKJRp7GgcdcfKDebUTS1tYsg7s8PNMs32duBdOOSHDAiFmuTxw3ljud6U
         pz8/RAdUTkggEQoNMQZDV1+3xsHaELYNwJaky3kgjt5yhxjX8SXv0QhVg+qJrDR4LC2K
         y7zE4YhCkRI0ezGxEwXuAy+meRrD1qFo4Mss4b+QRlQP/ewP9+OM9byYz2I+fRxd8kgV
         edG/QgsClP883OhknDNyBhNqJev40JTtqXYVjGOd2tQCdGkxhN007bS5bFxNleEe8laP
         OSGI61+prNTupZqWZjgWPKtBELS7zH4ko6fdOjTyht4fNH/i6ZsTw3JCXt2j5e/HhcrU
         uNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mGbtY4ekbbtE/VZfKxRi6ik4jZjcmPPDvGdUbgYeomY=;
        b=DzaytzZpgYjAWRGGPWDgSXIjeNAyzsVvpijFJY56Q347pCkhwag9H0lxYHQqv6Mo8j
         8T8bifzEO5lWG0plHpi+yL2Vqe8uMOvtryvW4Egurpb3OMhEU7EMEc4EVgtSzoN2wXk1
         0yPtqIdcNwpueXDT9urwHx0kxEkkTOnPLdBBPMZgFB7Lf8TAvFq3I14NPbopkVP5cCci
         jEV4tWKugGquGq7QcsEbbQIeXCImRg4MVgyAyDYHqSqJ8WT7ph04/+17ySENFwbl/pup
         6mAwThOAdd3JWVYzWqgfw+lp27l7CwiF4T+quXJ7M6Kbv3S4xHhdA1ba38ksB1JztHGV
         aQbQ==
X-Gm-Message-State: AOAM5327G2q9ByByiurpJLIh1a2MW+dpI7jjh4nGwgcjjbBXJ5vRERkE
	agvXpYDZ/kSdOqHo2bbZXfwasAZt8RFrBw==
X-Google-Smtp-Source: ABdhPJz2KezndcVpBKfrPhdwl3q8eh6cVscb/37x6CQuUAYyjsjvgpDboQyklYrp6d/4BcKc77wzWg==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr765538wrn.179.1610488392939;
        Tue, 12 Jan 2021 13:53:12 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 19/24] xen/arm: io: Abstract sign-extension
Date: Tue, 12 Jan 2021 23:52:27 +0200
Message-Id: <1610488352-18494-20-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In order to avoid code duplication (both handle_read() and
handle_ioserv() contain the same code for the sign-extension)
put this code to a common helper to be used for both.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
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
---
 xen/arch/arm/io.c           | 18 ++----------------
 xen/arch/arm/ioreq.c        | 17 +----------------
 xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 9814481..307c521 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -24,6 +24,7 @@
 #include <asm/cpuerrata.h>
 #include <asm/current.h>
 #include <asm/mmio.h>
+#include <asm/traps.h>
 #include <asm/hvm/ioreq.h>
 
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
index 3c4a24d..40b9e59 100644
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
index 997c378..e301c44 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
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


