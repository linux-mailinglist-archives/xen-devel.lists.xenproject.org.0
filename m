Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5228F736
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7614.20094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VE-0007GM-4G; Thu, 15 Oct 2020 16:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7614.20094; Thu, 15 Oct 2020 16:53:19 +0000
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
	id 1kT6VD-0007EW-Ob; Thu, 15 Oct 2020 16:53:19 +0000
Received: by outflank-mailman (input) for mailman id 7614;
 Thu, 15 Oct 2020 16:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6Oh-0004yr-7y
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:35 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aec3c3f-05a3-4c14-a864-c5f2f4906ad1;
 Thu, 15 Oct 2020 16:45:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l28so4334194lfp.10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:14 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:12 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6Oh-0004yr-7y
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:35 +0000
X-Inumbo-ID: 3aec3c3f-05a3-4c14-a864-c5f2f4906ad1
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3aec3c3f-05a3-4c14-a864-c5f2f4906ad1;
	Thu, 15 Oct 2020 16:45:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l28so4334194lfp.10
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BOyu/SSFPhkGm8O1hW7HvONLcLZpvripmtFylb3J5Vs=;
        b=BhO2bvJcrw8cmXzgh8FAEJGWMR7kX2kyYNercuZdW3SkczOyhcnUcr4vLXos0iC3ka
         nL0Tz86eumq55mJCrTHl8so/ZvOogPPOHyrFOHN0AkmEkwN6rPj0i01N0Dwx9R+U4zDX
         JF4YZoUwKi6O2V9Kjg4It9tknTxvWmERZYCIHTk6yv1twKRY8omy8rMbGqGym9+bDZ9T
         p5RFYIUcQZuPV9IEQXk4F3NgPAA9JC4MfXfSPsXUGNbBBiG7zPVZZwPbpqkqh7Yf92tO
         vnJlIDsEFIlJ+jybi++uhaF3EQwNKNdbm4d6n6c7fYQs3b7w8faFRtJblZJEbSprEwhw
         hwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BOyu/SSFPhkGm8O1hW7HvONLcLZpvripmtFylb3J5Vs=;
        b=VGm98orza2/3sOx/GS9ROYyyHM6ndnseoxZcL/S8MxGaxwmbRQ3RR1YcMJWiBM+UwA
         ji00UXEWKoBEIcO5APjCJj03gXVmWhdtN8CEnXa4eYPD7WHUn45iNIKqwqBLNLJq6YBg
         eXLUIjXCAU0W3T4zAQi0XRsbAwH832S1jlZEniSFKLzf6t4I8/57l15fc3XbGcF409MM
         9S+MBweyU0OMeQjSSKP5RlPDeKVvSaVMVnJtBRAj7IVsvVJmr3wD1E+Cn/FVZ2/WJQam
         WeP41XiDKbhI833Jny6jLJg6IgG/qDc3diM5BFQpACY+p925tlU8nICQCEQGLTjTlKDq
         WqFA==
X-Gm-Message-State: AOAM530A5L3uK3C07skdDOPykOaKtzjBwo6QvVwRx5kOntkiVdjU48GQ
	VvDFPT2qwvCDmYqDxPo0i/2y3Tv+dQqcLA==
X-Google-Smtp-Source: ABdhPJyV7f83GC/ZdOMR1ad9pWY1O8LMTxCKcMAKIhVnQUqNl0rqnxcFvevOv7/DxFCafpHRoGleAQ==
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr1550077lfg.473.1602780313306;
        Thu, 15 Oct 2020 09:45:13 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:12 -0700 (PDT)
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
Subject: [PATCH V2 20/23] xen/ioreq: Make x86's send_invalidate_req() common
Date: Thu, 15 Oct 2020 19:44:31 +0300
Message-Id: <1602780274-29141-21-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As the IOREQ is a common feature now and we also need to
invalidate qemu/demu mapcache on Arm when the required condition
occurs this patch moves this function to the common code
(and remames it to send_invalidate_ioreq).
This patch also moves per-domain qemu_mapcache_invalidate
variable out of the arch sub-struct.

The subsequent patch will add mapcache invalidation handling on Arm.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

***
Please note, this patch depends on the following which is
on review:
https://patchwork.kernel.org/patch/11803383/
***

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
index b6ccaf4..324ff97 100644
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
+        curr->domain->qemu_mapcache_invalidate = true;
 
     return rc;
 }
@@ -329,9 +330,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
     if ( curr->hcall_preempted )
         return HVM_HCALL_preempted;
 
-    if ( unlikely(currd->arch.hvm.qemu_mapcache_invalidate) &&
-         test_and_clear_bool(currd->arch.hvm.qemu_mapcache_invalidate) )
-        send_invalidate_req();
+    if ( unlikely(currd->qemu_mapcache_invalidate) &&
+         test_and_clear_bool(currd->qemu_mapcache_invalidate) )
+        send_invalidate_ioreq();
 
     return HVM_HCALL_completed;
 }
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 2d03ffe..e51304c 100644
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
-    if ( broadcast_ioreq(&p, false) != 0 )
-        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
-}
-
 bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 {
     struct hvm_emulate_ctxt ctxt;
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index a72bc0e..2203cf0 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -35,6 +35,20 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+/* Ask ioemu mapcache to invalidate mappings. */
+void send_invalidate_ioreq(void)
+{
+    ioreq_t p = {
+        .type = IOREQ_TYPE_INVALIDATE,
+        .size = 4,
+        .dir = IOREQ_WRITE,
+        .data = ~0UL, /* flush all */
+    };
+
+    if ( broadcast_ioreq(&p, false) != 0 )
+        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct ioreq_server *s)
 {
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index c3af339..caab3a9 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -117,7 +117,6 @@ struct hvm_domain {
 
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
index 0679fef..aad682f 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -126,6 +126,7 @@ struct ioreq_server *select_ioreq_server(struct domain *d,
 int send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
                bool buffered);
 unsigned int broadcast_ioreq(ioreq_t *p, bool buffered);
+void send_invalidate_ioreq(void);
 
 void ioreq_init(struct domain *d);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 290cddb..1b8c6eb 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -555,6 +555,8 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
         unsigned int            nr_servers;
     } ioreq_server;
+
+    bool qemu_mapcache_invalidate;
 #endif
 };
 
-- 
2.7.4


