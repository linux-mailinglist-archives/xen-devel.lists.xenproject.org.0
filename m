Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347F2C8261
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40897.73923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdS-00036T-Rv; Mon, 30 Nov 2020 10:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40897.73923; Mon, 30 Nov 2020 10:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdS-00035r-M1; Mon, 30 Nov 2020 10:42:22 +0000
Received: by outflank-mailman (input) for mailman id 40897;
 Mon, 30 Nov 2020 10:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgV2-0000Uu-EZ
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:40 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34b8d9a9-44f7-4625-b302-f3659906a420;
 Mon, 30 Nov 2020 10:32:21 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so20589388lfc.4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:20 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:18 -0800 (PST)
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
X-Inumbo-ID: 34b8d9a9-44f7-4625-b302-f3659906a420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/NCbRJRG/y1peWdb5VV9fW9K7yzgcZXIhEHGv+DYhcI=;
        b=nkoAAdWqP3QV7ERu4DO5sk6igvlfj4tBavrIeM93acV99mrK4SLzELno8x3hBXV1Sr
         Suy9tD0w+m0eWVjgBvSTitriGBy7qnfofhNMRqnZZq50qFwh9LqhRUR8U88MCHSZNLEp
         UWr/ZQq1pykUXpB6Xe3CXlCDieGVT2a1hsNV5lDKZ+U1oXD91Dk+rET7PoxnPDRGINiC
         QNrTH8LnM2RmWMa1EQ/aX0n2FqWQc/LqolKbHjKckPg4djAI3U7XXgwxLaVL/oHYLO3e
         TExfSmMogquumcB3JPW/kfwS76E2pNJ9DjGYXaE2IMQaNqSp4uLo3/oauHlwJ+WTtblK
         wEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/NCbRJRG/y1peWdb5VV9fW9K7yzgcZXIhEHGv+DYhcI=;
        b=QhJzw9niQehij3h33hBwwXgXW/5Lr3ymRPyUeFsB6rBxoS79P3y/Dtt0yZ6aa48Dxz
         T1HcpDh7d7fE3mpUF2kZGokEU1SgE6H3Qhqw/Dt2Flqp8a9BuGDU7vEK9HcwWwVcGYLq
         sQjuY0yKN7jWa+GIvvXJAzVcVMJ6KA2hYqgsLlGIObDLlQm7SfHaHXcGgtMVVPhRQYC+
         thuubdhTSFhn4qSrS1zwT2s6Wd9uGmpLHE79vhAh4Bb9EzY3hq1ChzyAkT6qtAg0RqHa
         aeJIYG8xgNBo1AvvnkI75bbkn3asWb+jshES35L3LALzC5vLrQvwz89CyG1kjX7p8ygS
         Bjeg==
X-Gm-Message-State: AOAM530nLRXxVymzSUXuRSN/cDwUcdisbkatpA7n4HhjAo2IgpGqX1jW
	WWQaa62Lgrqj/aGGdggRpLb+bOjWX/DrdA==
X-Google-Smtp-Source: ABdhPJysgf1BIsSrpTJNnyHZsuIO26DFzpRK0mmqVYcYFuGaiKZTOWSYioDBKAmiE0iyDYk1oQcwag==
X-Received: by 2002:a05:6512:3e6:: with SMTP id n6mr9015506lfq.413.1606732339424;
        Mon, 30 Nov 2020 02:32:19 -0800 (PST)
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
Subject: [PATCH V3 20/23] xen/ioreq: Make x86's send_invalidate_req() common
Date: Mon, 30 Nov 2020 12:31:35 +0200
Message-Id: <1606732298-22107-21-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As the IOREQ is a common feature now and we also need to
invalidate qemu/demu mapcache on Arm when the required condition
occurs this patch moves this function to the common code
(and remames it to ioreq_signal_mapcache_invalidate).
This patch also moves per-domain qemu_mapcache_invalidate
variable out of the arch sub-struct (and drops "qemu" prefix).

The subsequent patch will add mapcache invalidation handling on Arm.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

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
---
---
 xen/arch/x86/hvm/hypercall.c     |  9 +++++----
 xen/arch/x86/hvm/io.c            | 14 --------------
 xen/common/ioreq.c               | 14 ++++++++++++++
 xen/include/asm-x86/hvm/domain.h |  1 -
 xen/include/asm-x86/hvm/io.h     |  1 -
 xen/include/xen/ioreq.h          |  1 +
 xen/include/xen/sched.h          |  2 ++
 7 files changed, 22 insertions(+), 20 deletions(-)

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
index a0dd8d1..ba77414 100644
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
index f35dcf9..61ba761 100644
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
index 2289e79..482f76f 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -129,6 +129,7 @@ struct ioreq_server *ioreq_server_select(struct domain *d,
 int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
                bool buffered);
 unsigned int ioreq_broadcast(ioreq_t *p, bool buffered);
+void ioreq_signal_mapcache_invalidate(void);
 
 void ioreq_domain_init(struct domain *d);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 2277995..60bf254 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -552,6 +552,8 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
         unsigned int            nr_servers;
     } ioreq_server;
+
+    bool mapcache_invalidate;
 #endif
 };
 
-- 
2.7.4


