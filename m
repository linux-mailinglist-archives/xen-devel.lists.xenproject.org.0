Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18252650B8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9I-0005Hw-Ia; Thu, 10 Sep 2020 20:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6S-0004JK-UE
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:32 +0000
X-Inumbo-ID: 82ff4e5a-294d-4afc-9b16-30ee735275fa
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82ff4e5a-294d-4afc-9b16-30ee735275fa;
 Thu, 10 Sep 2020 20:22:47 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u21so9882751ljl.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J2dfVVSK6L2DPERLhcMwioW/97FP+DCrobN0HJFQMKI=;
 b=MlpZt1CAdaTxZTnsDSZXUyuGYNhfMc0hJRwOwM+CO1QZdO44ow6KUheZehGwwlxQ3L
 TjKXM910G4vD0G+eo6DiDtDCg+As5U72BifOXyNGAcwNgyHAM5Lh57Kc/VraIBzQ8SVC
 oStwaIKMU3KQEHuqQ8Cwe2mS6+/EkhyLx1UJHD+G0dQdAPiZQCImwYB0Zb85DDCJwzpw
 KgOK62qckAzdc47IVf9Y4zMQ7fGzpOojePeE76HXHbdCAUWG8x/xm1tq+I4CNlsONPUG
 7Eg/PM75sCTRyv78au8dPvgGVKlQMbKB2JTDNTUGgQoVij8o2EMYQMZAozIuFCRgOtWQ
 681g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J2dfVVSK6L2DPERLhcMwioW/97FP+DCrobN0HJFQMKI=;
 b=aPirv+cfnggnYN0DWi0tZX0zhftY0ZMp9jz+kC9jNGbekpIk2yPuS86n3Trwpj+Obw
 qm9ehxgao5o9OwyISMdPbsBjz3NfapOwd9oh37Oa0K8B5Q69RAYp8yOc425qncz6mYOR
 On40AHm0Wn1uwgcl9wSHTvF+RVMH00jBQCF35tR1HquTGhEQipUYYA5hZJft0b48nSqw
 iv5l43ou0K93pzZNB7coR+phlC77hfEc6q6/4GGiCKDdBGnOcBirvVpCaCuqcWD9NIsW
 YKzYsrJLAN4O6uQPsUrTYJxW3PXk0NxbbzR/D2apBec2hVakX+L1PHWsW7HsAzSB0Nd8
 l7Rw==
X-Gm-Message-State: AOAM530XTNQB023U0GHoGoTM4wEqku/7nX5iqjm/+YMbVeBYdW11Gmrr
 qZPRMR3tFSnlBcvXd6IDQxUOENC/W9IPDA==
X-Google-Smtp-Source: ABdhPJyo/L4X1QcGsobDbkVBc4LBWeVR9hAwEC6S1MM00p1pHMYcwGkABO7bedyF03Xjwu8oyKeYGw==
X-Received: by 2002:a05:651c:28b:: with SMTP id
 b11mr5392197ljo.228.1599769365496; 
 Thu, 10 Sep 2020 13:22:45 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:44 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
Date: Thu, 10 Sep 2020 23:22:07 +0300
Message-Id: <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As the IOREQ is a common feature now and we also need to
invalidate qemu mapcache on XENMEM_decrease_reservation on Arm
this patch moves this handling to the common code and move per-domain
qemu_mapcache_invalidate variable out of the arch sub-struct.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - move send_invalidate_req() to the common code
   - update patch subject/description
   - move qemu_mapcache_invalidate out of the arch sub-struct,
     update checks
   - remove #if defined(CONFIG_ARM64) from the common code
---
---
 xen/arch/arm/traps.c             |  6 ++++++
 xen/arch/x86/hvm/hypercall.c     |  9 ++++-----
 xen/arch/x86/hvm/io.c            | 14 --------------
 xen/common/ioreq.c               | 14 ++++++++++++++
 xen/common/memory.c              |  5 +++++
 xen/include/asm-x86/hvm/domain.h |  1 -
 xen/include/asm-x86/hvm/io.h     |  1 -
 xen/include/xen/ioreq.h          |  2 ++
 xen/include/xen/sched.h          |  2 ++
 9 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 6b37ae1..de48b2f 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1490,6 +1490,12 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
     /* Ensure the hypercall trap instruction is re-executed. */
     if ( current->hcall_preempted )
         regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
+
+#ifdef CONFIG_IOREQ_SERVER
+    if ( unlikely(current->domain->qemu_mapcache_invalidate) &&
+         test_and_clear_bool(current->domain->qemu_mapcache_invalidate) )
+        send_invalidate_req();
+#endif
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index b6ccaf4..45fc20b 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -18,8 +18,10 @@
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
+
 #include <xen/lib.h>
 #include <xen/hypercall.h>
+#include <xen/ioreq.h>
 #include <xen/nospec.h>
 
 #include <asm/hvm/emulate.h>
@@ -46,9 +48,6 @@ static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     else
         rc = compat_memory_op(cmd, arg);
 
-    if ( (cmd & MEMOP_CMD_MASK) == XENMEM_decrease_reservation )
-        curr->domain->arch.hvm.qemu_mapcache_invalidate = true;
-
     return rc;
 }
 
@@ -329,8 +328,8 @@ int hvm_hypercall(struct cpu_user_regs *regs)
     if ( curr->hcall_preempted )
         return HVM_HCALL_preempted;
 
-    if ( unlikely(currd->arch.hvm.qemu_mapcache_invalidate) &&
-         test_and_clear_bool(currd->arch.hvm.qemu_mapcache_invalidate) )
+    if ( unlikely(currd->qemu_mapcache_invalidate) &&
+         test_and_clear_bool(currd->qemu_mapcache_invalidate) )
         send_invalidate_req();
 
     return HVM_HCALL_completed;
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 14f8c89..e659a53 100644
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
-    if ( hvm_broadcast_ioreq(&p, false) != 0 )
-        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
-}
-
 bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 {
     struct hvm_emulate_ctxt ctxt;
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4c3a835..e24a481 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -34,6 +34,20 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+/* Ask ioemu mapcache to invalidate mappings. */
+void send_invalidate_req(void)
+{
+    ioreq_t p = {
+        .type = IOREQ_TYPE_INVALIDATE,
+        .size = 4,
+        .dir = IOREQ_WRITE,
+        .data = ~0UL, /* flush all */
+    };
+
+    if ( hvm_broadcast_ioreq(&p, false) != 0 )
+        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct hvm_ioreq_server *s)
 {
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 78781f1..9d98252 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+#ifdef CONFIG_IOREQ_SERVER
+    if ( op == XENMEM_decrease_reservation )
+        curr_d->qemu_mapcache_invalidate = true;
+#endif
+
     return rc;
 }
 
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 79e0afb..11d5cc1 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -131,7 +131,6 @@ struct hvm_domain {
 
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
index 25ce4c2..5ade9b0 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -97,6 +97,8 @@ static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
            (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
 }
 
+void send_invalidate_req(void);
+
 bool hvm_io_pending(struct vcpu *v);
 bool handle_hvm_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519..4c52a04 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -512,6 +512,8 @@ struct domain
     /* Argo interdomain communication support */
     struct argo_domain *argo;
 #endif
+
+    bool_t qemu_mapcache_invalidate;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.7.4


