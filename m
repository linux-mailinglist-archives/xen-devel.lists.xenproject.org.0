Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3E28F73F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7623.20192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VR-0007ru-Ge; Thu, 15 Oct 2020 16:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7623.20192; Thu, 15 Oct 2020 16:53:32 +0000
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
	id 1kT6VP-0007jv-SJ; Thu, 15 Oct 2020 16:53:31 +0000
Received: by outflank-mailman (input) for mailman id 7623;
 Thu, 15 Oct 2020 16:53:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6Om-0004yr-8H
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:40 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58805a19-f509-4ef7-b1f1-945e5768e9fe;
 Thu, 15 Oct 2020 16:45:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 184so4357721lfd.6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:15 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:13 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6Om-0004yr-8H
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:40 +0000
X-Inumbo-ID: 58805a19-f509-4ef7-b1f1-945e5768e9fe
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 58805a19-f509-4ef7-b1f1-945e5768e9fe;
	Thu, 15 Oct 2020 16:45:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 184so4357721lfd.6
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2XrnkyCm2XtFs8+4UKcvf9+akIJtw9Lb3qRoVqK2C5U=;
        b=Pn9R4BXFpFWBtqgH7N8kD9d9XZroBl6pZJcDRGLAyalJNeKV0GAgAl81CXyg304D3C
         1M9/eAvRA+IriO/UFwvseXxiX8z2lxPhTw+RflHYDjWK2Opf+N/PB4qDR4Tflip+Qz3l
         yEOaGsG4xYNV5vbxEGmZpOt02p46Qo+fekkh92N7rDpIrFhhZmqJZQpUaKp51YKu3Oxm
         Y1UbzJrG4PAyvaVFjIgl2cbnAAjomKXXrk3fBwcM3QJx3GaJRBOoEsbTAK2fzoFqah11
         ltb2dsGo3/fNavYpZYJxZVzGk+ESuNbjRT5OmMFw/LpiVUYSyTOv7ItUdpn7YOZleWPa
         aa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2XrnkyCm2XtFs8+4UKcvf9+akIJtw9Lb3qRoVqK2C5U=;
        b=RYMjrS8BgMTPt3oKsga1U5k9T2E7D54Fnyma9ixEwaMIJpn66rVKDMA1rgkBlHw42o
         qP6vtXaWaYu/y0hzt89gnqihiFnF7GX14J4mfQsUPyFIaRcinCf+rhDj7PjX6dlZeFWG
         c3wrczjDfN6DI8JuC0e5/aINplHV/KksutNjYCSyIUk8vGIl3nKZ+q+CjPUnujSh+agI
         zdSlUtwDN9MjRnaRRTM4feGL+Ui9lmFWQsyxjzYBFtU2a15mu5qrcZaw+G83cqPK5axa
         7u56ELuDJAl1aEs6dUa5UJIOB5SQ4Fnjozm3ObSYYteQCmILq/EQsjMoZZQzBzMuw3lB
         dpfg==
X-Gm-Message-State: AOAM531oTJtQ4o/9vx2aYSYLuOQkrXBXx6XOiWrhab58xsu8TArGvRjB
	CsYBMD4nSQP7fJDuIyDRv2SrnSH4nD1lSA==
X-Google-Smtp-Source: ABdhPJwsQ5M/L3bwdFzhQ3KPuy/TYNQk5lUusJYwKYci7YsHMXQCx16rzuX7lAW/CXtxXZ+WZpjnjw==
X-Received: by 2002:a19:8888:: with SMTP id k130mr1414548lfd.265.1602780314167;
        Thu, 15 Oct 2020 09:45:14 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:13 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
Date: Thu, 15 Oct 2020 19:44:32 +0300
Message-Id: <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to send mapcache invalidation request to qemu/demu everytime
the page gets removed from a guest.

At the moment, the Arm code doesn't explicitely remove the existing
mapping before inserting the new mapping. Instead, this is done
implicitely by __p2m_set_entry().

So the corresponding flag will be set in __p2m_set_entry() if old entry
is a RAM page *and* the new MFN is different. And the invalidation
request will be sent in do_trap_hypercall() later on.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch, some changes were derived from (+ new explanation):
     xen/ioreq: Make x86's invalidate qemu mapcache handling common
   - put setting of the flag into __p2m_set_entry()
   - clarify the conditions when the flag should be set
   - use domain_has_ioreq_server()
   - update do_trap_hypercall() by adding local variable
---
 xen/arch/arm/p2m.c   |  8 ++++++++
 xen/arch/arm/traps.c | 13 ++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 370173c..2693b0c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1,6 +1,7 @@
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
@@ -1067,7 +1068,14 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
      */
     if ( p2m_is_valid(orig_pte) &&
          !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
+    {
+#ifdef CONFIG_IOREQ_SERVER
+        if ( domain_has_ioreq_server(p2m->domain) &&
+             (p2m->domain == current->domain) && p2m_is_ram(orig_pte.p2m.type) )
+            p2m->domain->qemu_mapcache_invalidate = true;
+#endif
         p2m_free_entry(p2m, orig_pte, level);
+    }
 
 out:
     unmap_domain_page(table);
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index a8f5fdf..9eaa342 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1442,6 +1442,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
                               const union hsr hsr)
 {
     arm_hypercall_fn_t call = NULL;
+    struct vcpu *v = current;
 
     BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
 
@@ -1458,7 +1459,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
         return;
     }
 
-    current->hcall_preempted = false;
+    v->hcall_preempted = false;
 
     perfc_incra(hypercalls, *nr);
     call = arm_hypercall_table[*nr].fn;
@@ -1471,7 +1472,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
     HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
 
 #ifndef NDEBUG
-    if ( !current->hcall_preempted )
+    if ( !v->hcall_preempted )
     {
         /* Deliberately corrupt parameter regs used by this hypercall. */
         switch ( arm_hypercall_table[*nr].nr_args ) {
@@ -1488,8 +1489,14 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
 #endif
 
     /* Ensure the hypercall trap instruction is re-executed. */
-    if ( current->hcall_preempted )
+    if ( v->hcall_preempted )
         regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
+
+#ifdef CONFIG_IOREQ_SERVER
+    if ( unlikely(v->domain->qemu_mapcache_invalidate) &&
+         test_and_clear_bool(v->domain->qemu_mapcache_invalidate) )
+        send_invalidate_ioreq();
+#endif
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
-- 
2.7.4


