Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8302F3C0B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66104.117392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRh9-0004c1-N5; Tue, 12 Jan 2021 21:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66104.117392; Tue, 12 Jan 2021 21:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRh9-0004Zc-87; Tue, 12 Jan 2021 21:59:19 +0000
Received: by outflank-mailman (input) for mailman id 66104;
 Tue, 12 Jan 2021 21:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRdD-0002PK-KW
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:55:15 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 261ce1d2-5879-425d-aa15-38c7ac3d5095;
 Tue, 12 Jan 2021 21:53:16 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m4so526wrx.9
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:15 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:14 -0800 (PST)
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
X-Inumbo-ID: 261ce1d2-5879-425d-aa15-38c7ac3d5095
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MIH572tckzyqDgDHK6bJ/MeONG4OmFZM99c4IxUYjYE=;
        b=BIagn9PvZ/HwuH3xthBj4COy1oPZhIRA+YxMR8kaA4A4t5Gah8MAA0dU8NOqdojYXD
         XpX+oDshCS9lWFklfEtfd7gJs6XwyyHlvFjrCBTVJKZwRZP4wJW/61+M62qM9KV/UmR+
         +3qqTyNb0MjWrrxym5pc0AKVWHDcV0ek8iInuAR3yQLSzrrmK91nJqn/zPVGoljdZ0dI
         EXhE5/JRYjGNKgTJEF4iGSu8p9POSruBePkZJMZB1DT57ftiSPMqxB/RMio97JRGdfED
         R9IvBtv1cchXTHOhfRSGygqydA1WqYwu4c5ImoryE9MXicBhv8GrZ77KT2C/63l0cAtU
         Zz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MIH572tckzyqDgDHK6bJ/MeONG4OmFZM99c4IxUYjYE=;
        b=lx5chgaAgdOPvli+0CBF5+Ew5z+wgg476GwKIPLcYj5m4J6IJuab8J1TVxVImQ41Op
         oXeVqeLN8kCLhqQeS2zzvPqWbNFCYsFEHF961AxoBva7hLf3ybAhts3/HzOKiv9HOL1F
         GZJ7ggKWLMQZlFLqXF/p3xgspTwPuxbLgQqTeHuisEY8mXBHvc1kSoqqErqPrDoa4fN3
         S06OOmENwkzmrbAUpd/0gnB1iX2gTEhgG4aIBZ4Lgq9bsTY61KPRddJRUe3abUHVTCvh
         qzDKBVZyX5ZodDapYzpWj/b7F4UZhSewPLB26hmobpyeaNKEJfwTKVTDfbQMdRxG9ezC
         14cQ==
X-Gm-Message-State: AOAM531TXDLcwZD6hS5vE2thJclanBrmaL/bvu1dHSeigAtiH9MRMYas
	rCV1zfRRjySOWYGMS8n7xjRQCzkLi5bzDw==
X-Google-Smtp-Source: ABdhPJy3JpnToaWfrCjEpOpi7uYU4eOVdsOkcmAUkT2iwJ4tj7hoOQQyRD30gOSPkpEV9rvJZG8iuw==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr795876wrn.181.1610488394917;
        Tue, 12 Jan 2021 13:53:14 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 21/24] xen/ioreq: Make x86's send_invalidate_req() common
Date: Tue, 12 Jan 2021 23:52:29 +0200
Message-Id: <1610488352-18494-22-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As the IOREQ is a common feature now and we also need to
invalidate qemu/demu mapcache on Arm when the required condition
occurs this patch moves this function to the common code
(and remames it to ioreq_signal_mapcache_invalidate).
This patch also moves per-domain qemu_mapcache_invalidate
variable out of the arch sub-struct (and drops "qemu" prefix).

We don't put this variable inside the #ifdef CONFIG_IOREQ_SERVER
at the end of struct domain, but in the hole next to the group
of 5 bools further up which is more efficient.

The subsequent patch will add mapcache invalidation handling on Arm.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - move send_invalidate_req() to the common code
   - update patch subject/description
   - move qemu_mapcache_invalidate out of the arch sub-struct,
     update checks
   - remove #if defined(CONFIG_ARM64) from the common code

Changes V1 -> V2:
   - was split into:
     - xen/ioreq: Make x86's send_invalidate_req() common
     - xen/arm: Add mapcache invalidation handling
   - update patch description/subject
   - move Arm bits to a separate patch
   - don't alter the common code, the flag is set by arch code
   - rename send_invalidate_req() to send_invalidate_ioreq()
   - guard qemu_mapcache_invalidate with CONFIG_IOREQ_SERVER
   - use bool instead of bool_t
   - remove blank line blank line between head comment and #include-s

Changes V2 -> V3:
   - update patch description
   - drop "qemu" prefix from the variable name
   - rename send_invalidate_req() to ioreq_signal_mapcache_invalidate()

Changes V3 -> V4:
   - change variable location in struct domain
---
 xen/arch/x86/hvm/hypercall.c     |  9 +++++----
 xen/arch/x86/hvm/io.c            | 14 --------------
 xen/common/ioreq.c               | 14 ++++++++++++++
 xen/include/asm-x86/hvm/domain.h |  1 -
 xen/include/asm-x86/hvm/io.h     |  1 -
 xen/include/xen/ioreq.h          |  1 +
 xen/include/xen/sched.h          |  5 +++++
 7 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index ac573c8..6d41c56 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -20,6 +20,7 @@
  */
 #include <xen/lib.h>
 #include <xen/hypercall.h>
+#include <xen/ioreq.h>
 #include <xen/nospec.h>
 
 #include <asm/hvm/emulate.h>
@@ -47,7 +48,7 @@ static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = compat_memory_op(cmd, arg);
 
     if ( (cmd & MEMOP_CMD_MASK) == XENMEM_decrease_reservation )
-        curr->domain->arch.hvm.qemu_mapcache_invalidate = true;
+        curr->domain->mapcache_invalidate = true;
 
     return rc;
 }
@@ -326,9 +327,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
 
     HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu -> %lx", eax, regs->rax);
 
-    if ( unlikely(currd->arch.hvm.qemu_mapcache_invalidate) &&
-         test_and_clear_bool(currd->arch.hvm.qemu_mapcache_invalidate) )
-        send_invalidate_req();
+    if ( unlikely(currd->mapcache_invalidate) &&
+         test_and_clear_bool(currd->mapcache_invalidate) )
+        ioreq_signal_mapcache_invalidate();
 
     return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 66a37ee..046a8eb 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -64,20 +64,6 @@ void send_timeoffset_req(unsigned long timeoff)
         gprintk(XENLOG_ERR, "Unsuccessful timeoffset update\n");
 }
 
-/* Ask ioemu mapcache to invalidate mappings. */
-void send_invalidate_req(void)
-{
-    ioreq_t p = {
-        .type = IOREQ_TYPE_INVALIDATE,
-        .size = 4,
-        .dir = IOREQ_WRITE,
-        .data = ~0UL, /* flush all */
-    };
-
-    if ( ioreq_broadcast(&p, false) != 0 )
-        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
-}
-
 bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 {
     struct hvm_emulate_ctxt ctxt;
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 59f4990..050891f 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -35,6 +35,20 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+/* Ask ioemu mapcache to invalidate mappings. */
+void ioreq_signal_mapcache_invalidate(void)
+{
+    ioreq_t p = {
+        .type = IOREQ_TYPE_INVALIDATE,
+        .size = 4,
+        .dir = IOREQ_WRITE,
+        .data = ~0UL, /* flush all */
+    };
+
+    if ( ioreq_broadcast(&p, false) != 0 )
+        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct ioreq_server *s)
 {
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index b8be1ad..cf959f6 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -122,7 +122,6 @@ struct hvm_domain {
 
     struct viridian_domain *viridian;
 
-    bool_t                 qemu_mapcache_invalidate;
     bool_t                 is_s3_suspended;
 
     /*
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index fb64294..3da0136 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -97,7 +97,6 @@ bool relocate_portio_handler(
     unsigned int size);
 
 void send_timeoffset_req(unsigned long timeoff);
-void send_invalidate_req(void);
 bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index f0908af..dc47ec7 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -101,6 +101,7 @@ struct ioreq_server *ioreq_server_select(struct domain *d,
 int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
                bool buffered);
 unsigned int ioreq_broadcast(ioreq_t *p, bool buffered);
+void ioreq_signal_mapcache_invalidate(void);
 
 void ioreq_domain_init(struct domain *d);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 7aea2bb..5139b44 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -444,6 +444,11 @@ struct domain
      * unpaused for the first time by the systemcontroller.
      */
     bool             creation_finished;
+    /*
+     * Indicates that mapcache invalidation request should be sent to
+     * the device emulator.
+     */
+    bool             mapcache_invalidate;
 
     /* Which guest this guest has privileges on */
     struct domain   *target;
-- 
2.7.4


