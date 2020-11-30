Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586682C8255
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40890.73904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgbv-0002vO-3c; Mon, 30 Nov 2020 10:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40890.73904; Mon, 30 Nov 2020 10:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgbv-0002uy-0C; Mon, 30 Nov 2020 10:40:47 +0000
Received: by outflank-mailman (input) for mailman id 40890;
 Mon, 30 Nov 2020 10:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUx-0000Uu-EL
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:35 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd410a64-db72-4953-8a83-8438d237a04e;
 Mon, 30 Nov 2020 10:32:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y7so17019212lji.8
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:19 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:17 -0800 (PST)
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
X-Inumbo-ID: bd410a64-db72-4953-8a83-8438d237a04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cBlwWPGKzEGxAAOiUlGssFOYms5RMEboYfXpdUQmleg=;
        b=jbVzVpyjkJDq4y8E5MaaQa+5tPgBBO1gUbVpVCKJCv2sSzYgKO3ASyhFoToueFJoVc
         BoO3t1tOtefZJ73282cqMkDoH4NzpFkoW4BF9j3/gvePFx9jgK0U1prSV/lnT4Jwq8Ho
         +oBmxy1QcC3yQeMiMPN10o6IzCl0t/8uSMx5vTHvTULDPGoDlEHNshDRMCBrF+uMRdo8
         3nCzit3goLRD5gtD1U7Pv4Z51Nw2W0O1ndKS6o4LLAYQrpIV0CDwyREPilAGWAeDhTrB
         a0o3nXnjWT8KFbvvVxjxMn0y/yG6WYMMc8fMO7B5p5J30+u+kSJT8Mn0VflJVHbbTGbb
         ug2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cBlwWPGKzEGxAAOiUlGssFOYms5RMEboYfXpdUQmleg=;
        b=dYPVcQiMvjEoxhuO45gToD4fFUGiev9pPeW4zph3SMVbA5Ud4Gui/+TGAenE9q0aYq
         +NyYQ35G4W9G09QWKN86EPkwKueqoUNbEqvOqIXxgByzaK5iw7XOeRf/roZjraShe8or
         ksXdR2M4EXyhU+TB5QvgjuE3A0soPpwgWNbraEI5CsIrSN2hogOZHwWjdpG+Nu9hkYcf
         4nTPnNrUnGM0CjYWwxWamgwav0Ll4HehGulrw1ywLzZ1w218Nt6RxFmzICenTVDPrHrY
         GufP4dC5JQF3/JmdH4uok+ZONktvFjNtCTef0PBRJwhqfdUCHBIhvfvklgrWFI8GtgCg
         1seQ==
X-Gm-Message-State: AOAM531o6quIwMq4xf6uW17YM2TaA9oA8Qd0/FuBpEANotZlxvFa6NCS
	6CmE6ih1oaDefD2ARLKLVSbulJdOQmhNsA==
X-Google-Smtp-Source: ABdhPJzYADassTkhsXa92/kInhE69nL47Ls14oh6muNSJGEg1ZrkemxdIuJKh8G5Qfuaxk8MNo3ECg==
X-Received: by 2002:a2e:5c2:: with SMTP id 185mr9454661ljf.79.1606732338314;
        Mon, 30 Nov 2020 02:32:18 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
Date: Mon, 30 Nov 2020 12:31:34 +0200
Message-Id: <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

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

Changes V2 -> V3:
   - no changes
---
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
index f08190c..2f39289 100644
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


