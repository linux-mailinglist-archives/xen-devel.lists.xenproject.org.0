Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF228F733
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7609.20058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VB-0007Aj-Sc; Thu, 15 Oct 2020 16:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7609.20058; Thu, 15 Oct 2020 16:53:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VB-00079d-Fu; Thu, 15 Oct 2020 16:53:17 +0000
Received: by outflank-mailman (input) for mailman id 7609;
 Thu, 15 Oct 2020 16:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6Oc-0004yr-7t
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:30 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 811b3513-adc9-4cb8-b290-00b531824646;
 Thu, 15 Oct 2020 16:45:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so3810777ljg.10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:13 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:11 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6Oc-0004yr-7t
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:30 +0000
X-Inumbo-ID: 811b3513-adc9-4cb8-b290-00b531824646
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 811b3513-adc9-4cb8-b290-00b531824646;
	Thu, 15 Oct 2020 16:45:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so3810777ljg.10
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=47uSMzel/qyKvhdlJs+JuPDeminjR3OYh46RDdFyYQ0=;
        b=fG3fb6woHBFXSTVeiwPo9CpE+xX7xDaX3P/Ipp+QjUKLXEPN7utLwZsQnDYIXMZRhY
         sPxnO3QYtPIwozFSmAwgEqqXOZi2a3qGVy7JMgDgFFWzSAGSRUXkfhwD26mPruIIsgud
         5B1pJBwOjUw1CKnNCvZpxhWVWm4PqNPaegEzPTetVmJNgAsKmJQqqLx4V2qBWXjPmZXQ
         XVdn043F/aLeDZ8cwaeoNLq/fRNu2MBsCkNNlY31vhkb3IwiccabZxC81G+/juWmu+0m
         j3PjHniDNzVNyRul3upS2vMh/XMkbfpcLh/vKfO5t+z+vtinujboWf4TBxO6hBmvrlrU
         /5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=47uSMzel/qyKvhdlJs+JuPDeminjR3OYh46RDdFyYQ0=;
        b=WsXEXKtNeJ3f6R5sdvVlN25wbpeAIAm81v4/0uwKKyq65tZar637QfDu8UodFFb88i
         lEukt4RjigORHCneruwrricmumQWEWktMa2Msa9lOu4H/qH3N4pzV1pWBuPML9U1pgQQ
         n6TgE510h83aaGMcTd+/AByKJb59x3UiD38wp5fao+gQX31r5vDjJ3miE+gn2vuRRQZZ
         XZ6A5zOcqBDnhdzekwtiaezWI4SI3JKVNkDSZDSaDwAwTCpcjfrcWyy7ecZiWXAflcPh
         HIedMZubJ65UPntoVepZ9cTxj1OjrG/7EjNzK0+GYWaF4E5KNpc//eR6f7wiC1jaq+vi
         qjaQ==
X-Gm-Message-State: AOAM531vJpSqLL6+A0J5/8wERo4zad12c/uh3O7Ejeoqwe5JhLJ7rvdY
	jFiEDQtzVLOfQRnECcvhdETzgHwRLEXewQ==
X-Google-Smtp-Source: ABdhPJywyMpzDJLnEtIr2K9tTpva81uus1tSMSmwnOhgcs9eIfdM4k5UwxqS97psn9uT12wdbF171g==
X-Received: by 2002:a2e:8582:: with SMTP id b2mr1570200lji.376.1602780312263;
        Thu, 15 Oct 2020 09:45:12 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:11 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 19/23] xen/arm: io: Abstract sign-extension
Date: Thu, 15 Oct 2020 19:44:30 +0300
Message-Id: <1602780274-29141-20-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In order to avoid code duplication (both handle_read() and
handle_ioserv() contain the same code for the sign-extension)
put this code to a common helper to be used for both.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch
---
 xen/arch/arm/io.c           | 18 ++----------------
 xen/arch/arm/ioreq.c        | 17 +----------------
 xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index f44cfd4..8d6ec6c 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -23,6 +23,7 @@
 #include <asm/cpuerrata.h>
 #include <asm/current.h>
 #include <asm/mmio.h>
+#include <asm/traps.h>
 #include <asm/hvm/ioreq.h>
 
 #include "decode.h"
@@ -39,26 +40,11 @@ static enum io_state handle_read(const struct mmio_handler *handler,
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
index da5ceac..ad17b80 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
     const union hsr hsr = { .bits = regs->hsr };
     const struct hsr_dabt dabt = hsr.dabt;
     /* Code is similar to handle_read */
-    uint8_t size = (1 << dabt.size) * 8;
     register_t r = v->io.io_req.data;
 
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


